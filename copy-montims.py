#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import shutil
from dataclasses import dataclass

from libs.TextReader import TextReader

from pathlib import Path
from libs.util import paths, logger

target_dir = paths['target']
ext_dir = paths['extracted']
out_dir = paths['out']

special = {
    # Squid
    46: 2,
    # Peepit
    47: 6,
    # Oakrot
    64: 2,
    # Giant Scorpion
    66: 2,
    # Will O' Whisp
    67: 1,
    # Green Roper
    69: 5,
    # Mighty Oak
    75: 2,
    # Chirpee
    87: 6,
    # Woodkarla
    94: 2,
    # Red Roper
    109: 5,
    # Deathstalker
    116: 2,
    # Ignis Fatuus
    127: 1,
    # A.C. Roper
    130: 5,
    # Giant Squid
    132: 2,
    # Blue Roper
    135: 5,
    # Treant
    144: 2,
    # Cawker
    163: 6,
    # Fire Bug
    174: 1,
    # Darkeye?
    190: 2,
    # Roameye?
    191: 2,
    # Sealeye?
    192: 2,
    # Clay Golem
    212: 2,
    # Phoenix
    219: 2,
    # Manta
    221: 2,
    # Kraken
    227: 1,
    # Draco-Centaur
    231: 2,
}

@dataclass
class Monster:
    name: str
    book_id: int
    enemy_id: int

    def enemy_fname(self):
        suffix = special.get(self.enemy_id, 0)
        logger.debug(f'{suffix=}')
        return f't{self.enemy_id:03d}_{suffix:02d}.png'

    def montim_fname(self):
        fnum = self.book_id // 0x20
        mnum = self.book_id % 0x20
        return f'montim{fnum}_{mnum:02d}.png'

mon_book_names = TextReader(target_dir / 'menu/topx_prx_mon_name.txt', mode='bare').strings
mon_names = TextReader(target_dir / 'menu/topx_monster_names.txt', mode='bare').strings

order = [Monster(name=x.replace('{END}', ''), book_id=mon_book_names.index(x), enemy_id=num) for num, x in enumerate(mon_names, 1) if x in mon_book_names]
replacements = [(x.name, x.enemy_fname(), x.montim_fname()) for x in order]
changed = []

for name, enemy_fname, montim_fname in replacements:
    logger.debug(f'{name=}')
    logger.debug(f'{enemy_fname=}')
    logger.debug(f'{montim_fname=}')
    src = ext_dir / 'monsters' / enemy_fname
    dest = out_dir / 'monsterbook' / montim_fname

    shutil.copy(src, dest)
