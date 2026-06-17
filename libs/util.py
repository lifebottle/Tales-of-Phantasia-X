#!/usr/bin/env python3
# -*- coding=utf-8 -*-

import subprocess

from dotenv import dotenv_values

from pathlib import Path
from loguru import logger

logger.add('topx.log', level='DEBUG', format='<level>{level: <8}</level> | {file}:{name}:{function}:{line} - <level>{message}</level>', mode='a+')
logger.add('topx-errors.log', level='ERROR', format='<level>{level: <8}</level> | {file}:{name}:{function}:{line} - <level>{message}</level>', mode='a+')

envs = dotenv_values()

paths = {
    'orig': Path(envs.get('ORIG_DIR', 'orig')),
    'out': Path(envs.get('OUT_DIR', 'out')),
    'target': Path(envs.get('TEXT_DIR', 'target')),
    'extracted': Path(envs.get('EXTRACTED_DIR', 'extracted')),
}

def get_symbols():
    syms = Path('topx.sym')

    if not syms.exists():
        return {}

    lines = syms.read_text().splitlines()
    lines = [x.split() for x in lines]
    lines = [(x[1].strip(), int(x[0], 16)) for x in lines if len(x) == 2]

    return dict(lines)

@logger.catch
def compress(chunk_name, suffix='.comp'):
    logger.info(f'compressing {chunk_name}')

    try:
        comp_path = chunk_name.with_suffix(suffix)
        subprocess.check_output(["comptoe", '-c', chunk_name, comp_path], stderr=subprocess.STDOUT, text=True)
        logger.debug('compress args:')
        logger.debug(["comptoe", '-c', chunk_name, comp_path])
    except (subprocess.CalledProcessError, OSError) as e:
        logger.error(f"Couldn't compress {chunk_name}")
        match e:
            case subprocess.CalledProcessError():
                logger.error(f'cmd: {e.cmd}')
                logger.error(f'output: {e.output}')
                logger.error(f'returncode: {e.returncode}')
            case _:
                logger.error(f'Exception: {e}')

