### Tools

- **topx-dump.py** - dumps script files from ToP PSX (Japanese) and ToPX
- **topx-dump-eng.py** - dumps script files from ToP PSX (Phantasian Productions), needed because the encoding for tags is a bit different
- **topx-dump-monsters.py** - dumps enemy names and artes
- **convert-font.py** - converts the dialogue font to png (with extra padding added for legibility)
- **topx-extract-maps.py** - extracts ToPX (and ToP PSX) map files, requires **comptoe**
- **topx-extract-type1.py** - extracts ToPX (and ToP PSX) type1 (offset and size) archives, requires **comptoe**
- **topx-insertor.py** - dialogue insertor
- **topx-insert-menus.py** - menu text insertor
- **topx-reinsert.py** - repacker for story maps
- **topx-menu-font-width.py** - generates width table for menu font
- **topx-insert-font.py** - inserts dialogue font and generates its width table
- **png2tim.py** - converts bitmaps to TIM

### Files

- talk - audio files for skits (260 vs. 258 in ToP PSX)
- nmap/map_d - map/dialogue files, the same format as ToP PSX
- game/ending.d - ending
- game/sys.d
    - block 00 - menu font, TIM
    - block 01 - main menu graphics and graphical text
    - block 02 - main font, 1bpp, 16x14, left and right halves swapped
- game/menu.d - most menu strings
    - blocks with kana only use an 8-bit encoding
    - blocks with kanji use a 16-bit encoding
    - some of the blocks are copied (and expanded with new strings) in top.prx
- game/monster.d - monster book
- game/nmap.d - contains shop names
- game/grade.acf - graphical text (grade shop)
- game/ttl_dat.d - title screen graphics
- nmap/wo_tim, nmap/wo_tim2 - some graphical text (world map)
- nmap/montim{0-7}.acf - monster graphics
- nmap/op_tim{0-2}.acf - opening credits graphics
- btl/e.d - battle assets, first block is battle menu graphics
- btl/tXXX.d - monster data
    - chunk 08 contains text data
    - enemy names are Shift-JIS (fixed length, 20 bytes, padded with spaces)
    - enemy artes use the 16-bit encoding

### Formats

- type1 - offset and size for each sub-block
    - offsets are just absolute offsets in the file
- type2 - offset and block type for each sub-block (all dialogue blocks are type2)
    - offsets are counted from AFTER the header
    - block type 08 - text
- type3 - just block offsets, no block count or size
- text blocks
    - each text block starts with two ints: base address for events and base address for text
    - text pointers are 16-bit relative
    - C0 usually precedes the pointers and they are usually followed by 01

### Event bytecode

- 00 -> Terminate
- 01 -> Special
   - takes a short value: (op = value & 0xC000 / data = value & 0x3FFF)
   - this loops until stop condition
   - if op == 0x0000:
     - push number
     - if value & 0x3000 == 0x0000:
       - byte
     - if value & 0x3000 == 0x1000:
       - short (takes 1 byte)
     - if value & 0x3000 == 0x2000:
       - int24 (takes 3 bytes)
   - if op == 0x4000:
     - push variable
   - if op == 0x8000:
     - syscall
     - stop (sometimes, and only in opcode 01)
   - if op == 0xC000:
     - if data == 0x0000:
       - pop value to arg
       - stop
     - if data == 0x3FFF:
       - pop var as value
     - else:
       - math operation
- 02 -> Call
   - takes a short as call target
- 03 -> Return
- 04 -> Jump
   - takes a short as jump target
- 05 -> Jump if 0
   - takes a short as jump target
- 06 -> Jump if not 0
   - takes a short as jump target
- 07 -> Special (chained)
   - same as 01, but never stops after a syscall

- 10-22 -> Texboxes
      - Takes a short as text offset

## Differences between ToP PSX and ToPX

- the order of skits is the same, but ToPX has two more skit audio files at the end (re-recordings of skits 257 and 258)
- ToPX has one new text block - a_01_09, the rest of the new text is spread out over old blocks
- the name tag for Rhea changed from char_0007 to char_0008, char_0007 might be Rondoline, but is unused in the actual scripts
- audio tags are added in ToPX

## Hacker Note 1
`top.prx` seems to contain a list of files the game loads. These are mostly `.d` and `.acf` files, so I would look at what format they're in. At a first glance, they're very simple archive formats that start with the number of contained files and then offset/size pairs (or so) for each file. Each individual file seems to be compressed using the same compression as in ToDDC/ToD2, since the header looks the same (1 byte compression type + 4 bytes compressed size + 4 bytes uncompressed size).
> Compto

It probably makes sense to look for the font texture and look how the game gets from characters codes to glyph textures, but that might require a debugger.
> The archive sound like Pak1 too

## Other Notes
1. `sv.pak` can be extracted with `pakcomposer`, appears to be audio files
2. The 3 files in the f `field` folder can be extracted with `pakcomposer` and `comptoe`.
