#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
import subprocess

from io import BytesIO
from pathlib import Path
from functools import partial
from joblib import Parallel, delayed
from libs.util import paths, logger, envs

eboot_base = 0x08803fac
reloc_base = 0x8804000

out_dir = paths['out']
orig_dir = paths['orig']
ext_dir = paths['extracted']
disable_parallel = envs.get('NO_PARALLEL')

@logger.catch
def convert_wav(out_dir, bitrate, fname, suffix='.wav'):
    logger.info(f'converting {fname}')
    out_name = out_dir / fname.name
    out_name = out_name.with_suffix(suffix)

    try:
        if out_name.stat().st_mtime > fname.stat().st_mtime:
            logger.info('raw file is older, skipping...')
            return
    except FileNotFoundError:
        pass

    try:
        subprocess.check_output(["PSP_at3tool", '-e', '-br', str(bitrate), fname, out_name], stderr=subprocess.STDOUT, text=True)
    except (subprocess.CalledProcessError, OSError) as e:
        logger.error(f"Couldn't convert {fname}")
        match e:
            case subprocess.CalledProcessError():
                logger.error(f'cmd: {e.cmd}')
                logger.error(f'output: {e.output}')
                logger.error(f'returncode: {e.returncode}')
            case _:
                logger.error(f'Exception: {e}')

def convert_sv():
    fname = 'sv'
    raw_dir = out_dir / 'sv/raw'
    dest_dir = out_dir / 'sv'
    _convert = partial(convert_wav, dest_dir, 48)
    files = raw_dir.glob(f'{fname}_????.wav')

    if not disable_parallel:
        Parallel(n_jobs=-1)(delayed(_convert)(fname) for fname in files)
    else:
        [_convert(fname) for fname in files]

def convert_btl_voice():
    raw_dir = out_dir / 'btl_voice/raw'
    dest_dir = out_dir / 'btl_voice'
    _convert = partial(convert_wav, dest_dir, 64)
    files = raw_dir.glob('*.wav')

    if not disable_parallel:
        Parallel(n_jobs=-1)(delayed(_convert)(fname) for fname in files)
    else:
        [_convert(fname) for fname in files]

def reinsert_sv():
    fname = 'sv'
    orig_path = orig_dir / 'PSP_GAME/USRDIR/game/sv.pak'
    dir_name = ext_dir / 'sv'
    new_dir = out_dir / 'sv'

    buf = Path(orig_path).read_bytes()
    count = struct.unpack_from('<I', buf)[0]
    chunks = []
    logger.debug(f'{count} chunks')

    data = BytesIO()
    data.write(b'\x00' * (4 + (8 * count)))

    for chunk in sorted(dir_name.glob(f'{fname}_????.wav')):
        logger.debug(f'{chunk}')
        if padding := data.tell() % 0x800:
            data.write(b'\x00' * (0x800 - padding))

        new_chunk = new_dir / chunk.name

        if new_chunk.exists():
            logger.debug(f'new chunk exists: {new_chunk}')
            chunk = new_chunk

        temp = chunk.read_bytes()
        offs = data.tell()
        size = len(temp)

        if padding := size % 4:
            padding = 4 - padding
            temp += b'\x00' * padding
            size += padding

        data.write(temp)

        chunks += [(offs, size)]

    chunks = [struct.pack('<2I', offs, size) for offs, size in chunks]
    header = struct.pack('<I', count)
    header += b''.join(chunks)

    assert len(header) == (4 + (8 * count))

    data.seek(0)
    data.write(header)

    if padding := data.tell() % 0x800:
        data.write(b'\x00' * (0x800 - padding))

    out_name = out_dir / f'{fname}.pak'
    out_name.write_bytes(data.getvalue())

def reinsert_btl_voice():
    fname = 'btl_voice'
    orig_path = orig_dir / 'PSP_GAME/USRDIR/btl/btl_voice.pak'
    dir_name = ext_dir / 'btl_voice'
    new_dir = out_dir / 'btl_voice'

    buf = Path(orig_path).read_bytes()
    count = struct.unpack_from('<I', buf)[0]
    logger.debug(f'{count} chunks')

    data = BytesIO()
    data.write(b'\x00' * (4 + (12 * count)))

    ids = struct.unpack_from(f'<{count}I', buf, 4)
    sizes = list(struct.unpack_from(f'<{count}I', buf, 4 + (4 * count)))
    offsets = list(struct.unpack_from(f'<{count}I', buf, 4 + (8 * count)))
    base_addr = 4 + (12 * count)

    for i in range(count):
        chunk_name = f'btl_voice_{i:03d}.wav'
        chunk = dir_name / chunk_name
        new_chunk = new_dir / chunk_name

        if new_chunk.exists():
            logger.debug(f'new chunk exists: {new_chunk}')
            chunk = new_chunk

        temp = chunk.read_bytes()
        offs = data.tell() - base_addr
        size = len(temp)

        if padding := size % 4:
            padding = 4 - padding
            temp += b'\x00' * padding
            size += padding

        data.write(temp)
        sizes[i] = size
        offsets[i] = offs

    header = struct.pack('<I', count)
    header += b''.join([struct.pack('<I', x) for x in ids])
    header += b''.join([struct.pack('<I', x) for x in sizes])
    header += b''.join([struct.pack('<I', x) for x in offsets])

    assert len(header) == (4 + (12 * count))

    data.seek(0)
    data.write(header)

    out_name = out_dir / f'{fname}.pak'
    out_name.write_bytes(data.getvalue())

def reinsert_btl_voice_eboot():
    start_offs = 0x8a63bb4
    end_offs = 0x8c26b7c

    offs_tbl = 0x8c26b7c
    size_tbl = 0x8c26e0c
    max_size = end_offs - start_offs
    count = 0xa4

    dir_name = ext_dir / 'btl_voice_eboot'
    new_dir = out_dir / 'btl_voice'

    data = BytesIO()

    sizes = []
    offsets = []
    base_addr = start_offs

    for i in range(count):
        chunk_name = f'top_{i:03d}.wav'
        chunk = dir_name / chunk_name
        new_chunk = new_dir / chunk_name

        if new_chunk.exists():
            logger.debug(f'new chunk exists: {new_chunk}')
            chunk = new_chunk

        temp = chunk.read_bytes()
        offs = data.tell()
        size = len(temp)

        if padding := size % 4:
            padding = 4 - padding
            temp += b'\x00' * padding
            size += padding

        data.write(temp)
        sizes += [size]
        offsets += [base_addr + offs - reloc_base]

    if (data.tell() > max_size):
        logger.error(f'eboot battle voices overflow by {data.tell()-max_size} bytes')
        return

    out_name = out_dir / 'EBOOT.BIN'

    with open(out_name, 'r+b') as out:
        # write data
        out.seek(start_offs - eboot_base)
        out.write(data.getvalue())
        # write offsets
        out.seek(offs_tbl - eboot_base)
        out.write(b''.join(struct.pack('<I', x) for x in offsets))
        # write sizes
        out.seek(size_tbl - eboot_base)
        out.write(b''.join(struct.pack('<I', x) for x in sizes))

def convert_talk():
    raw_dir = out_dir / 'talk/raw'
    dest_dir = out_dir / 'talk'
    _convert = partial(convert_wav, dest_dir, 48, 'at3')
    files = raw_dir.glob('*.wav')

    if not disable_parallel:
        Parallel(n_jobs=-1)(delayed(_convert)(fname) for fname in files)
    else:
        [_convert(fname) for fname in files]

if __name__ == '__main__':
    convert_sv()
    reinsert_sv()
    convert_btl_voice()
    # btl_voice.pak seems to be unused in ToPX, it uses the embedded one instead
    # reinsert_btl_voice()
    reinsert_btl_voice_eboot()
    convert_talk()
