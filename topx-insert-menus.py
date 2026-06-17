#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
import re

from pathlib import Path
from dataclasses import dataclass
from io import BytesIO

from libs.TextReader import TextReader
from libs.insertor import convert_string
from libs.linewrap import TextWrapper
from libs.util import get_symbols, paths, logger

out_dir = paths['out']
target_dir = paths['target'] / 'menu'
eboot_path = out_dir / 'EBOOT.BIN'
data_path = out_dir / 'julian.dat'

syms = get_symbols()

eboot_base = 0x08803FAC
text_base = syms.get('custom_file_offset')
reloc_base = 0x8804000

# re-use upper half of old map buffer
max_size = 0x60000 - 0x35000

wrapper = TextWrapper()

sprintf_strings = [
    # arte mastered message
    ('topx_prx_battle_jap', 4),
    ('topx_prx_battle_jap', 5),
    ('topx_prx_battle_jap', 6),
    ('topx_prx_battle_jap', 7),
    ('topx_prx_battle_jap', 8),
    ('topx_prx_battle_jap', 9),
    ('topx_prx_battle_jap', 10),
    ('topx_prx_battle_jap', 11),
    ('topx_prx_battle_jap', 12),
    ('topx_prx_battle_jap', 13),
    ('topx_prx_battle_jap', 14),
    ('topx_prx_battle_jap', 15),
    ('topx_prx_battle_jap', 16),
    ('topx_prx_battle_jap', 17),
    # discard message
    ('topx_prx_misc2_jap', 30),
]

npc_name_fix_ptr = syms.get('@@npc_name_fix_ptr')
discard_msg_ptr = syms.get('discard_msg_ptr')

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

@dataclass
class Block:
    fname: str
    ptr_table: int
    short: bool = False

@dataclass
class Pointer:
    address: int
    destination: int

    def __repr__(self):
        return f'Pointer(address=0x{self.address + eboot_base:X}, destination=0x{self.destination:X})'

    @property
    def value(self):
        return self.as_short()

    def as_short(self):
        return struct.pack("<H", self.destination & 0xFFFF)

text_refs = {
    'topx_prx_battle_jap.txt': [
        BlockPointer(0x0883105c, 0x08831060),
    ],
    'topx_prx_title_descs_jap.txt': [
        BlockPointer(0x088c0534, 0x088c0538),
    ],
    'topx_prx_item_descs_jap.txt': [
        BlockPointer(0x0883100c, 0x08831010),
        BlockPointer(0x088c486c, 0x088c4870),
    ],
    'topx_prx_titles_jap.txt': [
        BlockPointer(0x088c0244, 0x088c0258),
        BlockPointer(0x088c042c, 0x088c0430),
        BlockPointer(0x088c0510, 0x088c0514),
        BlockPointer(0x088c1e60, 0x088c1e74),
        BlockPointer(0x088e15b0, 0x088e15b4),
    ],
    'topx_prx_items_jap.txt': [
        BlockPointer(0x08830fe4, 0x08830fe8),
        BlockPointer(0x088affd8, 0x088affdc),
        BlockPointer(0x088b75c0, 0x088b75c4),
        BlockPointer(0x088b7818, 0x088b781c),
        BlockPointer(0x088b900c, 0x088b9010),
        BlockPointer(0x088b91d4, 0x088b91d8),
        BlockPointer(0x088c1420, 0x088c1424),
        BlockPointer(0x088c1af8, 0x088c1afc),
        BlockPointer(0x088c21e0, 0x088c21e4),
        BlockPointer(0x088c47a4, 0x088c47a8),
        BlockPointer(0x088c4fb8, 0x088c4fbc),
        BlockPointer(0x088ce8ec, 0x088ce900),
        BlockPointer(0x088dae18, 0x088dae1c),
        BlockPointer(0x088e0568, 0x088e057c),
        BlockPointer(0x088e0900, 0x088e0918),
        BlockPointer(0x088e26a8, 0x088e26ac),
        BlockPointer(0x088ed6bc, 0x088ed6c0),
        BlockPointer(0x088f0c6c, 0x088f0c70),
    ],
    'topx_prx_misc2_jap.txt': [
        BlockPointer(0x088a9ccc, 0x088a9cd0),
        BlockPointer(0x088aab98, 0x088aab9c),
        BlockPointer(0x088bdf18, 0x088bdf20),
        BlockPointer(0x088aac14, 0x088aac28),
        BlockPointer(0x088ab628, 0x088ab62c),
        BlockPointer(0x088ab65c, 0x088ab660),
        BlockPointer(0x088ab6d0, 0x088ab6d4),
        BlockPointer(0x088ab6fc, 0x088ab700),
        BlockPointer(0x088ab728, 0x088ab72c),
        BlockPointer(0x088abc34, 0x088abc38),
        BlockPointer(0x088abd40, 0x088abd44),
        BlockPointer(0x088abe48, 0x088abe4c),
        BlockPointer(0x088abebc, 0x088abec0),
        BlockPointer(0x088abf18, 0x088abf1c),
        BlockPointer(0x088abf8c, 0x088abf90),
        BlockPointer(0x088abfe8, 0x088abfec),
        BlockPointer(0x088ac05c, 0x088ac060),
        BlockPointer(0x088ac0b8, 0x088ac0bc),
        BlockPointer(0x088ac12c, 0x088ac130),
        BlockPointer(0x088ac188, 0x088ac18c),
        BlockPointer(0x088ac1e4, 0x088ac1e8),
        BlockPointer(0x088af720, 0x088af724),
        BlockPointer(0x088b4c84, 0x088b4c88),
        BlockPointer(0x088b6180, 0x088b6184),
        BlockPointer(0x088b61bc, 0x088b61c0),
        BlockPointer(0x088b61f8, 0x088b61fc),
        BlockPointer(0x088b6224, 0x088b6228),
        BlockPointer(0x088b6254, 0x088b6258),
        BlockPointer(0x088b6280, 0x088b6284),
        BlockPointer(0x088b63cc, 0x088b63d0),
        BlockPointer(0x088b6dbc, 0x088b6dc0),
        BlockPointer(0x088b7c1c, 0x088b7c20),
        BlockPointer(0x088b7d78, 0x088b7d7c),
        BlockPointer(0x088b8124, 0x088b8128),
        BlockPointer(0x088b8930, 0x088b8934),
        BlockPointer(0x088b8950, 0x088b8954),
        BlockPointer(0x088b8ac4, 0x088b8ac8),
        BlockPointer(0x088b8b88, 0x088b8b8c),
        BlockPointer(0x088b9f60, 0x088b9f64),
        BlockPointer(0x088b9f8c, 0x088b9f90),
        BlockPointer(0x088b9fb8, 0x088b9fbc),
        BlockPointer(0x088bc908, 0x088bc90c),
        BlockPointer(0x088bcc30, 0x088bcc34),
        BlockPointer(0x088bdb40, 0x088bdb44),
        BlockPointer(0x088bdf18, 0x088bdf20),
        BlockPointer(0x088bf72c, 0x088bf730),
        BlockPointer(0x088bf748, 0x088bf74c),
        BlockPointer(0x088c0078, 0x088c007c),
        BlockPointer(0x088c0734, 0x088c0738),
        BlockPointer(0x088c11c4, 0x088c11c8),
        BlockPointer(0x088c1760, 0x088c1764),
        BlockPointer(0x088c1d38, 0x088c1d3c),
        BlockPointer(0x088c28ac, 0x088c28b0),
        BlockPointer(0x088c3c5c, 0x088c3c60),
        BlockPointer(0x088c41e4, 0x088c41e8),
        BlockPointer(0x088c4238, 0x088c423c),
        BlockPointer(0x088c4274, 0x088c4278),
        BlockPointer(0x088c47e8, 0x088c47fc),
        BlockPointer(0x088c4c74, 0x088c4c78),
        BlockPointer(0x088c4d28, 0x088c4d2c),
        BlockPointer(0x088c4d54, 0x088c4d58),
        BlockPointer(0x088c4db0, 0x088c4db4),
        BlockPointer(0x088c4e08, 0x088c4e0c),
        BlockPointer(0x088c4ffc, 0x088c5000),
        BlockPointer(discard_msg_ptr, discard_msg_ptr + 4, no_reloc=True),   # discard_msg_stub
        BlockPointer(0x088c502c, 0x088c5030),
        BlockPointer(0x088c5058, 0x088c505c),
        BlockPointer(0x088c5154, 0x088c5158),
        BlockPointer(0x088c5180, 0x088c5184),
        BlockPointer(0x088c51ac, 0x088c51b0),
        BlockPointer(0x088c530c, 0x088c5310),
        BlockPointer(0x088dabe0, 0x088dabe4),
        BlockPointer(0x088db050, 0x088db054),
        BlockPointer(0x088db0d8, 0x088db0dc),
        BlockPointer(0x088db14c, 0x088db150),
        BlockPointer(0x088e1624, 0x088e1628),
        BlockPointer(0x088c4d10, 0x088c4d14, offset=2),
    ],
    'topx_prx_misc_jap.txt': [
        BlockPointer(hi=0x88AA1EC, lo=0x88AA1F0),
        BlockPointer(hi=0x88AA234, lo=0x88AA238),
        BlockPointer(hi=0x88AA61C, lo=0x88AA624),
        BlockPointer(hi=0x88AB118, lo=0x88AB11C),
        BlockPointer(hi=0x88AB158, lo=0x88AB15C),
        BlockPointer(hi=0x88AB194, lo=0x88AB198),
        BlockPointer(hi=0x88AB1C0, lo=0x88AB1C4),
        BlockPointer(hi=0x88AB420, lo=0x88AB428),
        BlockPointer(hi=0x88AB4B8, lo=0x88AB4C0),
        BlockPointer(hi=0x88AB8E0, lo=0x88AB8E4),
        BlockPointer(hi=0x88AB924, lo=0x88AB928),
        BlockPointer(hi=0x88AB988, lo=0x88AB98C),
        BlockPointer(hi=0x88ABD6C, lo=0x88ABD70),
        BlockPointer(hi=0x88ABD98, lo=0x88ABD9C),
        BlockPointer(hi=0x88AFCB8, lo=0x88AFCBC),
        BlockPointer(hi=0x88B0000, lo=0x88B0004),
        BlockPointer(hi=0x88B3CB8, lo=0x88B3CBC),
        BlockPointer(hi=0x88B3D6C, lo=0x88B3D70),
        BlockPointer(hi=0x88B3DB8, lo=0x88B3DBC),
        BlockPointer(hi=0x88B400C, lo=0x88B4010),
        BlockPointer(hi=0x88B4044, lo=0x88B4048),
        BlockPointer(hi=0x88B4090, lo=0x88B4094),
        BlockPointer(hi=0x88B40DC, lo=0x88B40E0),
        BlockPointer(hi=0x88B5880, lo=0x88B5884),
        BlockPointer(hi=0x88B6014, lo=0x88B6018),
        BlockPointer(hi=0x88B607C, lo=0x88B6080),
        BlockPointer(hi=0x88B6118, lo=0x88B611C),
        BlockPointer(hi=0x88B6310, lo=0x88B6314),
        BlockPointer(hi=0x88B64F8, lo=0x88B64FC),
        BlockPointer(hi=0x88B6590, lo=0x88B6594),
        BlockPointer(hi=0x88B6670, lo=0x88B6674),
        BlockPointer(hi=0x88B77B0, lo=0x88B77B4),
        BlockPointer(hi=0x88B7890, lo=0x88B7894),
        BlockPointer(hi=0x88B7984, lo=0x88B7988),
        BlockPointer(hi=0x88B7A1C, lo=0x88B7A20),
        BlockPointer(hi=0x88B7AC4, lo=0x88B7AC8),
        BlockPointer(hi=0x88B7AF0, lo=0x88B7AF4),
        BlockPointer(hi=0x88B7B1C, lo=0x88B7B20),
        BlockPointer(hi=0x88B7B6C, lo=0x88B7B70),
        BlockPointer(hi=0x88B7B98, lo=0x88B7B9C),
        BlockPointer(hi=0x88B7BC4, lo=0x88B7BC8),
        BlockPointer(hi=0x88B8B00, lo=0x88B8B04),
        BlockPointer(hi=0x88B8B3C, lo=0x88B8B44),
        BlockPointer(hi=0x88B8D64, lo=0x88B8D68),
        BlockPointer(hi=0x88BC754, lo=0x88BC758),
        BlockPointer(hi=0x88BC794, lo=0x88BC798),
        BlockPointer(hi=0x88BC7D8, lo=0x88BC7DC),
        BlockPointer(hi=0x88BC970, lo=0x88BC978),
        BlockPointer(hi=0x88BCF8C, lo=0x88BCF90),
        BlockPointer(hi=0x88BD090, lo=0x88BD094),
        BlockPointer(hi=0x88BF89C, lo=0x88BF8A4),
        BlockPointer(hi=0x88BFC04, lo=0x88BFC08),
        BlockPointer(hi=0x88BFC80, lo=0x88BFC84),
        BlockPointer(hi=0x88C0288, lo=0x88C028C),
        BlockPointer(hi=0x88C02F0, lo=0x88C02F4),
        BlockPointer(hi=0x88C1384, lo=0x88C1388),
        BlockPointer(hi=0x88C16D4, lo=0x88C16D8),
        BlockPointer(hi=0x88C1A2C, lo=0x88C1A30),
        BlockPointer(hi=0x88C1B50, lo=0x88C1B54),
        BlockPointer(hi=0x88C1B8C, lo=0x88C1B90),
        BlockPointer(hi=0x88C1E28, lo=0x88C1E2C),
        BlockPointer(hi=0x88C1EA4, lo=0x88C1EA8),
        BlockPointer(hi=0x88C1F08, lo=0x88C1F0C),
        BlockPointer(hi=0x88C1F3C, lo=0x88C1F40),
        BlockPointer(hi=0x88C1F78, lo=0x88C1F7C),
        BlockPointer(hi=0x88C1FAC, lo=0x88C1FB0),
        BlockPointer(hi=0x88C1FE0, lo=0x88C1FE4),
        BlockPointer(hi=0x88C2014, lo=0x88C2018),
        BlockPointer(hi=0x88C2054, lo=0x88C2058),
        BlockPointer(hi=0x88C2088, lo=0x88C208C),
        BlockPointer(hi=0x88C20C0, lo=0x88C20C4),
        BlockPointer(hi=0x88C20F4, lo=0x88C20F8),
        BlockPointer(hi=0x88C2128, lo=0x88C212C),
        BlockPointer(hi=0x88C215C, lo=0x88C2160),
        BlockPointer(hi=0x88C2198, lo=0x88C219C),
        BlockPointer(hi=0x88C2228, lo=0x88C222C),
        BlockPointer(hi=0x88C2404, lo=0x88C2408),
        BlockPointer(hi=0x88C25E8, lo=0x88C25EC),
        BlockPointer(hi=0x88C2BC0, lo=0x88C2BC4),
        BlockPointer(hi=0x88C2D08, lo=0x88C2D0C),
        BlockPointer(hi=0x88C2E18, lo=0x88C2E1C),
        BlockPointer(hi=0x88C2E48, lo=0x88C2E4C),
        BlockPointer(hi=0x88C2E80, lo=0x88C2E84),
        BlockPointer(hi=0x88C49C4, lo=0x88C49C8),
        BlockPointer(hi=0x88C4C18, lo=0x88C4C1C),
        BlockPointer(hi=0x88C5364, lo=0x88C5368),
        BlockPointer(hi=0x88C6C1C, lo=0x88C6C20),
        BlockPointer(hi=0x88C6D10, lo=0x88C6D14),
        BlockPointer(hi=0x88C7A88, lo=0x88C7A8C),
        BlockPointer(hi=0x88C7B04, lo=0x88C7B08),
        BlockPointer(hi=0x88C7B78, lo=0x88C7B7C),
        BlockPointer(hi=0x88C7C0C, lo=0x88C7C10),
        BlockPointer(hi=0x88C7C74, lo=0x88C7C78),
        BlockPointer(hi=0x88D9C88, lo=0x88D9C8C),
        BlockPointer(hi=0x88DB4A8, lo=0x88DB4AC),
        BlockPointer(hi=0x88DB4F0, lo=0x88DB4F4),
        BlockPointer(hi=0x88DCE20, lo=0x88DCE24),
        BlockPointer(hi=0x88DCE58, lo=0x88DCE5C),
        BlockPointer(hi=0x88DCED4, lo=0x88DCED8),
        BlockPointer(hi=0x88DCF28, lo=0x88DCF2C),
        BlockPointer(hi=0x88DCF5C, lo=0x88DCF60),
        BlockPointer(hi=0x88DCF8C, lo=0x88DCF90),
        BlockPointer(hi=0x88DD140, lo=0x88DD144),
        BlockPointer(hi=0x88DDEC4, lo=0x88DDEC8),
        BlockPointer(hi=0x88DDF80, lo=0x88DDF84),
        BlockPointer(hi=0x88DDFB8, lo=0x88DDFBC),
        BlockPointer(hi=0x88DE044, lo=0x88DE048),
        BlockPointer(hi=0x88DE090, lo=0x88DE094),
        BlockPointer(hi=0x88DE130, lo=0x88DE134),
        BlockPointer(hi=0x88DE278, lo=0x88DE27C),
        BlockPointer(hi=0x88DE2FC, lo=0x88DE300),
        BlockPointer(hi=0x88DE354, lo=0x88DE358),
        BlockPointer(hi=0x88DE414, lo=0x88DE418),
        BlockPointer(hi=0x88E1520, lo=0x88E1524),
        BlockPointer(hi=0x88EBB3C, lo=0x88EBB44),
        BlockPointer(hi=0x88F090C, lo=0x88F0910),
        BlockPointer(hi=0x88F0920, lo=0x88F0924),
        BlockPointer(hi=0x88F0AB0, lo=0x88F0AB4),
        # used in npc_name_fix
        BlockPointer(npc_name_fix_ptr, npc_name_fix_ptr + 4, no_reloc=True),
    ],
    'topx_prx_cook_help.txt': [
        BlockPointer(0x088c4bb4, 0x088c4bb8),
    ],
    'topx_prx_cook_name.txt': [
        BlockPointer(0x088c1880, 0x088c1884),
        BlockPointer(0x088c18bc, 0x088c18c0),
        BlockPointer(0x088c18f8, 0x088c18fc),
        BlockPointer(0x088c4b7c, 0x088c4b80),
    ],
    'topx_prx_cook_msg.txt': [
        BlockPointer(0x088c118c, 0x088c1190),
        BlockPointer(0x088c11f4, 0x088c11fc),
    ],
    'topx_prx_grade_shop.txt': [
        BlockPointer(0x088ba218, 0x088ba21c),
        BlockPointer(0x088ba258, 0x088ba25c),
        BlockPointer(0x088ba288, 0x088ba28c),
        BlockPointer(0x088ba2b8, 0x088ba2bc),
    ],
    'topx_prx_mon_mes.txt': [
        BlockPointer(0x088f053c, 0x088f0540),
        BlockPointer(0x088f0834, 0x088f0838),
        BlockPointer(0x088f08b0, 0x088f08b4),
        BlockPointer(0x088f0b24, 0x088f0b28),
        BlockPointer(0x088f0b88, 0x088f0b8c),
        BlockPointer(0x088f0cc8, 0x088f0ccc),
        BlockPointer(0x088f0d4c, 0x088f0d50),
        BlockPointer(0x088f0dbc, 0x088f0dc0),
        BlockPointer(0x088f0ed8, 0x088f0edc),
        BlockPointer(0x088f108c, 0x088f1090),
        BlockPointer(0x088f1208, 0x088f120c),
        BlockPointer(0x088f1270, 0x088f1274),
        BlockPointer(0x088f12d4, 0x088f12d8),
    ],
    'topx_prx_mon_name.txt': [
        BlockPointer(0x088f05f8, 0x088f05fc),
    ],
    'topx_prx_shop_name.txt': [
        BlockPointer(0x088dab14, 0x088dab1c),
    ],
    'topx_prx_opr08.txt': [
        BlockPointer(0x088cc090, 0x088cc094),
    ],
    'topx_prx_opr14.txt': [
        BlockPointer(0x088cc0d0, 0x088cc0d4),
    ],
    'topx_prx_spc08.txt': [
        BlockPointer(0x08c2e832, 0x08c2e830),
        BlockPointer(0x08c2e842, 0x08c2e840),
        BlockPointer(0x08c2e852, 0x08c2e850),
        BlockPointer(0x08c2e872, 0x08c2e870),
        BlockPointer(0x08c2e8d2, 0x08c2e8d0),
        BlockPointer(0x08c2e8e2, 0x08c2e8e0),
        BlockPointer(0x08c2e8f2, 0x08c2e8f0),
        BlockPointer(0x08c2e912, 0x08c2e910),
        BlockPointer(0x08c2e942, 0x08c2e940),
        BlockPointer(0x08c2e952, 0x08c2e950),
        BlockPointer(0x08c2e962, 0x08c2e960),
        BlockPointer(0x08c2e9a2, 0x08c2e9a0),
    ],
    'topx_prx_spc12.txt': [
        BlockPointer(0x08c2e8a2, 0x08c2e8a0),
        BlockPointer(0x08c2e8b2, 0x08c2e8b0),
        BlockPointer(0x08c2e8c2, 0x08c2e8c0),
        BlockPointer(0x08c2e902, 0x08c2e900),
    ],
    'topx_prx_spc14.txt': [
        BlockPointer(0x08c2e802, 0x08c2e800),
        BlockPointer(0x08c2e812, 0x08c2e810),
        BlockPointer(0x08c2e822, 0x08c2e820),
        BlockPointer(0x08c2e862, 0x08c2e860),
    ],
    'topx_prx_spc_help.txt': [
        BlockPointer(0x088def28, 0x088def2c),
    ],
    'topx_prx_misc3.txt': [
        BlockPointer(0x08831034, 0x08831038),
    ],
    'topx_prx_main_menu.txt': [
        BlockPointer(0x088b3f6c, 0x088b3f84),
    ],
    'save_cancel': [
        BlockPointer(0x088b2f50, 0x088b2f5c),
    ],
    'load_cancel': [
        BlockPointer(0x088b31f0, 0x088b31fc),
    ],
    'erase_cancel': [
        BlockPointer(0x088b3294, 0x088b32a0),
    ],
    'save_title': [
        BlockPointer(0x0892e458, 0x0892e46c),
    ],
    'new_save_title': [
        BlockPointer(0x0892e544, 0x0892e554),
    ],
    'playtime_str': [
        BlockPointer(0x088b2dfc, 0x088b2e14),
    ],
    'no_ms_inserted': [
        BlockPointer(0x0892f1c4, 0x0892f1d0),
    ],
    'ms_space_error': [
        BlockPointer(0x0892f370, 0x0892f37c),
    ],
    'continue_anyway': [
        BlockPointer(0x0892f394, 0x0892f3a0),
    ],
}

files = [
    Block('topx_prx_battle_jap.txt', 0x1ab0e4),
    Block('topx_prx_title_descs_jap.txt', 0x1ad7c8),
    Block('topx_prx_item_descs_jap.txt', 0x1ce288),
    Block('topx_prx_titles_jap.txt', 0x1AE910, True),
    Block('topx_prx_items_jap.txt', 0x1d3060, True),
    Block('topx_prx_misc_jap.txt', 0x443F38, True),
    Block('topx_prx_misc2_jap.txt', 0x4446B0),
    Block('topx_prx_cook_help.txt', 0x1af20c),
    Block('topx_prx_cook_name.txt', 0x1afe88, True),
    Block('topx_prx_cook_msg.txt', 0x1af7c4),
    Block('topx_prx_grade_shop.txt', 0x1b8c40),
    Block('topx_prx_mon_mes.txt', 0x461164),
    Block('topx_prx_mon_name.txt', 0x4612d4, True),
    Block('topx_prx_shop_name.txt', 0x4283a0),
    Block('topx_prx_opr08.txt', 0x423480, True),
    Block('topx_prx_opr14.txt', 0x423518),
    Block('topx_prx_spc08.txt', 0x429ecc, True),
    Block('topx_prx_spc12.txt', 0x42a35c, True),
    Block('topx_prx_spc14.txt', 0x42a4e4, True),
    Block('topx_prx_spc_help.txt', 0x428b3c),
    Block('topx_prx_misc3.txt', 0x1aafb4, True),
    Block('topx_prx_main_menu.txt', 0x444688, True),
]

def process_block(fname, short=False):
    logger.info(f"Inserting {fname}...")
    fname = target_dir / fname
    strings = TextReader(fname, encoding="utf-8", mode="bare").strings

    pointers = []
    block = BytesIO()

    want_wrap = fname.match('*desc*') or fname.match('*_help*') or fname.match('*_opr14*')

    for num, s in enumerate(strings):
        logger.debug(f'Inserting:\n{s}')

        if want_wrap:
            s = wrapper.wrap(s, 9999)
            s = re.sub(r'\b(A|An)\b ', '\\1_', s)
            s = re.sub(r'#(\d) ', '#\\1_', s)

        if (fname.stem, num) in sprintf_strings:
            sprintf_string = True
            # convert to raw ascii
            s = s.replace('%s', '{25}{73}')
        else:
            sprintf_string = False

        s = convert_string(s, short or sprintf_string)

        if sprintf_string:
            if len(s) % 2:
                s += b'\x00'

        pointers += [block.tell()]
        block.write(s)

    pointers = [struct.pack('<H', x) for x in pointers]

    buf = block.getvalue()
    block.close()

    return pointers, buf

def insert_save_strings(queue):
    fname = target_dir / 'top_prx_save.txt'
    pos = 0x191bf8  # use the slack in sceNid section
    strings = TextReader(fname, mode='bare').strings
    ids = ['save_cancel', 'load_cancel', 'erase_cancel', 'save_title', 'new_save_title', 'playtime_str', 'no_ms_inserted', 'ms_space_error', 'continue_anyway',]
    assert len(strings) == len(ids)

    for s_id, s in zip(ids, strings):
        ptrs = text_refs.get(s_id)

        if not ptrs:
            logger.warning(f'unknown string: {s_id}')
            continue

        if padding := pos % 4:
            pos += 4 - padding

        s = s.replace('{END}', '')
        # NOTE: might be a problem for other languages
        s = s.encode('shift-jis') + b'\x00'

        if s_id in ['no_ms_inserted', 'ms_space_error']:
            # trademark symbol
            s = s.replace(b'{81}{7F}', b'\x81\x7f')
            # force cr/lf
            s = s.replace(b'\x0a', b'\x0a\x0d')

        ptr_offset = pos + eboot_base - reloc_base
        hi = ptr_offset >> 16
        lo = ptr_offset & 0xffff

        if lo >= 0x8000:
            hi += 1

        for ptr in ptrs:
            queue += [Pointer(ptr.hi, hi)]
            queue += [Pointer(ptr.lo, lo)]

        queue += [(pos, [s])]
        pos += len(s)

def insert_menus(eboot_fname, text_fname):
    with open(text_fname, 'ab') as out:
        queue = []

        for block in files:
            block_fname = Path(block.fname)
            short = block.short
            first_ptrs = text_refs.get(block_fname.name)

            if not first_ptrs:
                logger.error(f'unknown block {block_fname}')
                continue

            block_start = out.tell()
            logger.info(f'Inserting {block_fname} @ {block_start:X} ({block_start + text_base:X})')
            logger.info(f'\tfirst string: {block_start:X} ({block_start + text_base:X})')

            text_ptrs, buf = process_block(block_fname, short)

            out.write(buf)
            queue += [(block.ptr_table, text_ptrs)]

            # make sure blocks are word-aligned
            if padding := out.tell() % 4:
                out.write(b'\x00' * (4 - padding))

            block_start += text_base

            for ptr in first_ptrs:
                raw_address = ptr.hi - ptr.lo == 2

                ptr_offset = block_start + ptr.offset

                if not ptr.no_reloc:
                    ptr_offset -= reloc_base

                hi = ptr_offset >> 16
                lo = ptr_offset & 0xffff

                if not raw_address and lo >= 0x8000:
                    hi += 1

                queue += [Pointer(ptr.hi, hi)]
                queue += [Pointer(ptr.lo, lo)]

        if out.tell() > max_size:
            logger.error(f'file overflows by {out.tell() - max_size} bytes')

    insert_save_strings(queue)

    with open(eboot_fname, 'r+b') as out:
        for ptr in queue:
            if isinstance(ptr, Pointer):
                out.seek(ptr.address)
                out.write(ptr.value)
            elif isinstance(ptr, tuple):
                offs, data = ptr
                out.seek(offs)
                out.write(b''.join(data))

if __name__ == '__main__':
    insert_menus(eboot_path, data_path)
