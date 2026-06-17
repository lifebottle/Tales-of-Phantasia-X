; reclaim space previously used by item descriptions
.org 0x089d255c
.area 0x089D4000-.
    discard_msg_stub:
       ; load msg pointer
       lhu a2, discard_ptr
       ; add to block start
    discard_msg_ptr:
       lui v1,0x8c5
       addiu v1, v1, -0x7848
       addu a2, v1, a2
       jal discardMsg
       nop
       j 0x088c5024
       nop

    map_buf_ptr:
        .dw 0

    map_buf_malloc:
        addiu sp, sp, -0x10
        sw ra, 0xc(sp)
        sw a0, 0x8(sp)
        sw a1, 0x4(sp)

        la a0, map_buf_len

        jal malloc
        nop

        bnez v0, @@malloc_valid
        nop

        la v0, map_buf_old

        @@malloc_valid:
        la t0, map_buf_ptr
        sw v0, 0(t0)

        lw ra, 0xc(sp)
        lw a0, 0x8(sp)
        lw a1, 0x4(sp)
        addiu sp, sp, 0x10

        ; copied from old code
        lui     a0,0x89e
        lui     a1,0x88b

        j 0x088b083c
        nop

    npc_name_fix:
        addiu sp, sp, -0x10
        sw ra, 0xc(sp)

        li t1, 0
        la v0, party_data+0x500 ; current party

        @@back:
        lh v1, 0(v0)

        ; not Rody or Rhea, skip
        sltiu t2, v1, 7
        bne t2, zero, @@skip
        nop

        ; save this for later
        sw v0, 0x8(sp)

        ; patch name in party data
        li v0, 0xa0
        mult v1, v0
        mflo a0
        la v0, 0x9088edc-0xa0
        addu a0, a0, v0

        ; get pointer
        la v0, str08_ptr-2
        sll v1, v1, 1
        addu v0, v0, v1
        lhu v0, 0(v0)

        ; block pointer, patched by menu insertor
        @@npc_name_fix_ptr:
        la a1, 0xdeadbeef

        jal strcpy
        addu a1, a1, v0

        lw v0, 0x8(sp)

        @@skip:
        addiu v0, v0, 2

        ; party is only 6 entries
        sltiu t2, t1, 6
        bne t2, zero, @@back
        addiu t1, t1, 1

        lw ra, 0xc(sp)
        jr ra
        addiu sp, sp, 0x10

    utility_lang_stub:
        ; copied from original code
        sw s1, 0x8(sp)

        li s1, 1
        lui v0,0x91e
        sw s1,-0x3dd0(v0)

        jr ra
        move s1, a0

    utility_lang_stub2:
        ; copied from original code
        sw s1, 0x4(sp)

        li s1, -1
        lui v0,0x91e
        sw s1,-0x3dd0(v0)

        jr ra
        move s1, a0

    utility_lang_stub3:
        li a0, 1
        lui v0,0x91e

        jr ra
        sw a0,-0x43e4(v0)

.endarea
