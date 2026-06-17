; monster book - monster name pos x
; 088f05a4 30 00      li      a0,0x30
;          04 24
.org 0x088f05a4
    li a0, 0x38 ; was 0x30

; monster book - stats x offset (last 3 stats)
; 088f0aac 08 00      li      a3,0x8
;          07 24
.org 0x088f0aac
    li a3, 0x15 ; was 0x8

; 088f0ab8 68 1b      jal     FUN_088c6da0                      undefined FUN_088c6da0()
;          23 0e
.org 0x088f0ab8
   jal newWriteStrAndNum-reloc_base

; 088f0a3c 00 00      lbu     t2,0x0(s3)=>DAT_08c69394          = 06h
;         6a 92
.org 0x088f0a3c
   li t2, 8

; monster book - attack element pos x (label)
; 088f0b3c d0 00      li      a0,0xd0
;          04 24
.org 0x088f0b3c
    li a0, 0xe0 ; was 0xd0

; monster book - attack element pos x (icon)
; 088f115c d0 00      li      a1,0xd0
;          05 24
.org 0x088f115c
    li a1, 0xe0 ; was 0xd0

; monster book - attack element pos x (???? label)
; 088f1288 d8 00      li      a0,0xd8
;          04 24
.org 0x088f1288
    li a0, 0xe8 ; was 0xd8

; monster book - element type, pos x
; 088f0e70 90 00      li      a0,0x90
;          04 24
.org 0x088f0e70
    li a0, 0x93 ; was 0x90

; monster book - element type, pos y
; 088f0df8 48 00      li      s5,0x48
;          15 24
.org 0x088f0df8
    li s5, 0x4a ; was 0x48

; monster book - attack element type, pos y
; 088f1160 48 00      li      a2,0x48
;          06 24
.org 0x088f1160
    li a2, 0x4a ; was 0x48

; monster book - resistance (????), pos y
; 088f1228 48 00      li      a1,0x48
;          05 24
.org 0x088f1228
    li a1, 0x4a ; was 0x48

; monster book - attack element (????), pos y
; 088f128c 48 00      li      a1,0x48
;          05 24
.org 0x088f128c
    li a1, 0x4a ; was 0x48

; monster book - resistance (None), pos x
; 088f1040 88 00      li      a0,0x88
;          04 24
; .org 0x088f1040
;      li a0, 0x93 ; was 0x88

; monster book - resistance (None), pos y
; 088f1044 48 00      li      a1,0x48
;          05 24
.org 0x088f1044
    li a1, 0x4a ; was 0x48

; monster book - attack element (None), pos x
; 088f10bc d8 00      _li     a0,0xd8
;          04 24
.org 0x088f10bc
    li a0, 0xe8 ; was 0xd8

; monster book - attack element (None), pos y
; 088f11c0 48 00      li      a1,0x48
;          05 24
.org 0x088f11c0
    li a1, 0x4a ; was 0x48

; monster book - number, pos y
; 088f0554 28 00      li      a1,0x28
;          05 24
.org 0x088f0554
    li a1, 0x2c ; was 0x28

; replace the old skit event size table
.org 0x08c5d618
.area 0x08c5d81c-.
    monsterbook_sort_lut:
    .incbin OUT_DIR+"/monsterbook-sorting.bin"
.endarea

; monster number (actual index)
; 088f0568 01 00      addiu   a1,fp,0x1
;          c5 27
; 088f056c 03 00      li      a2,0x3
;          06 24
.org 0x088f0568
    jal monsterbook_get_display_number_sorted

; monster number (sequential)
; 088f0688 00 00      lh      a1,0x0(v0)=>DAT_0908afc2          = ??
;          45 84
.org 0x088f0688
    jal monsterbook_get_display_number_seq

; mon_init
; 088f0198 21 40      li      t0,0
;          00 00
; 088f019c 21 38      li      a3,0
;          00 00
; 088f01a0 84 5f      addiu   t2,t2,0x5f84
;          4a 25
; 088f01a4 84 aa      addiu   t1,t1,-0x557c
;          29 25
; 088f01a8 09 09      lui     v1,0x909
;          03 3c
.org 0x088f0198
    jal monsterbookFixNumbering
    nop
    lw ra, 0xc(sp)
    jr ra
    addiu sp, sp, 0x30

; kill reloc
.orga 0x4E90B4
    nop :: nop

.orga 0x4E90C4
    nop :: nop

.orga 0x4E90DC
    nop :: nop

; mon_init - number of monsters
; 088f0050 d2 01      li      v1,0x1d2
;          03 24
.org 0x088f0050
    li v1, 476 ; was 0x1d2

.org 0x08c68ed8
    .incbin OUT_DIR+"/monsterbook/dhaos-stats.bin"

; monster book - divide by 466 for percentage
; 088f07bc a2 8c      lui     v0,0x8ca2
;          02 3c
; 088f07c0 05 9c      ori     v0,v0,0x9c05
;          42 34
; 088f07c4 18 00      mult    v0,a1
;          45 00
; 088f07c8 c2 1f      srl     v1,a1,0x1f
;          05 00
.org 0x088f07bc
    ; replaced with divide by 476
    jal monsterbook_calc_percentage
    nop
    b 0x088f07cc

; Monster Book fixes
.org 0x088f09b0
    li t2, 8
    jal newWriteStrAndNum-reloc_base

.org 0x088f0960
	li a3, 0x15

; update Ishrantu's monster entry to weak to earth
.org 0x08c6624a
    .dh 0xa

; monster book - monster index on first view
.org 0x089bbac8
    ; was set to the fifth entry for some reason
    .db 0x00 ; was 0x04
