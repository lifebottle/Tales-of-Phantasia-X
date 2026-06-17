#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
import click

from pathlib import Path
from PIL import Image
from libs.widthcalc import widthcalc
from libs.util import paths

out_dir = paths['out']

@click.command
@click.argument('fname')
def generate_width_table_menu(fname):
    out_name = out_dir / 'sys_00-widths.bin'

    img = Image.open(fname)
    # NOTE: you need to change these two lines if you added new glyphs
    img = img.crop((0, 128, 256, 128 + 40))
    widths = widthcalc(img, cnt=0x90, xsize=8, ysize=8, bgcol=0).widths

    widths[0] = 3  # space
    widths[0x5D] = 8 # our spacer
    widths[0x1D] = 8 # colon, make sure it's the same width as above spacer
    widths[0x12] = 8 # 0
    widths[0x13] = 8 # 1
    widths[0x14] = 8 # 2
    widths[0x15] = 8 # 3
    widths[0x16] = 8 # 4
    widths[0x17] = 8 # 5
    widths[0x18] = 8 # 6
    widths[0x19] = 8 # 7
    widths[0x1A] = 8 # 8
    widths[0x1B] = 8 # 9
    widths[0x6F] = 1 # 1px spacer

    widths = [struct.pack('B', x) for x in widths]
    widths = b''.join(widths)
    Path(out_name).write_bytes(widths)

if __name__ == '__main__':
    generate_width_table_menu()
