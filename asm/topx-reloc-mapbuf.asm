map_buf_len equ 0x35000

.definelabel malloc,0x0880A8B8
.definelabel memcpy,0x0880b288
.definelabel map_buf_old,0x0908D2FC
.definelabel map_index,0x0908d2f4

; FUN_088f2a68 - base address for map buf
; 088f2acc 09 09      lui     v0,0x909
;          02 3c
; 088f2ad0 21 18      addu    v1,v1,a0
;          64 00
; 088f2ad4 fc d2      addiu   v0,v0,-0x2d04
;          42 24
; 088f2ad8 00 1c      sll     v1,v1,0x10
;          03 00
; 088f2adc 9e 81      jal     FUN_08920678                      undefined FUN_08920678()
;          24 0e
; 088f2ae0 21 88      _addu   s1,v0,v1
;          43 00
.org 0x088f2acc
    jal map_load_ptr-0x2200
    addu v1, v1, a0
    nop

.org 0x088f2ae0
    move s1, v0     ; replace addition

; FUN_088f2844
; 088f2908 40 10      sll     v0,v1,0x1
;          03 00
; 088f290c 21 10      addu    v0,v0,v1
;          43 00
; 088f2910 00 1c      sll     v1,v0,0x10
;          02 00
; 088f2914 09 09      lui     v0,0x909
;          02 3c
; 088f2918 fc d2      addiu   v0,v0,-0x2d04
;          42 24
; 088f291c 21 20      addu    a0,a0,s1
;          91 00
; 088f2920 21 28      addu    a1=>DAT_0905d2fc,v0,v1            = ??
;          43 00
.org 0x088f2914
    jal map_load_ptr-0x2200
    nop

.org 0x088f2920
    move a1, v0     ; replace addition

; 088f295c 40 10      sll     v0,v1,0x1
;          03 00
; 088f2960 21 10      addu    v0,v0,v1
;          43 00
; 088f2964 00 1c      sll     v1,v0,0x10
;          02 00
; 088f2968 09 09      lui     v0,0x909
;          02 3c
; 088f296c fc d2      addiu   v0,v0,-0x2d04
;          42 24
; 088f2970 21 28      addu    a1=>DAT_0905d2fc,v0,v1            = ??
;          43 00
.org 0x088f2968
    jal map_load_ptr-0x2200
    nop

    move a1, v0     ; replace addition

; FUN_08925614 - malloc_heap size
; 08925638 03 00      lui     a0,0x3
;          04 3c
; .org 0x08925638
;      lui a0, 0x6

; main
; 088b0834 9e 08      lui     a0,0x89e
;          04 3c
; 088b0838 8b 08      lui     a1,0x88b
;          05 3c
.org 0x088b0834
    j map_buf_malloc-0x2204
    nop
