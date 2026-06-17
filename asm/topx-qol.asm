; patch Suzu inputs to match ToP PSX
.org 0x089af2c3
    .db 0x4b ; was 0x47

.org 0x089af2c5
    .db 0x46 ; was 0x4b

; Sorcerer ring everywhere

; enable effect if in inventory
.orga 0x4D50BC :: nop :: nop :: nop :: nop ; reloc kill
.org 0x088D0CB4 :: j sorcerer_ring_chk :: nop

; enable effect if equipped
.org 0x088D0D4C :: j sorcerer_ring_chk2 :: lhu t3, 0(t9)

; Add scePowerSetClockFrequency to the import list
.org 0x08995B98
; scePower
.word 0x04B7766E ; scePowerRegisterCallback
.word 0x737486F2 ; scePowerSetClockFrequency
; sceImpose
.word 0x36AA6E91 ; sceImposeSetLanguageMode

; Place the new stubs
.org 0x08996100
scePowerRegisterCallback:
jr ra
nop
scePowerSetClockFrequency:
jr ra
nop

; Update scePower data
.org 0x089956B2 :: .dh 0x2 ; list 2 imports
.org 0x089956B8 :: .word scePowerRegisterCallback-reloc_base ; new stub base

; Make the original scePowerRegisterCallback jump to the new one
.org 0x08995500 :: j scePowerRegisterCallback

; Update sceImpose nid location
.org 0x089956C8 
.word 0x08995BA0-reloc_base

; exec_sce - handle bottles
; 088d07f4 a7 43      jal     exec_sce_encount                  undefined exec_sce_enc
;         23 0e
; 088d07f8 00 00      _nop
;         00 00
.org 0x088d07f4
    jal holy_bottle_stub-reloc_base

; Patch Suzu's Kuroyuri to be non-elemental
; .org 0x089d01df
;     .db 0 ; was 0x7

; Patch Suzu's Ninja Sword to be non-elemental
.org 0x089d01ff
    .db 0 ; was 0x7

; exe_grade_end - epilog
; 088bc0dc 0c 00      lw      ra,local_dc4(sp)
;         bf 8f
; 088bc0e0 08 00      lw      s0,local_dc8(sp)
;         b0 8f
; 088bc0e4 08 00      jr      ra
;         e0 03
; 088bc0e8 d0 0d      _addiu  sp,sp,0xdd0
;         bd 27

; carry over Scout Orb and Curio's Mirror on NG+
.org 0x088bc0dc
    j exe_grade_end_stub
    nop

; Fix HP/TP not being restored fully on level-up when using accessories
; loads max HP without accessories (0x16 is the actual max)
; 088747a0 14 00      lhu     v0,0x14(s1)
;         22 96
.org 0x088747a0
    lhu v0, 0x16(s1) ; was 0x14

; loads max TP without accessories (0x1c is the actual max)
; 088747b4 1a 00      lhu     v0,0x1a(s1)
;         22 96
.org 0x088747b4
    lhu v0, 0x1c(s1) ; was 0x1a
