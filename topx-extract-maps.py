#!/usr/bin/env python

import struct

from pathlib import Path
from libs.extract import decompress
from libs.util import paths, logger

map_path = paths['extracted'] / 'map_d'

import click

def extract_type2(buf, count):
    blocks = []

    for i in range(count):
        block_id, offset = struct.unpack_from('<2I', buf, 4 + (8 * i))
        logger.debug(f' offset: {offset:X}')
        logger.debug(f' block_id: {block_id:X}')

        # header size isn't included in offsets
        offset += 4 + (8 * count)
        blocks += [(block_id, offset)]

    return blocks

def extract_file(fname, text_only):
    logger.debug(f'Extracting {fname}...')
    in_file = Path(fname)
    buf = in_file.read_bytes()

    segment_count = struct.unpack("<I", buf[:4])[0]
    logger.debug(f'segments: {segment_count}')
    segments = extract_type2(buf, segment_count)

    for i, (block_id, segment) in enumerate(segments):
        start_addr = segment

        try:
            _, end = segments[i + 1]
        except IndexError:
            end = len(buf)

        if text_only and block_id != 8:
            logger.info(' not text, skipping')
            continue

        logger.debug(f' {start_addr=:08X}')
        mode, comp_size, decomp_size = struct.unpack("<B 2I", buf[start_addr:start_addr + 9])

        out_name = in_file.with_stem(f'{in_file.stem}_{i:02d}').with_suffix('.bin')

        if mode in [1, 3]:
            chunk = buf[start_addr:start_addr + comp_size + 9]
            out_name.write_bytes(chunk)
            decompress(out_name)
        else:
            logger.debug(f' invalid compressed data, saving raw to {out_name}')
            logger.debug(f'{start_addr=:X}')
            logger.debug(f'{end=:X}')
            out_name.write_bytes(buf[start_addr:end])

@click.command
@click.option('--text-only', is_flag=True)
@click.argument('files', nargs=-1)
def main(text_only, files):
    if not files:
        files = map_path.glob('*.d')

    for fname in files:
        extract_file(fname, text_only)

if __name__ == '__main__':
    main()
