#!/usr/bin/env python

from pathlib import Path
from libs.extract import decompress, extract_type3
from libs.util import logger

import click

@click.command
@click.argument('fname')
def extract_file(fname):
    logger.debug(f'extracting {fname}')
    fname = Path(fname)
    buf = fname.read_bytes()
    blocks = extract_type3(buf)

    for i, (offs, size) in enumerate(blocks):
        temp = buf[offs:offs + size]

        new_name = fname.with_stem(f'{fname.stem}_{i:02d}')
        new_name.write_bytes(temp)
        logger.debug(f' {offs=:08X}')
        mode = buf[offs]

        if mode in [1, 3]:
            decompress(new_name)

if __name__ == '__main__':
    extract_file()
