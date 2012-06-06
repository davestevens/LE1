## Operations - 627
FILE: sha_driver
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg()
-- FUNC_main
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.5 = 8
;;
c0    add $r0.2 = $r0.1, 0x10
c0    mov $r0.3 = (sha_driver_?1PACKET.3+0)
c0    stw 0x18[$r0.1] = $l0.0
;;
;;
;;
.call _bcopy, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret()
c0    stw 0x1c[$r0.1] = $r0.2
c0    mov $r0.4 = $r0.2
c0    call $l0.0 = FUNC__bcopy
;;
c0    mov $r0.3 = 2
;;
;;
c0    ldw $r0.4 = 0x1c[$r0.1]
;;
;;
.call main_test, caller, arg($r0.3:s32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_main_test
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
.call exit, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_exit
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-160, arg($r0.3:s32,$r0.4:u32)
-- FUNC_main_test
c0    add $r0.1 = $r0.1, (-0xa0)
c0    ldw.d $r0.2 = ((_impure_ptr+0)+0)[$r0.0]
;;
c0    cmplt $b0.0 = $r0.3, 2
c0    add $r0.5 = $r0.1, 0x10
c0    stw 0x6c[$r0.1] = $l0.0
;;
;;
c0    ldw.d $r0.2 = 4[$r0.2]
;;
c0    stw 0x74[$r0.1] = $r0.5
c0    brf $b0.0, sha_driver_L0?3
;;
c0    mov $r0.3 = $r0.5
;;
.call sha_stream, caller, arg($r0.3:u32,$r0.4:u32), ret()
c0    mov $r0.4 = $r0.2
c0    call $l0.0 = FUNC_sha_stream
;;
c0    ldw $r0.3 = 0x74[$r0.1]
;;
;;
.call sha_print, caller, arg($r0.3:u32), ret()
c0    call $l0.0 = FUNC_sha_print
;;
-- sha_driver_L1?3
c0    mov $r0.3 = $r0.0
c0    ldw $l0.0 = 0x6c[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0xa0), $l0.0
;;
-- sha_driver_L0?3
c0    add $r0.5 = $r0.1, 0x10
c0    stw 0x80[$r0.1] = $r0.57
;;
c0    stw 0x7c[$r0.1] = $r0.58
c0    mov $r0.57 = $r0.4
;;
c0    mov $r0.58 = $r0.3
c0    stw 0x78[$r0.1] = $r0.59
;;
c0    mov $r0.59 = $r0.5
;;
-- sha_driver_L2?3
c0    add $r0.58 = $r0.58, -1
c0    ldw.d $r0.3 = 4[$r0.57]
c0    add $r0.57 = $r0.57, 4
;;
c0    mov $r0.4 = (sha_driver_?1STRINGPACKET.3+0)
;;
;;
c0    cmpne $b0.0 = $r0.58, $r0.0
;;
;;
;;
c0    brf $b0.0, sha_driver_L3?3
;;
.call fopen, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_fopen
;;
c0    cmpeq $b0.0 = $r0.3, $r0.0
c0    ldw.d $r0.4 = 0[$r0.57]
c0    mov $r0.2 = $r0.3
;;
c0    mov $r0.3 = (sha_driver_?1STRINGPACKET.4+0)
;;
;;
c0    brf $b0.0, sha_driver_L4?3
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    goto sha_driver_L2?3
;;
-- sha_driver_L4?3
.call sha_stream, caller, arg($r0.3:u32,$r0.4:u32), ret()
c0    mov $r0.4 = $r0.2
c0    stw 0x70[$r0.1] = $r0.2
c0    mov $r0.3 = $r0.59
c0    call $l0.0 = FUNC_sha_stream
;;
.call sha_print, caller, arg($r0.3:u32), ret()
c0    mov $r0.3 = $r0.59
c0    call $l0.0 = FUNC_sha_print
;;
;;
c0    ldw $r0.3 = 0x70[$r0.1]
;;
;;
.call fclose, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_fclose
;;
c0    goto sha_driver_L2?3
;;
-- sha_driver_L3?3
c0    ldw $r0.59 = 0x78[$r0.1]
;;
c0    ldw $r0.58 = 0x7c[$r0.1]
;;
c0    ldw $r0.57 = 0x80[$r0.1]
;;
;;
c0    goto sha_driver_L1?3
;;
ENDOFFILE: sha_driver
FILE: _bcopy
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
-- FUNC__bcopy
c0    mov $r0.9 = 3
c0    mov $r0.8 = 2
;;
c0    mov $r0.6 = $r0.4
c0    mov $r0.2 = $r0.3
c0    mov $r0.4 = $r0.0
c0    mov $r0.7 = 1
;;
-- _bcopy_L0?3
c0    cmpltu $b0.0 = $r0.4, $r0.5
c0    ldb.d $r0.3 = 0[$r0.2]
c0    cmpltu $b0.1 = $r0.7, $r0.5
c0    cmpltu $b0.2 = $r0.8, $r0.5
;;
c0    cmpltu $b0.3 = $r0.9, $r0.5
c0    add $r0.9 = $r0.9, 4
c0    add $r0.8 = $r0.8, 4
c0    add $r0.4 = $r0.4, 4
;;
c0    add $r0.7 = $r0.7, 4
;;
c0    brf $b0.0, _bcopy_L1?3
;;
c0    stb 0[$r0.6] = $r0.3
c0    brf $b0.1, _bcopy_L2?3
;;
c0    ldb $r0.3 = 1[$r0.2]
;;
;;
;;
c0    stb 1[$r0.6] = $r0.3
c0    brf $b0.2, _bcopy_L3?3
;;
c0    ldb $r0.3 = 2[$r0.2]
;;
;;
;;
c0    stb 2[$r0.6] = $r0.3
c0    brf $b0.3, _bcopy_L4?3
;;
c0    ldb $r0.3 = 3[$r0.2]
c0    add $r0.2 = $r0.2, 4
;;
;;
;;
c0    stb 3[$r0.6] = $r0.3
c0    add $r0.6 = $r0.6, 4
;;
;;
c0    goto _bcopy_L0?3
;;
-- _bcopy_L4?3
.return ret()
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- _bcopy_L3?3
.return ret()
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- _bcopy_L2?3
.return ret()
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- _bcopy_L1?3
.return ret()
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
ENDOFFILE: _bcopy
FILE: memcpy
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
-- FUNC_memcpy
c0    mov $r0.9 = 3
c0    mov $r0.8 = 2
;;
c0    mov $r0.2 = $r0.4
c0    mov $r0.6 = $r0.3
c0    mov $r0.4 = $r0.0
c0    mov $r0.7 = 1
;;
c0    mov $r0.10 = $r0.3
;;
-- memcpy_L0?3
c0    cmpltu $b0.0 = $r0.4, $r0.5
c0    ldb.d $r0.3 = 0[$r0.2]
c0    cmpltu $b0.1 = $r0.7, $r0.5
c0    cmpltu $b0.2 = $r0.8, $r0.5
;;
c0    cmpltu $b0.3 = $r0.9, $r0.5
c0    add $r0.9 = $r0.9, 4
c0    add $r0.8 = $r0.8, 4
c0    add $r0.4 = $r0.4, 4
;;
c0    add $r0.7 = $r0.7, 4
;;
c0    brf $b0.0, memcpy_L1?3
;;
c0    stb 0[$r0.6] = $r0.3
c0    brf $b0.1, memcpy_L2?3
;;
c0    ldb $r0.3 = 1[$r0.2]
;;
;;
;;
c0    stb 1[$r0.6] = $r0.3
c0    brf $b0.2, memcpy_L3?3
;;
c0    ldb $r0.3 = 2[$r0.2]
;;
;;
;;
c0    stb 2[$r0.6] = $r0.3
c0    brf $b0.3, memcpy_L4?3
;;
c0    ldb $r0.3 = 3[$r0.2]
c0    add $r0.2 = $r0.2, 4
;;
;;
;;
c0    stb 3[$r0.6] = $r0.3
c0    add $r0.6 = $r0.6, 4
;;
;;
c0    goto memcpy_L0?3
;;
-- memcpy_L4?3
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.10
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- memcpy_L3?3
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.10
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- memcpy_L2?3
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.10
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- memcpy_L1?3
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.10
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
ENDOFFILE: memcpy
FILE: memset
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:s32,$r0.5:u32)
-- FUNC_memset
c0    mov $r0.8 = 3
c0    mov $r0.7 = 2
;;
c0    mov $r0.2 = $r0.0
c0    sxtb $r0.4 = $r0.4
c0    mov $r0.6 = 1
c0    mov $r0.9 = $r0.5
;;
c0    mov $r0.5 = $r0.3
c0    mov $r0.9 = $r0.3
c0    mov $r0.10 = $r0.9
;;
c0    mov $r0.3 = $r0.10
;;
-- memset_L0?3
c0    cmpltu $b0.0 = $r0.2, $r0.3
c0    cmpltu $b0.1 = $r0.6, $r0.3
c0    cmpltu $b0.2 = $r0.7, $r0.3
c0    cmpltu $b0.3 = $r0.8, $r0.3
;;
c0    add $r0.6 = $r0.6, 4
c0    add $r0.8 = $r0.8, 4
c0    add $r0.7 = $r0.7, 4
c0    add $r0.2 = $r0.2, 4
;;
;;
c0    brf $b0.0, memset_L1?3
;;
c0    stb 0[$r0.5] = $r0.4
c0    brf $b0.1, memset_L1?3
;;
c0    stb 1[$r0.5] = $r0.4
c0    brf $b0.2, memset_L1?3
;;
c0    stb 2[$r0.5] = $r0.4
c0    brf $b0.3, memset_L1?3
;;
c0    stb 3[$r0.5] = $r0.4
c0    add $r0.5 = $r0.5, 4
;;
;;
c0    goto memset_L0?3
;;
-- memset_L1?3
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.9
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
ENDOFFILE: memset
FILE: sha
.entry caller, sp=$r0.1, rl=$l0.0, asize=-320, arg($r0.3:u32)
-- FUNC_sha_27707.sha_transform
c0    add $r0.1 = $r0.1, (-0x140)
c0    add $r0.6 = $r0.3, 28
c0    mov $r0.4 = (~0xf)
;;
c0    mov $r0.9 = $r0.1
c0    mov $r0.14 = $r0.3
;;
c0    mov $r0.5 = $r0.9
;;
c0    mov $r0.2 = $r0.6
;;
-- sha_L0?3
c0    cmplt $b0.0 = $r0.4, $r0.0
c0    ldw.d $r0.3 = 0[$r0.2]
c0    add $r0.4 = $r0.4, 4
;;
c0    ldw.d $r0.6 = 4[$r0.2]
;;
c0    ldw.d $r0.7 = 8[$r0.2]
;;
c0    ldw.d $r0.8 = 12[$r0.2]
c0    add $r0.2 = $r0.2, 16
c0    brf $b0.0, sha_L1?3
;;
c0    stw 0[$r0.5] = $r0.3
;;
c0    stw 4[$r0.5] = $r0.6
;;
c0    stw 8[$r0.5] = $r0.7
;;
c0    stw 12[$r0.5] = $r0.8
c0    add $r0.5 = $r0.5, 16
;;
;;
c0    goto sha_L0?3
;;
-- sha_L1?3
c0    mov $r0.4 = (~0x3f)
c0    mov $r0.13 = $r0.9
;;
;;
c0    mov $r0.2 = $r0.9
;;
-- sha_L2?3
c0    cmplt $b0.0 = $r0.4, $r0.0
c0    ldw.d $r0.3 = 0[$r0.2]
c0    add $r0.4 = $r0.4, 4
;;
c0    ldw.d $r0.5 = 52[$r0.2]
;;
c0    ldw.d $r0.6 = 8[$r0.2]
;;
c0    ldw.d $r0.7 = 32[$r0.2]
c0    brf $b0.0, sha_L3?3
;;
c0    xor $r0.3 = $r0.3, $r0.5
c0    ldw $r0.5 = 44[$r0.2]
;;
c0    ldw $r0.8 = 12[$r0.2]
;;
c0    xor $r0.7 = $r0.6, $r0.7
c0    ldw $r0.9 = 20[$r0.2]
;;
c0    ldw $r0.10 = 4[$r0.2]
;;
c0    ldw $r0.11 = 56[$r0.2]
;;
c0    xor $r0.3 = $r0.3, $r0.7
c0    ldw $r0.7 = 36[$r0.2]
c0    xor $r0.9 = $r0.8, $r0.9
;;
c0    ldw $r0.12 = 60[$r0.2]
;;
c0    xor $r0.10 = $r0.10, $r0.11
c0    ldw $r0.11 = 16[$r0.2]
;;
c0    xor $r0.8 = $r0.8, $r0.7
c0    ldw $r0.7 = 40[$r0.2]
c0    xor $r0.5 = $r0.3, $r0.5
;;
c0    stw 64[$r0.2] = $r0.3
c0    xor $r0.6 = $r0.6, $r0.12
;;
;;
c0    xor $r0.10 = $r0.10, $r0.8
c0    xor $r0.11 = $r0.11, $r0.7
c0    xor $r0.5 = $r0.5, $r0.9
;;
;;
;;
c0    xor $r0.6 = $r0.6, $r0.11
c0    stw 76[$r0.2] = $r0.5
;;
c0    stw 68[$r0.2] = $r0.10
;;
;;
c0    stw 72[$r0.2] = $r0.6
c0    add $r0.2 = $r0.2, 16
;;
;;
c0    goto sha_L2?3
;;
-- sha_L3?3
c0    ldw $r0.12 = 16[$r0.14]
c0    mov $r0.13 = (~0x11)
c0    mov $r0.23 = $r0.14
c0    mov $r0.22 = $r0.13
;;
c0    ldw $r0.5 = 0[$r0.14]
c0    mov $r0.2 = $r0.22
c0    mov $r0.4 = 1518500249
;;
c0    ldw $r0.11 = 8[$r0.14]
;;
c0    ldw $r0.9 = 12[$r0.14]
;;
c0    ldw $r0.8 = 4[$r0.14]
;;
;;
;;
-- sha_L4?3
c0    ldw $r0.3 = 0[$r0.2]
c0    andc $r0.10 = $r0.8, $r0.9
c0    shru $r0.6 = $r0.5, 27
c0    shl $r0.7 = $r0.5, 5
;;
c0    and $r0.14 = $r0.8, $r0.11
c0    shru $r0.16 = $r0.8, 2
c0    shl $r0.8 = $r0.8, 30
c0    ldw $r0.15 = 4[$r0.2]
;;
c0    andc $r0.17 = $r0.5, $r0.11
c0    shru $r0.18 = $r0.5, 2
c0    shl $r0.19 = $r0.5, 30
c0    add $r0.9 = $r0.9, $r0.4
;;
c0    or $r0.6 = $r0.6, $r0.7
c0    add $r0.3 = $r0.3, $r0.4
c0    cmplt $b0.0 = $r0.13, $r0.0
c0    add $r0.7 = $r0.11, $r0.4
;;
c0    or $r0.10 = $r0.10, $r0.14
c0    or $r0.16 = $r0.16, $r0.8
c0    ldw.d $r0.14 = 8[$r0.2]
c0    add $r0.2 = $r0.2, 12
;;
c0    or $r0.18 = $r0.18, $r0.19
c0    add $r0.13 = $r0.13, 3
;;
c0    add $r0.3 = $r0.3, $r0.6
;;
c0    and $r0.5 = $r0.5, $r0.16
c0    add $r0.10 = $r0.10, $r0.12
c0    mov $r0.12 = $r0.16
;;
;;
;;
c0    or $r0.17 = $r0.17, $r0.5
c0    add $r0.3 = $r0.3, $r0.10
;;
;;
;;
c0    shru $r0.6 = $r0.3, 27
c0    shl $r0.10 = $r0.3, 5
c0    add $r0.9 = $r0.9, $r0.17
c0    shru $r0.17 = $r0.3, 2
;;
c0    andc $r0.20 = $r0.3, $r0.16
c0    and $r0.21 = $r0.3, $r0.18
c0    shl $r0.19 = $r0.3, 30
;;
;;
c0    or $r0.6 = $r0.6, $r0.10
;;
c0    or $r0.20 = $r0.20, $r0.21
;;
;;
c0    add $r0.15 = $r0.15, $r0.6
;;
c0    add $r0.7 = $r0.7, $r0.20
;;
;;
c0    add $r0.9 = $r0.9, $r0.15
c0    brf $b0.0, sha_L5?3
;;
c0    or $r0.11 = $r0.17, $r0.19
;;
;;
c0    mov $r0.9 = $r0.18
c0    shru $r0.3 = $r0.9, 27
c0    shl $r0.6 = $r0.9, 5
c0    mov $r0.10 = $r0.9
;;
c0    mov $r0.8 = $r0.10
;;
;;
c0    or $r0.3 = $r0.3, $r0.6
;;
;;
;;
c0    add $r0.14 = $r0.14, $r0.3
;;
;;
;;
c0    add $r0.5 = $r0.7, $r0.14
;;
;;
c0    goto sha_L4?3
;;
-- sha_L5?3
c0    mov $r0.11 = $r0.18
c0    mov $r0.8 = $r0.16
c0    mov $r0.12 = $r0.11
c0    mov $r0.13 = (~0x11)
;;
c0    add $r0.2 = $r0.22, 80
c0    mov $r0.4 = 1859775393
;;
c0    mov $r0.5 = $r0.9
c0    mov $r0.9 = $r0.3
;;
;;
-- sha_L6?3
c0    ldw $r0.3 = 0[$r0.2]
c0    xor $r0.10 = $r0.8, $r0.9
c0    shru $r0.6 = $r0.5, 27
c0    shl $r0.7 = $r0.5, 5
;;
c0    shru $r0.15 = $r0.9, 2
c0    shl $r0.9 = $r0.9, 30
c0    ldw $r0.14 = 4[$r0.2]
c0    add $r0.8 = $r0.8, $r0.4
;;
c0    shru $r0.16 = $r0.5, 2
c0    shl $r0.17 = $r0.5, 30
c0    cmplt $b0.0 = $r0.13, $r0.0
c0    add $r0.18 = $r0.11, $r0.4
;;
c0    xor $r0.10 = $r0.10, $r0.11
c0    or $r0.6 = $r0.6, $r0.7
c0    add $r0.3 = $r0.3, $r0.4
c0    ldw.d $r0.7 = 8[$r0.2]
;;
c0    or $r0.15 = $r0.15, $r0.9
c0    add $r0.2 = $r0.2, 12
c0    add $r0.13 = $r0.13, 3
;;
c0    or $r0.16 = $r0.16, $r0.17
;;
c0    add $r0.10 = $r0.10, $r0.12
c0    add $r0.3 = $r0.3, $r0.6
;;
c0    xor $r0.6 = $r0.11, $r0.15
c0    mov $r0.12 = $r0.15
;;
;;
c0    add $r0.3 = $r0.3, $r0.10
;;
c0    xor $r0.6 = $r0.6, $r0.5
;;
;;
c0    shru $r0.10 = $r0.3, 27
c0    shl $r0.17 = $r0.3, 5
c0    shru $r0.19 = $r0.3, 2
c0    shl $r0.20 = $r0.3, 30
;;
c0    add $r0.8 = $r0.8, $r0.6
c0    xor $r0.6 = $r0.3, $r0.16
;;
;;
c0    or $r0.10 = $r0.10, $r0.17
;;
c0    xor $r0.6 = $r0.6, $r0.15
;;
;;
c0    add $r0.14 = $r0.14, $r0.10
;;
c0    add $r0.18 = $r0.18, $r0.6
;;
;;
c0    add $r0.8 = $r0.8, $r0.14
c0    brf $b0.0, sha_L7?3
;;
c0    or $r0.11 = $r0.19, $r0.20
;;
;;
c0    mov $r0.8 = $r0.16
c0    mov $r0.9 = $r0.8
c0    shru $r0.3 = $r0.8, 27
c0    shl $r0.6 = $r0.8, 5
;;
;;
;;
c0    or $r0.3 = $r0.3, $r0.6
;;
;;
;;
c0    add $r0.7 = $r0.7, $r0.3
;;
;;
;;
c0    add $r0.5 = $r0.18, $r0.7
;;
;;
c0    goto sha_L6?3
;;
-- sha_L7?3
c0    mov $r0.11 = $r0.3
c0    mov $r0.9 = $r0.16
c0    mov $r0.12 = $r0.11
c0    mov $r0.13 = (~0x11)
;;
c0    add $r0.2 = $r0.22, 160
c0    mov $r0.24 = $r0.22
c0    mov $r0.4 = -1894007588
;;
c0    mov $r0.5 = $r0.8
c0    mov $r0.8 = $r0.15
;;
;;
-- sha_L8?3
c0    ldw $r0.3 = 0[$r0.2]
c0    and $r0.10 = $r0.8, $r0.9
c0    shru $r0.6 = $r0.5, 27
c0    shl $r0.7 = $r0.5, 5
;;
c0    and $r0.15 = $r0.8, $r0.11
c0    and $r0.14 = $r0.9, $r0.11
c0    shru $r0.17 = $r0.11, 2
c0    ldw $r0.16 = 4[$r0.2]
;;
c0    and $r0.18 = $r0.9, $r0.5
c0    shru $r0.19 = $r0.5, 2
c0    shl $r0.11 = $r0.11, 30
c0    add $r0.8 = $r0.8, $r0.4
;;
c0    or $r0.6 = $r0.6, $r0.7
c0    shl $r0.7 = $r0.5, 30
c0    add $r0.3 = $r0.3, $r0.4
c0    cmplt $b0.0 = $r0.13, $r0.0
;;
c0    or $r0.10 = $r0.10, $r0.14
c0    ldw.d $r0.20 = 8[$r0.2]
c0    add $r0.14 = $r0.9, $r0.4
c0    add $r0.2 = $r0.2, 12
;;
c0    or $r0.17 = $r0.17, $r0.11
c0    add $r0.13 = $r0.13, 3
;;
c0    or $r0.19 = $r0.19, $r0.7
c0    add $r0.3 = $r0.3, $r0.6
;;
c0    or $r0.10 = $r0.10, $r0.15
;;
c0    and $r0.6 = $r0.9, $r0.17
c0    and $r0.5 = $r0.5, $r0.17
;;
c0    and $r0.7 = $r0.17, $r0.19
;;
c0    add $r0.10 = $r0.10, $r0.12
c0    mov $r0.12 = $r0.17
;;
c0    or $r0.6 = $r0.6, $r0.5
;;
;;
c0    add $r0.3 = $r0.3, $r0.10
;;
c0    or $r0.6 = $r0.6, $r0.18
;;
;;
c0    shru $r0.10 = $r0.3, 27
c0    shl $r0.15 = $r0.3, 5
c0    shru $r0.18 = $r0.3, 2
c0    shl $r0.21 = $r0.3, 30
;;
c0    add $r0.8 = $r0.8, $r0.6
c0    and $r0.22 = $r0.3, $r0.17
c0    and $r0.6 = $r0.3, $r0.19
;;
;;
c0    or $r0.10 = $r0.10, $r0.15
;;
c0    or $r0.7 = $r0.7, $r0.6
;;
;;
c0    add $r0.16 = $r0.16, $r0.10
;;
c0    or $r0.7 = $r0.7, $r0.22
;;
;;
c0    add $r0.8 = $r0.8, $r0.16
c0    brf $b0.0, sha_L9?3
;;
c0    add $r0.14 = $r0.14, $r0.7
c0    or $r0.9 = $r0.18, $r0.21
;;
;;
c0    mov $r0.8 = $r0.19
c0    shru $r0.3 = $r0.8, 27
c0    shl $r0.6 = $r0.8, 5
c0    mov $r0.7 = $r0.8
;;
c0    mov $r0.11 = $r0.7
;;
;;
c0    or $r0.3 = $r0.3, $r0.6
;;
;;
;;
c0    add $r0.20 = $r0.20, $r0.3
;;
;;
;;
c0    add $r0.5 = $r0.14, $r0.20
;;
;;
c0    goto sha_L8?3
;;
-- sha_L9?3
c0    mov $r0.9 = $r0.3
c0    mov $r0.11 = $r0.19
c0    mov $r0.12 = $r0.9
c0    mov $r0.13 = (~0x11)
;;
c0    add $r0.2 = $r0.24, 240
c0    mov $r0.4 = -899497514
;;
c0    mov $r0.5 = $r0.8
c0    mov $r0.8 = $r0.17
;;
;;
-- sha_L10?3
c0    ldw $r0.3 = 0[$r0.2]
c0    xor $r0.10 = $r0.8, $r0.9
c0    shru $r0.6 = $r0.5, 27
c0    shl $r0.7 = $r0.5, 5
;;
c0    shru $r0.15 = $r0.9, 2
c0    shl $r0.9 = $r0.9, 30
c0    ldw $r0.14 = 4[$r0.2]
c0    add $r0.8 = $r0.8, $r0.4
;;
c0    shru $r0.16 = $r0.5, 2
c0    shl $r0.17 = $r0.5, 30
c0    cmplt $b0.0 = $r0.13, $r0.0
c0    add $r0.18 = $r0.11, $r0.4
;;
c0    xor $r0.10 = $r0.10, $r0.11
c0    or $r0.6 = $r0.6, $r0.7
c0    add $r0.3 = $r0.3, $r0.4
c0    ldw.d $r0.7 = 8[$r0.2]
;;
c0    or $r0.15 = $r0.15, $r0.9
c0    add $r0.2 = $r0.2, 12
c0    add $r0.13 = $r0.13, 3
;;
c0    or $r0.16 = $r0.16, $r0.17
;;
c0    add $r0.10 = $r0.10, $r0.12
c0    add $r0.3 = $r0.3, $r0.6
;;
c0    xor $r0.6 = $r0.11, $r0.15
c0    mov $r0.12 = $r0.15
;;
;;
c0    add $r0.3 = $r0.3, $r0.10
;;
c0    xor $r0.6 = $r0.6, $r0.5
;;
;;
c0    shru $r0.10 = $r0.3, 27
c0    shl $r0.17 = $r0.3, 5
c0    shru $r0.19 = $r0.3, 2
c0    shl $r0.20 = $r0.3, 30
;;
c0    add $r0.8 = $r0.8, $r0.6
c0    xor $r0.6 = $r0.3, $r0.16
;;
;;
c0    or $r0.10 = $r0.10, $r0.17
;;
c0    xor $r0.6 = $r0.6, $r0.15
;;
;;
c0    add $r0.14 = $r0.14, $r0.10
;;
c0    add $r0.18 = $r0.18, $r0.6
;;
;;
c0    add $r0.8 = $r0.8, $r0.14
c0    brf $b0.0, sha_L11?3
;;
c0    or $r0.11 = $r0.19, $r0.20
;;
;;
c0    mov $r0.8 = $r0.16
c0    shru $r0.3 = $r0.8, 27
c0    shl $r0.6 = $r0.8, 5
c0    mov $r0.10 = $r0.8
;;
c0    mov $r0.9 = $r0.10
;;
;;
c0    or $r0.3 = $r0.3, $r0.6
;;
;;
;;
c0    add $r0.7 = $r0.7, $r0.3
;;
;;
;;
c0    add $r0.5 = $r0.18, $r0.7
;;
;;
c0    goto sha_L10?3
;;
-- sha_L11?3
c0    ldw $r0.2 = 0[$r0.23]
;;
c0    ldw $r0.4 = 4[$r0.23]
;;
c0    ldw $r0.5 = 8[$r0.23]
;;
c0    add $r0.8 = $r0.8, $r0.2
c0    ldw $r0.2 = 12[$r0.23]
;;
c0    add $r0.3 = $r0.3, $r0.4
c0    ldw $r0.4 = 16[$r0.23]
;;
c0    add $r0.16 = $r0.16, $r0.5
;;
c0    stw 0[$r0.23] = $r0.8
c0    add $r0.15 = $r0.15, $r0.2
;;
c0    stw 4[$r0.23] = $r0.3
c0    add $r0.11 = $r0.11, $r0.4
;;
c0    stw 8[$r0.23] = $r0.16
;;
c0    stw 12[$r0.23] = $r0.15
;;
.return ret()
c0    stw 16[$r0.23] = $r0.11
c0    return $r0.1 = $r0.1, (0x140), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32)
-- FUNC_sha_init
c0    mov $r0.2 = 1732584193
;;
c0    mov $r0.5 = -1732584194
c0    mov $r0.4 = -271733879
;;
c0    mov $r0.7 = -1009589776
c0    mov $r0.6 = 271733878
;;
c0    stw 0[$r0.3] = $r0.2
;;
c0    stw 4[$r0.3] = $r0.4
;;
c0    stw 8[$r0.3] = $r0.5
;;
c0    stw 12[$r0.3] = $r0.6
;;
c0    stw 16[$r0.3] = $r0.7
;;
c0    stw 20[$r0.3] = $r0.0
;;
.return ret()
c0    stw 24[$r0.3] = $r0.0
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:s32)
-- FUNC_sha_update
c0    add $r0.1 = $r0.1, (-0x40)
c0    ldw $r0.2 = 20[$r0.3]
c0    shru $r0.6 = $r0.5, 29
;;
c0    add $r0.7 = $r0.3, 28
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    stw 0x14[$r0.1] = $r0.60
;;
c0    sh3add $r0.8 = $r0.5, $r0.2
c0    stw 0x18[$r0.1] = $r0.59
c0    mov $r0.60 = $r0.3
;;
c0    mov $r0.59 = $r0.4
c0    stw 0x1c[$r0.1] = $r0.58
;;
c0    stw 0x20[$r0.1] = $r0.57
c0    mov $r0.58 = $r0.7
;;
c0    cmpltu $b0.0 = $r0.8, $r0.2
c0    ldw.d $r0.4 = 20[$r0.3]
c0    mov $r0.57 = $r0.5
;;
c0    ldw.d $r0.7 = 24[$r0.3]
;;
;;
c0    sh3add $r0.5 = $r0.5, $r0.4
c0    br $b0.0, sha_L12?3
;;
-- sha_L13?3
c0    add $r0.7 = $r0.7, $r0.6
;;
;;
c0    stw 20[$r0.3] = $r0.5
;;
c0    stw 24[$r0.3] = $r0.7
;;
-- sha_L14?3
c0    cmpge $b0.0 = $r0.57, 64
c0    mov $r0.5 = 64
c0    mov $r0.3 = $r0.58
c0    mov $r0.4 = $r0.59
;;
;;
;;
c0    brf $b0.0, sha_L15?3
;;
.call memcpy, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_memcpy
;;
.call sha_27707.sha_transform, caller, arg($r0.3:u32), ret()
c0    mov $r0.3 = $r0.60
c0    call $l0.0 = FUNC_sha_27707.sha_transform
;;
c0    add $r0.57 = $r0.57, -64
c0    add $r0.59 = $r0.59, 64
;;
;;
c0    goto sha_L14?3
;;
-- sha_L15?3
c0    add $r0.3 = $r0.60, 28
c0    mov $r0.5 = $r0.57
c0    mov $r0.4 = $r0.59
;;
;;
.call memcpy, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_memcpy
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    ldw $r0.60 = 0x14[$r0.1]
;;
c0    ldw $r0.59 = 0x18[$r0.1]
;;
c0    ldw $r0.58 = 0x1c[$r0.1]
;;
c0    ldw $r0.57 = 0x20[$r0.1]
;;
;;
.return ret()
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- sha_L12?3
c0    ldw $r0.2 = 24[$r0.3]
c0    mov $r0.60 = $r0.3
;;
;;
c0    mov $r0.5 = $r0.57
;;
c0    add $r0.2 = $r0.2, 1
;;
;;
;;
c0    stw 24[$r0.3] = $r0.2
;;
c0    ldw $r0.7 = 24[$r0.3]
;;
;;
c0    sh3add $r0.5 = $r0.5, $r0.4
c0    goto sha_L13?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32)
-- FUNC_sha_final
c0    add $r0.1 = $r0.1, (-0x40)
c0    ldw $r0.2 = 20[$r0.3]
c0    mov $r0.6 = 128
;;
c0    add $r0.7 = $r0.3, 28
c0    mov $r0.4 = $r0.0
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    stw 0x14[$r0.1] = $r0.3
;;
c0    shru $r0.8 = $r0.2, 3
c0    stw 0x18[$r0.1] = $r0.2
;;
c0    stw 0x1c[$r0.1] = $r0.7
;;
c0    ldw $r0.7 = 24[$r0.3]
;;
c0    and $r0.8 = $r0.8, 63
;;
;;
c0    stw 0x20[$r0.1] = $r0.7
;;
c0    add $r0.2 = $r0.8, 1
c0    add $r0.3 = $r0.3, $r0.8
c0    rsub $r0.5 = 63, $r0.8
;;
;;
;;
c0    stb 28[$r0.3] = $r0.6
c0    cmpgt $b0.0 = $r0.2, 56
c0    add $r0.7 = $r0.3, 29
;;
;;
;;
c0    mov $r0.3 = $r0.7
c0    brf $b0.0, sha_L16?3
;;
.call memset, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_memset
;;
c0    ldw $r0.3 = 0x14[$r0.1]
;;
;;
.call sha_27707.sha_transform, caller, arg($r0.3:u32), ret()
c0    call $l0.0 = FUNC_sha_27707.sha_transform
;;
c0    mov $r0.5 = 56
c0    mov $r0.4 = $r0.0
c0    ldw $r0.3 = 0x1c[$r0.1]
;;
;;
.call memset, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_memset
;;
-- sha_L17?3
c0    ldw $r0.3 = 0x14[$r0.1]
;;
c0    ldw $r0.7 = 0x20[$r0.1]
;;
c0    ldw $r0.2 = 0x18[$r0.1]
;;
c0    add $r0.4 = $r0.3, 28
;;
;;
;;
c0    stw 56[$r0.4] = $r0.7
;;
.call sha_27707.sha_transform, caller, arg($r0.3:u32), ret()
c0    stw 60[$r0.4] = $r0.2
c0    call $l0.0 = FUNC_sha_27707.sha_transform
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret()
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- sha_L16?3
c0    rsub $r0.5 = 55, $r0.8
c0    mov $r0.4 = $r0.0
c0    ldw $r0.2 = 0x14[$r0.1]
;;
;;
;;
c0    add $r0.2 = $r0.2, 29
;;
;;
;;
c0    add $r0.3 = $r0.2, $r0.8
;;
;;
.call memset, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_memset
;;
c0    goto sha_L17?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-8256, arg($r0.3:u32,$r0.4:u32)
-- FUNC_sha_stream
c0    add $r0.1 = $r0.1, (-0x2040)
;;
c0    add $r0.2 = $r0.1, 0x10
c0    stw 0x2010[$r0.1] = $l0.0
;;
c0    stw 0x2020[$r0.1] = $r0.4
;;
c0    stw 0x2014[$r0.1] = $r0.57
;;
c0    stw 0x2018[$r0.1] = $r0.58
;;
c0    stw 0x201c[$r0.1] = $r0.59
;;
c0    stw 0x2024[$r0.1] = $r0.3
;;
.call sha_init, caller, arg($r0.3:u32), ret()
c0    stw 0x2028[$r0.1] = $r0.2
c0    call $l0.0 = FUNC_sha_init
;;
c0    ldw $r0.58 = 0x2020[$r0.1]
;;
c0    ldw $r0.59 = 0x2024[$r0.1]
;;
c0    ldw $r0.57 = 0x2028[$r0.1]
;;
;;
;;
-- sha_L18?3
c0    mov $r0.4 = 1
c0    mov $r0.5 = 8192
c0    mov $r0.3 = $r0.57
;;
.call fread, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32)
c0    mov $r0.6 = $r0.58
c0    call $l0.0 = FUNC_fread
;;
c0    cmpgt $b0.0 = $r0.3, $r0.0
c0    mov $r0.4 = $r0.57
c0    mov $r0.3 = $r0.59
c0    mov $r0.5 = $r0.3
;;
;;
;;
c0    brf $b0.0, sha_L19?3
;;
.call sha_update, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret()
c0    call $l0.0 = FUNC_sha_update
;;
c0    goto sha_L18?3
;;
-- sha_L19?3
.call sha_final, caller, arg($r0.3:u32), ret()
c0    mov $r0.3 = $r0.59
c0    call $l0.0 = FUNC_sha_final
;;
c0    ldw $l0.0 = 0x2010[$r0.1]
;;
c0    ldw $r0.59 = 0x201c[$r0.1]
;;
c0    ldw $r0.58 = 0x2018[$r0.1]
;;
c0    ldw $r0.57 = 0x2014[$r0.1]
;;
;;
.return ret()
c0    return $r0.1 = $r0.1, (0x2040), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
-- FUNC_sha_print
c0    add $r0.1 = $r0.1, (-0x20)
c0    ldw $r0.4 = 0[$r0.3]
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    ldw $r0.5 = 4[$r0.3]
;;
c0    ldw $r0.6 = 8[$r0.3]
;;
c0    ldw $r0.7 = 12[$r0.3]
;;
c0    ldw $r0.8 = 16[$r0.3]
c0    mov $r0.3 = (sha_?1STRINGPACKET.1+0)
;;
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret()
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
ENDOFFILE: sha


##Import
FUNC_fclose
FUNC_fopen
FUNC_fread
FUNC_printf
_impure_ptr


##ImportObjects


##Instruction Labels
0000 - FUNC_main
0034 - FUNC_main_test
0068 - sha_driver_L1?3
0074 - sha_driver_L0?3
0090 - sha_driver_L2?3
00c8 - sha_driver_L4?3
00ec - sha_driver_L3?3
00fc - FUNC__bcopy
0114 - _bcopy_L0?3
0170 - _bcopy_L4?3
0174 - _bcopy_L3?3
0178 - _bcopy_L2?3
017c - _bcopy_L1?3
0180 - FUNC_memcpy
019c - memcpy_L0?3
01f8 - memcpy_L4?3
0200 - memcpy_L3?3
0208 - memcpy_L2?3
0210 - memcpy_L1?3
0218 - FUNC_memset
0240 - memset_L0?3
0288 - memset_L1?3
0290 - FUNC_sha_27707.sha_transform
02ac - sha_L0?3
02e4 - sha_L1?3
02f0 - sha_L2?3
0378 - sha_L3?3
03a0 - sha_L4?3
046c - sha_L5?3
048c - sha_L6?3
0548 - sha_L7?3
056c - sha_L8?3
0650 - sha_L9?3
0670 - sha_L10?3
0730 - sha_L11?3
0770 - FUNC_sha_init
07a4 - FUNC_sha_update
07f0 - sha_L13?3
07fc - sha_L14?3
0828 - sha_L15?3
0850 - sha_L12?3
0870 - FUNC_sha_final
08e0 - sha_L17?3
0904 - sha_L16?3
0920 - FUNC_sha_stream
0954 - sha_L18?3
0984 - sha_L19?3
09a0 - FUNC_sha_print


##Data Labels
0000 - sha_driver_?1PACKET.3
0008 - sha_driver_?1STRINGPACKET.1
000c - sha_driver_?1STRINGPACKET.2
0018 - sha_driver_?1STRINGPACKET.4
0038 - sha_driver_?1STRINGPACKET.3
003c - sha_?1STRINGPACKET.1


##Data Section - 92 - Data_align=32
0000 - 00000008 - 00000000000000000000000000001000
0004 - 0000000c - 00000000000000000000000000001100
0008 - 73686100 - 01110011011010000110000100000000
000c - 696e7075 - 01101001011011100111000001110101
0010 - 742f696e - 01110100001011110110100101101110
0014 - 70757400 - 01110000011101010111010000000000
0018 - 6572726f - 01100101011100100111001001101111
001c - 72206f70 - 01110010001000000110111101110000
0020 - 656e696e - 01100101011011100110100101101110
0024 - 67202573 - 01100111001000000010010101110011
0028 - 20666f72 - 00100000011001100110111101110010
002c - 20726561 - 00100000011100100110010101100001
0030 - 64696e67 - 01100100011010010110111001100111
0034 - 0a000000 - 00001010000000000000000000000000
0038 - 72620000 - 01110010011000100000000000000000
003c - 2530386c - 00100101001100000011100001101100
0040 - 78202530 - 01111000001000000010010100110000
0044 - 386c7820 - 00111000011011000111100000100000
0048 - 2530386c - 00100101001100000011100001101100
004c - 78202530 - 01111000001000000010010100110000
0050 - 386c7820 - 00111000011011000111100000100000
0054 - 2530386c - 00100101001100000011100001101100
0058 - 780a0000 - 01111000000010100000000000000000


##BSS Labels - 0 - Bss_align=
