; FUN_088c2b78
; naming screen - number of columns
; 088c2c28 04 00      slti    v0,s5,0x4
;          a2 2a
; 088c2c2c 02 00      addiu   s6,s6,0x2
;          d6 26
; 088c2c30 e2 ff      bne     v0,zero,LAB_088c2bbc
;          40 14
.org 0x088c2c28
    ; force one column by noping the check
    addiu s6, s6, 0x2
    nop
    nop

NAME_ENTRY_GLYPHS_PER_ROW equ 0x10
; NOTE: edit if you need more rows than English does
NAME_ENTRY_NUM_ROWS equ 0x5

; naming screen - number of glyphs in column
; 088c2c08 05 00      slti    v0,s3,0x5
;          62 2a
.org 0x088c2c08
    slti v0, s3, NAME_ENTRY_GLYPHS_PER_ROW ; was 0x5

; naming screen - number of rows
; 088c2c18 0b 00      slti    v0,s4,0xb
;          82 2a
.org 0x088c2c18
    slti v0, s4, NAME_ENTRY_NUM_ROWS ; was 0xb

; naming screen - offset between rows
; 088c2c20 0c 00      _addiu  s0,s0,0xc
;          10 26
.org 0x088c2c20
    addiu s0, s0, 0x12 ; was 0xc

; naming screen - offset between columns
; 088c2c34 48 00      _addiu  s1,s1,0x48
;          31 26

; naming screen - glyph draw
; 088c2bf0 79 84      jal     add_ank_prim                      undefined add_ank_prim()
;          23 0e
; 088c2bf4 ff ff      _andi   a0,v0,0xffff
;          44 30
; 088c2bf8 04 00      li      a0,0x4
;          04 24
; 088c2bfc 0d 81      jal     move_str_cursor                   undefined move_str_cur
;          23 0e
.org 0x088c2bf0
    ; changed to big font
    jal add_knj_prim-reloc_base

; naming screen - cursor table (first column)
.org 0x08a29631
    ; y pos
    .db 0x66 ; was 0x64
    ; chars in column
    .db NAME_ENTRY_GLYPHS_PER_ROW ; was 0x5
    ; rows
    .db NAME_ENTRY_NUM_ROWS ; was 0xb
    ; offset between columns
    .db 0x12 ; was 0xc
    ; offset between rows
    .db 0x12 ; was 0xc

; Don't swap cursor mode - LEFT
.org 0x088C2740 :: nop

; Rollover at 16 items - LEFT
.org 0x088C26FC :: li v1,NAME_ENTRY_GLYPHS_PER_ROW
.org 0x088C2734 :: addiu v0,a1,NAME_ENTRY_GLYPHS_PER_ROW-1

; Don't swap cursor mode - RIGHT
.org 0x088C27D8 :: nop

; Rollover at 16 items - RIGHT
.org 0x088C2790 :: li v0,NAME_ENTRY_GLYPHS_PER_ROW
.org 0x088C2798 :: li v0,NAME_ENTRY_GLYPHS_PER_ROW-1
.org 0x088C27CC :: addiu v0,a0,-(NAME_ENTRY_GLYPHS_PER_ROW-1)

; entry count for page swap
.org 0x08a29636
    .dh NAME_ENTRY_NUM_ROWS*NAME_ENTRY_GLYPHS_PER_ROW

; number of chars in name entry
; 088c2d7c 06 00      slti    v0,s1,0x6
;          22 2a
; .org 0x088c2d7c
;      slti v0, s1, 0x7 ; was 0x6

; another number of chars in name entry?
; 088c287c 06 00      slti    v0,s1,0x6
;          22 2a
; .org 0x088c287c
;      slti v0, s1, 0x7 ; was 0x6

; length check for name variable
; 088c2dfc 06 00      slti    v0,a1,0x6
;          a2 28
.org 0x088c2dfc
    slti v0, a1, 0x7 ; was 0x6

; another length for name variable
; 088c2a1c 06 00      slti    v1,a2,0x6
;          c3 28
.org 0x088c2a1c
    slti v1, a2, 0x7 ; was 0x6

; naming screen - top-right window size
.org 0x08a296fc
    .db 0xb0 ; was 0xb4

; naming screen - current name letters pos y
; 088c2d2c 30 00      li      a1,0x30
;          05 24
.org 0x088c2d2c
    li a1, 0x34 ; was 0x30

; naming screen - current name, font type
; 088c2d48 02 00      li      a2,0x2
;          06 24
.org 0x088c2d48
    li a2, 0 ; was 0x2

; FUN_088c2c8c - rename screen, remove reversed name order for Suzu (squares)
; 088c2cd8 06 00      li      v0,0x6
;          02 24
; 088c2cdc 04 00      beql    v1,v0,LAB_088c2cf0
;          62 50
; 088c2ce0 20 00      _li     a1,0x20
;          05 24
.org 0x088c2cd8
    nop :: nop :: nop

; FUN_088c2a30 - rename screen, remove reversed name order for Suzu (cursor)
; 088c2a90 00 00      lhu     v1,0x0(s0)=>party_data
;          03 96
; 088c2a94 06 00      li      v0,0x6
;          02 24
; 088c2a98 02 00      beql    v1,v0,LAB_088c2aa4
;          62 50
; 088c2a9c 60 00      _li     v0,0x60
;          02 24
.org 0x088c2a90
    nop :: nop :: nop :: nop

; expand save description name buffer to 7 spaces
.org 0x08a289fc
    .db 0x81, 0x40
    .db 0x81, 0x40
    .db 0x81, 0x40
    .db 0x81, 0x40
    .db 0x81, 0x40
    .db 0x81, 0x40
    .db 0x81, 0x40
    .db 0x00

; load_game - epilog
; 088ae6a8 08 00      jr      ra
;         e0 03
; 088ae6ac 10 00      _addiu  sp,sp,0x10
;         bd 27
.org 0x088ae6a8
    j npc_name_fix

; add_party_member - epilog
; 088cec54 08 00      jr      ra
;         e0 03
; 088cec58 20 00      _addiu  sp,sp,0x20
;         bd 27
.org 0x088cec54
    j npc_name_fix

; adjustment for name menu - 7 characters
; writing name back to ram
.org 0x088c2998
    slti v0, a3, 0x7
.org 0x088c29a8
    li a1, 0x7
; displaying text squares
.org 0x088c2d7c
    slti v0, s1, 0x7
; move last name x
.org 0x088C2CE4
    li a1, 0x8C
; move last name y
.org 0x088C2D1C
    li a2, 0x36
; move entered name starting x to center-sorta
.org 0x088C2D28
    addiu a0, s0, 0x4
; somethign to do with the arrow pointer..
.org 0x088C287C
    slti v0, s1, 0x7
.org 0x08a29622
    .byte 0x7	; change max cursor to 7
.org 0x088C2618
	slti at, a0, 0x6		; allow keyboard to go to 7th char while typing
.org 0x088c29ac
	addiu a0, a0, lo(0x8dfc6ef-reloc_base)	; change hardcoded addr when counting backwards
							; to be 1 higher, fixes the space at end
