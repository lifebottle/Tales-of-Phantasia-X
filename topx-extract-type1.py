#!/usr/bin/env python

import struct

from pathlib import Path
from libs.extract import decompress, extract_type1
from libs.util import logger

import click

@click.command
@click.argument('fname')
@click.argument('out_dir', default=None)
def extract_file(fname, out_dir):
    in_file = Path(fname)
    buf = in_file.read_bytes()

    segment_count = struct.unpack("<I", buf[:4])[0]
    logger.debug(f'segments: {segment_count}')
    segments = extract_type1(buf, segment_count)

    for i, (segment, size) in enumerate(segments):
        start_addr = segment
        end = start_addr + size

        logger.debug(f' {start_addr=:08X}')
        mode, comp_size, decomp_size = struct.unpack("<B 2I", buf[start_addr:start_addr + 9])

        out_name = in_file.with_stem(f'{in_file.stem}_{i:02d}').with_suffix('.bin')

        if out_dir:
            out_dir = Path(out_dir)
            out_dir.mkdir(exist_ok=True)
            out_name = out_dir / out_name.name

        if mode in [1, 3]:
            chunk = buf[start_addr:start_addr + comp_size + 9]
            out_name.write_bytes(chunk)
            decompress(out_name)
        else:
            logger.warning(f' invalid compressed data, saving raw to {out_name}')
            out_name.write_bytes(buf[start_addr:end])

if __name__ == '__main__':
    extract_file()
