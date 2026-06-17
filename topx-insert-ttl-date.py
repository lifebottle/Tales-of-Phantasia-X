#!/usr/bin/env python
# -*- coding=utf-8 -*-

import os

from datetime import datetime
from pathlib import Path

from PIL import Image
from libs.TextEncoder import TextEncoder

import click

encoder = TextEncoder('topx-ttl.tbl')

@click.command
@click.argument('font_name')
def insert_date(font_name):
    out_name = 'ttl_dat_01.png'
    img = Image.open(font_name)
    date = datetime.now().strftime('%Y')
    text = f'@_{date} LIFE BOTTLE'

    if version := os.environ.get('TOPX_VERSION'):
        text += f' {version}'

    tiles = []
    xsize = 16
    ysize = 16

    for y in range(0, img.size[1], ysize):
        for x in range(0, img.size[0], xsize):
            tmp = img.copy()
            tile = tmp.crop((x, y, x + xsize, y + ysize))
            tile = tile.convert('P').tobytes().replace(b'\xff', b'\x0f')
            tile = Image.frombytes('P', (xsize, ysize), tile)
            tiles += [tile]

    out_img = Image.open('ttl_dat_01-eng.png')
    width_name = Path(font_name).with_suffix('.bin')
    width_name = width_name.with_stem(width_name.stem + '-widths')
    widths = width_name.read_bytes()

    posx = 5
    posy = 56

    for s in encoder.convert(text):
        out_img.paste(tiles[s], (posx, posy))
        posx += widths[s]

    out_img.save(out_name, 'PNG')


if __name__ == '__main__':
    insert_date()
