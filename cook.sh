#!/bin/bash

set -e

source ./.env
export LOGURU_LEVEL="WARNING"
export LOGURU_FORMAT="<level>{level: <8}</level> | <level>{message}</level>"
export TOPX_VERSION="V1.2"

BUILD_OPTS=""

if [ "$1" == "--disable-qol" ];
then
    BUILD_OPTS="-definelabel disable_qol 1"
    export DISABLE_QOL=1
fi

if command -v omegat &>/dev/null
then
    omegat topx-omegat --mode=console-translate --quiet 2>/dev/null
fi

source .venv/bin/activate

./topx-insert-font.py topx-font-eng.png
./topx-menu-font-width.py sys_00.png
./topx-insertor.py
./topx-wmap-insert.py
./topx-grade-insert.py
./topx-insert-ttl-date.py topx-ttl-font.png
./topx-insert-rndname.py
./topx-sort-monsters.py
./topx-convert-faces.py
./topx-convert-gfx.py

./build-cpp.sh
armips asm/topx.asm -sym topx.sym $BUILD_OPTS -strequ OUT_DIR "${OUT_DIR}"
./topx-insert-menus.py
./topx-insert-skits.py
./topx-insert-smdat.py
./topx-insert-monsters.py
./topx-insert-credits.py
./topx-insert-misc.py
./topx-reinsert.py
# ./topx-reinsert-voices.py
./rebuild-iso.sh $1
