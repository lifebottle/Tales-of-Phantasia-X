// Phantasia disasm - File: i_c06_09.decomp
.macro MK_INTR, type, id, lab
  .short type :: .short id :: .word lab
.endmacro

.word code_start ; 0x0001F4
.word text_start ; 0x002A98

// Interrupts
.word 61
MK_INTR 0, 168, intr_0
MK_INTR 0, 16, msg_3
MK_INTR 0, 17, msg_4
MK_INTR 0, 18, msg_5
MK_INTR 0, 19, msg_6
MK_INTR 0, 20, msg_7
MK_INTR 0, 28, msg_8
MK_INTR 0, 29, msg_9
MK_INTR 0, 30, msg_10
MK_INTR 0, 31, msg_11
MK_INTR 0, 32, msg_12
MK_INTR 0, 33, msg_13
MK_INTR 0, 34, msg_14
MK_INTR 0, 36, msg_15
MK_INTR 0, 37, msg_16
MK_INTR 0, 40, msg_17
MK_INTR 0, 41, intr_16
MK_INTR 0, 44, msg_35
MK_INTR 0, 45, msg_36
MK_INTR 0, 142, msg_37
MK_INTR 0, 122, intr_20
MK_INTR 0, 50, msg_40
MK_INTR 0, 51, msg_41
MK_INTR 0, 52, msg_42
MK_INTR 0, 53, msg_43
MK_INTR 0, 54, msg_44
MK_INTR 0, 55, msg_51
MK_INTR 0, 56, msg_52
MK_INTR 0, 57, msg_53
MK_INTR 0, 58, msg_54
MK_INTR 0, 59, msg_55
MK_INTR 0, 60, msg_56
MK_INTR 0, 61, msg_62
MK_INTR 0, 62, msg_65
MK_INTR 0, 63, intr_34
MK_INTR 0, 64, intr_35
MK_INTR 0, 67, msg_70
MK_INTR 0, 68, msg_71
MK_INTR 0, 69, intr_38
MK_INTR 2, 1, intr_39
MK_INTR 2, 2, intr_40
MK_INTR 2, 3, intr_41
MK_INTR 2, 4, intr_42
MK_INTR 2, 5, intr_43
MK_INTR 2, 6, intr_44
MK_INTR 2, 7, intr_45
MK_INTR 2, 8, intr_46
MK_INTR 2, 9, msg_94
MK_INTR 2, 10, intr_48
MK_INTR 1, 2048, intr_49
MK_INTR 1, 2049, intr_50
MK_INTR 1, 2050, intr_51
MK_INTR 1, 2051, intr_52
MK_INTR 1, 2052, intr_53
MK_INTR 1, 2053, intr_54
MK_INTR 1, 2054, intr_55
MK_INTR 1, 2055, intr_56
MK_INTR 1, 2056, intr_57
MK_INTR 1, 2057, intr_58
MK_INTR 1, 2058, intr_59
MK_INTR 1, 2059, intr_60

code_start:

entrypoint:
    /* 0001F4 02 D1 02       */ CALL func_2D1
  lab_3:
    /* 0001F7 01             */ CALC
    /* 0001F8 0A 51          */ PUSH.VAR 20746
    /* 0001FA 00 C0          */ EXPR.END
    /* 0001FC 05 C6 02       */ JZ lab_2C6
    /* 0001FF 01             */ CALC
    /* 000200 11 00          */ PUSH 17
    /* 000202 3A 80          */ SYSCALL 0x0A ; sce_move_check / tsce_move_check (1 arg(s))
    /* 000204 00 00          */ PUSH 0
    /* 000206 14 C0          */ EXPR.EQUALS
    /* 000208 00 C0          */ EXPR.END
    /* 00020A 05 64 00       */ JZ lab_64
    /* 00020D 01             */ CALC
    /* 00020E 06 51          */ PUSH.VAR 20742
    /* 000210 00 C0          */ EXPR.END
    /* 000212 05 42 00       */ JZ lab_42
    /* 000215 01             */ CALC
    /* 000216 11 00          */ PUSH 17
    /* 000218 43 80          */ SYSCALL 0x13 ; sce_set_direction_west / sce_dummy_proc (1 arg(s))
    /* 00021A 00 C0          */ EXPR.END
    /* 00021C 01             */ CALC
    /* 00021D 11 00          */ PUSH 17
    /* 00021F 40 00          */ PUSH 64
    /* 000221 C0 10 01       */ PUSH 448
    /* 000224 06 00          */ PUSH 6
    /* 000226 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 000228 00 C0          */ EXPR.END
    /* 00022A 01             */ CALC
    /* 00022B 06 51          */ PUSH.VAR 20742
    /* 00022D 00 00          */ PUSH 0
    /* 00022F 1B C0          */ EXPR.ASSIGN
    /* 000231 00 C0          */ EXPR.END
    /* 000233 04 61 00       */ JMP lab_61
  lab_42:
    /* 000236 01             */ CALC
    /* 000237 11 00          */ PUSH 17
    /* 000239 41 80          */ SYSCALL 0x11 ; sce_set_direction_east / sce_dummy_proc (1 arg(s))
    /* 00023B 00 C0          */ EXPR.END
    /* 00023D 01             */ CALC
    /* 00023E 11 00          */ PUSH 17
    /* 000240 90 10 00       */ PUSH 144
    /* 000243 A0 10 01       */ PUSH 416
    /* 000246 06 00          */ PUSH 6
    /* 000248 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 00024A 00 C0          */ EXPR.END
    /* 00024C 01             */ CALC
    /* 00024D 06 51          */ PUSH.VAR 20742
    /* 00024F 01 00          */ PUSH 1
    /* 000251 1B C0          */ EXPR.ASSIGN
    /* 000253 00 C0          */ EXPR.END
  lab_61:
    /* 000255 04 64 00       */ JMP lab_64
  lab_64:
    /* 000258 01             */ CALC
    /* 000259 12 00          */ PUSH 18
    /* 00025B 3A 80          */ SYSCALL 0x0A ; sce_move_check / tsce_move_check (1 arg(s))
    /* 00025D 00 00          */ PUSH 0
    /* 00025F 14 C0          */ EXPR.EQUALS
    /* 000261 00 C0          */ EXPR.END
    /* 000263 05 BE 00       */ JZ lab_BE
    /* 000266 01             */ CALC
    /* 000267 08 51          */ PUSH.VAR 20744
    /* 000269 00 C0          */ EXPR.END
    /* 00026B 05 9C 00       */ JZ lab_9C
    /* 00026E 01             */ CALC
    /* 00026F 12 00          */ PUSH 18
    /* 000271 40 80          */ SYSCALL 0x10 ; sce_set_direction_north / sce_dummy_proc (1 arg(s))
    /* 000273 00 C0          */ EXPR.END
    /* 000275 01             */ CALC
    /* 000276 12 00          */ PUSH 18
    /* 000278 C0 10 01       */ PUSH 448
    /* 00027B 40 10 01       */ PUSH 320
    /* 00027E 06 00          */ PUSH 6
    /* 000280 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 000282 00 C0          */ EXPR.END
    /* 000284 01             */ CALC
    /* 000285 08 51          */ PUSH.VAR 20744
    /* 000287 00 00          */ PUSH 0
    /* 000289 1B C0          */ EXPR.ASSIGN
    /* 00028B 00 C0          */ EXPR.END
    /* 00028D 04 BB 00       */ JMP lab_BB
  lab_9C:
    /* 000290 01             */ CALC
    /* 000291 12 00          */ PUSH 18
    /* 000293 42 80          */ SYSCALL 0x12 ; sce_set_direction_south / sce_dummy_proc (1 arg(s))
    /* 000295 00 C0          */ EXPR.END
    /* 000297 01             */ CALC
    /* 000298 12 00          */ PUSH 18
    /* 00029A E0 10 01       */ PUSH 480
    /* 00029D 80 10 01       */ PUSH 384
    /* 0002A0 06 00          */ PUSH 6
    /* 0002A2 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0002A4 00 C0          */ EXPR.END
    /* 0002A6 01             */ CALC
    /* 0002A7 08 51          */ PUSH.VAR 20744
    /* 0002A9 01 00          */ PUSH 1
    /* 0002AB 1B C0          */ EXPR.ASSIGN
    /* 0002AD 00 C0          */ EXPR.END
  lab_BB:
    /* 0002AF 04 BE 00       */ JMP lab_BE
  lab_BE:
    /* 0002B2 01             */ CALC
    /* 0002B3 1C 51          */ PUSH.VAR 20764
    /* 0002B5 00 00          */ PUSH 0
    /* 0002B7 01 00          */ PUSH 1
    /* 0002B9 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 0002BB 1B C0          */ EXPR.ASSIGN
    /* 0002BD 00 C0          */ EXPR.END
    /* 0002BF 01             */ CALC
    /* 0002C0 1E 51          */ PUSH.VAR 20766
    /* 0002C2 00 00          */ PUSH 0
    /* 0002C4 02 00          */ PUSH 2
    /* 0002C6 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 0002C8 1B C0          */ EXPR.ASSIGN
    /* 0002CA 00 C0          */ EXPR.END
    /* 0002CC 01             */ CALC
    /* 0002CD 20 51          */ PUSH.VAR 20768
    /* 0002CF 1C 51          */ PUSH.VAR 20764
    /* 0002D1 07 00          */ PUSH 7
    /* 0002D3 16 C0          */ EXPR.BIT_AND
    /* 0002D5 1B C0          */ EXPR.ASSIGN
    /* 0002D7 00 C0          */ EXPR.END
    /* 0002D9 01             */ CALC
    /* 0002DA 22 51          */ PUSH.VAR 20770
    /* 0002DC 1E 51          */ PUSH.VAR 20766
    /* 0002DE 07 00          */ PUSH 7
    /* 0002E0 16 C0          */ EXPR.BIT_AND
    /* 0002E2 1B C0          */ EXPR.ASSIGN
    /* 0002E4 00 C0          */ EXPR.END
    /* 0002E6 01             */ CALC
    /* 0002E7 20 51          */ PUSH.VAR 20768
    /* 0002E9 00 00          */ PUSH 0
    /* 0002EB 14 C0          */ EXPR.EQUALS
    /* 0002ED 22 51          */ PUSH.VAR 20770
    /* 0002EF 00 00          */ PUSH 0
    /* 0002F1 14 C0          */ EXPR.EQUALS
    /* 0002F3 19 C0          */ EXPR.LOG_AND
    /* 0002F5 00 C0          */ EXPR.END
    /* 0002F7 05 C3 02       */ JZ lab_2C3
    /* 0002FA 01             */ CALC
    /* 0002FB 1E 51          */ PUSH.VAR 20766
    /* 0002FD E0 10 01       */ PUSH 480
    /* 000300 11 C0          */ EXPR.LESS_THAN
    /* 000302 1E 51          */ PUSH.VAR 20766
    /* 000304 98 10 01       */ PUSH 408
    /* 000307 10 C0          */ EXPR.GREATER_THAN
    /* 000309 19 C0          */ EXPR.LOG_AND
    /* 00030B 00 C0          */ EXPR.END
    /* 00030D 05 D0 01       */ JZ lab_1D0
    /* 000310 01             */ CALC
    /* 000311 20 51          */ PUSH.VAR 20768
    /* 000313 11 00          */ PUSH 17
    /* 000315 01 00          */ PUSH 1
    /* 000317 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 000319 1B C0          */ EXPR.ASSIGN
    /* 00031B 00 C0          */ EXPR.END
    /* 00031D 01             */ CALC
    /* 00031E 20 51          */ PUSH.VAR 20768
    /* 000320 1C 51          */ PUSH.VAR 20764
    /* 000322 20 51          */ PUSH.VAR 20768
    /* 000324 0D C0          */ EXPR.SUB
    /* 000326 1B C0          */ EXPR.ASSIGN
    /* 000328 00 C0          */ EXPR.END
    /* 00032A 01             */ CALC
    /* 00032B 20 51          */ PUSH.VAR 20768
    ; NOTE: first guard - view distance
    /* 00032D 80 10 00       */ PUSH 128
    /* 000330 11 C0          */ EXPR.LESS_THAN
    /* 000332 00 C0          */ EXPR.END
    /* 000334 05 CD 01       */ JZ lab_1CD
    /* 000337 01             */ CALC
    /* 000338 7F 80          */ SYSCALL 0x4F ; sce_start_demo / sce_start_demo (0 arg(s))
    /* 00033A 00 C0          */ EXPR.END
    /* 00033C 01             */ CALC
    /* 00033D 1A 10 FC       */ PUSH 64538
    /* 000340 0D 00          */ PUSH 13
    /* 000342 00 00          */ PUSH 0
    /* 000344 00 00          */ PUSH 0
    /* 000346 00 00          */ PUSH 0
    /* 000348 0D 00          */ PUSH 13
    /* 00034A 00 00          */ PUSH 0
    /* 00034C 00 00          */ PUSH 0
    /* 00034E 11 00          */ PUSH 17
    /* 000350 01 00          */ PUSH 1
    /* 000352 00 00          */ PUSH 0
    /* 000354 00 00          */ PUSH 0
    /* 000356 00 00          */ PUSH 0
    /* 000358 00 00          */ PUSH 0
    /* 00035A 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 00035C 00 C0          */ EXPR.END
    /* 00035E 01             */ CALC
    /* 00035F 11 00          */ PUSH 17
    /* 000361 41 80          */ SYSCALL 0x11 ; sce_set_direction_east / sce_dummy_proc (1 arg(s))
    /* 000363 00 C0          */ EXPR.END
    /* 000365 01             */ CALC
    /* 000366 11 00          */ PUSH 17
    /* 000368 FF 00          */ PUSH 255
    /* 00036A FF 00          */ PUSH 255
    /* 00036C 08 00          */ PUSH 8
    /* 00036E 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 000370 00 C0          */ EXPR.END
    /* 000372 02 7D 1F       */ CALL func_1F7D
    /* 000375 01             */ CALC
    /* 000376 00 00          */ PUSH 0
    /* 000378 43 80          */ SYSCALL 0x13 ; sce_set_direction_west / sce_dummy_proc (1 arg(s))
    /* 00037A 00 C0          */ EXPR.END
    /* 00037C 01             */ CALC
    /* 00037D 00 00          */ PUSH 0
    /* 00037F E0 10 00       */ PUSH 224
    /* 000382 20 10 02       */ PUSH 544
    /* 000385 30 00          */ PUSH 48
    /* 000387 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 000389 00 C0          */ EXPR.END
    /* 00038B 01             */ CALC
    /* 00038C 10 00          */ PUSH 16
    /* 00038E 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 000390 00 C0          */ EXPR.END
    /* 000392 01             */ CALC
    /* 000393 01 00          */ PUSH 1
    /* 000395 00 00          */ PUSH 0
    /* 000397 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 000399 00 C0          */ EXPR.END
    /* 00039B 01             */ CALC
    /* 00039C 4F 00          */ PUSH 79
    /* 00039E 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 0003A0 00 C0          */ EXPR.END
    /* 0003A2 01             */ CALC
    /* 0003A3 10 00          */ PUSH 16
    /* 0003A5 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0003A7 00 C0          */ EXPR.END
    /* 0003A9 01             */ CALC
    /* 0003AA 80 80          */ SYSCALL 0x50 ; sce_finish_demo / sce_finish_demo (0 arg(s))
    /* 0003AC 00 C0          */ EXPR.END
    /* 0003AE 01             */ CALC
    /* 0003AF 6F 00          */ PUSH 111
    /* 0003B1 02 00          */ PUSH 2
    /* 0003B3 78 00          */ PUSH 120
    /* 0003B5 80 10 00       */ PUSH 128
    /* 0003B8 02 00          */ PUSH 2
    /* 0003BA 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 0003BC 00 C0          */ EXPR.END
    /* 0003BE 04 CD 01       */ JMP lab_1CD
  lab_1CD:
    /* 0003C1 04 D0 01       */ JMP lab_1D0
  lab_1D0:
    /* 0003C4 01             */ CALC
    /* 0003C5 1C 51          */ PUSH.VAR 20764
    /* 0003C7 B0 10 01       */ PUSH 432
    /* 0003CA 10 C0          */ EXPR.GREATER_THAN
    /* 0003CC 1C 51          */ PUSH.VAR 20764
    /* 0003CE 10 10 02       */ PUSH 528
    /* 0003D1 11 C0          */ EXPR.LESS_THAN
    /* 0003D3 19 C0          */ EXPR.LOG_AND
    /* 0003D5 00 C0          */ EXPR.END
    /* 0003D7 05 C0 02       */ JZ lab_2C0
    /* 0003DA 01             */ CALC
    /* 0003DB 22 51          */ PUSH.VAR 20770
    /* 0003DD 12 00          */ PUSH 18
    /* 0003DF 02 00          */ PUSH 2
    /* 0003E1 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 0003E3 1B C0          */ EXPR.ASSIGN
    /* 0003E5 00 C0          */ EXPR.END
    /* 0003E7 01             */ CALC
    /* 0003E8 22 51          */ PUSH.VAR 20770
    /* 0003EA 1E 51          */ PUSH.VAR 20766
    /* 0003EC 22 51          */ PUSH.VAR 20770
    /* 0003EE 0D C0          */ EXPR.SUB
    /* 0003F0 1B C0          */ EXPR.ASSIGN
    /* 0003F2 00 C0          */ EXPR.END
    /* 0003F4 01             */ CALC
    /* 0003F5 22 51          */ PUSH.VAR 20770
    ; NOTE: second guard - view distance
    /* 0003F7 90 10 00       */ PUSH 144
    /* 0003FA 11 C0          */ EXPR.LESS_THAN
    /* 0003FC 00 C0          */ EXPR.END
    /* 0003FE 05 BD 02       */ JZ lab_2BD
    /* 000401 01             */ CALC
    /* 000402 7F 80          */ SYSCALL 0x4F ; sce_start_demo / sce_start_demo (0 arg(s))
    /* 000404 00 C0          */ EXPR.END
    /* 000406 01             */ CALC
    /* 000407 1A 10 FC       */ PUSH 64538
    /* 00040A 0D 00          */ PUSH 13
    /* 00040C 00 00          */ PUSH 0
    /* 00040E 00 00          */ PUSH 0
    /* 000410 00 00          */ PUSH 0
    /* 000412 0D 00          */ PUSH 13
    /* 000414 00 00          */ PUSH 0
    /* 000416 00 00          */ PUSH 0
    /* 000418 12 00          */ PUSH 18
    /* 00041A 01 00          */ PUSH 1
    /* 00041C 00 00          */ PUSH 0
    /* 00041E 00 00          */ PUSH 0
    /* 000420 00 00          */ PUSH 0
    /* 000422 00 00          */ PUSH 0
    /* 000424 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000426 00 C0          */ EXPR.END
    /* 000428 01             */ CALC
    /* 000429 12 00          */ PUSH 18
    /* 00042B 42 80          */ SYSCALL 0x12 ; sce_set_direction_south / sce_dummy_proc (1 arg(s))
    /* 00042D 00 C0          */ EXPR.END
    /* 00042F 01             */ CALC
    /* 000430 12 00          */ PUSH 18
    /* 000432 FF 00          */ PUSH 255
    /* 000434 FF 00          */ PUSH 255
    /* 000436 08 00          */ PUSH 8
    /* 000438 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 00043A 00 C0          */ EXPR.END
    /* 00043C 02 7D 1F       */ CALL func_1F7D
    /* 00043F 01             */ CALC
    /* 000440 1C 51          */ PUSH.VAR 20764
    /* 000442 D8 10 01       */ PUSH 472
    /* 000445 11 C0          */ EXPR.LESS_THAN
    /* 000447 00 C0          */ EXPR.END
    /* 000449 05 71 02       */ JZ lab_271
    /* 00044C 01             */ CALC
    /* 00044D 00 00          */ PUSH 0
    /* 00044F 42 80          */ SYSCALL 0x12 ; sce_set_direction_south / sce_dummy_proc (1 arg(s))
    /* 000451 00 C0          */ EXPR.END
    /* 000453 01             */ CALC
    /* 000454 00 00          */ PUSH 0
    /* 000456 40 10 01       */ PUSH 320
    /* 000459 F0 10 01       */ PUSH 496
    /* 00045C 30 00          */ PUSH 48
    /* 00045E 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 000460 00 C0          */ EXPR.END
    /* 000462 04 87 02       */ JMP lab_287
  lab_271:
    /* 000465 01             */ CALC
    /* 000466 00 00          */ PUSH 0
    /* 000468 43 80          */ SYSCALL 0x13 ; sce_set_direction_west / sce_dummy_proc (1 arg(s))
    /* 00046A 00 C0          */ EXPR.END
    /* 00046C 01             */ CALC
    /* 00046D 00 00          */ PUSH 0
    /* 00046F C0 10 01       */ PUSH 448
    /* 000472 00 10 02       */ PUSH 512
    /* 000475 30 00          */ PUSH 48
    /* 000477 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 000479 00 C0          */ EXPR.END
  lab_287:
    /* 00047B 01             */ CALC
    /* 00047C 10 00          */ PUSH 16
    /* 00047E 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 000480 00 C0          */ EXPR.END
    /* 000482 01             */ CALC
    /* 000483 01 00          */ PUSH 1
    /* 000485 00 00          */ PUSH 0
    /* 000487 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 000489 00 C0          */ EXPR.END
    /* 00048B 01             */ CALC
    /* 00048C 4F 00          */ PUSH 79
    /* 00048E 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 000490 00 C0          */ EXPR.END
    /* 000492 01             */ CALC
    /* 000493 10 00          */ PUSH 16
    /* 000495 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 000497 00 C0          */ EXPR.END
    /* 000499 01             */ CALC
    /* 00049A 80 80          */ SYSCALL 0x50 ; sce_finish_demo / sce_finish_demo (0 arg(s))
    /* 00049C 00 C0          */ EXPR.END
    /* 00049E 01             */ CALC
    /* 00049F 6F 00          */ PUSH 111
    /* 0004A1 02 00          */ PUSH 2
    /* 0004A3 78 00          */ PUSH 120
    /* 0004A5 80 10 00       */ PUSH 128
    /* 0004A8 02 00          */ PUSH 2
    /* 0004AA 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 0004AC 00 C0          */ EXPR.END
    /* 0004AE 04 BD 02       */ JMP lab_2BD
  lab_2BD:
    /* 0004B1 04 C0 02       */ JMP lab_2C0
  lab_2C0:
    /* 0004B4 04 C3 02       */ JMP lab_2C3
  lab_2C3:
    /* 0004B7 04 C6 02       */ JMP lab_2C6
  lab_2C6:
    /* 0004BA 01             */ CALC
    /* 0004BB 01 00          */ PUSH 1
    /* 0004BD 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0004BF 00 C0          */ EXPR.END
    /* 0004C1 04 03 00       */ JMP lab_3
    /* 0004C4 00             */ EXIT

func_2D1:
    /* 0004C5 01             */ CALC
    /* 0004C6 0A 51          */ PUSH.VAR 20746
    /* 0004C8 00 00          */ PUSH 0
    /* 0004CA 1B C0          */ EXPR.ASSIGN
    /* 0004CC 00 C0          */ EXPR.END
    /* 0004CE 01             */ CALC
    /* 0004CF 48 60          */ PUSH.VAR 24648
    /* 0004D1 00 C0          */ EXPR.END
    /* 0004D3 04 E5 02       */ JMP lab_2E5
    /* 0004D6 04 F1 02       */ JMP lab_2F1
  lab_2E5:
    /* 0004D9 07             */ CALC.EXT
    /* 0004DA FF FF          */ EXPR.POP
    /* 0004DC 6C 00          */ PUSH 108
    /* 0004DE 14 C0          */ EXPR.EQUALS
    /* 0004E0 00 C0          */ EXPR.END
    /* 0004E2 05 A9 03       */ JZ lab_3A9
  lab_2F1:
    /* 0004E5 01             */ CALC
    /* 0004E6 F0 10 00       */ PUSH 240
    /* 0004E9 30 10 02       */ PUSH 560
    /* 0004EC 00 10 01       */ PUSH 256
    /* 0004EF 30 10 02       */ PUSH 560
    /* 0004F2 00 10 08       */ PUSH 2048
    /* 0004F5 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 0004F7 00 C0          */ EXPR.END
    /* 0004F9 01             */ CALC
    /* 0004FA 20 10 02       */ PUSH 544
    /* 0004FD A0 10 01       */ PUSH 416
    /* 000500 30 10 02       */ PUSH 560
    /* 000503 A0 10 01       */ PUSH 416
    /* 000506 01 10 08       */ PUSH 2049
    /* 000509 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 00050B 00 C0          */ EXPR.END
    /* 00050D 01             */ CALC
    /* 00050E F0 10 00       */ PUSH 240
    /* 000511 10 10 01       */ PUSH 272
    /* 000514 00 10 01       */ PUSH 256
    /* 000517 10 10 01       */ PUSH 272
    /* 00051A 02 10 08       */ PUSH 2050
    /* 00051D 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 00051F 00 C0          */ EXPR.END
    /* 000521 01             */ CALC
    /* 000522 13 00          */ PUSH 19
    /* 000524 E0 10 00       */ PUSH 224
    /* 000527 50 10 01       */ PUSH 336
    /* 00052A 02 00          */ PUSH 2
    /* 00052C 71 10 01       */ PUSH 369
    /* 00052F 00 00          */ PUSH 0
    /* 000531 00 00          */ PUSH 0
    /* 000533 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000535 00 C0          */ EXPR.END
    /* 000537 01             */ CALC
    /* 000538 14 00          */ PUSH 20
    /* 00053A 10 10 01       */ PUSH 272
    /* 00053D 50 10 01       */ PUSH 336
    /* 000540 02 00          */ PUSH 2
    /* 000542 71 10 01       */ PUSH 369
    /* 000545 00 00          */ PUSH 0
    /* 000547 00 00          */ PUSH 0
    /* 000549 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00054B 00 C0          */ EXPR.END
    /* 00054D 01             */ CALC
    /* 00054E 2C 00          */ PUSH 44
    /* 000550 D0 10 00       */ PUSH 208
    /* 000553 90 10 00       */ PUSH 144
    /* 000556 03 00          */ PUSH 3
    /* 000558 99 10 00       */ PUSH 153
    /* 00055B 00 00          */ PUSH 0
    /* 00055D 00 00          */ PUSH 0
    /* 00055F 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000561 00 C0          */ EXPR.END
    /* 000563 01             */ CALC
    /* 000564 2D 00          */ PUSH 45
    /* 000566 10 10 01       */ PUSH 272
    /* 000569 90 10 00       */ PUSH 144
    /* 00056C 01 00          */ PUSH 1
    /* 00056E 9D 10 00       */ PUSH 157
    /* 000571 00 00          */ PUSH 0
    /* 000573 00 00          */ PUSH 0
    /* 000575 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000577 00 C0          */ EXPR.END
    /* 000579 01             */ CALC
    /* 00057A 39 00          */ PUSH 57
    /* 00057C 50 00          */ PUSH 80
    /* 00057E E0 10 01       */ PUSH 480
    /* 000581 02 00          */ PUSH 2
    /* 000583 71 10 01       */ PUSH 369
    /* 000586 00 00          */ PUSH 0
    /* 000588 00 00          */ PUSH 0
    /* 00058A 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00058C 00 C0          */ EXPR.END
    /* 00058E 01             */ CALC
    /* 00058F 00 00          */ PUSH 0
    /* 000591 00 00          */ PUSH 0
    /* 000593 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 000595 00 C0          */ EXPR.END
    /* 000597 04 03 05       */ JMP lab_503
    /* 00059A 04 B5 03       */ JMP lab_3B5
  lab_3A9:
    /* 00059D 07             */ CALC.EXT
    /* 00059E FF FF          */ EXPR.POP
    /* 0005A0 6D 00          */ PUSH 109
    /* 0005A2 14 C0          */ EXPR.EQUALS
    /* 0005A4 00 C0          */ EXPR.END
    /* 0005A6 05 2E 04       */ JZ lab_42E
  lab_3B5:
    /* 0005A9 01             */ CALC
    /* 0005AA F0 10 00       */ PUSH 240
    /* 0005AD E0 10 00       */ PUSH 224
    /* 0005B0 00 10 01       */ PUSH 256
    /* 0005B3 E0 10 00       */ PUSH 224
    /* 0005B6 03 10 08       */ PUSH 2051
    /* 0005B9 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 0005BB 00 C0          */ EXPR.END
    /* 0005BD 01             */ CALC
    /* 0005BE 80 10 01       */ PUSH 384
    /* 0005C1 40 10 01       */ PUSH 320
    /* 0005C4 90 10 01       */ PUSH 400
    /* 0005C7 40 10 01       */ PUSH 320
    /* 0005CA 04 10 08       */ PUSH 2052
    /* 0005CD 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 0005CF 00 C0          */ EXPR.END
    /* 0005D1 01             */ CALC
    /* 0005D2 13 00          */ PUSH 19
    /* 0005D4 70 10 01       */ PUSH 368
    /* 0005D7 80 10 01       */ PUSH 384
    /* 0005DA 02 00          */ PUSH 2
    /* 0005DC 71 10 01       */ PUSH 369
    /* 0005DF 00 00          */ PUSH 0
    /* 0005E1 00 00          */ PUSH 0
    /* 0005E3 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0005E5 00 C0          */ EXPR.END
    /* 0005E7 01             */ CALC
    /* 0005E8 14 00          */ PUSH 20
    /* 0005EA A0 10 01       */ PUSH 416
    /* 0005ED 80 10 01       */ PUSH 384
    /* 0005F0 02 00          */ PUSH 2
    /* 0005F2 71 10 01       */ PUSH 369
    /* 0005F5 00 00          */ PUSH 0
    /* 0005F7 00 00          */ PUSH 0
    /* 0005F9 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0005FB 00 C0          */ EXPR.END
    /* 0005FD 01             */ CALC
    /* 0005FE 3D 00          */ PUSH 61
    /* 000600 D0 10 00       */ PUSH 208
    /* 000603 30 10 01       */ PUSH 304
    /* 000606 01 00          */ PUSH 1
    /* 000608 AE 10 00       */ PUSH 174
    /* 00060B 01 00          */ PUSH 1
    /* 00060D 06 00          */ PUSH 6
    /* 00060F 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000611 00 C0          */ EXPR.END
    /* 000613 01             */ CALC
    /* 000614 00 00          */ PUSH 0
    /* 000616 00 00          */ PUSH 0
    /* 000618 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 00061A 00 C0          */ EXPR.END
    /* 00061C 04 03 05       */ JMP lab_503
    /* 00061F 04 3A 04       */ JMP lab_43A
  lab_42E:
    /* 000622 07             */ CALC.EXT
    /* 000623 FF FF          */ EXPR.POP
    /* 000625 6E 00          */ PUSH 110
    /* 000627 14 C0          */ EXPR.EQUALS
    /* 000629 00 C0          */ EXPR.END
    /* 00062B 05 A2 04       */ JZ lab_4A2
  lab_43A:
    /* 00062E 01             */ CALC
    /* 00062F 80 10 01       */ PUSH 384
    /* 000632 80 10 01       */ PUSH 384
    /* 000635 90 10 01       */ PUSH 400
    /* 000638 80 10 01       */ PUSH 384
    /* 00063B 05 10 08       */ PUSH 2053
    /* 00063E 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 000640 00 C0          */ EXPR.END
    /* 000642 01             */ CALC
    /* 000643 40 00          */ PUSH 64
    /* 000645 E0 10 01       */ PUSH 480
    /* 000648 50 00          */ PUSH 80
    /* 00064A E0 10 01       */ PUSH 480
    /* 00064D 06 10 08       */ PUSH 2054
    /* 000650 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 000652 00 C0          */ EXPR.END
    /* 000654 01             */ CALC
    /* 000655 20 10 02       */ PUSH 544
    /* 000658 90 10 01       */ PUSH 400
    /* 00065B 30 10 02       */ PUSH 560
    /* 00065E 90 10 01       */ PUSH 400
    /* 000661 0A 10 08       */ PUSH 2058
    /* 000664 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 000666 00 C0          */ EXPR.END
    /* 000668 01             */ CALC
    /* 000669 20 10 02       */ PUSH 544
    /* 00066C 30 10 02       */ PUSH 560
    /* 00066F 30 10 02       */ PUSH 560
    /* 000672 30 10 02       */ PUSH 560
    /* 000675 07 10 08       */ PUSH 2055
    /* 000678 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 00067A 00 C0          */ EXPR.END
    /* 00067C 01             */ CALC
    /* 00067D D0 10 00       */ PUSH 208
    /* 000680 30 10 02       */ PUSH 560
    /* 000683 E0 10 00       */ PUSH 224
    /* 000686 30 10 02       */ PUSH 560
    /* 000689 0B 10 08       */ PUSH 2059
    /* 00068C 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 00068E 00 C0          */ EXPR.END
    /* 000690 04 03 05       */ JMP lab_503
    /* 000693 04 AE 04       */ JMP lab_4AE
  lab_4A2:
    /* 000696 07             */ CALC.EXT
    /* 000697 FF FF          */ EXPR.POP
    /* 000699 70 00          */ PUSH 112
    /* 00069B 14 C0          */ EXPR.EQUALS
    /* 00069D 00 C0          */ EXPR.END
    /* 00069F 05 E3 04       */ JZ lab_4E3
  lab_4AE:
    /* 0006A2 01             */ CALC
    /* 0006A3 B0 10 00       */ PUSH 176
    /* 0006A6 40 00          */ PUSH 64
    /* 0006A8 C0 10 00       */ PUSH 192
    /* 0006AB 40 00          */ PUSH 64
    /* 0006AD 08 10 08       */ PUSH 2056
    /* 0006B0 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 0006B2 00 C0          */ EXPR.END
    /* 0006B4 01             */ CALC
    /* 0006B5 1C 00          */ PUSH 28
    /* 0006B7 50 00          */ PUSH 80
    /* 0006B9 70 00          */ PUSH 112
    /* 0006BB 02 00          */ PUSH 2
    /* 0006BD C2 10 00       */ PUSH 194
    /* 0006C0 01 00          */ PUSH 1
    /* 0006C2 06 00          */ PUSH 6
    /* 0006C4 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0006C6 00 C0          */ EXPR.END
    /* 0006C8 01             */ CALC
    /* 0006C9 00 00          */ PUSH 0
    /* 0006CB 00 00          */ PUSH 0
    /* 0006CD 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 0006CF 00 C0          */ EXPR.END
    /* 0006D1 04 03 05       */ JMP lab_503
    /* 0006D4 04 EF 04       */ JMP lab_4EF
  lab_4E3:
    /* 0006D7 07             */ CALC.EXT
    /* 0006D8 FF FF          */ EXPR.POP
    /* 0006DA 6F 00          */ PUSH 111
    /* 0006DC 14 C0          */ EXPR.EQUALS
    /* 0006DE 00 C0          */ EXPR.END
    /* 0006E0 05 03 05       */ JZ lab_503
  lab_4EF:
    /* 0006E3 01             */ CALC
    /* 0006E4 70 00          */ PUSH 112
    /* 0006E6 50 00          */ PUSH 80
    /* 0006E8 80 10 00       */ PUSH 128
    /* 0006EB 50 00          */ PUSH 80
    /* 0006ED 09 10 08       */ PUSH 2057
    /* 0006F0 4A 80          */ SYSCALL 0x1A ; sce_set_trap_area / sce_dummy_proc (5 arg(s))
    /* 0006F2 00 C0          */ EXPR.END
    /* 0006F4 04 03 05       */ JMP lab_503
  lab_503:
    /* 0006F7 01             */ CALC
    /* 0006F8 4C 60          */ PUSH.VAR 24652
    /* 0006FA 03 00          */ PUSH 3
    /* 0006FC 14 C0          */ EXPR.EQUALS
    /* 0006FE 00 C0          */ EXPR.END
    /* 000700 05 B6 07       */ JZ lab_7B6
    /* 000703 01             */ CALC
    /* 000704 48 60          */ PUSH.VAR 24648
    /* 000706 00 C0          */ EXPR.END
    /* 000708 04 1A 05       */ JMP lab_51A
    /* 00070B 04 26 05       */ JMP lab_526
  lab_51A:
    /* 00070E 07             */ CALC.EXT
    /* 00070F FF FF          */ EXPR.POP
    /* 000711 6C 00          */ PUSH 108
    /* 000713 14 C0          */ EXPR.EQUALS
    /* 000715 00 C0          */ EXPR.END
    /* 000717 05 10 06       */ JZ lab_610
  lab_526:
    /* 00071A 01             */ CALC
    /* 00071B 8E 10 00       */ PUSH 142
    /* 00071E 90 10 00       */ PUSH 144
    /* 000721 F0 10 01       */ PUSH 496
    /* 000724 02 00          */ PUSH 2
    /* 000726 E5 10 00       */ PUSH 229
    /* 000729 01 00          */ PUSH 1
    /* 00072B 06 00          */ PUSH 6
    /* 00072D 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00072F 00 C0          */ EXPR.END
    /* 000731 01             */ CALC
    /* 000732 2C 00          */ PUSH 44
    /* 000734 06 00          */ PUSH 6
    /* 000736 9F 10 00       */ PUSH 159
    /* 000739 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 00073B 00 C0          */ EXPR.END
    /* 00073D 01             */ CALC
    /* 00073E 2D 00          */ PUSH 45
    /* 000740 06 00          */ PUSH 6
    /* 000742 A3 10 00       */ PUSH 163
    /* 000745 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 000747 00 C0          */ EXPR.END
    /* 000749 01             */ CALC
    /* 00074A 32 00          */ PUSH 50
    /* 00074C 60 10 01       */ PUSH 352
    /* 00074F 60 10 01       */ PUSH 352
    /* 000752 02 00          */ PUSH 2
    /* 000754 71 10 01       */ PUSH 369
    /* 000757 01 00          */ PUSH 1
    /* 000759 06 00          */ PUSH 6
    /* 00075B 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00075D 00 C0          */ EXPR.END
    /* 00075F 01             */ CALC
    /* 000760 33 00          */ PUSH 51
    /* 000762 B0 10 01       */ PUSH 432
    /* 000765 A0 10 01       */ PUSH 416
    /* 000768 00 00          */ PUSH 0
    /* 00076A AD 10 00       */ PUSH 173
    /* 00076D 01 00          */ PUSH 1
    /* 00076F 06 00          */ PUSH 6
    /* 000771 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000773 00 C0          */ EXPR.END
    /* 000775 01             */ CALC
    /* 000776 34 00          */ PUSH 52
    /* 000778 C0 10 00       */ PUSH 192
    /* 00077B 60 00          */ PUSH 96
    /* 00077D 00 00          */ PUSH 0
    /* 00077F A1 10 00       */ PUSH 161
    /* 000782 01 00          */ PUSH 1
    /* 000784 06 00          */ PUSH 6
    /* 000786 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000788 00 C0          */ EXPR.END
    /* 00078A 01             */ CALC
    /* 00078B 35 00          */ PUSH 53
    /* 00078D 00 10 01       */ PUSH 256
    /* 000790 B0 10 00       */ PUSH 176
    /* 000793 03 00          */ PUSH 3
    /* 000795 C2 10 00       */ PUSH 194
    /* 000798 01 00          */ PUSH 1
    /* 00079A 06 00          */ PUSH 6
    /* 00079C 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00079E 00 C0          */ EXPR.END
    /* 0007A0 01             */ CALC
    /* 0007A1 36 00          */ PUSH 54
    /* 0007A3 F8 10 01       */ PUSH 504
    /* 0007A6 E0 10 00       */ PUSH 224
    /* 0007A9 00 00          */ PUSH 0
    /* 0007AB C2 10 00       */ PUSH 194
    /* 0007AE 00 00          */ PUSH 0
    /* 0007B0 00 00          */ PUSH 0
    /* 0007B2 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0007B4 00 C0          */ EXPR.END
    /* 0007B6 01             */ CALC
    /* 0007B7 30 00          */ PUSH 48
    /* 0007B9 E0 10 01       */ PUSH 480
    /* 0007BC 40 00          */ PUSH 64
    /* 0007BE E0 10 01       */ PUSH 480
    /* 0007C1 05 00          */ PUSH 5
    /* 0007C3 46 80          */ SYSCALL 0x16 ; sce_set_event_area / sce_dummy_proc (5 arg(s))
    /* 0007C5 00 C0          */ EXPR.END
    /* 0007C7 01             */ CALC
    /* 0007C8 90 10 00       */ PUSH 144
    /* 0007CB E0 10 01       */ PUSH 480
    /* 0007CE A0 10 00       */ PUSH 160
    /* 0007D1 E0 10 01       */ PUSH 480
    /* 0007D4 06 00          */ PUSH 6
    /* 0007D6 46 80          */ SYSCALL 0x16 ; sce_set_event_area / sce_dummy_proc (5 arg(s))
    /* 0007D8 00 C0          */ EXPR.END
    /* 0007DA 01             */ CALC
    /* 0007DB 30 00          */ PUSH 48
    /* 0007DD 20 10 02       */ PUSH 544
    /* 0007E0 40 00          */ PUSH 64
    /* 0007E2 20 10 02       */ PUSH 544
    /* 0007E5 07 00          */ PUSH 7
    /* 0007E7 46 80          */ SYSCALL 0x16 ; sce_set_event_area / sce_dummy_proc (5 arg(s))
    /* 0007E9 00 C0          */ EXPR.END
    /* 0007EB 01             */ CALC
    /* 0007EC 90 10 00       */ PUSH 144
    /* 0007EF 20 10 02       */ PUSH 544
    /* 0007F2 A0 10 00       */ PUSH 160
    /* 0007F5 20 10 02       */ PUSH 544
    /* 0007F8 08 00          */ PUSH 8
    /* 0007FA 46 80          */ SYSCALL 0x16 ; sce_set_event_area / sce_dummy_proc (5 arg(s))
    /* 0007FC 00 C0          */ EXPR.END
    /* 0007FE 04 B3 07       */ JMP lab_7B3
    /* 000801 04 1C 06       */ JMP lab_61C
  lab_610:
    /* 000804 07             */ CALC.EXT
    /* 000805 FF FF          */ EXPR.POP
    /* 000807 6D 00          */ PUSH 109
    /* 000809 14 C0          */ EXPR.EQUALS
    /* 00080B 00 C0          */ EXPR.END
    /* 00080D 05 0D 07       */ JZ lab_70D
  lab_61C:
    /* 000810 01             */ CALC
    /* 000811 37 00          */ PUSH 55
    /* 000813 10 10 02       */ PUSH 528
    /* 000816 F0 10 00       */ PUSH 240
    /* 000819 02 00          */ PUSH 2
    /* 00081B C2 10 00       */ PUSH 194
    /* 00081E 00 00          */ PUSH 0
    /* 000820 00 00          */ PUSH 0
    /* 000822 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000824 00 C0          */ EXPR.END
    /* 000826 01             */ CALC
    /* 000827 38 00          */ PUSH 56
    /* 000829 10 10 02       */ PUSH 528
    /* 00082C 10 10 01       */ PUSH 272
    /* 00082F 00 00          */ PUSH 0
    /* 000831 C2 10 00       */ PUSH 194
    /* 000834 00 00          */ PUSH 0
    /* 000836 00 00          */ PUSH 0
    /* 000838 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00083A 00 C0          */ EXPR.END
    /* 00083C 01             */ CALC
    /* 00083D 3A 00          */ PUSH 58
    /* 00083F 00 10 02       */ PUSH 512
    /* 000842 00 10 01       */ PUSH 256
    /* 000845 01 00          */ PUSH 1
    /* 000847 C2 10 00       */ PUSH 194
    /* 00084A 00 00          */ PUSH 0
    /* 00084C 00 00          */ PUSH 0
    /* 00084E 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000850 00 C0          */ EXPR.END
    /* 000852 01             */ CALC
    /* 000853 3B 00          */ PUSH 59
    /* 000855 20 10 02       */ PUSH 544
    /* 000858 00 10 01       */ PUSH 256
    /* 00085B 03 00          */ PUSH 3
    /* 00085D C2 10 00       */ PUSH 194
    /* 000860 00 00          */ PUSH 0
    /* 000862 00 00          */ PUSH 0
    /* 000864 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000866 00 C0          */ EXPR.END
    /* 000868 01             */ CALC
    /* 000869 3C 00          */ PUSH 60
    /* 00086B 60 00          */ PUSH 96
    /* 00086D E0 10 01       */ PUSH 480
    /* 000870 02 00          */ PUSH 2
    /* 000872 AD 10 00       */ PUSH 173
    /* 000875 00 00          */ PUSH 0
    /* 000877 00 00          */ PUSH 0
    /* 000879 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00087B 00 C0          */ EXPR.END
    /* 00087D 01             */ CALC
    /* 00087E 3E 00          */ PUSH 62
    /* 000880 80 10 00       */ PUSH 128
    /* 000883 00 10 02       */ PUSH 512
    /* 000886 03 00          */ PUSH 3
    /* 000888 71 10 01       */ PUSH 369
    /* 00088B 00 00          */ PUSH 0
    /* 00088D 00 00          */ PUSH 0
    /* 00088F 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000891 00 C0          */ EXPR.END
    /* 000893 01             */ CALC
    /* 000894 43 00          */ PUSH 67
    /* 000896 40 00          */ PUSH 64
    /* 000898 00 10 02       */ PUSH 512
    /* 00089B 01 00          */ PUSH 1
    /* 00089D C2 10 00       */ PUSH 194
    /* 0008A0 00 00          */ PUSH 0
    /* 0008A2 00 00          */ PUSH 0
    /* 0008A4 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0008A6 00 C0          */ EXPR.END
    /* 0008A8 01             */ CALC
    /* 0008A9 44 00          */ PUSH 68
    /* 0008AB F8 10 00       */ PUSH 248
    /* 0008AE 50 10 01       */ PUSH 336
    /* 0008B1 02 00          */ PUSH 2
    /* 0008B3 CB 10 00       */ PUSH 203
    /* 0008B6 00 00          */ PUSH 0
    /* 0008B8 00 00          */ PUSH 0
    /* 0008BA 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0008BC 00 C0          */ EXPR.END
    /* 0008BE 01             */ CALC
    /* 0008BF 45 00          */ PUSH 69
    /* 0008C1 50 10 01       */ PUSH 336
    /* 0008C4 E0 10 01       */ PUSH 480
    /* 0008C7 00 00          */ PUSH 0
    /* 0008C9 A0 10 00       */ PUSH 160
    /* 0008CC 00 00          */ PUSH 0
    /* 0008CE 00 00          */ PUSH 0
    /* 0008D0 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0008D2 00 C0          */ EXPR.END
    /* 0008D4 01             */ CALC
    /* 0008D5 30 10 01       */ PUSH 304
    /* 0008D8 D0 10 01       */ PUSH 464
    /* 0008DB 09 00          */ PUSH 9
    /* 0008DD 45 80          */ SYSCALL 0x15 ; sce_set_event / sce_dummy_proc (3 arg(s))
    /* 0008DF 00 C0          */ EXPR.END
    /* 0008E1 01             */ CALC
    /* 0008E2 50 10 01       */ PUSH 336
    /* 0008E5 D0 10 01       */ PUSH 464
    /* 0008E8 0A 00          */ PUSH 10
    /* 0008EA 45 80          */ SYSCALL 0x15 ; sce_set_event / sce_dummy_proc (3 arg(s))
    /* 0008EC 00 C0          */ EXPR.END
    /* 0008EE 01             */ CALC
    /* 0008EF 70 10 01       */ PUSH 368
    /* 0008F2 D0 10 01       */ PUSH 464
    /* 0008F5 09 00          */ PUSH 9
    /* 0008F7 45 80          */ SYSCALL 0x15 ; sce_set_event / sce_dummy_proc (3 arg(s))
    /* 0008F9 00 C0          */ EXPR.END
    /* 0008FB 04 B3 07       */ JMP lab_7B3
    /* 0008FE 04 19 07       */ JMP lab_719
  lab_70D:
    /* 000901 07             */ CALC.EXT
    /* 000902 FF FF          */ EXPR.POP
    /* 000904 6E 00          */ PUSH 110
    /* 000906 14 C0          */ EXPR.EQUALS
    /* 000908 00 C0          */ EXPR.END
    /* 00090A 05 75 07       */ JZ lab_775
  lab_719:
    /* 00090D 02 AC 0C       */ CALL func_CAC
    /* 000910 01             */ CALC
    /* 000911 00 00          */ PUSH 0
    /* 000913 00 00          */ PUSH 0
    /* 000915 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 000917 00 C0          */ EXPR.END
    /* 000919 01             */ CALC
    /* 00091A DF 10 00       */ PUSH 223
    /* 00091D 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 00091F 00 00          */ PUSH 0
    /* 000921 14 C0          */ EXPR.EQUALS
    /* 000923 00 C0          */ EXPR.END
    /* 000925 05 3A 07       */ JZ lab_73A
    /* 000928 02 3B 20       */ CALL func_203B
    /* 00092B 04 53 07       */ JMP lab_753
  lab_73A:
    /* 00092E 02 55 0B       */ CALL func_B55
    /* 000931 01             */ CALC
    /* 000932 7A 00          */ PUSH 122
    /* 000934 E0 10 00       */ PUSH 224
    /* 000937 80 10 00       */ PUSH 128
    /* 00093A 02 00          */ PUSH 2
    /* 00093C C9 10 00       */ PUSH 201
    /* 00093F 00 00          */ PUSH 0
    /* 000941 00 00          */ PUSH 0
    /* 000943 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000945 00 C0          */ EXPR.END
  lab_753:
    /* 000947 01             */ CALC
    /* 000948 E3 10 00       */ PUSH 227
    /* 00094B 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 00094D E4 10 00       */ PUSH 228
    /* 000950 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 000952 00 00          */ PUSH 0
    /* 000954 14 C0          */ EXPR.EQUALS
    /* 000956 19 C0          */ EXPR.LOG_AND
    /* 000958 00 C0          */ EXPR.END
    /* 00095A 05 6F 07       */ JZ lab_76F
    /* 00095D 02 8B 24       */ CALL func_248B
    /* 000960 04 6F 07       */ JMP lab_76F
  lab_76F:
    /* 000963 04 B3 07       */ JMP lab_7B3
    /* 000966 04 81 07       */ JMP lab_781
  lab_775:
    /* 000969 07             */ CALC.EXT
    /* 00096A FF FF          */ EXPR.POP
    /* 00096C 6F 00          */ PUSH 111
    /* 00096E 14 C0          */ EXPR.EQUALS
    /* 000970 00 C0          */ EXPR.END
    /* 000972 05 B3 07       */ JZ lab_7B3
  lab_781:
    /* 000975 01             */ CALC
    /* 000976 00 00          */ PUSH 0
    /* 000978 00 00          */ PUSH 0
    /* 00097A 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 00097C 00 C0          */ EXPR.END
    /* 00097E 01             */ CALC
    /* 00097F 56 10 FF       */ PUSH 65366
    /* 000982 08 00          */ PUSH 8
    /* 000984 80 10 00       */ PUSH 128
    /* 000987 A0 10 00       */ PUSH 160
    /* 00098A 02 00          */ PUSH 2
    /* 00098C 37 00          */ PUSH 55
    /* 00098E 01 00          */ PUSH 1
    /* 000990 06 00          */ PUSH 6
    /* 000992 00 00          */ PUSH 0
    /* 000994 00 00          */ PUSH 0
    /* 000996 F0 10 00       */ PUSH 240
    /* 000999 F0 10 00       */ PUSH 240
    /* 00099C 00 00          */ PUSH 0
    /* 00099E 00 00          */ PUSH 0
    /* 0009A0 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 0009A2 00 C0          */ EXPR.END
    /* 0009A4 04 B3 07       */ JMP lab_7B3
  lab_7B3:
    /* 0009A7 04 54 0B       */ JMP lab_B54
  lab_7B6:
    /* 0009AA 01             */ CALC
    /* 0009AB 48 60          */ PUSH.VAR 24648
    /* 0009AD 00 C0          */ EXPR.END
    /* 0009AF 04 C1 07       */ JMP lab_7C1
    /* 0009B2 04 CD 07       */ JMP lab_7CD
  lab_7C1:
    /* 0009B5 07             */ CALC.EXT
    /* 0009B6 FF FF          */ EXPR.POP
    /* 0009B8 6C 00          */ PUSH 108
    /* 0009BA 14 C0          */ EXPR.EQUALS
    /* 0009BC 00 C0          */ EXPR.END
    /* 0009BE 05 70 08       */ JZ lab_870
  lab_7CD:
    /* 0009C1 01             */ CALC
    /* 0009C2 21 00          */ PUSH 33
    /* 0009C4 B0 10 00       */ PUSH 176
    /* 0009C7 60 00          */ PUSH 96
    /* 0009C9 02 00          */ PUSH 2
    /* 0009CB 71 10 01       */ PUSH 369
    /* 0009CE 01 00          */ PUSH 1
    /* 0009D0 06 00          */ PUSH 6
    /* 0009D2 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0009D4 00 C0          */ EXPR.END
    /* 0009D6 01             */ CALC
    /* 0009D7 22 00          */ PUSH 34
    /* 0009D9 38 10 01       */ PUSH 312
    /* 0009DC 60 00          */ PUSH 96
    /* 0009DE 00 00          */ PUSH 0
    /* 0009E0 CA 10 00       */ PUSH 202
    /* 0009E3 00 00          */ PUSH 0
    /* 0009E5 00 00          */ PUSH 0
    /* 0009E7 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0009E9 00 C0          */ EXPR.END
    /* 0009EB 01             */ CALC
    /* 0009EC 24 00          */ PUSH 36
    /* 0009EE 70 10 01       */ PUSH 368
    /* 0009F1 50 10 01       */ PUSH 336
    /* 0009F4 03 00          */ PUSH 3
    /* 0009F6 C2 10 00       */ PUSH 194
    /* 0009F9 01 00          */ PUSH 1
    /* 0009FB 06 00          */ PUSH 6
    /* 0009FD 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0009FF 00 C0          */ EXPR.END
    /* 000A01 01             */ CALC
    /* 000A02 25 00          */ PUSH 37
    /* 000A04 40 00          */ PUSH 64
    /* 000A06 F0 10 01       */ PUSH 496
    /* 000A09 02 00          */ PUSH 2
    /* 000A0B 9F 10 00       */ PUSH 159
    /* 000A0E 01 00          */ PUSH 1
    /* 000A10 06 00          */ PUSH 6
    /* 000A12 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000A14 00 C0          */ EXPR.END
    /* 000A16 01             */ CALC
    /* 000A17 30 00          */ PUSH 48
    /* 000A19 E0 10 01       */ PUSH 480
    /* 000A1C 40 00          */ PUSH 64
    /* 000A1E E0 10 01       */ PUSH 480
    /* 000A21 01 00          */ PUSH 1
    /* 000A23 46 80          */ SYSCALL 0x16 ; sce_set_event_area / sce_dummy_proc (5 arg(s))
    /* 000A25 00 C0          */ EXPR.END
    /* 000A27 01             */ CALC
    /* 000A28 90 10 00       */ PUSH 144
    /* 000A2B E0 10 01       */ PUSH 480
    /* 000A2E A0 10 00       */ PUSH 160
    /* 000A31 E0 10 01       */ PUSH 480
    /* 000A34 02 00          */ PUSH 2
    /* 000A36 46 80          */ SYSCALL 0x16 ; sce_set_event_area / sce_dummy_proc (5 arg(s))
    /* 000A38 00 C0          */ EXPR.END
    /* 000A3A 01             */ CALC
    /* 000A3B 30 00          */ PUSH 48
    /* 000A3D 20 10 02       */ PUSH 544
    /* 000A40 40 00          */ PUSH 64
    /* 000A42 20 10 02       */ PUSH 544
    /* 000A45 03 00          */ PUSH 3
    /* 000A47 46 80          */ SYSCALL 0x16 ; sce_set_event_area / sce_dummy_proc (5 arg(s))
    /* 000A49 00 C0          */ EXPR.END
    /* 000A4B 01             */ CALC
    /* 000A4C 90 10 00       */ PUSH 144
    /* 000A4F 20 10 02       */ PUSH 544
    /* 000A52 A0 10 00       */ PUSH 160
    /* 000A55 20 10 02       */ PUSH 544
    /* 000A58 04 00          */ PUSH 4
    /* 000A5A 46 80          */ SYSCALL 0x16 ; sce_set_event_area / sce_dummy_proc (5 arg(s))
    /* 000A5C 00 C0          */ EXPR.END
    /* 000A5E 04 54 0B       */ JMP lab_B54
    /* 000A61 04 7C 08       */ JMP lab_87C
  lab_870:
    /* 000A64 07             */ CALC.EXT
    /* 000A65 FF FF          */ EXPR.POP
    /* 000A67 6D 00          */ PUSH 109
    /* 000A69 14 C0          */ EXPR.EQUALS
    /* 000A6B 00 C0          */ EXPR.END
    /* 000A6D 05 10 09       */ JZ lab_910
  lab_87C:
    /* 000A70 01             */ CALC
    /* 000A71 1D 00          */ PUSH 29
    /* 000A73 10 10 02       */ PUSH 528
    /* 000A76 F0 10 00       */ PUSH 240
    /* 000A79 00 00          */ PUSH 0
    /* 000A7B C2 10 00       */ PUSH 194
    /* 000A7E 00 00          */ PUSH 0
    /* 000A80 00 00          */ PUSH 0
    /* 000A82 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000A84 00 C0          */ EXPR.END
    /* 000A86 01             */ CALC
    /* 000A87 1E 00          */ PUSH 30
    /* 000A89 40 00          */ PUSH 64
    /* 000A8B 00 10 02       */ PUSH 512
    /* 000A8E 01 00          */ PUSH 1
    /* 000A90 A0 10 00       */ PUSH 160
    /* 000A93 00 00          */ PUSH 0
    /* 000A95 00 00          */ PUSH 0
    /* 000A97 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000A99 00 C0          */ EXPR.END
    /* 000A9B 01             */ CALC
    /* 000A9C 1F 00          */ PUSH 31
    /* 000A9E 60 00          */ PUSH 96
    /* 000AA0 E0 10 01       */ PUSH 480
    /* 000AA3 02 00          */ PUSH 2
    /* 000AA5 C2 10 00       */ PUSH 194
    /* 000AA8 00 00          */ PUSH 0
    /* 000AAA 00 00          */ PUSH 0
    /* 000AAC 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000AAE 00 C0          */ EXPR.END
    /* 000AB0 01             */ CALC
    /* 000AB1 20 00          */ PUSH 32
    /* 000AB3 80 10 00       */ PUSH 128
    /* 000AB6 00 10 02       */ PUSH 512
    /* 000AB9 03 00          */ PUSH 3
    /* 000ABB A3 10 00       */ PUSH 163
    /* 000ABE 00 00          */ PUSH 0
    /* 000AC0 00 00          */ PUSH 0
    /* 000AC2 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000AC4 00 C0          */ EXPR.END
    /* 000AC6 01             */ CALC
    /* 000AC7 28 00          */ PUSH 40
    /* 000AC9 40 10 01       */ PUSH 320
    /* 000ACC 90 10 01       */ PUSH 400
    /* 000ACF 01 00          */ PUSH 1
    /* 000AD1 71 10 01       */ PUSH 369
    /* 000AD4 01 00          */ PUSH 1
    /* 000AD6 08 00          */ PUSH 8
    /* 000AD8 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000ADA 00 C0          */ EXPR.END
    /* 000ADC 01             */ CALC
    /* 000ADD 29 00          */ PUSH 41
    /* 000ADF 50 10 01       */ PUSH 336
    /* 000AE2 E0 10 01       */ PUSH 480
    /* 000AE5 00 00          */ PUSH 0
    /* 000AE7 9F 10 00       */ PUSH 159
    /* 000AEA 00 00          */ PUSH 0
    /* 000AEC 00 00          */ PUSH 0
    /* 000AEE 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000AF0 00 C0          */ EXPR.END
    /* 000AF2 01             */ CALC
    /* 000AF3 45 00          */ PUSH 69
    /* 000AF5 06 00          */ PUSH 6
    /* 000AF7 A3 10 00       */ PUSH 163
    /* 000AFA 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 000AFC 00 C0          */ EXPR.END
    /* 000AFE 04 54 0B       */ JMP lab_B54
    /* 000B01 04 1C 09       */ JMP lab_91C
  lab_910:
    /* 000B04 07             */ CALC.EXT
    /* 000B05 FF FF          */ EXPR.POP
    /* 000B07 6E 00          */ PUSH 110
    /* 000B09 14 C0          */ EXPR.EQUALS
    /* 000B0B 00 C0          */ EXPR.END
    /* 000B0D 05 00 0A       */ JZ lab_A00
  lab_91C:
    /* 000B10 01             */ CALC
    /* 000B11 0A 00          */ PUSH 10
    /* 000B13 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 000B15 00 C0          */ EXPR.END
    /* 000B17 05 38 09       */ JZ lab_938
    /* 000B1A 02 55 0B       */ CALL func_B55
    /* 000B1D 02 AC 0C       */ CALL func_CAC
    /* 000B20 01             */ CALC
    /* 000B21 00 00          */ PUSH 0
    /* 000B23 00 00          */ PUSH 0
    /* 000B25 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 000B27 00 C0          */ EXPR.END
    /* 000B29 04 FA 09       */ JMP lab_9FA
  lab_938:
    /* 000B2C 01             */ CALC
    /* 000B2D 4A 00          */ PUSH 74
    /* 000B2F 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 000B31 00 C0          */ EXPR.END
    /* 000B33 05 4B 09       */ JZ lab_94B
    /* 000B36 02 AC 0C       */ CALL func_CAC
    /* 000B39 02 42 1B       */ CALL func_1B42
    /* 000B3C 04 FA 09       */ JMP lab_9FA
  lab_94B:
    /* 000B3F 01             */ CALC
    /* 000B40 00 00          */ PUSH 0
    /* 000B42 40 00          */ PUSH 64
    /* 000B44 9C 80          */ SYSCALL 0x6C ; sce_music_volume / sce_music_volume (2 arg(s))
    /* 000B46 00 C0          */ EXPR.END
    /* 000B48 01             */ CALC
    /* 000B49 06 51          */ PUSH.VAR 20742
    /* 000B4B 00 00          */ PUSH 0
    /* 000B4D 1B C0          */ EXPR.ASSIGN
    /* 000B4F 00 C0          */ EXPR.END
    /* 000B51 01             */ CALC
    /* 000B52 08 51          */ PUSH.VAR 20744
    /* 000B54 00 00          */ PUSH 0
    /* 000B56 1B C0          */ EXPR.ASSIGN
    /* 000B58 00 C0          */ EXPR.END
    /* 000B5A 01             */ CALC
    /* 000B5B 0A 51          */ PUSH.VAR 20746
    /* 000B5D 01 00          */ PUSH 1
    /* 000B5F 1B C0          */ EXPR.ASSIGN
    /* 000B61 00 C0          */ EXPR.END
    /* 000B63 01             */ CALC
    /* 000B64 10 60          */ PUSH.VAR 24592
    /* 000B66 01 00          */ PUSH 1
    /* 000B68 1B C0          */ EXPR.ASSIGN
    /* 000B6A 00 C0          */ EXPR.END
    /* 000B6C 01             */ CALC
    /* 000B6D 8A 10 00       */ PUSH 138
    /* 000B70 86 80          */ SYSCALL 0x56 ; sce_special_event / sce_special_event (1 arg(s))
    /* 000B72 00 C0          */ EXPR.END
    /* 000B74 01             */ CALC
    /* 000B75 11 00          */ PUSH 17
    /* 000B77 40 00          */ PUSH 64
    /* 000B79 C0 10 01       */ PUSH 448
    /* 000B7C 01 00          */ PUSH 1
    /* 000B7E 71 10 01       */ PUSH 369
    /* 000B81 00 00          */ PUSH 0
    /* 000B83 00 00          */ PUSH 0
    /* 000B85 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000B87 00 C0          */ EXPR.END
    /* 000B89 01             */ CALC
    /* 000B8A 12 00          */ PUSH 18
    /* 000B8C C0 10 01       */ PUSH 448
    /* 000B8F 40 10 01       */ PUSH 320
    /* 000B92 02 00          */ PUSH 2
    /* 000B94 71 10 01       */ PUSH 369
    /* 000B97 00 00          */ PUSH 0
    /* 000B99 00 00          */ PUSH 0
    /* 000B9B 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000B9D 00 C0          */ EXPR.END
    /* 000B9F 01             */ CALC
    /* 000BA0 C2 10 00       */ PUSH 194
    /* 000BA3 0C 00          */ PUSH 12
    /* 000BA5 00 00          */ PUSH 0
    /* 000BA7 00 00          */ PUSH 0
    /* 000BA9 00 00          */ PUSH 0
    /* 000BAB 97 10 00       */ PUSH 151
    /* 000BAE 00 00          */ PUSH 0
    /* 000BB0 00 00          */ PUSH 0
    /* 000BB2 11 00          */ PUSH 17
    /* 000BB4 00 00          */ PUSH 0
    /* 000BB6 00 00          */ PUSH 0
    /* 000BB8 02 00          */ PUSH 2
    /* 000BBA 00 00          */ PUSH 0
    /* 000BBC 00 00          */ PUSH 0
    /* 000BBE 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000BC0 00 C0          */ EXPR.END
    /* 000BC2 01             */ CALC
    /* 000BC3 C2 10 00       */ PUSH 194
    /* 000BC6 0C 00          */ PUSH 12
    /* 000BC8 00 00          */ PUSH 0
    /* 000BCA 00 00          */ PUSH 0
    /* 000BCC 00 00          */ PUSH 0
    /* 000BCE 97 10 00       */ PUSH 151
    /* 000BD1 00 00          */ PUSH 0
    /* 000BD3 00 00          */ PUSH 0
    /* 000BD5 12 00          */ PUSH 18
    /* 000BD7 00 00          */ PUSH 0
    /* 000BD9 00 00          */ PUSH 0
    /* 000BDB 02 00          */ PUSH 2
    /* 000BDD 00 00          */ PUSH 0
    /* 000BDF 00 00          */ PUSH 0
    /* 000BE1 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000BE3 00 C0          */ EXPR.END
    /* 000BE5 01             */ CALC
    /* 000BE6 00 00          */ PUSH 0
    /* 000BE8 00 00          */ PUSH 0
    /* 000BEA 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 000BEC 00 C0          */ EXPR.END
  lab_9FA:
    /* 000BEE 04 54 0B       */ JMP lab_B54
    /* 000BF1 04 0C 0A       */ JMP lab_A0C
  lab_A00:
    /* 000BF4 07             */ CALC.EXT
    /* 000BF5 FF FF          */ EXPR.POP
    /* 000BF7 6F 00          */ PUSH 111
    /* 000BF9 14 C0          */ EXPR.EQUALS
    /* 000BFB 00 C0          */ EXPR.END
    /* 000BFD 05 54 0B       */ JZ lab_B54
  lab_A0C:
    /* 000C00 01             */ CALC
    /* 000C01 54 60          */ PUSH.VAR 24660
    /* 000C03 00 C0          */ EXPR.END
    /* 000C05 05 70 0A       */ JZ lab_87C
    /* 000C08 01             */ CALC
    /* 000C09 7F 80          */ SYSCALL 0x4F ; sce_start_demo / sce_start_demo (0 arg(s))
    /* 000C0B 00 C0          */ EXPR.END
    /* 000C0D 01             */ CALC
    /* 000C0E 10 60          */ PUSH.VAR 24592
    /* 000C10 01 00          */ PUSH 1
    /* 000C12 1B C0          */ EXPR.ASSIGN
    /* 000C14 00 C0          */ EXPR.END
    /* 000C16 01             */ CALC
    /* 000C17 8A 10 00       */ PUSH 138
    /* 000C1A 86 80          */ SYSCALL 0x56 ; sce_special_event / sce_special_event (1 arg(s))
    /* 000C1C 00 C0          */ EXPR.END
    /* 000C1E 01             */ CALC
    /* 000C1F 3D 00          */ PUSH 61
    /* 000C21 86 80          */ SYSCALL 0x56 ; sce_special_event / sce_special_event (1 arg(s))
    /* 000C23 00 C0          */ EXPR.END
    /* 000C25 01             */ CALC
    /* 000C26 00 00          */ PUSH 0
    /* 000C28 02 00          */ PUSH 2
    /* 000C2A 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 000C2C 00 C0          */ EXPR.END
    /* 000C2E 02 88 19       */ CALL func_1988
    /* 000C31 01             */ CALC
    /* 000C32 DC 10 00       */ PUSH 220
    /* 000C35 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 000C37 00 C0          */ EXPR.END
    /* 000C39 01             */ CALC
    /* 000C3A 10 60          */ PUSH.VAR 24592
    /* 000C3C 03 00          */ PUSH 3
    /* 000C3E 1B C0          */ EXPR.ASSIGN
    /* 000C40 00 C0          */ EXPR.END
    /* 000C42 01             */ CALC
    /* 000C43 08 00          */ PUSH 8
    /* 000C45 86 80          */ SYSCALL 0x56 ; sce_special_event / sce_special_event (1 arg(s))
    /* 000C47 00 C0          */ EXPR.END
    /* 000C49 01             */ CALC
    /* 000C4A 40 10 01       */ PUSH 320
    /* 000C4D 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 000C4F 00 C0          */ EXPR.END
    /* 000C51 01             */ CALC
    /* 000C52 4D 00          */ PUSH 77
    /* 000C54 00 00          */ PUSH 0
    /* 000C56 50 00          */ PUSH 80
    /* 000C58 F0 10 00       */ PUSH 240
    /* 000C5B 00 00          */ PUSH 0
    /* 000C5D 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 000C5F 00 C0          */ EXPR.END
    /* 000C61 04 70 0A       */ JMP lab_87C
  lab_87C:
    /* 000C64 01             */ CALC
    /* 000C65 4A 00          */ PUSH 74
    /* 000C67 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 000C69 00 00          */ PUSH 0
    /* 000C6B 14 C0          */ EXPR.EQUALS
    /* 000C6D 00 C0          */ EXPR.END
    /* 000C6F 05 DE 0A       */ JZ lab_ADE
    /* 000C72 01             */ CALC
    /* 000C73 00 00          */ PUSH 0
    /* 000C75 7F 00          */ PUSH 127
    /* 000C77 9C 80          */ SYSCALL 0x6C ; sce_music_volume / sce_music_volume (2 arg(s))
    /* 000C79 00 C0          */ EXPR.END
    /* 000C7B 01             */ CALC
    /* 000C7C 10 60          */ PUSH.VAR 24592
    /* 000C7E 01 00          */ PUSH 1
    /* 000C80 1B C0          */ EXPR.ASSIGN
    /* 000C82 00 C0          */ EXPR.END
    /* 000C84 01             */ CALC
    /* 000C85 8A 10 00       */ PUSH 138
    /* 000C88 86 80          */ SYSCALL 0x56 ; sce_special_event / sce_special_event (1 arg(s))
    /* 000C8A 00 C0          */ EXPR.END
    /* 000C8C 01             */ CALC
    /* 000C8D 4E 00          */ PUSH 78
    /* 000C8F 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 000C91 00 00          */ PUSH 0
    /* 000C93 14 C0          */ EXPR.EQUALS
    /* 000C95 00 C0          */ EXPR.END
    /* 000C97 05 AC 0A       */ JZ lab_AAC
    /* 000C9A 02 D5 18       */ CALL func_18D5
    /* 000C9D 04 DB 0A       */ JMP lab_ADB
  lab_AAC:
    /* 000CA0 01             */ CALC
    /* 000CA1 00 00          */ PUSH 0
    /* 000CA3 00 00          */ PUSH 0
    /* 000CA5 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 000CA7 00 C0          */ EXPR.END
    /* 000CA9 01             */ CALC
    /* 000CAA 4F 00          */ PUSH 79
    /* 000CAC 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 000CAE 00 C0          */ EXPR.END
    /* 000CB0 05 DB 0A       */ JZ lab_ADB
    /* 000CB3 01             */ CALC
    /* 000CB4 7F 80          */ SYSCALL 0x4F ; sce_start_demo / sce_start_demo (0 arg(s))
    /* 000CB6 00 C0          */ EXPR.END

msg_0:
    /* 000CB8 11 00 00       */ sce_message message_0
    /* 000CBB 01             */ CALC
    /* 000CBC 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 000CBE 00 C0          */ EXPR.END
    /* 000CC0 01             */ CALC
    /* 000CC1 4F 00          */ PUSH 79
    /* 000CC3 62 80          */ SYSCALL 0x32 ; sce_off_switch / sce_off_switch (1 arg(s))
    /* 000CC5 00 C0          */ EXPR.END
    /* 000CC7 01             */ CALC
    /* 000CC8 80 80          */ SYSCALL 0x50 ; sce_finish_demo / sce_finish_demo (0 arg(s))
    /* 000CCA 00 C0          */ EXPR.END
    /* 000CCC 04 DB 0A       */ JMP lab_ADB
  lab_ADB:
    /* 000CCF 04 51 0B       */ JMP lab_B51
  lab_ADE:
    /* 000CD2 01             */ CALC
    /* 000CD3 60 10 FF       */ PUSH 65376
    /* 000CD6 26 00          */ PUSH 38
    /* 000CD8 20 00          */ PUSH 32
    /* 000CDA 30 00          */ PUSH 48
    /* 000CDC 03 00          */ PUSH 3
    /* 000CDE 38 00          */ PUSH 56
    /* 000CE0 01 00          */ PUSH 1
    /* 000CE2 18 00          */ PUSH 24
    /* 000CE4 00 00          */ PUSH 0
    /* 000CE6 00 00          */ PUSH 0
    /* 000CE8 00 00          */ PUSH 0
    /* 000CEA 00 00          */ PUSH 0
    /* 000CEC 00 00          */ PUSH 0
    /* 000CEE 00 00          */ PUSH 0
    /* 000CF0 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000CF2 00 C0          */ EXPR.END
    /* 000CF4 01             */ CALC
    /* 000CF5 60 10 FF       */ PUSH 65376
    /* 000CF8 26 00          */ PUSH 38
    /* 000CFA 80 10 00       */ PUSH 128
    /* 000CFD B0 10 00       */ PUSH 176
    /* 000D00 02 00          */ PUSH 2
    /* 000D02 38 00          */ PUSH 56
    /* 000D04 01 00          */ PUSH 1
    /* 000D06 18 00          */ PUSH 24
    /* 000D08 00 00          */ PUSH 0
    /* 000D0A 00 00          */ PUSH 0
    /* 000D0C 00 00          */ PUSH 0
    /* 000D0E 00 00          */ PUSH 0
    /* 000D10 00 00          */ PUSH 0
    /* 000D12 00 00          */ PUSH 0
    /* 000D14 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000D16 00 C0          */ EXPR.END
    /* 000D18 01             */ CALC
    /* 000D19 60 10 FF       */ PUSH 65376
    /* 000D1C 26 00          */ PUSH 38
    /* 000D1E A0 10 00       */ PUSH 160
    /* 000D21 90 10 00       */ PUSH 144
    /* 000D24 00 00          */ PUSH 0
    /* 000D26 38 00          */ PUSH 56
    /* 000D28 01 00          */ PUSH 1
    /* 000D2A 18 00          */ PUSH 24
    /* 000D2C 00 00          */ PUSH 0
    /* 000D2E 00 00          */ PUSH 0
    /* 000D30 00 00          */ PUSH 0
    /* 000D32 00 00          */ PUSH 0
    /* 000D34 00 00          */ PUSH 0
    /* 000D36 00 00          */ PUSH 0
    /* 000D38 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000D3A 00 C0          */ EXPR.END
    /* 000D3C 01             */ CALC
    /* 000D3D 00 00          */ PUSH 0
    /* 000D3F 00 00          */ PUSH 0
    /* 000D41 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 000D43 00 C0          */ EXPR.END
  lab_B51:
    /* 000D45 04 54 0B       */ JMP lab_B54
  lab_B54:
    /* 000D48 03             */ RETURN

func_B55:
    /* 000D49 01             */ CALC
    /* 000D4A 11 00          */ PUSH 17
    /* 000D4C D0 10 00       */ PUSH 208
    /* 000D4F B0 10 00       */ PUSH 176
    /* 000D52 02 00          */ PUSH 2
    /* 000D54 71 10 01       */ PUSH 369
    /* 000D57 00 00          */ PUSH 0
    /* 000D59 00 00          */ PUSH 0
    /* 000D5B 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000D5D 00 C0          */ EXPR.END
    /* 000D5F 01             */ CALC
    /* 000D60 12 00          */ PUSH 18
    /* 000D62 30 10 01       */ PUSH 304
    /* 000D65 B0 10 00       */ PUSH 176
    /* 000D68 02 00          */ PUSH 2
    /* 000D6A 71 10 01       */ PUSH 369
    /* 000D6D 00 00          */ PUSH 0
    /* 000D6F 00 00          */ PUSH 0
    /* 000D71 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000D73 00 C0          */ EXPR.END
    /* 000D75 01             */ CALC
    /* 000D76 13 00          */ PUSH 19
    /* 000D78 E0 10 00       */ PUSH 224
    /* 000D7B A0 10 01       */ PUSH 416
    /* 000D7E 02 00          */ PUSH 2
    /* 000D80 71 10 01       */ PUSH 369
    /* 000D83 00 00          */ PUSH 0
    /* 000D85 00 00          */ PUSH 0
    /* 000D87 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000D89 00 C0          */ EXPR.END
    /* 000D8B 01             */ CALC
    /* 000D8C 14 00          */ PUSH 20
    /* 000D8E 20 10 01       */ PUSH 288
    /* 000D91 A0 10 01       */ PUSH 416
    /* 000D94 02 00          */ PUSH 2
    /* 000D96 71 10 01       */ PUSH 369
    /* 000D99 00 00          */ PUSH 0
    /* 000D9B 00 00          */ PUSH 0
    /* 000D9D 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000D9F 00 C0          */ EXPR.END
    /* 000DA1 01             */ CALC
    /* 000DA2 3F 00          */ PUSH 63
    /* 000DA4 10 10 02       */ PUSH 528
    /* 000DA7 B0 10 01       */ PUSH 432
    /* 000DAA 02 00          */ PUSH 2
    /* 000DAC 71 10 01       */ PUSH 369
    /* 000DAF 00 00          */ PUSH 0
    /* 000DB1 00 00          */ PUSH 0
    /* 000DB3 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000DB5 00 C0          */ EXPR.END
    /* 000DB7 01             */ CALC
    /* 000DB8 40 00          */ PUSH 64
    /* 000DBA 40 10 02       */ PUSH 576
    /* 000DBD B0 10 01       */ PUSH 432
    /* 000DC0 02 00          */ PUSH 2
    /* 000DC2 71 10 01       */ PUSH 369
    /* 000DC5 00 00          */ PUSH 0
    /* 000DC7 00 00          */ PUSH 0
    /* 000DC9 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000DCB 00 C0          */ EXPR.END
    /* 000DCD 01             */ CALC
    /* 000DCE C2 10 00       */ PUSH 194
    /* 000DD1 0C 00          */ PUSH 12
    /* 000DD3 00 00          */ PUSH 0
    /* 000DD5 00 00          */ PUSH 0
    /* 000DD7 00 00          */ PUSH 0
    /* 000DD9 97 10 00       */ PUSH 151
    /* 000DDC 00 00          */ PUSH 0
    /* 000DDE 00 00          */ PUSH 0
    /* 000DE0 11 00          */ PUSH 17
    /* 000DE2 00 00          */ PUSH 0
    /* 000DE4 00 00          */ PUSH 0
    /* 000DE6 02 00          */ PUSH 2
    /* 000DE8 00 00          */ PUSH 0
    /* 000DEA 00 00          */ PUSH 0
    /* 000DEC 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000DEE 00 C0          */ EXPR.END
    /* 000DF0 01             */ CALC
    /* 000DF1 C2 10 00       */ PUSH 194
    /* 000DF4 0C 00          */ PUSH 12
    /* 000DF6 00 00          */ PUSH 0
    /* 000DF8 00 00          */ PUSH 0
    /* 000DFA 00 00          */ PUSH 0
    /* 000DFC 96 10 00       */ PUSH 150
    /* 000DFF 00 00          */ PUSH 0
    /* 000E01 00 00          */ PUSH 0
    /* 000E03 12 00          */ PUSH 18
    /* 000E05 00 00          */ PUSH 0
    /* 000E07 00 00          */ PUSH 0
    /* 000E09 02 00          */ PUSH 2
    /* 000E0B 00 00          */ PUSH 0
    /* 000E0D 00 00          */ PUSH 0
    /* 000E0F 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000E11 00 C0          */ EXPR.END
    /* 000E13 01             */ CALC
    /* 000E14 C2 10 00       */ PUSH 194
    /* 000E17 0C 00          */ PUSH 12
    /* 000E19 00 00          */ PUSH 0
    /* 000E1B 00 00          */ PUSH 0
    /* 000E1D 00 00          */ PUSH 0
    /* 000E1F 97 10 00       */ PUSH 151
    /* 000E22 00 00          */ PUSH 0
    /* 000E24 00 00          */ PUSH 0
    /* 000E26 13 00          */ PUSH 19
    /* 000E28 00 00          */ PUSH 0
    /* 000E2A 00 00          */ PUSH 0
    /* 000E2C 02 00          */ PUSH 2
    /* 000E2E 00 00          */ PUSH 0
    /* 000E30 00 00          */ PUSH 0
    /* 000E32 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000E34 00 C0          */ EXPR.END
    /* 000E36 01             */ CALC
    /* 000E37 C2 10 00       */ PUSH 194
    /* 000E3A 0C 00          */ PUSH 12
    /* 000E3C 00 00          */ PUSH 0
    /* 000E3E 00 00          */ PUSH 0
    /* 000E40 00 00          */ PUSH 0
    /* 000E42 96 10 00       */ PUSH 150
    /* 000E45 00 00          */ PUSH 0
    /* 000E47 00 00          */ PUSH 0
    /* 000E49 14 00          */ PUSH 20
    /* 000E4B 00 00          */ PUSH 0
    /* 000E4D 00 00          */ PUSH 0
    /* 000E4F 02 00          */ PUSH 2
    /* 000E51 00 00          */ PUSH 0
    /* 000E53 00 00          */ PUSH 0
    /* 000E55 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000E57 00 C0          */ EXPR.END
    /* 000E59 01             */ CALC
    /* 000E5A C2 10 00       */ PUSH 194
    /* 000E5D 0C 00          */ PUSH 12
    /* 000E5F 00 00          */ PUSH 0
    /* 000E61 00 00          */ PUSH 0
    /* 000E63 00 00          */ PUSH 0
    /* 000E65 97 10 00       */ PUSH 151
    /* 000E68 00 00          */ PUSH 0
    /* 000E6A 00 00          */ PUSH 0
    /* 000E6C 3F 00          */ PUSH 63
    /* 000E6E 00 00          */ PUSH 0
    /* 000E70 00 00          */ PUSH 0
    /* 000E72 02 00          */ PUSH 2
    /* 000E74 00 00          */ PUSH 0
    /* 000E76 00 00          */ PUSH 0
    /* 000E78 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000E7A 00 C0          */ EXPR.END
    /* 000E7C 01             */ CALC
    /* 000E7D C2 10 00       */ PUSH 194
    /* 000E80 0C 00          */ PUSH 12
    /* 000E82 00 00          */ PUSH 0
    /* 000E84 00 00          */ PUSH 0
    /* 000E86 00 00          */ PUSH 0
    /* 000E88 96 10 00       */ PUSH 150
    /* 000E8B 00 00          */ PUSH 0
    /* 000E8D 00 00          */ PUSH 0
    /* 000E8F 40 00          */ PUSH 64
    /* 000E91 00 00          */ PUSH 0
    /* 000E93 00 00          */ PUSH 0
    /* 000E95 02 00          */ PUSH 2
    /* 000E97 00 00          */ PUSH 0
    /* 000E99 00 00          */ PUSH 0
    /* 000E9B 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 000E9D 00 C0          */ EXPR.END
    /* 000E9F 03             */ RETURN

func_CAC:
    /* 000EA0 01             */ CALC
    /* 000EA1 A8 10 00       */ PUSH 168
    /* 000EA4 F0 10 00       */ PUSH 240
    /* 000EA7 70 00          */ PUSH 112
    /* 000EA9 02 00          */ PUSH 2
    /* 000EAB BE 10 00       */ PUSH 190
    /* 000EAE 00 00          */ PUSH 0
    /* 000EB0 00 00          */ PUSH 0
    /* 000EB2 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000EB4 00 C0          */ EXPR.END
    /* 000EB6 01             */ CALC
    /* 000EB7 10 00          */ PUSH 16
    /* 000EB9 10 10 01       */ PUSH 272
    /* 000EBC 70 00          */ PUSH 112
    /* 000EBE 02 00          */ PUSH 2
    /* 000EC0 BE 10 00       */ PUSH 190
    /* 000EC3 00 00          */ PUSH 0
    /* 000EC5 00 00          */ PUSH 0
    /* 000EC7 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 000EC9 00 C0          */ EXPR.END
    /* 000ECB 01             */ CALC
    /* 000ECC A8 10 00       */ PUSH 168
    /* 000ECF 08 00          */ PUSH 8
    /* 000ED1 3E 80          */ SYSCALL 0x0E ; ns_animation / sce_dummy_proc (2 arg(s))
    /* 000ED3 00 C0          */ EXPR.END
    /* 000ED5 01             */ CALC
    /* 000ED6 10 00          */ PUSH 16
    /* 000ED8 09 00          */ PUSH 9
    /* 000EDA 3E 80          */ SYSCALL 0x0E ; ns_animation / sce_dummy_proc (2 arg(s))
    /* 000EDC 00 C0          */ EXPR.END
    /* 000EDE 03             */ RETURN

intr_0:
    /* 000EDF 01             */ CALC
    /* 000EE0 4C 60          */ PUSH.VAR 24652
    /* 000EE2 03 00          */ PUSH 3
    /* 000EE4 14 C0          */ EXPR.EQUALS
    /* 000EE6 00 C0          */ EXPR.END
    /* 000EE8 05 FD 0C       */ JZ msg_2

msg_1:
    /* 000EEB 11 52 00       */ sce_message message_1
    /* 000EEE 04 00 0D       */ JMP lab_D00

msg_2:
    /* 000EF1 11 74 00       */ sce_message message_2
  lab_D00:
    /* 000EF4 00             */ EXIT

msg_3:
    /* 000EF5 11 96 00       */ sce_message message_3
    /* 000EF8 00             */ EXIT

msg_4:
    /* 000EF9 11 F0 00       */ sce_message message_4
    /* 000EFC 00             */ EXIT

msg_5:
    /* 000EFD 11 08 01       */ sce_message message_5
    /* 000F00 00             */ EXIT

msg_6:
    /* 000F01 11 24 01       */ sce_message message_6
    /* 000F04 00             */ EXIT

msg_7:
    /* 000F05 11 4A 01       */ sce_message message_7
    /* 000F08 00             */ EXIT

msg_8:
    /* 000F09 11 80 01       */ sce_message message_8
    /* 000F0C 00             */ EXIT

msg_9:
    /* 000F0D 11 DC 01       */ sce_message message_9
    /* 000F10 00             */ EXIT

msg_10:
    /* 000F11 11 18 02       */ sce_message message_10
    /* 000F14 00             */ EXIT

msg_11:
    /* 000F15 11 AC 02       */ sce_message message_11
    /* 000F18 00             */ EXIT

msg_12:
    /* 000F19 11 5E 03       */ sce_message message_12
    /* 000F1C 00             */ EXIT

msg_13:
    /* 000F1D 11 3E 04       */ sce_message message_13
    /* 000F20 00             */ EXIT

msg_14:
    /* 000F21 11 AE 04       */ sce_message message_14
    /* 000F24 00             */ EXIT

msg_15:
    /* 000F25 11 72 05       */ sce_message message_15
    /* 000F28 00             */ EXIT

msg_16:
    /* 000F29 11 E2 05       */ sce_message message_16
    /* 000F2C 00             */ EXIT

msg_17:
    /* 000F2D 11 60 06       */ sce_message message_17
    /* 000F30 01             */ CALC
    /* 000F31 46 10 01       */ PUSH 326
    /* 000F34 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 000F36 00 C0          */ EXPR.END
    /* 000F38 00             */ EXIT

intr_16:
    /* 000F39 01             */ CALC
    /* 000F3A 7F 80          */ SYSCALL 0x4F ; sce_start_demo / sce_start_demo (0 arg(s))
    /* 000F3C 00 C0          */ EXPR.END
    /* 000F3E 01             */ CALC
    /* 000F3F 10 51          */ PUSH.VAR 20752
    /* 000F41 14 00          */ PUSH 20
    /* 000F43 1B C0          */ EXPR.ASSIGN
    /* 000F45 00 C0          */ EXPR.END
    /* 000F47 01             */ CALC
    /* 000F48 26 51          */ PUSH.VAR 20774
    /* 000F4A 05 00          */ PUSH 5
    /* 000F4C 1B C0          */ EXPR.ASSIGN
    /* 000F4E 00 C0          */ EXPR.END
    /* 000F50 01             */ CALC
    /* 000F51 56 00          */ PUSH 86
    /* 000F53 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 000F55 00 C0          */ EXPR.END
    /* 000F57 05 97 0D       */ JZ msg_20
    /* 000F5A 01             */ CALC
    /* 000F5B D4 10 03       */ PUSH 980
    /* 000F5E 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 000F60 00 C0          */ EXPR.END
    /* 000F62 05 7A 0D       */ JZ lab_D7A

msg_18:
    /* 000F65 11 2E 09       */ sce_message message_18
    /* 000F68 04 62 0F       */ JMP lab_F62
    /* 000F6B 04 94 0D       */ JMP lab_D94
  lab_D7A:
    /* 000F6E 01             */ CALC
    /* 000F6F 10 51          */ PUSH.VAR 20752
    /* 000F71 23 00          */ PUSH 35
    /* 000F73 1B C0          */ EXPR.ASSIGN
    /* 000F75 00 C0          */ EXPR.END
    /* 000F77 01             */ CALC
    /* 000F78 26 51          */ PUSH.VAR 20774
    /* 000F7A 03 00          */ PUSH 3
    /* 000F7C 1B C0          */ EXPR.ASSIGN
    /* 000F7E 00 C0          */ EXPR.END

msg_19:
    /* 000F80 14 6A 09       */ sce_message_nc message_19
    /* 000F83 01             */ CALC
    /* 000F84 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 000F86 00 C0          */ EXPR.END
  lab_D94:
    /* 000F88 04 9F 0D       */ JMP msg_21

msg_20:
    /* 000F8B 14 8E 09       */ sce_message_nc message_20
    /* 000F8E 01             */ CALC
    /* 000F8F 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 000F91 00 C0          */ EXPR.END

msg_21:
    /* 000F93 14 FE 09       */ sce_message_nc message_21
    /* 000F96 01             */ CALC
    /* 000F97 00 00          */ PUSH 0
    /* 000F99 00 00          */ PUSH 0
    /* 000F9B 6B 80          */ SYSCALL 0x3B ; sce_menu / sce_menu (2 arg(s))
    /* 000F9D 01 00          */ PUSH 1
    /* 000F9F 15 C0          */ EXPR.NOT_EQUALS
    /* 000FA1 00 C0          */ EXPR.END
    /* 000FA3 05 BB 0D       */ JZ msg_23

msg_22:
    /* 000FA6 11 16 0A       */ sce_message message_22
    /* 000FA9 04 62 0F       */ JMP lab_F62
    /* 000FAC 04 BB 0D       */ JMP msg_23

msg_23:
    /* 000FAF 14 3E 0A       */ sce_message_nc message_23
    /* 000FB2 01             */ CALC
    /* 000FB3 00 00          */ PUSH 0
    /* 000FB5 00 00          */ PUSH 0
    /* 000FB7 6B 80          */ SYSCALL 0x3B ; sce_menu / sce_menu (2 arg(s))
    /* 000FB9 01 00          */ PUSH 1
    /* 000FBB 14 C0          */ EXPR.EQUALS
    /* 000FBD 00 C0          */ EXPR.END
    /* 000FBF 05 D9 0D       */ JZ msg_25

msg_24:
    /* 000FC2 14 60 0A       */ sce_message_nc message_24
    /* 000FC5 01             */ CALC
    /* 000FC6 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 000FC8 00 C0          */ EXPR.END
    /* 000FCA 04 D9 0D       */ JMP msg_25

msg_25:
    /* 000FCD 11 02 0C       */ sce_message message_25
    /* 000FD0 01             */ CALC
    /* 000FD1 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 000FD3 00 C0          */ EXPR.END
    /* 000FD5 01             */ CALC
    /* 000FD6 29 00          */ PUSH 41
    /* 000FD8 40 80          */ SYSCALL 0x10 ; sce_set_direction_north / sce_dummy_proc (1 arg(s))
    /* 000FDA 00 C0          */ EXPR.END
    /* 000FDC 01             */ CALC
    /* 000FDD 00 00          */ PUSH 0
    /* 000FDF 43 80          */ SYSCALL 0x13 ; sce_set_direction_west / sce_dummy_proc (1 arg(s))
    /* 000FE1 00 C0          */ EXPR.END
    /* 000FE3 01             */ CALC
    /* 000FE4 00 00          */ PUSH 0
    /* 000FE6 01 00          */ PUSH 1
    /* 000FE8 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 000FEA 60 10 01       */ PUSH 352
    /* 000FED 11 C0          */ EXPR.LESS_THAN
    /* 000FEF 00 C0          */ EXPR.END
    /* 000FF1 05 12 0E       */ JZ lab_E12
    /* 000FF4 01             */ CALC
    /* 000FF5 00 00          */ PUSH 0
    /* 000FF7 40 10 01       */ PUSH 320
    /* 000FFA C0 10 01       */ PUSH 448
    /* 000FFD 08 00          */ PUSH 8
    /* 000FFF 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 001001 00 C0          */ EXPR.END
    /* 001003 04 21 0E       */ JMP lab_E21
  lab_E12:
    /* 001006 01             */ CALC
    /* 001007 00 00          */ PUSH 0
    /* 001009 60 10 01       */ PUSH 352
    /* 00100C C0 10 01       */ PUSH 448
    /* 00100F 08 00          */ PUSH 8
    /* 001011 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 001013 00 C0          */ EXPR.END
  lab_E21:
    /* 001015 01             */ CALC
    /* 001016 00 00          */ PUSH 0
    /* 001018 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 00101A 00 C0          */ EXPR.END
    /* 00101C 01             */ CALC
    /* 00101D 00 00          */ PUSH 0
    /* 00101F 50 10 01       */ PUSH 336
    /* 001022 C0 10 01       */ PUSH 448
    /* 001025 08 00          */ PUSH 8
    /* 001027 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 001029 00 C0          */ EXPR.END
    /* 00102B 01             */ CALC
    /* 00102C 10 51          */ PUSH.VAR 20752
    /* 00102E 10 51          */ PUSH.VAR 20752
    /* 001030 6E 80          */ SYSCALL 0x3E ; sce_rand / sce_rand (1 arg(s))
    /* 001032 1F C0          */ EXPR.SELF_ADD
    /* 001034 00 C0          */ EXPR.END
    /* 001036 01             */ CALC
    /* 001037 00 00          */ PUSH 0
    /* 001039 02 00          */ PUSH 2
    /* 00103B 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 00103D 00 C0          */ EXPR.END
    /* 00103F 01             */ CALC
    /* 001040 01 00          */ PUSH 1
    /* 001042 34 80          */ SYSCALL 0x04 ; sce_conv_win / sce_conv_win (1 arg(s))
    /* 001044 00 C0          */ EXPR.END

msg_26:
    /* 001046 14 28 0C       */ sce_message_nc message_26
    /* 001049 01             */ CALC
    /* 00104A 0E 51          */ PUSH.VAR 20750
    /* 00104C 01 00          */ PUSH 1
    /* 00104E 00 00          */ PUSH 0
    /* 001050 6B 80          */ SYSCALL 0x3B ; sce_menu / sce_menu (2 arg(s))
    /* 001052 1B C0          */ EXPR.ASSIGN
    /* 001054 00 C0          */ EXPR.END

msg_27:
    /* 001056 14 88 0C       */ sce_message_nc message_27
    /* 001059 01             */ CALC
    /* 00105A 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 00105C 00 C0          */ EXPR.END
  lab_E6A:
    /* 00105E 01             */ CALC
    /* 00105F 10 51          */ PUSH.VAR 20752
    /* 001061 00 C0          */ EXPR.END
    /* 001063 05 D5 0E       */ JZ lab_ED5
    /* 001066 01             */ CALC
    /* 001067 0E 51          */ PUSH.VAR 20750
    /* 001069 02 00          */ PUSH 2
    /* 00106B 14 C0          */ EXPR.EQUALS
    /* 00106D 00 C0          */ EXPR.END
    /* 00106F 05 84 0E       */ JZ lab_E84
    /* 001072 02 4E 28       */ CALL func_284E
    /* 001075 04 84 0E       */ JMP lab_E84
  lab_E84:
    /* 001078 01             */ CALC
    /* 001079 0E 51          */ PUSH.VAR 20750
    /* 00107B 01 00          */ PUSH 1
    /* 00107D 14 C0          */ EXPR.EQUALS
    /* 00107F 00 C0          */ EXPR.END
    /* 001081 05 96 0E       */ JZ lab_E96
    /* 001084 02 DD 27       */ CALL msg_119
    /* 001087 04 96 0E       */ JMP lab_E96
  lab_E96:
    /* 00108A 01             */ CALC
    /* 00108B 12 51          */ PUSH.VAR 20754
    /* 00108D 00 00          */ PUSH 0
    /* 00108F 15 C0          */ EXPR.NOT_EQUALS
    /* 001091 00 C0          */ EXPR.END
    /* 001093 05 CF 0E       */ JZ lab_ECF
    /* 001096 01             */ CALC
    /* 001097 10 51          */ PUSH.VAR 20752
    /* 001099 12 51          */ PUSH.VAR 20754
    /* 00109B 20 C0          */ EXPR.SELF_SUB
    /* 00109D 00 C0          */ EXPR.END
    /* 00109F 01             */ CALC
    /* 0010A0 0E 51          */ PUSH.VAR 20750
    /* 0010A2 01 00          */ PUSH 1
    /* 0010A4 14 C0          */ EXPR.EQUALS
    /* 0010A6 00 C0          */ EXPR.END
    /* 0010A8 05 C3 0E       */ JZ lab_EC3
    /* 0010AB 01             */ CALC
    /* 0010AC 0E 51          */ PUSH.VAR 20750
    /* 0010AE 02 00          */ PUSH 2
    /* 0010B0 1B C0          */ EXPR.ASSIGN
    /* 0010B2 00 C0          */ EXPR.END
    /* 0010B4 04 CC 0E       */ JMP lab_ECC
  lab_EC3:
    /* 0010B7 01             */ CALC
    /* 0010B8 0E 51          */ PUSH.VAR 20750
    /* 0010BA 01 00          */ PUSH 1
    /* 0010BC 1B C0          */ EXPR.ASSIGN
    /* 0010BE 00 C0          */ EXPR.END
  lab_ECC:
    /* 0010C0 04 D2 0E       */ JMP lab_ED2
  lab_ECF:
    /* 0010C3 04 D5 0E       */ JMP lab_ED5
  lab_ED2:
    /* 0010C6 04 6A 0E       */ JMP lab_E6A
  lab_ED5:
    /* 0010C9 01             */ CALC
    /* 0010CA 10 51          */ PUSH.VAR 20752
    /* 0010CC 00 C0          */ EXPR.END
    /* 0010CE 05 E3 0E       */ JZ lab_EE3

msg_28:
    /* 0010D1 11 A6 0C       */ sce_message message_28
    /* 0010D4 04 62 0F       */ JMP lab_F62
  lab_EE3:
    /* 0010D7 01             */ CALC
    /* 0010D8 0E 51          */ PUSH.VAR 20750
    /* 0010DA 01 00          */ PUSH 1
    /* 0010DC 14 C0          */ EXPR.EQUALS
    /* 0010DE 00 C0          */ EXPR.END
    /* 0010E0 05 5F 0F       */ JZ msg_34
    /* 0010E3 01             */ CALC
    /* 0010E4 56 00          */ PUSH 86
    /* 0010E6 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 0010E8 00 C0          */ EXPR.END
    /* 0010EA 05 38 0F       */ JZ lab_F38
    /* 0010ED 01             */ CALC
    /* 0010EE 69 10 01       */ PUSH 361
    /* 0010F1 01 00          */ PUSH 1
    /* 0010F3 59 80          */ SYSCALL 0x29 ; sce_get_item / sce_get_item (2 arg(s))
    /* 0010F5 00 C0          */ EXPR.END
    /* 0010F7 01             */ CALC
    /* 0010F8 D4 10 03       */ PUSH 980
    /* 0010FB 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 0010FD 00 C0          */ EXPR.END

msg_29:
    /* 0010FF 14 E2 0C       */ sce_message_nc message_29
    /* 001102 01             */ CALC
    /* 001103 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 001105 00 C0          */ EXPR.END
    /* 001107 01             */ CALC
    /* 001108 47 00          */ PUSH 71
    /* 00110A 00 00          */ PUSH 0
    /* 00110C 99 80          */ SYSCALL 0x69 ; sce_sound_effect / sce_sound_effect (2 arg(s))
    /* 00110E 00 C0          */ EXPR.END

msg_30:
    /* 001110 14 5A 0D       */ sce_message_nc message_30
    /* 001113 01             */ CALC
    /* 001114 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 001116 00 C0          */ EXPR.END
    /* 001118 01             */ CALC
    /* 001119 0D 00          */ PUSH 13
    /* 00111B 8D 80          */ SYSCALL 0x5D ; sce_get_class / sce_get_class (1 arg(s))
    /* 00111D 00 C0          */ EXPR.END
    /* 00111F 01             */ CALC
    /* 001120 03 00          */ PUSH 3
    /* 001122 86 80          */ SYSCALL 0x56 ; sce_special_event / sce_special_event (1 arg(s))
    /* 001124 00 C0          */ EXPR.END

msg_31:
    /* 001126 13 E0 0D       */ sce_message_sys message_31
    /* 001129 04 5C 0F       */ JMP lab_F5C
  lab_F38:
    /* 00112C 01             */ CALC
    /* 00112D 7C 00          */ PUSH 124
    /* 00112F 01 00          */ PUSH 1
    /* 001131 59 80          */ SYSCALL 0x29 ; sce_get_item / sce_get_item (2 arg(s))
    /* 001133 00 C0          */ EXPR.END
    /* 001135 01             */ CALC
    /* 001136 56 00          */ PUSH 86
    /* 001138 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 00113A 00 C0          */ EXPR.END

msg_32:
    /* 00113C 14 0A 0E       */ sce_message_nc message_32
    /* 00113F 01             */ CALC
    /* 001140 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 001142 00 C0          */ EXPR.END
    /* 001144 01             */ CALC
    /* 001145 47 00          */ PUSH 71
    /* 001147 00 00          */ PUSH 0
    /* 001149 99 80          */ SYSCALL 0x69 ; sce_sound_effect / sce_sound_effect (2 arg(s))
    /* 00114B 00 C0          */ EXPR.END

msg_33:
    /* 00114D 11 86 0E       */ sce_message message_33
  lab_F5C:
    /* 001150 04 62 0F       */ JMP lab_F62

msg_34:
    /* 001153 11 D4 0E       */ sce_message message_34
  lab_F62:
    /* 001156 01             */ CALC
    /* 001157 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 001159 00 C0          */ EXPR.END
    /* 00115B 01             */ CALC
    /* 00115C 80 80          */ SYSCALL 0x50 ; sce_finish_demo / sce_finish_demo (0 arg(s))
    /* 00115E 00 C0          */ EXPR.END
    /* 001160 00             */ EXIT

msg_35:
    /* 001161 11 24 0F       */ sce_message message_35
    /* 001164 01             */ CALC
    /* 001165 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 001167 00 C0          */ EXPR.END
    /* 001169 01             */ CALC
    /* 00116A 00 10 02       */ PUSH 512
    /* 00116D 9F 80          */ SYSCALL 0x6F ; sce_music_tempo / sce_music_tempo (1 arg(s))
    /* 00116F 00 C0          */ EXPR.END
    /* 001171 00             */ EXIT

msg_36:
    /* 001172 11 B4 0F       */ sce_message message_36
    /* 001175 01             */ CALC
    /* 001176 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 001178 00 C0          */ EXPR.END
    /* 00117A 01             */ CALC
    /* 00117B 00 10 01       */ PUSH 256
    /* 00117E 9F 80          */ SYSCALL 0x6F ; sce_music_tempo / sce_music_tempo (1 arg(s))
    /* 001180 00 C0          */ EXPR.END
    /* 001182 00             */ EXIT

msg_37:
    /* 001183 11 32 10       */ sce_message message_37
    /* 001186 00             */ EXIT

intr_20:
    /* 001187 01             */ CALC
    /* 001188 E3 10 00       */ PUSH 227
    /* 00118B 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 00118D 00 C0          */ EXPR.END
    /* 00118F 05 A4 0F       */ JZ msg_39

msg_38:
    /* 001192 11 B8 10       */ sce_message message_38
    /* 001195 04 A7 0F       */ JMP lab_FA7

msg_39:
    /* 001198 11 74 11       */ sce_message message_39
  lab_FA7:
    /* 00119B 00             */ EXIT

msg_40:
    /* 00119C 11 2A 14       */ sce_message message_40
    /* 00119F 00             */ EXIT

msg_41:
    /* 0011A0 11 D2 14       */ sce_message message_41
    /* 0011A3 00             */ EXIT

msg_42:
    /* 0011A4 11 5C 15       */ sce_message message_42
    /* 0011A7 00             */ EXIT

msg_43:
    /* 0011A8 11 CE 15       */ sce_message message_43
    /* 0011AB 00             */ EXIT

msg_44:
    /* 0011AC 14 F4 15       */ sce_message_nc message_44
    /* 0011AF 01             */ CALC
    /* 0011B0 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 0011B2 00 C0          */ EXPR.END
    /* 0011B4 01             */ CALC
    /* 0011B5 06 00          */ PUSH 6
    /* 0011B7 6E 80          */ SYSCALL 0x3E ; sce_rand / sce_rand (1 arg(s))
    /* 0011B9 00 C0          */ EXPR.END
    /* 0011BB 04 CD 0F       */ JMP lab_DD9
    /* 0011BE 04 D9 0F       */ JMP msg_45
  lab_DD9:
    /* 0011C1 07             */ CALC.EXT
    /* 0011C2 FF FF          */ EXPR.POP
    /* 0011C4 00 00          */ PUSH 0
    /* 0011C6 14 C0          */ EXPR.EQUALS
    /* 0011C8 00 C0          */ EXPR.END
    /* 0011CA 05 E2 0F       */ JZ lab_FE2

msg_45:
    /* 0011CD 11 4A 16       */ sce_message message_45
    /* 0011D0 04 4B 10       */ JMP lab_104B
    /* 0011D3 04 EE 0F       */ JMP msg_46
  lab_FE2:
    /* 0011D6 07             */ CALC.EXT
    /* 0011D7 FF FF          */ EXPR.POP
    /* 0011D9 01 00          */ PUSH 1
    /* 0011DB 14 C0          */ EXPR.EQUALS
    /* 0011DD 00 C0          */ EXPR.END
    /* 0011DF 05 F7 0F       */ JZ lab_FF7

msg_46:
    /* 0011E2 11 82 16       */ sce_message message_46
    /* 0011E5 04 4B 10       */ JMP lab_104B
    /* 0011E8 04 03 10       */ JMP msg_47
  lab_FF7:
    /* 0011EB 07             */ CALC.EXT
    /* 0011EC FF FF          */ EXPR.POP
    /* 0011EE 02 00          */ PUSH 2
    /* 0011F0 14 C0          */ EXPR.EQUALS
    /* 0011F2 00 C0          */ EXPR.END
    /* 0011F4 05 0C 10       */ JZ lab_100C

msg_47:
    /* 0011F7 11 BA 16       */ sce_message message_47
    /* 0011FA 04 4B 10       */ JMP lab_104B
    /* 0011FD 04 18 10       */ JMP msg_48
  lab_100C:
    /* 001200 07             */ CALC.EXT
    /* 001201 FF FF          */ EXPR.POP
    /* 001203 03 00          */ PUSH 3
    /* 001205 14 C0          */ EXPR.EQUALS
    /* 001207 00 C0          */ EXPR.END
    /* 001209 05 21 10       */ JZ lab_1021

msg_48:
    /* 00120C 11 02 17       */ sce_message message_48
    /* 00120F 04 4B 10       */ JMP lab_104B
    /* 001212 04 2D 10       */ JMP msg_49
  lab_1021:
    /* 001215 07             */ CALC.EXT
    /* 001216 FF FF          */ EXPR.POP
    /* 001218 04 00          */ PUSH 4
    /* 00121A 14 C0          */ EXPR.EQUALS
    /* 00121C 00 C0          */ EXPR.END
    /* 00121E 05 36 10       */ JZ lab_1036

msg_49:
    /* 001221 11 3E 17       */ sce_message message_49
    /* 001224 04 4B 10       */ JMP lab_104B
    /* 001227 04 42 10       */ JMP msg_50
  lab_1036:
    /* 00122A 07             */ CALC.EXT
    /* 00122B FF FF          */ EXPR.POP
    /* 00122D 05 00          */ PUSH 5
    /* 00122F 14 C0          */ EXPR.EQUALS
    /* 001231 00 C0          */ EXPR.END
    /* 001233 05 4B 10       */ JZ lab_104B

msg_50:
    /* 001236 11 76 17       */ sce_message message_50
    /* 001239 04 4B 10       */ JMP lab_104B
    /* 00123C 04 4B 10       */ JMP lab_104B
  lab_104B:
    /* 00123F 00             */ EXIT

msg_51:
    /* 001240 11 B4 17       */ sce_message message_51
    /* 001243 00             */ EXIT

msg_52:
    /* 001244 11 D2 17       */ sce_message message_52
    /* 001247 00             */ EXIT

msg_53:
    /* 001248 11 0A 18       */ sce_message message_53
    /* 00124B 00             */ EXIT

msg_54:
    /* 00124C 11 26 18       */ sce_message message_54
    /* 00124F 00             */ EXIT

msg_55:
    /* 001250 11 50 18       */ sce_message message_55
    /* 001253 00             */ EXIT

msg_56:
    /* 001254 14 92 18       */ sce_message_nc message_56
    /* 001257 01             */ CALC
    /* 001258 1B 00          */ PUSH 27
    /* 00125A 5E 80          */ SYSCALL 0x2E ; sce_check_spell / sce_check_spell (1 arg(s))
    /* 00125C 00 C0          */ EXPR.END
    /* 00125E 05 73 10       */ JZ msg_58

msg_57:
    /* 001261 11 EC 18       */ sce_message message_57
    /* 001264 04 BA 10       */ JMP lab_10BA

msg_58:
    /* 001267 14 2E 19       */ sce_message_nc message_58
    /* 00126A 01             */ CALC
    /* 00126B 00 00          */ PUSH 0
    /* 00126D 00 00          */ PUSH 0
    /* 00126F 6B 80          */ SYSCALL 0x3B ; sce_menu / sce_menu (2 arg(s))
    /* 001271 01 00          */ PUSH 1
    /* 001273 15 C0          */ EXPR.NOT_EQUALS
    /* 001275 00 C0          */ EXPR.END
    /* 001277 05 8C 10       */ JZ lab_108C

msg_59:
    /* 00127A 11 AA 19       */ sce_message message_59
    /* 00127D 04 BA 10       */ JMP lab_10BA
  lab_108C:
    /* 001280 01             */ CALC
    /* 001281 20 60          */ PUSH.VAR 24608
    /* 001283 50 10 46       */ PUSH 18000
    /* 001286 11 C0          */ EXPR.LESS_THAN
    /* 001288 00 C0          */ EXPR.END
    /* 00128A 05 9F 10       */ JZ lab_109F

msg_60:
    /* 00128D 11 CC 19       */ sce_message message_60
    /* 001290 04 BA 10       */ JMP lab_10BA
  lab_109F:
    /* 001293 01             */ CALC
    /* 001294 0B 00          */ PUSH 11
    /* 001296 86 80          */ SYSCALL 0x56 ; sce_special_event / sce_special_event (1 arg(s))
    /* 001298 00 C0          */ EXPR.END

msg_61:
    /* 00129A 11 E6 19       */ sce_message message_61
    /* 00129D 01             */ CALC
    /* 00129E 1B 00          */ PUSH 27
    /* 0012A0 5D 80          */ SYSCALL 0x2D ; sce_get_spell / sce_get_spell (1 arg(s))
    /* 0012A2 00 C0          */ EXPR.END
    /* 0012A4 01             */ CALC
    /* 0012A5 20 60          */ PUSH.VAR 24608
    /* 0012A7 50 10 46       */ PUSH 18000
    /* 0012AA 20 C0          */ EXPR.SELF_SUB
    /* 0012AC 00 C0          */ EXPR.END
  lab_10BA:
    /* 0012AE 00             */ EXIT

msg_62:
    /* 0012AF 14 1E 1A       */ sce_message_nc message_62
    /* 0012B2 01             */ CALC
    /* 0012B3 00 00          */ PUSH 0
    /* 0012B5 00 00          */ PUSH 0
    /* 0012B7 6B 80          */ SYSCALL 0x3B ; sce_menu / sce_menu (2 arg(s))
    /* 0012B9 01 00          */ PUSH 1
    /* 0012BB 15 C0          */ EXPR.NOT_EQUALS
    /* 0012BD 00 C0          */ EXPR.END
    /* 0012BF 05 D4 10       */ JZ msg_64

msg_63:
    /* 0012C2 11 46 1A       */ sce_message message_63
    /* 0012C5 04 D7 10       */ JMP lab_EE3

msg_64:
    /* 0012C8 11 5C 1A       */ sce_message message_64
  lab_EE3:
    /* 0012CB 00             */ EXIT

msg_65:
    /* 0012CC 11 A2 1B       */ sce_message message_65
    /* 0012CF 00             */ EXIT

intr_34:
    /* 0012D0 01             */ CALC
    /* 0012D1 4C 60          */ PUSH.VAR 24652
    /* 0012D3 03 00          */ PUSH 3
    /* 0012D5 14 C0          */ EXPR.EQUALS
    /* 0012D7 00 C0          */ EXPR.END
    /* 0012D9 05 EE 10       */ JZ msg_67

msg_66:
    /* 0012DC 11 3A 1C       */ sce_message message_66
    /* 0012DF 04 F1 10       */ JMP lab_10F1

msg_67:
    /* 0012E2 11 80 1C       */ sce_message message_67
  lab_10F1:
    /* 0012E5 00             */ EXIT

intr_35:
    /* 0012E6 01             */ CALC
    /* 0012E7 4C 60          */ PUSH.VAR 24652
    /* 0012E9 03 00          */ PUSH 3
    /* 0012EB 14 C0          */ EXPR.EQUALS
    /* 0012ED 00 C0          */ EXPR.END
    /* 0012EF 05 04 11       */ JZ msg_69

msg_68:
    /* 0012F2 11 A2 1C       */ sce_message message_68
    /* 0012F5 04 07 11       */ JMP lab_1107

msg_69:
    /* 0012F8 11 D8 1C       */ sce_message message_69
  lab_1107:
    /* 0012FB 00             */ EXIT

msg_70:
    /* 0012FC 11 26 1D       */ sce_message message_70
    /* 0012FF 00             */ EXIT

msg_71:
    /* 001300 11 EE 1D       */ sce_message message_71
    /* 001303 00             */ EXIT

intr_38:
    /* 001304 01             */ CALC
    /* 001305 7F 80          */ SYSCALL 0x4F ; sce_start_demo / sce_start_demo (0 arg(s))
    /* 001307 00 C0          */ EXPR.END
    /* 001309 01             */ CALC
    /* 00130A 8C 10 03       */ PUSH 908
    /* 00130D 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 00130F 00 00          */ PUSH 0
    /* 001311 14 C0          */ EXPR.EQUALS
    /* 001313 00 C0          */ EXPR.END
    /* 001315 05 37 11       */ JZ msg_73
    /* 001318 01             */ CALC
    /* 001319 8C 10 03       */ PUSH 908
    /* 00131C 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 00131E 00 C0          */ EXPR.END

msg_72:
    /* 001320 14 1C 20       */ sce_message_nc message_72
    /* 001323 01             */ CALC
    /* 001324 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 001326 00 C0          */ EXPR.END
    /* 001328 04 37 11       */ JMP msg_73

msg_73:
    /* 00132B 14 86 20       */ sce_message_nc message_73
    /* 00132E 01             */ CALC
    /* 00132F 00 00          */ PUSH 0
    /* 001331 00 00          */ PUSH 0
    /* 001333 6B 80          */ SYSCALL 0x3B ; sce_menu / sce_menu (2 arg(s))
    /* 001335 01 00          */ PUSH 1
    /* 001337 14 C0          */ EXPR.EQUALS
    /* 001339 00 C0          */ EXPR.END
    /* 00133B 05 50 11       */ JZ msg_74
    /* 00133E 02 59 11       */ CALL msg_75
    /* 001341 04 53 11       */ JMP lab_F5F

msg_74:
    /* 001344 11 1E 21       */ sce_message message_74
  lab_F5F:
    /* 001347 01             */ CALC
    /* 001348 80 80          */ SYSCALL 0x50 ; sce_finish_demo / sce_finish_demo (0 arg(s))
    /* 00134A 00 C0          */ EXPR.END
    /* 00134C 00             */ EXIT

msg_75:
    /* 00134D 14 56 21       */ sce_message_nc message_75
    /* 001350 01             */ CALC
    /* 001351 F8 50          */ PUSH.VAR 20728
    /* 001353 00 00          */ PUSH 0
    /* 001355 00 00          */ PUSH 0
    /* 001357 6B 80          */ SYSCALL 0x3B ; sce_menu / sce_menu (2 arg(s))
    /* 001359 1B C0          */ EXPR.ASSIGN
    /* 00135B 00 C0          */ EXPR.END
  lab_1169:
    /* 00135D 01             */ CALC
    /* 00135E F8 50          */ PUSH.VAR 20728
    /* 001360 01 00          */ PUSH 1
    /* 001362 14 C0          */ EXPR.EQUALS
    /* 001364 00 C0          */ EXPR.END
    /* 001366 05 8B 11       */ JZ msg_77
    /* 001369 02 34 14       */ CALL func_1434

msg_76:
    /* 00136C 14 76 21       */ sce_message_nc message_76
    /* 00136F 01             */ CALC
    /* 001370 F8 50          */ PUSH.VAR 20728
    /* 001372 00 00          */ PUSH 0
    /* 001374 00 00          */ PUSH 0
    /* 001376 6B 80          */ SYSCALL 0x3B ; sce_menu / sce_menu (2 arg(s))
    /* 001378 1B C0          */ EXPR.ASSIGN
    /* 00137A 00 C0          */ EXPR.END
    /* 00137C 04 69 11       */ JMP lab_1169

msg_77:
    /* 00137F 11 32 23       */ sce_message message_77
    /* 001382 01             */ CALC
    /* 001383 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 001385 00 C0          */ EXPR.END
    /* 001387 01             */ CALC
    /* 001388 22 10 FC       */ PUSH 64546
    /* 00138B 0D 00          */ PUSH 13
    /* 00138D 00 00          */ PUSH 0
    /* 00138F 00 00          */ PUSH 0
    /* 001391 00 00          */ PUSH 0
    /* 001393 0D 00          */ PUSH 13
    /* 001395 00 00          */ PUSH 0
    /* 001397 00 00          */ PUSH 0
    /* 001399 45 00          */ PUSH 69
    /* 00139B 02 00          */ PUSH 2
    /* 00139D 5A 00          */ PUSH 90
    /* 00139F 00 00          */ PUSH 0
    /* 0013A1 00 00          */ PUSH 0
    /* 0013A3 00 00          */ PUSH 0
    /* 0013A5 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 0013A7 00 C0          */ EXPR.END
    /* 0013A9 01             */ CALC
    /* 0013AA 63 00          */ PUSH 99
    /* 0013AC 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0013AE 00 C0          */ EXPR.END
    /* 0013B0 01             */ CALC
    /* 0013B1 22 10 FC       */ PUSH 64546
    /* 0013B4 0D 00          */ PUSH 13
    /* 0013B6 00 00          */ PUSH 0
    /* 0013B8 00 00          */ PUSH 0
    /* 0013BA 00 00          */ PUSH 0
    /* 0013BC 0D 00          */ PUSH 13
    /* 0013BE 00 00          */ PUSH 0
    /* 0013C0 00 00          */ PUSH 0
    /* 0013C2 45 00          */ PUSH 69
    /* 0013C4 01 00          */ PUSH 1
    /* 0013C6 3C 00          */ PUSH 60
    /* 0013C8 00 00          */ PUSH 0
    /* 0013CA 00 00          */ PUSH 0
    /* 0013CC 00 00          */ PUSH 0
    /* 0013CE 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 0013D0 00 C0          */ EXPR.END
    /* 0013D2 01             */ CALC
    /* 0013D3 28 51          */ PUSH.VAR 20776
    /* 0013D5 00 00          */ PUSH 0
    /* 0013D7 1B C0          */ EXPR.ASSIGN
    /* 0013D9 00 C0          */ EXPR.END
    /* 0013DB 01             */ CALC
    /* 0013DC 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 0013DE 00 C0          */ EXPR.END
    /* 0013E0 01             */ CALC
    /* 0013E1 04 51          */ PUSH.VAR 20740
    /* 0013E3 00 00          */ PUSH 0
    /* 0013E5 1B C0          */ EXPR.ASSIGN
    /* 0013E7 00 C0          */ EXPR.END
  lab_11F5:
    /* 0013E9 01             */ CALC
    /* 0013EA 04 51          */ PUSH.VAR 20740
    /* 0013EC 08 00          */ PUSH 8
    /* 0013EE 11 C0          */ EXPR.LESS_THAN
    /* 0013F0 00 C0          */ EXPR.END
    /* 0013F2 05 1F 12       */ JZ lab_121F
    /* 0013F5 01             */ CALC
    /* 0013F6 2A 51          */ PUSH.VAR 20778
    /* 0013F8 02 00          */ PUSH 2
    /* 0013FA 21 C0          */ EXPR.SELF_SHIFT_LEFT
    /* 0013FC 00 C0          */ EXPR.END
    /* 0013FE 01             */ CALC
    /* 0013FF 2A 51          */ PUSH.VAR 20778
    /* 001401 04 00          */ PUSH 4
    /* 001403 6E 80          */ SYSCALL 0x3E ; sce_rand / sce_rand (1 arg(s))
    /* 001405 25 C0          */ EXPR.SELF_BIT_OR
    /* 001407 00 C0          */ EXPR.END
    /* 001409 01             */ CALC
    /* 00140A 04 51          */ PUSH.VAR 20740
    /* 00140C 01 C0          */ EXPR.POST_INC
    /* 00140E 00 C0          */ EXPR.END
    /* 001410 04 F5 11       */ JMP lab_11F5
  lab_121F:
    /* 001413 01             */ CALC
    /* 001414 2C 60          */ PUSH.VAR 24620
    /* 001416 0F 10 27       */ PUSH 9999
    /* 001419 1B C0          */ EXPR.ASSIGN
    /* 00141B 00 C0          */ EXPR.END

msg_78:
    /* 00141D 14 56 23       */ sce_message_nc message_78
    /* 001420 01             */ CALC
    /* 001421 3C 00          */ PUSH 60
    /* 001423 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001425 00 C0          */ EXPR.END
    /* 001427 01             */ CALC
    /* 001428 E5 10 00       */ PUSH 229
    /* 00142B 2B 00          */ PUSH 43
    /* 00142D FF 00          */ PUSH 255
    /* 00142F FF 00          */ PUSH 255
    /* 001431 00 00          */ PUSH 0
    /* 001433 5C 00          */ PUSH 92
    /* 001435 00 00          */ PUSH 0
    /* 001437 00 00          */ PUSH 0
    /* 001439 00 00          */ PUSH 0
    /* 00143B 00 00          */ PUSH 0
    /* 00143D 00 00          */ PUSH 0
    /* 00143F 00 00          */ PUSH 0
    /* 001441 00 00          */ PUSH 0
    /* 001443 00 00          */ PUSH 0
    /* 001445 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001447 00 C0          */ EXPR.END
    /* 001449 01             */ CALC
    /* 00144A B4 10 00       */ PUSH 180
    /* 00144D 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 00144F 00 C0          */ EXPR.END
    /* 001451 01             */ CALC
    /* 001452 33 80          */ SYSCALL 0x03 ; sce_close_window / sce_close_window (0 arg(s))
    /* 001454 00 C0          */ EXPR.END
    /* 001456 01             */ CALC
    /* 001457 2C 60          */ PUSH.VAR 24620
    /* 001459 00 00          */ PUSH 0
    /* 00145B 1B C0          */ EXPR.ASSIGN
    /* 00145D 00 C0          */ EXPR.END
    /* 00145F 01             */ CALC
    /* 001460 04 51          */ PUSH.VAR 20740
    /* 001462 1A 51          */ PUSH.VAR 20762
    /* 001464 00 00          */ PUSH 0
    /* 001466 1B C0          */ EXPR.ASSIGN
    /* 001468 1B C0          */ EXPR.ASSIGN
    /* 00146A 00 C0          */ EXPR.END
  lab_1278:
    /* 00146C 01             */ CALC
    /* 00146D 04 51          */ PUSH.VAR 20740
    /* 00146F 08 00          */ PUSH 8
    /* 001471 11 C0          */ EXPR.LESS_THAN
    /* 001473 1A 51          */ PUSH.VAR 20762
    /* 001475 58 10 02       */ PUSH 600
    /* 001478 11 C0          */ EXPR.LESS_THAN
    /* 00147A 19 C0          */ EXPR.LOG_AND
    /* 00147C 00 C0          */ EXPR.END
    /* 00147E 05 E6 13       */ JZ lab_13E6
    /* 001481 01             */ CALC
    /* 001482 A6 80          */ SYSCALL 0x76 ; sce_pad_new / sce_pad_new (0 arg(s))
    /* 001484 00 C0          */ EXPR.END
    /* 001486 04 98 12       */ JMP lab_1298
    /* 001489 04 A5 12       */ JMP lab_12A5
  lab_1298:
    /* 00148C 07             */ CALC.EXT
    /* 00148D FF FF          */ EXPR.POP
    /* 00148F 00 10 10       */ PUSH 4096
    /* 001492 14 C0          */ EXPR.EQUALS
    /* 001494 00 C0          */ EXPR.END
    /* 001496 05 E6 12       */ JZ intr_35
  lab_12A5:
    /* 001499 01             */ CALC
    /* 00149A 19 10 FC       */ PUSH 64537
    /* 00149D 0D 00          */ PUSH 13
    /* 00149F 00 00          */ PUSH 0
    /* 0014A1 00 00          */ PUSH 0
    /* 0014A3 00 00          */ PUSH 0
    /* 0014A5 0D 00          */ PUSH 13
    /* 0014A7 00 00          */ PUSH 0
    /* 0014A9 00 00          */ PUSH 0
    /* 0014AB 00 00          */ PUSH 0
    /* 0014AD 03 00          */ PUSH 3
    /* 0014AF 0A 00          */ PUSH 10
    /* 0014B1 00 00          */ PUSH 0
    /* 0014B3 00 00          */ PUSH 0
    /* 0014B5 00 00          */ PUSH 0
    /* 0014B7 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 0014B9 00 C0          */ EXPR.END
    /* 0014BB 01             */ CALC
    /* 0014BC 28 51          */ PUSH.VAR 20776
    /* 0014BE 02 00          */ PUSH 2
    /* 0014C0 21 C0          */ EXPR.SELF_SHIFT_LEFT
    /* 0014C2 00 C0          */ EXPR.END
    /* 0014C4 01             */ CALC
    /* 0014C5 28 51          */ PUSH.VAR 20776
    /* 0014C7 03 00          */ PUSH 3
    /* 0014C9 25 C0          */ EXPR.SELF_BIT_OR
    /* 0014CB 00 C0          */ EXPR.END
    /* 0014CD 01             */ CALC
    /* 0014CE 04 51          */ PUSH.VAR 20740
    /* 0014D0 01 C0          */ EXPR.POST_INC
    /* 0014D2 00 C0          */ EXPR.END
    /* 0014D4 04 D5 13       */ JMP lab_13D5
    /* 0014D7 04 F3 12       */ JMP lab_12F3

intr_35:
    /* 0014DA 07             */ CALC.EXT
    /* 0014DB FF FF          */ EXPR.POP
    /* 0014DD 00 10 40       */ PUSH 16384
    /* 0014E0 14 C0          */ EXPR.EQUALS
    /* 0014E2 00 C0          */ EXPR.END
    /* 0014E4 05 34 13       */ JZ lab_1334
  lab_12F3:
    /* 0014E7 01             */ CALC
    /* 0014E8 19 10 FC       */ PUSH 64537
    /* 0014EB 0D 00          */ PUSH 13
    /* 0014ED 00 00          */ PUSH 0
    /* 0014EF 00 00          */ PUSH 0
    /* 0014F1 00 00          */ PUSH 0
    /* 0014F3 0D 00          */ PUSH 13
    /* 0014F5 00 00          */ PUSH 0
    /* 0014F7 00 00          */ PUSH 0
    /* 0014F9 00 00          */ PUSH 0
    /* 0014FB 01 00          */ PUSH 1
    /* 0014FD 0A 00          */ PUSH 10
    /* 0014FF 00 00          */ PUSH 0
    /* 001501 00 00          */ PUSH 0
    /* 001503 00 00          */ PUSH 0
    /* 001505 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001507 00 C0          */ EXPR.END
    /* 001509 01             */ CALC
    /* 00150A 28 51          */ PUSH.VAR 20776
    /* 00150C 02 00          */ PUSH 2
    /* 00150E 21 C0          */ EXPR.SELF_SHIFT_LEFT
    /* 001510 00 C0          */ EXPR.END
    /* 001512 01             */ CALC
    /* 001513 28 51          */ PUSH.VAR 20776
    /* 001515 01 00          */ PUSH 1
    /* 001517 25 C0          */ EXPR.SELF_BIT_OR
    /* 001519 00 C0          */ EXPR.END
    /* 00151B 01             */ CALC
    /* 00151C 04 51          */ PUSH.VAR 20740
    /* 00151E 01 C0          */ EXPR.POST_INC
    /* 001520 00 C0          */ EXPR.END
    /* 001522 04 D5 13       */ JMP lab_13D5
    /* 001525 04 43 13       */ JMP lab_1343
  lab_1334:
    /* 001528 07             */ CALC.EXT
    /* 001529 FF FF          */ EXPR.POP
    /* 00152B 00 20 80 00 00 */ PUSH 32768
    /* 001530 14 C0          */ EXPR.EQUALS
    /* 001532 00 C0          */ EXPR.END
    /* 001534 05 84 13       */ JZ lab_1384
  lab_1343:
    /* 001537 01             */ CALC
    /* 001538 19 10 FC       */ PUSH 64537
    /* 00153B 0D 00          */ PUSH 13
    /* 00153D 00 00          */ PUSH 0
    /* 00153F 00 00          */ PUSH 0
    /* 001541 00 00          */ PUSH 0
    /* 001543 0D 00          */ PUSH 13
    /* 001545 00 00          */ PUSH 0
    /* 001547 00 00          */ PUSH 0
    /* 001549 00 00          */ PUSH 0
    /* 00154B 02 00          */ PUSH 2
    /* 00154D 0A 00          */ PUSH 10
    /* 00154F 00 00          */ PUSH 0
    /* 001551 00 00          */ PUSH 0
    /* 001553 00 00          */ PUSH 0
    /* 001555 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001557 00 C0          */ EXPR.END
    /* 001559 01             */ CALC
    /* 00155A 28 51          */ PUSH.VAR 20776
    /* 00155C 02 00          */ PUSH 2
    /* 00155E 21 C0          */ EXPR.SELF_SHIFT_LEFT
    /* 001560 00 C0          */ EXPR.END
    /* 001562 01             */ CALC
    /* 001563 28 51          */ PUSH.VAR 20776
    /* 001565 02 00          */ PUSH 2
    /* 001567 25 C0          */ EXPR.SELF_BIT_OR
    /* 001569 00 C0          */ EXPR.END
    /* 00156B 01             */ CALC
    /* 00156C 04 51          */ PUSH.VAR 20740
    /* 00156E 01 C0          */ EXPR.POST_INC
    /* 001570 00 C0          */ EXPR.END
    /* 001572 04 D5 13       */ JMP lab_13D5
    /* 001575 04 91 13       */ JMP lab_1391
  lab_1384:
    /* 001578 07             */ CALC.EXT
    /* 001579 FF FF          */ EXPR.POP
    /* 00157B 00 10 20       */ PUSH 8192
    /* 00157E 14 C0          */ EXPR.EQUALS
    /* 001580 00 C0          */ EXPR.END
    /* 001582 05 D2 13       */ JZ lab_13D2
  lab_1391:
    /* 001585 01             */ CALC
    /* 001586 19 10 FC       */ PUSH 64537
    /* 001589 0D 00          */ PUSH 13
    /* 00158B 00 00          */ PUSH 0
    /* 00158D 00 00          */ PUSH 0
    /* 00158F 00 00          */ PUSH 0
    /* 001591 0D 00          */ PUSH 13
    /* 001593 00 00          */ PUSH 0
    /* 001595 00 00          */ PUSH 0
    /* 001597 00 00          */ PUSH 0
    /* 001599 00 00          */ PUSH 0
    /* 00159B 0A 00          */ PUSH 10
    /* 00159D 00 00          */ PUSH 0
    /* 00159F 00 00          */ PUSH 0
    /* 0015A1 00 00          */ PUSH 0
    /* 0015A3 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 0015A5 00 C0          */ EXPR.END
    /* 0015A7 01             */ CALC
    /* 0015A8 28 51          */ PUSH.VAR 20776
    /* 0015AA 02 00          */ PUSH 2
    /* 0015AC 21 C0          */ EXPR.SELF_SHIFT_LEFT
    /* 0015AE 00 C0          */ EXPR.END
    /* 0015B0 01             */ CALC
    /* 0015B1 28 51          */ PUSH.VAR 20776
    /* 0015B3 00 00          */ PUSH 0
    /* 0015B5 25 C0          */ EXPR.SELF_BIT_OR
    /* 0015B7 00 C0          */ EXPR.END
    /* 0015B9 01             */ CALC
    /* 0015BA 04 51          */ PUSH.VAR 20740
    /* 0015BC 01 C0          */ EXPR.POST_INC
    /* 0015BE 00 C0          */ EXPR.END
    /* 0015C0 04 D5 13       */ JMP lab_13D5
  lab_13CF:
    /* 0015C3 04 D5 13       */ JMP lab_13D5
  lab_13D2:
    /* 0015C6 04 CF 13       */ JMP lab_13CF
  lab_13D5:
    /* 0015C9 01             */ CALC
    /* 0015CA 01 00          */ PUSH 1
    /* 0015CC 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0015CE 00 C0          */ EXPR.END
    /* 0015D0 01             */ CALC
    /* 0015D1 1A 51          */ PUSH.VAR 20762
    /* 0015D3 01 C0          */ EXPR.POST_INC
    /* 0015D5 00 C0          */ EXPR.END
    /* 0015D7 04 78 12       */ JMP lab_1278
  lab_13E6:
    /* 0015DA 01             */ CALC
    /* 0015DB 28 51          */ PUSH.VAR 20776
    /* 0015DD 10 00          */ PUSH 16
    /* 0015DF 02 00          */ PUSH 2
    /* 0015E1 04 51          */ PUSH.VAR 20740
    /* 0015E3 09 C0          */ EXPR.MUL
    /* 0015E5 0D C0          */ EXPR.SUB
    /* 0015E7 21 C0          */ EXPR.SELF_SHIFT_LEFT
    /* 0015E9 00 C0          */ EXPR.END
    /* 0015EB 01             */ CALC
    /* 0015EC 1A 51          */ PUSH.VAR 20762
    /* 0015EE 57 10 02       */ PUSH 599
    /* 0015F1 10 C0          */ EXPR.GREATER_THAN
    /* 0015F3 00 C0          */ EXPR.END
    /* 0015F5 05 0A 14       */ JZ lab_140A

msg_79:
    /* 0015F8 11 1E 24       */ sce_message message_79
    /* 0015FB 04 33 14       */ JMP lab_1433
  lab_140A:
    /* 0015FE 01             */ CALC
    /* 0015FF 28 51          */ PUSH.VAR 20776
    /* 001601 2A 51          */ PUSH.VAR 20778
    /* 001603 14 C0          */ EXPR.EQUALS
    /* 001605 04 51          */ PUSH.VAR 20740
    /* 001607 08 00          */ PUSH 8
    /* 001609 14 C0          */ EXPR.EQUALS
    /* 00160B 19 C0          */ EXPR.LOG_AND
    /* 00160D 00 C0          */ EXPR.END
    /* 00160F 05 2A 14       */ JZ msg_81

msg_80:
    /* 001612 14 42 24       */ sce_message_nc message_80
    /* 001615 02 68 14       */ CALL func_1468
    /* 001618 02 76 14       */ CALL func_1476
    /* 00161B 04 33 14       */ JMP lab_1433

msg_81:
    /* 00161E 14 60 24       */ sce_message_nc message_81
    /* 001621 02 68 14       */ CALL func_1468

msg_82:
    /* 001624 11 7A 24       */ sce_message message_82
  lab_1433:
    /* 001627 03             */ RETURN

func_1434:
    /* 001628 01             */ CALC
    /* 001629 04 51          */ PUSH.VAR 20740
    /* 00162B 00 00          */ PUSH 0
    /* 00162D 1B C0          */ EXPR.ASSIGN
    /* 00162F 00 C0          */ EXPR.END
  lab_143D:
    /* 001631 01             */ CALC
    /* 001632 04 51          */ PUSH.VAR 20740
    /* 001634 08 00          */ PUSH 8
    /* 001636 11 C0          */ EXPR.LESS_THAN
    /* 001638 00 C0          */ EXPR.END
    /* 00163A 05 67 14       */ JZ lab_1467
    /* 00163D 01             */ CALC
    /* 00163E 2A 51          */ PUSH.VAR 20778
    /* 001640 02 00          */ PUSH 2
    /* 001642 21 C0          */ EXPR.SELF_SHIFT_LEFT
    /* 001644 00 C0          */ EXPR.END
    /* 001646 01             */ CALC
    /* 001647 2A 51          */ PUSH.VAR 20778
    /* 001649 04 00          */ PUSH 4
    /* 00164B 6E 80          */ SYSCALL 0x3E ; sce_rand / sce_rand (1 arg(s))
    /* 00164D 25 C0          */ EXPR.SELF_BIT_OR
    /* 00164F 00 C0          */ EXPR.END
    /* 001651 01             */ CALC
    /* 001652 04 51          */ PUSH.VAR 20740
    /* 001654 01 C0          */ EXPR.POST_INC
    /* 001656 00 C0          */ EXPR.END
    /* 001658 04 3D 14       */ JMP lab_143D
  lab_1467:
    /* 00165B 03             */ RETURN

func_1468:
    /* 00165C 01             */ CALC
    /* 00165D 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 00165F 00 C0          */ EXPR.END

msg_83:
    /* 001661 14 9A 24       */ sce_message_nc message_83
    /* 001664 01             */ CALC
    /* 001665 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 001667 00 C0          */ EXPR.END
    /* 001669 03             */ RETURN

func_1476:
    /* 00166A 01             */ CALC
    /* 00166B 1A 51          */ PUSH.VAR 20762
    /* 00166D 00 C0          */ EXPR.END
    /* 00166F 04 81 14       */ JMP lab_1481
    /* 001672 04 99 14       */ JMP lab_12A5
  lab_1481:
    /* 001675 07             */ CALC.EXT
    /* 001676 FF FF          */ EXPR.POP
    /* 001678 00 00          */ PUSH 0
    /* 00167A 12 C0          */ EXPR.GREATER_THAN_EQ
    /* 00167C 00 C0          */ EXPR.END
    /* 00167E 05 C8 14       */ JZ lab_14C8
    /* 001681 07             */ CALC.EXT
    /* 001682 FF FF          */ EXPR.POP
    /* 001684 63 00          */ PUSH 99
    /* 001686 13 C0          */ EXPR.LESS_THAN_EQ
    /* 001688 00 C0          */ EXPR.END
    /* 00168A 05 C8 14       */ JZ lab_14C8
  lab_12A5:
    /* 00168D 01             */ CALC
    /* 00168E 89 10 03       */ PUSH 905
    /* 001691 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 001693 00 C0          */ EXPR.END
    /* 001695 05 B0 14       */ JZ lab_14B0
    /* 001698 01             */ CALC
    /* 001699 1A 51          */ PUSH.VAR 20762
    /* 00169B 7D 00          */ PUSH 125
    /* 00169D 1B C0          */ EXPR.ASSIGN
    /* 00169F 00 C0          */ EXPR.END
    /* 0016A1 04 BA 14       */ JMP lab_14BA
  lab_14B0:
    /* 0016A4 01             */ CALC
    /* 0016A5 1A 51          */ PUSH.VAR 20762
    /* 0016A7 21 10 01       */ PUSH 289
    /* 0016AA 1B C0          */ EXPR.ASSIGN
    /* 0016AC 00 C0          */ EXPR.END
  lab_14BA:
    /* 0016AE 01             */ CALC
    /* 0016AF 89 10 03       */ PUSH 905
    /* 0016B2 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 0016B4 00 C0          */ EXPR.END
    /* 0016B6 04 B9 16       */ JMP lab_16B9
    /* 0016B9 04 E1 14       */ JMP lab_14E1
  lab_14C8:
    /* 0016BC 07             */ CALC.EXT
    /* 0016BD FF FF          */ EXPR.POP
    /* 0016BF 64 00          */ PUSH 100
    /* 0016C1 12 C0          */ EXPR.GREATER_THAN_EQ
    /* 0016C3 00 C0          */ EXPR.END
    /* 0016C5 05 26 15       */ JZ lab_1526
    /* 0016C8 07             */ CALC.EXT
    /* 0016C9 FF FF          */ EXPR.POP
    /* 0016CB C7 10 00       */ PUSH 199
    /* 0016CE 13 C0          */ EXPR.LESS_THAN_EQ
    /* 0016D0 00 C0          */ EXPR.END
    /* 0016D2 05 26 15       */ JZ lab_1526
  lab_14E1:
    /* 0016D5 01             */ CALC
    /* 0016D6 8A 10 03       */ PUSH 906
    /* 0016D9 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 0016DB 00 C0          */ EXPR.END
    /* 0016DD 05 0E 15       */ JZ lab_150E
    /* 0016E0 01             */ CALC
    /* 0016E1 03 00          */ PUSH 3
    /* 0016E3 6E 80          */ SYSCALL 0x3E ; sce_rand / sce_rand (1 arg(s))
    /* 0016E5 00 C0          */ EXPR.END
    /* 0016E7 05 02 15       */ JZ lab_1502
    /* 0016EA 01             */ CALC
    /* 0016EB 1A 51          */ PUSH.VAR 20762
    /* 0016ED 7C 00          */ PUSH 124
    /* 0016EF 1B C0          */ EXPR.ASSIGN
    /* 0016F1 00 C0          */ EXPR.END
    /* 0016F3 04 0B 15       */ JMP lab_150B
  lab_1502:
    /* 0016F6 01             */ CALC
    /* 0016F7 1A 51          */ PUSH.VAR 20762
    /* 0016F9 7E 00          */ PUSH 126
    /* 0016FB 1B C0          */ EXPR.ASSIGN
    /* 0016FD 00 C0          */ EXPR.END
  lab_150B:
    /* 0016FF 04 18 15       */ JMP lab_1518
  lab_150E:
    /* 001702 01             */ CALC
    /* 001703 1A 51          */ PUSH.VAR 20762
    /* 001705 2E 10 01       */ PUSH 302
    /* 001708 1B C0          */ EXPR.ASSIGN
    /* 00170A 00 C0          */ EXPR.END
  lab_1518:
    /* 00170C 01             */ CALC
    /* 00170D 8A 10 03       */ PUSH 906
    /* 001710 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 001712 00 C0          */ EXPR.END
    /* 001714 04 B9 16       */ JMP lab_16B9
    /* 001717 04 40 15       */ JMP lab_1540
  lab_1526:
    /* 00171A 07             */ CALC.EXT
    /* 00171B FF FF          */ EXPR.POP
    /* 00171D C8 10 00       */ PUSH 200
    /* 001720 12 C0          */ EXPR.GREATER_THAN_EQ
    /* 001722 00 C0          */ EXPR.END
    /* 001724 05 6F 15       */ JZ lab_156F
    /* 001727 07             */ CALC.EXT
    /* 001728 FF FF          */ EXPR.POP
    /* 00172A 2B 10 01       */ PUSH 299
    /* 00172D 13 C0          */ EXPR.LESS_THAN_EQ
    /* 00172F 00 C0          */ EXPR.END
    /* 001731 05 6F 15       */ JZ lab_156F
  lab_1540:
    /* 001734 01             */ CALC
    /* 001735 8B 10 03       */ PUSH 907
    /* 001738 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 00173A 00 C0          */ EXPR.END
    /* 00173C 05 57 15       */ JZ lab_1557
    /* 00173F 01             */ CALC
    /* 001740 1A 51          */ PUSH.VAR 20762
    /* 001742 7C 00          */ PUSH 124
    /* 001744 1B C0          */ EXPR.ASSIGN
    /* 001746 00 C0          */ EXPR.END
    /* 001748 04 61 15       */ JMP lab_1561
  lab_1557:
    /* 00174B 01             */ CALC
    /* 00174C 1A 51          */ PUSH.VAR 20762
    /* 00174E 3F 10 01       */ PUSH 319
    /* 001751 1B C0          */ EXPR.ASSIGN
    /* 001753 00 C0          */ EXPR.END
  lab_1561:
    /* 001755 01             */ CALC
    /* 001756 8B 10 03       */ PUSH 907
    /* 001759 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 00175B 00 C0          */ EXPR.END
    /* 00175D 04 B9 16       */ JMP lab_16B9
    /* 001760 04 89 15       */ JMP lab_1589
  lab_156F:
    /* 001763 07             */ CALC.EXT
    /* 001764 FF FF          */ EXPR.POP
    /* 001766 2C 10 01       */ PUSH 300
    /* 001769 12 C0          */ EXPR.GREATER_THAN_EQ
    /* 00176B 00 C0          */ EXPR.END
    /* 00176D 05 BE 15       */ JZ lab_15BE
    /* 001770 07             */ CALC.EXT
    /* 001771 FF FF          */ EXPR.POP
    /* 001773 5D 10 01       */ PUSH 349
    /* 001776 13 C0          */ EXPR.LESS_THAN_EQ
    /* 001778 00 C0          */ EXPR.END
    /* 00177A 05 BE 15       */ JZ lab_15BE
  lab_1589:
    /* 00177D 01             */ CALC
    /* 00177E 03 00          */ PUSH 3
    /* 001780 6E 80          */ SYSCALL 0x3E ; sce_rand / sce_rand (1 arg(s))
    /* 001782 71 10 03       */ PUSH 881
    /* 001785 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 001787 19 C0          */ EXPR.LOG_AND
    /* 001789 00 C0          */ EXPR.END
    /* 00178B 05 A6 15       */ JZ lab_15A6
    /* 00178E 01             */ CALC
    /* 00178F 1A 51          */ PUSH.VAR 20762
    /* 001791 7C 00          */ PUSH 124
    /* 001793 1B C0          */ EXPR.ASSIGN
    /* 001795 00 C0          */ EXPR.END
    /* 001797 04 B0 15       */ JMP lab_15B0
  lab_15A6:
    /* 00179A 01             */ CALC
    /* 00179B 1A 51          */ PUSH.VAR 20762
    /* 00179D 82 10 00       */ PUSH 130
    /* 0017A0 1B C0          */ EXPR.ASSIGN
    /* 0017A2 00 C0          */ EXPR.END
  lab_15B0:
    /* 0017A4 01             */ CALC
    /* 0017A5 71 10 03       */ PUSH 881
    /* 0017A8 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 0017AA 00 C0          */ EXPR.END
    /* 0017AC 04 B9 16       */ JMP lab_16B9
    /* 0017AF 04 D8 15       */ JMP lab_15D8
  lab_15BE:
    /* 0017B2 07             */ CALC.EXT
    /* 0017B3 FF FF          */ EXPR.POP
    /* 0017B5 5E 10 01       */ PUSH 350
    /* 0017B8 12 C0          */ EXPR.GREATER_THAN_EQ
    /* 0017BA 00 C0          */ EXPR.END
    /* 0017BC 05 0D 16       */ JZ lab_160D
    /* 0017BF 07             */ CALC.EXT
    /* 0017C0 FF FF          */ EXPR.POP
    /* 0017C2 8F 10 01       */ PUSH 399
    /* 0017C5 13 C0          */ EXPR.LESS_THAN_EQ
    /* 0017C7 00 C0          */ EXPR.END
    /* 0017C9 05 0D 16       */ JZ lab_160D
  lab_15D8:
    /* 0017CC 01             */ CALC
    /* 0017CD 03 00          */ PUSH 3
    /* 0017CF 6E 80          */ SYSCALL 0x3E ; sce_rand / sce_rand (1 arg(s))
    /* 0017D1 72 10 03       */ PUSH 882
    /* 0017D4 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 0017D6 19 C0          */ EXPR.LOG_AND
    /* 0017D8 00 C0          */ EXPR.END
    /* 0017DA 05 F5 15       */ JZ lab_15F5
    /* 0017DD 01             */ CALC
    /* 0017DE 1A 51          */ PUSH.VAR 20762
    /* 0017E0 7C 00          */ PUSH 124
    /* 0017E2 1B C0          */ EXPR.ASSIGN
    /* 0017E4 00 C0          */ EXPR.END
    /* 0017E6 04 FF 15       */ JMP lab_15FF
  lab_15F5:
    /* 0017E9 01             */ CALC
    /* 0017EA 1A 51          */ PUSH.VAR 20762
    /* 0017EC 81 10 00       */ PUSH 129
    /* 0017EF 1B C0          */ EXPR.ASSIGN
    /* 0017F1 00 C0          */ EXPR.END
  lab_15FF:
    /* 0017F3 01             */ CALC
    /* 0017F4 72 10 03       */ PUSH 882
    /* 0017F7 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 0017F9 00 C0          */ EXPR.END
    /* 0017FB 04 B9 16       */ JMP lab_16B9
    /* 0017FE 04 27 16       */ JMP lab_1433
  lab_160D:
    /* 001801 07             */ CALC.EXT
    /* 001802 FF FF          */ EXPR.POP
    /* 001804 90 10 01       */ PUSH 400
    /* 001807 12 C0          */ EXPR.GREATER_THAN_EQ
    /* 001809 00 C0          */ EXPR.END
    /* 00180B 05 5C 16       */ JZ func_1468
    /* 00180E 07             */ CALC.EXT
    /* 00180F FF FF          */ EXPR.POP
    /* 001811 C1 10 01       */ PUSH 449
    /* 001814 13 C0          */ EXPR.LESS_THAN_EQ
    /* 001816 00 C0          */ EXPR.END
    /* 001818 05 5C 16       */ JZ func_1468
  lab_1433:
    /* 00181B 01             */ CALC
    /* 00181C 03 00          */ PUSH 3
    /* 00181E 6E 80          */ SYSCALL 0x3E ; sce_rand / sce_rand (1 arg(s))
    /* 001820 73 10 03       */ PUSH 883
    /* 001823 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 001825 19 C0          */ EXPR.LOG_AND
    /* 001827 00 C0          */ EXPR.END
    /* 001829 05 44 16       */ JZ lab_1644
    /* 00182C 01             */ CALC
    /* 00182D 1A 51          */ PUSH.VAR 20762
    /* 00182F 7C 00          */ PUSH 124
    /* 001831 1B C0          */ EXPR.ASSIGN
    /* 001833 00 C0          */ EXPR.END
    /* 001835 04 4E 16       */ JMP lab_164E
  lab_1644:
    /* 001838 01             */ CALC
    /* 001839 1A 51          */ PUSH.VAR 20762
    /* 00183B 80 10 00       */ PUSH 128
    /* 00183E 1B C0          */ EXPR.ASSIGN
    /* 001840 00 C0          */ EXPR.END
  lab_164E:
    /* 001842 01             */ CALC
    /* 001843 73 10 03       */ PUSH 883
    /* 001846 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 001848 00 C0          */ EXPR.END
    /* 00184A 04 B9 16       */ JMP lab_16B9
    /* 00184D 04 76 16       */ JMP lab_1676

func_1468:
    /* 001850 07             */ CALC.EXT
    /* 001851 FF FF          */ EXPR.POP
    /* 001853 C2 10 01       */ PUSH 450
    /* 001856 12 C0          */ EXPR.GREATER_THAN_EQ
    /* 001858 00 C0          */ EXPR.END
    /* 00185A 05 B6 16       */ JZ lab_16B6
    /* 00185D 07             */ CALC.EXT
    /* 00185E FF FF          */ EXPR.POP
    /* 001860 F4 10 01       */ PUSH 500
    /* 001863 13 C0          */ EXPR.LESS_THAN_EQ
    /* 001865 00 C0          */ EXPR.END
    /* 001867 05 B6 16       */ JZ lab_16B6
  lab_1676:
    /* 00186A 01             */ CALC
    /* 00186B 03 00          */ PUSH 3
    /* 00186D 6E 80          */ SYSCALL 0x3E ; sce_rand / sce_rand (1 arg(s))
    /* 00186F 74 10 03       */ PUSH 884
    /* 001872 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 001874 19 C0          */ EXPR.LOG_AND
    /* 001876 00 C0          */ EXPR.END
    /* 001878 05 93 16       */ JZ lab_1693
    /* 00187B 01             */ CALC
    /* 00187C 1A 51          */ PUSH.VAR 20762
    /* 00187E 7C 00          */ PUSH 124
    /* 001880 1B C0          */ EXPR.ASSIGN
    /* 001882 00 C0          */ EXPR.END
    /* 001884 04 9C 16       */ JMP lab_169C
  lab_1693:
    /* 001887 01             */ CALC
    /* 001888 1A 51          */ PUSH.VAR 20762
    /* 00188A 7F 00          */ PUSH 127
    /* 00188C 1B C0          */ EXPR.ASSIGN
    /* 00188E 00 C0          */ EXPR.END
  lab_169C:
    /* 001890 01             */ CALC
    /* 001891 74 10 03       */ PUSH 884
    /* 001894 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 001896 00 C0          */ EXPR.END
    /* 001898 04 B9 16       */ JMP lab_16B9
  lab_16A7:
    /* 00189B 01             */ CALC
    /* 00189C 1A 51          */ PUSH.VAR 20762
    /* 00189E 79 00          */ PUSH 121
    /* 0018A0 1B C0          */ EXPR.ASSIGN
    /* 0018A2 00 C0          */ EXPR.END
    /* 0018A4 04 B9 16       */ JMP lab_16B9
    /* 0018A7 04 B9 16       */ JMP lab_16B9
  lab_16B6:
    /* 0018AA 04 A7 16       */ JMP lab_16A7
  lab_16B9:
    /* 0018AD 01             */ CALC
    /* 0018AE 1A 51          */ PUSH.VAR 20762
    /* 0018B0 01 00          */ PUSH 1
    /* 0018B2 59 80          */ SYSCALL 0x29 ; sce_get_item / sce_get_item (2 arg(s))
    /* 0018B4 00 C0          */ EXPR.END

msg_84:
    /* 0018B6 14 3C 26       */ sce_message_nc message_84
    /* 0018B9 01             */ CALC
    /* 0018BA 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 0018BC 00 C0          */ EXPR.END
    /* 0018BE 01             */ CALC
    /* 0018BF 47 00          */ PUSH 71
    /* 0018C1 00 00          */ PUSH 0
    /* 0018C3 99 80          */ SYSCALL 0x69 ; sce_sound_effect / sce_sound_effect (2 arg(s))
    /* 0018C5 00 C0          */ EXPR.END

msg_85:
    /* 0018C7 11 80 26       */ sce_message message_85
    /* 0018CA 03             */ RETURN
    /* 0018CB 01             */ CALC
    /* 0018CC 4B 10 01       */ PUSH 331
    /* 0018CF 62 80          */ SYSCALL 0x32 ; sce_off_switch / sce_off_switch (1 arg(s))
    /* 0018D1 00 C0          */ EXPR.END
    /* 0018D3 01             */ CALC
    /* 0018D4 4C 10 01       */ PUSH 332
    /* 0018D7 62 80          */ SYSCALL 0x32 ; sce_off_switch / sce_off_switch (1 arg(s))
    /* 0018D9 00 C0          */ EXPR.END
    /* 0018DB 01             */ CALC
    /* 0018DC 4D 10 01       */ PUSH 333
    /* 0018DF 62 80          */ SYSCALL 0x32 ; sce_off_switch / sce_off_switch (1 arg(s))
    /* 0018E1 00 C0          */ EXPR.END
    /* 0018E3 01             */ CALC
    /* 0018E4 4E 10 01       */ PUSH 334
    /* 0018E7 62 80          */ SYSCALL 0x32 ; sce_off_switch / sce_off_switch (1 arg(s))
    /* 0018E9 00 C0          */ EXPR.END
    /* 0018EB 01             */ CALC
    /* 0018EC 4F 10 01       */ PUSH 335
    /* 0018EF 62 80          */ SYSCALL 0x32 ; sce_off_switch / sce_off_switch (1 arg(s))
    /* 0018F1 00 C0          */ EXPR.END
    /* 0018F3 01             */ CALC
    /* 0018F4 50 10 01       */ PUSH 336
    /* 0018F7 62 80          */ SYSCALL 0x32 ; sce_off_switch / sce_off_switch (1 arg(s))
    /* 0018F9 00 C0          */ EXPR.END
    /* 0018FB 03             */ RETURN

intr_39:
    /* 0018FC 01             */ CALC
    /* 0018FD 00 00          */ PUSH 0
    /* 0018FF 04 00          */ PUSH 4
    /* 001901 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 001903 00 00          */ PUSH 0
    /* 001905 14 C0          */ EXPR.EQUALS
    /* 001907 00 C0          */ EXPR.END
    /* 001909 05 1E 17       */ JZ lab_171E

msg_86:
    /* 00190C 11 9E 26       */ sce_message message_86
    /* 00190F 04 1E 17       */ JMP lab_171E
  lab_171E:
    /* 001912 00             */ EXIT

intr_40:
    /* 001913 01             */ CALC
    /* 001914 00 00          */ PUSH 0
    /* 001916 04 00          */ PUSH 4
    /* 001918 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 00191A 00 00          */ PUSH 0
    /* 00191C 14 C0          */ EXPR.EQUALS
    /* 00191E 00 C0          */ EXPR.END
    /* 001920 05 35 17       */ JZ lab_1735

msg_87:
    /* 001923 11 1C 28       */ sce_message message_87
    /* 001926 04 35 17       */ JMP lab_1735
  lab_1735:
    /* 001929 00             */ EXIT

intr_41:
    /* 00192A 01             */ CALC
    /* 00192B 00 00          */ PUSH 0
    /* 00192D 04 00          */ PUSH 4
    /* 00192F 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 001931 00 00          */ PUSH 0
    /* 001933 14 C0          */ EXPR.EQUALS
    /* 001935 00 C0          */ EXPR.END
    /* 001937 05 4C 17       */ JZ lab_174C

msg_88:
    /* 00193A 11 A2 29       */ sce_message message_88
    /* 00193D 04 4C 17       */ JMP lab_174C
  lab_174C:
    /* 001940 00             */ EXIT

intr_42:
    /* 001941 01             */ CALC
    /* 001942 00 00          */ PUSH 0
    /* 001944 04 00          */ PUSH 4
    /* 001946 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 001948 00 00          */ PUSH 0
    /* 00194A 14 C0          */ EXPR.EQUALS
    /* 00194C 00 C0          */ EXPR.END
    /* 00194E 05 63 17       */ JZ lab_156F

msg_89:
    /* 001951 11 94 2A       */ sce_message message_89
    /* 001954 04 63 17       */ JMP lab_156F
  lab_156F:
    /* 001957 00             */ EXIT

intr_43:
    /* 001958 01             */ CALC
    /* 001959 00 00          */ PUSH 0
    /* 00195B 04 00          */ PUSH 4
    /* 00195D 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 00195F 00 00          */ PUSH 0
    /* 001961 14 C0          */ EXPR.EQUALS
    /* 001963 00 C0          */ EXPR.END
    /* 001965 05 7A 17       */ JZ lab_177A

msg_90:
    /* 001968 11 20 2C       */ sce_message message_90
    /* 00196B 04 7A 17       */ JMP lab_177A
  lab_177A:
    /* 00196E 00             */ EXIT

intr_44:
    /* 00196F 01             */ CALC
    /* 001970 00 00          */ PUSH 0
    /* 001972 04 00          */ PUSH 4
    /* 001974 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 001976 00 00          */ PUSH 0
    /* 001978 14 C0          */ EXPR.EQUALS
    /* 00197A 00 C0          */ EXPR.END
    /* 00197C 05 91 17       */ JZ lab_1791

msg_91:
    /* 00197F 11 90 2D       */ sce_message message_91
    /* 001982 04 91 17       */ JMP lab_1791
  lab_1791:
    /* 001985 00             */ EXIT

intr_45:
    /* 001986 01             */ CALC
    /* 001987 00 00          */ PUSH 0
    /* 001989 04 00          */ PUSH 4
    /* 00198B 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 00198D 00 00          */ PUSH 0
    /* 00198F 14 C0          */ EXPR.EQUALS
    /* 001991 00 C0          */ EXPR.END
    /* 001993 05 A8 17       */ JZ lab_17A8

msg_92:
    /* 001996 11 EA 2D       */ sce_message message_92
    /* 001999 04 A8 17       */ JMP lab_17A8
  lab_17A8:
    /* 00199C 00             */ EXIT

intr_46:
    /* 00199D 01             */ CALC
    /* 00199E 00 00          */ PUSH 0
    /* 0019A0 04 00          */ PUSH 4
    /* 0019A2 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 0019A4 00 00          */ PUSH 0
    /* 0019A6 14 C0          */ EXPR.EQUALS
    /* 0019A8 00 C0          */ EXPR.END
    /* 0019AA 05 BF 17       */ JZ lab_17BF

msg_93:
    /* 0019AD 11 40 2F       */ sce_message message_93
    /* 0019B0 04 BF 17       */ JMP lab_17BF
  lab_17BF:
    /* 0019B3 00             */ EXIT

msg_94:
    /* 0019B4 11 96 30       */ sce_message message_94
    /* 0019B7 00             */ EXIT

intr_48:
    /* 0019B8 01             */ CALC
    /* 0019B9 7F 80          */ SYSCALL 0x4F ; sce_start_demo / sce_start_demo (0 arg(s))
    /* 0019BB 00 C0          */ EXPR.END
    /* 0019BD 01             */ CALC
    /* 0019BE 53 00          */ PUSH 83
    /* 0019C0 00 00          */ PUSH 0
    /* 0019C2 99 80          */ SYSCALL 0x69 ; sce_sound_effect / sce_sound_effect (2 arg(s))
    /* 0019C4 00 C0          */ EXPR.END
    /* 0019C6 01             */ CALC
    /* 0019C7 3C 00          */ PUSH 60
    /* 0019C9 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0019CB 00 C0          */ EXPR.END

msg_95:
    /* 0019CD 11 BC 30       */ sce_message message_95
    /* 0019D0 01             */ CALC
    /* 0019D1 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 0019D3 00 C0          */ EXPR.END
    /* 0019D5 01             */ CALC
    /* 0019D6 80 80          */ SYSCALL 0x50 ; sce_finish_demo / sce_finish_demo (0 arg(s))
    /* 0019D8 00 C0          */ EXPR.END
    /* 0019DA 00             */ EXIT

intr_49:
    /* 0019DB 01             */ CALC
    /* 0019DC 71 00          */ PUSH 113
    /* 0019DE 00 00          */ PUSH 0
    /* 0019E0 B8 10 00       */ PUSH 184
    /* 0019E3 C0 10 00       */ PUSH 192
    /* 0019E6 02 00          */ PUSH 2
    /* 0019E8 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 0019EA 00 C0          */ EXPR.END
    /* 0019EC 00             */ EXIT

intr_50:
    /* 0019ED 01             */ CALC
    /* 0019EE 73 00          */ PUSH 115
    /* 0019F0 00 00          */ PUSH 0
    /* 0019F2 88 10 01       */ PUSH 392
    /* 0019F5 30 00          */ PUSH 48
    /* 0019F7 02 00          */ PUSH 2
    /* 0019F9 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 0019FB 00 C0          */ EXPR.END
    /* 0019FD 00             */ EXIT

intr_51:
    /* 0019FE 01             */ CALC
    /* 0019FF 6D 00          */ PUSH 109
    /* 001A01 00 00          */ PUSH 0
    /* 001A03 F8 10 00       */ PUSH 248
    /* 001A06 D0 10 00       */ PUSH 208
    /* 001A09 00 00          */ PUSH 0
    /* 001A0B 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 001A0D 00 C0          */ EXPR.END
    /* 001A0F 00             */ EXIT

intr_52:
    /* 001A10 01             */ CALC
    /* 001A11 6C 00          */ PUSH 108
    /* 001A13 00 00          */ PUSH 0
    /* 001A15 F8 10 00       */ PUSH 248
    /* 001A18 30 10 01       */ PUSH 304
    /* 001A1B 02 00          */ PUSH 2
    /* 001A1D 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 001A1F 00 C0          */ EXPR.END
    /* 001A21 00             */ EXIT

intr_53:
    /* 001A22 01             */ CALC
    /* 001A23 6E 00          */ PUSH 110
    /* 001A25 00 00          */ PUSH 0
    /* 001A27 88 10 01       */ PUSH 392
    /* 001A2A 70 10 01       */ PUSH 368
    /* 001A2D 00 00          */ PUSH 0
    /* 001A2F 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 001A31 00 C0          */ EXPR.END
    /* 001A33 00             */ EXIT

intr_54:
    /* 001A34 01             */ CALC
    /* 001A35 6D 00          */ PUSH 109
    /* 001A37 00 00          */ PUSH 0
    /* 001A39 88 10 01       */ PUSH 392
    /* 001A3C 60 10 01       */ PUSH 352
    /* 001A3F 02 00          */ PUSH 2
    /* 001A41 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 001A43 00 C0          */ EXPR.END
    /* 001A45 00             */ EXIT

intr_55:
    /* 001A46 01             */ CALC
    /* 001A47 70 00          */ PUSH 112
    /* 001A49 00 00          */ PUSH 0
    /* 001A4B B8 10 00       */ PUSH 184
    /* 001A4E 60 00          */ PUSH 96
    /* 001A50 02 00          */ PUSH 2
    /* 001A52 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 001A54 00 C0          */ EXPR.END
    /* 001A56 00             */ EXIT

intr_56:
    /* 001A57 01             */ CALC
    /* 001A58 74 00          */ PUSH 116
    /* 001A5A 00 00          */ PUSH 0
    /* 001A5C 68 00          */ PUSH 104
    /* 001A5E 50 00          */ PUSH 80
    /* 001A60 02 00          */ PUSH 2
    /* 001A62 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 001A64 00 C0          */ EXPR.END
    /* 001A66 00             */ EXIT

intr_57:
    /* 001A67 01             */ CALC
    /* 001A68 6E 00          */ PUSH 110
    /* 001A6A 00 00          */ PUSH 0
    /* 001A6C 48 00          */ PUSH 72
    /* 001A6E D0 10 01       */ PUSH 464
    /* 001A71 00 00          */ PUSH 0
    /* 001A73 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 001A75 00 C0          */ EXPR.END
    /* 001A77 00             */ EXIT

intr_58:
    /* 001A78 01             */ CALC
    /* 001A79 6E 00          */ PUSH 110
    /* 001A7B 00 00          */ PUSH 0
    /* 001A7D D8 10 00       */ PUSH 216
    /* 001A80 20 10 02       */ PUSH 544
    /* 001A83 00 00          */ PUSH 0
    /* 001A85 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 001A87 00 C0          */ EXPR.END
    /* 001A89 00             */ EXIT

intr_59:
    /* 001A8A 01             */ CALC
    /* 001A8B 4A 00          */ PUSH 74
    /* 001A8D 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 001A8F 00 C0          */ EXPR.END
    /* 001A91 05 B3 18       */ JZ lab_18B3
    /* 001A94 01             */ CALC
    /* 001A95 72 00          */ PUSH 114
    /* 001A97 00 00          */ PUSH 0
    /* 001A99 78 00          */ PUSH 120
    /* 001A9B F0 10 00       */ PUSH 240
    /* 001A9E 00 00          */ PUSH 0
    /* 001AA0 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 001AA2 00 C0          */ EXPR.END
    /* 001AA4 04 C4 18       */ JMP lab_18C4
  lab_18B3:
    /* 001AA7 01             */ CALC
    /* 001AA8 6F 10 02       */ PUSH 623
    /* 001AAB 00 00          */ PUSH 0
    /* 001AAD 78 00          */ PUSH 120
    /* 001AAF F0 10 00       */ PUSH 240
    /* 001AB2 00 00          */ PUSH 0
    /* 001AB4 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 001AB6 00 C0          */ EXPR.END
  lab_18C4:
    /* 001AB8 00             */ EXIT

intr_60:
    /* 001AB9 01             */ CALC
    /* 001ABA 6F 00          */ PUSH 111
    /* 001ABC 00 00          */ PUSH 0
    /* 001ABE 78 00          */ PUSH 120
    /* 001AC0 70 00          */ PUSH 112
    /* 001AC2 02 00          */ PUSH 2
    /* 001AC4 7B 80          */ SYSCALL 0x4B ; sce_change_map / sce_change_map (5 arg(s))
    /* 001AC6 00 C0          */ EXPR.END
    /* 001AC8 00             */ EXIT

func_18D5:
    /* 001AC9 01             */ CALC
    /* 001ACA 7F 80          */ SYSCALL 0x4F ; sce_start_demo / sce_start_demo (0 arg(s))
    /* 001ACC 00 C0          */ EXPR.END
    /* 001ACE 01             */ CALC
    /* 001ACF 00 00          */ PUSH 0
    /* 001AD1 04 00          */ PUSH 4
    /* 001AD3 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 001AD5 00 C0          */ EXPR.END
    /* 001AD7 02 88 19       */ CALL func_1988

msg_96:
    /* 001ADA 11 D8 30       */ sce_message message_96
    /* 001ADD 01             */ CALC
    /* 001ADE 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 001AE0 00 C0          */ EXPR.END
    /* 001AE2 01             */ CALC
    /* 001AE3 1A 10 FF       */ PUSH 65306
    /* 001AE6 5F 00          */ PUSH 95
    /* 001AE8 00 00          */ PUSH 0
    /* 001AEA 00 00          */ PUSH 0
    /* 001AEC 00 00          */ PUSH 0
    /* 001AEE 20 10 01       */ PUSH 288
    /* 001AF1 00 00          */ PUSH 0
    /* 001AF3 00 00          */ PUSH 0
    /* 001AF5 03 00          */ PUSH 3
    /* 001AF7 33 00          */ PUSH 51
    /* 001AF9 3C 00          */ PUSH 60
    /* 001AFB 00 00          */ PUSH 0
    /* 001AFD 00 00          */ PUSH 0
    /* 001AFF 00 00          */ PUSH 0
    /* 001B01 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001B03 00 C0          */ EXPR.END
    /* 001B05 01             */ CALC
    /* 001B06 1E 00          */ PUSH 30
    /* 001B08 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001B0A 00 C0          */ EXPR.END
    /* 001B0C 01             */ CALC
    /* 001B0D 03 00          */ PUSH 3
    /* 001B0F 0D 00          */ PUSH 13
    /* 001B11 00 00          */ PUSH 0
    /* 001B13 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001B15 00 C0          */ EXPR.END
    /* 001B17 01             */ CALC
    /* 001B18 3C 00          */ PUSH 60
    /* 001B1A 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001B1C 00 C0          */ EXPR.END
    /* 001B1E 01             */ CALC
    /* 001B1F 04 00          */ PUSH 4
    /* 001B21 FF 00          */ PUSH 255
    /* 001B23 FF 00          */ PUSH 255
    /* 001B25 08 00          */ PUSH 8
    /* 001B27 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 001B29 00 C0          */ EXPR.END
    /* 001B2B 01             */ CALC
    /* 001B2C 0F 00          */ PUSH 15
    /* 001B2E 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001B30 00 C0          */ EXPR.END
    /* 001B32 01             */ CALC
    /* 001B33 02 00          */ PUSH 2
    /* 001B35 FF 00          */ PUSH 255
    /* 001B37 FF 00          */ PUSH 255
    /* 001B39 08 00          */ PUSH 8
    /* 001B3B 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 001B3D 00 C0          */ EXPR.END
    /* 001B3F 01             */ CALC
    /* 001B40 0A 00          */ PUSH 10
    /* 001B42 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001B44 00 C0          */ EXPR.END
    /* 001B46 01             */ CALC
    /* 001B47 03 00          */ PUSH 3
    /* 001B49 FF 00          */ PUSH 255
    /* 001B4B FF 00          */ PUSH 255
    /* 001B4D 08 00          */ PUSH 8
    /* 001B4F 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 001B51 00 C0          */ EXPR.END
    /* 001B53 01             */ CALC
    /* 001B54 04 00          */ PUSH 4
    /* 001B56 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 001B58 00 C0          */ EXPR.END
    /* 001B5A 01             */ CALC
    /* 001B5B 02 00          */ PUSH 2
    /* 001B5D 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 001B5F 00 C0          */ EXPR.END
    /* 001B61 01             */ CALC
    /* 001B62 03 00          */ PUSH 3
    /* 001B64 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 001B66 00 C0          */ EXPR.END
    /* 001B68 01             */ CALC
    /* 001B69 00 00          */ PUSH 0
    /* 001B6B 8B 80          */ SYSCALL 0x5B ; sce_lock_person / sce_dummy_proc (1 arg(s))
    /* 001B6D 00 C0          */ EXPR.END
    /* 001B6F 01             */ CALC
    /* 001B70 4E 00          */ PUSH 78
    /* 001B72 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 001B74 00 C0          */ EXPR.END
    /* 001B76 01             */ CALC
    /* 001B77 80 80          */ SYSCALL 0x50 ; sce_finish_demo / sce_finish_demo (0 arg(s))
    /* 001B79 00 C0          */ EXPR.END
    /* 001B7B 03             */ RETURN

func_1988:
    /* 001B7C 01             */ CALC
    /* 001B7D 04 00          */ PUSH 4
    /* 001B7F 90 10 00       */ PUSH 144
    /* 001B82 80 10 00       */ PUSH 128
    /* 001B85 02 00          */ PUSH 2
    /* 001B87 04 00          */ PUSH 4
    /* 001B89 00 00          */ PUSH 0
    /* 001B8B 00 00          */ PUSH 0
    /* 001B8D 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001B8F 00 C0          */ EXPR.END
    /* 001B91 01             */ CALC
    /* 001B92 03 00          */ PUSH 3
    /* 001B94 36 00          */ PUSH 54
    /* 001B96 B0 10 00       */ PUSH 176
    /* 001B99 10 10 01       */ PUSH 272
    /* 001B9C 00 00          */ PUSH 0
    /* 001B9E 03 00          */ PUSH 3
    /* 001BA0 00 00          */ PUSH 0
    /* 001BA2 00 00          */ PUSH 0
    /* 001BA4 00 00          */ PUSH 0
    /* 001BA6 00 00          */ PUSH 0
    /* 001BA8 00 00          */ PUSH 0
    /* 001BAA 00 00          */ PUSH 0
    /* 001BAC 00 00          */ PUSH 0
    /* 001BAE 00 00          */ PUSH 0
    /* 001BB0 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001BB2 00 C0          */ EXPR.END
    /* 001BB4 01             */ CALC
    /* 001BB5 02 00          */ PUSH 2
    /* 001BB7 36 00          */ PUSH 54
    /* 001BB9 B0 10 00       */ PUSH 176
    /* 001BBC 28 10 01       */ PUSH 296
    /* 001BBF 00 00          */ PUSH 0
    /* 001BC1 0A 10 01       */ PUSH 266
    /* 001BC4 00 00          */ PUSH 0
    /* 001BC6 00 00          */ PUSH 0
    /* 001BC8 00 00          */ PUSH 0
    /* 001BCA 00 00          */ PUSH 0
    /* 001BCC 00 00          */ PUSH 0
    /* 001BCE 00 00          */ PUSH 0
    /* 001BD0 00 00          */ PUSH 0
    /* 001BD2 00 00          */ PUSH 0
    /* 001BD4 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001BD6 00 C0          */ EXPR.END
    /* 001BD8 01             */ CALC
    /* 001BD9 1A 10 FC       */ PUSH 64538
    /* 001BDC 0D 00          */ PUSH 13
    /* 001BDE 00 00          */ PUSH 0
    /* 001BE0 00 00          */ PUSH 0
    /* 001BE2 00 00          */ PUSH 0
    /* 001BE4 0D 00          */ PUSH 13
    /* 001BE6 00 00          */ PUSH 0
    /* 001BE8 00 00          */ PUSH 0
    /* 001BEA 03 00          */ PUSH 3
    /* 001BEC 09 00          */ PUSH 9
    /* 001BEE 00 00          */ PUSH 0
    /* 001BF0 00 00          */ PUSH 0
    /* 001BF2 00 00          */ PUSH 0
    /* 001BF4 00 00          */ PUSH 0
    /* 001BF6 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001BF8 00 C0          */ EXPR.END
    /* 001BFA 01             */ CALC
    /* 001BFB 03 00          */ PUSH 3
    /* 001BFD 0A 00          */ PUSH 10
    /* 001BFF C0 00          */ PUSH 192
    /* 001C01 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001C03 00 C0          */ EXPR.END
    /* 001C05 01             */ CALC
    /* 001C06 02 00          */ PUSH 2
    /* 001C08 0A 00          */ PUSH 10
    /* 001C0A C0 00          */ PUSH 192
    /* 001C0C 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001C0E 00 C0          */ EXPR.END
    /* 001C10 01             */ CALC
    /* 001C11 02 00          */ PUSH 2
    /* 001C13 03 00          */ PUSH 3
    /* 001C15 20 00          */ PUSH 32
    /* 001C17 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001C19 00 C0          */ EXPR.END
    /* 001C1B 01             */ CALC
    /* 001C1C 03 00          */ PUSH 3
    /* 001C1E 03 00          */ PUSH 3
    /* 001C20 20 00          */ PUSH 32
    /* 001C22 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001C24 00 C0          */ EXPR.END
    /* 001C26 01             */ CALC
    /* 001C27 02 00          */ PUSH 2
    /* 001C29 03 00          */ PUSH 3
    /* 001C2B 3E 80          */ SYSCALL 0x0E ; ns_animation / sce_dummy_proc (2 arg(s))
    /* 001C2D 00 C0          */ EXPR.END
    /* 001C2F 01             */ CALC
    /* 001C30 1E 00          */ PUSH 30
    /* 001C32 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001C34 00 C0          */ EXPR.END
    /* 001C36 01             */ CALC
    /* 001C37 02 00          */ PUSH 2
    /* 001C39 00 00          */ PUSH 0
    /* 001C3B 90 10 00       */ PUSH 144
    /* 001C3E 03 00          */ PUSH 3
    /* 001C40 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 001C42 00 C0          */ EXPR.END
    /* 001C44 01             */ CALC
    /* 001C45 03 00          */ PUSH 3
    /* 001C47 00 00          */ PUSH 0
    /* 001C49 90 10 00       */ PUSH 144
    /* 001C4C 03 00          */ PUSH 3
    /* 001C4E 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 001C50 00 C0          */ EXPR.END
  lab_1A5E:
    /* 001C52 01             */ CALC
    /* 001C53 03 00          */ PUSH 3
    /* 001C55 02 00          */ PUSH 2
    /* 001C57 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 001C59 B0 10 00       */ PUSH 176
    /* 001C5C 10 C0          */ EXPR.GREATER_THAN
    /* 001C5E 00 C0          */ EXPR.END
    /* 001C60 05 79 1A       */ JZ lab_1A79
    /* 001C63 01             */ CALC
    /* 001C64 01 00          */ PUSH 1
    /* 001C66 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001C68 00 C0          */ EXPR.END
    /* 001C6A 04 5E 1A       */ JMP lab_1A5E
  lab_1A79:
    /* 001C6D 01             */ CALC
    /* 001C6E 02 00          */ PUSH 2
    /* 001C70 02 00          */ PUSH 2
    /* 001C72 56 80          */ SYSCALL 0x26 ; sce_get_parameter / tsce_get_parameter (2 arg(s))
    /* 001C74 B0 10 00       */ PUSH 176
    /* 001C77 10 C0          */ EXPR.GREATER_THAN
    /* 001C79 00 C0          */ EXPR.END
    /* 001C7B 05 94 1A       */ JZ lab_1A94
    /* 001C7E 01             */ CALC
    /* 001C7F 01 00          */ PUSH 1
    /* 001C81 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001C83 00 C0          */ EXPR.END
    /* 001C85 04 79 1A       */ JMP lab_1A79
  lab_1A94:
    /* 001C88 01             */ CALC
    /* 001C89 00 00          */ PUSH 0
    /* 001C8B 41 80          */ SYSCALL 0x11 ; sce_set_direction_east / sce_dummy_proc (1 arg(s))
    /* 001C8D 00 C0          */ EXPR.END
    /* 001C8F 01             */ CALC
    /* 001C90 04 00          */ PUSH 4
    /* 001C92 41 80          */ SYSCALL 0x11 ; sce_set_direction_east / sce_dummy_proc (1 arg(s))
    /* 001C94 00 C0          */ EXPR.END
    /* 001C96 01             */ CALC
    /* 001C97 03 00          */ PUSH 3
    /* 001C99 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 001C9B 00 C0          */ EXPR.END
    /* 001C9D 01             */ CALC
    /* 001C9E 02 00          */ PUSH 2
    /* 001CA0 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 001CA2 00 C0          */ EXPR.END
    /* 001CA4 01             */ CALC
    /* 001CA5 04 51          */ PUSH.VAR 20740
    /* 001CA7 20 00          */ PUSH 32
    /* 001CA9 1B C0          */ EXPR.ASSIGN
    /* 001CAB 00 C0          */ EXPR.END

intr_60:
    /* 001CAD 01             */ CALC
    /* 001CAE 04 51          */ PUSH.VAR 20740
    /* 001CB0 00 C0          */ EXPR.END
    /* 001CB2 05 E8 1A       */ JZ lab_1AE8
    /* 001CB5 01             */ CALC
    /* 001CB6 02 00          */ PUSH 2
    /* 001CB8 03 00          */ PUSH 3
    /* 001CBA 04 51          */ PUSH.VAR 20740
    /* 001CBC 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001CBE 00 C0          */ EXPR.END
    /* 001CC0 01             */ CALC
    /* 001CC1 03 00          */ PUSH 3
    /* 001CC3 03 00          */ PUSH 3
    /* 001CC5 04 51          */ PUSH.VAR 20740
    /* 001CC7 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001CC9 00 C0          */ EXPR.END
    /* 001CCB 01             */ CALC
    /* 001CCC 02 00          */ PUSH 2
    /* 001CCE 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001CD0 00 C0          */ EXPR.END
    /* 001CD2 01             */ CALC
    /* 001CD3 04 51          */ PUSH.VAR 20740
    /* 001CD5 02 C0          */ EXPR.POST_DEC
    /* 001CD7 00 C0          */ EXPR.END
    /* 001CD9 04 B9 1A       */ JMP intr_60
  lab_1AE8:
    /* 001CDC 01             */ CALC
    /* 001CDD 02 00          */ PUSH 2
    /* 001CDF 0D 00          */ PUSH 13
    /* 001CE1 00 00          */ PUSH 0
    /* 001CE3 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001CE5 00 C0          */ EXPR.END
    /* 001CE7 01             */ CALC
    /* 001CE8 02 00          */ PUSH 2
    /* 001CEA 06 00          */ PUSH 6
    /* 001CEC 02 00          */ PUSH 2
    /* 001CEE 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001CF0 00 C0          */ EXPR.END
    /* 001CF2 01             */ CALC
    /* 001CF3 02 00          */ PUSH 2
    /* 001CF5 FF 00          */ PUSH 255
    /* 001CF7 3E 80          */ SYSCALL 0x0E ; ns_animation / sce_dummy_proc (2 arg(s))
    /* 001CF9 00 C0          */ EXPR.END
    /* 001CFB 01             */ CALC
    /* 001CFC 1E 00          */ PUSH 30
    /* 001CFE 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001D00 00 C0          */ EXPR.END
    /* 001D02 01             */ CALC
    /* 001D03 1A 10 FC       */ PUSH 64538
    /* 001D06 37 80          */ SYSCALL 0x07 ; ns_delete_person / tsce_delete_person (1 arg(s))
    /* 001D08 00 C0          */ EXPR.END
    /* 001D0A 01             */ CALC
    /* 001D0B 1E 00          */ PUSH 30
    /* 001D0D 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001D0F 00 C0          */ EXPR.END
    /* 001D11 01             */ CALC
    /* 001D12 02 00          */ PUSH 2
    /* 001D14 43 80          */ SYSCALL 0x13 ; sce_set_direction_west / sce_dummy_proc (1 arg(s))
    /* 001D16 00 C0          */ EXPR.END
    /* 001D18 01             */ CALC
    /* 001D19 03 00          */ PUSH 3
    /* 001D1B 43 80          */ SYSCALL 0x13 ; sce_set_direction_west / sce_dummy_proc (1 arg(s))
    /* 001D1D 00 C0          */ EXPR.END
    /* 001D1F 01             */ CALC
    /* 001D20 03 00          */ PUSH 3
    /* 001D22 0A 00          */ PUSH 10
    /* 001D24 00 00          */ PUSH 0
    /* 001D26 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001D28 00 C0          */ EXPR.END
    /* 001D2A 01             */ CALC
    /* 001D2B 02 00          */ PUSH 2
    /* 001D2D 0A 00          */ PUSH 10
    /* 001D2F 00 00          */ PUSH 0
    /* 001D31 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001D33 00 C0          */ EXPR.END
    /* 001D35 03             */ RETURN

func_1B42:
    /* 001D36 01             */ CALC
    /* 001D37 7F 80          */ SYSCALL 0x4F ; sce_start_demo / sce_start_demo (0 arg(s))
    /* 001D39 00 C0          */ EXPR.END
    /* 001D3B 01             */ CALC
    /* 001D3C 16 00          */ PUSH 22
    /* 001D3E 00 00          */ PUSH 0
    /* 001D40 00 00          */ PUSH 0
    /* 001D42 96 80          */ SYSCALL 0x66 ; sce_music / sce_music (3 arg(s))
    /* 001D44 00 C0          */ EXPR.END
    /* 001D46 01             */ CALC
    /* 001D47 11 00          */ PUSH 17
    /* 001D49 D0 10 00       */ PUSH 208
    /* 001D4C B0 10 00       */ PUSH 176
    /* 001D4F 01 00          */ PUSH 1
    /* 001D51 71 10 01       */ PUSH 369
    /* 001D54 00 00          */ PUSH 0
    /* 001D56 00 00          */ PUSH 0
    /* 001D58 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001D5A 00 C0          */ EXPR.END
    /* 001D5C 01             */ CALC
    /* 001D5D 12 00          */ PUSH 18
    /* 001D5F 30 10 01       */ PUSH 304
    /* 001D62 B0 10 00       */ PUSH 176
    /* 001D65 03 00          */ PUSH 3
    /* 001D67 71 10 01       */ PUSH 369
    /* 001D6A 00 00          */ PUSH 0
    /* 001D6C 00 00          */ PUSH 0
    /* 001D6E 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001D70 00 C0          */ EXPR.END
    /* 001D72 01             */ CALC
    /* 001D73 13 00          */ PUSH 19
    /* 001D75 E0 10 00       */ PUSH 224
    /* 001D78 A0 10 01       */ PUSH 416
    /* 001D7B 02 00          */ PUSH 2
    /* 001D7D 71 10 01       */ PUSH 369
    /* 001D80 00 00          */ PUSH 0
    /* 001D82 00 00          */ PUSH 0
    /* 001D84 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001D86 00 C0          */ EXPR.END
    /* 001D88 01             */ CALC
    /* 001D89 14 00          */ PUSH 20
    /* 001D8B 20 10 01       */ PUSH 288
    /* 001D8E A0 10 01       */ PUSH 416
    /* 001D91 02 00          */ PUSH 2
    /* 001D93 71 10 01       */ PUSH 369
    /* 001D96 00 00          */ PUSH 0
    /* 001D98 00 00          */ PUSH 0
    /* 001D9A 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001D9C 00 C0          */ EXPR.END
    /* 001D9E 01             */ CALC
    /* 001D9F 3F 00          */ PUSH 63
    /* 001DA1 10 10 02       */ PUSH 528
    /* 001DA4 B0 10 01       */ PUSH 432
    /* 001DA7 02 00          */ PUSH 2
    /* 001DA9 71 10 01       */ PUSH 369
    /* 001DAC 00 00          */ PUSH 0
    /* 001DAE 00 00          */ PUSH 0
    /* 001DB0 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001DB2 00 C0          */ EXPR.END
    /* 001DB4 01             */ CALC
    /* 001DB5 40 00          */ PUSH 64
    /* 001DB7 40 10 02       */ PUSH 576
    /* 001DBA B0 10 01       */ PUSH 432
    /* 001DBD 02 00          */ PUSH 2
    /* 001DBF 71 10 01       */ PUSH 369
    /* 001DC2 00 00          */ PUSH 0
    /* 001DC4 00 00          */ PUSH 0
    /* 001DC6 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001DC8 00 C0          */ EXPR.END
    /* 001DCA 01             */ CALC
    /* 001DCB C2 10 00       */ PUSH 194
    /* 001DCE 0C 00          */ PUSH 12
    /* 001DD0 00 00          */ PUSH 0
    /* 001DD2 00 00          */ PUSH 0
    /* 001DD4 00 00          */ PUSH 0
    /* 001DD6 97 10 00       */ PUSH 151
    /* 001DD9 00 00          */ PUSH 0
    /* 001DDB 00 00          */ PUSH 0
    /* 001DDD 11 00          */ PUSH 17
    /* 001DDF 00 00          */ PUSH 0
    /* 001DE1 00 00          */ PUSH 0
    /* 001DE3 02 00          */ PUSH 2
    /* 001DE5 00 00          */ PUSH 0
    /* 001DE7 00 00          */ PUSH 0
    /* 001DE9 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001DEB 00 C0          */ EXPR.END
    /* 001DED 01             */ CALC
    /* 001DEE C2 10 00       */ PUSH 194
    /* 001DF1 0C 00          */ PUSH 12
    /* 001DF3 00 00          */ PUSH 0
    /* 001DF5 00 00          */ PUSH 0
    /* 001DF7 00 00          */ PUSH 0
    /* 001DF9 96 10 00       */ PUSH 150
    /* 001DFC 00 00          */ PUSH 0
    /* 001DFE 00 00          */ PUSH 0
    /* 001E00 12 00          */ PUSH 18
    /* 001E02 00 00          */ PUSH 0
    /* 001E04 00 00          */ PUSH 0
    /* 001E06 02 00          */ PUSH 2
    /* 001E08 00 00          */ PUSH 0
    /* 001E0A 00 00          */ PUSH 0
    /* 001E0C 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001E0E 00 C0          */ EXPR.END
    /* 001E10 01             */ CALC
    /* 001E11 C2 10 00       */ PUSH 194
    /* 001E14 0C 00          */ PUSH 12
    /* 001E16 00 00          */ PUSH 0
    /* 001E18 00 00          */ PUSH 0
    /* 001E1A 00 00          */ PUSH 0
    /* 001E1C 97 10 00       */ PUSH 151
    /* 001E1F 00 00          */ PUSH 0
    /* 001E21 00 00          */ PUSH 0
    /* 001E23 13 00          */ PUSH 19
    /* 001E25 00 00          */ PUSH 0
    /* 001E27 00 00          */ PUSH 0
    /* 001E29 02 00          */ PUSH 2
    /* 001E2B 00 00          */ PUSH 0
    /* 001E2D 00 00          */ PUSH 0
    /* 001E2F 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001E31 00 C0          */ EXPR.END
    /* 001E33 01             */ CALC
    /* 001E34 C2 10 00       */ PUSH 194
    /* 001E37 0C 00          */ PUSH 12
    /* 001E39 00 00          */ PUSH 0
    /* 001E3B 00 00          */ PUSH 0
    /* 001E3D 00 00          */ PUSH 0
    /* 001E3F 96 10 00       */ PUSH 150
    /* 001E42 00 00          */ PUSH 0
    /* 001E44 00 00          */ PUSH 0
    /* 001E46 14 00          */ PUSH 20
    /* 001E48 00 00          */ PUSH 0
    /* 001E4A 00 00          */ PUSH 0
    /* 001E4C 02 00          */ PUSH 2
    /* 001E4E 00 00          */ PUSH 0
    /* 001E50 00 00          */ PUSH 0
    /* 001E52 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001E54 00 C0          */ EXPR.END
    /* 001E56 01             */ CALC
    /* 001E57 C2 10 00       */ PUSH 194
    /* 001E5A 0C 00          */ PUSH 12
    /* 001E5C 00 00          */ PUSH 0
    /* 001E5E 00 00          */ PUSH 0
    /* 001E60 00 00          */ PUSH 0
    /* 001E62 97 10 00       */ PUSH 151
    /* 001E65 00 00          */ PUSH 0
    /* 001E67 00 00          */ PUSH 0
    /* 001E69 3F 00          */ PUSH 63
    /* 001E6B 00 00          */ PUSH 0
    /* 001E6D 00 00          */ PUSH 0
    /* 001E6F 02 00          */ PUSH 2
    /* 001E71 00 00          */ PUSH 0
    /* 001E73 00 00          */ PUSH 0
    /* 001E75 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001E77 00 C0          */ EXPR.END
    /* 001E79 01             */ CALC
    /* 001E7A C2 10 00       */ PUSH 194
    /* 001E7D 0C 00          */ PUSH 12
    /* 001E7F 00 00          */ PUSH 0
    /* 001E81 00 00          */ PUSH 0
    /* 001E83 00 00          */ PUSH 0
    /* 001E85 96 10 00       */ PUSH 150
    /* 001E88 00 00          */ PUSH 0
    /* 001E8A 00 00          */ PUSH 0
    /* 001E8C 40 00          */ PUSH 64
    /* 001E8E 00 00          */ PUSH 0
    /* 001E90 00 00          */ PUSH 0
    /* 001E92 02 00          */ PUSH 2
    /* 001E94 00 00          */ PUSH 0
    /* 001E96 00 00          */ PUSH 0
    /* 001E98 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001E9A 00 C0          */ EXPR.END
    /* 001E9C 01             */ CALC
    /* 001E9D 78 00          */ PUSH 120
    /* 001E9F 20 10 01       */ PUSH 288
    /* 001EA2 80 10 00       */ PUSH 128
    /* 001EA5 02 00          */ PUSH 2
    /* 001EA7 AA 10 00       */ PUSH 170
    /* 001EAA 00 00          */ PUSH 0
    /* 001EAC 00 00          */ PUSH 0
    /* 001EAE 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001EB0 00 C0          */ EXPR.END
    /* 001EB2 01             */ CALC
    /* 001EB3 7A 00          */ PUSH 122
    /* 001EB5 E0 10 00       */ PUSH 224
    /* 001EB8 80 10 00       */ PUSH 128
    /* 001EBB 02 00          */ PUSH 2
    /* 001EBD C9 10 00       */ PUSH 201
    /* 001EC0 00 00          */ PUSH 0
    /* 001EC2 00 00          */ PUSH 0
    /* 001EC4 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001EC6 00 C0          */ EXPR.END
    /* 001EC8 01             */ CALC
    /* 001EC9 04 00          */ PUSH 4
    /* 001ECB 08 10 01       */ PUSH 264
    /* 001ECE B0 10 00       */ PUSH 176
    /* 001ED1 00 00          */ PUSH 0
    /* 001ED3 04 00          */ PUSH 4
    /* 001ED5 00 00          */ PUSH 0
    /* 001ED7 00 00          */ PUSH 0
    /* 001ED9 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001EDB 00 C0          */ EXPR.END
    /* 001EDD 01             */ CALC
    /* 001EDE 02 00          */ PUSH 2
    /* 001EE0 E8 10 00       */ PUSH 232
    /* 001EE3 C0 10 00       */ PUSH 192
    /* 001EE6 00 00          */ PUSH 0
    /* 001EE8 02 00          */ PUSH 2
    /* 001EEA 00 00          */ PUSH 0
    /* 001EEC 00 00          */ PUSH 0
    /* 001EEE 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001EF0 00 C0          */ EXPR.END
    /* 001EF2 01             */ CALC
    /* 001EF3 03 00          */ PUSH 3
    /* 001EF5 18 10 01       */ PUSH 280
    /* 001EF8 C0 10 00       */ PUSH 192
    /* 001EFB 00 00          */ PUSH 0
    /* 001EFD 03 00          */ PUSH 3
    /* 001EFF 00 00          */ PUSH 0
    /* 001F01 00 00          */ PUSH 0
    /* 001F03 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001F05 00 C0          */ EXPR.END
    /* 001F07 01             */ CALC
    /* 001F08 00 00          */ PUSH 0
    /* 001F0A 01 00          */ PUSH 1
    /* 001F0C F8 10 00       */ PUSH 248
    /* 001F0F 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001F11 00 C0          */ EXPR.END
    /* 001F13 01             */ CALC
    /* 001F14 00 00          */ PUSH 0
    /* 001F16 04 00          */ PUSH 4
    /* 001F18 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 001F1A 00 C0          */ EXPR.END
    /* 001F1C 01             */ CALC
    /* 001F1D 46 00          */ PUSH 70
    /* 001F1F 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001F21 00 C0          */ EXPR.END
    /* 001F23 01             */ CALC
    /* 001F24 7A 00          */ PUSH 122
    /* 001F26 02 00          */ PUSH 2
    /* 001F28 10 00          */ PUSH 16
    /* 001F2A 08 00          */ PUSH 8
    /* 001F2C 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 001F2E 00 C0          */ EXPR.END
    /* 001F30 01             */ CALC
    /* 001F31 7A 00          */ PUSH 122
    /* 001F33 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 001F35 00 C0          */ EXPR.END
    /* 001F37 01             */ CALC
    /* 001F38 48 00          */ PUSH 72
    /* 001F3A 18 00          */ PUSH 24
    /* 001F3C A8 80          */ SYSCALL 0x78 ; sce_wait_music_voice_start / sce_wait_music_voice_start (2 arg(s))
    /* 001F3E 00 C0          */ EXPR.END

msg_97:
    /* 001F40 14 58 31       */ sce_message_nc message_97
    /* 001F43 01             */ CALC
    /* 001F44 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 001F46 00 C0          */ EXPR.END
    /* 001F48 01             */ CALC
    /* 001F49 04 00          */ PUSH 4
    /* 001F4B 08 10 01       */ PUSH 264
    /* 001F4E A8 10 00       */ PUSH 168
    /* 001F51 08 00          */ PUSH 8
    /* 001F53 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 001F55 00 C0          */ EXPR.END

msg_98:
    /* 001F57 11 A2 31       */ sce_message message_98
    /* 001F5A 01             */ CALC
    /* 001F5B 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 001F5D 00 C0          */ EXPR.END
    /* 001F5F 01             */ CALC
    /* 001F60 19 10 FC       */ PUSH 64537
    /* 001F63 0D 00          */ PUSH 13
    /* 001F65 00 00          */ PUSH 0
    /* 001F67 00 00          */ PUSH 0
    /* 001F69 00 00          */ PUSH 0
    /* 001F6B 0D 00          */ PUSH 13
    /* 001F6D 00 00          */ PUSH 0
    /* 001F6F 00 00          */ PUSH 0
    /* 001F71 78 00          */ PUSH 120
    /* 001F73 01 00          */ PUSH 1
    /* 001F75 3C 00          */ PUSH 60
    /* 001F77 00 00          */ PUSH 0
    /* 001F79 00 00          */ PUSH 0
    /* 001F7B 00 00          */ PUSH 0
    /* 001F7D 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 001F7F 00 C0          */ EXPR.END
    /* 001F81 01             */ CALC
    /* 001F82 3C 00          */ PUSH 60
    /* 001F84 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001F86 00 C0          */ EXPR.END

msg_99:
    /* 001F88 14 C6 31       */ sce_message_nc message_99
    /* 001F8B 01             */ CALC
    /* 001F8C 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 001F8E 00 C0          */ EXPR.END
    /* 001F90 01             */ CALC
    /* 001F91 78 00          */ PUSH 120
    /* 001F93 43 80          */ SYSCALL 0x13 ; sce_set_direction_west / sce_dummy_proc (1 arg(s))
    /* 001F95 00 C0          */ EXPR.END

msg_100:
    /* 001F97 14 4C 34       */ sce_message_nc message_100
    /* 001F9A 01             */ CALC
    /* 001F9B 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 001F9D 00 C0          */ EXPR.END
    /* 001F9F 01             */ CALC
    /* 001FA0 78 00          */ PUSH 120
    /* 001FA2 42 80          */ SYSCALL 0x12 ; sce_set_direction_south / sce_dummy_proc (1 arg(s))
    /* 001FA4 00 C0          */ EXPR.END

msg_101:
    /* 001FA6 11 54 35       */ sce_message message_101
    /* 001FA9 01             */ CALC
    /* 001FAA 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 001FAC 00 C0          */ EXPR.END
    /* 001FAE 01             */ CALC
    /* 001FAF 7A 00          */ PUSH 122
    /* 001FB1 08 10 01       */ PUSH 264
    /* 001FB4 90 10 00       */ PUSH 144
    /* 001FB7 08 00          */ PUSH 8
    /* 001FB9 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 001FBB 00 C0          */ EXPR.END
    /* 001FBD 01             */ CALC
    /* 001FBE 7A 00          */ PUSH 122
    /* 001FC0 02 00          */ PUSH 2
    /* 001FC2 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 001FC4 00 C0          */ EXPR.END

msg_102:
    /* 001FC6 11 D4 36       */ sce_message message_102
    /* 001FC9 01             */ CALC
    /* 001FCA 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 001FCC 00 C0          */ EXPR.END
    /* 001FCE 01             */ CALC
    /* 001FCF 1E 00          */ PUSH 30
    /* 001FD1 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 001FD3 00 C0          */ EXPR.END
    /* 001FD5 01             */ CALC
    /* 001FD6 BC 10 00       */ PUSH 188
    /* 001FD9 08 10 01       */ PUSH 264
    /* 001FDC 94 10 00       */ PUSH 148
    /* 001FDF 00 00          */ PUSH 0
    /* 001FE1 5F 00          */ PUSH 95
    /* 001FE3 00 00          */ PUSH 0
    /* 001FE5 00 00          */ PUSH 0
    /* 001FE7 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 001FE9 00 C0          */ EXPR.END
    /* 001FEB 01             */ CALC
    /* 001FEC BC 10 00       */ PUSH 188
    /* 001FEF 0A 00          */ PUSH 10
    /* 001FF1 FE 00          */ PUSH 254
    /* 001FF3 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 001FF5 00 C0          */ EXPR.END
    /* 001FF7 01             */ CALC
    /* 001FF8 BC 10 00       */ PUSH 188
    /* 001FFB 00 00          */ PUSH 0
    /* 001FFD 3E 80          */ SYSCALL 0x0E ; ns_animation / sce_dummy_proc (2 arg(s))
    /* 001FFF 00 C0          */ EXPR.END
    /* 002001 01             */ CALC
    /* 002002 3C 00          */ PUSH 60
    /* 002004 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 002006 00 C0          */ EXPR.END

msg_103:
    /* 002008 14 70 37       */ sce_message_nc message_103
    /* 00200B 01             */ CALC
    /* 00200C 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 00200E 00 C0          */ EXPR.END
    /* 002010 01             */ CALC
    /* 002011 7A 00          */ PUSH 122
    /* 002013 43 80          */ SYSCALL 0x13 ; sce_set_direction_west / sce_dummy_proc (1 arg(s))
    /* 002015 00 C0          */ EXPR.END
    /* 002017 01             */ CALC
    /* 002018 7A 00          */ PUSH 122
    /* 00201A F0 10 00       */ PUSH 240
    /* 00201D 98 10 00       */ PUSH 152
    /* 002020 08 00          */ PUSH 8
    /* 002022 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 002024 00 C0          */ EXPR.END

msg_104:
    /* 002026 11 B4 37       */ sce_message message_104
    /* 002029 01             */ CALC
    /* 00202A 7A 00          */ PUSH 122
    /* 00202C 02 00          */ PUSH 2
    /* 00202E 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 002030 00 C0          */ EXPR.END
    /* 002032 01             */ CALC
    /* 002033 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 002035 00 C0          */ EXPR.END
    /* 002037 01             */ CALC
    /* 002038 DC 10 00       */ PUSH 220
    /* 00203B F0 10 00       */ PUSH 240
    /* 00203E 98 10 00       */ PUSH 152
    /* 002041 00 00          */ PUSH 0
    /* 002043 97 10 00       */ PUSH 151
    /* 002046 00 00          */ PUSH 0
    /* 002048 00 00          */ PUSH 0
    /* 00204A 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00204C 00 C0          */ EXPR.END
    /* 00204E 01             */ CALC
    /* 00204F DC 10 00       */ PUSH 220
    /* 002052 0A 00          */ PUSH 10
    /* 002054 FE 00          */ PUSH 254
    /* 002056 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 002058 00 C0          */ EXPR.END
    /* 00205A 01             */ CALC
    /* 00205B DC 10 00       */ PUSH 220
    /* 00205E 01 00          */ PUSH 1
    /* 002060 3E 80          */ SYSCALL 0x0E ; ns_animation / sce_dummy_proc (2 arg(s))
    /* 002062 00 C0          */ EXPR.END
    /* 002064 01             */ CALC
    /* 002065 1E 00          */ PUSH 30
    /* 002067 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 002069 00 C0          */ EXPR.END

msg_105:
    /* 00206B 14 20 38       */ sce_message_nc message_105
    /* 00206E 01             */ CALC
    /* 00206F 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 002071 00 C0          */ EXPR.END
    /* 002073 01             */ CALC
    /* 002074 BC 10 00       */ PUSH 188
    /* 002077 37 80          */ SYSCALL 0x07 ; ns_delete_person / tsce_delete_person (1 arg(s))
    /* 002079 00 C0          */ EXPR.END
    /* 00207B 01             */ CALC
    /* 00207C DC 10 00       */ PUSH 220
    /* 00207F 37 80          */ SYSCALL 0x07 ; ns_delete_person / tsce_delete_person (1 arg(s))
    /* 002081 00 C0          */ EXPR.END
    /* 002083 01             */ CALC
    /* 002084 78 00          */ PUSH 120
    /* 002086 43 80          */ SYSCALL 0x13 ; sce_set_direction_west / sce_dummy_proc (1 arg(s))
    /* 002088 00 C0          */ EXPR.END
    /* 00208A 01             */ CALC
    /* 00208B 7A 00          */ PUSH 122
    /* 00208D 40 80          */ SYSCALL 0x10 ; sce_set_direction_north / sce_dummy_proc (1 arg(s))
    /* 00208F 00 C0          */ EXPR.END

msg_106:
    /* 002091 11 B8 3A       */ sce_message message_106
    /* 002094 01             */ CALC
    /* 002095 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 002097 00 C0          */ EXPR.END
    /* 002099 01             */ CALC
    /* 00209A 18 00          */ PUSH 24
    /* 00209C A9 80          */ SYSCALL 0x79 ; sce_wait_music_voice_end / sce_wait_music_voice_end (1 arg(s))
    /* 00209E 00 C0          */ EXPR.END
    /* 0020A0 01             */ CALC
    /* 0020A1 11 00          */ PUSH 17
    /* 0020A3 42 80          */ SYSCALL 0x12 ; sce_set_direction_south / sce_dummy_proc (1 arg(s))
    /* 0020A5 00 C0          */ EXPR.END
    /* 0020A7 01             */ CALC
    /* 0020A8 12 00          */ PUSH 18
    /* 0020AA 42 80          */ SYSCALL 0x12 ; sce_set_direction_south / sce_dummy_proc (1 arg(s))
    /* 0020AC 00 C0          */ EXPR.END
    /* 0020AE 01             */ CALC
    /* 0020AF 7A 00          */ PUSH 122
    /* 0020B1 02 00          */ PUSH 2
    /* 0020B3 C0 10 00       */ PUSH 192
    /* 0020B6 08 00          */ PUSH 8
    /* 0020B8 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 0020BA 00 C0          */ EXPR.END
    /* 0020BC 01             */ CALC
    /* 0020BD 78 00          */ PUSH 120
    /* 0020BF 02 00          */ PUSH 2
    /* 0020C1 D0 10 00       */ PUSH 208
    /* 0020C4 08 00          */ PUSH 8
    /* 0020C6 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 0020C8 00 C0          */ EXPR.END
    /* 0020CA 01             */ CALC
    /* 0020CB 06 00          */ PUSH 6
    /* 0020CD 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0020CF 00 C0          */ EXPR.END
    /* 0020D1 01             */ CALC
    /* 0020D2 02 00          */ PUSH 2
    /* 0020D4 03 00          */ PUSH 3
    /* 0020D6 08 00          */ PUSH 8
    /* 0020D8 0C 00          */ PUSH 12
    /* 0020DA 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 0020DC 00 C0          */ EXPR.END
    /* 0020DE 01             */ CALC
    /* 0020DF 00 00          */ PUSH 0
    /* 0020E1 00 10 01       */ PUSH 256
    /* 0020E4 B8 10 00       */ PUSH 184
    /* 0020E7 0C 00          */ PUSH 12
    /* 0020E9 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0020EB 00 C0          */ EXPR.END
    /* 0020ED 01             */ CALC
    /* 0020EE 02 00          */ PUSH 2
    /* 0020F0 01 00          */ PUSH 1
    /* 0020F2 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 0020F4 00 C0          */ EXPR.END
    /* 0020F6 01             */ CALC
    /* 0020F7 00 00          */ PUSH 0
    /* 0020F9 03 00          */ PUSH 3
    /* 0020FB 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 0020FD 00 C0          */ EXPR.END
    /* 0020FF 01             */ CALC
    /* 002100 03 00          */ PUSH 3
    /* 002102 03 00          */ PUSH 3
    /* 002104 08 00          */ PUSH 8
    /* 002106 0C 00          */ PUSH 12
    /* 002108 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 00210A 00 C0          */ EXPR.END
    /* 00210C 01             */ CALC
    /* 00210D 03 00          */ PUSH 3
    /* 00210F 01 00          */ PUSH 1
    /* 002111 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 002113 00 C0          */ EXPR.END
    /* 002115 01             */ CALC
    /* 002116 7A 00          */ PUSH 122
    /* 002118 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 00211A 00 C0          */ EXPR.END
    /* 00211C 01             */ CALC
    /* 00211D 78 00          */ PUSH 120
    /* 00211F 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 002121 00 C0          */ EXPR.END
    /* 002123 02 D4 1F       */ CALL func_1FD4
    /* 002126 01             */ CALC
    /* 002127 0B 00          */ PUSH 11
    /* 002129 86 80          */ SYSCALL 0x56 ; sce_special_event / sce_special_event (1 arg(s))
    /* 00212B 00 C0          */ EXPR.END

msg_107:
    /* 00212D 11 1C 3B       */ sce_message message_107
    /* 002130 01             */ CALC
    /* 002131 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 002133 00 C0          */ EXPR.END
    /* 002135 01             */ CALC
    /* 002136 0A 00          */ PUSH 10
    /* 002138 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 00213A 00 C0          */ EXPR.END
    /* 00213C 01             */ CALC
    /* 00213D 01 00          */ PUSH 1
    /* 00213F 77 80          */ SYSCALL 0x47 ; sce_put_fix / sce_dummy_proc (1 arg(s))
    /* 002141 00 C0          */ EXPR.END
    /* 002143 01             */ CALC
    /* 002144 5E 10 01       */ PUSH 350
    /* 002147 01 00          */ PUSH 1
    /* 002149 59 80          */ SYSCALL 0x29 ; sce_get_item / sce_get_item (2 arg(s))
    /* 00214B 00 C0          */ EXPR.END
    /* 00214D 01             */ CALC
    /* 00214E C3 10 00       */ PUSH 195
    /* 002151 01 00          */ PUSH 1
    /* 002153 59 80          */ SYSCALL 0x29 ; sce_get_item / sce_get_item (2 arg(s))
    /* 002155 00 C0          */ EXPR.END
    /* 002157 01             */ CALC
    /* 002158 EC 10 00       */ PUSH 236
    /* 00215B 01 00          */ PUSH 1
    /* 00215D 59 80          */ SYSCALL 0x29 ; sce_get_item / sce_get_item (2 arg(s))
    /* 00215F 00 C0          */ EXPR.END
    /* 002161 01             */ CALC
    /* 002162 74 50          */ PUSH.VAR 20596
    /* 002164 BE 10 00       */ PUSH 190
    /* 002167 1B C0          */ EXPR.ASSIGN
    /* 002169 00 C0          */ EXPR.END
    /* 00216B 01             */ CALC
    /* 00216C 80 80          */ SYSCALL 0x50 ; sce_finish_demo / sce_finish_demo (0 arg(s))
    /* 00216E 00 C0          */ EXPR.END
    /* 002170 03             */ RETURN

func_1F7D:
    /* 002171 01             */ CALC
    /* 002172 19 10 FC       */ PUSH 64537
    /* 002175 0D 00          */ PUSH 13
    /* 002177 00 00          */ PUSH 0
    /* 002179 00 00          */ PUSH 0
    /* 00217B 00 00          */ PUSH 0
    /* 00217D 0D 00          */ PUSH 13
    /* 00217F 00 00          */ PUSH 0
    /* 002181 00 00          */ PUSH 0
    /* 002183 00 00          */ PUSH 0
    /* 002185 09 00          */ PUSH 9
    /* 002187 00 00          */ PUSH 0
    /* 002189 00 00          */ PUSH 0
    /* 00218B 00 00          */ PUSH 0
    /* 00218D 00 00          */ PUSH 0
    /* 00218F 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 002191 00 C0          */ EXPR.END
    /* 002193 01             */ CALC
    /* 002194 00 00          */ PUSH 0
    /* 002196 2B 00          */ PUSH 43
    /* 002198 3E 80          */ SYSCALL 0x0E ; ns_animation / sce_dummy_proc (2 arg(s))
    /* 00219A 00 C0          */ EXPR.END
    /* 00219C 01             */ CALC
    /* 00219D 2C 60          */ PUSH.VAR 24620
    /* 00219F 0F 10 27       */ PUSH 9999
    /* 0021A2 1B C0          */ EXPR.ASSIGN
    /* 0021A4 00 C0          */ EXPR.END

msg_108:
    /* 0021A6 14 4E 3B       */ sce_message_nc message_108
    /* 0021A9 01             */ CALC
    /* 0021AA 3C 00          */ PUSH 60
    /* 0021AC 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0021AE 00 C0          */ EXPR.END
    /* 0021B0 01             */ CALC
    /* 0021B1 33 80          */ SYSCALL 0x03 ; sce_close_window / sce_close_window (0 arg(s))
    /* 0021B3 00 C0          */ EXPR.END
    /* 0021B5 01             */ CALC
    /* 0021B6 2C 60          */ PUSH.VAR 24620
    /* 0021B8 00 00          */ PUSH 0
    /* 0021BA 1B C0          */ EXPR.ASSIGN
    /* 0021BC 00 C0          */ EXPR.END
    /* 0021BE 01             */ CALC
    /* 0021BF 00 00          */ PUSH 0
    /* 0021C1 FF 00          */ PUSH 255
    /* 0021C3 3E 80          */ SYSCALL 0x0E ; ns_animation / sce_dummy_proc (2 arg(s))
    /* 0021C5 00 C0          */ EXPR.END
    /* 0021C7 03             */ RETURN

func_1FD4:
    /* 0021C8 01             */ CALC
    /* 0021C9 04 51          */ PUSH.VAR 20740
    /* 0021CB 02 00          */ PUSH 2
    /* 0021CD 1B C0          */ EXPR.ASSIGN
    /* 0021CF 00 C0          */ EXPR.END
  lab_1FDD:
    /* 0021D1 01             */ CALC
    /* 0021D2 04 51          */ PUSH.VAR 20740
    /* 0021D4 06 00          */ PUSH 6
    /* 0021D6 13 C0          */ EXPR.LESS_THAN_EQ
    /* 0021D8 00 C0          */ EXPR.END
    /* 0021DA 05 00 20       */ JZ lab_2000
    /* 0021DD 01             */ CALC
    /* 0021DE 04 51          */ PUSH.VAR 20740
    /* 0021E0 FF 00          */ PUSH 255
    /* 0021E2 FF 00          */ PUSH 255
    /* 0021E4 08 00          */ PUSH 8
    /* 0021E6 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0021E8 00 C0          */ EXPR.END
    /* 0021EA 01             */ CALC
    /* 0021EB 04 51          */ PUSH.VAR 20740
    /* 0021ED 01 C0          */ EXPR.POST_INC
    /* 0021EF 00 C0          */ EXPR.END
    /* 0021F1 04 DD 1F       */ JMP lab_1FDD
  lab_2000:
    /* 0021F4 01             */ CALC
    /* 0021F5 FF 00          */ PUSH 255
    /* 0021F7 FF 00          */ PUSH 255
    /* 0021F9 0C 00          */ PUSH 12
    /* 0021FB 70 80          */ SYSCALL 0x40 ; sce_scroll / sce_dummy_proc (3 arg(s))
    /* 0021FD 00 C0          */ EXPR.END
    /* 0021FF 01             */ CALC
    /* 002200 03 00          */ PUSH 3
    /* 002202 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 002204 00 C0          */ EXPR.END
    /* 002206 01             */ CALC
    /* 002207 02 00          */ PUSH 2
    /* 002209 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 00220B 00 C0          */ EXPR.END
    /* 00220D 01             */ CALC
    /* 00220E 05 00          */ PUSH 5
    /* 002210 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 002212 00 C0          */ EXPR.END
    /* 002214 01             */ CALC
    /* 002215 04 00          */ PUSH 4
    /* 002217 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 002219 00 C0          */ EXPR.END
    /* 00221B 01             */ CALC
    /* 00221C 06 00          */ PUSH 6
    /* 00221E 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 002220 00 C0          */ EXPR.END
    /* 002222 01             */ CALC
    /* 002223 00 00          */ PUSH 0
    /* 002225 8B 80          */ SYSCALL 0x5B ; sce_lock_person / sce_dummy_proc (1 arg(s))
    /* 002227 00 C0          */ EXPR.END
    /* 002229 01             */ CALC
    /* 00222A 73 80          */ SYSCALL 0x43 ; sce_wait_map_scroll / sce_dummy_proc (0 arg(s))
    /* 00222C 00 C0          */ EXPR.END
    /* 00222E 03             */ RETURN

func_203B:
    /* 00222F 01             */ CALC
    /* 002230 7F 80          */ SYSCALL 0x4F ; sce_start_demo / sce_start_demo (0 arg(s))
    /* 002232 00 C0          */ EXPR.END
    /* 002234 01             */ CALC
    /* 002235 3F 00          */ PUSH 63
    /* 002237 10 10 02       */ PUSH 528
    /* 00223A B0 10 01       */ PUSH 432
    /* 00223D 02 00          */ PUSH 2
    /* 00223F 71 10 01       */ PUSH 369
    /* 002242 00 00          */ PUSH 0
    /* 002244 00 00          */ PUSH 0
    /* 002246 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 002248 00 C0          */ EXPR.END
    /* 00224A 01             */ CALC
    /* 00224B 40 00          */ PUSH 64
    /* 00224D 40 10 02       */ PUSH 576
    /* 002250 B0 10 01       */ PUSH 432
    /* 002253 02 00          */ PUSH 2
    /* 002255 71 10 01       */ PUSH 369
    /* 002258 00 00          */ PUSH 0
    /* 00225A 00 00          */ PUSH 0
    /* 00225C 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00225E 00 C0          */ EXPR.END
    /* 002260 01             */ CALC
    /* 002261 C2 10 00       */ PUSH 194
    /* 002264 0C 00          */ PUSH 12
    /* 002266 00 00          */ PUSH 0
    /* 002268 00 00          */ PUSH 0
    /* 00226A 00 00          */ PUSH 0
    /* 00226C 97 10 00       */ PUSH 151
    /* 00226F 00 00          */ PUSH 0
    /* 002271 00 00          */ PUSH 0
    /* 002273 3F 00          */ PUSH 63
    /* 002275 00 00          */ PUSH 0
    /* 002277 00 00          */ PUSH 0
    /* 002279 02 00          */ PUSH 2
    /* 00227B 00 00          */ PUSH 0
    /* 00227D 00 00          */ PUSH 0
    /* 00227F 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 002281 00 C0          */ EXPR.END
    /* 002283 01             */ CALC
    /* 002284 C2 10 00       */ PUSH 194
    /* 002287 0C 00          */ PUSH 12
    /* 002289 00 00          */ PUSH 0
    /* 00228B 00 00          */ PUSH 0
    /* 00228D 00 00          */ PUSH 0
    /* 00228F 96 10 00       */ PUSH 150
    /* 002292 00 00          */ PUSH 0
    /* 002294 00 00          */ PUSH 0
    /* 002296 40 00          */ PUSH 64
    /* 002298 00 00          */ PUSH 0
    /* 00229A 00 00          */ PUSH 0
    /* 00229C 02 00          */ PUSH 2
    /* 00229E 00 00          */ PUSH 0
    /* 0022A0 00 00          */ PUSH 0
    /* 0022A2 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 0022A4 00 C0          */ EXPR.END
    /* 0022A6 01             */ CALC
    /* 0022A7 02 00          */ PUSH 2
    /* 0022A9 80 10 01       */ PUSH 384
    /* 0022AC F0 10 01       */ PUSH 496
    /* 0022AF 03 00          */ PUSH 3
    /* 0022B1 02 00          */ PUSH 2
    /* 0022B3 00 00          */ PUSH 0
    /* 0022B5 00 00          */ PUSH 0
    /* 0022B7 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0022B9 00 C0          */ EXPR.END
    /* 0022BB 01             */ CALC
    /* 0022BC 04 00          */ PUSH 4
    /* 0022BE 90 10 01       */ PUSH 400
    /* 0022C1 F0 10 01       */ PUSH 496
    /* 0022C4 03 00          */ PUSH 3
    /* 0022C6 04 00          */ PUSH 4
    /* 0022C8 00 00          */ PUSH 0
    /* 0022CA 00 00          */ PUSH 0
    /* 0022CC 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0022CE 00 C0          */ EXPR.END
    /* 0022D0 01             */ CALC
    /* 0022D1 05 00          */ PUSH 5
    /* 0022D3 A0 10 01       */ PUSH 416
    /* 0022D6 F0 10 01       */ PUSH 496
    /* 0022D9 03 00          */ PUSH 3
    /* 0022DB 05 00          */ PUSH 5
    /* 0022DD 00 00          */ PUSH 0
    /* 0022DF 00 00          */ PUSH 0
    /* 0022E1 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0022E3 00 C0          */ EXPR.END
    /* 0022E5 01             */ CALC
    /* 0022E6 03 00          */ PUSH 3
    /* 0022E8 B0 10 01       */ PUSH 432
    /* 0022EB F0 10 01       */ PUSH 496
    /* 0022EE 03 00          */ PUSH 3
    /* 0022F0 03 00          */ PUSH 3
    /* 0022F2 00 00          */ PUSH 0
    /* 0022F4 00 00          */ PUSH 0
    /* 0022F6 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0022F8 00 C0          */ EXPR.END
    /* 0022FA 01             */ CALC
    /* 0022FB 06 00          */ PUSH 6
    /* 0022FD 51 80          */ SYSCALL 0x21 ; sce_check_party / sce_check_party (1 arg(s))
    /* 0022FF 00 C0          */ EXPR.END
    /* 002301 05 3D 21       */ JZ lab_213D
    /* 002304 01             */ CALC
    /* 002305 06 00          */ PUSH 6
    /* 002307 D0 10 00       */ PUSH 208
    /* 00230A B0 10 01       */ PUSH 432
    /* 00230D 01 00          */ PUSH 1
    /* 00230F 06 00          */ PUSH 6
    /* 002311 00 00          */ PUSH 0
    /* 002313 00 00          */ PUSH 0
    /* 002315 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 002317 00 C0          */ EXPR.END
    /* 002319 01             */ CALC
    /* 00231A 06 00          */ PUSH 6
    /* 00231C 23 00          */ PUSH 35
    /* 00231E 3E 80          */ SYSCALL 0x0E ; ns_animation / sce_dummy_proc (2 arg(s))
    /* 002320 00 C0          */ EXPR.END
    /* 002322 01             */ CALC
    /* 002323 06 00          */ PUSH 6
    /* 002325 03 00          */ PUSH 3
    /* 002327 A0 10 00       */ PUSH 160
    /* 00232A 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 00232C 00 C0          */ EXPR.END
    /* 00232E 04 3D 21       */ JMP lab_213D
  lab_213D:
    /* 002331 01             */ CALC
    /* 002332 8E 10 00       */ PUSH 142
    /* 002335 50 10 01       */ PUSH 336
    /* 002338 F0 10 01       */ PUSH 496
    /* 00233B 00 00          */ PUSH 0
    /* 00233D E5 10 00       */ PUSH 229
    /* 002340 00 00          */ PUSH 0
    /* 002342 00 00          */ PUSH 0
    /* 002344 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 002346 00 C0          */ EXPR.END
    /* 002348 01             */ CALC
    /* 002349 7A 00          */ PUSH 122
    /* 00234B F0 10 00       */ PUSH 240
    /* 00234E B0 10 01       */ PUSH 432
    /* 002351 01 00          */ PUSH 1
    /* 002353 C9 10 00       */ PUSH 201
    /* 002356 00 00          */ PUSH 0
    /* 002358 00 00          */ PUSH 0
    /* 00235A 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00235C 00 C0          */ EXPR.END
    /* 00235E 01             */ CALC
    /* 00235F 8E 10 00       */ PUSH 142
    /* 002362 10 10 01       */ PUSH 272
    /* 002365 B0 10 01       */ PUSH 432
    /* 002368 08 00          */ PUSH 8
    /* 00236A 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 00236C 00 C0          */ EXPR.END
    /* 00236E 01             */ CALC
    /* 00236F 00 00          */ PUSH 0
    /* 002371 50 10 01       */ PUSH 336
    /* 002374 B0 10 01       */ PUSH 432
    /* 002377 08 00          */ PUSH 8
    /* 002379 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 00237B 00 C0          */ EXPR.END
    /* 00237D 01             */ CALC
    /* 00237E 02 00          */ PUSH 2
    /* 002380 50 10 01       */ PUSH 336
    /* 002383 A0 10 01       */ PUSH 416
    /* 002386 08 00          */ PUSH 8
    /* 002388 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 00238A 00 C0          */ EXPR.END
    /* 00238C 01             */ CALC
    /* 00238D 04 00          */ PUSH 4
    /* 00238F 50 10 01       */ PUSH 336
    /* 002392 C0 10 01       */ PUSH 448
    /* 002395 08 00          */ PUSH 8
    /* 002397 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 002399 00 C0          */ EXPR.END
    /* 00239B 01             */ CALC
    /* 00239C 05 00          */ PUSH 5
    /* 00239E 50 10 01       */ PUSH 336
    /* 0023A1 A0 10 01       */ PUSH 416
    /* 0023A4 08 00          */ PUSH 8
    /* 0023A6 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0023A8 00 C0          */ EXPR.END
    /* 0023AA 01             */ CALC
    /* 0023AB 03 00          */ PUSH 3
    /* 0023AD 50 10 01       */ PUSH 336
    /* 0023B0 B8 10 01       */ PUSH 440
    /* 0023B3 08 00          */ PUSH 8
    /* 0023B5 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0023B7 00 C0          */ EXPR.END
    /* 0023B9 01             */ CALC
    /* 0023BA 00 00          */ PUSH 0
    /* 0023BC 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 0023BE 00 C0          */ EXPR.END
    /* 0023C0 01             */ CALC
    /* 0023C1 00 00          */ PUSH 0
    /* 0023C3 20 10 01       */ PUSH 288
    /* 0023C6 B0 10 01       */ PUSH 432
    /* 0023C9 08 00          */ PUSH 8
    /* 0023CB 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0023CD 00 C0          */ EXPR.END
    /* 0023CF 01             */ CALC
    /* 0023D0 04 00          */ PUSH 4
    /* 0023D2 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 0023D4 00 C0          */ EXPR.END
    /* 0023D6 01             */ CALC
    /* 0023D7 04 00          */ PUSH 4
    /* 0023D9 28 10 01       */ PUSH 296
    /* 0023DC C0 10 01       */ PUSH 448
    /* 0023DF 08 00          */ PUSH 8
    /* 0023E1 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0023E3 00 C0          */ EXPR.END
    /* 0023E5 01             */ CALC
    /* 0023E6 02 00          */ PUSH 2
    /* 0023E8 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 0023EA 00 C0          */ EXPR.END
    /* 0023EC 01             */ CALC
    /* 0023ED 02 00          */ PUSH 2
    /* 0023EF 28 10 01       */ PUSH 296
    /* 0023F2 A0 10 01       */ PUSH 416
    /* 0023F5 08 00          */ PUSH 8
    /* 0023F7 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0023F9 00 C0          */ EXPR.END
    /* 0023FB 01             */ CALC
    /* 0023FC 03 00          */ PUSH 3
    /* 0023FE 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 002400 00 C0          */ EXPR.END
    /* 002402 01             */ CALC
    /* 002403 03 00          */ PUSH 3
    /* 002405 40 10 01       */ PUSH 320
    /* 002408 B8 10 01       */ PUSH 440
    /* 00240B 08 00          */ PUSH 8
    /* 00240D 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 00240F 00 C0          */ EXPR.END
    /* 002411 01             */ CALC
    /* 002412 05 00          */ PUSH 5
    /* 002414 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 002416 00 C0          */ EXPR.END
    /* 002418 01             */ CALC
    /* 002419 05 00          */ PUSH 5
    /* 00241B 40 10 01       */ PUSH 320
    /* 00241E A0 10 01       */ PUSH 416
    /* 002421 08 00          */ PUSH 8
    /* 002423 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 002425 00 C0          */ EXPR.END
    /* 002427 01             */ CALC
    /* 002428 03 00          */ PUSH 3
    /* 00242A 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 00242C 00 C0          */ EXPR.END
    /* 00242E 01             */ CALC
    /* 00242F 48 00          */ PUSH 72
    /* 002431 18 00          */ PUSH 24
    /* 002433 A8 80          */ SYSCALL 0x78 ; sce_wait_music_voice_start / sce_wait_music_voice_start (2 arg(s))
    /* 002435 00 C0          */ EXPR.END

msg_109:
    /* 002437 11 74 3B       */ sce_message message_109
    /* 00243A 01             */ CALC
    /* 00243B 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 00243D 00 C0          */ EXPR.END
    /* 00243F 01             */ CALC
    /* 002440 18 00          */ PUSH 24
    /* 002442 A9 80          */ SYSCALL 0x79 ; sce_wait_music_voice_end / sce_wait_music_voice_end (1 arg(s))
    /* 002444 00 C0          */ EXPR.END
    /* 002446 01             */ CALC
    /* 002447 8E 10 00       */ PUSH 142
    /* 00244A 42 80          */ SYSCALL 0x12 ; sce_set_direction_south / sce_dummy_proc (1 arg(s))
    /* 00244C 00 C0          */ EXPR.END
    /* 00244E 01             */ CALC
    /* 00244F 8E 10 00       */ PUSH 142
    /* 002452 50 10 01       */ PUSH 336
    /* 002455 D0 10 01       */ PUSH 464
    /* 002458 0C 00          */ PUSH 12
    /* 00245A 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 00245C 00 C0          */ EXPR.END
    /* 00245E 01             */ CALC
    /* 00245F 06 00          */ PUSH 6
    /* 002461 51 80          */ SYSCALL 0x21 ; sce_check_party / sce_check_party (1 arg(s))
    /* 002463 00 C0          */ EXPR.END
    /* 002465 05 B7 22       */ JZ lab_22B7
    /* 002468 01             */ CALC
    /* 002469 04 51          */ PUSH.VAR 20740
    /* 00246B A0 10 00       */ PUSH 160
    /* 00246E 1B C0          */ EXPR.ASSIGN
    /* 002470 00 C0          */ EXPR.END
  lab_227E:
    /* 002472 01             */ CALC
    /* 002473 04 51          */ PUSH.VAR 20740
    /* 002475 00 C0          */ EXPR.END
    /* 002477 05 A4 22       */ JZ lab_22A4
    /* 00247A 01             */ CALC
    /* 00247B 06 00          */ PUSH 6
    /* 00247D 03 00          */ PUSH 3
    /* 00247F 04 51          */ PUSH.VAR 20740
    /* 002481 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 002483 00 C0          */ EXPR.END
    /* 002485 01             */ CALC
    /* 002486 01 00          */ PUSH 1
    /* 002488 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 00248A 00 C0          */ EXPR.END
    /* 00248C 01             */ CALC
    /* 00248D 04 51          */ PUSH.VAR 20740
    /* 00248F 04 00          */ PUSH 4
    /* 002491 20 C0          */ EXPR.SELF_SUB
    /* 002493 00 C0          */ EXPR.END
    /* 002495 04 7E 22       */ JMP lab_227E
  lab_22A4:
    /* 002498 01             */ CALC
    /* 002499 3C 00          */ PUSH 60
    /* 00249B 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 00249D 00 C0          */ EXPR.END
    /* 00249F 01             */ CALC
    /* 0024A0 06 00          */ PUSH 6
    /* 0024A2 FF 00          */ PUSH 255
    /* 0024A4 3E 80          */ SYSCALL 0x0E ; ns_animation / sce_dummy_proc (2 arg(s))
    /* 0024A6 00 C0          */ EXPR.END
    /* 0024A8 04 B7 22       */ JMP lab_22B7
  lab_22B7:
    /* 0024AB 01             */ CALC
    /* 0024AC 8E 10 00       */ PUSH 142
    /* 0024AF 02 00          */ PUSH 2
    /* 0024B1 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 0024B3 00 C0          */ EXPR.END
    /* 0024B5 01             */ CALC
    /* 0024B6 8E 10 00       */ PUSH 142
    /* 0024B9 C0 10 01       */ PUSH 448
    /* 0024BC F0 10 01       */ PUSH 496
    /* 0024BF 0C 00          */ PUSH 12
    /* 0024C1 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0024C3 00 C0          */ EXPR.END
    /* 0024C5 01             */ CALC
    /* 0024C6 8E 10 00       */ PUSH 142
    /* 0024C9 00 00          */ PUSH 0
    /* 0024CB 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 0024CD 00 C0          */ EXPR.END
    /* 0024CF 01             */ CALC
    /* 0024D0 8E 10 00       */ PUSH 142
    /* 0024D3 C0 10 01       */ PUSH 448
    /* 0024D6 50 10 01       */ PUSH 336
    /* 0024D9 0C 00          */ PUSH 12
    /* 0024DB 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0024DD 00 C0          */ EXPR.END
    /* 0024DF 01             */ CALC
    /* 0024E0 8E 10 00       */ PUSH 142
    /* 0024E3 03 00          */ PUSH 3
    /* 0024E5 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 0024E7 00 C0          */ EXPR.END
    /* 0024E9 01             */ CALC
    /* 0024EA 8E 10 00       */ PUSH 142
    /* 0024ED 88 10 01       */ PUSH 392
    /* 0024F0 90 10 01       */ PUSH 400
    /* 0024F3 0C 00          */ PUSH 12
    /* 0024F5 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0024F7 00 C0          */ EXPR.END
    /* 0024F9 01             */ CALC
    /* 0024FA 48 00          */ PUSH 72
    /* 0024FC 18 00          */ PUSH 24
    /* 0024FE A8 80          */ SYSCALL 0x78 ; sce_wait_music_voice_start / sce_wait_music_voice_start (2 arg(s))
    /* 002500 00 C0          */ EXPR.END

msg_110:
    /* 002502 11 C2 3B       */ sce_message message_110
    /* 002505 01             */ CALC
    /* 002506 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 002508 00 C0          */ EXPR.END
    /* 00250A 01             */ CALC
    /* 00250B 00 00          */ PUSH 0
    /* 00250D 10 10 01       */ PUSH 272
    /* 002510 B0 10 01       */ PUSH 432
    /* 002513 0C 00          */ PUSH 12
    /* 002515 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 002517 00 C0          */ EXPR.END
    /* 002519 01             */ CALC
    /* 00251A 02 00          */ PUSH 2
    /* 00251C 20 10 01       */ PUSH 288
    /* 00251F A0 10 01       */ PUSH 416
    /* 002522 0C 00          */ PUSH 12
    /* 002524 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 002526 00 C0          */ EXPR.END
    /* 002528 01             */ CALC
    /* 002529 04 00          */ PUSH 4
    /* 00252B 20 10 01       */ PUSH 288
    /* 00252E C0 10 01       */ PUSH 448
    /* 002531 0C 00          */ PUSH 12
    /* 002533 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 002535 00 C0          */ EXPR.END
    /* 002537 01             */ CALC
    /* 002538 00 00          */ PUSH 0
    /* 00253A 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 00253C 00 C0          */ EXPR.END

msg_111:
    /* 00253E 14 E6 3B       */ sce_message_nc message_111
    /* 002541 01             */ CALC
    /* 002542 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 002544 00 C0          */ EXPR.END
    /* 002546 01             */ CALC
    /* 002547 03 00          */ PUSH 3
    /* 002549 03 00          */ PUSH 3
    /* 00254B 10 00          */ PUSH 16
    /* 00254D 08 00          */ PUSH 8
    /* 00254F 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 002551 00 C0          */ EXPR.END
    /* 002553 01             */ CALC
    /* 002554 05 00          */ PUSH 5
    /* 002556 03 00          */ PUSH 3
    /* 002558 10 00          */ PUSH 16
    /* 00255A 08 00          */ PUSH 8
    /* 00255C 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 00255E 00 C0          */ EXPR.END
    /* 002560 01             */ CALC
    /* 002561 06 00          */ PUSH 6
    /* 002563 01 00          */ PUSH 1
    /* 002565 10 00          */ PUSH 16
    /* 002567 08 00          */ PUSH 8
    /* 002569 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 00256B 00 C0          */ EXPR.END

msg_112:
    /* 00256D 11 40 3C       */ sce_message message_112
    /* 002570 01             */ CALC
    /* 002571 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 002573 00 C0          */ EXPR.END
    /* 002575 01             */ CALC
    /* 002576 18 00          */ PUSH 24
    /* 002578 A9 80          */ SYSCALL 0x79 ; sce_wait_music_voice_end / sce_wait_music_voice_end (1 arg(s))
    /* 00257A 00 C0          */ EXPR.END
    /* 00257C 01             */ CALC
    /* 00257D 7A 00          */ PUSH 122
    /* 00257F 00 10 01       */ PUSH 256
    /* 002582 A0 10 00       */ PUSH 160
    /* 002585 08 00          */ PUSH 8
    /* 002587 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 002589 00 C0          */ EXPR.END
    /* 00258B 01             */ CALC
    /* 00258C 3C 00          */ PUSH 60
    /* 00258E 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 002590 00 C0          */ EXPR.END
    /* 002592 01             */ CALC
    /* 002593 00 00          */ PUSH 0
    /* 002595 00 10 01       */ PUSH 256
    /* 002598 B0 10 00       */ PUSH 176
    /* 00259B 08 00          */ PUSH 8
    /* 00259D 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 00259F 00 C0          */ EXPR.END
    /* 0025A1 01             */ CALC
    /* 0025A2 1E 00          */ PUSH 30
    /* 0025A4 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0025A6 00 C0          */ EXPR.END
    /* 0025A8 01             */ CALC
    /* 0025A9 02 00          */ PUSH 2
    /* 0025AB F0 10 00       */ PUSH 240
    /* 0025AE B0 10 00       */ PUSH 176
    /* 0025B1 08 00          */ PUSH 8
    /* 0025B3 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0025B5 00 C0          */ EXPR.END
    /* 0025B7 01             */ CALC
    /* 0025B8 1E 00          */ PUSH 30
    /* 0025BA 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0025BC 00 C0          */ EXPR.END
    /* 0025BE 01             */ CALC
    /* 0025BF 04 00          */ PUSH 4
    /* 0025C1 10 10 01       */ PUSH 272
    /* 0025C4 B0 10 00       */ PUSH 176
    /* 0025C7 08 00          */ PUSH 8
    /* 0025C9 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0025CB 00 C0          */ EXPR.END
    /* 0025CD 01             */ CALC
    /* 0025CE 05 00          */ PUSH 5
    /* 0025D0 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0025D2 00 C0          */ EXPR.END
    /* 0025D4 01             */ CALC
    /* 0025D5 03 00          */ PUSH 3
    /* 0025D7 00 10 01       */ PUSH 256
    /* 0025DA C8 10 00       */ PUSH 200
    /* 0025DD 08 00          */ PUSH 8
    /* 0025DF 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0025E1 00 C0          */ EXPR.END
    /* 0025E3 01             */ CALC
    /* 0025E4 3C 00          */ PUSH 60
    /* 0025E6 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0025E8 00 C0          */ EXPR.END
    /* 0025EA 01             */ CALC
    /* 0025EB 05 00          */ PUSH 5
    /* 0025ED 10 10 01       */ PUSH 272
    /* 0025F0 C8 10 00       */ PUSH 200
    /* 0025F3 08 00          */ PUSH 8
    /* 0025F5 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0025F7 00 C0          */ EXPR.END
    /* 0025F9 01             */ CALC
    /* 0025FA 06 00          */ PUSH 6
    /* 0025FC F0 10 00       */ PUSH 240
    /* 0025FF C8 10 00       */ PUSH 200
    /* 002602 08 00          */ PUSH 8
    /* 002604 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 002606 00 C0          */ EXPR.END
    /* 002608 01             */ CALC
    /* 002609 00 00          */ PUSH 0
    /* 00260B 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 00260D 00 C0          */ EXPR.END
    /* 00260F 01             */ CALC
    /* 002610 48 00          */ PUSH 72
    /* 002612 18 00          */ PUSH 24
    /* 002614 A8 80          */ SYSCALL 0x78 ; sce_wait_music_voice_start / sce_wait_music_voice_start (2 arg(s))
    /* 002616 00 C0          */ EXPR.END

msg_113:
    /* 002618 11 E4 3D       */ sce_message message_113
    /* 00261B 01             */ CALC
    /* 00261C 06 00          */ PUSH 6
    /* 00261E 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 002620 00 C0          */ EXPR.END
    /* 002622 01             */ CALC
    /* 002623 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 002625 00 C0          */ EXPR.END
    /* 002627 01             */ CALC
    /* 002628 7A 00          */ PUSH 122
    /* 00262A 43 80          */ SYSCALL 0x13 ; sce_set_direction_west / sce_dummy_proc (1 arg(s))
    /* 00262C 00 C0          */ EXPR.END
    /* 00262E 01             */ CALC
    /* 00262F 7A 00          */ PUSH 122
    /* 002631 D8 10 00       */ PUSH 216
    /* 002634 80 10 00       */ PUSH 128
    /* 002637 08 00          */ PUSH 8
    /* 002639 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 00263B 00 C0          */ EXPR.END
    /* 00263D 01             */ CALC
    /* 00263E 7A 00          */ PUSH 122
    /* 002640 02 00          */ PUSH 2
    /* 002642 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 002644 00 C0          */ EXPR.END
    /* 002646 01             */ CALC
    /* 002647 3C 00          */ PUSH 60
    /* 002649 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 00264B 00 C0          */ EXPR.END

msg_114:
    /* 00264D 11 5E 3E       */ sce_message message_114
    /* 002650 01             */ CALC
    /* 002651 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 002653 00 C0          */ EXPR.END
    /* 002655 01             */ CALC
    /* 002656 18 00          */ PUSH 24
    /* 002658 A9 80          */ SYSCALL 0x79 ; sce_wait_music_voice_end / sce_wait_music_voice_end (1 arg(s))
    /* 00265A 00 C0          */ EXPR.END
    /* 00265C 01             */ CALC
    /* 00265D 74 50          */ PUSH.VAR 20596
    /* 00265F D6 10 01       */ PUSH 470
    /* 002662 1B C0          */ EXPR.ASSIGN
    /* 002664 00 C0          */ EXPR.END
    /* 002666 02 D4 1F       */ CALL func_1FD4
    /* 002669 01             */ CALC
    /* 00266A DF 10 00       */ PUSH 223
    /* 00266D 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 00266F 00 C0          */ EXPR.END
    /* 002671 01             */ CALC
    /* 002672 8E 10 00       */ PUSH 142
    /* 002675 37 80          */ SYSCALL 0x07 ; ns_delete_person / tsce_delete_person (1 arg(s))
    /* 002677 00 C0          */ EXPR.END
    /* 002679 01             */ CALC
    /* 00267A 80 80          */ SYSCALL 0x50 ; sce_finish_demo / sce_finish_demo (0 arg(s))
    /* 00267C 00 C0          */ EXPR.END
    /* 00267E 03             */ RETURN

func_248B:
    /* 00267F 01             */ CALC
    /* 002680 7F 80          */ SYSCALL 0x4F ; sce_start_demo / sce_start_demo (0 arg(s))
    /* 002682 00 C0          */ EXPR.END
    /* 002684 01             */ CALC
    /* 002685 16 00          */ PUSH 22
    /* 002687 00 00          */ PUSH 0
    /* 002689 00 00          */ PUSH 0
    /* 00268B 96 80          */ SYSCALL 0x66 ; sce_music / sce_music (3 arg(s))
    /* 00268D 00 C0          */ EXPR.END
    /* 00268F 01             */ CALC
    /* 002690 00 00          */ PUSH 0
    /* 002692 E0 10 01       */ PUSH 480
    /* 002695 C0 10 01       */ PUSH 448
    /* 002698 3F 80          */ SYSCALL 0x0F ; ns_set_position / tsce_set_position (3 arg(s))
    /* 00269A 00 C0          */ EXPR.END
    /* 00269C 01             */ CALC
    /* 00269D 00 00          */ PUSH 0
    /* 00269F 41 80          */ SYSCALL 0x11 ; sce_set_direction_east / sce_dummy_proc (1 arg(s))
    /* 0026A1 00 C0          */ EXPR.END
    /* 0026A3 01             */ CALC
    /* 0026A4 FF 00          */ PUSH 255
    /* 0026A6 B0 10 01       */ PUSH 432
    /* 0026A9 72 80          */ SYSCALL 0x42 ; ns_scroll_direct / sce_dummy_proc (2 arg(s))
    /* 0026AB 00 C0          */ EXPR.END
    /* 0026AD 01             */ CALC
    /* 0026AE 7A 00          */ PUSH 122
    /* 0026B0 37 80          */ SYSCALL 0x07 ; ns_delete_person / tsce_delete_person (1 arg(s))
    /* 0026B2 00 C0          */ EXPR.END
    /* 0026B4 01             */ CALC
    /* 0026B5 7A 00          */ PUSH 122
    /* 0026B7 00 10 02       */ PUSH 512
    /* 0026BA C0 10 01       */ PUSH 448
    /* 0026BD 03 00          */ PUSH 3
    /* 0026BF C9 10 00       */ PUSH 201
    /* 0026C2 00 00          */ PUSH 0
    /* 0026C4 00 00          */ PUSH 0
    /* 0026C6 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0026C8 00 C0          */ EXPR.END
    /* 0026CA 01             */ CALC
    /* 0026CB 02 00          */ PUSH 2
    /* 0026CD D8 10 01       */ PUSH 472
    /* 0026D0 D0 10 01       */ PUSH 464
    /* 0026D3 01 00          */ PUSH 1
    /* 0026D5 02 00          */ PUSH 2
    /* 0026D7 00 00          */ PUSH 0
    /* 0026D9 00 00          */ PUSH 0
    /* 0026DB 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0026DD 00 C0          */ EXPR.END
    /* 0026DF 01             */ CALC
    /* 0026E0 04 00          */ PUSH 4
    /* 0026E2 E8 10 01       */ PUSH 488
    /* 0026E5 B0 10 01       */ PUSH 432
    /* 0026E8 01 00          */ PUSH 1
    /* 0026EA 04 00          */ PUSH 4
    /* 0026EC 00 00          */ PUSH 0
    /* 0026EE 00 00          */ PUSH 0
    /* 0026F0 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0026F2 00 C0          */ EXPR.END
    /* 0026F4 01             */ CALC
    /* 0026F5 05 00          */ PUSH 5
    /* 0026F7 C8 10 01       */ PUSH 456
    /* 0026FA C0 10 01       */ PUSH 448
    /* 0026FD 01 00          */ PUSH 1
    /* 0026FF 05 00          */ PUSH 5
    /* 002701 00 00          */ PUSH 0
    /* 002703 00 00          */ PUSH 0
    /* 002705 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 002707 00 C0          */ EXPR.END
    /* 002709 01             */ CALC
    /* 00270A 03 00          */ PUSH 3
    /* 00270C C0 10 01       */ PUSH 448
    /* 00270F D0 10 01       */ PUSH 464
    /* 002712 01 00          */ PUSH 1
    /* 002714 03 00          */ PUSH 3
    /* 002716 00 00          */ PUSH 0
    /* 002718 00 00          */ PUSH 0
    /* 00271A 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00271C 00 C0          */ EXPR.END
    /* 00271E 01             */ CALC
    /* 00271F 06 00          */ PUSH 6
    /* 002721 51 80          */ SYSCALL 0x21 ; sce_check_party / sce_check_party (1 arg(s))
    /* 002723 00 C0          */ EXPR.END
    /* 002725 05 4C 25       */ JZ lab_254C
    /* 002728 01             */ CALC
    /* 002729 06 00          */ PUSH 6
    /* 00272B D0 10 01       */ PUSH 464
    /* 00272E B0 10 01       */ PUSH 432
    /* 002731 01 00          */ PUSH 1
    /* 002733 06 00          */ PUSH 6
    /* 002735 00 00          */ PUSH 0
    /* 002737 00 00          */ PUSH 0
    /* 002739 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 00273B 00 C0          */ EXPR.END
    /* 00273D 04 4C 25       */ JMP lab_254C
  lab_254C:
    /* 002740 01             */ CALC
    /* 002741 01 00          */ PUSH 1
    /* 002743 8B 80          */ SYSCALL 0x5B ; sce_lock_person / sce_dummy_proc (1 arg(s))
    /* 002745 00 C0          */ EXPR.END
    /* 002747 01             */ CALC
    /* 002748 A0 10 03       */ PUSH 928
    /* 00274B 63 80          */ SYSCALL 0x33 ; sce_get_switch / sce_get_switch (1 arg(s))
    /* 00274D 00 C0          */ EXPR.END
    /* 00274F 05 92 25       */ JZ lab_2592
    /* 002752 01             */ CALC
    /* 002753 01 00          */ PUSH 1
    /* 002755 00 00          */ PUSH 0
    /* 002757 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 002759 00 C0          */ EXPR.END
    /* 00275B 01             */ CALC
    /* 00275C 10 60          */ PUSH.VAR 24592
    /* 00275E 01 00          */ PUSH 1
    /* 002760 1B C0          */ EXPR.ASSIGN
    /* 002762 00 C0          */ EXPR.END
    /* 002764 01             */ CALC
    /* 002765 8F 10 00       */ PUSH 143
    /* 002768 86 80          */ SYSCALL 0x56 ; sce_special_event / sce_special_event (1 arg(s))
    /* 00276A 00 C0          */ EXPR.END
    /* 00276C 01             */ CALC
    /* 00276D 01 00          */ PUSH 1
    /* 00276F 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 002771 00 C0          */ EXPR.END
    /* 002773 01             */ CALC
    /* 002774 00 00          */ PUSH 0
    /* 002776 00 00          */ PUSH 0
    /* 002778 83 80          */ SYSCALL 0x53 ; sce_fade / sce_fade (2 arg(s))
    /* 00277A 00 C0          */ EXPR.END
    /* 00277C 01             */ CALC
    /* 00277D 4F 00          */ PUSH 79
    /* 00277F 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 002781 00 C0          */ EXPR.END
    /* 002783 04 92 25       */ JMP lab_2592
  lab_2592:
    /* 002786 01             */ CALC
    /* 002787 10 00          */ PUSH 16
    /* 002789 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 00278B 00 C0          */ EXPR.END
    /* 00278D 01             */ CALC
    /* 00278E 01 00          */ PUSH 1
    /* 002790 34 80          */ SYSCALL 0x04 ; sce_conv_win / sce_conv_win (1 arg(s))
    /* 002792 00 C0          */ EXPR.END
    /* 002794 01             */ CALC
    /* 002795 48 00          */ PUSH 72
    /* 002797 18 00          */ PUSH 24
    /* 002799 A8 80          */ SYSCALL 0x78 ; sce_wait_music_voice_start / sce_wait_music_voice_start (2 arg(s))
    /* 00279B 00 C0          */ EXPR.END

msg_115:
    /* 00279D 11 D8 44       */ sce_message message_115
    /* 0027A0 01             */ CALC
    /* 0027A1 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 0027A3 00 C0          */ EXPR.END
    /* 0027A5 01             */ CALC
    /* 0027A6 19 10 FC       */ PUSH 64537
    /* 0027A9 0D 00          */ PUSH 13
    /* 0027AB 00 00          */ PUSH 0
    /* 0027AD 00 00          */ PUSH 0
    /* 0027AF 00 00          */ PUSH 0
    /* 0027B1 0D 00          */ PUSH 13
    /* 0027B3 00 00          */ PUSH 0
    /* 0027B5 00 00          */ PUSH 0
    /* 0027B7 04 00          */ PUSH 4
    /* 0027B9 02 00          */ PUSH 2
    /* 0027BB 78 00          */ PUSH 120
    /* 0027BD 00 00          */ PUSH 0
    /* 0027BF 00 00          */ PUSH 0
    /* 0027C1 00 00          */ PUSH 0
    /* 0027C3 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 0027C5 00 C0          */ EXPR.END
    /* 0027C7 01             */ CALC
    /* 0027C8 78 00          */ PUSH 120
    /* 0027CA 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0027CC 00 C0          */ EXPR.END

msg_116:
    /* 0027CE 11 50 46       */ sce_message message_116
    /* 0027D1 01             */ CALC
    /* 0027D2 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 0027D4 00 C0          */ EXPR.END
    /* 0027D6 01             */ CALC
    /* 0027D7 19 10 FC       */ PUSH 64537
    /* 0027DA 0D 00          */ PUSH 13
    /* 0027DC 00 00          */ PUSH 0
    /* 0027DE 00 00          */ PUSH 0
    /* 0027E0 00 00          */ PUSH 0
    /* 0027E2 0D 00          */ PUSH 13
    /* 0027E4 00 00          */ PUSH 0
    /* 0027E6 00 00          */ PUSH 0
    /* 0027E8 04 00          */ PUSH 4
    /* 0027EA 02 00          */ PUSH 2
    /* 0027EC 78 00          */ PUSH 120
    /* 0027EE 00 00          */ PUSH 0
    /* 0027F0 00 00          */ PUSH 0
    /* 0027F2 00 00          */ PUSH 0
    /* 0027F4 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 0027F6 00 C0          */ EXPR.END
    /* 0027F8 01             */ CALC
    /* 0027F9 78 00          */ PUSH 120
    /* 0027FB 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 0027FD 00 C0          */ EXPR.END

msg_117:
    /* 0027FF 14 1A 48       */ sce_message_nc message_117
    /* 002802 01             */ CALC
    /* 002803 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 002805 00 C0          */ EXPR.END
    /* 002807 01             */ CALC
    /* 002808 04 00          */ PUSH 4
    /* 00280A 42 80          */ SYSCALL 0x12 ; sce_set_direction_south / sce_dummy_proc (1 arg(s))
    /* 00280C 00 C0          */ EXPR.END

msg_118:
    /* 00280E 11 60 48       */ sce_message message_118
    /* 002811 01             */ CALC
    /* 002812 31 80          */ SYSCALL 0x01 ; sce_wait_message_status / sce_wait_message_status (0 arg(s))
    /* 002814 00 C0          */ EXPR.END
    /* 002816 01             */ CALC
    /* 002817 18 00          */ PUSH 24
    /* 002819 A9 80          */ SYSCALL 0x79 ; sce_wait_music_voice_end / sce_wait_music_voice_end (1 arg(s))
    /* 00281B 00 C0          */ EXPR.END
    /* 00281D 01             */ CALC
    /* 00281E 00 00          */ PUSH 0
    /* 002820 05 00          */ PUSH 5
    /* 002822 02 00          */ PUSH 2
    /* 002824 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 002826 00 C0          */ EXPR.END
    /* 002828 01             */ CALC
    /* 002829 03 00          */ PUSH 3
    /* 00282B 05 00          */ PUSH 5
    /* 00282D 02 00          */ PUSH 2
    /* 00282F 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 002831 00 C0          */ EXPR.END
    /* 002833 01             */ CALC
    /* 002834 05 00          */ PUSH 5
    /* 002836 05 00          */ PUSH 5
    /* 002838 02 00          */ PUSH 2
    /* 00283A 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 00283C 00 C0          */ EXPR.END
    /* 00283E 01             */ CALC
    /* 00283F 04 00          */ PUSH 4
    /* 002841 05 00          */ PUSH 5
    /* 002843 02 00          */ PUSH 2
    /* 002845 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 002847 00 C0          */ EXPR.END
    /* 002849 01             */ CALC
    /* 00284A 06 00          */ PUSH 6
    /* 00284C 05 00          */ PUSH 5
    /* 00284E 02 00          */ PUSH 2
    /* 002850 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 002852 00 C0          */ EXPR.END
    /* 002854 01             */ CALC
    /* 002855 00 00          */ PUSH 0
    /* 002857 00 00          */ PUSH 0
    /* 002859 10 00          */ PUSH 16
    /* 00285B 0C 00          */ PUSH 12
    /* 00285D 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 00285F 00 C0          */ EXPR.END
    /* 002861 01             */ CALC
    /* 002862 03 00          */ PUSH 3
    /* 002864 03 00          */ PUSH 3
    /* 002866 10 00          */ PUSH 16
    /* 002868 0C 00          */ PUSH 12
    /* 00286A 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 00286C 00 C0          */ EXPR.END
    /* 00286E 01             */ CALC
    /* 00286F 05 00          */ PUSH 5
    /* 002871 00 00          */ PUSH 0
    /* 002873 10 00          */ PUSH 16
    /* 002875 0C 00          */ PUSH 12
    /* 002877 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 002879 00 C0          */ EXPR.END
    /* 00287B 01             */ CALC
    /* 00287C 04 00          */ PUSH 4
    /* 00287E 00 00          */ PUSH 0
    /* 002880 10 00          */ PUSH 16
    /* 002882 0C 00          */ PUSH 12
    /* 002884 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 002886 00 C0          */ EXPR.END
    /* 002888 01             */ CALC
    /* 002889 06 00          */ PUSH 6
    /* 00288B 00 00          */ PUSH 0
    /* 00288D 10 00          */ PUSH 16
    /* 00288F 0C 00          */ PUSH 12
    /* 002891 39 80          */ SYSCALL 0x09 ; ns_move / tsce_move (4 arg(s))
    /* 002893 00 C0          */ EXPR.END
    /* 002895 01             */ CALC
    /* 002896 00 00          */ PUSH 0
    /* 002898 3B 80          */ SYSCALL 0x0B ; sce_wait_move_check / sce_wait_move_check (1 arg(s))
    /* 00289A 00 C0          */ EXPR.END
    /* 00289C 01             */ CALC
    /* 00289D 02 00          */ PUSH 2
    /* 00289F 40 80          */ SYSCALL 0x10 ; sce_set_direction_north / sce_dummy_proc (1 arg(s))
    /* 0028A1 00 C0          */ EXPR.END
    /* 0028A3 01             */ CALC
    /* 0028A4 7A 00          */ PUSH 122
    /* 0028A6 C0 10 01       */ PUSH 448
    /* 0028A9 F0 10 01       */ PUSH 496
    /* 0028AC 0C 00          */ PUSH 12
    /* 0028AE 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0028B0 00 C0          */ EXPR.END
    /* 0028B2 01             */ CALC
    /* 0028B3 7A 00          */ PUSH 122
    /* 0028B5 03 00          */ PUSH 3
    /* 0028B7 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 0028B9 00 C0          */ EXPR.END
    /* 0028BB 01             */ CALC
    /* 0028BC 7A 00          */ PUSH 122
    /* 0028BE 40 10 01       */ PUSH 320
    /* 0028C1 F0 10 01       */ PUSH 496
    /* 0028C4 0C 00          */ PUSH 12
    /* 0028C6 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0028C8 00 C0          */ EXPR.END
    /* 0028CA 01             */ CALC
    /* 0028CB 7A 00          */ PUSH 122
    /* 0028CD 00 00          */ PUSH 0
    /* 0028CF 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 0028D1 00 C0          */ EXPR.END
    /* 0028D3 01             */ CALC
    /* 0028D4 7A 00          */ PUSH 122
    /* 0028D6 40 10 01       */ PUSH 320
    /* 0028D9 B0 10 01       */ PUSH 432
    /* 0028DC 0C 00          */ PUSH 12
    /* 0028DE 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0028E0 00 C0          */ EXPR.END
    /* 0028E2 01             */ CALC
    /* 0028E3 7A 00          */ PUSH 122
    /* 0028E5 03 00          */ PUSH 3
    /* 0028E7 3C 80          */ SYSCALL 0x0C ; sce_wait_move_check2 / sce_dummy_proc (2 arg(s))
    /* 0028E9 00 C0          */ EXPR.END
    /* 0028EB 01             */ CALC
    /* 0028EC 7A 00          */ PUSH 122
    /* 0028EE F0 10 00       */ PUSH 240
    /* 0028F1 B0 10 01       */ PUSH 432
    /* 0028F4 0C 00          */ PUSH 12
    /* 0028F6 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 0028F8 00 C0          */ EXPR.END
    /* 0028FA 01             */ CALC
    /* 0028FB 00 00          */ PUSH 0
    /* 0028FD 05 00          */ PUSH 5
    /* 0028FF 00 00          */ PUSH 0
    /* 002901 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 002903 00 C0          */ EXPR.END
    /* 002905 01             */ CALC
    /* 002906 04 51          */ PUSH.VAR 20740
    /* 002908 03 00          */ PUSH 3
    /* 00290A 1B C0          */ EXPR.ASSIGN
    /* 00290C 00 C0          */ EXPR.END
  lab_271A:
    /* 00290E 01             */ CALC
    /* 00290F 04 51          */ PUSH.VAR 20740
    /* 002911 06 00          */ PUSH 6
    /* 002913 13 C0          */ EXPR.LESS_THAN_EQ
    /* 002915 00 C0          */ EXPR.END
    /* 002917 05 3B 27       */ JZ lab_273B
    /* 00291A 01             */ CALC
    /* 00291B 04 51          */ PUSH.VAR 20740
    /* 00291D 05 00          */ PUSH 5
    /* 00291F 00 00          */ PUSH 0
    /* 002921 55 80          */ SYSCALL 0x25 ; sce_party_parameter / sce_party_parameter (3 arg(s))
    /* 002923 00 C0          */ EXPR.END
    /* 002925 01             */ CALC
    /* 002926 04 51          */ PUSH.VAR 20740
    /* 002928 01 C0          */ EXPR.POST_INC
    /* 00292A 00 C0          */ EXPR.END
    /* 00292C 04 1A 27       */ JMP lab_271A
  lab_273B:
    /* 00292F 01             */ CALC
    /* 002930 04 51          */ PUSH.VAR 20740
    /* 002932 02 00          */ PUSH 2
    /* 002934 1B C0          */ EXPR.ASSIGN
    /* 002936 00 C0          */ EXPR.END
  lab_2744:
    /* 002938 01             */ CALC
    /* 002939 04 51          */ PUSH.VAR 20740
    /* 00293B 06 00          */ PUSH 6
    /* 00293D 13 C0          */ EXPR.LESS_THAN_EQ
    /* 00293F 00 C0          */ EXPR.END
    /* 002941 05 67 27       */ JZ lab_2767
    /* 002944 01             */ CALC
    /* 002945 04 51          */ PUSH.VAR 20740
    /* 002947 FF 00          */ PUSH 255
    /* 002949 FF 00          */ PUSH 255
    /* 00294B 08 00          */ PUSH 8
    /* 00294D 38 80          */ SYSCALL 0x08 ; ns_move_position / tsce_move_position (4 arg(s))
    /* 00294F 00 C0          */ EXPR.END
    /* 002951 01             */ CALC
    /* 002952 04 51          */ PUSH.VAR 20740
    /* 002954 01 C0          */ EXPR.POST_INC
    /* 002956 00 C0          */ EXPR.END
    /* 002958 04 44 27       */ JMP lab_2744
  lab_2767:
    /* 00295B 01             */ CALC
    /* 00295C FF 00          */ PUSH 255
    /* 00295E FF 00          */ PUSH 255
    /* 002960 0C 00          */ PUSH 12
    /* 002962 70 80          */ SYSCALL 0x40 ; sce_scroll / sce_dummy_proc (3 arg(s))
    /* 002964 00 C0          */ EXPR.END
    /* 002966 01             */ CALC
    /* 002967 05 00          */ PUSH 5
    /* 002969 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 00296B 00 C0          */ EXPR.END
    /* 00296D 01             */ CALC
    /* 00296E 04 00          */ PUSH 4
    /* 002970 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 002972 00 C0          */ EXPR.END
    /* 002974 01             */ CALC
    /* 002975 06 00          */ PUSH 6
    /* 002977 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 002979 00 C0          */ EXPR.END
    /* 00297B 01             */ CALC
    /* 00297C 02 00          */ PUSH 2
    /* 00297E 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 002980 00 C0          */ EXPR.END
    /* 002982 01             */ CALC
    /* 002983 03 00          */ PUSH 3
    /* 002985 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 002987 00 C0          */ EXPR.END
    /* 002989 01             */ CALC
    /* 00298A 00 00          */ PUSH 0
    /* 00298C 8B 80          */ SYSCALL 0x5B ; sce_lock_person / sce_dummy_proc (1 arg(s))
    /* 00298E 00 C0          */ EXPR.END
    /* 002990 01             */ CALC
    /* 002991 7A 00          */ PUSH 122
    /* 002993 3D 80          */ SYSCALL 0x0D ; sce_wait_move_check_delete / sce_wait_move_check_delete (1 arg(s))
    /* 002995 00 C0          */ EXPR.END
    /* 002997 01             */ CALC
    /* 002998 7A 00          */ PUSH 122
    /* 00299A E0 10 00       */ PUSH 224
    /* 00299D 80 10 00       */ PUSH 128
    /* 0029A0 02 00          */ PUSH 2
    /* 0029A2 C9 10 00       */ PUSH 201
    /* 0029A5 00 00          */ PUSH 0
    /* 0029A7 00 00          */ PUSH 0
    /* 0029A9 35 80          */ SYSCALL 0x05 ; ns_set_person / tsce_set_person (7 arg(s))
    /* 0029AB 00 C0          */ EXPR.END
    /* 0029AD 01             */ CALC
    /* 0029AE E4 10 00       */ PUSH 228
    /* 0029B1 61 80          */ SYSCALL 0x31 ; sce_on_switch / sce_on_switch (1 arg(s))
    /* 0029B3 00 C0          */ EXPR.END
    /* 0029B5 01             */ CALC
    /* 0029B6 00 00          */ PUSH 0
    /* 0029B8 34 80          */ SYSCALL 0x04 ; sce_conv_win / sce_conv_win (1 arg(s))
    /* 0029BA 00 C0          */ EXPR.END
    /* 0029BC 01             */ CALC
    /* 0029BD 73 80          */ SYSCALL 0x43 ; sce_wait_map_scroll / sce_dummy_proc (0 arg(s))
    /* 0029BF 00 C0          */ EXPR.END
    /* 0029C1 01             */ CALC
    /* 0029C2 74 50          */ PUSH.VAR 20596
    /* 0029C4 EA 10 01       */ PUSH 490
    /* 0029C7 1B C0          */ EXPR.ASSIGN
    /* 0029C9 00 C0          */ EXPR.END
    /* 0029CB 01             */ CALC
    /* 0029CC 80 80          */ SYSCALL 0x50 ; sce_finish_demo / sce_finish_demo (0 arg(s))
    /* 0029CE 00 C0          */ EXPR.END
    /* 0029D0 03             */ RETURN

msg_119:
    /* 0029D1 14 0E 49       */ sce_message_nc message_119
    /* 0029D4 01             */ CALC
    /* 0029D5 1A 10 FF       */ PUSH 65306
    /* 0029D8 3C 00          */ PUSH 60
    /* 0029DA 00 00          */ PUSH 0
    /* 0029DC 00 00          */ PUSH 0
    /* 0029DE 00 00          */ PUSH 0
    /* 0029E0 00 00          */ PUSH 0
    /* 0029E2 00 00          */ PUSH 0
    /* 0029E4 00 00          */ PUSH 0
    /* 0029E6 26 51          */ PUSH.VAR 20774
    /* 0029E8 00 00          */ PUSH 0
    /* 0029EA 00 00          */ PUSH 0
    /* 0029EC 00 00          */ PUSH 0
    /* 0029EE 00 00          */ PUSH 0
    /* 0029F0 00 00          */ PUSH 0
    /* 0029F2 36 80          */ SYSCALL 0x06 ; ns_special_person / sce_dummy_proc (14 arg(s))
    /* 0029F4 00 C0          */ EXPR.END
    /* 0029F6 01             */ CALC
    /* 0029F7 12 51          */ PUSH.VAR 20754
    /* 0029F9 00 00          */ PUSH 0
    /* 0029FB 03 00          */ PUSH 3
    /* 0029FD 26 51          */ PUSH.VAR 20774
    /* 0029FF 6C 80          */ SYSCALL 0x3C ; sce_menu2 / sce_menu2 (3 arg(s))
    /* 002A01 1B C0          */ EXPR.ASSIGN
    /* 002A03 00 C0          */ EXPR.END
    /* 002A05 01             */ CALC
    /* 002A06 1A 10 FF       */ PUSH 65306
    /* 002A09 37 80          */ SYSCALL 0x07 ; ns_delete_person / tsce_delete_person (1 arg(s))
    /* 002A0B 00 C0          */ EXPR.END
    /* 002A0D 01             */ CALC
    /* 002A0E 10 51          */ PUSH.VAR 20752
    /* 002A10 12 51          */ PUSH.VAR 20754
    /* 002A12 11 C0          */ EXPR.LESS_THAN
    /* 002A14 00 C0          */ EXPR.END
    /* 002A16 05 4D 28       */ JZ lab_284D
    /* 002A19 01             */ CALC
    /* 002A1A 2C 60          */ PUSH.VAR 24620
    /* 002A1C 0F 10 27       */ PUSH 9999
    /* 002A1F 1B C0          */ EXPR.ASSIGN
    /* 002A21 00 C0          */ EXPR.END

msg_120:
    /* 002A23 14 46 49       */ sce_message_nc message_120
    /* 002A26 01             */ CALC
    /* 002A27 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 002A29 00 C0          */ EXPR.END
    /* 002A2B 01             */ CALC
    /* 002A2C 3C 00          */ PUSH 60
    /* 002A2E 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 002A30 00 C0          */ EXPR.END
    /* 002A32 01             */ CALC
    /* 002A33 2C 60          */ PUSH.VAR 24620
    /* 002A35 00 00          */ PUSH 0
    /* 002A37 1B C0          */ EXPR.ASSIGN
    /* 002A39 00 C0          */ EXPR.END
    /* 002A3B 04 DD 27       */ JMP msg_119
    /* 002A3E 04 4D 28       */ JMP lab_284D
  lab_284D:
    /* 002A41 03             */ RETURN

func_284E:
    /* 002A42 01             */ CALC
    /* 002A43 12 51          */ PUSH.VAR 20754
    /* 002A45 10 51          */ PUSH.VAR 20752
    /* 002A47 01 00          */ PUSH 1
    /* 002A49 0D C0          */ EXPR.SUB
    /* 002A4B 04 00          */ PUSH 4
    /* 002A4D 0B C0          */ EXPR.MOD
    /* 002A4F 1B C0          */ EXPR.ASSIGN
    /* 002A51 00 C0          */ EXPR.END
    /* 002A53 01             */ CALC
    /* 002A54 12 51          */ PUSH.VAR 20754
    /* 002A56 00 00          */ PUSH 0
    /* 002A58 14 C0          */ EXPR.EQUALS
    /* 002A5A 00 C0          */ EXPR.END
    /* 002A5C 05 81 28       */ JZ lab_2881
    /* 002A5F 01             */ CALC
    /* 002A60 12 51          */ PUSH.VAR 20754
    /* 002A62 01 00          */ PUSH 1
    /* 002A64 10 51          */ PUSH.VAR 20752
    /* 002A66 6E 80          */ SYSCALL 0x3E ; sce_rand / sce_rand (1 arg(s))
    /* 002A68 03 00          */ PUSH 3
    /* 002A6A 0B C0          */ EXPR.MOD
    /* 002A6C 0C C0          */ EXPR.ADD
    /* 002A6E 1B C0          */ EXPR.ASSIGN
    /* 002A70 00 C0          */ EXPR.END
    /* 002A72 04 81 28       */ JMP lab_2881
  lab_2881:
    /* 002A75 01             */ CALC
    /* 002A76 2C 60          */ PUSH.VAR 24620
    /* 002A78 0F 10 27       */ PUSH 9999
    /* 002A7B 1B C0          */ EXPR.ASSIGN
    /* 002A7D 00 C0          */ EXPR.END

msg_121:
    /* 002A7F 14 86 49       */ sce_message_nc message_121
    /* 002A82 01             */ CALC
    /* 002A83 32 80          */ SYSCALL 0x02 ; sce_wait_message_status2 / sce_wait_message_status2 (0 arg(s))
    /* 002A85 00 C0          */ EXPR.END
    /* 002A87 01             */ CALC
    /* 002A88 1E 00          */ PUSH 30
    /* 002A8A 7E 80          */ SYSCALL 0x4E ; sce_wait / sce_wait (1 arg(s))
    /* 002A8C 00 C0          */ EXPR.END
    /* 002A8E 01             */ CALC
    /* 002A8F 2C 60          */ PUSH.VAR 24620
    /* 002A91 00 00          */ PUSH 0
    /* 002A93 1B C0          */ EXPR.ASSIGN
    /* 002A95 00 C0          */ EXPR.END
    /* 002A97 03             */ RETURN

text_start:

message_0: ; 0x002A98
    .str "<Rhea>"
    .str "「危なかった・・・」"
    .str "<Rhea>"
    .str "「衛兵が十分離れてから移動"
    .str "した方がいいな」"


message_1: ; 0x002AEA
    .str "国王"
    .str "「吉報を待っておりますぞ」"


message_2: ; 0x002B0C
    .str "国王"
    .str "「いつでも頼ってきてくれ」"


message_3: ; 0x002B2E
    .str "王妃"
    .str "「あなた達の行き先に、いつでも"
    .str "幸福の女神が微笑んでくれるよ"
    .str "う祈っています」"


message_4: ; 0x002B88
    .str "衛兵"
    .str "「お気をつけて」"


message_5: ; 0x002BA0
    .str "衛兵"
    .str "「がんばって下さい」"


message_6: ; 0x002BBC
    .str "衛兵"
    .str "「アルァニスタ城へようこそ」"


message_7: ; 0x002BE2
    .str "衛兵"
    .str "「陛下の御前でそそうのないよう"
    .str "にしてくれ」"


message_8: ; 0x002C18
    .str "メイド"
    .str "「私は国王陛下にお仕えしている"
    .str "メイドです」"
    .str "メイド"
    .str "「ほこり、落とさないでね」"


message_9: ; 0x002C74
    .str "メイド"
    .str "「王子様が、元に戻られて本当に"
    .str "よかった・・・」"


message_10: ; 0x002CB0
    .str "男の人"
    .str "「エルフ族は大陸中に散った仲間"
    .str "を水鏡ユミルの森に呼び集めた"
    .str "といいます」"
    .str "男の人"
    .str "「彼らなりの理由があったという"
    .str "話ですが・・・」"


message_11: ; 0x002D44
    .str "メイド"
    .str "「エルフと人間が恋をしたら不幸"
    .str "よ」"
    .str "メイド"
    .str "「かつてあったエルフ族の大移住"
    .str "の時には・・・」"
    .str "メイド"
    .str "「むりやり引き裂かれたカップル"
    .str "がたくさんあるって話なの」"


message_12: ; 0x002DF6
    .str "男の人"
    .str "「ミッドガルズでは、何十年も前"
    .str "から魔術に代わる『新たな力』"
    .str "を研究しています」"
    .str "男の人"
    .str "「ソーサリーテクノロジィ、また"
    .str "の名を魔科学・・・」"
    .str "男の人"
    .str "「人間が魔術を操るための技術、"
    .str "という話ですが・・・」"


message_13: ; 0x002ED6
    .str "兵士"
    .str "「水鏡ユミルの森は大きな湖の上"
    .str "に樹木が生い茂っているんだっ"
    .str "てさ」"
    .str "兵士"
    .str "「一度見てみたいものだ」"


message_14: ; 0x002F46
    .str "魔術師"
    .str "「エルフはアルァニスタがミッ"
    .str "ドガルズと友好同盟を結んでい"
    .str "ることに反対しています」"
    .str "魔術師"
    .str "「けれど、その理由が今ひとつ理"
    .str "解できないんですよ」"
    .str "魔術師"
    .str "「どうしてでしょう？」"


message_15: ; 0x00300A
    .str "メイド"
    .str "「戦争、戦争って言ってもうちら"
    .str "には関係ないよね」"
    .str "メイド"
    .str "「でも、平和すぎるってのも退屈"
    .str "だわ」"


message_16: ; 0x00307A
    .str "男の人"
    .str "「エルフは人間が魔術を使えるよ"
    .str "うになるのを恐れているんじゃ"
    .str "ないかな？」"
    .str "男の人"
    .str "「数は人間の方が多い訳だし」"


message_17: ; 0x0030F8
    .str "見張り"
    .str "「見張りも楽じゃないね」"
    .str "見張り"
    .str "「えっ、精霊の話？」"
    .str "見張り"
    .str "「僕が知ってるわけないじゃん」"
    .str "見張り"
    .str "「魔術研究所の人に聞いてよ」"
    .str "見張り"
    .str "「あ、待て」"
    .str "見張り"
    .str "「こんな昔話をどこかで聞いたこ"
    .str "とがある」"
    .str "見張り"
    .str "「昔、今のような魔物がいなかっ"
    .str "た時代」"
    .str "見張り"
    .str "「ある悪い人々が世界中に毒をま"
    .str "こうとしていた」"
    .str "見張り"
    .str "「その毒で世界を支配しようとし"
    .str "ていたんだ」"
    .str "見張り"
    .str "「月の精霊様はそれを阻止しよう"
    .str "と地上に降りてきた」"
    .str "見張り"
    .str "「でも月の光が力の源である精霊"
    .str "様は月のない夜にその悪い人々"
    .str "に捕まってしまった」"
    .str "見張り"
    .str "「その悪い人々っていうのがどこ"
    .str "かの国の王様達だったんだ」"
    .str "見張り"
    .str "「・・・・・・」"
    .str "<Rhea>"
    .str "「それで？」"
    .str "見張り"
    .str "「続きは覚えてないんだ」"
    .str "見張り"
    .str "「ごめんな」"


message_18: ; 0x0033C6
    .str "元・石取り名人"
    .str "「君とはすでに勝負がついている"
    .str "はずだ」"


message_19: ; 0x003402
    .str "石取り名人"
    .str "「もう一度勝負だ！」"
    .str ""


message_20: ; 0x003426
    .str "石取り名人"
    .str "「そこの君、一つゲームをやらな"
    .str "いか？」"
    .str "石取り名人"
    .str "「君が勝ったら何かプレゼントし"
    .str "よう」<wait>"


message_21: ; 0x003496
    .str "<color_0002>勝負しますか？<color_0000>"


message_22: ; 0x0034AE
    .str "石取り名人"
    .str "「君の挑戦を待っているよ」"


message_23: ; 0x0034D6
    .str "石取り名人"
    .str "「説明を聞くかい？」"


message_24: ; 0x0034F8
    .str "石取り名人"
    .str "「私と石取りゲームをやるのだ」"
    .str "石取り名人"
    .str "「石取りゲームとは一山の石から"
    .str "順に石を取り・・・」"
    .str "石取り名人"
    .str "「最後に取った者が負けになる、"
    .str "というものだ」"
    .str "石取り名人"
    .str "「一回に取れる石の数は最大３コ"
    .str "で、パスはできない」"
    .str "石取り名人"
    .str "「あと時間制限があって、時間が"
    .str "来ると今選んでいる数を強制的"
    .str "に取らされることになる」"
    .str "石取り名人"
    .str "「途中でやめたい時は数を選ぶ時"
    .str "にキャンセルしてくれ」<wait>"


message_25: ; 0x00369A
    .str "石取り名人"
    .str "「それじゃ位置について」"


message_26: ; 0x0036C0
    .str "石取り名人"
    .str "「このツボの中には<numx_/*0036E01051*//*0036E200C0*/>コの石"
    .str "が入ってる」"
    .str "石取り名人"
    .str "「先にやりますかな？」"


message_27: ; 0x003720
    .str "石取り名人"
    .str "「では、勝負」<wait>"


message_28: ; 0x00373E
    .str "石取り名人"
    .str "「やめますか、またの挑戦を待っ"
    .str "ていますよ」"


message_29: ; 0x00377A
    .str "石取り名人"
    .str "「むぅ・・・」"
    .str "石取り名人"
    .str "「わ、私の完敗です」"
    .str "石取り名人"
    .str "「では約束どおり、アイテムをあ"
    .str "げよう」<wait>"


message_30: ; 0x0037F2
    .str "<color_0002><item_0169>を手に入れました。<color_0000>"
    .str "石取り名人"
    .str "「それから、君に名人の称号を"
    .str "贈ろう」"
    .str "元・石取り名人"
    .str "「今日から君が石取り名人だ」<wait>"


message_31: ; 0x003878
    .str "<color_0002><Rhea>は『<sys_018D>』の称号を得ました。<color_0000>"


message_32: ; 0x0038A2
    .str "石取り名人"
    .str "「むぅ・・・」"
    .str "石取り名人"
    .str "「私の負けのようですな」"
    .str "石取り名人"
    .str "「では約束どおり、アイテムをあ"
    .str "げよう」<wait>"


message_33: ; 0x00391E
    .str "<color_0002><item_007C>を手に入れました。<color_0000>"
    .str "石取り名人"
    .str "「むぅ、もう一回勝負しないか？」"


message_34: ; 0x00396C
    .str "石取り名人"
    .str "「残念、あなたの負けだ」"
    .str "石取り名人"
    .str "「またの挑戦を待っているよ」"


message_35: ; 0x0039BC
    .str "新鋭の音楽家"
    .str "「やっぱり城のＢＧＭは新しい時"
    .str "代に合ったものでなくてはいけ"
    .str "ないよ」"
    .str "新鋭の音楽家"
    .str "「そう考えたらやっぱりこうなる"
    .str "な」"


message_36: ; 0x003A4C
    .str "熟練の音楽家"
    .str "「やはり、城の楽曲は荘厳かつ繊"
    .str "細でなくてはならない」"
    .str "熟練の音楽家"
    .str "「そう考えると、こうなるであろ"
    .str "う」"


message_37: ; 0x003ACA
    .str "ハリソン"
    .str "「我が国のトール調査隊の話では"
    .str "町の中には幻を映す装置があっ"
    .str "たそうです」"
    .str "ハリソン"
    .str "「これも魔物の仕業でしょうか？」"


message_38: ; 0x003B50
    .str "ルーングロム"
    .str "「この世界にいつからか、常に闇"
    .str "に閉ざされた空間がある」"
    .str "ルーングロム"
    .str "「そこに町が一つあるんだ」"
    .str "ルーングロム"
    .str "「行ってみれば何か手がかりがつ"
    .str "かめるかもしれないな」"


message_39: ; 0x003C0C
    .str "ルーングロム"
    .str "「超古代と呼ばれる数千年の昔、"
    .str "大陸は三つの大国によって覇権"
    .str "が争われていた」"
    .str "ルーングロム"
    .str "「その三国というのがオーディー"
    .str "ンとフェンリル、そしてトール」"
    .str "ルーングロム"
    .str "「突然の隕石落下によってトール"
    .str "が崩壊した後・・・」"
    .str "ルーングロム"
    .str "「泥沼化した戦争にニ国の滅亡と"
    .str "いう形で終止符をうった謎の男"
    .str "達がいた」"
    .str "ルーングロム"
    .str "「その男達が使っていた、といわ"
    .str "れる三種の武具が、世界のどこ"
    .str "かに存在するらしい」"
    .str "ルーングロム"
    .str "「その三種の武具は融合させるこ"
    .str "とで、時間を操る魔剣へと変化"
    .str "するらしいんだ」"
    .str "ルーングロム"
    .str "「詳しいことは<color_0002>魔術研究室<color_0000>で聞い"
    .str "てくれ」"
    .str "ルーングロム"
    .str "「期待しているよ」"
    .str "ルーングロム"
    .str "「もう君達しか頼る者がいないん"
    .str "だ」"


message_40: ; 0x003EC2
    .str "兵士"
    .str "「収集品の中に、五信条の神像と"
    .str "いう五体の像があるという話を"
    .str "聞いたんだけど・・・」"
    .str "兵士"
    .str "「『ごしんじょうのしんぞう』だ"
    .str "なんて、まるで早口言葉だよね」"


message_41: ; 0x003F6A
    .str "剣士"
    .str "「フレイランドには巨大な火山が"
    .str "あるんだ」"
    .str "剣士"
    .str "「私も調査に行ったことがあるの"
    .str "だが、今でも溶岩が地上に噴き"
    .str "出してるよ」"


message_42: ; 0x003FF4
    .str "女の人"
    .str "「フリーズキールには巨大な教会"
    .str "があるそうよ」"
    .str "女の人"
    .str "「何でも超古代文明の時代のもの"
    .str "だったとか」"


message_43: ; 0x004066
    .str "メイド"
    .str "「王室公認の紅茶はいかが？」"


message_44: ; 0x00408C
    .str "エミリ"
    .str "「私はエミリ」"
    .str "エミリ"
    .str "「夢見る少女・・・」"
    .str "エミリ"
    .str "「ああ、先輩・・・」<wait>"


message_45: ; 0x0040E2
    .str "エミリ"
    .str "「二人で、笑いながら草原を走り"
    .str "たい・・・」"


message_46: ; 0x00411A
    .str "エミリ"
    .str "「私の作った料理を食べてもらい"
    .str "たい・・・」"


message_47: ; 0x004152
    .str "エミリ"
    .str "「私の髪を優しくなでて『好きだ"
    .str "よ』って言ってほしい・・・」"


message_48: ; 0x00419A
    .str "エミリ"
    .str "「先輩と一緒に、愛に満ちた本を"
    .str "作りたい・・・」"


message_49: ; 0x0041D6
    .str "エミリ"
    .str "「先輩のほっぺを指でぷにぷにし"
    .str "たい・・・」"


message_50: ; 0x00420E
    .str "エミリ"
    .str "「あんなことやこんなこと、いろ"
    .str "いろしたい・・・」"


message_51: ; 0x00424C
    .str "メイド"
    .str "「絶対よね、絶対！」"


message_52: ; 0x00426A
    .str "メイド"
    .str "「エミリの好きな人が誰なのかを"
    .str "話してるの」"


message_53: ; 0x0042A2
    .str "司書"
    .str "「ここは図書室です」"


message_54: ; 0x0042BE
    .str "メイド"
    .str "「やっぱ、先輩に間違いないよ！」"


message_55: ; 0x0042E8
    .str "メイド"
    .str "「案外、王女様だったりして」"
    .str "メイド"
    .str "「冗談よ、冗談！」"


message_56: ; 0x00432A
    .str "剣士"
    .str "「前にミッドガルズにいたんだ」"
    .str "剣士"
    .str "「ダオスの攻撃から何とか逃れて"
    .str "きてね」<wait>"


message_57: ; 0x004384
    .str "剣士"
    .str "「奥義といえど使い所がわからな"
    .str "ければ役にはたたないよ」"


message_58: ; 0x0043C6
    .str "剣士"
    .str "「君は剣士のようだね」"
    .str "剣士"
    .str "「この奥義書、買わないか？」"
    .str "剣士"
    .str "「１８０００ガルドでいいよ」"
    .str "<color_0002>買いますか？<color_0000>"


message_59: ; 0x004442
    .str "剣士"
    .str "「いつでも買いに来てくれ」"


message_60: ; 0x004464
    .str "剣士"
    .str "「金が足りないよ」"


message_61: ; 0x00447E
    .str "<color_0002><Rhea>は<sys_009B>を覚えました。<color_0000>"
    .str "剣士"
    .str "「ありがとう」"


message_62: ; 0x0044B6
    .str "知識人"
    .str "「書物の話を聞きたくないか？」"


message_63: ; 0x0044DE
    .str "知識人"
    .str "「あ、そう」"


message_64: ; 0x0044F4
    .str "知識人"
    .str "「君達が必要としている本は三種"
    .str "類ある」"
    .str "知識人"
    .str "「一つは奥義書、剣士が奥義を覚"
    .str "えるための書物だ」"
    .str "知識人"
    .str "「一つは呪文書、魔術師が魔術を"
    .str "覚えるための書物だ」"
    .str "知識人"
    .str "「そしてもう一つが、主に召喚士"
    .str "などが研究用に使うものだ」"
    .str "知識人"
    .str "「時には魔力を帯びた武器にもな"
    .str "る」"
    .str "知識人"
    .str "「こんなところかな」"


message_65: ; 0x00463A
    .str "兵士"
    .str "「君ら、『おでん』って知ってる"
    .str "かい？」"
    .str "兵士"
    .str "「忍者はこの『おでん』が大好物"
    .str "らしいね」"
    .str "兵士"
    .str "「でも僕はカレーライスのほうが"
    .str "いいな」"


message_66: ; 0x0046D2
    .str "衛兵"
    .str "「ここは王女様の部屋です」"
    .str "衛兵"
    .str "「そそうのないよう願います」"


message_67: ; 0x004718
    .str "衛兵"
    .str "「ここは王子様の部屋です」"


message_68: ; 0x00473A
    .str "衛兵"
    .str "「王女様・・・」"
    .str "衛兵"
    .str "「それは美しい方です」"


message_69: ; 0x004770
    .str "衛兵"
    .str "「王子様が元に戻られた」"
    .str "衛兵"
    .str "「これでアルァニスタも安泰で"
    .str "す」"


message_70: ; 0x0047BE
    .str "女の人"
    .str "「私の彼、冒険家なんだけどおも"
    .str "しろい話をしてくれたわ」"
    .str "女の人"
    .str "「なんでも、海賊アイフリードの"
    .str "隠れアジトは世界中に２０ヶ所"
    .str "以上あるらしいのよ」"
    .str "女の人"
    .str "「全部探すのはたいへんね」"


message_71: ; 0x004886
    .str "魔術師"
    .str "「超古代文明の古文書に興味深い"
    .str "ことが書いてあったよ」"
    .str "魔術師"
    .str "「<sys_00D8>という精霊は再生の能"
    .str "力があるんだそうだ」"
    .str "魔術師"
    .str "「再生というのは壊れた物を直す"
    .str "能力もそうだけど・・・」"
    .str "魔術師"
    .str "「複数の物を一つの物に作り替え"
    .str "るという能力もあると書いてあ"
    .str "るよ」"
    .str "魔術師"
    .str "「昔は<sys_00D8>っていうと伝説上"
    .str "の精霊だったんだけどね」"
    .str "魔術師"
    .str "「ここまで具体的な説明があると"
    .str "実在してもおかしくないよね」"
    .str "魔術師"
    .str "「場所は、やっぱりエルフの聖域"
    .str "ヘイムダールなのかなぁ」"
    .str "魔術師"
    .str "「<sys_00D8>に関する古文書には必"
    .str "ずと言っていいほど書かれてい"
    .str "るよ」"


message_72: ; 0x004AB4
    .str "男の人"
    .str "「私の先祖は石取りゲームの名人"
    .str "でした」"
    .str "男の人"
    .str "「ですがもう石取りゲームはやめ"
    .str "ました」<wait>"


message_73: ; 0x004B1E
    .str "男の人"
    .str "「私はボタン押しゲームの出題者"
    .str "なんです」"
    .str "男の人"
    .str "「私の言う通りにボタンを押すこ"
    .str "とができたら、何か賞品をあげ"
    .str "るけど、やりますか？」"


message_74: ; 0x004BB6
    .str "男の人"
    .str "「そうですか、気が向いたらまた"
    .str "来て下さい」"


message_75: ; 0x004BEE
    .str "男の人"
    .str "「説明を聞きますか？」"


message_76: ; 0x004C0E
    .str "男の人"
    .str "「私が無作為にボタンを押す順番"
    .str "を言います」"
    .str "男の人"
    .str "「例えばこんな風に・・・」"
    .str "男の人"
    .str "「<sysx_/*004C78011002*//*004C7B2A51*//*004C7D0E00*//*004C7F0FC0*//*004C810300*//*004C8316C0*//*004C850CC0*//*004C8700C0*/><sysx_/*004C8B011002*//*004C8E2A51*//*004C900C00*//*004C920FC0*//*004C940300*//*004C9616C0*//*004C980CC0*//*004C9A00C0*/><sysx_/*004C9E011002*//*004CA12A51*//*004CA30A00*//*004CA50FC0*//*004CA70300*//*004CA916C0*//*004CAB0CC0*//*004CAD00C0*/><sysx_/*004CB1011002*//*004CB42A51*//*004CB60800*//*004CB80FC0*//*004CBA0300*//*004CBC16C0*//*004CBE0CC0*//*004CC000C0*/><sysx_/*004CC4011002*//*004CC72A51*//*004CC90600*//*004CCB0FC0*//*004CCD0300*//*004CCF16C0*//*004CD10CC0*//*004CD300C0*/><sysx_/*004CD7011002*//*004CDA2A51*//*004CDC0400*//*004CDE0FC0*//*004CE00300*//*004CE216C0*//*004CE40CC0*//*004CE600C0*/><sysx_/*004CEA011002*//*004CED2A51*//*004CEF0200*//*004CF10FC0*//*004CF30300*//*004CF516C0*//*004CF70CC0*//*004CF900C0*/><sysx_/*004CFD011002*//*004D002A51*//*004D020000*//*004D040FC0*//*004D060300*//*004D0816C0*//*004D0A0CC0*//*004D0C00C0*/>"
    .str "の順番で押して下さい」"
    .str "男の人"
    .str "「あなたはこれをすばやく覚えて"
    .str "下さい」"
    .str "男の人"
    .str "「そして、その後で同じ順番でボ"
    .str "タンを押すだけなんです」"
    .str "男の人"
    .str "「もう一度説明しましょうか？」"


message_77: ; 0x004DCA
    .str "男の人"
    .str "「じゃあ、始めるよ・・・」"


message_78: ; 0x004DEE
    .str "<speed_0000>男の人"
    .str "「<sysx_/*004E00011002*//*004E032A51*//*004E050E00*//*004E070FC0*//*004E090300*//*004E0B16C0*//*004E0D0CC0*//*004E0F00C0*/><sysx_/*004E13011002*//*004E162A51*//*004E180C00*//*004E1A0FC0*//*004E1C0300*//*004E1E16C0*//*004E200CC0*//*004E2200C0*/><sysx_/*004E26011002*//*004E292A51*//*004E2B0A00*//*004E2D0FC0*//*004E2F0300*//*004E3116C0*//*004E330CC0*//*004E3500C0*/><sysx_/*004E39011002*//*004E3C2A51*//*004E3E0800*//*004E400FC0*//*004E420300*//*004E4416C0*//*004E460CC0*//*004E4800C0*/><sysx_/*004E4C011002*//*004E4F2A51*//*004E510600*//*004E530FC0*//*004E550300*//*004E5716C0*//*004E590CC0*//*004E5B00C0*/><sysx_/*004E5F011002*//*004E622A51*//*004E640400*//*004E660FC0*//*004E680300*//*004E6A16C0*//*004E6C0CC0*//*004E6E00C0*/><sysx_/*004E72011002*//*004E752A51*//*004E770200*//*004E790FC0*//*004E7B0300*//*004E7D16C0*//*004E7F0CC0*//*004E8100C0*/><sysx_/*004E85011002*//*004E882A51*//*004E8A0000*//*004E8C0FC0*//*004E8E0300*//*004E9016C0*//*004E920CC0*//*004E9400C0*/>"
    .str "の順番で押して下さい」<speed_FFFF>"


message_79: ; 0x004EB6
    .str "男の人"
    .str "「残念ですが時間切れです」"


message_80: ; 0x004EDA
    .str "男の人"
    .str "「おお、正解です」<wait>"


message_81: ; 0x004EF8
    .str "男の人"
    .str "「違いますよ」<wait>"


message_82: ; 0x004F12
    .str "男の人"
    .str "「また挑戦して下さい」"


message_83: ; 0x004F32
    .str "<speed_0000>あなたの答え：<sysx_/*004F46011002*//*004F492851*//*004F4B0E00*//*004F4D0FC0*//*004F4F0300*//*004F5116C0*//*004F530CC0*//*004F5500C0*/><sysx_/*004F59011002*//*004F5C2851*//*004F5E0C00*//*004F600FC0*//*004F620300*//*004F6416C0*//*004F660CC0*//*004F6800C0*/><sysx_/*004F6C011002*//*004F6F2851*//*004F710A00*//*004F730FC0*//*004F750300*//*004F7716C0*//*004F790CC0*//*004F7B00C0*/><sysx_/*004F7F011002*//*004F822851*//*004F840800*//*004F860FC0*//*004F880300*//*004F8A16C0*//*004F8C0CC0*//*004F8E00C0*/><sysx_/*004F92011002*//*004F952851*//*004F970600*//*004F990FC0*//*004F9B0300*//*004F9D16C0*//*004F9F0CC0*//*004FA100C0*/><sysx_/*004FA5011002*//*004FA82851*//*004FAA0400*//*004FAC0FC0*//*004FAE0300*//*004FB016C0*//*004FB20CC0*//*004FB400C0*/><sysx_/*004FB8011002*//*004FBB2851*//*004FBD0200*//*004FBF0FC0*//*004FC10300*//*004FC316C0*//*004FC50CC0*//*004FC700C0*/><sysx_/*004FCB011002*//*004FCE2851*//*004FD00000*//*004FD20FC0*//*004FD40300*//*004FD616C0*//*004FD80CC0*//*004FDA00C0*/>"
    .str "正しい答え：<sysx_/*004FEE011002*//*004FF12A51*//*004FF30E00*//*004FF50FC0*//*004FF70300*//*004FF916C0*//*004FFB0CC0*//*004FFD00C0*/><sysx_/*005001011002*//*0050042A51*//*0050060C00*//*0050080FC0*//*00500A0300*//*00500C16C0*//*00500E0CC0*//*00501000C0*/><sysx_/*005014011002*//*0050172A51*//*0050190A00*//*00501B0FC0*//*00501D0300*//*00501F16C0*//*0050210CC0*//*00502300C0*/><sysx_/*005027011002*//*00502A2A51*//*00502C0800*//*00502E0FC0*//*0050300300*//*00503216C0*//*0050340CC0*//*00503600C0*/><sysx_/*00503A011002*//*00503D2A51*//*00503F0600*//*0050410FC0*//*0050430300*//*00504516C0*//*0050470CC0*//*00504900C0*/><sysx_/*00504D011002*//*0050502A51*//*0050520400*//*0050540FC0*//*0050560300*//*00505816C0*//*00505A0CC0*//*00505C00C0*/><sysx_/*005060011002*//*0050632A51*//*0050650200*//*0050670FC0*//*0050690300*//*00506B16C0*//*00506D0CC0*//*00506F00C0*/><sysx_/*005073011002*//*0050762A51*//*0050780000*//*00507A0FC0*//*00507C0300*//*00507E16C0*//*0050800CC0*//*00508200C0*/>"
    .str "かかった時間：<numx_/*0050961A51*//*0050983C00*//*00509A0AC0*//*00509C00C0*/>。<numx_/*0050A21A51*//*0050A43C00*//*0050A60BC0*//*0050A80A00*//*0050AA09C0*//*0050AC0600*//*0050AE0AC0*//*0050B000C0*/>秒"
    .str "押した回数：<numx_/*0050C60451*//*0050C800C0*/>回<speed_FFFF><wait>"


message_84: ; 0x0050D4
    .str "男の人"
    .str "「これを差しあげます」"
    .str "男の人"
    .str "「またやってみて下さい」<wait>"


message_85: ; 0x005118
    .str "<color_0002><itemx_/*00511E1A51*//*00512000C0*/>を手に入れました。"


message_86: ; 0x005136
    .str "『超古代の言語形態１』"
    .str "超古代文明時代にはニつの言語が"
    .str "発達していたと言われている。"
    .str "一つは上位古代語と呼ばれる言語"
    .str "だが、起源は一万年前とも十万年"
    .str "前とも言われている古い言語であ"
    .str "る。"
    .str "もう一つはコモン語と呼ばれる言"
    .str "語である。"
    .str "我々の話す言葉などはこの言語が"
    .str "元であると言われている。"
    .str "また、このニつの言語を法印状に"
    .str "組み合わせた文章が刻まれている"
    .str "石盤も多数発見されている。"


message_87: ; 0x0052B4
    .str "『禁呪文』"
    .str "この世界に存在する魔術の中には、"
    .str "いにしえに封印された禁呪文と呼"
    .str "ばれるものがある。"
    .str "その一つとして自己犠牲魔術があ"
    .str "る。"
    .str "自らの全精力を熱エネルギーに変"
    .str "換、全魔力を使ってそれを圧縮、"
    .str "爆発させるという。"
    .str "不思議なことに魔術をかける直前"
    .str "自然と自分の周囲に結界が張られ"
    .str "て爆発の範囲を抑えるという。"
    .str "攻撃力を上げるためか、周囲に爆"
    .str "発の影響を与えないためかは定か"
    .str "ではない。"


message_88: ; 0x00543A
    .str "『癒しの術』"
    .str "魔術は主に攻撃を主体とするもの"
    .str "が多いが、それとは別に癒しの効"
    .str "果を持つ奇跡の力があるという。"
    .str "魔術は自らの魔力を使うが、癒し"
    .str "の力は、大地や神の助力によって"
    .str "成り立つと言われている。"
    .str "しかし、いまだ存在は確認されて"
    .str "いない。"


message_89: ; 0x00552C
    .str "『月と星』"
    .str "我々がいつも見ている月、大きい"
    .str "方がシルァラント、小さい方が"
    .str "テセアラと呼ばれています。"
    .str "これらニつの月は我々の住んでい"
    .str "るこの星の衛星です。"
    .str "シルァラントは約３５日、テセ"
    .str "アラは約４２日でこの星を一周し"
    .str "ます。"
    .str "このニつの月の間には、お互いの"
    .str "引力による影響で隕石が無数に浮"
    .str "遊して存在しています。"
    .str "しかし残念ながら望遠鏡などを用"
    .str "いなければ、これらを見ることは"
    .str "できません。"


message_90: ; 0x0056B8
    .str "『超古代都市トールについて』"
    .str "トールの文化が最盛期にあったこ"
    .str "ろ、その存在は他のいかなる国よ"
    .str "りも大きなものでした。"
    .str "はるかに高度な科学技術を有し、"
    .str "それを国の基盤としていました。"
    .str "しかし、極めて閉鎖的に発展して"
    .str "きたとも言われています。"
    .str "トールに住んでいた人々に、その"
    .str "高度な技術を育てた一因がありま"
    .str "す。"
    .str "人種的にもたぐいまれな能力を有"
    .str "する種族だったようです。"


message_91: ; 0x005828
    .str "『改・禁呪文』"
    .str "いにしえより封印された魔術の多"
    .str "くが時間や空間を操るものだった"
    .str "らしい。"


message_92: ; 0x005882
    .str "『いにしえの音楽』"
    .str "超古代文明では今とは違い、テン"
    .str "ポの速い激しい音楽が流行してい"
    .str "たという。"
    .str "『ドラム』という打楽器でリズム"
    .str "をとり、『エレキギター』という"
    .str "電気仕掛けのギターでコードを奏"
    .str "でる。"
    .str "『ベース』というコントラバスに"
    .str "近い楽器で低音部分を演奏した。"
    .str "また『キーボード』という電気で"
    .str "奏でるピアノで演奏していたとい"
    .str "われている。"


message_93: ; 0x0059D8
    .str "<Rhea>"
    .str "「日記みたいだ・・・」"
    .str "？月？日晴れ"
    .str "今日超かっこいい、あこがれの先"
    .str "輩と話しちゃった。<panic>"
    .str "背が高くて顔もモデル級で、こん"
    .str "な人と話ができるなんて・・・"
    .str "エミリもう最高にハッピー<heart>"
    .str "ＢＵＴ、先輩の前に立つと、胸が"
    .str "ドキドキして・・・"
    .str "自分でも何話してるんだかわかん"
    .str "なくなっちゃうのん<sweat>"
    .str "ああ、先輩・・・<heart>"
    .str "<Rhea>"
    .str "「なんだこれは？」"


message_94: ; 0x005B2E
    .str "<Rhea>"
    .str "「石ころがたくさん入っている」"


message_95: ; 0x005B54
    .str "<Rhea>"
    .str "「からっぽみたいだ」"


message_96: ; 0x005B70
    .str "<audio_0007><Rhea>"
    .str "「ふぅっ、これで全員だよね<panic>」"
    .str "<audio_0007><Rhea>"
    .str "「それじゃあ、王子の寝室を探そ"
    .str "う」"
    .str "<audio_0007><Rhea>"
    .str "「みんな静かにな・・・」"


message_97: ; 0x005BF0
    .str "<audio_0007>ルーングロム"
    .str "「おぬしら、夜分城内に侵入した"
    .str "理由を申してみよ」<wait>"


message_98: ; 0x005C3A
    .str "<audio_0007><Rhea>"
    .str "「王子を助けるためです」"


message_99: ; 0x005C5E
    .str "<audio_0007>レアード"
    .str "「な、何をバカなことを・・・」"
    .str "<audio_0007>国王"
    .str "「レアード、お前は何も知らぬの"
    .str "だ」"
    .str "<audio_0007>国王"
    .str "「黙っておれ」"
    .str "<audio_0007><Rhea>"
    .str "「今、私達は魔術を必要としてい"
    .str "るのです」"
    .str "<audio_0007><Rhea>"
    .str "「より強い呪文を得るためにユー"
    .str "クリッドよりアルァニスタま"
    .str "でやってまいりました」"
    .str "<audio_0007>ルーングロム"
    .str "「なぜ魔術を？」"
    .str "<audio_0007><Rhea>"
    .str "「魔術でしか傷つかないと言われ"
    .str "ているダオスを倒すためです」"
    .str "<audio_0007>国王"
    .str "「なに、真か！？」"
    .str "<audio_0007>国王"
    .str "「実は、そなたらが偶然レアード"
    .str "を助けた盗賊にすぎぬのか？」"
    .str "<audio_0007>国王"
    .str "「それとも最初からレアードを助"
    .str "けるつもりだったのか？」"
    .str "<audio_0007>国王"
    .str "「それをはっきりさせたかったの"
    .str "だ」"
    .str "<audio_0007>国王"
    .str "「心から礼を申すぞ」<wait>"


message_100: ; 0x005EE4
    .str "<audio_0007>レアード"
    .str "「私がダオスに操られていた？」"
    .str "<audio_0007>レアード"
    .str "「父上、本当なのですか？」"
    .str "<audio_0007>国王"
    .str "「うむ、真だ」"
    .str "<audio_0007>国王"
    .str "「そのために、近く起こる戦に我"
    .str "が王国は加勢することができな"
    .str "くなっていたのだ」"
    .str "<audio_0007>国王"
    .str "「ダオスはそれが目的だったのだ"
    .str "ろう」<wait>"


message_101: ; 0x005FEC
    .str "<audio_0007><Rhea>"
    .str "「戦が起きる？」"
    .str "<audio_0007>ルーングロム"
    .str "「行く先々で噂話くらいは聞いた"
    .str "ことがあるだろう？」"
    .str "<audio_0007>ルーングロム"
    .str "「我が国の同盟国であるミッドガ"
    .str "ルズとダオスの軍勢が激突間近"
    .str "だという話くらいはな」"
    .str "<audio_0007><Rhea>"
    .str "「心得ています」"
    .str "<audio_0007>国王"
    .str "「もし、呪文探索の旅が十分達成"
    .str "されたと感じたなら・・・」"
    .str "<audio_0007>国王"
    .str "「戦に力を貸すことも考えてみて"
    .str "ほしい」"
    .str "<audio_0007><Rhea>"
    .str "「はい」"


message_102: ; 0x00616C
    .str "<audio_0007>ルーングロム"
    .str "「これはおぬしらが退治した魔物"
    .str "の死体から見つかった物だ」"
    .str "<audio_0007>ルーングロム"
    .str "「持ってゆくがいい」"
    .str "<audio_0007>ルーングロム"
    .str "「それと・・・」"


message_103: ; 0x006208
    .str "<audio_0007><Rhea>"
    .str "「これは魔術書！！」"
    .str "<audio_0007><Rhea>"
    .str "「よろしいのですか？」<wait>"


message_104: ; 0x00624C
    .str "<audio_0007>ルーングロム"
    .str "「それからおぬしにはこれだ」"
    .str "<audio_0007>ルーングロム"
    .str "「これも倒した魔物が持っていた"
    .str "のだ」"


message_105: ; 0x0062B8
    .str "<audio_0007><Rhea>"
    .str "「これは！？」"
    .str "<audio_0007>ルーングロム"
    .str "「<item_00C3>・・・」"
    .str "<audio_0007>ルーングロム"
    .str "「神々の終末の戦いの際に作られ"
    .str "たと言われている槍だ」"
    .str "<audio_0007>国王"
    .str "「遠慮はいらぬ」"
    .str "<audio_0007>国王"
    .str "「それに何か困ったことがあれば"
    .str "いつでも頼ってきてくれ」"
    .str "<audio_0007><Rhea>"
    .str "「ありがとうございます！」"
    .str "<audio_0007><Rhea>"
    .str "「では早速ですがモーリア坑道の"
    .str "探索許可証をお願いしたいので"
    .str "すが」"
    .str "<audio_0007>ルーングロム"
    .str "「それはまたなぜ？」"
    .str "<audio_0007>ルーングロム"
    .str "「単なる宝探しというわけではあ"
    .str "るまい？」"
    .str "<audio_0007><Rhea>"
    .str "「はい」"
    .str "<audio_0007><Rhea>"
    .str "「月の精霊<sys_00D4>と契約を結ぶため"
    .str "の指輪があると言われているか"
    .str "らです」"
    .str "<audio_0007>国王"
    .str "「うむ、わかった」"
    .str "<audio_0007>国王"
    .str "「後日、町の<color_0002>冒険者ギルド<color_0000>で受け"
    .str "取るがよい」<wait>"


message_106: ; 0x006550
    .str "<audio_0007>ルーングロム"
    .str "「それでは陛下、私は研究所に戻"
    .str "ります」"
    .str "<audio_0007>レアード"
    .str "「私も部屋に戻ります」"


message_107: ; 0x0065B4
    .str "<color_0002>契約の指輪<item_015E>、<item_00C3>、<item_00EC>を手に入れました。"


message_108: ; 0x0065E6
    .str "<speed_0000>衛兵"
    .str "「そこにいるのは誰だ！？」"


message_109: ; 0x00660C
    .str "<audio_0007>ハリソン"
    .str "「お連れいたしました」"
    .str "<audio_0007>ルーングロム"
    .str "「ごくろうだったな」"


message_110: ; 0x00665A
    .str "<audio_0007><Rhea>"
    .str "「ルーングロムさん！！」"


message_111: ; 0x00667E
    .str "<audio_0007><Rhea>"
    .str "「誰？」"
    .str "<audio_0007><Rhea>"
    .str "「過去で会った人」"
    .str "<audio_0007><Rhea>"
    .str "「ここの宮廷魔術師なのよ」<wait>"


message_112: ; 0x0066D8
    .str "<audio_0007><Rhea>"
    .str "「まさかまたルーングロムさんに"
    .str "お会いできるなんて・・・」"
    .str "<audio_0007>ルーングロム"
    .str "「だてにエルフの血は流れていな"
    .str "いよ」"
    .str "<audio_0007>ルーングロム"
    .str "「本当はこんな形では会いたくな"
    .str "かったんだが・・・」"
    .str "<audio_0007>ルーングロム"
    .str "「しかし君達に会えて私もうれし"
    .str "いよ」"
    .str "<audio_0007><Rhea>"
    .str "「ルーングロムさんもおかわりな"
    .str "く」"
    .str "<audio_0007>ルーングロム"
    .str "「ああ、つもる話もあるだろうが"
    .str "先に陛下に会ってくれないか？」"
    .str "<audio_0007><Rhea>"
    .str "「はい」"


message_113: ; 0x00687C
    .str "<audio_0007>ルーングロム"
    .str "「国王陛下、過去からの使者の方々"
    .str "を、お連れいたしました」"
    .str "<audio_0007>アルァニスタ国王"
    .str "「大儀であった」"


message_114: ; 0x0068F6
    .str "<audio_0007>国王"
    .str "「ハリソンから話は聞いておると"
    .str "は思うが、ダオスは今や全世界"
    .str "の脅威となっておる」"
    .str "<audio_0007>国王"
    .str "「ダオスに未来へ未来へと時間転"
    .str "移する力がある限り・・・」"
    .str "<audio_0007>国王"
    .str "「永遠にイタチごっこになってし"
    .str "まうのは、すでに明らかだ」"
    .str "<audio_0007>国王"
    .str "「しかし我々も、ただ漫然と戦い"
    .str "続けてきたわけではない」"
    .str "<audio_0007><Rhea>"
    .str "「といいますと？」"
    .str "<audio_0007>ルーングロム"
    .str "「トールで発見された超古代の遺"
    .str "産から、問題を解決する鍵とな"
    .str "る情報が得られたのだ」"
    .str "<audio_0007><Rhea>"
    .str "「鍵、ですか？」"
    .str "<audio_0007>ルーングロム"
    .str "「超古代と呼ばれる数千年の昔、"
    .str "大陸は三つの大国によって覇権"
    .str "が争われていた」"
    .str "<audio_0007>ルーングロム"
    .str "「話くらいは聞いたことはあると"
    .str "思うが、オーディーン、フェン"
    .str "リル、そしてトールだ」"
    .str "<audio_0007>ルーングロム"
    .str "「隕石の落下によってトールが海"
    .str "に没した後」"
    .str "<audio_0007>ルーングロム"
    .str "「泥沼化した戦争にニ国の滅亡と"
    .str "いう形で終止符を打った謎の男"
    .str "達が現われた」"
    .str "<audio_0007>ルーングロム"
    .str "「彼らが使っていた三種の武具」"
    .str "<audio_0007>ルーングロム"
    .str "「そのありかを記した文書が見"
    .str "つかったのだ」"
    .str "<audio_0007><Rhea>"
    .str "「それがあればダオスを倒すこと"
    .str "ができるのですか？」"
    .str "<audio_0007>ルーングロム"
    .str "「その三種の武具は融合させるこ"
    .str "とで、時間を操る魔剣へと変化"
    .str "するらしいのだ」"
    .str "<audio_0007><Rhea>"
    .str "「つまり、ダオスの時間転移を封"
    .str "じることができるというわけで"
    .str "すね？」"
    .str "<audio_0007>ルーングロム"
    .str "「その通りだ」"
    .str "<audio_0007>ルーングロム"
    .str "「詳しい話は<color_0002>魔術研究室<color_0000>の者達に"
    .str "聞いて欲しい」"
    .str "<audio_0007>国王"
    .str "「しかし、このような若い者達が"
    .str "ダオスを倒すとは・・・」"
    .str "<audio_0007>国王"
    .str "「おぬしらの話は伝説となって我"
    .str "が王国に伝えられているのだ」"
    .str "<audio_0007>国王"
    .str "「今から１５０年前、世界の敵と"
    .str "なっていたダオスを倒したと」"
    .str "<audio_0007>国王"
    .str "「万策尽きた我々にはもうおぬし"
    .str "らしか頼るものがない」"
    .str "<audio_0007>国王"
    .str "「吉報を待っておりますぞ」"


message_115: ; 0x006F70
    .str "<audio_0007>ルーングロム"
    .str "「そうか、ついに見つかったんだ"
    .str "な！！」"
    .str "<audio_0007><Rhea>"
    .str "「はい、それで肝心のダオスの居"
    .str "場所を知っておきたいのです」"
    .str "<audio_0007>ルーングロム"
    .str "「うむ、実は明確なことはわから"
    .str "ないんだ」"
    .str "<audio_0007><Rhea>"
    .str "「えぇ？」"
    .str "<audio_0007>ルーングロム"
    .str "「だが、手掛かりはある」"
    .str "<audio_0007>ルーングロム"
    .str "「この世界にいつからか、常に闇"
    .str "に閉ざされた空間ができていた"
    .str "んだが、知っているか？」"


message_116: ; 0x0070E8
    .str "<audio_0007>ルーングロム"
    .str "「そういう場所があるんだ」"
    .str "<audio_0007>ルーングロム"
    .str "「私も詳しくは言えないんだが、"
    .str "そこに<color_0002>アーリィ<color_0000>という町がある」"
    .str "<audio_0007>ルーングロム"
    .str "「ダオスは時間を操る力があるん"
    .str "だろう」"
    .str "<audio_0007>ルーングロム"
    .str "「行ってみれば何か手がかりがつ"
    .str "かめるかもしれないな」"
    .str "<audio_0007><Rhea>"
    .str "「常闇の空間もダオスの仕業と考"
    .str "えるのが自然というわけか」"
    .str "<audio_0007>ルーングロム"
    .str "「うむ、それに普通では見えない"
    .str "ような空間に拠点を隠している"
    .str "ということも考えられる」"


message_117: ; 0x0072B2
    .str "<audio_0007>ルーングロム"
    .str "「いずれにしても、推測の域をで"
    .str "ないんだがね」<wait>"


message_118: ; 0x0072F8
    .str "<audio_0007><Rhea>"
    .str "「それでは、その常闇の国にある"
    .str "<color_0002>アーリィ<color_0000>という町に行ってみる"
    .str "か」"
    .str "<audio_0007>ルーングロム"
    .str "「それでは、私はこれで」"
    .str "<audio_0007>ルーングロム"
    .str "「がんばってくれよ」"


message_119: ; 0x0073A6
    .str "<speed_0000><color_0002>残り<numx_/*0073B41051*//*0073B600C0*/>コです。"
    .str "いくつ取りますか？<color_0000><speed_FFFF>"


message_120: ; 0x0073DE
    .str "<speed_0000><color_0002>残り：<numx_/*0073EE1051*//*0073F000C0*/>コ"
    .str "取る：<numx_/*0073FE1251*//*00740000C0*/>コ"
    .str "数が足りません<color_0000><speed_FFFF>"


message_121: ; 0x00741E
    .str "石取り名人"
    .str "「<numx_/*00742E1251*//*00743000C0*/>コ取るよ」"

