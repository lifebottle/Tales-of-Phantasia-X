; auto line break
.org 0x088e1e4c
	jal Process_Line_Break_Check-0x2200
	nop
	b 0x88e1e78
	nop

; patch for various sce_func_msg_tbl funcs
; removes 4 from a2
.org 0x088d57dc
	li a2, 2	; idk what this does and it scares me
.org 0x088d56bc
    li a2, 0    ; idk what this does either but here we go
