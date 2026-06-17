; FUN_088ea7ac
; title screen - Kosuke Fujishima - width
; 088ea7cc 68 00      li      a1,0x68
;          05 24
.org 0x088ea7cc
    li a1, 0x90 ; was 0x68

; 088ea4f4 68 00      li      a1,0x68
;          05 24
.org 0x088ea4f4
    li a1, 0x90 ; was 0x68

; title screen - copyright - height
; 088ea800 10 00      li      a2,0x10
;          06 24
.org 0x088ea800
    li a2, 0x28 ; was 0x10

; 088ea534 10 00      li      a2,0x10
;          06 24
.org 0x088ea534
    li a2, 0x28 ; was 0x10

; 088ea544 21 38      move    a3,a2
;          c0 00
.org 0x088ea544
    li a3, 0x10

; NDX logo height
; 088ea5c8 40 00      li      a2,0x40
;          06 24
.org 0x088ea5c8
    li a2, 0 ; was 0x40

; 088ea61c 40 00      li      a2,0x40
;          06 24
.org 0x088ea61c
    li a2, 0 ; was 0x40

; main menu nix the ndx

; No L/R
.org 0x088E9580 :: b 0x088E95F4

; No NDX prims
.org 0x088E9F68 :: b 0x088E9FC0
.org 0x088EA028 :: b 0x088EA080
.org 0x088E9FCC :: b 0x088EA018
.org 0x088EA08C :: b 0x088EA0DC

.org 0x088EA758 :: nop
.org 0x088EA788 :: nop

; FUN_088e9e44
; title screen menu options width
; 088e9ed4 c0 00      li      a1,0xc0
;         05 24
; .org 0x088e9ed4
;         li a1, 0xd0 ; was 0xc0

; title screen NEW GAME x pos
; 08c5e16e 80         ??     80h              field2_0x2              XREF[1]: FUN_088e9e44:088e9ea0(
; 08c5e16f 00         ??     00h              field3_0x3
