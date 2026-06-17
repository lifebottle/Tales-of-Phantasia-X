; main - patch language to system locale
; 088b087c 21 20      li      a0,0
;          00 00
; 088b0880 42 55      jal     sceImposeSetLanguageMode          undefined sceImposeSet
;          26 0e
.org 0x088b087c
    li a0, -1 ; was 0

; FUN_0892ec08 - utility dialog language
; 0892ec10 08 00      sw      s1,local_1008(sp)
;         b1 af
; 0892ec14 21 88      move    s1,a0
;         80 00
.org 0x0892ec10
    jal utility_lang_stub
    nop

; 0892ec44 1e 09      lui     v0,0x91e
;         02 3c
; 0892ec48 30 c2      sw      zero,-0x3dd0(v0)=>DAT_091dc230    = ??
;         40 ac
.org 0x0892ec44
    ; disable the old store
    nop :: nop

; FUN_0892e980 - utility dialog language 2
; 0892e98c 04 00      sw      s1,local_100c(sp)
;         b1 af
; 0892e990 21 88      move    s1,a0
;         80 00
.org 0x0892e98c
    jal utility_lang_stub2
    nop

; 0892e9c4 1e 09      lui     v0,0x91e
;         02 3c
; 0892e9c8 30 c2      sw      zero,-0x3dd0(v0)=>DAT_091dc230    = ??
;         40 ac
.org 0x0892e9c4
    ; disable the old store
    nop :: nop

; language for system messages
; 0892e19c 1e 09      lui     v0,0x91e
;         02 3c
; 0892e1a0 1c bc      sw      zero,-0x43e4(v0)=>DAT_091dbc1c    = ??
;         40 ac
.org 0x0892e19c
    jal utility_lang_stub3
    nop

; reloc kill
.orga 0x4FBDA4
    nop :: nop :: nop :: nop
