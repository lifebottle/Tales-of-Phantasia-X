#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import struct
import re

from pathlib import Path
from dataclasses import dataclass
from difflib import SequenceMatcher
from itertools import groupby

import json
import click

from libs.TextDecoder import TextDecoder
from libs.util import logger

@dataclass
class Pointer:
    offset: int
    target: int

    def __repr__(self):
        return f'Pointer(offset=0x{self.offset:X}, target=0x{self.target:X})'

decoder = TextDecoder('top.tbl', encoding="utf-8")

names = [
    'Cless',
    'Mint',
    'Arche',
    'Klarth',
    'Chester',
    'Suzu',
    'Rhea', # might actually be Rondoline in ToPX, but it's unused
    'Rhea', # seems to be Brambard in the menus
]

def find_pointers(buf, addr):
    logger.debug(f'looking for: {addr:X}')
    regex = re.escape(struct.pack('<H', addr))
    ptrs = [x.start() for x in re.finditer(regex, buf)]
    ptrs = [Pointer(x, addr) for x in ptrs if 0x10 <= buf[x - 1] <= 0x22]
    return ptrs

def audit_pointers(buf, strings, ptrs):
    ptrs = [x.target for x in ptrs]
    missing_pointers = set(strings) - set(ptrs)
    out = []

    for ptr in missing_pointers:
        found = find_pointers(buf, ptr)

        if found:
            out += found
        elif not found:
            logger.error('not found')

    return out

def log_pointers(strings, ptrs):
    logger.debug('strings:')
    logger.debug([f'{x:X}' for x in strings])
    ptrs = [x.target for x in ptrs]
    ptrs = sorted(set(ptrs))

    logger.debug('ptrs:')
    logger.debug([f'{x:X}' for x in ptrs])

    if strings == ptrs:
        return

    logger.error('misaligned pointers:')
    logger.error([f'{x:X}' for x in strings])
    logger.error([f'{x:X}' for x in ptrs])

    matches = SequenceMatcher(None, strings, ptrs).get_opcodes()
    matches = [x for x in matches if x[0] != 'equal']
    missing_pointers = []
    for tag, alo, ahi, blo, bhi in matches:
        match tag:
            case 'insert':
                inserted = ptrs[blo:bhi]
                logger.error('added:')
                logger.error([f'{x:X}' for x in inserted])
            case 'delete':
                removed = strings[alo:ahi]
                missing_pointers += removed
                logger.error('removed:')
                logger.error([f'{x:X}' for x in removed])
            case 'replace':
                removed = strings[alo:ahi]
                missing_pointers += removed
                inserted = ptrs[blo:bhi]
                logger.error('removed:')
                logger.error([f'{x:X}' for x in removed])
                logger.error('added:')
                logger.error([f'{x:X}' for x in inserted])
            case _:
                logger.error(tag)

def save_pointers(stem, ptrs):
    out_name = 'block-pointer-map.json'

    try:
        buf = Path(out_name).read_text()
        ptr_list = json.loads(buf)
    except FileNotFoundError:
        ptr_list = {}

    grouped = []

    for k, v in groupby(ptrs, lambda x: x.target):
        grouped.append(list({x.offset for x in v}))

    ptr_list[stem] = grouped
    out = json.dumps(ptr_list)
    Path(out_name).write_text(out)

def parse_01(buf, offs, want_stop=True):
    while True:
        value = struct.unpack_from('<H', buf, offs)[0]
        offs += 2
        opcode = value & 0xc000
        data = value & 0x3fff
        mode = value & 0x3000
        logger.debug(f'{value=:X}')
        logger.debug(f'{opcode=:X}')
        logger.debug(f'{data=:X}')
        logger.debug(f'{mode=:X}')

        match opcode:
            case 0:
                if mode == 0:
                    pass
                elif mode == 0x1000:
                    offs += 1
                elif mode == 0x2000:
                    offs += 3
            case 0x8000:
                if want_stop:
                    break
            case 0xc000:
                if data == 0:
                    break

    return offs

def parse_event(buf, offs, code_offs):
    ptrs = []
    seen = set()
    rets = []

    while True:
        c = buf[offs]
        offs += 1
        logger.debug(f'{c=:X}')

        match c:
            case 0:
                break
            case 1 | 7:
                want_stop = 0 # c == 1
                offs = parse_01(buf, offs, want_stop)
            case 2:
                tgt = struct.unpack_from('<H', buf, offs)[0]
                tgt += code_offs

                if tgt in seen:
                    logger.debug(f'call to 0x{tgt:04X} (skipped)')
                    offs += 2
                else:
                    rets.append(offs + 2)
                    seen.add(tgt)
                    offs = tgt
                    logger.debug(f'call to 0x{tgt:04X}')
            case 3:
                offs = rets.pop()
                logger.debug(f'ret to {offs:04X}')
            case 4 | 5 | 6:
                offs += 2
            case c if 0x10 <= c <= 0x22:
                logger.debug('text box')
                ptr = struct.unpack_from('<H', buf, offs)[0]
                logger.debug(f'{ptr=:X}')
                ptrs += [Pointer(offs, ptr)]
                offs += 2
            case _:
                logger.warning(f'Unknown opcode: {c:02X}')

    return ptrs

def parse_events(buf):
    code_start, start_addr, events_num = struct.unpack_from('<3I', buf)
    logger.debug(f'{code_start=:x}')
    logger.debug(f'{events_num=:x}')
    events = buf[12:12 + (events_num * 8)]
    ptrs = []
    ptrs += parse_event(buf, code_start, code_start)

    for i in range(events_num):
        event_type, event_id, event_offs = struct.unpack_from('<2HI', events, i * 8)
        ptrs += parse_event(buf, event_offs, code_start)
        logger.debug(f'{event_type=:X}')
        logger.debug(f'{event_id=:X}')
        logger.debug(f'{event_offs=:X}')

    ptrs = sorted(ptrs, key=lambda x: x.target)
    logger.debug('ptrs:')
    logger.debug([f'{x.target:X}' for x in ptrs[1:]])

    return ptrs

@click.command
@click.argument('fname')
def dump_file(fname):
    logger.info(f'Dumping {fname}')
    fname = Path(fname)
    buf = fname.read_bytes()

    _, start_addr = struct.unpack_from('<2I', buf)
    ptrs = parse_events(buf)

    end = len(buf)
    pos = start_addr
    out = []
    string_offs = []

    while pos < end:
        c = buf[pos]

        if tmp := decoder.tbl.has(buf, pos):
            decoded, raw = tmp
            out += [decoded]
            pos += len(raw)

            if out[-1].rstrip() == '{END}':
                logger.debug(f'string start: {pos - start_addr:X}')
                string_offs += [pos - start_addr]

            continue

        logger.debug(f'{pos:X}')

        match c:
            case 0x05:
                num = struct.unpack_from('<H', buf, pos + 2)[0]
                pos += 4
                out += [f'<speed_{num:04X}>']
                logger.debug(out[-1])
            case 0x06:
                num = struct.unpack_from('<H', buf, pos + 2)[0]
                pos += 4
                out += [f'<color_{num:04X}>']
            case 0x07:
                num = struct.unpack_from('<H', buf, pos + 2)[0]
                try:
                    name = names[num - 1]
                except IndexError:
                    logger.debug(f'{pos:X}')
                    if num >= 0x10:
                        name = f'audio_{num:04X}'
                    else:
                        name = f'char_{num:04X}'
                    logger.debug(name)
                pos += 4
                out += [f'<{name}>']
            case 0x08:
                # purposely reversed endianess
                num = struct.unpack_from('>H', buf, pos + 2)[0]
                pos += 4
                out += [f'<item_{num:04X}>']
            case 0x09:
                # purposely reversed endianess
                num = struct.unpack_from('>H', buf, pos + 2)[0]
                pos += 4
                out += [f'<var_{num:04X}>']
            case 0x0A:
                num = struct.unpack_from('<I', buf, pos + 2)[0]
                pos += 6
                out += [f'<num1_{num:08X}>']
            case 0x0B:
                num = struct.unpack_from('<I', buf, pos + 2)[0]
                pos += 6
                out += [f'<num2_{num:08X}>']
            case 0x0C:
                num = struct.unpack_from('<I', buf, pos + 2)[0]
                pos += 6
                out += [f'<num3_{num:08X}>']
            case 0x0d:
                num = struct.unpack_from('<I', buf, pos + 2)[0]
                pos += 6
                out += [f'<num4_{num:08X}>']
            case 0x0E:
                num = struct.unpack_from('<I', buf, pos + 2)[0]
                pos += 6
                out += [f'<num5_{num:08X}>']
            case _:
                out += ['{' + f'{buf[pos]:02X}' + '}']
                pos += 1

        logger.debug(out[-1])

    # remove extra offset after last string
    string_offs = sorted(string_offs[:-1])

    # we don't need to patch the first pointer
    ptrs = ptrs[1:]

    missing_pointers = audit_pointers(buf, string_offs, ptrs)
    ptrs += missing_pointers
    ptrs = [x for x in ptrs if x.target > 0]
    ptrs = sorted(ptrs, key=lambda x: x.target)

    log_pointers(string_offs, ptrs)

    out = ''.join(out)
    fname.with_suffix('.txt').write_text(out)
    save_pointers(fname.stem, ptrs)

if __name__ == '__main__':
    dump_file()
