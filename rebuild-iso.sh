#!/bin/bash

source ./.env
TEMP_DIR="/tmp/topx"

rsync -aW --exclude="all.dat" --exclude="top.prx" "${ORIG_DIR}/" "${TEMP_DIR}/"

# nmap
cp "${OUT_DIR}"/map_d/*.d "${TEMP_DIR}/PSP_GAME/USRDIR/nmap/map_d/"
cp "${OUT_DIR}"/{montim?.acf,op_tim0.acf,wo_tim{,2}.acf} "${TEMP_DIR}/PSP_GAME/USRDIR/nmap/"

# field
# cp "${OUT_DIR}"/field?.d "${TEMP_DIR}/PSP_GAME/USRDIR/field/"

# game
cp "${OUT_DIR}"/{mc_face0.d,logos.acf,sys.d,ttl_dat.d,rndname.d,smdat.d,grade.acf} "${TEMP_DIR}/PSP_GAME/USRDIR/game/"

# scenario voices
# cp "${OUT_DIR}"/sv.pak "${TEMP_DIR}/PSP_GAME/USRDIR/game/"

# skits
# cp "${OUT_DIR}"/talk/*.at3 "${TEMP_DIR}/PSP_GAME/USRDIR/talk/"

# btl
cp "${OUT_DIR}"/btl/t???.d "${OUT_DIR}"/e.d "${TEMP_DIR}/PSP_GAME/USRDIR/btl/"

# others
cp "${OUT_DIR}"/{PARAM.SFO,ICON0.PNG,PIC1.PNG} "${TEMP_DIR}/PSP_GAME/"
cp "${OUT_DIR}"/EBOOT.BIN "${TEMP_DIR}/PSP_GAME/SYSDIR/"
cp "${OUT_DIR}"/julian.dat "${TEMP_DIR}/PSP_GAME/USRDIR/"

if [ "$1" != "--disable-qol" ];
then
    cp song5-psx.at3 "${TEMP_DIR}/PSP_GAME/USRDIR/song/song5.at3"
fi

mkisofs -quiet -sort filelist.txt -iso-level 4 -xa -A "PSP GAME" -V "" -sysid "PSP GAME" -volset "" -p "NAMCO TALES STUDIO" -publisher "NBGI" -o "${OUT_DIR}"/topx.iso "${TEMP_DIR}"
