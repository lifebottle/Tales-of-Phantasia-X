#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import os
import struct
import re
import json
import shutil

from pathlib import Path
from dataclasses import dataclass
from joblib import Parallel, delayed

from libs.TextReader import TextReader
from libs.linewrap import TextWrapper
from libs.insertor import convert_string
from libs.util import paths, logger, envs

orig_dir = paths['extracted'] / 'map_d'
out_dir = paths['out']
target_dir = paths['target']
map_dir = out_dir / 'map_d'

wrapper = TextWrapper()

disable_qol = os.environ.get('DISABLE_QOL')
disable_parallel = envs.get('NO_PARALLEL')

@dataclass
class Pointer:
    address: int
    destination: int

    def __repr__(self):
        return f'Pointer(address=0x{self.address:X}, destination=0x{self.destination:X})'

    @property
    def value(self):
        return self.as_short()

    def as_short(self):
        return struct.pack("<H", self.destination & 0xFFFF)

def preprocess(s):
    # add speaker tags, requires indents to work
    chunks = re.split('\n<pause>\n', s)
    chunks = [re.sub('^(.*?)\n ', r'\1:<nl>\n ', chunk) for chunk in chunks]
    out = '\n<pause>\n'.join(chunks)

    # add line-breaks in choice dialogs starting with digits plus dot
    out = re.sub(r'\n((?:<.*?>)?\d\.)', r'<nl>\n\1', out)
    out = out.replace('<pause><nl>', '<pause>')
    out = out.replace('<nl>\n<pause>', '\n<pause>')

    # force line-breaks after ellipses that had them before wrapping
    out = out.replace('...\n', '...<nl>\n')

    # force line-breaks before Japanese quotes
    out = out.replace('\n「', '<nl>\n「')

    return out

def insert_block(fname, out_dir=None):
    fname = Path(fname)
    logger.info(f"Inserting {fname}...")

    if out_dir:
        out_dir = Path(out_dir)
    else:
        out_dir = map_dir

    dest = out_dir / fname.name
    dest = dest.with_suffix('.bin')
    orig = orig_dir / fname.name
    orig_buf = orig.with_suffix('.decomp').read_bytes()
    first_text = struct.unpack_from('<I', orig_buf, 4)[0]
    header = orig_buf[:first_text]

    events_fname = Path(f'events/{fname.stem}_events.bin')

    if fname.stem in ['m_i24_10', 'i_c06_09', 'i_c10_10'] and disable_qol:
        want_qol = False
    else:
        want_qol = True

    # insert modified events if any exist
    if events_fname.exists() and want_qol:
        header = events_fname.read_bytes()

        if padding := len(header) % 4:
            header += b'\x00' * (4 - padding)

        # patch header with actual size
        first_text = len(header)
        header = header[:4] + struct.pack('<I', first_text) + header[8:]

    with open(dest, 'wb') as rom:
        strings = TextReader(fname, encoding="utf-8", mode="bare").strings

        # placeholder for first pointer
        block_pointers = [[]]
        block_pointers += pointer_map[fname.stem]

        try:
            assert len(strings) == len(block_pointers)
        except AssertionError as e:
            logger.error(f'{fname} has mismatched strings: {len(strings)} vs. {len(block_pointers)}')
            raise e

        rom.write(header)
        queue = []

        for s, ptrs in zip(strings, block_pointers):
            logger.debug(f'Inserting:\n{s}')
            # s = preprocess(s)
            s = wrapper.wrap(s, 300)
            s = convert_string(s)

            if len(s) % 2:
                s += b'\x00'

            for i in ptrs:
                queue += [Pointer(i, rom.tell() - first_text)]

            rom.write(s)

        if rom.tell() >= 0x2A000:
            logger.warning(f'{fname} is too big by {rom.tell() - 0x2a000} bytes')

        logger.debug(queue)

        for ptr in queue:
            rom.seek(ptr.address)
            rom.write(ptr.value)

    copies = duplicates.get(fname.stem, [])

    for copy_name in copies:
        copy_name = Path(*dest.parts[:-1], f'{copy_name}.bin')
        logger.info(f'Copying to {copy_name}')
        shutil.copy(dest, copy_name)

if __name__ == '__main__':
    json_buf = Path('block-pointer-map.json').read_text()
    pointer_map = json.loads(json_buf)

    json_buf = Path('topx-dialogue-dupes.json').read_text()
    duplicates = json.loads(json_buf)

    story_dir = target_dir / 'story'
    map_dir.mkdir(exist_ok=True)

    if not disable_parallel:
        Parallel(n_jobs=-1)(delayed(insert_block)(fname) for fname in story_dir.glob('*.txt'))
    else:
        [insert_block(fname) for fname in story_dir.glob('*.txt')]

    insert_block(target_dir / 'menu/topx_item_found.txt', out_dir)
