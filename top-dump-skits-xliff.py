#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
import re
import json

from pathlib import Path
from itertools import count

from TextDecoder import TextDecoder
from translate.storage import xliff

from loguru import logger

decoder = TextDecoder('top.tbl', encoding="utf-8")

names = [
    'Cless',
    'Mint',
    'Arche',
    'Klarth',
    'Chester',
    'Suzu',
]

artes = {
    0x8100: "Demon Fang",
    0x8200: "Swallow Dance",
    0x8300: "Lightning Tiger Blade",
    0x8400: "Sword Rain: Alpha",
    0x8500: "Tiger Blade",
    0x8600: "Rising Phoenix",
    0x8700: "<Beast>",
    0x8800: "Light Spear",
    0x8900: "Chaos Blade",
    0x8A00: "Void Shift",
    0x8B00: "Distortion Blade",
    0x8C00: "Void Tempest",
    0x8D00: "Hell Pyre",
    0x8E00: "Guardian Field",
    0x8F00: "<Coil>",
    0x9000: "<Focus>",
    0x9100: "<Center>",
    0x9200: "Final Fury",
    0x9300: "Demonic Swallow Kick",
    0x9400: "Demonic Tiger Blade",
    0x9500: "Demonic Sword Rain",
    0x9600: "Demon Spear",
    0x9700: "Beast Swallow Kick",
    0x9800: "Beast Blade",
    0x9900: "Beast Sword Rain",
    0x9A00: "Beast Spear",
    0x9B00: "Lightning Swallow Kick",
    0x9C00: "Lightning Tiger Blast",
    0x9D00: "Lightning Tiger Thrust",
    0x9E00: "Lightning Tiger Spear",
    0x9F00: "Phoenix Dance",
    0xA000: "Phoenix Blade",
    0xA100: "Phoenix Sword Rain",
    0xA200: "Phoenix Spear",
    0xA300: "Chaos Distortion Blade",
    0xA400: "Chaotic Void",
    0xA500: "Hell Flare",
    0xA600: "Ice Fang",
    0xA700: "Thunder Blitz",
    0xA800: "Eagle Shot",
    0xA900: "Gale Shot",
    0xAA00: "Sonic Bash",
    0xAB00: "Wild Rain",
    0xAC00: "Giga Fang",
    0xAD00: "Dragon Slayer",
    0xAE00: "Mirror Image",
    0xAF00: "Hell Rush",
    0xB000: "Crow Blade",
    0xB100: "Shadow Storm",
    0xB200: "Secret Thief",
    0xB300: "Flare Blitz",
    0xB400: "Merciless Thunder",
    0xB500: "Omega Storm",
    0xB600: "Summon: Jiraiya",
    0xB700: "Fire Ball",
    0xB800: "Eruption",
    0xB900: "Fire Storm",
    0xBA00: "Explosion",
    0xBB00: "Lightning",
    0xBC00: "Thunder Blade",
    0xBD00: "Indignation",
    0xBE00: "Ice Needles",
    0xBF00: "Ice Tornado",
    0xC000: "Maelstrom",
    0xC100: "Tidal Wave",
    0xC200: "Stone Blast",
    0xC300: "Grave",
    0xC400: "Rock Mountain",
    0xC500: "Earthquake",
    0xC600: "Storm",
    0xC700: "Cyclone",
    0xC800: "Tempest",
    0xC900: "God's Breath",
    0xCA00: "Ray",
    0xCB00: "Big Bang",
    0xCC00: "Tractor Beam",
    0xCD00: "Meteor Storm",
    0xCE00: "Black Hole",
    0xCF00: "Sylph",
    0xD000: "Undine",
    0xD100: "Gnome",
    0xD200: "Efreet",
    0xD300: "Maxwell",
    0xD400: "Luna",
    0xD500: "Shadow",
    0xD600: "Aska",
    0xD700: "Volt",
    0xD800: "Origin",
    0xD900: "Gremlin Lair",
    0xDA00: "Pluto",
    0xDB00: "First Aid",
    0xDC00: "Heal",
    0xDD00: "Cure",
    0xDE00: "Nurse",
    0xDF00: "Revitalize",
    0xE000: "Antidote",
    0xE100: "Recover",
    0xE200: "Resurrection",
    0xE300: "Pow Hammer",
    0xE400: "Pow Pow Hammer",
    0xE500: "Acid Rain",
    0xE600: "Deep Mist",
    0xE700: "Silence",
    0xE800: "Time Stop",
    0xE900: "Charge",
    0xEA00: "Barrier",
    0xEB00: "Sharpness",
    0xEC00: "Dispell",
    0xED00: "Holy Wall",
    0xEE00: "Haste",
    0xEF00: "Delay",
    0xF000: "Stygian Blade",
}

def dump_block(buf):
    end = len(buf)
    pos = 0
    out = []

    while pos < end:
        c = buf[pos]

        match c:
            case 0x05:
                num = struct.unpack_from('<H', buf, pos + 1)[0]
                pos += 3
                out += [f'<speed_{num:04X}>']
            case 0x06:
                num = struct.unpack_from('<H', buf, pos + 1)[0]
                pos += 3
                out += [f'<color_{num:04X}>']
            case 0x07:
                num = struct.unpack_from('<H', buf, pos + 1)[0]
                name = names[num - 1]
                pos += 3
                out += [f'<{name}>']
            case 0x08:
                num = struct.unpack_from('>H', buf, pos + 1)[0]
                pos += 3
                out += [f'<item_{num:04X}>']
            case 0x09:
                num = struct.unpack_from('>H', buf, pos + 1)[0]
                name = artes[num]
                pos += 3
                out += [name]
                # out += [f'<var_{num:04X}>']
            case 0x0A:
                num = struct.unpack_from('<I', buf, pos + 1)[0]
                pos += 5
                out += [f'<num1_{num:08X}>']
            case 0x0B:
                num = struct.unpack_from('<I', buf, pos + 1)[0]
                pos += 5
                out += [f'<num2_{num:08X}>']
            case 0x0C:
                num = struct.unpack_from('<I', buf, pos + 1)[0] & 0xFFFFFF
                pos += 5
                out += [f'<num3_{num:08X}>']
            case 0x0d:
                num = struct.unpack_from('<I', buf, pos + 1)[0] & 0xFFFFFF
                pos += 5
                out += [f'<num4_{num:08X}>']
            case 0x0E:
                num = struct.unpack_from('<I', buf, pos + 1)[0] & 0xFFFFFF
                pos += 5
                out += [f'<num5_{num:08X}>']
            case 0x0F:
                num = struct.unpack_from('B', buf, pos + 1)[0]
                pos += 2
                out += [f'<wait_{num:02X}>']
            case _:
                tmp = decoder.convert(buf[pos:pos + 1])
                out += [tmp]

                pos += 1

    out = ''.join(out)
    return out

if __name__ == '__main__':
    s_id = count(1)
    f_id = count(1)

    for i in range(1105, 1363):
        file_num = next(f_id)
        xlf_file = xliff.xlifffile()
        xlf_file.setsourcelanguage('ja')
        xlf_file.settargetlanguage('en-US')
        fname = Path(f'orig/top_{i:04d}.bin')
        logger.info(f'Dumping {fname}...')
        buf = fname.read_bytes()

        start = buf.rindex(b'\x80\x00\xc0\x00')
        buf = buf[start + 4:].lstrip(b'\x00')

        buf = dump_block(buf)

        strings = re.split(r'{END}\n\n', buf)

        if strings[-1] == '':
            strings = strings[:-1]

        for s in strings:
            num = f'skit_{next(s_id):03d}'
            unit = xliff.xliffunit(source=s)
            unit.settarget(s)
            unit.setid(num)
            xlf_file.addunit(unit)

        with open(f'xlif/{file_num:03d}.xlf', "wb") as out:
            xlf_file.serialize(out)
