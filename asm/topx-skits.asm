; old skit lip debug
; 088e6c98 0e 00      beq     v1,zero,LAB_088e6cd4
;          60 10
; 088e6c9c 00 00      _nop
;          00 00
; 088e6ca0 08 00      li      a0,0x8
;          04 24
; 088e6ca4 21 28      move    a1,a0
;          80 00
; 088e6ca8 04 81      jal     set_str_cursor                    undefined set_str_curs
;          23 0e
; 088e6cac 21 30      _li     a2,0
;          00 00
; 088e6cb0 09 09      lui     v0,0x909
;          02 3c
; 088e6cb4 5c 8e      lh      a1,-0x71a4(v0)=>DAT_09088e5c      = ??
;          45 84
; 088e6cb8 05 00      li      a2,0x5
;          06 24
; 088e6cbc 21 38      li      a3,0
;          00 00
; 088e6cc0 09 09      lui     v0,0x909
;          02 3c
; 088e6cc4 84 8e      lw      a0,-0x717c(v0)=>DAT_09088e84      = ??
;          44 8c
; 088e6cc8 21 40      li      t0,0
;          00 00
; 088e6ccc 86 81      jal     add_dec_prim                      undefined add_dec_prim()
;          23 0e
; 088e6cd0 21 48      _li     t1,0
;          00 00

; replaced old skit debug
.org 0x088e6c98
    j display_skit_stub
    nop

; FUN_088e77e8 (tsce_talk_parameter)
; 088e7948 03 00      sb      zero,0x3(v0)=>DAT_09088c5f        = ??
;          40 a0
; 088e794c 02 00      lbu     v1,0x2(v0)=>DAT_09088c5e          = ??
;          43 90
; 088e7950 08 00      ori     v1,v1,0x8
;          63 34
; increment current string on lip flap
.org 0x088e7948
    jal increment_skit_str

; exec_sce_talk
; note: Phantasian Productions did this hook at 88e6b44
; 088e6d68 64 00      li      a0,0x64
;          04 24
; reset current string on skit fade-out
.org 0x088e6d68
    jal reset_skit_str

; read skit size from skit header instead of table
.org 0x088e81fc
    lhu a2, 0x4(a1)

; snd_set_r_voice prolog, s4 = voice clip number
; 088cb2a4 21 a8      move    s5,a1
;          a0 00
.org 0x088cb2a4
   jal btl_quote_set

; snd_end_r_voice epilog
; 088cb5c0 08 00      jr      ra
;          e0 03
; 088cb5c4 10 00      _addiu  sp,sp,0x10
;          bd 27
.org 0x088cb5c0
    j btl_quote_stop

; battle_init epilog
; 08828bc8 08 00      jr      ra
;          e0 03
; 08828bcc 10 00      _addiu  sp,sp,0x10
;          bd 27
.org 0x08828bc8
    j btl_quote_stop

; snd_break_voice
; 088cb6ec ce a4      jal     sndStrStop                        undefined sndStrStop()
;          24 0e
; .org 0x088cb6ec
;      jal btl_quote_stop-reloc_base

; sndStrStop epilog
; 08929394 08 00      jr      ra
;          e0 03
; 08929398 21 10      _li     v0,0
;          00 00
; .org 0x08929394
;      j btl_quote_stop

; FUN_08889908 - battle draw routine
; 08889954 21 80      li      s0,0
;          00 00
; 08889958 21 88      addu    s1,s2,at
;          41 02
.org 0x08889954
    jal display_quote_stub

; arte popup text y pos
; 088874c4 0e 00      _li     a1,0xe
;          05 24
.org 0x088874c4
    li a1, 0x1e ; was 0xe

; FUN_08982738 - arte popup routine
; 0898289c 09 00      _li     a3,0x9
;          07 24
; art popup frame y pos
.org 0x0898289c
    li a3, 0x19 ; was 0x9

; 089828b8 09 00      _li     a3,0x9
;          07 24
.org 0x089828b8
    li a3, 0x19 ; was 0x9

; 089828f0 09 00      _li     a3,0x9
;          07 24
.org 0x089828f0
    li a3, 0x19 ; was 0x9

; cooking menu routine epilog
; 088c4bec 08 00      jr      ra
;          e0 03
; 088c4bf0 30 00      _addiu  sp,sp,0x30
;          bd 27

; cooking recipe description draw
; 088c4bd0 19 1c      jal     draw_menu_knj                     undefined draw_menu_kn
;          23 0e
; 088c4bd4 21 40      _li     t0,0
;          00 00
.org 0x088c4bd0
    jal display_cooking_stub-reloc_base

; cooking recipe message routine epilog
; 088c149c 08 00      jr      ra
;          e0 03
; 088c14a0 10 00      _addiu  sp,sp,0x10
;          bd 27

; displaying the recipe icon and name
; 088c4b34 ff ff      addiu   v0,v0,-0x1
;          42 24
; 088c4b38 72 1a      jal     FUN_088c69c8                      undefined FUN_088c69c8()
;          23 0e
; .org 0x088c4b38
;      jal recipe_skip_icon-reloc_base

; cooking recipe "Ingredients Used" draw
; 088c13a0 e4 1b      jal     draw_menu_str                     undefined draw_menu_st
;          23 0e
; 088c13a4 01 00      _li     t0,0x1
;          08 24
.org 0x088c13a0
    jal btl_quote_stop_cooking-reloc_base

; msg_window_frame epilog
; 088e32d0 08 00      jr      ra
;          e0 03
; 088e32d4 10 00      _addiu  sp,sp,0x10
;          bd 27
.org 0x088e32d0
    j display_quote_nmap

; vsync_loop - Groovy Arche, draw call
; 0893a608 6c 10      addiu   param_1,s0,0x106c
;          04 26
; 0893a60c 21 28      li      a1,0
;          00 00
; .org 0x0893a608
;      jal display_quote_arche

; game_mode_arche - epilog
; 088af128 08 00      jr      ra
;          e0 03
; 088af12c 30 00      _addiu  sp,sp,0x30
;          bd 27
; blank out phantom Groovy Arche subs
.org 0x088af128
    j btl_quote_stop_stub

; game_mode_sndmode - epilog
; 088ae9dc 08 00      jr      ra
;          e0 03
; 088ae9e0 10 00      _addiu  sp,sp,0x10
;          bd 27
; get rid of phantom subs after exiting sound mode
.org 0x088ae9dc
    j btl_quote_stop_stub

; dsp_menu_custom_main - row gap (text)
; 088ab5ec 0f 00      addiu   s5,s5,0xf
;          b5 26
.org 0x088ab5ec
    .ifndef disable_qol
        addiu s5, s5, 0xd ; was 0xf
    .else
        addiu s5, s5, 0xe ; was 0xf
    .endif

; menu_custom_main - row gap (cursor)
; 08a55e55 0f         ??      0Fh
.org 0x08a55e55
    .ifndef disable_qol
        .db 0x0d ; was 0xf
    .else
        .db 0x0e ; was 0xf
    .endif

; menu_custom_main - number of items (cursor)
; 08a55e56 0e         ??      0Eh
.org 0x08a55e56
    .ifndef disable_qol
        .db 0x10 ; was 0xe
    .else
        .db 0xf ; was 0xe
    .endif

; menu_custom_main - number of values
; 088a972c 0d 00      sltiu   at,v0,0xd
;          41 2c
.org 0x088a972c
    .ifndef disable_qol
        sltiu at, v0, 0xf ; was 0xd
    .else
        sltiu at, v0, 0xe ; was 0xd
    .endif

; FUN_088aad58 - number of items (cursor) in full customize menu (overwrites the above)
; 088aafb4 0b 00      li      v1,0xb
;          03 24
.org 0x088aafb4
    .ifndef disable_qol
        li v1, 0xd ; was 0xb
    .else
        li v1, 0xc ; was 0xb
    .endif

; FUN_088aad58 - number of items (cursor) in normal customize menu (overwrites the above)
; 088aafa8 0c 00      _li     v1,0xc
;          03 24
.org 0x088aafa8
    .ifndef disable_qol
        li v1, 0xe ; was 0xc
    .else
        li v1, 0xd ; was 0xc
    .endif

; Combo Counter label ypos
; 088ab1ac 21 30      move    a2,s3
;          60 02

; Combo Counter ON/OFF ypos
; 088ab53c 21 48      move    t1,s3
;          60 02

; dsp_menu_custom_main - number of toggles to draw
; 088ab5e8 0c 00      slti    v0,s0,0xc
;          02 2a
.org 0x088ab5e8
    .ifndef disable_qol
        slti v0, s0, 0xe ; was 0xc
    .else
        slti v0, s0, 0xd ; was 0xc
    .endif

; dsp_menu_custom_main - number of labels to draw
; 088ab0e8 0b 00      li      v0,0xb
;          02 24
.org 0x088ab0e8
    .ifndef disable_qol
        li v0, 0xd ; was 0xb
    .else
        li v0, 0xc ; was 0xb
    .endif

; dsp_menu_custom_main - number of values to draw
; 088ab1e4 0c 00      sltiu   at,s0,0xc
;          01 2e
.org 0x088ab1e4
    .ifndef disable_qol
        sltiu at, s0, 0xe ; was 0xc
    .else
        sltiu at, s0, 0xd ; was 0xc
    .endif

; dsp_menu_custom_main - jump table for drawing values
; 088ab1f0 9a 08      lui     v1,0x89a
;          03 3c
; 088ab1f4 bc d6      addiu   v1,v1,-0x2944
;          63 24
.org 0x088ab1f0
    la v1, dsp_menu_custom_switch-reloc_base

; menu_custom_main - jump table for value storage
; 088a9738 9a 08      lui     v1,0x89a
;          03 3c
; 088a973c 80 10      sll     v0,v0,0x2
;          02 00
; 088a9740 68 d6      addiu   v1,v1,-0x2998
;          63 24
.org 0x088a9738
    lui v1, hi(menu_custom_main_switch-reloc_base)
    sll v0, v0, 0x2
    addiu v1, v1, lo(menu_custom_main_switch-reloc_base)

; pointer to Combo Counter string
; 088ab18c c4 08      lui     v0,0x8c4
;          02 3c
; 088ab190 9a 7f      lhu     a0,offset str08_ptr[91](v0)
;          44 94
.org 0x088ab18c
    ; patch this to our new Battle Subtitles string
    btl_sub_caption_ptr equ (str08_ptr + (184 * 2))

    lui v0, hi(btl_sub_caption_ptr-reloc_base)
    lhu a0, lo(btl_sub_caption_ptr-reloc_base)(v0)

; default value for customization flag (enable battle subs)
.org 0x08c5e454
    .db 0x09 ; was 0x01

; dsp_menu_custom_main_stub - else branch for labels
; 088ab1dc e4 1b      jal     draw_menu_str                     undefined draw_menu_st
;          23 0e
; 088ab1e0 01 00      _li     t0,0x1
;          08 24
.org 0x088ab1dc
    jal dsp_menu_custom_main_stub-reloc_base

; set_game_mode - reset skit string counter on game mode change
; 088af17c 08 00      jr      ra
;         e0 03
; 088af180 40 ea      _sw     a0,-0x15c0(v1)=>game_mode         = ??
;         64 ac
.org 0x088af17c
    j set_game_mode_stub

; put skit 130 back into the skit queue
.org 0x8c5dd92
    .dh (130) << 7, 0xAA, 0xAA
    .dh 0, 0, 0

; relocate fc_default_dat
.org 0x8c5ddbc
    .word fc_default_dat_new-reloc_base

; display subs before battle fade-in during prolog
.org 0x0888dbd4
	j opening_start
	nop
