@echo off
call loadenv.bat

SETLOCAL ENABLEEXTENSIONS

REM Directories
SET TEMP_DIR=%TEMP%\topx

REM Clean TEMP_DIR if it exists
if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%"
mkdir "%TEMP_DIR%"

REM Copy original files
robocopy "%ORIG_DIR%" "%TEMP_DIR%" /E /XF all.dat top.prx /COPY:DAT /R:3 /W:5 /NFL /NDL /NP

REM nmap
robocopy "%OUT_DIR%\map_d" "%TEMP_DIR%\PSP_GAME\USRDIR\nmap\map_d" *.d /COPY:DAT /R:2 /W:5 /NFL /NDL /NP
robocopy "%OUT_DIR%" "%TEMP_DIR%\PSP_GAME\USRDIR\nmap" montim?.acf op_tim0.acf wo_tim.acf wo_tim2.acf /COPY:DAT /R:2 /W:5 /NFL /NDL /NP

REM field
REM robocopy "%OUT_DIR%" "%TEMP_DIR%\PSP_GAME\USRDIR\field" field?.d /COPY:DAT /R:2 /W:5 /NFL /NDL /NP

REM game
robocopy "%OUT_DIR%" "%TEMP_DIR%\PSP_GAME\USRDIR\game" mc_face0.d logos.acf sys.d ttl_dat.d rndname.d smdat.d grade.acf /COPY:DAT /R:2 /W:5 /NFL /NDL /NP

REM scenario voices
REM robocopy "%OUT_DIR%" "%TEMP_DIR%\PSP_GAME\USRDIR\game" sv.pak /COPY:DAT /R:2 /W:5 /NFL /NDL /NP

REM skits
REM robocopy "%OUT_DIR%" "%TEMP_DIR%\PSP_GAME\USRDIR\talk" *.at3 /COPY:DAT /R:2 /W:5 /NFL /NDL /NP

REM btl
robocopy "%OUT_DIR%\btl" "%TEMP_DIR%\PSP_GAME\USRDIR\btl" t???.d /COPY:DAT /R:2 /W:5 /NFL /NDL /NP
robocopy "%OUT_DIR%" "%TEMP_DIR%\PSP_GAME\USRDIR\btl" e.d /COPY:DAT /R:2 /W:5 /NFL /NDL /NP

REM others
robocopy "%OUT_DIR%" "%TEMP_DIR%\PSP_GAME" PARAM.SFO ICON0.PNG PIC1.PNG /COPY:DAT /R:2 /W:5 /NFL /NDL /NP
robocopy "%OUT_DIR%" "%TEMP_DIR%\PSP_GAME\SYSDIR" EBOOT.BIN /COPY:DAT /R:2 /W:5 /NFL /NDL /NP
robocopy "%OUT_DIR%" "%TEMP_DIR%\PSP_GAME\USRDIR" julian.dat /COPY:DAT /R:2 /W:5 /NFL /NDL /NP

if NOT "%~1" == "--disable-qol" (
    copy /y song5-psx.at3 "%TEMP_DIR%\PSP_GAME\USRDIR\song\song5.at3"
)

REM Create ISO using mkisofs.exe
"mkisofs.exe" -quiet -sort filelist.txt -iso-level 4 -xa -A "PSP GAME" -V "" -sysid "PSP GAME" -volset "" -p "NAMCO TALES STUDIO" -publisher "NBGI" -o "%OUT_DIR%\topx.iso" "%TEMP_DIR%"


ENDLOCAL
