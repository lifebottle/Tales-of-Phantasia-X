#!/usr/bin/env python

import struct

from pathlib import Path
from libs.util import paths, logger

eboot_base = 0x08803FAC
reloc_base = 0x8804000

orig_dir = paths['orig'] / 'PSP_GAME/USRDIR'
ext_dir = paths['extracted'] / 'btl_voice_eboot'

def get_chunks(buf):
    count = 0xa4
    # ids = struct.unpack_from(f'<{count}I', buf, 0x08c2709c - eboot_base)
    sizes = struct.unpack_from(f'<{count}I', buf, 0x08c26e0c - eboot_base)
    offsets = struct.unpack_from(f'<{count}I', buf, 0x08c26b7c - eboot_base)
    offsets = [x + reloc_base - eboot_base for x in offsets]

    return zip(offsets, sizes)

def extract_file(fname):
    in_file = Path(fname)
    buf = in_file.read_bytes()
    ext_dir.mkdir(exist_ok=True)

    segments = get_chunks(buf)

    for i, (segment, size) in enumerate(segments):
        start_addr = segment
        end = start_addr + size

        logger.debug(f' {start_addr=:08X}')
        mode, comp_size, decomp_size = struct.unpack("<B 2I", buf[start_addr:start_addr + 9])

        out_name = ext_dir / f'{in_file.stem}_{i:03d}.wav'
        out_name.write_bytes(buf[start_addr:end])

if __name__ == '__main__':
    extract_file(orig_dir / 'top.prx')
