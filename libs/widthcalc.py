#!/usr/bin/python

from itertools import takewhile
from PIL import Image

class widthcalc:
    """Interface for calculating widths and heights of individual glyphs in a font dump.

    Args:
        img: Source image filename or Image instance.
    Keyword args:
        cnt: Amount of glyphs to process (defaults to 256).
        xsize: Horizontal tile size (defaults to 8).
        ysize: Vertical tile size (defaults to 8).
        bgcol: Background/transparent color (index or tuple depending on the image format).
        mode: The direction to count from ('left', 'right', 'up', 'down').
    Attributes:
        widths: List of widths for each glyph.
    """
    def __init__(self, img, cnt=256, xsize=8, ysize=8, bgcol=0, mode="right"):
        self.__xsize = xsize
        self.__ysize = ysize
        self.__bgcol = bgcol
        self.__mode = mode
        self.widths = []

        # if Image was passed, use it directly
        if isinstance(img, Image.Image):
            self.__font = img
        else:
            self.__font = Image.open(img)

        actions = {
            "right": self._checkTileWidthRight,
            "left": self._checkTileWidthLeft,
            "up": self._checkTileHeightUp,
            "down": self._checkTileHeightDown
        }

        widthfunc = actions.get(mode)
        if not widthfunc:
            raise ValueError(f"Unknown mode: {mode}")

        self.__loaded = self.__font.load()

        tiles = [(x, y) for y in range(0, self.__font.size[1], self.__ysize) for x in range(0, self.__font.size[0], self.__xsize)]
        tiles = tiles[:cnt]

        self.widths += [widthfunc(x, y) for x, y in tiles]

    def _isColumnEmpty(self, x, y):
        return all((self.__loaded[x, y + i] == self.__bgcol for i in range(self.__ysize)))

    def _isRowEmpty(self, x, y):
        return all((self.__loaded[x + i, y] == self.__bgcol for i in range(self.__xsize)))

    def _checkTileWidthRight(self, x, y):
        # find right border
        tmp = (self._isColumnEmpty(self.__xsize - 1 - i + x, y) for i in range(self.__xsize))
        return self.__xsize - _countWhile(tmp)

    def _checkTileWidthLeft(self, x, y):
        # find left border
        tmp = (self._isColumnEmpty(i + x, y) for i in range(self.__xsize))
        return _countWhile(tmp)

    def _checkTileHeightUp(self, x, y):
        # find top border
        tmp = (self._isRowEmpty(x, i + y) for i in range(self.__ysize))
        return _countWhile(tmp)

    def _checkTileHeightDown(self, x, y):
        # find bottom border
        tmp = (self._isRowEmpty(x, self.__ysize - 1 - i + y) for i in range(self.__ysize))
        return self.__ysize - _countWhile(tmp)

def _countWhile(l):
    return len(list(takewhile(lambda x: x, l)))
