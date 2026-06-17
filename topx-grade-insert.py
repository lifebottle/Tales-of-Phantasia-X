#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import json
import struct

from pathlib import Path

from PIL import Image

from libs.TextReader import TextReader
from libs.linewrap import TextWrapper
from libs.insertor import encoder_8
from libs.util import paths, logger

out_dir = paths['out']
target_dir = paths['target']

gradient = [9, 9, 9, 9, 9, 9, 9, 8, 6, 6, 5, 4, 3, 2]

def add_gradient(img):
    tmp = img.load()

    for y in range(img.size[1]):
        for x in range(img.size[0]):
            if tmp[x, y] == 0xff:
                tmp[x, y] = gradient[y]

    return img

def load_widths():
    wrapper = TextWrapper(out_dir / "sys_00-widths.bin")
    widths = wrapper.width_table

    extra_width = [
        b'\x64',  # s
        b'\x6b',  # s
        b'\x3f',  # N
        b'\x63',  # r
        b'\x3c',  # K
        b'\x69',  # x
        b'\x49',  # X
    ]

    for k in extra_width:
        widths[k] += 1

    widths[b'\x2d'] = 4  # colon

    nums = [
        b'\x22',  # 0
        b'\x23',  # 1
        b'\x24',  # 2
        b'\x25',  # 3
        b'\x26',  # 4
        b'\x27',  # 5
        b'\x28',  # 6
        b'\x29',  # 7
        b'\x2A',  # 8
        b'\x2B',  # 9
    ]

    for k in nums:
        widths[k] = 5

    return widths

def load_tiles():
    font = Image.open('topx-font-eng.png').convert('1').convert('P')
    tiles = []
    xsize = 16
    ysize = 16

    for y in range(0, font.size[1], ysize):
        for x in range(0, font.size[0], xsize):
            tmp = font.copy()
            tile = tmp.crop((x + 1, y, x + xsize, y + 14))
            tile = add_gradient(tile)
            tiles += [tile]

    tiles = tiles[:0x60]

    return tiles

class GfxInsertor:
    def __init__(self):
        self.widths = load_widths()
        self.tiles = load_tiles()
        self.img = None

    def load_image(self, fname):
        self.img = Image.open(fname)

    def insert_strings(self, strings, coords):
        self.clear_space(coords)

        for line, meta in zip(strings, coords):
            logger.debug(line)
            tmp = encoder_8.convert(line).rstrip(b'\x00')
            posx = meta['posx']
            posy = meta['posy']
            posx += meta.get('offset', 0)
            logger.debug(f'inserting {line} at {posx}, {posy}')

            for s in tmp:
                try:
                    self.img.paste(self.tiles[s - 0x10], (posx, posy))
                except IndexError:
                    break

                posx += self.widths[struct.pack('B', s)]

    def clear_space(self, coords):
        for meta in coords:
            posx = meta['posx']
            posy = meta['posy']
            width = 256
            self.img.paste(0, (posx, posy, posx + width, posy + 14))

def insert_graphics(fname):
    buf = Path(fname).read_text('utf-8')
    meta = json.loads(buf)
    insertor = GfxInsertor()

    for name in meta:
        logger.info(f'Inserting {name}')
        insertor.load_image(f'{name}-jap.png')

        strings = TextReader(target_dir / f'grade/{name}.txt', mode='bare').strings
        coords = meta[name]['strings']
        logger.debug(f'{len(strings)}')
        logger.debug(f'{len(coords)}')
        assert len(strings) == len(coords)

        insertor.insert_strings(strings, coords)
        insertor.img.save(f'{name}.png')

if __name__ == '__main__':
    insert_graphics('grade-strings.json')
