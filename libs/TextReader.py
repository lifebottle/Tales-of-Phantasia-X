#!/usr/bin/env python

import re
import io

from pathlib import Path
from .util import logger

class TextReader:
    """Interface for reading strings from text dumps.
    Removes comments introduced with //.

    Args:
        fname: Input filename.

    Keyword args (optional):
        encoding: Input encoding, defaults to 'utf-8'. Can be set to 'auto' or 'raw'.
        mode: Input mode to use, 'num' (default) or 'bare'.
        want_ids: When True, string numbers are read and zipped with the strings.

    Attributes:
        buf: Input file buffer.
        strings: List of strings or tuples of (label, string) if want_ids set.
    """
    def __init__(self, fname, encoding="utf-8", mode="num", want_ids=False):
        if mode == "num":
            if want_ids:
                pattern = r"(?s)<(?:pointer|string) (\d+)>\n(.*?\{END\d?\})"
            else:
                pattern = r"(?s)<(?:pointer|string) \d+>\n(.*?\{END\d?\})"
        elif mode == "bare":
            pattern = r"(?s)(.*?\{END\d?\})\n\n"
        else:
            raise ValueError(f"Unknown mode: {mode}")

        self.buf = Path(fname).read_text(encoding=encoding)

        self.buf = self.buf.replace("\r\n", "\n")
        self.buf = re.sub(r"(?m)^//.*?\n", "", self.buf)

        if '{END} ' in self.buf:
            logger.error(f'Stray space after end tag in {fname}')

        self.strings = re.findall(pattern, self.buf)
