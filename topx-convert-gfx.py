#!/usr/bin/env python3
# -*- coding=utf-8 -*-

from pathlib import Path

from png2tim import convert_to_tim
from png2gim import convert_to_gim
from png2tex import convert_to_tex
from libs.util import paths, logger

out_dir = paths['out']

tims = [
    'sys_00.png',
    'sys_01.png',
    'nmap_main_02.png',
    'e_00.png',
    'wo_tim_01.png',
    'wo_tim_02.png',
    'wo_tim2_01.png',
    'wo_tim2_02.png',
    'grade_01.png',
    'grade_02.png',
    'ttl_dat_00.png',
    'ttl_dat_01.png',
    'ttl_dat_07.png',
    'op_tim0_02.png',
    # 'field0_01_008.png',
]

gims = [
    'e_25.png',
]

texs = [
    'logos_03.png',
]

def convert_gfx(files, handler):
    for fname in files:
        logger.info(f'Converting {fname}...')
        fname = Path(fname)
        dest_path = out_dir / fname.with_suffix('.bin').name
        handler(fname, dest_path)

        # # copy duplicate map/compass
        # if fname.stem == 'field0_01_008':
        #     copies = [out_dir / f'field{fnum}_{cnum:02d}_008.bin' for fnum in range(3) for cnum in range(1, 4)]
        #
        #     for copy_path in copies:
        #         # skip original
        #         if copy_path.stem == 'field0_01_008':
        #             continue
        #
        #         shutil.copy(dest_path, copy_path)

if __name__ == '__main__':
    convert_gfx(tims, convert_to_tim)
    convert_gfx(gims, convert_to_gim)
    convert_gfx(texs, convert_to_tex)
