#!/usr/bin/env python

import struct

from pathlib import Path
from TextDecoder import TextDecoder
from translate.storage import xliff, tmx
from libs.util import logger

decoder_eng = TextDecoder('top-eng.tbl', encoding='utf-8')
decoder_jap = TextDecoder('top.tbl', encoding='utf-8')

def dump_file(fname, jap=False):
    strings = []
    buf = Path(fname).read_bytes()

    name = buf[:20]

    if jap:
        name = name.decode('shift-jis')
    else:
        name = decoder_eng.convert(name)

    name = name.rstrip()
    strings += [(f'{fname.stem}:0', name)]

    # attack_offs = [0x8c, 0x1cc, 0x228, 0x284, 0x2e0, 0x33c, 0x398, 0x3f4, 0x450]
    attack_offs = [0x8c, 0xb4]
    attack_offs += list(range(0x114, 0x500, 0x5c))

    for offs in attack_offs:
        logger.debug(f'{offs:X}')
        if buf[offs] == 0:
            continue

        logger.debug(f'{fname=}')
        # logger.debug(f'{name=}')
        logger.debug(f'offs: {offs:X}')

        if jap:
            end = buf.index(b'\x00\x00', offs)

            # workaround for cutting off too early
            if end % 2:
                end += 1

            attack = buf[offs:end]
            attack = decoder_jap.convert(attack)
        else:
            end = buf.index(b'\x00', offs)

            # workaround for artes using 09 tags being cut off
            if buf[offs] == 9:
                end += 1

            attack = buf[offs:end]
            attack = decoder_eng.convert(attack)

        strings += [(f'{fname.stem}:{offs:x}', attack)]

        logger.debug(f'{attack=}')

    return strings

def dump_monsters(dir_name, jap=False):
    files = Path(dir_name).glob('*_08.decomp')

    strings = []

    for fname in sorted(files):
        strings += dump_file(fname, jap=jap)

    return strings

def write_xlf(fname, strings):
    xlf_file = xliff.xlifffile()
    xlf_file.setsourcelanguage('ja')
    xlf_file.settargetlanguage('en-US')

    for s_id, s in strings:
        unit = xliff.xliffunit(source=s)
        unit.settarget(s)
        unit.setid(s_id)
        xlf_file.addunit(unit)

    with open(fname, "wb") as out:
        xlf_file.serialize(out)

def write_txt(fname, strings):
    strings = [s + '{END}\n\n' for s_id, s in strings]
    strings = ''.join(strings)
    Path(fname).write_text(strings)

def write_tmx(fname, units):
    tmxfile = tmx.tmxfile()

    for source, translation in units:
        logger.debug(f'{source=}')
        logger.debug(f'{translation=}')
        if source == translation:
            continue

        tmxfile.addtranslation(source, "ja", translation, "en-US")

    tmxfile.savefile(fname)

def write_glossary(fname, units):
    units = [f'{orig}\t{trans}' for orig, trans in units]
    units = '\n'.join(units)
    Path(fname).write_text(units)

if __name__ == '__main__':
    blocks = [
        ('psx/monsters/jap', True, 'top_psx_monsters_jap'),
        ('psx/monsters/usa', False, 'top_psx_monsters_usa'),
        ('monsters', True, 'topx_monsters_jap'),
    ]

    files = {}

    for *args, out_name in blocks:
        strings = dump_monsters(*args)
        write_xlf(f'{out_name}.xlf', strings)
        write_txt(f'{out_name}.txt', strings)
        files[out_name] = strings

    orig = [s for s_id, s in files['top_psx_monsters_jap']]
    trans = [s for s_id, s in files['top_psx_monsters_usa']]

    assert len(orig) == len(trans)

    write_tmx('top_psx_monsters.tmx', zip(orig, trans))
    write_glossary('top_psx_monsters.utf8', zip(orig, trans))
