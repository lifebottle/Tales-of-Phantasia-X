#!/usr/bin/env python

from __future__ import division

import struct

from bitstring import BitStream, ReadError

def decode_2bpp_planar(input_buf):
    if (len(input_buf) % 16) != 0:
        raise ValueError("Non-integral size")

    buf = []
    bpp1 = input_buf[0::2]
    bpp2 = input_buf[1::2]

    for i in range(len(bpp2)):
        b1 = bpp1[i]
        b2 = bpp2[i]

        for n in range(8):
            num = (b1 >> (7-n)) & 1
            num |= ((b2 >> (7-n)) & 1) << 1
            buf += [struct.pack("B", num)]

    return b"".join(buf)

def encode_2bpp_planar(in_buf):
    buf = []
    for i in range(0, len(in_buf), 8):
        bpp1 = 0
        bpp2 = 0

        for nr, pix in enumerate(in_buf[i:i+8]):
            bpp1 |= (pix & 1) << (7-nr)
            bpp2 |= ((pix & 2) // 2) << (7-nr)

        buf += [struct.pack("BB", bpp1, bpp2)]

    return b"".join(buf)

def encode_4bpp_planar(in_buf):
    buf = []
    for i in range(0, len(in_buf), 64):
        # 4bpp is like two tiles of 2bpp with shifted bitplanes
        tile1 = encode_2bpp_planar(in_buf[i:i+64])
        tmp = b"".join([struct.pack("B", x >> 2) for x in in_buf[i:i+64]])
        tile2 = encode_2bpp_planar(tmp)

        buf += [tile1]
        buf += [tile2]

    return b"".join(buf)

def encode_4bpp_planar_alt(in_buf):
    buf = []
    for i in range(0, len(in_buf), 8):
        bpp1 = 0
        bpp2 = 0
        bpp3 = 0
        bpp4 = 0

        for nr, pix in enumerate(in_buf[i:i+8]):
            bpp1 |= (pix & 1) << (7-nr)
            bpp2 |= ((pix & 2) >> 1) << (7-nr)
            bpp3 |= ((pix & 4) >> 2) << (7-nr)
            bpp4 |= ((pix & 8) >> 3) << (7-nr)

        buf += [struct.pack("BBBB", bpp1, bpp2, bpp3, bpp4)]

    return b"".join(buf)

def decode_1bpp(in_buf):
    buf = []
    stream = BitStream(in_buf)

    while True:
        try:
            nibble = stream.read(1)
            buf += [struct.pack("B", nibble.uint)]
        except ReadError:
            break

    return b"".join(buf)

def encode_1bpp(in_buf):
    buf = []

    if len(in_buf) % 8 != 0:
        raise ValueError("Non-integral size")

    for i in range(0, len(in_buf), 8):
        buf_bytes = in_buf[i:i+8]

        # in case FF is white
        buf_bytes = buf_bytes.replace(b"\xFF", b"\x01")

        chunk = 0

        for nr, i in enumerate(buf_bytes):
            chunk |= i << (7-nr)

        buf += [struct.pack("B", chunk)]

    return b"".join(buf)

def decode_4bpp_planar(input_buf):
    if (len(input_buf) % 32) != 0:
        raise ValueError("Non-integral size")

    buf = []

    for pos in range(0, len(input_buf), 32):
        bpp1 = input_buf[pos:pos+16:2]
        bpp2 = input_buf[pos+1:pos+16+1:2]
        bpp3 = input_buf[pos+16:pos+16+16:2]
        bpp4 = input_buf[pos+16+1:pos+16+16+1:2]

        for i in range(len(bpp2)):
            b1 = bpp1[i]
            b2 = bpp2[i]
            b3 = bpp3[i]
            b4 = bpp4[i]

            for n in range(8):
                num = (b1 >> (7-n)) & 1
                num |= ((b2 >> (7-n)) & 1) << 1
                num |= ((b3 >> (7-n)) & 1) << 2
                num |= ((b4 >> (7-n)) & 1) << 3
                buf += [struct.pack("B", num)]

    return b"".join(buf)

def decode_4bpp_linear(input_buf):
    if (len(input_buf) % 32) != 0:
        raise ValueError("Non-integral size")

    buf = []

    for i in input_buf:
        buf += [struct.pack("B", i & 0xF)]
        buf += [struct.pack("B", i >> 4)]

    return b"".join(buf)

def decode_4bpp_reverse(input_buf):
    buf = []
    stream = BitStream(input_buf)

    while True:
        try:
            nibble_hi = stream.read(4)
            nibble_lo = stream.read(4)
            buf += [struct.pack("B", nibble_lo.uint)]
            buf += [struct.pack("B", nibble_hi.uint)]
        except ReadError:
            break

    return b"".join(buf)

def encode_4bpp_reverse(input_buf):
    if (len(input_buf) % 2) != 0:
        raise ValueError("Non-integral size")

    stream = BitStream()

    for i in range(0, len(input_buf), 2):
        nibble_hi = input_buf[i] & 0xf
        nibble_lo = input_buf[i + 1] & 0xf
        stream.insert(f'0x{nibble_lo:X}')
        stream.insert(f'0x{nibble_hi:X}')

    return stream.tobytes()

def encode_4bpp_linear(input_buf):
    if (len(input_buf) % 8) != 0:
        raise ValueError("Non-integral size")

    buf = []

    for i in range(0, len(input_buf), 2):
        tmp = input_buf[i] + (input_buf[i+1] << 4)
        buf += [struct.pack("B", tmp)]

    return b"".join(buf)

def decode_4bpp_planar_alt(input_buf):
    if len(input_buf) % 4:
        raise ValueError("Non-integral size")

    buf = []
    bpp1 = input_buf[0::4]
    bpp2 = input_buf[1::4]
    bpp3 = input_buf[2::4]
    bpp4 = input_buf[3::4]

    for i in range(len(bpp2)):
        b1 = bpp1[i]
        b2 = bpp2[i]
        b3 = bpp3[i]
        b4 = bpp4[i]

        for n in range(8):
            num = (b1 >> (7-n)) & 1
            num |= ((b2 >> (7-n)) & 1) << 1
            num |= ((b3 >> (7-n)) & 1) << 2
            num |= ((b4 >> (7-n)) & 1) << 3
            buf += [struct.pack("B", num)]

    return b"".join(buf)

def gba_palette_decode(data):
    if len(data) % 32:
        raise ValueError("Non-integral palette length")

    colors = []

    for i in range(0, len(data), 2):
        tmp = struct.unpack_from("<H", data, i)[0]
        red = (tmp & 31) << 3
        green = (tmp >> 5) & 31
        green <<= 3
        blue = (tmp >> 10) & 31
        blue <<= 3

        colors += (red, green, blue)

    # padding
    if len(colors) < 768:
        colors += (0, 0, 0) * ((768 - (len(colors) % 768)) // 3)
    return colors

def decode_8bpp_linear(input_buf):
    return input_buf

def encode_8bpp_linear(input_buf):
    return input_buf

def gba_palette_encode(data):
    if len(data) % 3:
        raise ValueError("Non-integral palette length")

    out_buf = []

    for i in range(0, len(data), 3):
        red = data[i] >> 3
        green = data[i + 1] >> 3
        blue = data[i + 2] >> 3

        tmp = red
        tmp |= green << 5
        tmp |= blue << 10

        out_buf += [struct.pack("<H", tmp)]

    return b"".join(out_buf)

def decode_rgb555(data, alpha=None):
    colors = []

    for i in range(0, len(data), 2):
        tmp = struct.unpack_from("<H", data, i)[0]
        red = (tmp & 31) << 3
        green = (tmp >> 5) & 31
        green <<= 3
        blue = (tmp >> 10) & 31
        blue <<= 3
        alpha = alpha or ((tmp & 0x8000) >> 8)

        colors += [struct.pack("BBBB", red, green, blue, alpha)]

    return b"".join(colors)

def decode_a3i5(data, pal):
    tmp = bytearray()

    for i in bytearray(data):
        color_index = i & 31
        alpha = i >> 5
        alpha = (alpha * 4) + (alpha // 2)
        alpha <<= 3
        tmp += bytearray(pal[(color_index * 3):(color_index * 3) + 3])
        tmp += struct.pack("B", alpha)

    return bytes(tmp)

def decode_a5i3(data, pal):
    tmp = bytearray()

    for i in bytearray(data):
        color_index = i & 7
        alpha = i >> 3
        alpha <<= 3
        tmp += bytearray(pal[color_index * 3:(color_index * 3) + 3])
        tmp += struct.pack("B", alpha)

    return bytes(tmp)

def decode_256c(data, pal, alpha=False):
    tmp = bytearray()

    for color_index in bytearray(data):
        tmp += bytearray(pal[color_index * 3:(color_index * 3) + 3])
        # zero alpha for the first color
        if alpha:
            alpha = b"\xff" if color_index != 0 else b"\x00"
            tmp += alpha

    return bytes(tmp)
