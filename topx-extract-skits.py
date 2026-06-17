#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct

from pathlib import Path
from libs.util import paths, logger

orig_dir = paths['orig']

ptr_table = 0x08c5d20c
eboot_base = 0x08803FAC
reloc_base = 0x8804000

buf = Path(orig_dir, 'PSP_GAME/USRDIR/top.prx').read_bytes()

for i in range(1, 259):
    logger.info(f'extracting block {i}')
    ptr_addr = ptr_table - eboot_base + (4 * i)
    logger.debug(f'{ptr_addr=:X}')
    offs = struct.unpack_from('<I', buf, ptr_addr)[0] + reloc_base - eboot_base
    logger.debug(f'{offs=:X}')
    size = struct.unpack_from('<I', buf, offs + 4)[0]
    logger.debug(f'{size=:X}')
    chunk = buf[offs:offs + size]

    Path(f'skits/{i}.bin').write_bytes(chunk)
