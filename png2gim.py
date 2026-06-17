#!/usr/bin/env python3
# -*- coding=utf-8 -*-

from pathlib import Path

from libs.romgfx import encode_4bpp_reverse
from libs.util import paths, logger
from PIL import Image

import click

ext_dir = paths['extracted']

meta = {
    'e_25': 0x530
}

@click.command
@click.argument('fname')
@click.argument('out_name')
def main(fname, out_name):
    convert_to_gim(fname, out_name)

def convert_to_gim(fname, out_name):
    fname = Path(fname)
    offset = meta.get(fname.stem)

    if not offset:
        logger.error(f'Unknown file {fname}')
        return

    dir_stem = fname.stem.split('_')[0]
    orig_fname = Path(ext_dir, dir_stem, fname.name).with_suffix('.decomp')
    header = orig_fname.read_bytes()[:offset]
    img = Image.open(fname)
    buf = encode_4bpp_reverse(img.tobytes())

    with open(out_name, 'wb') as out:
        out.write(header)
        out.write(buf)

if __name__ == '__main__':
    main()
