#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
from pathlib import Path
from io import BytesIO

from libs.TextReader import TextReader
from libs.insertor import convert_string
from libs.util import paths

out_dir = paths['out']
target_dir = paths['target']
text_path = target_dir / 'menu/topx_rnd_name.txt'
dest_path = out_dir / 'rndname.d'

def insert_names(fname, out_name):
    strings = TextReader(fname, mode='bare').strings
    strings = [convert_string(x, True) for x in strings]

    out = BytesIO()

    out.write(struct.pack('<2I', 8, 0))
    out.write(b'\x00' * 2 * len(strings))

    if out.tell() % 2:
        out.write(b'\x00')

    ptrs = []

    for s in strings:
        ptrs += [out.tell()]
        out.write(s)

    ptrs = [struct.pack('<H', x) for x in ptrs]
    out.seek(8)
    out.write(b''.join(ptrs))

    buf = out.getvalue()
    out.close()

    Path(out_name).write_bytes(buf)

if __name__ == '__main__':
    insert_names(text_path, dest_path)
