#!/usr/bin/env python3

import struct
import re

class Table:
    def __init__(self, fname, mode="decode", encoding="utf-8"):
        tbl = open(fname, "r", encoding=encoding).read()

        tbl = tbl.replace("\r\n", "\n")
        entries = re.findall(r"(?m)([\dA-Fa-f]+)=(.*)$", tbl)
        self.tbl_dict = {}

        for what, towhat in entries:
            towhat = towhat.replace("\\n", "\n")
            towhat = towhat.replace("\\t", "\t")

            if len(what) % 2 != 0:
                raise ValueError("Non-integral length: %s" % what)

            tmp = b""
            for i in range(0, len(what), 2):
                tmp += struct.pack("B", int(what[i:i + 2], 16))

            if mode == "encode":
                self.tbl_dict[towhat] = tmp
            elif mode == "decode":
                self.tbl_dict[tmp] = towhat
            else:
                raise ValueError("Unknown mode: %s" % mode)

        self.max_len = dict(sorted([(x[0], len(x)) for x in self.tbl_dict.keys()]))

    def has(self, s, pos):
        for l in range(self.max_len.get(s[pos], 0), 0, -1):
            if s[pos:pos + l] in self.tbl_dict:
                return (self.tbl_dict[s[pos:pos + l]], s[pos:pos + l])

        return None
