@echo off
where uv >nul 2>nul
if %errorlevel% equ 0 (
    uv venv .\venv
    call venv\Scripts\activate.bat
    uv sync --active
) else (
    python -m venv .\venv
    call venv\Scripts\activate.bat
    pip3 install -r requirements.txt
)
@pause
