; Enemy arte routine (Apple Dance)
; 088a2a94 01 00      li      a2,0x1
;          06 24
; 088a2a98 21 20      move    a0,s2
;          40 02
; 088a2a9c 21 28      move    a1,s0
;          00 02
; 088a2aa0 21 38      move    a3,a2
;          c0 00
; 088a2aa4 3c 00      li      t0,0x3c
;          08 24
; 088a2aa8 71 26      jal     FUN_088899c4                      undefined FUN_088899c4()
;          22 0e
; force 1-byte encoding
.org 0x088a2a94
    li a2, 0 ; was 1

.org 0x088a2aa0
    li a3, 1 ; was copied from a2

; Enemy arte routine (Demeter)
; 0882fde8 01 00      xori    a2,v0,0x1
;          46 38
; 0882fdec 4b 00      li      t0,0x4b
;          08 24
; 0882fdf0 71 26      jal     FUN_088899c4                      undefined FUN_088899c4()
;          22 0e

; FUN_0887653c - battle string draw
; 0887684c 01 00      li      t0,0x1
;          08 24
; 08876850 ed 81      jal     add_str_prim                      undefined add_str_prim()
;          23 0e
; .org 0x0887684c
;      li t0, 0 ; was 1

; FUN_0887737c - battle string draw
; 0887774c 01 00      li      t0,0x1
;          08 24
; 08877750 ed 81      jal     add_str_prim                      undefined add_str_prim()
;          23 0e
; .org 0x0887774c
;      li t0, 0; was 1

; FUN_088781ec - battle string draw
; 08878574 01 00      li      t0,0x1
;          08 24
; 08878578 ed 81      jal     add_str_prim                      undefined add_str_prim()
;          23 0e
; force 1-byte encoding
; .org 0x08878574
;      li t0, 0 ; was 1

; FUN_08878fdc - battle string draw
; 08879320 01 00      li      t0,0x1
;          08 24
; 08879324 ed 81      jal     add_str_prim                      undefined add_str_prim()
;          23 0e
; force 1-byte encoding
; .org 0x08879320
;      li t0, 0 ; was 1

; FUN_0887a93c - battle string draw
; 0887a9b0 01 00      li      t0,0x1
;          08 24
; 0887a9b4 ed 81      jal     add_str_prim                      undefined add_str_prim()
;          23 0e
; force 1-byte encoding
; .org 0x0887a9b0
;      li t0, 0 ; was 1

; FUN_0887c0f0 - battle string draw
; 0887c434 01 00      li      t0,0x1
;          08 24
; 0887c438 ed 81      jal     add_str_prim                      undefined add_str_prim()
;          23 0e
; force 1-byte encoding
; .org 0x0887c434
;      li t0, 0 ; was 1

; FUN_08889a48 - battle string draw
; 08889a8c 71 26      jal     FUN_088899c4                      undefined FUN_088899c4()
;          22 0e
; 08889a90 01 00      _li     a2,0x1
;          06 24
; force 1-byte encoding
; .org 0x08889a8c
;      li a2, 0 ; was 1

; battle debug menu width
; 089b09c8 50         ??      50h    P
; 089b09c9 00         ??      00h
.org 0x089b09c8
    .dh 0x60 ; was 0x50

; Dhaos Laser
; 08892ac0 01 00      li      a2,0x1
;          06 24
; 08892ac4 21 28      move    a1,s0
;          00 02
; 08892ac8 21 20      move    a0,s2
;          40 02
; 08892acc 21 38      move    a3,a2
;          c0 00
; forced encoding to 1-byte
.org 0x08892ac0
    li a2, 0 ; was 0x1

.org 0x08892acc
    li a3, 1 ; was copied from a2

; enemy name popup - counting chars until space
; 089824b0 21 38      li      a3,0
;          00 00
; 089824b4 21 20      li      a0,0
;          00 00
; 089824b8 10 00      li      v1,0x10
;          03 24
;                  LAB_089824bc                      XREF[1]: 089824dc(j)  
; 089824bc 21 10      addu    v0,s5,a0
;          a4 02
; 089824c0 00 00      lb      v0,0x0(v0)
;          42 80
; 089824c4 08 00      beql    v0,v1,LAB_089824e8
;          43 50
; 089824c8 00 00      _lh     v1,0x0(a2)
;          c3 84
; 089824cc 05 00      beq     v0,zero,LAB_089824e4
;          40 10
.org 0x089824b0
    ; replace with out string width call
    jal getStringWidthMenu
    ; s5 - string offset
    move a0, s5
    ; a3 - original char count
    move a3, v0

; enemy name popup - branch for negative char length
; 089824f8 03 00      bgez    a3,LAB_08982508
;          e1 04
; 089824fc 3e 00      _sh     v1,local_2(sp)
;          a3 a7
; 08982500 01 00      addiu   v0,a3,0x1
;          e2 24
; 08982504 43 10      sra     v0,v0,0x1
;          02 00
.org 0x089824f8
    ; skip the entire branch
    b 0x08982508

; enemy name popup - another instance of char counting up to 0x16 bytes
; 089824e0 01 00      _addiu  a3,a3,0x1
;          e7 24
.org 0x089824e0
    nop

; enemy name popup - multiply halved char width by 8 (for centering?)
; 08982508 c0 18      sll     v1,v0,0x3
;          02 00
.org 0x08982508
    ; already has pixel width, no need to multiply
    move v1, a3

; enemy name popup - multiply char count by 8 to get width
; 0898253c c0 88      sll     s1,a3,0x3
;          07 00
.org 0x0898253c
    ; already has pixel width, no need to multiply
    move s1, a3

; enemy name popup - branch for odd number of chars
; 08982514 02 00      beq     v0,zero,LAB_08982520
;          40 10
; 08982518 00 00      _nop
;          00 00
; 0898251c fe ff      addiu   v0,v0,-0x2
;          42 24
.org 0x08982514
    ; skip the entire branch
    b 0x08982520

; Enemy artes routine Conceal (Neo Dhaos)
; 08894ea8 01 00      li      a2,0x1
;          06 24

; 08894ec4 21 38      move    a3,a2
;          c0 00
; 08894ec8 5a 00      li      t0,0x5a
;          08 24
; 08894ecc 71 26      jal     btl_msg_disp                      undefined btl_msg_disp()
;          22 0e

; force 1-byte encoding
.org 0x08894ea8
    li a2, 0 ; was 1

.org 0x08894ec4
    li a3, 1 ; was copied from a1

; FUN_08887494 - arte popup
; encoding for arte popup
; 088874c8 84 00      lb      t0,0x84(s2)
;          48 82
.org 0x088874c8
   ; force encoding to 1-byte (fixes Origin's Collapse, possibly others)
   li t0, 0

; arte popup width
; 08887400 43 20      _sra    a0,v1,0x1
;          03 00
.org 0x08887400
    ;sra a0, v1, 0x2
    ; commented out 
    ; no longer needed with proper width code

; arte popup proper width
.org 0x088873ec
	jal getStringWidth-reloc_base

; battle arte menu width
.org 0x089B0910
	.byte 0x40 + 0x20	; incr width from 40 to 60

; battle item menu height
.org 0x089B096E
	.byte 0x60 + 1	; incr by 1 for bottom line descenders

; battle item description
; 0887c404 ed 81      jal     add_str_prim                      undefined add_str_prim()
;          23 0e
; 0887c408 21 48      _li     t1,0
;          00 00
.org 0x0887c404
    jal displayWrappedBattle-reloc_base

; battle artes description
; 088761dc ed 81      jal     add_str_prim                      undefined add_str_prim()
;          23 0e
; 088761e0 21 48      _li     t1,0
;          00 00
.org 0x088761dc
    jal displayWrappedBattle-reloc_base

; battle strategy description
; 088792f0 ed 81      jal     add_str_prim                      undefined add_str_prim()
;          23 0e
; 088792f4 21 48      _li     t1,0
;          00 00
.org 0x088792f0
    jal displayWrappedBattle-reloc_base

; battle artes menu (Cless) - left window coords
.org 0x089b0828
    ; width
    .dh 0x90 ; was 0x80

; battle artes menu (Cless) - right window coords
.org 0x089b082c
    ; pos x
    .dh 0x100 ; was 0xf0
    ; pos y
    .dh 0x20
    ; width
    .dh 0x70 ; was 0x80

; battle items/artes description window height
; 089b081a 44         ??      44h    D
; 089b081b 00         ??      00h
.org 0x089b081a
    .dh 0x54 ; was 0x44

; arte popup - width for auto-centering
; 08982854 80 18      sll     v1,v0,0x2
;          02 00

; FUN_08887494 - draw text box for arte popup (a1 = width)
; 089828d0 0c 00      _addiu  a2,s0,0xc
;          06 26

; FUN_088a6770 - shift-jis conversion - prolog
; 088a677c 9b 08      lui     a3,0x89b
;          07 3c
; 088a6780 10 00      li      a2,0x10
;          06 24
; 088a6784 d0 10      addiu   a3,a3,0x10d0
;          e7 24

; 088a6788 00 00      lhu     t0,0x0(a1)
;          a8 94
; .org 0x088a6788
;     ; skip past the old conversion code
;     b 0x088a67c4
;     lbu v1, 0x0(a1)

; 088a67c8 02 00      addiu   a1,a1,0x2
;          a5 24
; .org 0x088a67c8
;      ; new encoding is 8-bit
;      addiu a1, a1, 0x1 ; was 0x2

; call to sjis memcpy (enemy names)
; 08857434 dc 99      jal     FUN_088a6770                      undefined FUN_088a6770()
;          22 0e
; 08857438 5f 00      _sb     s0,0x5f(s3)
;          70 a2
.org 0x08857434
    jal get_monster_name-reloc_base

; 088a6794 00 00      lhu     v1,0x0(t2)=>DAT_089b10d0          = 4081h
;          43 95                                                = 4A81h
; .org 0x088a6794

; btl_msg_disp
; arte popup routine
; 08889a34 02 2b      jal     FUN_0888ac08                      undefined FUN_0888ac08()
;          22 0e
.org 0x08889a34
    jal get_battle_arte_popup_name-reloc_base

; tokugi_start - mastered message
; 08837674 02 2b      jal     FUN_0888ac08                      undefined FUN_0888ac08()
;          22 0e
; 08837678 20 00      _addiu  a0,sp,0x20
;          a4 27
.org 0x08837674
   jal masteredMsg-reloc_base
   addiu a0, sp, 0x20
   nop
   nop
   nop
   nop
   nop

; battle item primitive coords 
; pos x
; 088a696c 08 00      sh      v0,0x8(s1)
;          22 a6
; pos y
; 088a6970 02 00      lh      v0,0x2(s2)
;          42 86
; 088a6974 47 46      jal     FUN_0899191c                      undefined FUN_0899191c()
;          26 0e
; 088a6978 0a 00      _sh     v0,0xa(s1)
;          22 a6
;
.org 0x088a696c
    jal battle_item_yoffs_stub
    sh v0, 0x8(s1)

; battle item list colon x offset
; 0887c2ec 40 00      addiu   v0,v0,0x40
;          42 24
.org 0x0887c2ec
    addiu v0, v0, 0x48 ; was 0x40

; battle item list colon
; 0887c2fc 2d 00      _li     a3,0x2d
;          07 24
.org 0x0887c2fc
    li a3, spacer ; was 0x2d

; battle item list number offset
; 0887c30c 08 00      addiu   v1,v1,0x8
;          63 24

; battle artes menu - glyph width
; 088a6b20 08 00      addiu   v0,v0,0x8
;          42 24
; 088a6b24 2c 00      sh      v0,local_4(sp)
;          a2 a7
.org 0x088a6b20
    jal battle_arte_width_stub
    nop

; battle artes menu - TP label, position
; 089b08bc 10         ??      10h
; 089b08bd 01         ??      01h
.org 0x089b08bc
    ; pos x
    .dh 0x118 ; was 0x110
    ; pos y
    .dh 0xaa ; was 0xac

; battle artes menu - TP number, position
; 089b08c0 48         ??      48h    H
; 089b08c1 01         ??      01h
.org 0x089b08c0
    ; pos x
    .dh 0x14e ; was 0x148
    ; pos y
    .dh 0xaa ; was 0xac

; Battle Formation menu pos x
; 0887a988 28 00      li      a0,0x28
;          04 24
.org 0x0887a988
    li a0, 0x08 ; was 0x28

; battle menu artes description - pos y
; 088761b4 c0 00      li      a1,0xc0
;          05 24
; .org 0x088761b4
;      li a1, 0xbc ; was 0xc0

; FUN_08837560 - arte mastered routine
; increase fixed dest buffer on the stack

; 08837560 c0 ff      addiu   sp,sp,-0x40
;          bd 27
.org 0x08837560
    addiu sp, sp, -0xa0

; 0883772c 40 00      _addiu  sp,sp,0x40
;          bd 27
.org 0x0883772c
    addiu sp, sp, 0xa0

; disable old code that skipped past the first 3 chars in arcane names
; 088375f4 03 00      li      a1,0x3
;          05 24
.org 0x088375f4
    li a1, 0 ; was 0x3

; battle menu font select
; 08875ccc 01 00      li      a1,0x1
;          05 24
; .org 0x08875ccc
;      li a1, 2 ; was 1

; Make battle arte menus 2 column
COL_WIDTH equ 0x7A
div_mod_end equ 0x887639c

; div/mod by 2 instead of 3
.org 0x08876354
.area div_mod_end-.,0x00
; The logic in C is:
; pos.x = (index % COL_COUNT) * COL_WIDTH + 0x80;

li v1, COL_WIDTH
andi v0,a3,1
subu v0,zero,v0
and v0,v0,v1
addiu v0,v0,0x80
sh v0,0(a0)

; pos.y = (index / COL_COUNT) * ROW_HEIGHT + 0x54;
sra a3,a3,1
sll a3,a3,4
addiu a3,a3,0x54
sh a3,2(a0)
b div_mod_ret
nop
.endarea

.org 0x08876534
div_mod_ret:

; Only update rows each 2 items
.org 0x0887693C :: nop

; Rollover - LEFT
; .org 0x8876b2c :: nop
; .org 0x8876b4c :: nop
.org 0x08876BD4 :: li v0,1

; Rollover at 9 items - RIGHT
.org 0x08876C6C :: li v0,0x9
.org 0x08876D48 :: li v0,0x8

; Rollover - UP
.org 0x08876A14 :: addiu v0,v0,-2
.org 0x088769DC :: slti v0,v0,2
.org 0x088769E0 :: slti at,v0,2
.org 0x08876A04 :: slti v0,v0,2

; Rollover at 9 items - DONW
.org 0x08876A50 :: slti at,v0,0x8
.org 0x08876A64 :: addiu v0,v0,2

; draw only 2 columns
.org 0x0887672C :: nop
.org 0x088767B8 :: slti v0,s1,0x2

; adjust second colum pos
.org 0x088767B4 :: addiu v1,COL_WIDTH

; update max scroll down amount
.org 0x08875AC8 :: addiu a0,v1,-10
.org 0x08875AD4 :: sra v1,a0,1
; fixes missing remainder of the last row
.org 0x08875AD8 :: andi v0, a0, 1 :: addu v1, v0, v1 :: nop
.org 0x08875AE4 :: nop :: nop :: nop
.org 0x08875ac0 :: slti at, v1, 10

; hardcoded SC in battle artes menu
; 08877548 44 00      li      v0,0x44
;         02 24
; 0887754c 3c 00      sb      v0,local_14(sp)
;         a2 a3
; 08877550 34 00      li      v0,0x34
;         02 24
; 08877554 3d 00      sb      v0,local_13(sp)
;         a2 a3
; .org 0x08877548
;     li v0, 0x43 ; was 0x44

; MAX HIT BONUS - number of sprites
; 08888c2c 03 00      slti    v0,s4,0x3
;          82 2a
; .org 0x08888c2c
;     slti v0, s4, 0x2 ; was 0x3

; MAX HIT BONUS - starting sprite ID
; 08888c10 4a 00      addiu   v0,v0,0x4a
;          42 24
; .org 0x08888c10
;     addiu v0, v0, 0x4b ; was 0x4a

; MAX HIT BONUS - pos x
; MAX
; 089b0a34 a8 00      undef   00A8h
; HIT
; 089b0a36 d4 00      undef   00D4h
; BONUS
; 089b0a38 f8         ??      F8h
; .org 0x089b0a34
;     .dh 0xba; was 0xa8
;     .dh 0xe8 ; was 0xd4
