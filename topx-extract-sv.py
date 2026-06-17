#!/usr/bin/env python

import struct

from pathlib import Path
from libs.extract import extract_type1
from libs.util import paths, logger

orig_dir = paths['orig'] / 'PSP_GAME/USRDIR'
ext_dir = paths['extracted'] / 'sv'

def extract_file(fname):
    in_file = Path(fname)
    buf = in_file.read_bytes()
    ext_dir.mkdir(exist_ok=True)

    segment_count = struct.unpack("<I", buf[:4])[0]
    logger.debug(f'segments: {segment_count}')
    segments = extract_type1(buf, segment_count)

    for i, (segment, size) in enumerate(segments):
        start_addr = segment
        end = start_addr + size

        logger.debug(f' {start_addr=:08X}')
        mode, comp_size, decomp_size = struct.unpack("<B 2I", buf[start_addr:start_addr + 9])
        out_name = ext_dir / f'{in_file.stem}_{i:04d}.wav'
        out_name.write_bytes(buf[start_addr:end])

if __name__ == '__main__':
    extract_file(orig_dir / 'game/sv.pak')
