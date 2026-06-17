#!/usr/bin/env python3
# -*- coding=utf-8 -*-

from pathlib import Path
from PIL import Image
from loguru import logger

x_size = 16
y_size = 14
glyph_size = 28

def chunks(l, n):
    return [l[i:i+n] for i in range(0, len(l), n)]

def decode_glyph(chunk):
    logger.debug(f'{type(chunk)=}')
    logger.debug(f'{len(chunk)=}')
    glyph = Image.frombytes("1", (x_size, y_size), chunk)
    tile1 = glyph.copy().crop((x_size // 2, 0, x_size, y_size))
    tile2 = glyph.copy().crop((0, 0, x_size // 2, y_size))
    glyph.paste(tile1, (0, 0))
    glyph.paste(tile2, (x_size // 2, 0))
    return glyph

def get_glyphs(fname):
    tiles = []
    buf = Path(fname).read_bytes()
    end = len(buf)
    tiles = chunks(buf, glyph_size)
    tiles = [decode_glyph(tile) for tile in tiles]

    return tiles

if __name__ == '__main__':
    tiles = get_glyphs('sys_02.decomp')
    count = len(tiles)
    rows = count // 16

    if count % 16:
        rows += 1

    out_img = Image.new('1', (x_size * 16, (y_size + 2) * rows))

    tile_pos = [(x, y) for y in range(0, out_img.size[1], y_size + 2)
            for x in range(0, out_img.size[0], x_size)]

    for i in range(count):
        logger.info(f'dumping glyph {i}')
        xpos, ypos = tile_pos[i]
        out_img.paste(tiles[i], (xpos, ypos))

    out_img.save('topx-font.png')

