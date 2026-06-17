#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
import subprocess

from .util import logger

@logger.catch
def decompress(chunk_name):
    logger.info(f'decompressing to {chunk_name}')

    try:
        subprocess.check_output(["comptoe", '-d', chunk_name, chunk_name.with_suffix('.decomp')], stderr=subprocess.STDOUT, text=True)
        logger.debug('decompress args:')
        logger.debug(["comptoe", '-d', chunk_name, chunk_name.with_suffix('.decomp')])
    except (subprocess.CalledProcessError, OSError) as e:
        logger.error(f"Couldn't decompress {chunk_name}")
        match e:
            case subprocess.CalledProcessError():
                logger.error(f'cmd: {e.cmd}')
                logger.error(f'output: {e.output}')
                logger.error(f'returncode: {e.returncode}')
            case _:
                logger.error(f'Exception: {e}')

def extract_type1(buf, count):
    blocks = []

    for i in range(count):
        offset, size = struct.unpack_from('<2I', buf, 4 + (8 * i))
        logger.debug(f' offset: {offset:X}')
        logger.debug(f' size: {size:X}')
        blocks += [(offset, size)]

    return blocks

def extract_type2(buf, count):
    blocks = []

    for i in range(count):
        block_id, offset = struct.unpack_from('<2I', buf, 4 + (8 * i))
        blocks += [[block_id, offset]]

    return blocks

def extract_type3(buf):
    blocks = []
    first_ptr = struct.unpack_from('<I', buf)[0]
    count = first_ptr // 4
    pointers = struct.unpack_from(f'<{count}I', buf)

    for i in range(count):
        offset = pointers[i]

        try:
            end = pointers[i + 1]
        except IndexError:
            end = len(buf)

        size = end - offset

        logger.debug(f' offset: {offset:X}')
        logger.debug(f' size: {size:X}')
        blocks += [(offset, size)]

    return blocks
