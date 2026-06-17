#!/usr/bin/python3
# -*- coding=utf-8 -*-

import re
import struct

from functools import cache
from pathlib import Path

from .insertor import encoder_8, encoder_16
from .util import paths, logger

out_dir = paths['out']

class TextWrapper:
    def __init__(self, short=False):
        self.short = short

        if short:
            fname = out_dir / 'sys_00-widths.bin'
            fmt = 'B'
            self.encoder = encoder_8
            self.fixed_width = 8
        else:
            fname = out_dir / 'sys_02-widths.bin'
            fmt = 'H'
            self.encoder = encoder_16
            self.fixed_width = 12

        widths = Path(fname).read_bytes()
        width_table = {}

        for nr, i in enumerate(widths, 0x10):
            width_table[struct.pack(fmt, nr)] = i

        self.width_table = width_table

    @cache
    def get_width(self, word):
        word_len = 0

        word = re.sub(r"<(panic|sweat|star|volt1|volt2|volt3|volt4|note|heart|ring)>", "WW", word)
        word = re.sub("{.*?}", "", word)
        word = re.sub(r"<num\d_[\dA-F]{8}>", "W" * 5, word)
        word = re.sub(r"<var_[\dA-F]{2}02>", "W" * 2, word)
        word = re.sub(r"<(Up|Down)>", "W" * 2, word)
        word = re.sub(r"<var_[\dA-F]{4}>", "W" * 20, word)
        word = re.sub(r"<item_[\dA-F]{4}>", "W" * 20, word)
        word = re.sub(r"<char_[\dA-F]{4}>", "W" * 7, word)
        word = re.sub(r"<(Cless|Mint|Arche|Klarth|Chester|Suzu|Brambard|Rhea)>", "W" * 7, word)
        word = re.sub("<.*?>", "", word)
        word = word.replace("_", " ")

        for i in word:
            tmp = self.encoder.convert(i)
            width = self.width_table.get(tmp, self.fixed_width)
            word_len += width

        return word_len

    def wrap_subs(self, dialog, max_width=250):
        # don't wrap strings with manual line-breaks
        if '<nl>' in dialog:
            return dialog

        buf = ''
        words = dialog.split()
        total_width = self.get_width(' '.join(words))

        # don't wrap short strings
        if total_width < max_width:
            return dialog

        half_width = total_width // 2
        txt_len = 0

        for num, word in enumerate(words):
            word_len = self.get_width(word + ' ')

            if txt_len + word_len >= half_width:
                buf = buf.rstrip(' ')

                buf += '\n'
                buf += ' '.join(words[num:])
                break

            buf += word + ' '
            txt_len += word_len

        buf = buf.rstrip()
        return buf

    def wrap(self, dialog, limit_pix=240):
        buf = ""
        txt_len = 0
        words = dialog.split()

        for word in words:
            if word == "<pause>":
                buf += "\n<pause>\n"
                txt_len = 0
                continue

            # prepend space if not on a new line
            if (txt_len > 0) and (not buf.endswith("\n")):
                buf += " "
                txt_len += self.get_width(' ')

            if self.get_width(word) > limit_pix:
                logger.error(f'word too long: {word}')

            if (self.get_width(word) + txt_len) > limit_pix:
                buf += "\n"
                txt_len = 0

            buf += word

            # forced line-breaks
            if word.endswith("<nl>"):
                buf += "\n"
                txt_len = 0
                continue

            txt_len += self.get_width(word)

        # replace hard spaces and fix tags that we broke in doing so
        buf = buf.replace("_", " ")
        buf = re.sub(r'<(speed|color|char|audio|item|var|num\d) ', '<\\1_', buf)
        buf = buf.replace('\n\n<pause>', '\n<pause>')

        # remove <nl> tags because they're just syntactic sugar
        buf = buf.replace("<nl>", "")

        return buf
