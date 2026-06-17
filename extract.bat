@echo off
call loadenv.bat
call venv\Scripts\activate.bat

SET LOGURU_LEVEL=INFO

7z x -y topx.iso -o"%ORIG_DIR%"
mkdir "%EXTRACTED_DIR%\monsters"
robocopy "%ORIG_DIR%\PSP_GAME\USRDIR\nmap\map_d" "%EXTRACTED_DIR%\map_d"
robocopy "%ORIG_DIR%\PSP_GAME\USRDIR\nmap" "%EXTRACTED_DIR%" montim?.acf op_tim0.acf wo_tim*.acf /COPY:DAT /R:2 /W:5 /NFL /NDL /NP
robocopy "%ORIG_DIR%\PSP_GAME\USRDIR\btl" "%EXTRACTED_DIR%" e.d /COPY:DAT /R:2 /W:5 /NFL /NDL /NP
robocopy "%ORIG_DIR%\PSP_GAME\USRDIR\btl" "%EXTRACTED_DIR%\monsters" t???.d /COPY:DAT /R:2 /W:5 /NFL /NDL /NP
robocopy "%ORIG_DIR%\PSP_GAME\USRDIR\game" "%EXTRACTED_DIR%" sys.d ttl_dat.d smdat.d grade.acf /COPY:DAT /R:2 /W:5 /NFL /NDL /NP
comptoe -d "%EXTRACTED_DIR%"\smdat.d "%EXTRACTED_DIR%"\smdat.decomp >nul

python topx-extract-maps.py
python topx-extract.py

REM voices
REM python topx-extract-btl_voice-eboot.py
REM python topx-extract-sv.py

pause
