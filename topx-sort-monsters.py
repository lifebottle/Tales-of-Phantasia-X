#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct

from io import BytesIO
from pathlib import Path

from libs.TextReader import TextReader
from libs.util import compress, paths, logger

out_dir = paths['out']
target_dir = paths['target']
extracted_dir = paths['extracted']

NUM_ENTRIES = 233
EXTRA_LEN = 5

def chunked(items, n):
    return [items[i:i + n] for i in range(0, len(items), n)]

def make_lut():
    text_path = Path(target_dir, 'menu/topx_prx_mon_name.txt')

    strings = TextReader(text_path, mode='bare').strings
    old_len = len(strings)

    to_sort = strings[:NUM_ENTRIES + EXTRA_LEN]
    tail = strings[NUM_ENTRIES + EXTRA_LEN:]
    tail = [(s, num) for num, s in enumerate(tail, 233 + EXTRA_LEN)]

    to_sort = [(s, num) for num, s in enumerate(to_sort)]
    to_sort = sorted(to_sort, key=lambda x: x[0].replace("{END}", "").lower().split())

    out = to_sort + tail

    assert len(out) == old_len

    # create LUT for use with sorting code
    lut = b''.join([struct.pack('B', x[1]) for x in out])
    Path(out_dir, 'monsterbook-sorting.bin').write_bytes(lut)

    # reverse LUT for displaying index number
    lut2 = sorted(enumerate(lut), key=lambda x: x[1])
    lut2 = b''.join([struct.pack('B', x[0]) for x in lut2])
    Path(out_dir, 'monsterbook-sorting2.bin').write_bytes(lut2)

def write_dat(fname, blocks):
    count = len(blocks)
    chunks = []

    data = BytesIO()
    data.write(b'\x00' * (4 + (8 * count)))

    for chunk in blocks:
        if padding := data.tell() % 4:
            data.write(b'\x00' * (4 - padding))

        offs = data.tell()
        size = len(chunk)

        data.write(chunk)
        chunks += [(offs, size)]

    chunks = [struct.pack('<2I', offs, size) for offs, size in chunks]
    header = struct.pack('<I', count)
    header += b''.join(chunks)

    assert len(header) == (4 + (8 * count))

    data.seek(0)
    data.write(header)

    fname.write_bytes(data.getvalue())

def repack_tims():
    extra_path = out_dir / 'monsterbook'
    tims = []

    for num in range(8):
        orig = extracted_dir / f'montim{num}'
        for fname in sorted(orig.glob(f'montim{num}_??.bin')):
            replaced_name = extra_path / fname.with_suffix('.decomp').name

            if replaced_name.exists():
                logger.debug(f'Replacing {fname.name} with updated version')
                compress(replaced_name, '.bin')
                fname = replaced_name.with_suffix('.bin')

            tims += [fname.read_bytes()]

    extras = []

    for fname in sorted(extra_path.glob('dhaos-tim-?.bin')):
        extras += [fname.read_bytes()]

    assert len(tims) == 256
    assert len(extras) == 5

    tims = tims[:NUM_ENTRIES] + extras + tims[NUM_ENTRIES + len(extras):]

    for num, imgs in enumerate(chunked(tims, 0x20)):
        out_name = out_dir / f'montim{num}.acf'
        write_dat(out_name, imgs)

if __name__ == '__main__':
    make_lut()
    repack_tims()
