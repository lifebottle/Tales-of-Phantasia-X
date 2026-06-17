#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
from pathlib import Path

from PIL import Image
from libs.romgfx import encode_4bpp_reverse
from libs.util import compress, paths, logger
from png2tim import convert_palette

out_dir = paths['out']

def convert_faces(fname):
    fname = Path(fname)
    chunks = []
    pals = []

    for img_name in sorted(Path('.').glob('mc_face0_?.png')):
        img = Image.open(img_name)
        width, height = img.size
        img_data = encode_4bpp_reverse(img.tobytes())
        chunks += [(img_data, width, height)]

        pal = convert_palette(img.getpalette(), max_colors=0x10 * 5)

        # duplicate first palette
        if img_name.stem == 'mc_face0_7':
            if padding := len(pal) % 0x20:
                pal += b'\x00' * (0x20 - padding)

            pal = pal[:0x20] * 5

        logger.debug(f'{len(pal)=:X}')
        pals += [pal]

    with open(fname, 'wb') as out:
        out.write(struct.pack('<2I', len(chunks), 0))

        # write placeholder
        out.write(b'\x00' * 6 * len(chunks))

        # write image data
        offsets = []

        for img_data, _, __ in chunks:
            offsets += [out.tell()]
            out.write(img_data)

        # write palettes
        palette_offs = out.tell()
        out.write(b''.join(pals))

        # write headers
        out.seek(4)
        out.write(struct.pack('<I', palette_offs))

        for (_, width, height), offs in zip(chunks, offsets):
            out.write(struct.pack('<2H2B', offs, 1, width, height))

    compress(fname, '.d')

if __name__ == '__main__':
    convert_faces(out_dir / 'mc_face0.bin')
