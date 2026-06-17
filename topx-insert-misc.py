#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import re
import struct

from pathlib import Path
from io import BytesIO

from libs.TextReader import TextReader
from libs.insertor import convert_string
from libs.util import get_symbols, paths, logger
from dataclasses import dataclass

out_dir = paths['out']
target_dir = paths['target']

@dataclass
class Pointer:
    offset: int
    target: int
    comment: str = ''

    def __repr__(self):
        return f'Pointer(offset=0x{self.offset:X}, target=0x{self.target:X}, comment="{self.comment}")'

syms = get_symbols()
btl_quote_ptrs = syms.get('btl_quote_ptrs')
msg_skit_prompt_ptr = syms.get('msg_skit_prompt')
bgm_ptrs_start = syms.get('bgm_title_ptr')
mon_ptrs_start = syms.get('monster_names_ptr')
item_found_start = 0x8c28fcc
item_found_ptr = None

if not all((btl_quote_ptrs, msg_skit_prompt_ptr, bgm_ptrs_start, mon_ptrs_start)):
    raise SystemExit('Fatal error: symbols missing')

eboot_base = 0x08803FAC
text_base = syms.get('custom_file_offset')
reloc_base = 0x8804000
skit_prompt_ptr = None

# re-use upper half of old map buffer
max_size = 0x60000 - 0x35000

def process_block(fname):
    global skit_prompt_ptr

    logger.info(f"Inserting {fname}...")

    fname = Path(fname)
    strings = TextReader(fname, mode='bare').strings

    pointers = []
    block = BytesIO()
    block.write(b"\x00" * len(strings) * 2)

    seen = {}

    for num, s in enumerate(strings):
        s = re.sub(r'<wait_[\dA-F]{2}>', '', s)

        if fname.stem == 'top_battle_quotes_eng' and num == 1622:
            # convert to raw ascii
            s = s.replace('%s', '{25}{73}')
            skit_prompt_ptr = block.tell()

        s = convert_string(s, True)

        if found := seen.get(s):
            pointers += [found]
            continue

        pointers += [block.tell()]
        seen[s] = block.tell()
        block.write(s)

    pointers = [struct.pack('<H', x) for x in pointers]

    block.seek(0)
    block.write(b''.join(pointers))

    buf = block.getvalue()
    block.close()

    return buf

def insert_misc_text():
    global skit_prompt_ptr
    global item_found_ptr

    quotes_ptr = None
    bgm_ptr = None
    mon_ptr = None

    files = [
        target_dir / 'menu/top_battle_quotes_eng.txt',
        target_dir / 'menu/topx_bgm_jap.txt',
        target_dir / 'menu/topx_monster_names.txt',
        out_dir / 'topx_item_found.bin',
    ]

    with open(out_dir / 'julian.dat', 'r+b') as out:
        out.seek(0, 2)

        for fname in files:
            fname = Path(fname)

            match fname.suffix:
                case '.txt':
                    buf = process_block(fname)
                case _:
                    buf = fname.read_bytes()

            # make sure we're word-aligned
            if padding := out.tell() % 4:
                out.write(b'\x00' * (4 - padding))

            if out.tell() + len(buf) > max_size:
                logger.error(f'file overflows by {out.tell() - max_size} bytes')
                return

            cur_pos = out.tell()

            match fname.stem:
                case 'top_battle_quotes_eng':
                    quotes_ptr = cur_pos
                    # add to the block pointer we set in process_block
                    skit_prompt_ptr += cur_pos
                case 'topx_bgm_jap':
                    bgm_ptr = cur_pos
                case 'topx_monster_names':
                    mon_ptr = cur_pos
                case 'topx_item_found':
                    item_found_ptr = cur_pos

            out.write(buf)

        # write block pointers
        block_pointers = [
            Pointer(btl_quote_ptrs, quotes_ptr, comment='battle quotes'),
            Pointer(msg_skit_prompt_ptr, skit_prompt_ptr, comment='skit prompt'),
            Pointer(bgm_ptrs_start, bgm_ptr, comment='BGMs'),
            Pointer(mon_ptrs_start, mon_ptr, comment='monster names'),
        ]

        for ptr in block_pointers:
            if ptr is None:
                logger.warning(f'pointer not set: {ptr.comment}')
                continue

            out.seek(ptr.offset - text_base)
            out.write(struct.pack('<I', ptr.target + text_base))

def insert_save_gfx():
    end_addr = 0x08a1e000 - eboot_base

    with open(out_dir / 'EBOOT.BIN', 'r+b') as out:
        data_ptrs = [
            ('top_prx_clearsave.png', 0x088b2d34, 0x088b2d3c, 0x088b2d38, 0x088b2d44),
            ('top_prx_save.png', 0x088b2d58, 0x088b2d94, None, 0x088b2d9c),
        ]

        queue = []
        out.seek(0x089da1c4 - eboot_base)

        for fname, hi_addr, lo_addr, size_hi_addr, size_lo_addr in data_ptrs:
            logger.info(f'inserting {fname}')

            if out.tell() >= end_addr:
                logger.error('ran out of space')
                break

            if padding := out.tell() % 4:
                out.write(b'\x00' * (padding - 4))

            cur_pos = out.tell() + eboot_base - reloc_base
            hi = cur_pos >> 16
            lo = cur_pos & 0xffff

            if lo >= 0x8000:
                hi += 1

            buf = Path(fname).read_bytes()
            size = len(buf)

            out.write(buf)

            queue += [(hi_addr - eboot_base, struct.pack('<H', hi))]
            queue += [(lo_addr - eboot_base, struct.pack('<H', lo))]

            if size_hi_addr:
                queue += [(size_hi_addr - eboot_base, struct.pack('<H', size >> 16))]

            queue += [(size_lo_addr - eboot_base, struct.pack('<H', size & 0xffff))]

        logger.debug(f'{end_addr - cur_pos} bytes left')
        logger.debug(f'new end address: {cur_pos + eboot_base:X}')

        for offs, val in queue:
            out.seek(offs)
            out.write(val)

def update_eboot_pointers():
    with open(out_dir / 'EBOOT.BIN', 'r+b') as out:
        out.seek(item_found_start - eboot_base)
        out.write(struct.pack('<I', item_found_ptr + text_base - reloc_base))

if __name__ == '__main__':
    insert_misc_text()
    insert_save_gfx()
    update_eboot_pointers()
