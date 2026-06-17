@echo off
call loadenv.bat
call venv\Scripts\activate.bat

SETLOCAL ENABLEEXTENSIONS
SET LOGURU_LEVEL=WARNING
SET "LOGURU_FORMAT=<level>{level: <8}</level> | <level>{message}</level>"
SET "TOPX_VERSION=V1.2"

set "BUILD_OPTS="

IF "%~1"=="--disable-qol" (
    SET "BUILD_OPTS=-definelabel disable_qol 1"
    SET "DISABLE_QOL=1"
)

python topx-insert-font.py topx-font-eng.png
python topx-menu-font-width.py sys_00.png
python topx-insertor.py
python topx-wmap-insert.py
python topx-grade-insert.py
python topx-insert-ttl-date.py topx-ttl-font.png
python topx-insert-rndname.py
python topx-sort-monsters.py
python topx-convert-faces.py
python topx-convert-gfx.py

armips.exe asm/topx.asm -sym topx.sym %BUILD_OPTS% -strequ OUT_DIR "%OUT_DIR%"

python topx-insert-menus.py
python topx-insert-skits.py
python topx-insert-smdat.py
python topx-insert-monsters.py
python topx-insert-credits.py
python topx-insert-misc.py
python topx-reinsert.py
REM python topx-reinsert-voices.py

call rebuild-iso.bat "%~1"

@pause
