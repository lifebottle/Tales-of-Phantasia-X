# COMPTOE
COMPLIB and COMPTOE by Carlos Ballesteros Velasco (soywiz).
This program is part of the "Tales of Eternia - Spanish Translation" project.

Compressed files (both versions 1 and 3) can be unpacked or repacked with `comptoe` in Windows, Linux, and macOS.  
As well, `comptoe` is compatible with other PS1/PS2/PSP games in the "Tales of" series, such as Destiny DC, Destiny 2, Rebirth, etc.  

# Compile Instructions

## Windows
1. Download and extract Tiny C Compiler (tcc.exe) from http://download.savannah.gnu.org/releases/tinycc/
2. Copy `complib.c`, `complib.h`, and `compto.c` to the extracted `tcc` folder.
3. Open a command prompt in the `tcc` directory and enter `tcc complib.c compto.c -o comptoe.exe`

## Linux / macOS
1. `gcc complib.c compto.c -o comptoe.exe`
2. Note there is no extension.  To run, use `./comptoe.exe`

# Links
- https://soywiz.com
- https://blog.tales-tra.com
- https://github.com/talestra
