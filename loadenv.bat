@echo off
for /f "usebackq tokens=* delims=" %%a in (`powershell -Command "Get-Content .env | Where-Object { $_ -notmatch '^\s*#' -and $_ -notmatch '^\s*$' }"`) do (
    set "%%a"
)
