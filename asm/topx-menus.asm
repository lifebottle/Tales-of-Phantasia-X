spacer equ 0x6d

; shop spacer (dot)
; 088daf5c 50 00      li      v1,0x50
;          03 24
.org 0x088daf5c
    li v1, spacer ; was 0x50

; shop list pos x
; 088dae2c 20 00      li      a1,0x20
;          05 24
.org 0x088dae2c
    li a1, 0x18 ; was 0x20

; shop list cursor pos x
.org 0x08c29af4
    .db 0x18 ; was 0x20

; shop list page number pos x and y
; 088dac54 a0 00      li      a1,0xa0
;          05 24
; 088dac58 24 00      li      a2,0x24
;          06 24
.org 0x088dac54
    li a1, 0xa2 ; was 0xa0
    li a2, 0x26 ; was 0x24

; better right align
; 088daf8c 60 00      li      a1,0x60
;          05 24
; .org 0x088daf8c
;      li a1, 0x68 ; was 0x60

; change space in ascii2ank conversion table to our spacer
.org 0x08c4989c
    .db spacer ; was 0x10

; char width in menu titles (called from dsp_menu_title)
; 088e05dc 0e 00      _addiu  s2,s2,0xe
;          52 26
; .org 0x088e05dc
;      addiu s2, s2, 0x20

; .org 0x088e11d8
;     addiu v1, v1, 0x6 ; was 0xc

; furigana for main artes menu
; 088b5f44 04 00      bne     s0,zero,LAB_088b5f58
;          00 16
.org 0x088b5f44
    nop

; type of font to use for main artes list (0 = dialogue font, 1 = small kanji, 2 = small font)
; passed to get_special_name
; 088b5d4c 01 00      li      a1,0x1
;          05 24
; .org 0x088b5d4c
;     li a1, 2 ; was 1

; main artes menu list (Cless) - type of font
; 088b5a88 01 00      li      a1,0x1
;          05 24
; .org 0x088b5a88
;      li a1, 2 ; was 1

; main artes list (Cless) - type of font, left side
; 088b581c 01 00      li      a1,0x1
;          05 24
; .org 0x088b581c
;      li a1, 2 ; was 1

; patch some entries in spc_name to force artes to be read as kana
.org 0x08c2e8a4
    ; multi-byte
    .db 0
    ; font type
    .db 0

.org 0x08c2e8b4
    ; multi-byte
    .db 0
    ; font type
    .db 0

.org 0x08c2e8c4
    ; multi-byte
    .db 0
    ; font type
    .db 0

.org 0x08c2e904
    ; multi-byte
    .db 0
    ; font type
    .db 0

.org 0x08c2e804
    ; multi-byte
    .db 0

.org 0x08c2e814
    ; multi-byte
    .db 0

.org 0x08c2e824
    ; multi-byte
    .db 0

.org 0x08c2e864
    ; multi-byte
    .db 0

; NOTE: needs to be edited if message changes
; Replace with whom - hardcoded offset to character num
; 088bf764 02 00      sh      v0,0x2(a3)=>str14_dat[512]
;          e2 a4
.org 0x088bf764
    sh v0, 0x12(a3) ; was 0x2

; NOTE: needs to be edited if message changes
; Rune Bottle "Changed into" message, hardcoded offset to item num
; 088b7d88 02 00      sh      a1,0x2(v1)=>str14_dat[2814]
;          65 a4
.org 0x088b7d88
    sh a1, 0x1c(v1); was 0x2

; NOTE: needs to be edited if message changes
; Rune Bottle "Can't hold anymore", hardcoded offset to item num
; 088b7dac 24 00      _sh     a1,0x24(v1)=>str14_dat[2868]
;          65 a4
.org 0x088b7dac
    sh a1, 0x2a(v1) ; was 0x24

; "has been lit/extinguished", hardcoded offset to item num
; 088b8134 02 00      _sh     s4,0x2(v0)=>str14_dat[2894]
;         54 a4
; .org 0x088b8134
;     sh s4, 0x8(v0) ; was 0x2

; font mode for main menu options
; 088b3f98 01 00      li      a2,0x1
;          06 24
.org 0x088b3f98
    li a2, 0 ; was 1

; 08a28ca8 - table for main menu options (>= 0x80 - sprite, <0x80 - string num)

; 08a28caa - Item sprite, change to string num
.org 0x08a28caa
    .db 7 ; was 0x80

; 08a28caf - Status sprite
.org 0x08a28caf
    .db 8 ; was 0x81

; 08a28cb0 - Customize sprite
.org 0x08a28cb0
    .db 9 ; was 0x82

; 08a28cb1 - Save sprite
.org 0x08a28cb1
    .db 0x0a ; was 0x83

; 08a28cb2 - Load sprite
.org 0x08a28cb2
    .db 0x0b ; was 0x84

; main menu options - x position
; 088b3f58 1c 00      li      a0,0x1c
;          04 24
.org 0x088b3f58
    li a0, 0x14 ; was 0x1c

; dsp_menu_title - pos x
; 088c4594 20 2e      seh     a1,v0
;          02 7c
; disable old centering
; .org 0x088c4594
;      li a1, 0x18

; fix menu title centering
; 088c4574 25 81      jal     FUN_088e0494                      undefined FUN_088e0494()
;          23 0e
.org 0x088c4574
    jal getStringWidth-reloc_base

; shop name - disable centering
; 088dab4c 20 2e      seh     a1,v0
;          02 7c
; .org 0x088dab4c
;      li a1, 0x18

; fix shop name centering
; 088dab2c 25 81      jal     FUN_088e0494                      undefined FUN_088e0494()
;          23 0e
.org 0x088dab2c
    jal getStringWidth-reloc_base

; shop menu help - second column, button prompts, pos x
; 088db13c 74 00      li      a2,0x74
;          06 24
.org 0x088db13c
    li a2, 0x7c

; shop menu help - second column, labels, pos x
; 088db164 84 00      li      a1,0x84
;          05 24
.org 0x088db164
    li a1, 0x8c

; Optional ingredients string pos x in cooking menu
; 088c1b68 c8 00      li      a1,0xc8
;          05 24
.org 0x088c1b68
    li a1, 0xb0 ; was 0xc8

; Requisite string pos x in cooking menu
; 088c1ba4 b8 00      li      a1,0xb8
;          05 24
.org 0x088c1ba4
    li a1, 0xa0 ; was 0xb8

; 08c49dc2 - line-height for big font (used in menu descriptions)
; .org 0x08c49dc2
;     .db 0x0d ; was 0x10

; main item description - pos x
; 088c48a0 30 00      _li     a1,0x30
;          05 24
; .org 0x088c48a0
;      li a1, 0x40 ; was 0x30

; main item description - pos y
; 088c4888 c0 00      li      a2,0xc0
;          06 24
; .org 0x088c4888
;      li a2, 0xbc ; was 0xc0

; main item description - window height
; 08a2980e 44         ??      44h    D
; 08a2980f 00         ??      00h
.org 0x08a2980e
    .dh 0x54 ; was 0x44

; main item menu colon
; 088b920c 3a 00      _li     a2,0x3a
;          06 24
.org 0x088b920c
    li a2, 0x20 ; was 0x3a, changed to space

; main item menu left column pos x
; 088b8eb0 36 00      li      a1,0x36
;          05 24
.org 0x088b8eb0
    li a1, 0x26 ; was 0x36

; main item menu right column pos x
; 088b8ef0 ca 00      _li     a1,0xca
;          05 24
.org 0x088b8ef0
    li a1, 0xc0 ; was 0xca

; main item menu cursor pos x
.org 0x08a28ed4
    .db 0x18 ; was 0x28

; main item menu cursor pos x
.org 0x08a28ed8
    .db 0x9a ; was 0x94

; main item menu top arrow pos x
; 088b8f58 9a 00      li      a2,0x9a
;          06 24
.org 0x088b8f58
    li a2, 0x9c ; was 0x9a

; main item menu bottom arrow pos x
; 088b8f8c 9a 00      li      a2,0x9a
;          06 24
.org 0x088b8f8c
    li a2, 0x9c ; was 0x9a

; main item menu - offset between name and number
; 088b91ec 40 00      addiu   v0,v0,0x40
;          42 24
.org 0x088b91ec
    addiu v0, v0, 0x58 ; was 0x40

; main item menu - item type pos x
; 088c4824 f3 00      li      v0,0xf3
;          02 24
; 088c4828 23 10      subu    v0,v0,v1
;          43 00
.org 0x088c4824
    li v0, 0xc0
    nop

; main menu artes description - pos y
; 088b5f54 c0 00      _li     s0,0xc0
;          10 24
; .org 0x088b5f54
;      li s0, 0xbc ; was 0xc0

; main menu artes description - window height
; 08a28dd6 44         ??      44h    D
; 08a28dd7 00         ??      00h
.org 0x08a28dd6
    .dh 0x54 ; was 0x44

; main menu artes description - TP, number offset
; 088b6134 18 00      li      a3,0x18
;          07 24
; 088b6138 68 1b      jal     FUN_088c6da0                      undefined FUN_088c6da0()
;          23 0e
.org 0x088b6134
    li a3, 0x16 ; was 0x18

; main menu artes description - TP, number of digits
; 088b613c 03 00      _li     t2,0x3
;          0a 24
.org 0x088b613c
    li t2, 0x4 ; was 0x3

; main menu artes description - TP, pos y
; 088b60d4 ac 00      _li     s0,0xac
;          10 24
; .org 0x088b60d4
;      li s0, 0xaa ; was 0xac

; 088b6040 ac 00      _li     s0,0xac
;          10 24
; .org 0x088b6040
;      li s0, 0xaa ; was 0xac

; main menu artes description - Mastery, pos y
; 088b6068 b4 00      li      a2,0xb4
;          06 24
.org 0x088b6068
    li a2, 0xb6 ; was 0xb4

; 088b6000 b4 00      li      a2,0xb4
;          06 24
.org 0x088b6000
    li a2, 0xb6 ; was 0xb4

; title menu description - pos y
; 088c0578 c0 00      li      a2,0xc0
;          06 24
; .org 0x088c0578
;      li a2, 0xbc ; was 0xc0

; title menu description - window size
; 08a29564 30         ??      30h    0
; 08a29565 01         ??      01h
; 08a29566 44         ??      44h    D
; 08a29567 00         ??      00h
.org 0x08a29564
    ; width
    .dh 0x168 ; was 0x130
    ; height
    .dh 0x54 ; was 0x44

; cooking menu description - pos y
; 088c4bcc c0 00      li      a2,0xc0
;          06 24
; .org 0x088c4bcc
;      li a2, 0xbc ; was 0xc0

; equipment menu (left) colon
; 088b7600 3a 00      _li     a2,0x3a
;          06 24
.org 0x088b7600
    li a2, 0x20 ; was 0x3a, replaced with space

; equipment menu (left) item pos x
; 088b75d4 34 00      li      a1,0x34
;          05 24
.org 0x088b75d4
    li a1, 0x24 ; was 0x34

; equipment menu (left) cursor pos x
.org 0x08a28e18
    .db 0x24 ; was 0x34

; equipment menu (left) number offset
; 088b75e4 74 00      li      a0,0x74
;          04 24
.org 0x088b75e4
    li a0, 0x7c ; was 0x74

; equipment menu (right) - equipped items, pos x
; 088b7830 e8 00      li      a1,0xe8
;          05 24
.org 0x088b7830
    li a1, 0xe0 ; was 0xe8

; equipment menu Slash y pos
; 088b78dc 50 00      li      a0,0x50
;          04 24
.org 0x088b78dc
    li a0, 0x4c ; was 0x50

; 088b78ac 44 00      li      a2,0x44
;          06 24
.org 0x088b78ac
    li a2, 0x40 ; was 0x44

; main artes menu - left side, window coords
.org 0x08a28d9c
   ; size x
   .dh 0x94 ; was 0x80
   ; size y
   ; .dh 0x84

; main artes menu - right side, window coords
.org 0x08a28db0
   ; pos x
   .dh 0x9c ; was 0x88
   ; pos y
   .dh 0x20
   ; size x
   .dh 0x9c ; was 0xb0
   ; size y
   .dh 0x84

; main artes menu - right side, artes pos x
; 088b5a50 9c 00      addiu   v0,v0,0x9c
;          42 24
.org 0x088b5a50
    addiu v0, v0, 0xac ; was 0x9c

; main artes menu - right side, current column
; 088b5a2c 01 00      andi    v1,s3,0x1
;          63 32
.org 0x088b5a2c
    move v1, zero  ; forced to one column

; main artes menu - right side, column number
; 088b5a18 43 10      _sra    v0,s3,0x1
;          13 00
.org 0x088b5a18
    move v0, s3

; main artes menu - right side, cursor position
.org 0x08a28cf4
    ; x pos
    .db 0xa4 ; was 0x94
    ; y pos
    .db 0x40

; main artes menu - Auto/Semi-Auto/Manual - window size
.org 0x08a28de4
    .dh 0x9c ; was 0xa0

.org 0x08a28dec
    .dh 0x9c ; was 0xa0

; main artes menu - Auto - cursor, pos x
.org 0x08a28d14
    .dh 0xaa ; was 0xa8

; main artes menu - Semi-Auto - cursor, pos x
.org 0x08a28d1c
    .dh 0xce ; was 0xcc

; main artes menu - Manual - cursor, pos x
.org 0x08a28d24
    .dh 0x102 ; was 0x100

; set_menu_special_max - main artes menu number of columns and rows
; 088b54dc 02 00      li      s2,0x2
;          12 24
; 088b54e0 06 00      li      s1,0x6
;          11 24
.org 0x088b54dc
    li s2, 0x1 ; was 0x2

; FUN_088c4f80 - discard message
; 088c4fec ed 81      jal     add_str_prim                      undefined add_str_prim()
;          23 0e
.org 0x088c4fec
   j discard_msg_stub-reloc_base
   nop

; main artes menu - column width (multiply by 0x58)
; 088b5d04 80 10      sll     v0,v1,0x2
;          03 00
; 088b5d08 21 10      addu    v0,v0,v1
;          43 00
; 088b5d0c 40 10      sll     v0,v0,0x1
;          02 00
; 088b5d10 21 10      addu    v0,v0,v1
;          43 00
; 088b5d14 c0 10      sll     v0,v0,0x3
;          02 00
; 088b5d18 28 00      addiu   v0,v0,0x28
;          42 24
; 088b5d1c 20 86      seh     s0,v0
;          02 7c
.org 0x088b5d04
    li v0, 0x88
    mult v0, v1
    nop
    mflo v0
    nop
    addiu v0, v0, 0x28

; main artes menu - cursor position
; .org 0x08a28d04
;      .db 0x10 ; was 0x20

; main artes menu - cursor position, column width
.org 0x08a28d08
    .db 0x88 ; was 0x58

; main artes menu - number of columns
; 088b5538 03 00      li      s2,0x3
;          12 24
.org 0x088b5538
    li s2, 0x2 ; was 0x3

; main artes menu - number of columns (divide by 3)
; 088b5cc8 55 55      lui     v0,0x5555
;          02 3c
; 088b5ccc 56 55      ori     v0,v0,0x5556
;          42 34
; 088b5cd0 18 00      mult    v0,s3
;          53 00
; 088b5cd4 03 00      li      a2,0x3
;          06 24
; 088b5cd8 c2 2f      srl     a1,s3,0x1f
;          13 00
; 088b5cdc 21 20      move    a0,s2
;          40 02
; 088b5ce0 10 18      mfhi    v1
;          00 00
.org 0x088b5cc8
    sra v1, s3, 1
    li a2, 0x2 ; was 0x3
    srl a1, s3, 0x1f
    move a0, s2
    nop
    nop
    nop

; world map item description window height
; 088ec0e0 44 00      li      v0,0x44
;          02 24
.org 0x088ec0e0
    li v0, 0x54 ; was 0x44

; status screen - equipment slot posx
; 088c21b0 60 00      li      a1,0x60
;          05 24
.org 0x088c21b0
    li a1, 0x68 ; was 0x60

; status screen - equipment name posx
; 088c21f8 88 00      li      a1,0x88
;          05 24
.org 0x088c21f8
    li a1, 0x98 ; was 0x88

; status screen - level number offset
; 088c1ebc 18 00      li      a3,0x18
;          07 24
.org 0x088c1ebc
    li a3, 4 ; was 0x18

; status screen - EXP - number offset
; 088c1f28 08 00      li      a3,0x8
;         07 24
; .org 0x088c1f28
;     li a3, 0x27 ; was 0x8

; status screen - NEXT - number offset
; 088c1f5c 18 00      li      a3,0x18
;          07 24
.org 0x088c1f5c
    li a3, 0x25 ; was 0x18

; status screen - Strength - number offset
; 088c1f90 18 00      li      a3,0x18
;          07 24
.org 0x088c1f90
    li a3, 0x11 ; was 0x18
    jal newWriteStrAndNum-reloc_base
    li t2, 8

; status screen - Constitution - number offset
; 088c1fc4 21 38      move    a3,a1
;          a0 00
.org 0x088c1fc4
    li a3, 0x11 ; was 0x10
    jal newWriteStrAndNum-reloc_base
    li t2, 8

; status screen - Agility - number offset
; 088c1ff8 08 00      li      a3,0x8
;          07 24
.org 0x088c1ff8
    li a3, 0x11 ; was 0x8
    jal newWriteStrAndNum-reloc_base
    li t2, 8

; status screen - Luck - number offset
; 088c202c 21 38      move    a3,a1
;          a0 00
.org 0x088c202c
    li a3, 0x11 ; was 0x10
    jal newWriteStrAndNum-reloc_base
    li t2, 8

; status screen - Slash - pos y
; 088c2068 ac 00      li      a2,0xac
;          06 24
.org 0x088c2068
    li a2, 0xa8 ; was 0xac

; status screen - Slash - number offset
; 088c206c 18 00      li      a3,0x18
;          07 24
.org 0x088c206c
    li a3, 0x11 ; was 0x18
    jal newWriteStrAndNum-reloc_base
    li t2, 8

; status screen - Thrust - number offset
; 088c20a0 18 00      li      a3,0x18
;          07 24
.org 0x088c20a0
    li a3, 0x11 ; was 0x18
    jal newWriteStrAndNum-reloc_base
    li t2, 8

; status screen - Attack - number offset
; 088c20d8 08 00      li      a3,0x8
;          07 24
.org 0x088c20d8
    li a3, 0x11 ; was 0x8
    jal newWriteStrAndNum-reloc_base
    li t2, 8

; status screen - Defense - number offset
; 088c210c 08 00      li      a3,0x8
;          07 24
.org 0x088c210c
    li a3, 0x11 ; was 0x8
    jal newWriteStrAndNum-reloc_base
    li t2, 8

; status screen - Accuracy - number offset
; 088c2140 21 38      li      a3,0
;          00 00
.org 0x088c2140
    li a3, 0x11 ; was 0
    jal newWriteStrAndNum-reloc_base
    li t2, 8

; status screen - Evasion - number offset
; 088c2174 21 38      move    a3,a1
;          a0 00
.org 0x088c2174
    li a3, 0x11 ; was 0x10
    jal newWriteStrAndNum-reloc_base
    li t2, 8

; item stats - evasion, number offset
; 088c4994 14 00      li      a3,0x14
;          07 24
.org 0x088c4994
    li a3, 0xb ; was 0x14

; item stats - element icon, pos y
; 088c4ab0 d0 00      li      a2,0xd0
;          06 24
.org 0x088c4ab0
    li a2, 0xd2 ; was 0xd0

; item stats - defense, number offset
; 088c4978 0c 00      li      a3,0xc
;          07 24
.org 0x088c4978
    li a3, 0xb ; was 0xc

; 088c4918 04 00      li      a3,0x4
;          07 24
.org 0x088c4918
    li a3, 2 ; was 4

; item stats - attack, number of digits
; 088c492c 21 48      _move   t1,a3
;          e0 00
.org 0x088c492c
    li t1, 4

; item stats - slash
; 088c48d8 04 00      li      a3,0x4
;          07 24
; 088c48dc 20 00      li      a0,0x20
;          04 24
; 088c48e0 c0 00      li      a1,0xc0
;          05 24
.org 0x088c48d8
    ; number offset
    li a3, 0xe ; was 0x4
    ; posx
    li a0, 0x10 ; was 0x20
    ; posy
    li a1, 0xc4 ; was 0xc0

; item stats - slash, number of digits
; 088c48ec 21 48      _move   t1,a3
;          e0 00
.org 0x088c48ec
    li t1, 4

; item stats - thrust
; 088c48f4 04 00      li      a3,0x4
;          07 24
; 088c48f8 20 00      li      a0,0x20
;          04 24
; 088c48fc c8 00      li      a1,0xc8
;          05 24
.org 0x088c48f4
    ; number offset
    li a3, 0x8 ; was 0x4
    ; posx
    li a0, 0x10 ; was 0x20
    ; posy
    li a1, 0xce ; was 0xc8

; item stats - thrust, number of digits
; 088c4908 21 48      _move   t1,a3
;          e0 00
.org 0x088c4908
    li t1, 4

; item stats - luck, number offset
; 088c49b0 0c 00      li      a3,0xc
;         07 24
; .org 0x088c49b0
;     li a3, 2 ; was 0xc

; stat-boosting items - Agility, number of digits
; 088bc764 68 1b      jal     FUN_088c6da0                      undefined FUN_088c6da0()
;          23 0e
; 088bc768 03 00      _li     t2,0x3
;          0a 24
.org 0x088bc764
   jal newWriteStrAndNum-reloc_base
   li t2, 9

; stat-boosting items - Strength, number of digits
; 088bc7a0 68 1b      jal     FUN_088c6da0                      undefined FUN_088c6da0()
;          23 0e
; 088bc7a4 03 00      _li     t2,0x3
;          0a 24
.org 0x088bc7a0
   jal newWriteStrAndNum-reloc_base
   li t2, 7

; stat-boosting items - Strength, pos y
; 088bc76c 10 00      addiu   v0,s4,0x10
;          82 26
.org 0x088bc76c
    addiu v0, s4, 0x12 ; was 0x10

; stat-boosting items - TP, pos y
; 088bc700 10 00      addiu   v0,s4,0x10
;          82 26
.org 0x088bc700
    addiu v0, s4, 0x12 ; was 0x10
; customize controls - right arrow pos x
; 088aacd0 21 10      addu    v0,v0,s0
;          50 00
.org 0x088aacd0
    addiu v0, v0, 0x40

; main menu - Gald number offset
; 088b4030 21 38      li      a3,0
;          00 00
.org 0x088b4030
    li a3, 0xd ; was 0

; main menu - Encounters number offset
; 088b40b4 21 38      li      a3,0
;          00 00
.org 0x088b40b4
    li a3, 8 ; was 0

; main menu - Max Hits number offset
; 088b4100 21 38      li      a3,0
;          00 00
.org 0x088b4100
    li a3, 0x1d ; was 0

; main menu - NEXT number offset
; 088b3d48 08 00      li      a3,0x8
;          07 24
.org 0x088b3d48
    li a3, 0x15 ; was 0x8
; titles menu - current title, cursor pos x
.org 0x08a2950c
    .db 0x14 ; was 0x24

; titles menu - cursor table
.org 0x08a29514
    ; pos x
    .db 0x98 ; was 0x90

.org 0x08a29518
    ; column width
    .db 0x68 ; was 0x58

; titles menu - current title, pos x
; 088c026c 24 00      li      a1,0x24
;          05 24
.org 0x088c026c
    li a1, 0x14 ; was 0x24

.org 0x088c0304
    li a1, 0x14 ; was 0x24

; titles menu - left column window width
.org 0x08a29554
    .dh 0x80 ; was 0x78

; titles menu - right column window coords
.org 0x08a29558
    ; pos x
    .dh 0x88 ; was 0x80
    ; pos y
    .dh 0x20
    ; width
    .dh 0xe8 ; was 0xb8

; titles menu - right column text offset
; 088c03f0 90 00      addiu   v0,v0,0x90
;          42 24
.org 0x088c03f0
    addiu v0, v0, 0x98 ; was 0x90

; titles menu - right column size (multiply by 0x58)
; 088c03dc 80 10      sll     v0,v1,0x2
;          03 00
; 088c03e0 21 10      addu    v0,v0,v1
;          43 00
; 088c03e4 40 10      sll     v0,v0,0x1
;          02 00
; 088c03e8 21 10      addu    v0,v0,v1
;          43 00
; 088c03ec c0 10      sll     v0,v0,0x3
;          02 00
.org 0x088c03dc
    li v0, 0x68
    mult v0, v1
    nop
    mflo v0
    nop

; Collector's Book - Completion colon posx
; 088afcdc e0 00      li      a0,0xe0
;          04 24
.org 0x088afcdc
    li a0, 0xcd ; was 0xe0

; Collector's Book - item list posx
; 088afdb4 28 00      addiu   v0,v0,0x28
;          42 24
; .org 0x088afdb4
;      addiu v0, v0, 0x18 ; was 0x28

; Collector's Book - item list column width (multiply by 0x58)
; 088afd9c 18 00      mult    a1,s0
;          b0 00
; 088afda0 80 10      sll     v0,v1,0x2
;          03 00
; 088afda4 21 10      addu    v0,v0,v1
;          43 00
; 088afda8 40 10      sll     v0,v0,0x1
;          02 00
; 088afdac 21 10      addu    v0,v0,v1
;          43 00
; 088afdb0 c0 10      sll     v0,v0,0x3
;          02 00
; 088afdb4 28 00      addiu   v0,v0,0x28
;          42 24
; 088afdb8 20 2e      seh     a1,v0
;          02 7c
; 088afdbc 10 10      mfhi    v0
;          00 00
; 088afdc0 21 18      addu    v1,v0,t0
;          48 00
.org 0x088afd9c
    mult a1, s0
    nop
    mfhi at

    li v0, 0x62
    mult v1, v0
    nop
    mflo v0

    ; item list posx (replaces the original above)
    addiu v0, v0, 0x18 ; was 0x28
    seh a1, v0

    addu v1, at, t0

; Collector's Book number/number, pos x
; 088afc9c 18 00      li      a1,0x18
;          05 24

; Collector's Book - item list column width, cursor
; 089bd138 58         ??      58h    X
.org 0x089bd138
    .db 0x62 ; was 0x58

; Collector's Book - Item list column width, cursor
; 089bd134 28         ??      28h    (
.org 0x089bd134
    .db 0x18 ; was 0x28

; Formation menu - Level label pos x
; 088bfbec 64 00      addiu   v0,s0,0x64
;          02 26
.org 0x088bfbec
    addiu v0, s0, 0x5e ; was 0x64

; Formation menu - Level label draw call
; 088bfc1c 68 1b      jal     FUN_088c6da0                      undefined FUN_088c6da0()
;          23 0e
; 088bfc20 03 00      _li     t2,0x3
;          0a 24
.org 0x088bfc1c
   jal newWriteStrAndNum-reloc_base
   li t2, 0x6 ; was 0x3

; Formation menu - HP/TP, pos x
; 088bfc34 2c 00      addiu   s0,s0,0x2c
;          10 26
; .org 0x088bfc34
;     addiu s0, s0, 0x35 ; was 0x2c

; Formation menu - HP, number pos x
; 088bfc3c 0c 00      li      a3,0xc
;          07 24
.org 0x088bfc3c
    li a3, 0x15

; Formation menu - TP, number pos x
; 088bfc60 0c 00      _li     a3,0xc
;          07 24
.org 0x088bfc60
    li a3, 0x15

; Formation menu - clip box, fix original game bug
.org 0x08a294d0
    .dh 0x5a ; was 0x58

; FUN_088c17b4 - recipe list
; pos x
; 088c190c 2c 00      li      a1,0x2c
;          05 24
.org 0x088c190c
    li a1, 0x1c ; was 0x2c

; 088c18d0 2c 00      li      a1,0x2c
;          05 24
.org 0x088c18d0
    li a1, 0x1c ; was 0x2c

; 088c1894 2c 00      li      a1,0x2c
;          05 24
.org 0x088c1894
    li a1, 0x1c ; was 0x2c

; cursor pos
.org 0x08a29568
    .db 0x1c ; was 0x2c

; sound mode - Voiceover
; 088ddfe0 68 1b      jal     FUN_088c6da0                      undefined FUN_088c6da0()
;          23 0e
; 088ddfe4 04 00      _li     t2,0x4
;          0a 24
.org 0x088ddfe0
   jal newWriteStrAndNum-reloc_base
   li t2, 0xa ; was 0x4

; sound mode - Sound Effect
; 088ddfa8 68 1b      jal     FUN_088c6da0                      undefined FUN_088c6da0()
;          23 0e
; 088ddfac 04 00      _li     t2,0x4
;          0a 24
.org 0x088ddfa8
   jal newWriteStrAndNum-reloc_base
   li t2, 0x7 ; was 0x4

; sound mode - Song
; 088de06c 68 1b      jal     FUN_088c6da0                      undefined FUN_088c6da0()
;          23 0e
; 088de070 04 00      _li     t2,0x4
;          0a 24
.org 0x088de06c
   jal newWriteStrAndNum-reloc_base
   li t2, 0x9 ; was 0x4

; sound mode - Skit
; 088de0b0 68 1b      jal     FUN_088c6da0                      undefined FUN_088c6da0()
;          23 0e
; 088de0b4 04 00      _li     t2,0x4
;          0a 24
.org 0x088de0b0
   jal newWriteStrAndNum-reloc_base
   li t2, 0x9 ; was 0x4

; sound mode - Level, pos x
; 088de144 40 00      li      a1,0x40
;          05 24
.org 0x088de144
    li a1, 0x19 ; was 0x40

; sound mode - Spectrum Analyzer, pos x
; 088de28c a8 00      li      a1,0xa8
;          05 24
.org 0x088de28c
    li a1, 0x71 ; was 0xa8

; sound mode - total time, pos x
; 088de110 38 00      li      a1,0x38
;          05 24
.org 0x088de110
    li a1, 0x30 ; was 0x38

; sound mode - get BGM title pointer
; 088ddef8 93 7b      jal     FUN_088dee4c                      undefined FUN_088dee4c()
;          23 0e
.org 0x088ddef8
    jal get_bgm_title-reloc_base

; sound mode - get voiceover title pointer
; 088de018 73 7b      jal     FUN_088dedcc                      undefined FUN_088dedcc()
;          23 0e
; .org 0x088de018
;      jal get_vo_title-reloc_base

; main item description
; 088c489c 19 1c      jal     draw_menu_knj                     undefined draw_menu_kn
;          23 0e
; 088c48a0 30 00      _li     a1,0x30
;          05 24
.org 0x088c489c
    jal displayWrappedMain-reloc_base

; main artes description
; 088b5fd0 19 1c      jal     draw_menu_knj                     undefined draw_menu_kn
;          23 0e
; 088b5fd4 21 40      _li     t0,0
;          00 00
.org 0x088b5fd0
    jal displayWrappedMain-reloc_base

; main strategy description
; 088bd22c 19 1c      jal     draw_menu_knj                     undefined draw_menu_kn
;          23 0e
; 088bd230 21 40      _li     t0,0
;          00 00
.org 0x088bd22c
    jal displayWrappedMain-reloc_base

; main title description
; 088c057c 19 1c      jal     draw_menu_knj                     undefined draw_menu_kn
;          23 0e
; 088c0580 21 40      _li     t0,0
;          00 00
.org 0x088c057c
    jal displayWrappedMainTitles-reloc_base

; cooking description
; 088c4bd0 19 1c      jal     draw_menu_knj                     undefined draw_menu_kn
;          23 0e
; 088c4bd4 21 40      _li     t0,0
;          00 00
; .org 0x088c4bd0
;      jal displayWrappedMain-reloc_base

; FUN_088b578c - position for SC label
; 088b5894 20 00      li      a1,0x20
;          05 24
; 088b5898 93 00      li      a2,0x93
;          06 24
.org 0x088b5894
    ; pos x
    li a1, 0x24 ; was 0x20
    ; pos y
    li a2, 0x94 ; was 0x93

; NG+ message, window y size
; 08a2978e 78         ??      78h    x
; 08a2978f 00         ??      00h
.org 0x08a2978e
    .dh 0x60 ; was 0x78

; grade shop grade number, number of digits
; 088ba0e4 04 00      li      a2,0x4
;          06 24
; .org 0x088ba0e4
;      li a2, 0x7 ; was 0x4

; grade shop grade number pos x
; 088ba09c b3 00      li      a0,0xb3
;          04 24
.org 0x088ba09c
    li a0, 0xc2 ; was 0xb3

; grade shop Total grade number pos x
; 088ba100 9a 01      li      a0,0x19a
;          04 24
.org 0x088ba100
   li a0, 0x1aa ; was 0x19a

; NOTE: may need to be updated if you add extra accents that require custom sorting
; sort_code_dat -  look-up table for sorting kana
.org 0x08c27704
    .area 256
        .incbin "item-sort-lut.bin"
    .endarea

; FUN_088b8d54 - Key Items label
; 088b8d78 e0 00      li      a1,0xe0
;          05 24
; 088b8d7c 10 00      li      a2,0x10
;          06 24
; 088b8d80 e4 1b      jal     draw_menu_str                     undefined draw_menu_st
;          23 0e
.org 0x088b8d78
    li a1, 0xf0 ; was 0xe0

; 08a28ef4 - Key Items menu - cursor x position
.org 0x08a28ef4
    .db 0xf0 ; was 0xe0

; main item menu height
.org 0x08A28F7A
	.byte 0x54 + 1	; incr by 1 for bottom line descenders

;.org 0x088e2ca4
    ; may need to change these to add some flex at the top

; move down to 0xe0 where image icon is written to
.org 0x08A3AB9A
	.byte 0xe0		; chg from 0, y pos in image
; change where image is read from
.org 0x088c698c
	li t2, 0xe0		; chg from 0, y pos in image 
