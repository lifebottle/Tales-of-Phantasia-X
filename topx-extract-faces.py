#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
from pathlib import Path

from PIL import Image
from PIL import ImagePalette
from libs.util import logger

import click

def convert_abgr(data):
    output = bytearray()

    for i in range(0, len(data), 2):
        pixel = struct.unpack_from("<H", data, i)[0]

        r = pixel & 0x1f
        g = (pixel >> 5) & 0x1f
        b = (pixel >> 10) & 0x1f
        a = pixel & 0x8000
        pixel = a | (r << 10) | (g << 5) | b

        output.extend(struct.pack("<H", pixel))

    return bytes(output)

def decode_4bpp(data, clut, width, height):
    output = bytearray()
    clut = convert_abgr(clut)
    palette = ImagePalette.raw("BGR;15", clut)

    for x in data:
        pix0 = x & 0x0f
        pix1 = x >> 4

        output.append(pix0)
        output.append(pix1)

    image = Image.frombytes("P", (width, height), output, "raw", "P", 0, 1)
    image.palette = palette

    return image

@click.command
@click.argument('fname')
def extract(fname):
    fname = Path(fname)
    buf = fname.read_bytes()
    count, pal_offs = struct.unpack_from('<2I', buf)
    logger.debug(f'{count=}')
    logger.debug(f'{pal_offs=:X}')

    for i in range(count):
        offs, mode, xsize, ysize = struct.unpack_from('<2H2B', buf, 8 + (i * 6))
        size = (xsize * ysize) // 2

        logger.debug(f'{offs=:X}')
        logger.debug(f'{mode=:X}')
        logger.debug(f'{size=:X}')
        logger.debug(f'{xsize=:X}')
        logger.debug(f'{ysize=:X}')

        img_data = buf[offs:offs + size]
        logger.debug(f'{len(img_data)=:X}')
        pal_offs2 = pal_offs + (i * 0x20 * 5)
        logger.debug(f'{pal_offs2=:X}')

        clut = buf[pal_offs2:pal_offs2 + (0x20 * 5)]
        img = decode_4bpp(img_data, clut, xsize, ysize)
        out_name = fname.with_stem(f'{fname.stem}_{i}').with_suffix('.png')
        img.save(out_name)

if __name__ == '__main__':
    extract()
