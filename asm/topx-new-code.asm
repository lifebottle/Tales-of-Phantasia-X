ot equ 0x08dcbcd0
skits_ot2 equ 0x09088e84
talk_sce_time equ 0x0908844c
talk_flag equ 0x9088449
talk_voice_time equ 0x09088450
talk_voice_total equ 0x09088454
skit_duration equ 0x0908a29c
sndStrStop equ 0x08929338
csr_ot equ 0x09087b4c
msg_ot equ 0x09087bc8
top_stat equ 0x09087d1c
msg_stat equ 0x09087b69
draw_menu_knj equ 0x088c7064
draw_menu_str equ 0x088c6f90
sce_debug_mode equ 0x908a0a4
exec_sce_encount equ 0x088d0e9c
consumables_toggle equ 0x08dfc638
monsterbook_toggle equ 0x08dfc63a
item_counts equ 0x090893f0
item_list equ 0x090895f0
sorcerer_ring_id equ 0x166

; custom._4_1_ - bitfield for customization flags (& 4 is the highest used bit)
custom_flag_4 equ 0x09089c90

.definelabel get_available_skit, 0x088e8444
.definelabel cnv_ascii2ank, 0x088e0778
.definelabel skits_played, 0x9089bf4
.definelabel game_mode, 0x08dcea40
.definelabel talk_no, 0x09088444
.definelabel get_talk_flag, 0x088e83f8
.definelabel last_talk, 0x08c5d81c
.definelabel skit_status1, 0x0908a0a5
.definelabel skit_status2, 0x09089c8f
.definelabel play_song, 0x088cb970
.definelabel get_pad_bit, 0x088a9cf4
.definelabel str08_ptr, 0x08c47ee4
.definelabel mon_book_entries, 0x0908aab4
.definelabel mon_book_cur, 0x0908aeb4 
.definelabel vsync_loop, 0x0893a4fc

; number of battle quotes
btl_quote_max equ 0x656

width_table:
    .incbin OUT_DIR+"/sys_02-widths.bin"
    .align 4

cur_char:
    .dh 0

    .align 4

get_char_width:
    ; check if it's kanji/kana or our English glyphs
    sltiu v0, a0, vwf_glyphs_end
    beqz v0, @@fixed_width

    ; if the latter, load width from table
    la v0, width_table
    addu v0, v0, a0

    lbu v0, 0(v0)
    b @@exit
    nop

    ; otherwise, default to the old width
    @@fixed_width:
    li v0, 0xe

    @@exit:
    jr ra
    nop

add_knj_prim_prolog_stub:
    andi s1, a0, 0xffff
    sh s1, cur_char

    j 0x88e0d74
    slti at, s1, 0x701

add_knj_prim_width_stub:
    ; check if called from name entry
    la t0, 0x088c2d5c
    lw t1, 0x3c(sp)

    beq t0, t1, @@knj_normal
    nop

    ; check if called from letter grid
    la t1, 0x088c2bf8
    beq t1, ra, @@knj_normal
    nop

    move t1, a0
    la a0, cur_char
    lhu a0, 0(a0)
    jal get_char_width
    nop
    b @@knj_width_stub_exit
    addu a0, v0, t1

    @@knj_normal:
    addiu a0, a0, 0x0e

    @@knj_width_stub_exit:
    j 0x088e10ac
    lui v1, 0x908  ; copied from old code

set_top_win_adr_stub:
    move a0, v1
    addiu a0, a0, -0x10
    jal get_char_width
    nop
    move t0, v0
    j 0x088e1860
    li v0, 0xf  ; copied from old code

; set_top_win_adr_width:
;     li v0, 0x1e0
;     addiu s5, s5, 0x4
;     j 0x088e18d8
;     subu v1, v0, s5

map_load_ptr:
    la t0, map_index
    lw v0, 0(t0)
    nop

    ; return old offset for index 0, allocated one for index 1
    bnez v0, @@load_new_ptr
    nop

    la v0, map_buf_old
    b @@map_load_ptr_exit

    @@load_new_ptr:
    la t0, map_buf_ptr
    lw v0, 0(t0)

    @@map_load_ptr_exit:
    jr ra
    nop

menu_width_table:
    .incbin OUT_DIR+"/sys_00-widths.bin"
    .align 4

menu_cur_char:
    .dh 0
    .align 4

add_ank_prim_prolog_stub:
    andi t0, a0, 0xffff
    sh t0, menu_cur_char

    ; copied from old code
    lui v1, 0x8c5
    lhu a2, -0x6294(v1)
    j 0x088e11ec
    nop

add_ank_prim_width_stub:
    ; check if called from letter grid
    la t1, 0x088c2bf8
    beq t1, ra, @@ank_normal
    nop

    ; check if called by current name display
    la t1, 0x088C2D5C
    lw t2, 0x2c(sp)
    beq t1, t2, @@ank_name
    nop

    b @@ank_vwf
    nop

    @@ank_name:
    b @@ank_exit
    addiu a0, a0, 0xe

    @@ank_normal:
    b @@ank_exit
    addiu a0, a0, 8

    @@ank_vwf:
    move t1, a0
    move t2, ra
    lh a0, menu_cur_char
    nop
    jal menu_get_char_width
    nop
    addu a0, v0, t1
    move ra, t2

    @@ank_exit:
    j 0x088e13cc
    lui v1, 0x908  ; copied from old code

menu_get_char_width:
    ; check if it's kana or our English glyphs
    sltiu v0, a0, vwf_glyphs_end
    beqz v0, @@fixed_width_menu

    ; if the latter, load width from table
    la v0, menu_width_table
    addu v0, v0, a0
    lbu v0, 0(v0)

    b @@exit_menu
    nop

    ; otherwise, default to the old width
    @@fixed_width_menu:
    li v0, 0x8

    @@exit_menu:
    jr ra
    nop

menu_get_char_yoffs:
    ; t2 = csr_y
    move v0, t0
    lh a0, menu_cur_char
    nop

    ; NOTE: you might need to change this for non-Latin fonts
    li t0, 0x48 ; g
    beq a0, t0, @@yoffs_descender 
    li t0, 0x51 ; p
    beq a0, t0, @@yoffs_descender
    li t0, 0x52 ; q
    beq a0, t0, @@yoffs_descender
    li t0, 0x5a ; y
    beq a0, t0, @@yoffs_descender
    nop

    b @@yoffs_exit
    nop

    @@yoffs_descender:
    addiu t2, t2, 1

    ; copied from old code
    @@yoffs_exit:
    sh t2, 0xa(v1)
    sb t4, 0xc(v1)

    move t0, v0

    j 0x088e12d8
    li a0, -0x2

play_time_stub:
    la a3, 0x08dfc59b  ; space in %03d:%02d 
    lbu t0, 0(a3)
    li a2, 0x10

    bne t0, a2, @@play_time_exit
    nop

    li t0, spacer        ; our spacer character
    sb t0, 0(a3)

    @@play_time_exit:
    ; copied from old code
    li a2, 0
    jr ra
    li a3, 0

battle_item_yoffs_stub:
    ; copied from old code
    lh v0, 0x2(s2)
    addiu t1, a3, -0x10

    ; NOTE: you might need to change this for non-Latin fonts
    li t0, 0x48 ; g
    beq t1, t0,@@yoffs_descender_battle
    li t0, 0x4b ; j
    beq t1, t0,@@yoffs_descender_battle
    li t0, 0x51 ; p
    beq t1, t0,@@yoffs_descender_battle
    li t0, 0x52 ; q
    beq t1, t0,@@yoffs_descender_battle
    li t0, 0x5a ; y
    beq t1, t0,@@yoffs_descender_battle
    nop

    b @@yoffs_exit_battle
    nop

    @@yoffs_descender_battle:
    addiu v0, v0, 1

    @@yoffs_exit_battle:

    jr ra
    nop

battle_item_width_stub:
    addiu sp, sp, -0x10
    sw ra, 0xc(sp)
    sw a0, 0x8(sp)
    move t1, v0

    ; a3 = current char
    move a0, a3
    jal menu_get_char_width
    addiu a0, a0, -0x10

    addu v0, v0, t1

    lw ra, 0xc(sp)
    lw a0, 0x8(sp)
    addiu sp, sp, 0x10

    jr ra
    sh v0, 0x1c(sp)

battle_arte_width_stub:
    addiu sp, sp, -0x10
    sw ra, 0xc(sp)
    sw a0, 0x8(sp)
    move t1, v0

    ; a3 = current char
    move a0, a3
    jal menu_get_char_width
    addiu a0, a0, -0x10

    addu v0, v0, t1

    lw ra, 0xc(sp)
    lw a0, 0x8(sp)
    addiu sp, sp, 0x10

    jr ra
    sh v0, 0x2c(sp)

get_battle_arte_popup_name:
    ; check caller for enemy arte func
    lw      v0, 0xc(sp)
    la      v1, 0x088302D0
    bne     v0, v1, @@battle_arte_popup_normal
    nop

    lbu     v0,0x0(a1) ; was lhu
    beq     v0,zero,@@battle_popup_exit
    move   v1,a0
    @@battle_popup_write:
    sb      v0,0x0(v1)
    addiu   a1,a1,0x1 ; was 0x2
    lbu     v0,0x0(a1) ; was lhu
    bne     v0,zero,@@battle_popup_write
    addiu  v1,v1,0x1
    @@battle_popup_exit:
    sh      zero,0x0(v1)
    jr      ra
    move   v0,a0

    @@battle_arte_popup_normal:
    j 0x0888ac08
    nop

; read_msg_code_party without the push msg stack
get_party_name:
	bnel a0, zero, @@next
	li v0, 0x125
	lui v0, 0x909
	lh a0, -0x6c30(v0)
	li v0, 0x125
@@next:
	bnel a0, v0, @@last
	addiu v1, a0, -1
	li a0, 8
	addiu v1, a0, -1
@@last:
	sll v0, v1, 2
	addu v0, v0, v1
	sll v1, v0, 5
	lui v0, 0x909
	addiu v0, v0, -0x7130
	addu v0, v0, v1
	jr ra
	addiu v0, v0, 0xc
; read_msg_code_item without the push msg stack
get_item_name:
	lui v0, 0x89d
	sll v1, a0, 1
	addiu v0, v0, 0x700c
	addu v0, v0, v1
	lhu v1, 0x0(v0)
	li v0, 0x89d7334
	jr ra
	addu v0, v0, v1

cur_skit_str:
    .dw 0

skit_text_block_ptrs:
    .dw 0

display_skit_stub:
    la a0, skits_ot2
    lw a0, 0(a0)

    ; load skit number
    la a1, talk_no
    lhu a1, 0(a1)
    addiu a1, a1, -1

    ; get block pointer
    la v0, skit_text_block_ptrs
    lw v0, 0(v0)
    sll a1, a1, 2
    addu a1, a1, v0
    lw a1, 0(a1)

    ; get string pointer
    la v0, cur_skit_str
    lbu v0, 0(v0)
    sll v0, v0, 1
    addu a2, a1, v0
    lhu v0, 0(a2)
    nop

    ; y pos
    li a2, 220

    jal displayCentered
    addu a1, a1, v0

    j 0x088e6cd4
    nop

reset_skit_str:
    la v0, cur_skit_str
    sh zero, 0(v0)
    jr ra
    li a0, 0x64 ; copied from original code

increment_skit_str:
    addiu sp, sp, -0x10
    sw v0, 0xc(sp)
    sw v1, 0x8(sp)

    la v1, cur_skit_str
    lhu v0, 0(v1)
    nop
    addiu v0, v0, 1
    sh v0, 0(v1)

    lw v0, 0xc(sp)
    lw v1, 0x8(sp)
    jr ra
    addiu sp, sp, 0x10

btl_quote_num:
    .dw 0

btl_quote_ptrs:
    .dw 0

btl_quote_timeout:
    .dw 0

btl_quote_set:
    sltiu v0, s4, btl_quote_max
    beq v0, zero, @@exit
    nop

    ; exit if battle sub null
    beq s4, zero, @@exit
    nop

    ; exit if string empty
    sll v0, s4, 1
    la v1, btl_quote_ptrs
    lw v1, 0(v1)
    addu v1, v1, v0
    lhu v0, 0(v1)
    beq v0, zero, @@exit
    nop

    la v0, btl_quote_num
    sw s4, 0(v0)

    la v0, btl_quote_timeout
    li v1, 180
    sw v1, 0(v0)

    @@exit:
    jr ra
    move s5, a1 ; copied from original code

btl_quote_stop:
    la v0, btl_quote_num
    sw zero, 0(v0)
    la v0, btl_quote_timeout
    sw zero, 0(v0)
    jr ra
    li v0, 0

display_quote_stub:
    addiu sp, sp, -0x10
    sw ra, 0xc(sp)
    sw a0, 0x8(sp)

    ; check timeout, bail out if zero
    la t0, btl_quote_timeout
    lw a0, 0(t0)
    beq a0, zero, @@exit

    ; decrement otherwise
    addiu a0, a0, -1
    sw a0, 0(t0)

    ; exit if mode isn't battle or prologue
    la t0, game_mode
    lw t0, 0(t0)
    nop

    li a0, 0xe ; battle
    beq t0, a0, @@battle_check
    li a0, 0xb ; prologue
    bne t0, a0, @@exit
    nop

    ; exit if battle subs enabled
    @@battle_check:
    la t0, custom_flag_4
    lw t0, 0(t0)
    ; check bit 4 of the existing flag
    andi t0, 0x8
    beq t0, zero, @@exit
    nop

    ; exit if null
    la t0, btl_quote_num
    lhu t0, 0(t0)
    nop

    ; quote no. 0001 is a placeholder
    li a0, 1
    beq t0, a0, @@exit
    nop

    beq t0, zero, @@exit
    sll t0, t0, 1

    move a0, s2
    lw a0, 0x28(a0)
    addiu a0, a0, 0x4a8

    ; get string pointer
    la a1, btl_quote_ptrs
    lw a1, 0(a1)
    addu a2, a1, t0
    lhu t0, 0(a2)

    ; ypos
    li a2, 8

    jal displayCentered
    addu a1, a1, t0

    @@exit:
    lw ra, 0xc(sp)
    lw a0, 0x8(sp)

    ; copied from original code
    li s0, 0

    j 0x0888995c
    addiu sp, sp, 0x10

display_quote_nmap:
    addiu sp, sp, -0x10
    sw ra, 0xc(sp)
    ; sw a0, 0x8(sp)

    ; check timeout, bail out if zero
    la t0, btl_quote_timeout
    lw a0, 0(t0)
    beq a0, zero, @@exit

    ; decrement otherwise
    addiu a0, a0, -1
    sw a0, 0(t0)

    ; exit if null
    la t0, btl_quote_num
    lhu t0, 0(t0)
    nop
    beq t0, zero, @@exit
    sll t0, t0, 1

    ; exit if dialogue window is present
    la a0, msg_stat
    lbu a0, 0(a0)
    beq a0, zero, @@display
    nop

    jal btl_quote_stop
    nop

    b @@exit
    nop

    @@display:
    ; get string pointer
    la a1, btl_quote_ptrs
    lw a1, 0(a1)
    addu a2, a1, t0
    lhu t0, 0(a2)

    ; ypos
    li a2, 8

    la a0, msg_ot
    lw a0, 0(a0)

    jal displayCentered
    addu a1, a1, t0

    @@exit:
    jal display_skit_prompt_stub
    nop

    lw ra, 0xc(sp)
    ; lw a0, 0x8(sp)

    jr ra
    nop

display_cooking_stub:
    ; check timeout, bail out if zero
    la t0, btl_quote_timeout
    lw v0, 0(t0)
    beq v0, zero, @@exit

    ; decrement otherwise
    addiu v0, v0, -1
    sw v0, 0(t0)

    ; exit if null
    la t0, btl_quote_num
    lhu t0, 0(t0)
    nop

    beq t0, zero, @@exit
    sll t0, t0, 1

    addiu sp, sp, -0x10
    sw ra, 0xc(sp)
    sw a0, 0x8(sp)

    ; get string pointer
    la a1, btl_quote_ptrs
    lw a1, 0(a1)
    addu t0, a1, t0
    lhu t0, 0(t0)

    jal displayCookingSub
    addu a1, a1, t0

    lw ra, 0xc(sp)
    lw a0, 0x8(sp)
    jr ra
    addiu sp, sp, 0x10

    @@exit:
    j displayWrappedMain
    ; copied from original code
    li t0, 0

btl_quote_stop_cooking:
    la v0, btl_quote_num
    sw zero, 0(v0)
    j draw_menu_str
    li v0, 0

recipe_skip_icon:
    la t0, btl_quote_num
    lhu t0, 0(t0)
    beq t0, zero, @@exit_normal
    nop

    ; skip past the old code
    la ra, 0x088c4ba4
    jr ra
    nop

    @@exit_normal:
    ; call the original function
    j 0x088c69c8
    nop

msg_skit_prompt:
    .dw 0

display_skit_prompt_stub:
    addiu sp, sp, -0x10
    sw ra, 0xc(sp)
    la a0, msg_ot
    lw a0, 0(a0)

    jal displaySkitPrompt
    nop

    lw ra, 0xc(sp)
    jr ra
    addiu sp, sp, 0x10

bgm_title_ptr:
    .dw 0

vo_title_ptr:
    .dw 0

get_bgm_title:
    la t0, bgm_title_ptr
    lw t0, 0(t0)
    nop

    addiu a0, a0, -1
    sll a0, a0, 1
    addu v0, t0, a0
    lhu v0, 0(v0)
    nop

    jr ra
    addu v0, v0, t0

get_vo_title:
    la t0, vo_title_ptr
    lw t0, 0(t0)
    nop

    addiu a0, a0, -1
    sll a0, a0, 1
    addu v0, t0, a0
    lhu v0, 0(v0)
    nop

    jr ra
    addu v0, v0, t0

monsterbook_sort_lut2:
    .incbin OUT_DIR+"/monsterbook-sorting2.bin"
    .align 4

monsterbook_get_display_number_sorted:
   la v0, monsterbook_sort_lut2
   la a1, MonNum
   lw a1, 0(a1)
   addu v0, v0, a1
   lbu a1, 0(v0)
   jr ra
   addiu a1, a1, 1

monsterbook_get_display_number_seq:
   la a1, mon_book_cur
   lw a1, 0(a1)
   jr ra
   addiu a1, a1, 1

monsterbook_calc_percentage:
    ; div by 476
    addiu a1, a1, 238
    lui v0, 0x89a3
    ori v0, v0, 0x049b
    mult v0, a1
    mfhi v1
    jr ra
    srl v1, v1, 8

_mon_vsync_loop:
    jal set_str_cursor
    nop
    addiu  sp, sp, -0x10
    sw     ra, 0xC(sp)
    jal __mon_vsync_loop
    nop
    lw     ra, 0xC(sp)
    addiu  sp, sp, 0x10

    j 0x88F0624
    nop

_mon_init:
    jal mon_wall_tim_read
    nop
    addiu  sp, sp, -0x10
    sw     ra, 0xC(sp)
    jal __mon_init
    nop
    lw     ra, 0xC(sp)
    addiu  sp, sp, 0x10

    j 0x88EFF4C
    nop

_check_dbg:
    addiu  sp, sp, -0x10
    sw     ra, 0xC(sp)
    jal check_dbg
    andi   a1, s1, 0xffff

    lw     ra, 0xC(sp)
    addiu  sp, sp, 0x10

    j 0x894DC9C
    nop

_init_scdeb_window:
    addiu  sp, sp, -0x10
    sw     ra, 0xC(sp)
    jal init_scdeb_window
    nop
    lw     ra, 0xC(sp)
    addiu  sp, sp, 0x10

    addiu  sp, sp, -0x10
	sw     ra, 0xc(sp)
    j 0x88D4C08
    nop


_menu_top_main:
    addiu  sp, sp, -0x10
    sw     ra, 0xC(sp)
    jal __menu_top_main
    nop
    lw     ra, 0xC(sp)
    addiu  sp, sp, 0x10

    ; Go back to original
    addiu  sp, sp, -0x10
	sw     ra, 0xc(sp)
    j 0x88B3580
    nop

ttl_check_debug_enabled:
    la v0, sce_debug_mode
    lbu v0, 0(v0)
    beq v0, zero, @@debug_disabled
    nop

    b @@exit
    li t0, 5

    @@debug_disabled:
    li t0, 4

    @@exit:
    ; copied from original code
    addiu s3, s3, 0x1
    jr ra
    slt v0, s3, t0

btl_quote_stop_stub:
    la v0, btl_quote_num
    sw zero, 0(v0)
    la v0, btl_quote_timeout
    jr ra
    sh zero, 0(v0)

end_movie_stub:
    addiu sp, sp, -0x10
    sw ra, 0xc(sp)

    jal play_song
    li a0, 5

    lw ra, 0xc(sp)
    j 0x088dfc28
    addiu sp, sp, 0x10

end_movie_audio_stub:
    la v0, game_mode
    lw v0, 0(v0)
    li t0, 4  ; game_mode_end_movie
    beq v0, t0, @@skip
    nop

    j 0x08928704
    nop

    @@skip:
    jr ra
    nop

dsp_menu_custom_switch:
    .dw 0x088ab20c
    .dw 0x088ab2fc
    .dw 0x088ab348
    .dw 0x088ab2fc
    .dw 0x088ab380
    .dw 0x088ab3ac
    .dw 0x088ab3d8
    .dw 0x088ab46c
    .dw 0x088ab2fc
    .dw 0x088ab504
    .dw 0x088ab55c
    .dw battle_sub_toggle_render

    .ifndef disable_qol
        .dw holy_bottle_toggle_render
    .endif

    .dw 0x088ab530

battle_sub_toggle_render:
    lbu     v1, 0x4(s2)
    lui     v0, hi(ot)
    lw      a0, lo(ot)(v0)
    move    t1, s3
    ; check our flag
    andi    a1, v1,0x8
    li      a2, 0
    li      a3, 0x1
    ; render ON/OFF value
    jal     0x088ab874
    li      t0,0x80
    j       0x088ab5e4
    nop

holy_bottle_toggle_render:
    lbu     v1, 0x4(s2)
    lui     v0, hi(ot)
    lw      a0, lo(ot)(v0)
    move    t1, s3
    ; check our flag
    andi    a1, v1,0x10
    li      a2, 0
    li      a3, 0x1
    ; render ON/OFF value
    jal     0x088ab874
    li      t0,0x80
    j       0x088ab5e4
    nop

menu_custom_main_switch:
    .dw 0x088a9c30
    .dw 0x088a9754
    .dw 0x088a9774
    .dw 0x088a97a8
    .dw 0x088a97f0
    .dw 0x088a9824
    .dw 0x088a983c
    .dw 0x088a9854
    .dw 0x088a9888
    .dw 0x088a98c0
    .dw 0x088a98f4
    .dw 0x088a9924
    .dw battle_sub_toggle_save

    .ifndef disable_qol
        .dw holy_bottle_toggle_save
    .endif

    .dw 0x088a990c

battle_sub_toggle_save:
   addiu   a0,s0,0x4
   li      a1,0
   jal     get_pad_bit
   ; toggle our flag
   li      a2,0x8
   j       0x088a9c30
   nop

holy_bottle_toggle_save:
   addiu   a0,s0,0x4
   li      a1,0
   jal     get_pad_bit
   ; toggle our flag
   li      a2,0x10
   j       0x088a9c30
   nop

custom_new_labels:
    .ifndef disable_qol
        ; Holy Bottles
        .dh 185
    .endif

    ; Combo Counter (moved)
    .dh 91

    .align 4

dsp_menu_custom_main_stub:
    ; cases beyond 0xb not covered by the else case
    slti v0, s0, 0xc
    bne v0, zero, @@exit
    nop

    ; get label index
    addiu v0, s0, -0xc
    sll v0, v0, 1
    la a3, custom_new_labels
    addu a3, a3, v0
    lhu a3, 0(a3)

    ; load pointer
    sll a3, a3, 1
    la v0, str08_ptr
    addu a3, v0, a3
    lhu a3, 0(a3)
    addu a3, v1, a3

    @@exit:
    j draw_menu_str
    nop

sorcerer_ring_chk:
    ; proper check, must be in the inventory
    ; and count must be > 0

    ; Check inventory
    la at, party_data+0x720 ; items start
    la a0, party_data+0x720+(0x200*2) ; items end
    li v1, sorcerer_ring_id

    @@item_chk:
    lhu v0, 0(at)
    beq v0, v1, @@has_ring
    addiu at,2

    bne at, a0, @@item_chk
    nop

    la at, sce+0x3A7
    b @@no_ring
    lbu v1,0(at)

    ; It's in, now is count > 0?
    @@has_ring:
    la at, party_data+0x520+sorcerer_ring_id
    lb v0, 0(at)
    la at, sce+0x3A7
    beqz v0, @@no_ring
    lbu v1,0(at)

    ori v1, 1
    b @@end
    sb v1, 0(at)

    @@no_ring:
    andi v1, ~1
    sb v1, 0(at)

    @@end:
    lbu.u a1,0x908A3FB
    j 0x088D0CBC
    lbu.l a1,0x908A3FB

sorcerer_ring_chk2:
    li at, sorcerer_ring_id
    bne t3,at, @@end
    nop
    la  at, sce+0x3A7
    lbu v0, 0(at)
    ori v0, 1
    sb v0, 0(at)

    @@end:
    bne t3, t5, @@end_2
    nop
    ori t7, t7, 0x1
    @@end_2:
    j 0x088D0D5C
    nop

holy_bottle_stub:
    la v1, 0x09089ac2
    lbu v1, 0(v1)
    li v0, 1
    bne v0, v1, @@exit_normal
    nop

    ; check our customization flag
    la v1, custom_flag_4
    lbu v1, 0(v1)
    andi v1, 0x10
    bne v1, zero, @@exit_early
    nop

    @@exit_normal:
    j exec_sce_encount
    nop

    @@exit_early:
    jr ra
    nop

.macro ngp_item_copy,item_id
    lbu v1, 0x534+item_id(sp)
    beq v1, zero, @@exit
    nop

    la v0, item_counts+item_id
    sb v1, 0(v0)

    la v0, item_list
    sll v1, s0, 0x1
    addu v0, v0, v1

    li a0, item_id
    sh a0, 0x0(v0)
    addiu s0, s0, 0x1
.endmacro

exe_grade_end_stub:
    lui v0, hi(consumables_toggle)
    lhu v1, lo(consumables_toggle)(v0)
    li v0, 0x1
    bne v1, v0, @@exit
    nop

    ; we need to increment the slot number if the monster book toggle was enabled
    lui v0, hi(monsterbook_toggle)
    lhu v1, lo(monsterbook_toggle)(v0)
    bne v1, zero, @@skip
    nop

    addiu s0, s0, 1

    @@skip:
    ; Scout Orb
    ngp_item_copy 0x91

    ; Combo Counter
    ngp_item_copy 0x94

    ; Curio's Mirror
    ngp_item_copy 0x185

    @@exit:
    ; copied from original code
    lw ra, 0xc(sp)
    lw s0, 0x8(sp)
    jr ra
    addiu sp, sp, 0xdd0

monster_names_ptr:
    .dw 0

get_monster_name:
    addiu sp, sp, -0x10
    sw ra, 0xc(sp)

    ; get pointer
    la v0, monster_names_ptr
    lw v0, 0(v0)
    move t0, v0

    lbu v1, 0(a1)
    sll v1, v1, 1

    addu v0, v0, v1
    lhu v1, 0(v0)

    ; copy string
    jal strcpy
    addu a1, t0, v1

    lw ra, 0xc(sp)
    jr ra
    addiu sp, sp, 0x10

; default skit group
fc_default_dat_new:
    ; skit 40
    .dh (40) << 7, 0x3C, 0x17C
    ; skit 41
    .dh (41) << 7, 0x186, 0x1A4
    ; skit 123
    .dh (123) << 7, 0x1AE, 0x1FE
    .dh 0, 0, 0

set_game_mode_stub:
    la v1, cur_skit_str
    jr ra
    sw zero, 0(v1)

; find_name_tag:
;     addu a3, a0, a1
;     li a1, 0x7
;
;     @@back:
;     lhu v1, 0(a3)
;     beq v1, zero, @@exit
;     nop
;
;     beq v1, a1, @@found
;     nop
;
;     b @@back
;     addiu a3, a3, 2
;
;     @@found:
;     sh v0, 2(a3)
;
;     @@exit:
;     jr ra
;     nop

; display_quote_arche:
;     addiu sp, sp, -0x10
;     sw ra, 0xc(sp)
;
;     ; exit if null
;     la t0, btl_quote_num
;     lhu t0, 0(t0)
;     beq t0, zero, @@exit
;     sll t0, t0, 1
;
;     ; get string pointer
;     la a1, btl_quote_ptrs
;     lw a1, 0(a1)
;     addu a2, a1, t0
;     lhu t0, 0(a2)
;
;     ; ypos
;     li a2, 8
;
;     addiu a0, s0, 0x86c
;     lw a0, 0(a0)
;
;     jal displayCentered
;     addu a1, a1, t0
;
;     @@exit:
;     lw ra, 0xc(sp)
;
;     ; copied from original code
;     addiu a0, s0, 0x106c
;     li a1, 0
;
;     jr ra
;     addiu sp, sp, 0x10

.ifdef false
victory_quotes:
    ; Cless
    .dh 0x76
    .dh 0x77
    .dh 0x78
    .dh 0x79
    .dh 0x7a
    .dh 0x7b
    .dh 0x7c
    .dh 0x7d
    .dh 0x7e
    .dh 0x7f
    .dh 0x80
    .dh 0x81
    .dh 0x82
    .dh 0x83
    .dh 0x84
    .dh 0x85
    ; Mint
    .dh 0xe0
    .dh 0xe1
    .dh 0xe2
    .dh 0xe3
    .dh 0xe4
    ; Arche
    .dh 0x129
    .dh 0x12a
    .dh 0x12b
    .dh 0x12c
    .dh 0x12d
    .dh 0x12e
    .dh 0x12f
    ; Klarth
    .dh 0x18c
    .dh 0x18d
    .dh 0x18e
    .dh 0x18f
    .dh 0x190
    .dh 0x191
    ; Chester
    .dh 0x1e5
    .dh 0x1e6
    .dh 0x1e7
    .dh 0x1e8
    .dh 0x1e9
    ; Suzu
    .dh 0x231
    .dh 0x232
    .dh 0x233
    .dh 0x234
    .dh 0x235
    .dh 0x236
    ; Everyone
    .dh 0x597
    ; Rody
    .dh 0x62c
    .dh 0x62d
    .dh 0x62e
    .dh 0x62f
    .dh 0
    .align 4

quotes_enabled_subs:
    ; prologue battle
    .dh 0x13
    .dh 0x14
    .dh 0x15
    .dh 0x16
    .dh 0x17
    .dh 0x18
    .dh 0x19
    .dh 0x1a
    .dh 0x1b
    .dh 0x1c
    .dh 0x1d
    ; cooking
    .dh 0x46
    .dh 0x47
    .dh 0x48
    .dh 0x49
    .dh 0x4a
    .dh 0x4b
    .dh 0x4c
    .dh 0x4d
    ; Cless Stygian Blade
    .dh 0x64a
    .dh 0x64b
    .dh 0x64c
    .dh 0x64d
    .dh 0x64e
    .dh 0
    .align 4
.endif
