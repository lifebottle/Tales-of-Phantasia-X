#!/bin/bash
set -e

source ./.env

xdelta3 -e -f -S none -B 2073741824 -s topx.iso "${OUT_DIR}"/topx.iso "${OUT_DIR}"/topx.xdelta
