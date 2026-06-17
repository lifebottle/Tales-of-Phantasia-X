#!/usr/bin/env python

from PIL import Image
from .romgfx import *

def remove_dupes(seq):
    # order preserving
    seen = {}
    result = []
    for marker in seq:
        if marker in seen:
            continue

        seen[marker] = 1
        result.append(marker)
    return result

class TilesetEncoder:
    modes = {"1bpp": encode_1bpp, "2bpp": encode_2bpp_planar, "snes": encode_4bpp_planar, "4bpp_alt": encode_4bpp_planar_alt, "gba": encode_4bpp_linear, "8bpp": encode_8bpp_linear}

    def __init__(self, input_image, mode="2bpp", xsize=8, ysize=8, nodupes=False, xpadding=0, ypadding=0):
        if isinstance(input_image, Image.Image):
            self.img = input_image
        else:
            self.img = Image.open(input_image)

        if callable(mode):
            conv_func = mode
        else:
            conv_func = self.modes[mode]

        if self.img.mode not in ["1", "P", "L"]:
            raise ValueError("Warning, unsupported image mode: %s" % self.img.mode)

        self.tiles = []

        tile_pos = [(x, y) for y in range(0, self.img.size[1], ysize + ypadding)
                    for x in range(0, self.img.size[0], xsize + xpadding)]

        for posx, posy in tile_pos:
            tmp = self.img.copy()
            tmp = tmp.crop((posx, posy, posx + xsize, posy + ysize))

            self.tiles += [conv_func(tmp.tobytes("raw", self.img.mode))]

        if nodupes:
            self.tiles = remove_dupes(self.tiles)

        self.tileset = b"".join(self.tiles)
