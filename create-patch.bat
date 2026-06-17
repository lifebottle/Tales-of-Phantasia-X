@echo off

call loadenv.bat

xdelta -e -f -S none -B 2073741824 -s topx.iso "%OUT_DIR%\topx.iso" "%OUT_DIR%\topx.xdelta
