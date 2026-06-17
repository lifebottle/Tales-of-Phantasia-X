; game_main
; 088add58 02 00      li      v1,0x2
;          03 24
; game mode - start by playing opening FMV instead of immediately displaying the title screen
.org 0x088add58
    li v1, 0x3 ; was 0x2

; save icon
; 088b2d54 0f 00      beql    v1,v0,LAB_088b2d94
;          62 50
; 088b2d58 a2 08      _lui    a0,0x8a2
;          04 3c
; the original code had 3 branches, but all use identical copies of the same image
.org 0x088b2d54
    b 0x088b2d94

; game_mode_end_movie - video play
; 088ae2a8 0a 7f      jal     FUN_088dfc28                      undefined FUN_088dfc28()
;          23 0e
; 088ae2ac 00 00      _nop
;          00 00
.org 0x088ae2a8
    jal end_movie_stub-reloc_base

; FUN_0892f578 - audio decode
; 0892f6c4 c1 a1      jal     FUN_08928704                      undefined FUN_08928704()
;          24 0e
.org 0x0892f6c4
    jal end_movie_audio_stub-reloc_base

; end credits - Produced by logo 
.org 0x08c32074
    .area 0x342c
    .incbin OUT_DIR+"/bamco.tga"
    .endarea

; splash screen logos
.org 0x089B8754 :: .word logos_path

.orga 0x4C0DF4 :: nop :: nop ; reloc kill
.org 0x088b0928
	nop

; display credits
; 088dfffc 10 70      addiu   v1,v1,0x7010
;         63 24
; 088e0000 07 09      lui     v0,0x907
;         02 3c
; 088e0004 ad 7c      jal     FUN_088df2b4                      undefined FUN_088df2b4()
;         23 0e
