.open "original/PSP_GAME/SYSDIR/reloc.bin","2298 - Tales of Phantasia - Narikiri Dungeon X (Japan) (v1.01)/PSP_GAME/SYSDIR/EBOOT.BIN",0x08803FAC
.psp

.orga 0x494634
	.fill 0x92900, 0x0

.org 0x088cbc8c
	jal load_custom_file

.org 0x089961c0
custom_file:
.asciiz "julian.dat"

.org 0x089961f0
.func load_custom_file	
	addiu sp, sp, -0x10
	sw ra, 0xc(sp)
	jal 0x0892dae8
	nop
	li a0, custom_file
	li a1, 0x9370000
	jal 0x0892dae8
	lui a2, 0x10
	lw ra, 0xc(sp)
	jr ra
	addiu sp, sp, 0x10
.endfunc

; main menu nix the ndx
.org 0x088E95BC
	nop
.org 0x088E9488
	li s1, 0x3
.org 0x088e93f8
	slti at, a1, 0x4
.org 0x088e9508
	slti v0, s1, 0x4
.org 0x088e9510
	slti at, s1, 0x4
.org 0x088e9520
	slti at, s1, 0x4
.org 0x088e9570
	slti v0, s1, 0x4
.org 0x088EA04C
	nop
.org 0x088E9F8C
	nop
.org 0x088EA758
	nop
.org 0x088EA788
	nop


.org 0x088e10a8 
    addiu a0, a0, 0xA   ; replace with char width at some point

; 088e2980 
; slti for number of lines
; then addiu for 0x44 buffer size

.org 0x088E2C7C 
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

;.org 0x088e2ca4
    ; may need to change these to add some flex at the top
.close