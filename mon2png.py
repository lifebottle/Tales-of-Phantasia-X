#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
import click

from pathlib import Path
from PIL import Image, ImagePalette
from loguru import logger

def convertABGR(data):
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

def decode_4bpp(gfx_data):
    output = bytearray()
    for x in gfx_data:
        pix0 = x & 0x0f
        pix1 = x >> 4

        output.append(pix0)
        output.append(pix1)

    return output

@click.command
@click.argument('fname')
def convert(fname):
    fname = Path(fname)
    prefix = '_'.join(Path(fname).stem.split('_')[:-1])
    meta = fname.with_name(f'{prefix}_00.decomp').read_bytes()
    clut = fname.with_name(f'{prefix}_04.d').read_bytes()
    gfx = fname.with_name(f'{prefix}_02.decomp').read_bytes()
    count = struct.unpack_from('<I', meta)[0]

    for i in range(count):
        width, height = struct.unpack_from('BB', meta, 0xc + (8 * i))
        offs, next_offs = struct.unpack_from('<2I', gfx, 4 * i)

        if i == count - 1:
            next_offs = len(gfx)

        gfx_data = gfx[offs:next_offs]
        logger.debug(f'{offs=:X}')
        logger.debug(f'{next_offs=:X}')
        logger.debug(f'{width=:X}')
        logger.debug(f'{height=:X}')

        # pad to nearest multiple of 4
        width = (width + 5) & 0xfffc
        height += 2

        output = decode_4bpp(gfx_data)
        clut = convertABGR(clut)
        pal_format = "RGB;15" if i % 2 else "BGR;15"
        palette = ImagePalette.raw(pal_format, clut)
        image = Image.frombytes("P", (width, height), output, "raw", "P", 0, 1)
        image.palette = palette
        image.save(f'{prefix}_{i:02d}.png')

if __name__ == '__main__':
    convert()
