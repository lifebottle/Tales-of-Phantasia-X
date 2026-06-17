#!/usr/bin/env python

import struct

from pathlib import Path
from libs.extract import decompress, extract_type1, extract_type2
from libs.util import logger

data_file = open("DATA.BIN", "rb")
index_file = open("HEAD.BIN", "rb")

# read structs
vfs_blocks = []

while nibble := index_file.read(4):
    offset = struct.unpack("<I", nibble)[0]
    vfs_blocks += [offset]

modulos = [x & 0x7ff for x in vfs_blocks]
vfs_blocks = [x & 0xfffff800 for x in vfs_blocks]

# extract segments
for nr, offset in enumerate(vfs_blocks):
    logger.info(f"Extracting file {nr}")
    logger.info(f" Offset: {offset:X}")
    data_file.seek(offset)
    try:
        size = vfs_blocks[nr + 1] - offset
        logger.info(f" Next offset: {vfs_blocks[nr + 1]:X}")
    except IndexError:
        break

    buf = data_file.read(size)
    buf = buf[:-modulos[nr]]

    chunk_name = Path(f"top_{nr:04d}.bin")
    logger.info(f' extracting raw chunk to {chunk_name}')
    chunk_name.write_bytes(buf)

    try:
        segment_count = struct.unpack("<I", buf[:4])[0]
    except struct.error:
        logger.error(' zero byte block')
        continue

    if segment_count >= 0x1000 or segment_count == 0:
        if buf[0] in [1, 3]:
            chunk_name = Path(f"top_{nr:04d}.bin")
            chunk_name.write_bytes(buf)
            decompress(chunk_name)
        else:
            logger.warning(f' invalid chunk num: {segment_count}')

        continue

    logger.debug(f' {segment_count} segments')
    try:
        segments = struct.unpack_from(f'<{segment_count * 2}I', buf, 4)
    except struct.error:
        logger.error('struct error')
        continue

    try:
        if segments[0] < len(buf) and buf[segments[0]] in [1, 3]:
            logger.debug(' block type 1')
            segments = extract_type1(buf, segment_count)
            continue  # DEBUG
        elif segments[1] < len(buf) and buf[segments[1] + 4 + (8 * segment_count)] in [1, 3]:
            logger.debug(' block type 2')
            segments = extract_type2(buf, segment_count)
        else:
            logger.warning(' unknown block type')
            continue
    except IndexError:
        logger.error('data too short')
        continue

    for i, start_addr in enumerate(segments):
        logger.debug(f' {start_addr=:08X}')
        try:
            mode, comp_size, decomp_size = struct.unpack("<B 2I", buf[start_addr:start_addr + 9])
        except struct.error:
            logger.error(' struct error')
            break

        chunk_name = Path(f"top_{nr:04d}_{i:02d}.bin")

        if mode in [1, 3]:
            chunk = buf[start_addr:start_addr + comp_size + 9]
            chunk_name.write_bytes(chunk)
            decompress(chunk_name)
        else:
            logger.warning(' invalid compressed data, saving raw')
            chunk_name.write_bytes(buf)
