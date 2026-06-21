#!/usr/bin/env python

import struct

from pathlib import Path
from loguru import logger
from libs.extract import extract_type3, decompress

import click

@click.command
@click.argument('fname')
@click.argument('out_dir', default=None)
def extract_file(fname, out_dir):
    in_file = Path(fname)
    buf = in_file.read_bytes()

    segments = extract_type3(buf)

    for i, (segment, size) in enumerate(segments):
        start_addr = segment
        end = start_addr + size
        out_name = in_file.with_stem(f'{in_file.stem}_{i:02d}').with_suffix('.d')

        if out_dir:
            out_dir = Path(out_dir)
            out_dir.mkdir(exist_ok=True)
            out_name = out_dir / out_name.name

        logger.debug(f' {start_addr=:08X}')

        try:
            mode, comp_size, decomp_size = struct.unpack("<B 2I", buf[start_addr:start_addr + 9])
        except struct.error:
            logger.warning(f' invalid compressed data, saving raw to {out_name}')
            out_name.write_bytes(buf[start_addr:end])
            continue

        if mode in [1, 3]:
            chunk = buf[start_addr:start_addr + comp_size + 9]
            out_name.write_bytes(chunk)
            decompress(out_name)
        else:
            logger.warning(f' invalid compressed data, saving raw to {out_name}')
            out_name.write_bytes(buf[start_addr:end])

if __name__ == '__main__':
    extract_file()
