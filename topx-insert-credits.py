#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
import json

from pathlib import Path
from dataclasses import dataclass
from enum import Enum

from libs.util import get_symbols, paths, logger

out_dir = paths['out']

class Align(Enum):
    center = 0
    left = 1
    right = 2

    def __str__(self):
        return self.name

class Color(Enum):
    blue = 5
    green = 6
    white = 7

    def __str__(self):
        return self.name

@dataclass
class BlockPointer:
    hi: int
    lo: int
    offset: int = 0
    no_reloc: bool = False

    def __post_init__(self):
        if self.hi >= 0x08000000:
            self.hi -= eboot_base
            self.lo -= eboot_base

    def __repr__(self):
        return f'BlockPointer(hi=0x{self.hi:X}, lo=0x{self.lo:X})'

syms = get_symbols()

eboot_base = 0x08803FAC
text_base = syms.get('custom_file_offset')
reloc_base = 0x8804000

credits_meta_ptr = BlockPointer(0x088dfff8, 0x088dfffc)

def insert_credits():
    credits_offs = None

    with open(out_dir / 'julian.dat', 'r+b') as out_f:
        out_f.seek(0, 2)

        # make sure we're word-aligned
        if padding := out_f.tell() % 4:
            out_f.write(b'\x00' * (4 - padding))

        credits_offs = out_f.tell()

        meta = Path('credits-meta.json').read_text('utf-8')
        meta = json.loads(meta)

        pos = credits_offs + (len(meta) * 8) + text_base
        hdr = []
        out = []

        for unit in meta:
            match unit['type']:
                case 'spacing':
                    hdr += [struct.pack('<4BI', 0, 0, 0, 0, unit['size'])]
                case 'image':
                    hdr += [struct.pack('<4BI', 1, unit['image_id'], Align[unit['align']].value, 0, 0)]
                case 'text':
                    unit['offset'] = pos
                    # NOTE: might be a problem for other languages
                    s = unit['text'].encode('shift-jis') + b'\x00'
                    out += [s]
                    pos += len(s)

                    hdr += [struct.pack('<4BI', 2, Color[unit['color']].value, Align[unit['align']].value, 0, unit['offset'])]
                case 'end':
                    hdr += [struct.pack('<4BI', 3, 0, 0, 0, 0)]
                case _:
                    logger.error(f'Unknown type: {unit["type"]}')

        out_f.write(b''.join(hdr))

        if padding := out_f.tell() % 4:
            out_f.write(b'\x00' * (4 - padding))

        out_f.write(b''.join(out))

        if padding := out_f.tell() % 4:
            out_f.write(b'\x00' * (4 - padding))

    # update pointers
    with open(out_dir / 'EBOOT.BIN', 'r+b') as eboot:
        ptr_offset = credits_offs + text_base - reloc_base
        hi = ptr_offset >> 16
        lo = ptr_offset & 0xffff

        if lo >= 0x8000:
            hi += 1

        eboot.seek(credits_meta_ptr.hi)
        eboot.write(struct.pack('<H', hi))
        eboot.seek(credits_meta_ptr.lo)
        eboot.write(struct.pack('<H', lo))

if __name__ == '__main__':
    insert_credits()
