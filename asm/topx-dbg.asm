; Restored debug menu stuff

; Add "Debug" option to title screen:
; Make Debug show when sce_debug_mode (0x908a0a4) is enabled
.org 0x088E9F44
    jal ttl_check_debug_enabled
    nop

.org 0x88e9300
    j sel_title_main
    nop

; Go to debug gamemode
.org 0x088E9698 :: li a0, 10
.org 0x08C5E18C :: .dh 0x4, 0x80, 0x170

; Hook/add the stubbed debug functions
.org 0x088B3578
    j _menu_top_main
    nop

.orga 0x4E37DC :: nop :: nop ; reloc kill
.orga 0x4E37E4 :: nop :: nop ; reloc kill
.org 0x088E5A88
    j __init_sys_ot
    nop

.org 0x088D5264
    j call_scdeb_win
    nop

.org 0x088AB9FC
    j check_scdeb_window
    nop

.org 0x088D4C00
    j _init_scdeb_window
    nop

.org 0x088D5518
    j check_sce_window
    nop

.orga 0x4E3D0C :: nop :: nop ; reloc kill
.orga 0x4E3D14 :: nop :: nop ; reloc kill
.org 0x088E60C8
	nop
	nop

.orga 0x508D74 :: nop :: nop ; reloc kill
.org 0x0894DC94
	j _check_dbg
	nop

.org 0x088E5A80
    j debug_pause
    nop

.orga 0x4E8EDC :: nop :: nop ; reloc kill
.org 0x088EFF44
    j _mon_init
    ; keep this instruction the same

.orga 0x4E9444 :: nop :: nop ; reloc kill
.org 0x088F061C
    j _mon_vsync_loop
    ; keep this instruction the same

.org 0x88EB8F8
    j init_party
    nop
