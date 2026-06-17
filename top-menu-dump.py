#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct

from pathlib import Path
from loguru import logger
from TextDecoder import TextDecoder

decoder_eng = TextDecoder('top-menu-eng.tbl', encoding='utf-8')
decoder_jap = TextDecoder('topx-menu-jap.tbl', encoding='utf-8')
decoder_jap_full = TextDecoder('top.tbl', encoding='utf-8')
decoder_jap_12 = TextDecoder('top-k12.tbl', encoding='utf-8')

eboot_base = 0x08803FAC

names = [
    'Cless',
    'Mint',
    'Arche',
    'Klarth',
    'Chester',
    'Suzu',
    'Rhea',
    'Brambard',
]

blocks_eng = [
    ('top_menu_items_eng.txt', 0x2E0E0, 396, 'eng'),     # items
    ('top_menu_item_descs_eng.txt', 0x2EF4C, 400, 'eng'),     # item descriptions
    ('top_menu_recipes_eng.txt', 0x3415C, 26, 'eng'),      # recipes
    ('top_menu_recipe_descs_eng.txt', 0x34240, 26, 'eng'),      # recipe descriptions
    ('top_menu_titles_eng.txt', 0x37696, 97, 'eng'),       # titles
    ('top_menu_title_descs_eng.txt', 0x37A4A, 97, 'eng'),       # title descriptions
    ('top_menu_artes_eng.txt', 0x38928, 116, 'eng'),     # artes (FIXME: pointer offset for JP - 0x38FD8, needs 16-bit table)
    ('top_menu_arte_descs_eng.txt', 0x394A0, 112, 'eng'),     # arte descriptions (has dummy string at the end)
    ('top_menu_strategies_eng.txt', 0x3A6A0, 12, 'eng'),      # strategies
    ('top_menu_strategy_descs_eng.txt', 0x3A738, 12, 'eng'),      # strategy descriptions
    ('top_menu_misc_eng.txt', 0x3A970, 182, 'eng'),     # misc menu text
    ('top_menu_misc2_eng.txt', 0x3B0D8, 174, 'eng'),     # misc menu text2 (needs 16-bit table, has dummy string at the end)
]

blocks_jap = [
    ('top_menu_items_jap.txt', 0x2E0E0, 396, 'jap'),
    ('top_menu_item_descs_jap.txt', 0x2EF4C, 400, 'jap-full'),
    ('top_menu_recipes_jap.txt', 0x3415C, 26, 'jap'),
    ('top_menu_recipe_descs_jap.txt', 0x34240, 26, 'jap-full'),
    ('top_menu_titles_jap.txt', 0x37696, 97, 'jap'),
    ('top_menu_title_descs_jap.txt', 0x37A4A, 97, 'jap-full'),
    ('top_menu_artes_jap.txt', 0x38FD8, 54, 'jap-full'),       # different count from English
    ('top_menu_arte_descs_jap.txt', 0x394A0, 112, 'jap-full'),  # arte descriptions (has dummy string at the end)
    ('top_menu_strategies_jap.txt', 0x3A6A0, 12, 'jap'),
    ('top_menu_strategy_descs_jap.txt', 0x3A738, 12, 'jap-full'),
    ('top_menu_misc_jap.txt', 0x3A970, 182, 'jap'),
    ('top_menu_misc2_jap.txt', 0x3B0D8, 174, 'jap-full'),     # misc menu text2 (needs 16-bit table, has dummy string at the end)
    ('top_menu_artes2_jap.txt', 0x38A28, 112, 'jap'),       # different count from English
]

blocks_psp = [
    ('topx_menu_items_jap.txt', 0x2FE5C, 400, 'jap'),
    ('topx_menu_item_descs_jap.txt', 0x30CD0, 400, 'jap-full'),
    ('topx_menu_recipes_jap.txt', 0x35EE0, 26, 'jap'),
    ('topx_menu_recipe_descs_jap.txt', 0x35FC4, 26, 'jap-full'),
    ('topx_menu_titles_jap.txt', 0x39418, 98, 'jap'),
    ('topx_menu_title_descs_jap.txt', 0x397CC, 98, 'jap-full'),
    ('topx_menu_artes_jap.txt', 0x3AD6C, 54, 'jap-full'),
    ('topx_menu_arte_descs_jap.txt', 0x3B234, 112, 'jap-full'),
    ('topx_menu_strategies_jap.txt', 0x3C434, 12, 'jap'),
    ('topx_menu_strategy_descs_jap.txt', 0x3C4CC, 12, 'jap-full'),
    ('topx_menu_misc_jap.txt', 0x3C704, 182, 'jap'),
    ('topx_menu_misc2_jap.txt', 0x3CE6C, 175, 'jap-full'),
    ('topx_menu_artes2_jap.txt', 0x3A7BC, 112, 'jap'),
]

monsterbook_psp = [
    ('topx_menu_monster_book.txt', 0x5a20, 440, 'jap')
]

monsterbook_jap = [
    ('top_menu_monster_book_mes_jap.txt', 0x5930, 24, 'jap-full'),
    ('top_menu_monster_book_jap.txt', 0x5aa0, 256, 'jap')
]

monsterbook_eng = [
    ('top_menu_monster_book_mes_eng.txt', 0x5930, 24, 'eng'),
    ('top_menu_monster_book_eng.txt', 0x5aa0, 256, 'eng')
]

shops_jap = [
    ('top_menu_shops_jap.txt', 0x38280, 76, 'jap-full')
]

shops_eng = [
    ('top_menu_shops_eng.txt', 0x38280, 76, 'eng')
]

shops_psp = [
    ('topx_menu_shops_jap.txt', 0x3997C, 76, 'jap-full')
]

prx_psp = [
    ('topx_prx_battle_jap.txt', 0x1ab0e4, 18, 'jap-full'),
    ('topx_prx_title_descs_jap.txt', 0x1ad7c8, 102, 'jap-full'),
    ('topx_prx_item_descs_jap.txt', 0x1ce288, 404, 'jap-full'),
    ('topx_prx_titles_jap.txt', 0x1AE910, 114, 'jap'),
    ('topx_prx_items_jap.txt', 0x1d3060, 404, 'jap'),
    ('topx_prx_misc_jap.txt', 0x443F38, 184, 'jap'),
    ('topx_prx_misc2_jap.txt', 0x4446B0, 174, 'jap-full'),
    ('topx_prx_cook_help.txt', 0x1af20c, 26, 'jap-full'),
    ('topx_prx_cook_name.txt', 0x1afe88, 26, 'jap'),
    ('topx_prx_cook_msg.txt', 0x1af7c4, 34, 'jap-full'),
    ('topx_prx_grade_shop.txt', 0x1b8c40, 46, 'jap-full'),
    ('topx_prx_mon_mes.txt', 0x461164, 24, 'jap-full'),
    ('topx_prx_mon_name.txt', 0x4612d4, 256, 'jap'),
    ('topx_prx_shop_name.txt', 0x4283a0, 76, 'jap-full'),
    ('topx_prx_opr08.txt', 0x423480, 12, 'jap'),
    ('topx_prx_opr14.txt', 0x423518, 12, 'jap-full'),
    ('topx_prx_spc08.txt', 0x429ecc, 120, 'jap'),
    ('topx_prx_spc12.txt', 0x42a35c, 58, 'jap-12'),
    ('topx_prx_spc14.txt', 0x42a4e4, 62, 'jap-full'),
    ('topx_prx_spc_help.txt', 0x428b3c, 120, 'jap-full'),
    ('topx_prx_misc3.txt', 0x1aafb4, 42, 'jap'),
    ('topx_prx_main_menu.txt', 0x444688, 8, 'jap-12'),
]

def dump_string(buf, start_addr, decoder, short=False):
    pos = start_addr
    out = []
    opcode_len = 1 if short else 2

    while True:
        c = buf[pos]

        if tmp := decoder.tbl.has(buf, pos):
            decoded, raw = tmp
            out += [decoded]
            pos += len(raw)

            if decoded.rstrip() == '{END}':
                break

            continue

        logger.debug(f'{pos:X}')
        pos += opcode_len

        match c:
            case 0x05:
                num = struct.unpack_from('<H', buf, pos)[0]
                pos += 2
                out += [f'<speed_{num:04X}>']
            case 0x06:
                num = struct.unpack_from('<H', buf, pos)[0]
                pos += 2
                out += [f'<color_{num:04X}>']
            case 0x07:
                num = struct.unpack_from('<H', buf, pos)[0]
                try:
                    name = names[num - 1]
                except IndexError:
                    logger.debug(f'{pos:X}')
                    if num >= 0x10:
                        name = f'audio_{num:04X}'
                    else:
                        name = f'char_{num:04X}'
                    logger.debug(name)
                pos += 2
                out += [f'<{name}>']
            case 0x08:
                # purposely reversed endianess
                num = struct.unpack_from('>H', buf, pos)[0]
                pos += 2
                out += [f'<item_{num:04X}>']
            case 0x09:
                # purposely reversed endianess
                num = struct.unpack_from('>H', buf, pos)[0]
                pos += 2
                out += [f'<var_{num:04X}>']
            case 0x0A:
                num = struct.unpack_from('<I', buf, pos)[0]
                pos += 4
                out += [f'<num1_{num:08X}>']
            case 0x0B:
                num = struct.unpack_from('<I', buf, pos)[0]
                pos += 4
                out += [f'<num2_{num:08X}>']
            case 0x0C:
                num = struct.unpack_from('<I', buf, pos)[0] & 0xFFFFFF
                pos += 4
                out += [f'<num3_{num:08X}>']
            case 0x0d:
                num = struct.unpack_from('<I', buf, pos)[0] & 0xFFFFFF
                pos += 4
                out += [f'<num4_{num:08X}>']
            case 0x0E:
                num = struct.unpack_from('<I', buf, pos)[0] & 0xFFFFFF
                pos += 4
                out += [f'<num5_{num:08X}>']
            case _:
                out += ['{' + f'{buf[pos]:02X}' + '}']
                pos += 1 - opcode_len

        logger.debug(out[-1])

    return ''.join(out)


def dump_block(fname, offs, num, lang, buf):
    logger.info(f'Dumping {fname}')

    if offs >= 0x8800000:
        offs -= eboot_base

    match lang:
        case 'eng':
            decoder = decoder_eng
        case 'jap':
            decoder = decoder_jap
        case 'jap-full':
            decoder = decoder_jap_full
        case 'jap-12':
            decoder = decoder_jap_12
        case _:
            raise ValueError(f'Unknown language {lang}')

    # if lang == 'jap' and offs == 0x38928:
    #     offs = 0x38FD8
    #     num = 105

    start = offs
    ptrs = struct.unpack_from(f'<{num}H', buf, offs)

    if lang == 'jap-full' and offs == 0x38fd8:
        ptrs = [x for x in ptrs if x]

    if fname == 'topx_menu_monster_book.txt':
        ptrs = ptrs[184:]

    ptrs = [x + offs + (2 * num) for x in ptrs]

    if fname == 'topx_menu_misc2_jap.txt':
        ptrs = [x - 2 for x in ptrs]

    strings = []

    match lang:
        case 'eng' | 'jap' | 'jap-12':
            short = True
        case _:
            short = False

    for offs in ptrs:
        # stripping out the grammar tags
        if lang == 'eng' and buf[offs] == 0xff:
            offs += 2

        tmp = dump_string(buf, offs, decoder, short)
        strings += [tmp]

    if start == 0x394A0:
        strings = strings[:-1]
    elif start == 0x3CE6C:
        strings = strings[:-2]

    strings = ''.join(strings)
    Path(fname).write_text(strings)

def dump_blocks(fname, blocks):
    buf = Path(fname).read_bytes()

    for args in blocks:
        dump_block(*args, buf)

if __name__ == '__main__':

    files = [
        ('psx/usa/top_0002.decomp', blocks_eng),
        ('psx/orig/top_0002.decomp', blocks_jap),
        ('menu.d.decomp', blocks_psp),
        ('monster.d', monsterbook_psp),
        ('psx/orig/top_0017.bin', monsterbook_jap),
        ('psx/usa/top_0017.bin', monsterbook_eng),
        ('psx/orig/top_0668.decomp', shops_jap),
        ('psx/usa/top_0668.decomp', shops_eng),
        ('nmap.d.decomp', shops_psp),
        ('top.prx', prx_psp),
    ]

    for fname in files:
        dump_blocks(*fname)
