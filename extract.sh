#!/bin/bash

source ./.env
export LOGURU_LEVEL="INFO"

7z x -y topx.iso -o"${ORIG_DIR}"

mkdir -p "${EXTRACTED_DIR}/monsters"
cp -r "${ORIG_DIR}"/PSP_GAME/USRDIR/nmap/map_d "${EXTRACTED_DIR}/"
cp "${ORIG_DIR}"/PSP_GAME/USRDIR/nmap/montim*.acf "${EXTRACTED_DIR}/"
cp "${ORIG_DIR}"/PSP_GAME/USRDIR/nmap/{op_tim0.acf,wo_tim{,2}.acf} "${EXTRACTED_DIR}/"
cp "${ORIG_DIR}"/PSP_GAME/USRDIR/btl/e.d "${EXTRACTED_DIR}/"
cp "${ORIG_DIR}"/PSP_GAME/USRDIR/btl/t???.d "${EXTRACTED_DIR}/monsters/"
cp "${ORIG_DIR}"/PSP_GAME/USRDIR/game/{sys.d,ttl_dat.d,smdat.d,grade.acf} "${EXTRACTED_DIR}/"

comptoe -d "${EXTRACTED_DIR}"/smdat.{d,decomp} >/dev/null

source .venv/bin/activate

./topx-extract-maps.py
./topx-extract.py

# voices
# ./topx-extract-btl_voice-eboot.py
# ./topx-extract-sv.py
