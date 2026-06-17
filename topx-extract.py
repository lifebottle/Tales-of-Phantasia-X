#!/usr/bin/env python

import struct

from pathlib import Path
from enum import Enum
from dataclasses import dataclass
from libs.extract import extract_type1, extract_type3, decompress
from libs.util import paths, logger

orig_dir = paths['orig']
ext_dir = paths['extracted']

class BlockType(Enum):
    TYPE1 = 1
    TYPE2 = 2
    TYPE3 = 3

@dataclass
class Block:
    stem: str
    block_type: BlockType
    extension: str = ''
    directory: str = ''

def extract_file1(fname, out_dir=None):
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
            logger.debug(f' invalid compressed data, saving raw to {out_name}')
            out_name.write_bytes(buf[start_addr:end])

def extract_file3(fname, out_dir=None):
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
            out_name = out_dir / out_name.with_suffix('.bin').name

        logger.debug(f' {start_addr=:08X}')

        try:
            mode, comp_size, decomp_size = struct.unpack("<B 2I", buf[start_addr:start_addr + 9])
        except struct.error:
            logger.debug(f' invalid compressed data, saving raw to {out_name}')
            out_name.write_bytes(buf[start_addr:end])
            continue

        if mode in [1, 3]:
            chunk = buf[start_addr:start_addr + comp_size + 9]
            out_name.write_bytes(chunk)
            decompress(out_name)
        else:
            logger.debug(f' invalid compressed data, saving raw to {out_name}')
            out_name.write_bytes(buf[start_addr:end])

def extract_monsters():
    monsters_path = orig_dir / 'PSP_GAME/USRDIR/btl'
    dest_path = ext_dir / 'monsters'
    dest_path.mkdir(exist_ok=True)

    for fname in sorted(monsters_path.glob('t???.d')):
        logger.debug(f'extracting {fname}')
        fname = Path(fname)
        buf = fname.read_bytes()
        blocks = extract_type3(buf)

        for i, (offs, size) in enumerate(blocks):
            temp = buf[offs:offs + size]

            new_name = dest_path / fname.with_stem(f'{fname.stem}_{i:02d}').name
            new_name.write_bytes(temp)
            logger.debug(f' {offs=:08X}')
            mode = buf[offs]

            if mode in [1, 3] and temp:
                decompress(new_name)

def extract_blocks():
    files = [
        Block('sys', BlockType.TYPE1),
        Block('ttl_dat', BlockType.TYPE1),
        Block('e', BlockType.TYPE3),
        Block('grade', BlockType.TYPE1, extension='.acf'),
        Block('op_tim0', BlockType.TYPE1, extension='.acf'),
        Block('wo_tim', BlockType.TYPE1, extension='.acf'),
        Block('wo_tim2', BlockType.TYPE1, extension='.acf'),
        Block('montim0', BlockType.TYPE1, extension='.acf'),
        Block('montim1', BlockType.TYPE1, extension='.acf'),
        Block('montim2', BlockType.TYPE1, extension='.acf'),
        Block('montim3', BlockType.TYPE1, extension='.acf'),
        Block('montim4', BlockType.TYPE1, extension='.acf'),
        Block('montim5', BlockType.TYPE1, extension='.acf'),
        Block('montim6', BlockType.TYPE1, extension='.acf'),
        Block('montim7', BlockType.TYPE1, extension='.acf'),
    ]

    for block in files:
        extension = block.extension or '.d'
        fname = ext_dir / f'{block.stem}{extension}'
        dir_name = block.directory or ext_dir / f'{block.stem}'
        logger.info(f'Extracting {fname}...')

        match block.block_type:
            case BlockType.TYPE1:
                extract_file1(fname, dir_name)
            case BlockType.TYPE3:
                extract_file3(fname, dir_name)

if __name__ == '__main__':
    extract_blocks()
    extract_monsters()
