#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
import re

from pathlib import Path

from libs.insertor import convert_string
from libs.TextReader import TextReader
from libs.util import paths, logger

out_dir = paths['out']
target_dir = paths['target']

def process_block(fname, out_name):
    logger.info(f"Inserting {fname}...")
    fname = Path(fname)
    strings = TextReader(fname, mode='bare').strings

    # strip out unused SV labels
    strings = strings[:1566] + (['{END}'] * (len(strings) - 1566))

    pointers = []

    with open(out_name, 'wb') as block:
        block.write(struct.pack('<2I', 8, 0))
        block.write(b"\x00" * len(strings) * 2)

        seen = {}

        for s in strings:
            # replace digits with thin ones
            s = re.sub(r'([0-9])', '[\\1]', s)
            s = convert_string(s, True)

            if found := seen.get(s):
                pointers += [found]
                continue

            pointers += [block.tell()]
            seen[s] = block.tell()
            block.write(s)

        pointers = [struct.pack('<H', x) for x in pointers]

        block.seek(8)
        block.write(b''.join(pointers))

def insert_text():
    process_block(target_dir / 'menu/topx_smdat_vo.txt', out_dir / 'smdat_01.bin')

if __name__ == '__main__':
    insert_text()
