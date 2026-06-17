#!/usr/bin/env python

import re
import struct

from io import BytesIO
from pathlib import Path
from enum import Enum
from dataclasses import dataclass
from joblib import Parallel, delayed
from libs.util import compress, paths, logger, envs
from libs.extract import extract_type2

ext_dir = paths['extracted']
orig_dir = ext_dir / 'map_d'
out_dir = paths['out']
eboot_base = 0x08803FAC
disable_parallel = envs.get('NO_PARALLEL')

class BlockType(Enum):
    TYPE1 = 1
    TYPE2 = 2
    TYPE3 = 3
    NMAP_MAIN = 4

@dataclass
class Block:
    stem: str
    block_type: BlockType
    extension: str = ''
    directory: str = ''

def rebuild_type1(fname, buf, dir_name=None, extension='.d'):
    logger.debug('type1')
    count = struct.unpack_from('<I', buf)[0]
    chunks = []
    logger.debug(f'{count} chunks')
    dir_name = Path(dir_name) or orig_dir

    data = BytesIO()
    data.write(b'\x00' * (4 + (8 * count)))

    for chunk in sorted(dir_name.glob(f'{fname}_??.bin')):
        logger.debug(f'{chunk}')
        if padding := data.tell() % 4:
            data.write(b'\x00' * (4 - padding))

        new_chunk = out_dir / chunk.name

        if new_chunk.exists():
            logger.debug(f'new chunk exists: {new_chunk}')

            if chunk.with_suffix('.decomp').exists():
                compress(new_chunk)
                chunk = new_chunk.with_suffix('.comp')
            else:
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

    out_name = out_dir / f'{fname}{extension}'
    out_name.write_bytes(data.getvalue())

def rebuild_map(fname, buf, dest_dir=out_dir):
    count = struct.unpack_from('<I', buf)[0]
    chunks = extract_type2(buf, count)
    data = BytesIO()

    logger.debug(f'{count} chunks')
    logger.debug(f'{fname=}')

    for chunk in sorted(orig_dir.glob(f'{fname}_??.bin')):
        logger.debug(f'reading {chunk}')

        new_chunk = dest_dir / chunk.name

        if new_chunk.exists():
            logger.debug(f'new chunk exists: {new_chunk}')
            compress(new_chunk)
            chunk = new_chunk.with_suffix('.comp')

        temp = chunk.read_bytes()
        block_num = int(chunk.stem.split('_')[-1])
        chunks[block_num][1] = data.tell()
        data.write(temp)

    chunks = [struct.pack('<2I', block_id, offs) for block_id, offs in chunks]
    header = struct.pack('<I', count)
    header += b''.join(chunks)

    assert len(header) == (4 + (8 * count))

    out_name = dest_dir / f'{fname}.d'
    buf = data.getvalue()
    total_len = len(buf) + len(header)

    if total_len >= 0x35000:
        logger.error(f'{fname} is too large by {total_len - 0x35000} bytes')

    out_name.write_bytes(header + buf)

def rebuild_type3(fname, buf, dir_name=None):
    logger.debug('type3')
    count = struct.unpack_from('<I', buf)[0] // 4
    chunks = []
    logger.debug(f'{count} chunks')
    dir_name = Path(dir_name) or orig_dir

    data = BytesIO()
    data.write(b'\x00' * (4 * count))

    for chunk in sorted(dir_name.glob(f'{fname}_??.bin')):
        logger.debug(f'{chunk}')
        if padding := data.tell() % 4:
            data.write(b'\x00' * (4 - padding))

        new_chunk = out_dir / chunk.name

        if new_chunk.exists():
            logger.debug(f'new chunk exists: {new_chunk}')

            if chunk.with_suffix('.decomp').exists():
                compress(new_chunk)
                chunk = new_chunk.with_suffix('.comp')

        temp = chunk.read_bytes()
        offs = data.tell()
        size = len(temp)

        if padding := size % 4:
            padding = 4 - padding
            temp += b'\x00' * padding
            size += padding

        data.write(temp)

        chunks += [offs]

    chunks = [struct.pack('<I', offs) for offs in chunks]
    header = b''.join(chunks)

    assert len(header) == (4 * count)

    data.seek(0)
    data.write(header)

    out_name = out_dir / f'{fname}.d'
    out_name.write_bytes(data.getvalue())

def rebuild_nmap_main(fname, buf, dir_name=None):
    logger.debug('nmap main')
    count = struct.unpack_from('<I', buf)[0]
    chunks = []
    logger.debug(f'{count} chunks')
    dir_name = Path(dir_name) or orig_dir

    data = BytesIO()
    data.write(b'\x00' * (4 + (8 * count)))

    for chunk in sorted(dir_name.glob(f'{fname}_??.bin')):
        logger.debug(f'{chunk}')
        if padding := data.tell() % 4:
            data.write(b'\x00' * (4 - padding))

        new_chunk = out_dir / chunk.name

        if new_chunk.exists():
            logger.debug(f'new chunk exists: {new_chunk}')

            if chunk.with_suffix('.decomp').exists():
                compress(new_chunk)
                chunk = new_chunk.with_suffix('.comp')

        temp = chunk.read_bytes()
        offs = data.tell()
        size = len(temp)

        if padding := size % 4:
            padding = 4 - padding
            temp += b'\x00' * padding
            size += padding

        data.write(temp)

        chunks += [(offs, size)]

    chunks = [struct.pack('<2I', offs, 0) for offs, size in chunks]
    header = struct.pack('<I', count)
    header += b''.join(chunks)

    assert len(header) == (4 + (8 * count))

    data.seek(0)
    data.write(header)

    out_name = out_dir / f'{fname}.bin'
    out_name.write_bytes(data.getvalue())

def rebuild_monsters(fname, buf, dir_name=None):
    logger.debug('monsters')
    count = struct.unpack_from('<I', buf)[0] // 4
    chunks = []
    logger.debug(f'{count} chunks')
    dir_name = Path(dir_name) or 'monsters'

    data = BytesIO()
    data.write(b'\x00' * (4 * count))

    for chunk in sorted(dir_name.glob(f'{fname.stem}_??.d')):
        logger.debug(f'{chunk}')
        if padding := data.tell() % 4:
            data.write(b'\x00' * (4 - padding))

        new_chunk = out_dir / f'btl/{chunk.name}'

        if new_chunk.exists():
            logger.debug(f'new chunk exists: {new_chunk}')

            if chunk.with_suffix('.decomp').exists():
                compress(new_chunk)
                chunk = new_chunk.with_suffix('.comp')

        temp = chunk.read_bytes()
        offs = data.tell()
        size = len(temp)
        logger.debug(f'{size=:X}')

        if padding := size % 4:
            padding = 4 - padding
            temp += b'\x00' * padding
            size += padding

        data.write(temp)

        chunks += [offs]

    chunks = [struct.pack('<I', offs) for offs in chunks]
    header = b''.join(chunks)

    assert len(header) == (4 * count)

    data.seek(0)
    data.write(header)

    btl_out_dir = out_dir / 'btl'
    btl_out_dir.mkdir(exist_ok=True)

    out_name = btl_out_dir / f'{fname.stem}.d'
    out_name.write_bytes(data.getvalue())

def reinsert_maps():
    map_dir = out_dir / 'map_d'
    files = [re.sub(r'_\d+$', '', x.stem) for x in map_dir.glob('*_??.bin')]
    files = [x for x in sorted(list(set(files)))]

    def _reinsert(fname):
        logger.info(f'Reinserting {fname}...')

        orig = orig_dir / f'{fname}.d'
        buf = orig.read_bytes()
        rebuild_map(fname, buf, map_dir)

    if not disable_parallel:
        Parallel(n_jobs=-1)(delayed(_reinsert)(fname) for fname in files)
    else:
        [_reinsert(fname) for fname in files]

def reinsert_blocks():
    files = [
        Block('sys', BlockType.TYPE1),
        Block('ttl_dat', BlockType.TYPE1),
        Block('nmap_main', BlockType.NMAP_MAIN, extension='.bin'),
        Block('e', BlockType.TYPE3),
        Block('op_tim0', BlockType.TYPE1, extension='.acf'),
        Block('logos', BlockType.TYPE1, extension='.acf'),
    ]

    for block in files:
        extension = block.extension or '.d'
        orig = Path(ext_dir, f'{block.stem}{extension}')
        dir_name = block.directory or ext_dir / f'{block.stem}'
        logger.info(f'Reinserting {orig}...')
        buf = orig.read_bytes()

        match block.block_type:
            case BlockType.TYPE1:
                rebuild_type1(block.stem, buf, dir_name, extension=extension)
            case BlockType.TYPE3:
                rebuild_type3(block.stem, buf, dir_name)
            case BlockType.NMAP_MAIN:
                rebuild_nmap_main(block.stem, buf, dir_name)

def reinsert_monsters():
    mon_dir = ext_dir / 'monsters'
    files = mon_dir.glob('t???.d')

    for fname in sorted(files):
        logger.info(f'Reinserting {fname}...')

        buf = fname.read_bytes()
        rebuild_monsters(fname, buf, mon_dir)

def reinsert_eboot():
    blocks = [
        ('nmap_main', 0x46785c, 84152),
    ]

    with open(out_dir / 'EBOOT.BIN', 'r+b') as out:
        for fname, offset, max_size in blocks:
            out_buf = Path(out_dir, f'{fname}.bin').read_bytes()

            overflow = len(out_buf) - max_size

            if overflow > 0:
                logger.error(f'{fname} is too big by {overflow} bytes')
                return

            out.seek(offset)
            out.write(out_buf)

def reinsert_wmap():
    files = ['wo_tim', 'wo_tim2', 'grade']

    for fname in files:
        logger.info(f'Reinserting {fname}...')

        orig = ext_dir / f'{fname}.acf'
        dir_name = ext_dir / fname
        buf = orig.read_bytes()
        rebuild_type1(fname, buf, dir_name=dir_name, extension='.acf')

    blocks = [
        ('wo_tim', 0x45A634, 13274),
        ('wo_tim2', 0x45DA10, 14110),
    ]

    with open(out_dir / 'EBOOT.BIN', 'r+b') as out:
        for fname, offset, max_size in blocks:
            out_buf = Path(out_dir, f'{fname}.acf').read_bytes()

            overflow = len(out_buf) - max_size

            if overflow > 0:
                logger.error(f'{fname} is too big by {overflow} bytes')
                return

            out.seek(offset)
            out.write(out_buf)

def reinsert_smdat():
    fname = 'smdat'
    logger.info(f'Reinserting {fname}...')

    orig = ext_dir / f'{fname}.decomp'
    dir_name = ext_dir / fname
    buf = orig.read_bytes()
    rebuild_type1(fname, buf, dir_name, '.bin')
    out_name = Path(out_dir, orig.name).with_suffix('.bin')
    compress(out_name, '.d')

if __name__ == '__main__':
    reinsert_maps()
    reinsert_blocks()
    reinsert_eboot()
    reinsert_monsters()
    reinsert_wmap()
    reinsert_smdat()
