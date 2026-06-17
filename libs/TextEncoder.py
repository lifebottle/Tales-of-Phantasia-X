#!/usr/bin/env python3

import struct

from .util import logger
from .Table import Table

class TextEncoder:
    def __init__(self, fname, encoding="utf-8"):
        self.tbl = Table(fname, mode="encode", encoding=encoding)

    def error_handler(self, s, pos):
        logger.warning(f"Unknown char: '{s[pos]}'")
        #print "String:", s

    def convert(self, s):
        pos = 0
        temp = b""

        while pos < len(s):
            found = self.tbl.has(s, pos)

            if found is not None:
                hex_val, st = found
                temp += hex_val
                pos += len(st)
            elif s[pos] == "{":
                hex_val = int(s[pos+1:pos+3], 16)
                temp += struct.pack("B", hex_val)
                pos += 4
            else:
                self.error_handler(s, pos)
                pos += 1

        return temp
