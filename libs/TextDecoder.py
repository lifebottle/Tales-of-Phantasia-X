#!/usr/bin/env python

from .Table import Table

class TextDecoder:
    def __init__(self, fname, encoding="utf-8"):
        self.tbl = Table(fname, mode="decode", encoding=encoding)

    def convert(self, s):
        pos = 0
        temp = ""

        while pos < len(s):
            found = self.tbl.has(s, pos)

            if found is not None:
                hex_val, st = found
                temp += hex_val
                pos += len(st)
            else:
                temp += "{%02X}" % s[pos]
                pos += 1

        return temp
