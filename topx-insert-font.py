#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct

from pathlib import Path
from libs.TilesetEncoder import TilesetEncoder
from libs.widthcalc import widthcalc
from libs.util import paths
from PIL import Image

import click

out_dir = paths['out']

def chunks(l, n):
    return [l[i:i+n] for i in range(0, len(l), n)]

def swap_bytes(in_buf):
    buf = [struct.pack('BB', x[1], x[0]) for x in chunks(in_buf, 2)]
    buf = b''.join(buf)
    return buf

@click.command
@click.argument('fname')
def convert_raw_font(fname):
    out = out_dir / 'sys_02.bin'
    xsize = 16
    ysize = 14

    img = Image.open(fname).convert('1')
    tileset = TilesetEncoder(img, mode=swap_bytes, xsize=xsize, ysize=ysize, ypadding=2).tileset
    out.write_bytes(tileset)

    width_name = out.with_stem(out.stem + '-widths')
    generate_width_table(fname, width_name)

def generate_width_table(fname, out_name):
    xsize = 16
    ysize = 14 + 2

    img = Image.open(fname).convert('1')

    # crop the kanji part
    # NOTE: you need to change these two lines if you added new glyphs
    img = img.crop((0, 0, 256, 144))
    widths = widthcalc(img, xsize=xsize, ysize=ysize, cnt=0x90).widths

    widths[0] = 4  # space
    widths[0x6B] = 12  # katakana "no"
    widths[0x6E] = 4  # non-breaking space
    widths[0x6F] = 12  # katakana "ku"

    widths = [struct.pack('B', x) for x in widths]
    widths = b''.join(widths)
    Path(out_name).write_bytes(widths)

if __name__ == '__main__':
    convert_raw_font()
