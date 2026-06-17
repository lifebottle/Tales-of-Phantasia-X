#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
import re

from libs.TextEncoder import TextEncoder
from .util import logger

encoder_8 = TextEncoder('topx-menu-eng.tbl', encoding='utf-8')
encoder_16 = TextEncoder("topx-dialogue-eng.tbl", encoding="utf-8")

def convert_string(s, short=False):
    pos = 0
    conv = []
    tbl = encoder_8.tbl if short else encoder_16.tbl
    opcode_len = 'B' if short else '<H'

    s = s.replace("<'s/'>", "'s")
    s = s.replace("<a/an>", "")
    s = s.replace("<A/An>", "")
    s = s.replace("<center>", "")
    s = s.replace("<right>", "")
    s = s.replace("<reset>", "")
    s = s.replace("<endalign>", "")
    s = s.replace("<endtag>", "")
    s = re.sub(r'(?<!-)--(?!-)', '—', s)

    while pos < len(s):
        found = tbl.has(s, pos)

        if found is not None:
            hex_tmp, st = found
            conv += [hex_tmp]
            pos += len(st)
        elif s[pos] == "{":
            hex_tmp = int(s[pos + 1:pos + 3], 16)
            conv += [struct.pack('B', hex_tmp)]
            pos += 4
        elif s.startswith("<speed_", pos):
            speed = int(s[pos + 7:pos + 11], 16)
            conv += [struct.pack(opcode_len, 5)]
            conv += [struct.pack('<H', speed)]
            pos += 12
        elif s.startswith("<color_", pos):
            color = int(s[pos + 7:pos + 11], 16)
            conv += [struct.pack(opcode_len, 6)]
            conv += [struct.pack('<H', color)]
            pos += 12
        elif s.startswith("<char_", pos):
            item = int(s[pos + 6:pos + 10], 16)
            conv += [struct.pack(opcode_len, 7)]
            conv += [struct.pack("<H", item)]
            pos += 11
        elif s.startswith("<audio_", pos):
            item = int(s[pos + 7:pos + 11], 16)
            conv += [struct.pack(opcode_len, 7)]
            conv += [struct.pack("<H", item)]
            pos += 12
        elif s.startswith("<item_", pos):
            item = int(s[pos + 6:pos + 10], 16)
            conv += [struct.pack(opcode_len, 8)]
            conv += [struct.pack(">H", item)]
            pos += 11
        elif s.startswith("<var_", pos):
            var = int(s[pos + 5:pos + 9], 16)
            conv += [struct.pack(opcode_len, 9)]
            conv += [struct.pack(">H", var)]
            pos += 10
        elif s.startswith("<num1_", pos):
            item = int(s[pos + 6:pos + 14], 16)
            conv += [struct.pack(opcode_len, 0xA)]
            conv += [struct.pack("<I", item)]
            pos += 15
        elif s.startswith("<num2_", pos):
            item = int(s[pos + 6:pos + 14], 16)
            conv += [struct.pack(opcode_len, 0xB)]
            conv += [struct.pack("<I", item)]
            pos += 15
        elif s.startswith("<num3_", pos):
            item = int(s[pos + 6:pos + 14], 16)
            conv += [struct.pack(opcode_len, 0xC)]
            conv += [struct.pack("<I", item)]
            pos += 15
        elif s.startswith("<num4_", pos):
            item = int(s[pos + 6:pos + 14], 16)
            conv += [struct.pack(opcode_len, 0xD)]
            conv += [struct.pack("<I", item)]
            pos += 15
        elif s.startswith("<num5_", pos):
            item = int(s[pos + 6:pos + 14], 16)
            conv += [struct.pack(opcode_len, 0xE)]
            conv += [struct.pack("<I", item)]
            pos += 15
        elif s.startswith("<wait_", pos):
            item = int(s[pos + 6:pos + 8], 16)
            conv += [struct.pack(opcode_len, 0xF)]
            conv += [struct.pack(opcode_len, item)]
            pos += 9
        else:
            logger.warning(f"Unknown char: '{s[pos]}'")
            debug = s[:pos] + '+++' + s[pos] + '+++' + s[pos + 1:]
            logger.warning(f"String: {debug}")
            pos += 1

    return b''.join(conv)

