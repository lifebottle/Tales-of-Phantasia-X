.open "orig/PSP_GAME/USRDIR/top.prx",OUT_DIR+"/EBOOT.BIN",0x08803FAC
.psp

; .orga 0x494634
; 	.fill 0x92900, 0x0
;
.definelabel msg_next_line, 0x088e2104
.definelabel text_y_pos, 0x09087B46
.definelabel text_x_pos, 0x09087B44
.definelabel text_color, 0x09087b48
.definelabel start_x_pos, 0x09087BDC
.definelabel msg_ptr, 0x09087b70
.definelabel msg_size, 0x09087BCE
.definelabel box_position, 0x09087BE0
.definelabel draw_character, 0x088e0d5c
.definelabel current_char, 0x09087BCC
.definelabel x_char_index, 0x09087B68
.definelabel box_width, 0x09087B64
.definelabel text_draw_status, 0x09087B69

.definelabel ioReadFile, 0x892dae8
.definelabel reloc_base, 0x8804000
.definelabel custom_file_offset, 0x90C2300

.definelabel get_pad_data, 0x88CC34C
.definelabel get_game_mode, 0x88AF154
.definelabel enable_csr_data, 0x88E40E8
.definelabel snd_si_se, 0x88E5994
.definelabel request_battle, 0x88D4030
.definelabel request_change_map, 0x88D3DEC
.definelabel system_fade, 0x88E5C74
.definelabel del_sce_loop, 0x88D27A8
.definelabel add_sce_loop, 0x88D26F8
.definelabel disable_sys_pad, 0x88D54FC
.definelabel enable_sys_pad, 0x88D5508
.definelabel request_play_movie, 0x88D473C
.definelabel request_mini_game, 0x88D4120
.definelabel request_talk, 0x88E8244
.definelabel init_encount_count, 0x88D13C8
.definelabel get_pad_decide, 0x88C88AC
.definelabel get_pad_rep, 0x88CC384
.definelabel set_pad_number, 0x88C8768
.definelabel set_csr_data_base, 0x88E4114
.definelabel start_csr_data, 0x88E3EBC
.definelabel exec_csr_data, 0x88E3410
.definelabel get_csr_data_no, 0x88E4228
.definelabel add_csr_data_prim, 0x88E44D4
.definelabel set_str_cursor, 0x88E0410
.definelabel move_str_cursor, 0x088E0434
.definelabel add_str_prim, 0x88E07B4
.definelabel add_dec_prim, 0x88E0618
.definelabel get_pad_dat_csr, 0x88E4084
.definelabel get_pad_new_csr, 0x88E3FD4
.definelabel add_window_prim, 0x88A8848
.definelabel init_msg_ot, 0x88E32F0
.definelabel debug_menu, 0x8941944
.definelabel get_sys_msg_ptr, 0x88E14CC
.definelabel get_pad_new, 0x88CC368
.definelabel pad_read, 0x88CC1AC
.definelabel init_party_main, 0x88EB95C
.definelabel get_class, 0x88CF508
.definelabel memset, 0x880B668
.definelabel mon_wall_tim_read, 0x88F1E20
.definelabel snd_set_voice, 0x88CB5C8
.definelabel double_buffer_change, 0x088726B0
.definelabel pchr_disp, 0x08889908
.definelabel snd_vsync_callback, 0x88CBB00
.definelabel PutDispEnv, 0x08991960
.definelabel g_sync, 0x0892B760
.definelabel load_knj_vram, 0x088E1700
.definelabel trans_start, 0x0888AF00
.definelabel g_setRenderTarget, 0x0892B9DC
.definelabel g_getRenderTargetFormat, 0x0892B98C
.definelabel g_getRenderTargetAddr, 0x0892B930
.definelabel sceGuTexMode, 0x08993B70
.definelabel sceGuTexImage, 0x08993C44
.definelabel sceGuEnable, 0x089934F0
.definelabel sceGuDisable, 0x08993548
.definelabel sceGuTexFlush, 0x08993CC4
.definelabel sceGuBlendFunc, 0x08993FC8
.definelabel sceGuColor, 0x08993A84
.definelabel sceGuCopyImage, 0x089937C8
.definelabel sceGuSpriteMode, 0x08993750
.definelabel sceGuDrawSprite, 0x0899376C
.definelabel sceKernelDcacheWritebackAll, 0x089951D0
.definelabel sceDisplayGetVcount, 0x08995268
.definelabel sceCtrlPeekBufferPositive, 0x08995290
.definelabel sceKernelExitThread, 0x089951B0
.definelabel sc_decode, 0x088A82FC
.definelabel set_cdread_adr_block, 0x088AD240
.definelabel malloc_heap, 0x088E6134
.definelabel free_heap, 0x088E62E4
.definelabel get_fps_ptr, 0x088AD438
.definelabel func_0892BE00, 0x0892BE00
.definelabel func_0895FBD8, 0x0895FBD8
.definelabel func_0896006C, 0x0896006C
.definelabel sceGuDepthFunc, 0x08993E74
.definelabel DrawOTagNoScale, 0x088E69A4
.definelabel g_dlFinish, 0x0892B6C4
.definelabel g_swapBuffers, 0x0892B84C
.definelabel g_dlSwap, 0x0892B748
.definelabel g_dlStart, 0x0892B69C
.definelabel g_waitVblank, 0x0892B790
.definelabel snd_get_voice_status, 0x88CB710
.definelabel snd_set_seq, 0x88C9050
.definelabel VSync, 0x881BF34

.definelabel sce, 0x9089D04
.definelabel party_data, 0x9088ED0
.definelabel intp, 0x9033010
.definelabel system_ot, 0x9087DC0
.definelabel original_system_ot, 0x9087DC4
.definelabel sce_loop_skip, 0x9033020
.definelabel csr_r, 0x9087B40
.definelabel csr_x, 0x9087B44
.definelabel csr_y, 0x9087B46
.definelabel csr_l, 0x9087B49
.definelabel sys_pad_flag, 0x8C28FD0
.definelabel sce_off, 0x9033018
.definelabel last_movie, 0x8E2C7C8
.definelabel init_dat, 0x8C5E43C
.definelabel init_type, 0x8C5E48C
.definelabel MonNum, 0x89BBAC8
.definelabel mon_dat, 0x8C65F84
.definelabel mon, 0x908AEC0
.definelabel custom, 0x9089C8C
.definelabel psFbDisplayW, 0x8C9A220
.definelabel psFbDisplayY, 0x8C9A224
.definelabel psFbDisplayX, 0x8C9A228
.definelabel VRAM_ADDR, 0x4110000
.definelabel ipl_start_MAYBE, 0x88b01cc
.definelabel title_step, 0x9088eae
.definelabel title_fade_mode, 0x9088eb8
.definelabel title_time, 0x9088ea8
.definelabel logo_move_cnt, 0x9088eb2
.definelabel sel_title, 0x9088ea4
.definelabel title_menu_dat, 0x8c5e16c
.definelabel back_shade, 0x9088eb4
.definelabel disable_mcard, 0x88b0ad4
.definelabel set_game_mode, 0x88af160
.definelabel title_fade, 0x88eb0b8
.definelabel snd_stop_seq, 0x88c95a4
.definelabel add_knj_prim,0x088e0d5c
.definelabel btl_str2,0x08831044
.definelabel sprintf,0x0880d71c
.definelabel strcpy,0x0880db9c

; replace start_snd_sys epilog
.org 0x088cbcc4
	j load_custom_file

.org 0x089961c0
    custom_file:
    .asciiz "julian.dat"

.org 0x089961f0
.func load_custom_file	
	addiu sp, sp, -0x10
	sw ra, 0xc(sp)
	li a0, custom_file
	li a1, custom_file_offset
	jal ioReadFile
	lui a2, 0x10

    ; intro logos
	jal startup_logos_thread
	nop

	lw ra, 0xc(sp)
	jr ra
	addiu sp, sp, 0x10
.endfunc

; .include "asm/topx-dynamic-wrap.asm", "UTF8"

.ifndef disable_qol
    .include "asm/topx-qol.asm", "UTF8"
.endif

.include "asm/topx-reloc-msgbuf.asm", "UTF8"
.include "asm/topx-reloc-mapbuf.asm", "UTF8"
.include "asm/topx-vwf.asm", "UTF8"
.include "asm/topx-new-code-eboot.asm", "UTF8"
.include "asm/topx-sys-lang.asm", "UTF8"
.include "asm/topx-monster-book.asm", "UTF8"
.include "asm/topx-menus.asm", "UTF8"
.include "asm/topx-battle-menus.asm", "UTF8"
.include "asm/topx-title-screen.asm", "UTF8"
.include "asm/topx-naming-screen.asm", "UTF8"
.include "asm/topx-misc.asm", "UTF8"
.include "asm/topx-skits.asm", "UTF8"
.include "asm/topx-dbg.asm", "UTF8"

  ; needed for psp debugger
  ; 088b0920 2e 54      jal     sceKernelPrintf                   undefined sceKernelPri
  ;          26 0e
  ; 088b0924 04 81      _addiu  a0,a0,-0x7efc
  ;          84 24
  ; .org 0x088b0920
  ;   nop

.close

.create OUT_DIR+"/julian.dat",0x90C2300
	.importlib "julian-top.a"
	.align 4

    new_msg_buf:
    .fill line_len*4, 0x00

    .include "asm/topx-new-code.asm", "UTF8"
.close
