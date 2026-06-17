#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
from pathlib import Path
from dataclasses import dataclass
from itertools import groupby
from io import BytesIO

from libs.insertor import convert_string
from translate.storage import xliff
from libs.util import paths, logger

@dataclass
class Block:
    fname: str
    text: str
    offset: int
    short: bool = False


out_dir = paths['out'] / 'btl'
target_dir = paths['target']
orig_dir = paths['extracted'] / 'monsters'

def reinsert_monsters():
    logger.info('Reinserting monsters...')
    fname = target_dir / 'menu/topx_monsters_jap.xlf'
    buf = Path(fname).read_bytes()
    xliff_file = xliff.xlifffile(buf)
    units = []

    out_dir.mkdir(exist_ok=True)

    for unit in xliff_file.units:
        s = unit.target
        s_id = unit.getid()
        s_id = s_id[s_id.index('\x04') + 1:]
        fname, offset = s_id.split(':')
        offset = int(offset, 16)

        logger.debug(f'{s_id=}')
        logger.debug(f'{unit.target=}')
        logger.debug(f'{offset=:X}')
        logger.debug(f'{fname=}')

        is_short = offset == 0
        units += [Block(fname, s, offset, is_short)]

    for num, (fname, strings) in enumerate(groupby(units, lambda x: x.fname)):
        logger.debug(f'{fname=}')
        chunk_name = f'{fname}.d'
        orig_name = orig_dir / chunk_name
        out_name = out_dir / chunk_name
        buf = orig_name.with_suffix('.decomp').read_bytes()
        out = BytesIO(buf)

        for s in strings:
            max_len = 21 if s.offset == 0 else 24

            if s.offset == 0:
                # replace original shift-jis with our enemy ID
                tmp = struct.pack('B', num)
                tmp += b'\x00' * (max_len - 2)
            else:
                tmp = convert_string(s.text + '{END}', True)

            if len(tmp) > max_len:
                logger.error(f'{s.text} is too long')
                continue

            out.seek(s.offset)
            out.write(tmp)

        out_name.write_bytes(out.getvalue())
        out.close()

if __name__ == '__main__':
    reinsert_monsters()
