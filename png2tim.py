#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
import json

from io import BytesIO
from pathlib import Path

from libs.romgfx import encode_4bpp_reverse
from libs.util import logger
from PIL import Image

import click

json_buf = Path('tim-meta.json').read_text()
meta = json.loads(json_buf)

def convert_palette(pal, max_colors=16):
    pal = pal[:max_colors * 3]
    out = []

    for i in range(0, len(pal), 3):
        r, g, b = pal[i:i + 3]
        r >>= 3
        g >>= 3
        b >>= 3
        tmp = r | (g << 5) | (b << 10)
        out += [struct.pack('<H', tmp)]

    return b''.join(out)

@click.command
@click.argument('fname')
@click.argument('out_name')
@click.argument('mode', default="4bpp")
def main(fname, out_name, mode):
    convert_to_tim(fname, out_name, mode)

def convert_to_tim(fname, out_name, mode='4bpp'):
    fname = Path(fname)
    buf = BytesIO()

    img = Image.open(fname)
    width, height = img.size

    extra = meta.get(fname.stem)

    if not extra:
        logger.warning(f'Unknown file: {fname.stem}')

        extra = {
            'clut_x': 0xde,
            'clut_y': 0xad,
            'fb_x': 0xbe,
            'fb_y': 0xef,
        }

    mode = extra.get('mode') or mode

    match mode:
        case "4bpp":
            img_data = encode_4bpp_reverse(img.tobytes())
            width = width // 4
            colors = 16
            type_byte = 8
        case "8bpp":
            img_data = img.tobytes()
            width = width // 2
            colors = 256
            type_byte = 9
        case _:
            raise ValueError(f'Unknown mode: {mode}')

    colors = extra.get('colors') or 256
    hdr_colors = extra.get('hdr_colors') or 16
    num_palettes = extra.get('num_palettes') or colors // 16

    header = struct.pack('<3I4H',
                         0x10,                # magic
                         type_byte,           # type
                         (2 * colors) + 0xc,  # offset
                         extra['clut_x'],     # palette x
                         extra['clut_y'],     # palette y
                         hdr_colors,          # colors
                         num_palettes         # num_palettes
                         )
    buf.write(header)

    pal_name = fname.with_suffix('.pal')

    if pal_name.exists():
        pal = pal_name.read_bytes()
    else:
        pal = convert_palette(img.getpalette(), max_colors=colors)

    buf.write(pal)

    logger.debug(f'{width=}')
    logger.debug(f'{height=}')
    logger.debug(f'{buf.tell()=:X}')
    buf.write(struct.pack('<I4H',
                          len(img_data) + 12,   # length of image plus header
                          extra['fb_x'],        # framebuffer x
                          extra['fb_y'],        # framebuffer y
                          width,                # width in 16-bit pixels
                          height))              # height

    buf.write(img_data)

    Path(out_name).write_bytes(buf.getvalue())

if __name__ == '__main__':
    main()
