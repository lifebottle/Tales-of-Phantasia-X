line_len equ 0x220
msg_buf equ new_msg_buf-reloc_base
msg_buf_2 equ msg_buf+line_len
msg_buf_3 equ msg_buf+(line_len*2)
msg_buf_4 equ msg_buf+(line_len*3)

.macro init_zero,dest,reg
    lui reg, hi(dest)
    sh zero, lo(dest)(reg)
.endmacro

.macro init_buf,reg
    init_zero msg_buf, reg
    init_zero msg_buf_2, reg
    init_zero msg_buf_3, reg
    init_zero msg_buf_4, reg
.endmacro

; NOTE: you might need to change this if you added new glyphs to the font
zero_width_char equ 0x6f

; fixed dialogue buffers - multiplication by 0x44 (changed to 0x88)
; make_msg_buf

.org 0x088e1df8
   ; 088e1df8 80 30      sll     a2,a2,0x2
   sll a2, a2, 0x5 ; was 0x2

.org 0x088e1ecc
   ; 088e1ecc 80 30      sll     a2,a2,0x2
   sll a2, a2, 0x5 ; was 0x2

.org 0x088e1fc0
   ; 088e1fc0 80 28      sll     a1,a1,0x2
   sll a1, a1, 0x5 ; was 0x2

.org 0x088e202c
   ; 088e202c 80 18      sll     v1,v1,0x2
   sll v1, v1, 0x5 ; was 0x2

; make_msg_buf - relocate buffer
   ; 088e1de4 08 09      lui     a1,0x908
   ;          05 3c
   ; 088e1de8 e4 7b      addiu   a1,a1,0x7be4
   ;          a5 24
   .org 0x088e1de4
        la a1, msg_buf

   ; 088e1fac 08 09      lui     a0,0x908
   ;          04 3c
   ; 088e1fb0 e4 7b      addiu   a0,a0,0x7be4
   ;          84 24
   .org 0x088e1fac
        la a0, msg_buf

   ; 088e1eb8 08 09      lui     a1,0x908
   ;          05 3c
   ; 088e1ebc e4 7b      addiu   a1,a1,0x7be4
   ;          a5 24
   .org 0x088e1eb8
        la a1, msg_buf

   ; 088e2014 08 09      lui     a1,0x908
   ;          05 3c
   ; 088e2018 e4 7b      addiu   a1,a1,0x7be4
   ;          a5 24
   .org 0x088e2014
        la a1, msg_buf


; fixed dialogue buffers - add 0x44 (changed to 0x88)

; FUN_088e283c
.org 0x088e2988
   ; 088e2988 44 00      _addiu  s0,s0,0x44
   ;          10 26
    addiu s0, s0, line_len ; was 0x44

; FUN_088e283c - relocate buffer

   ; 088e2918 08 09      lui     s0,0x908
   ;          10 3c
   .org 0x088e2918
        lui s0, hi(msg_buf)

   ; 088e292c e4 7b      addiu   s0,s0,0x7be4
   ;          10 26
   .org 0x088e292c
        addiu s0, s0, lo(msg_buf)

; clear_msg_buf
   ; 088e1c90 08 09      lui     v1,0x908
   ;          03 3c
   ; 088e1c94 e4 7b      sh      zero,offset msg_buf(v1)           = ??
   ;          60 a4
   ; 088e1c98 08 09      lui     v1,0x908
   ;          03 3c
   ; 088e1c9c 28 7c      sh      zero,offset msg_buf[68](v1)
   ;          60 a4
   ; 088e1ca0 08 09      lui     v1,0x908
   ;          03 3c
   ; 088e1ca4 6c 7c      sh      zero,offset msg_buf[136](v1)
   ;          60 a4
   ; 088e1ca8 08 09      lui     v1,0x908
   ;          03 3c
   ; 088e1cac b0 7c      sh      zero,offset msg_buf[204](v1)
   ;          60 a4
.org 0x088e1c90
    init_buf v1

; init_msg_win_sys
.org 0x088e3380
   ; 088e3380 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e3384 e4 7b      sh      zero,offset msg_buf(v0)           = ??
   ;          40 a4
   ; 088e3388 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e338c 28 7c      sh      zero,offset msg_buf[68](v0)
   ;          40 a4
   ; 088e3390 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e3394 6c 7c      sh      zero,offset msg_buf[136](v0)
   ;          40 a4
   ; 088e3398 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e339c b0 7c      sh      zero,offset msg_buf[204](v0)
   ;          40 a4
    init_buf v0

; msg_window_frame
.org 0x088e2db0
   ; 088e2db0 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e2db4 e4 7b      sh      zero,offset msg_buf(v0)           = ??
   ;          40 a4
   ; 088e2db8 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e2dbc 28 7c      sh      zero,offset msg_buf[68](v0)
   ;          40 a4
   ; 088e2dc0 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e2dc4 6c 7c      sh      zero,offset msg_buf[136](v0)
   ;          40 a4
   ; 088e2dc8 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e2dcc b0 7c      sh      zero,offset msg_buf[204](v0)
   ;          40 a4
    init_buf v0

   ; 088e2e10 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e2e14 e4 7b      sh      zero,offset msg_buf(v0)           = ??
   ;          40 a4
   ; 088e2e18 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e2e1c 28 7c      sh      zero,offset msg_buf[68](v0)
   ;          40 a4
   ; 088e2e20 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e2e24 6c 7c      sh      zero,offset msg_buf[136](v0)
   ;          40 a4
   ; 088e2e28 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e2e2c b0 7c      sh      zero,offset msg_buf[204](v0)
   ;          40 a4
   .org 0x088e2e10
    init_buf v0

   ; 088e2f40 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e2f44 e4 7b      lhu     v0,offset msg_buf(v0)             = ??
   ;          42 94
   .org 0x088e2f40
        lui v0, hi(msg_buf)
        lhu v0, lo(msg_buf)(v0)

   ; 088e3034 08 09      lui     a0,0x908
   ;          04 3c
   ; 088e3038 08 09      lui     a1,0x908
   ;          05 3c
   .org 0x088e3034
        lui a0, hi(msg_buf)
        lui a1, hi(msg_buf)

   ; 088e303c 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e3040 ff ff      addiu   v1,v1,-0x1
   ;          63 24
   ; 088e3044 e4 7b      addiu   a0=>msg_buf,a0,0x7be4             = ??
   ;          84 24
   .org 0x088e3044
        addiu a0, a0, lo(msg_buf)

   ; 088e3048 d6 7b      sh      v1,offset msg_line(v0)            = ??
   ;          43 a4
   ; 088e304c 28 7c      addiu   a1=>msg_buf[68],a1,0x7c28
   ;          a5 24
   .org 0x088e304c
        addiu a1, a1, lo(msg_buf_2)

   ; 088e3050 a2 2c      jal     memcpy                            void * memcpy(void * _
   ;          20 0e
   ; 088e3054 cc 00      _li     a2,0xcc
   ;          06 24
   .org 0x088e3054
        li a2, (line_len*3) ; was 0xcc

   ; 088e3058 08 09      lui     v0,0x908
   ;          02 3c
   ; 088e305c b0 7c      sh      zero,offset msg_buf[204](v0)
   ;          40 a4
   .org 0x088e3058
        lui v0, hi(msg_buf_4)
        sh zero, lo(msg_buf_4)(v0)

   ; disable char limit in dialogue boxes
   ; 088e1e50 68 7b      lbu     v1,offset msg_chr(v1)             = ??
   ;          63 90
   ; 088e1e54 10 00      slti    v1,v1,0x10
   ;          63 28
   ; 088e1e58 07 00      bne     v1,zero,LAB_088e1e78
   ;          60 14
   ; 088e1e5c 00 00      _nop
   ;          00 00
   ; 088e1e60 ff ff      andi    v1,v0,0xffff
   ;          43 30
   ; 088e1e64 10 00      slti    v1,v1,0x10
   ;          63 28
   .org 0x088e1e54
        b 0x88e1e78
        nop

    .org 0x088e1e64
        b 0x88e1e78
        nop

   ; 088e1f0c 0f 00      slti    v1,v1,0xf
   ;          63 28
   ; 088e1f10 3e 00      bne     v1,zero,LAB_088e200c
   ;          60 14
   .org 0x088e1f0c
        b 0x088e200c
        nop

   ; set_msg_addr
   ; 088e1a40 00 39      sll     a3,t1,0x4
   ;          09 00
   ; .org 0x088e1a40
   ;      sll a3, t1, 0x6 ; was 0x4

   ; 088e1a50 80 10      sll     v0,v0,0x2
   ;          02 00
   .org 0x088e1a50
        sll v0, v0, 0x5 ; was 0x2

   ; msg_next_page
   ; 088e21ac 00 29      sll     a1,a3,0x4
   ;          07 00
   ; .org 0x088e21ac
   ;      sll a1, a3, 0x6 ; was 0x4

   ; 088e21bc 80 18      sll     v1,v1,0x2
   ;          03 00
   .org 0x088e21bc
        sll v1, v1, 0x5 ; was 0x2

   ; msg_buf - relocate buffer
   ; 088e219c 08 09      lui     a0,0x908
   ;          04 3c
   ; 088e21a0 e4 7b      addiu   a0,a0,0x7be4
   ;          84 24
   .org 0x088e219c
        la a0, msg_buf

   ; msg_next_line
   ; 088e2124 80 28      sll     a1,a1,0x2
   ;          05 00
   .org 0x088e2124
        sll a1, a1, 0x5 ; was 0x2

   ; msg_next_line, relocate msg_buf
   ; 088e210c 08 09      lui     a0,0x908
   ;          04 3c
   ; 088e2110 e4 7b      addiu   a0,a0,0x7be4
   ;          84 24
   .org 0x088e210c
        la a0, msg_buf

   ; set_msg_addr - opening quote
   ; 088e1e00 06 00      bne     a3,a0,LAB_088e1e1c
   ;          e4 14
   ; replace msg_head_char with space
   .org 0x088e1e00
        b 0x088e1e1c

   ; set_msg_addr - auto-indent space
   ; 088e1e1c 10 00      li      a0,0x10
   ;          04 24
   .org 0x088e1e1c
        li a0, zero_width_char ; changed to zero-width character

   ; set_msg_addr - relocate msg_buf
   ; 088e1a30 08 09      lui     v1,0x908
   ;          03 3c
   ; 088e1a34 e4 7b      addiu   v1,v1,0x7be4
   ;          63 24
   .org 0x088e1a30
        la v1, msg_buf
