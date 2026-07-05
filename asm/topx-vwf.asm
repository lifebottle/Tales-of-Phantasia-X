; NOTE: you need to change this if you added new glyphs
vwf_glyphs_end equ 0x90

discard_ptr equ 0x8C48698
; 088e2980 
; slti for number of lines
; then addiu for 0x44 buffer size

.org 0x088E2C7C 
    li v1, 0x54     ; new start x-pos for box text printing
                    ; changed from 0x7c

; opening
.org 0x088e2c58		
	li v1, 0x54     ; new start x-pos for box text printing
                    ; changed from 0x7c

.org 0x088e3340
    li a3, 0x140    ; new box width
                    ; changed from 0xE8

.org 0x088E2CF0
    li a1, 0x50     ; new starting x-pos for box
                    ; changed from 0x7c

.org 0x088e2eb8
    addiu v0, v0, 0x123     ; new x-pos for circle prompt button
                            ; changed from 0xd6

; add_knj_prim - prolog
; 088e0d6c ff ff      andi    s1,a0,0xffff
;          91 30
; 088e0d70 01 07      slti    at,s1,0x701
;          21 2a
.org 0x088e0d6c
    j add_knj_prim_prolog_stub
    nop

; add_knj_prim - char width
; 088e109c 08 09      lui     v1,0x908
;          03 3c
; 088e10a0 44 7b      lh      a0,offset csr_w(v1)               = ??
;          64 84
; 088e10a4 08 09      lui     v1,0x908
;          03 3c
; 088e10a8 0e 00      addiu   a0,a0,0xe
;          84 24
.org 0x088e10a4
    j add_knj_prim_width_stub-0x2200
    nop

; add_knj_prim - epilog
; 088e10c0 08 00      jr      ra
;          e0 03
; 088e10c4 10 00      _addiu  sp,sp,0x10
;          bd 27
; .org 0x088e10c4
;      addiu sp, sp, 0x14 ; was 0x10

; set_top_win_adr prolog
; 088e1858 ff ff      andi    v1,v0,0xffff
;          43 30
; 088e185c 0f 00      li      v0,0xf
;          02 24
.org 0x088e1858
    j set_top_win_adr_stub
    andi v1, v0, 0xffff

; set_top_win_adr char width
; 088e1898 0e 00      addiu   s5,s5,0xe
;          b5 26
org 0x088e1898
    addu s5, s5, t0

; set_top_win_adr window width
; 088e18d0 e0 01      li      v0,0x1e0
;          02 24
; 088e18d4 23 18      subu    v1,v0,s5
;          55 00
; org 0x088e18d0
;      j set_top_win_adr_width
;      nop

; add_ank_prim - kana font width
; 088e13c4 08 09      lui     v1,0x908
;          03 3c
; 088e13c8 08 00      addiu   a0,a0,0x8
;          84 24
.org 0x088e13c4
   j add_ank_prim_width_stub-0x2200
   nop

; kana font y pos
; 088e12d0 0a 00      sh      t2,0xa(v1)
;          6a a4
; 088e12d4 0c 00      sb      t4,0xc(v1)
;          6c a0
.org 0x088e12d0
    j menu_get_char_yoffs
    nop

; add_ank_prim prolog
; 088e11e4 c5 08      lui     v1,0x8c5
;          03 3c
; 088e11e8 6c 9d      lhu     a2,-0x6294(v1)=>ank_cnv_tbl       = 00CDh
;          66 94
.org 0x088e11e4
    j add_ank_prim_prolog_stub-0x2200
    nop

; add_ank_prim dakuten/handakuten
; 088e1304 2d 00      beq     v1,zero,LAB_088e13bc
;          60 10
.org 0x088e1304
    b 0x088e13bc

; disable play time animation for now
;                  s_%3d_%02d_08a28cc8               XREF[2]: FUN_088b413c:088b419c(
;                                                             08a28cd8(*)  
; 08a28cc8 25 33      ds      "%3d %02d"
;          64 20 
;          25 30 
; .org 0x08a28cc8
;      .asciiz "%3d:%02d"

; FUN_088b413c - animated play time
; 088b4214 21 30      li      a2,0
;          00 00
; 088b4218 21 38      li      a3,0
;          00 00
.org 0x088b4214
    jal play_time_stub
    nop

; FUN_088a6a34 - battle item glyph width
; 088a6a84 08 00      addiu   v0,v0,0x8
;          42 24
; 088a6a88 1c 00      sh      v0,local_4(sp)
;          a2 a7
.org 0x088a6a84
    jal battle_item_width_stub
    nop

; kana-to-sjis table
.org 0x08c49e78
    ; patch our a-z to sjis full width a-z
    .db 0x82, 0x81
    .db 0x82, 0x82
    .db 0x82, 0x83
    .db 0x82, 0x84
    .db 0x82, 0x85
    .db 0x82, 0x86
    .db 0x82, 0x87
    .db 0x82, 0x88
    .db 0x82, 0x89
    .db 0x82, 0x8a
    .db 0x82, 0x8b
    .db 0x82, 0x8c
    .db 0x82, 0x8d
    .db 0x82, 0x8e
    .db 0x82, 0x8f
    .db 0x82, 0x90
    .db 0x82, 0x91
    .db 0x82, 0x92
    .db 0x82, 0x93
    .db 0x82, 0x94
    .db 0x82, 0x95
    .db 0x82, 0x96
    .db 0x82, 0x97
    .db 0x82, 0x98
    .db 0x82, 0x99
    .db 0x82, 0x9a

   ; make_msg_buf - remove special handling for quote character
   ; 088e1e9c 12 00      li      v1,0x12
   ;          03 24
   ; 088e1ea0 70 00      beq     a0,v1,LAB_088e2064
   ;          83 10
   .org 0x088e1e9c
        nop
        nop
