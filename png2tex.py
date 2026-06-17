#!/usr/bin/env python3
# -*- coding=utf-8 -*-

from PIL import Image

import click

@click.command
@click.argument('fname')
@click.argument('out_name')
def main(fname, out_name):
    convert_to_tex(fname, out_name)

def convert_to_tex(fname, out_name):
    img = Image.open(fname)
    assert img.mode == 'RGBA'
    buf = img.tobytes()

    with open(out_name, 'wb') as out:
        out.write(buf)

if __name__ == '__main__':
    main()
