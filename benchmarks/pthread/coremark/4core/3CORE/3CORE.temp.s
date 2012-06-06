## Operations - 7827
FILE: core_main
.entry caller, sp=$r0.1, rl=$l0.0, asize=-4352, arg()
-- FUNC_main
c0    add $r0.1 = $r0.1, (-0x1100)
c0    mov $r0.33 = $r0.0
c0    mov $r0.34 = $r0.0
;;
c0    add $r0.14 = $r0.1, 0xff8
c0    stw 0x1050[$r0.1] = $l0.0
;;
c0    add $r0.15 = $r0.1, 0x14
c0    add $r0.4 = $r0.1, 0x10
c0    stw 0x1074[$r0.1] = $r0.33
;;
c0    add $r0.5 = $r0.1, 0x104c
c0    stw 0x1090[$r0.1] = $r0.34
;;
c0    add $r0.8 = $r0.1, 0xfb4
c0    stw 0x1094[$r0.1] = $r0.14
;;
c0    add $r0.9 = $r0.1, 0xfb6
c0    stw 0x1098[$r0.1] = $r0.15
;;
c0    add $r0.10 = $r0.1, 0xfb8
c0    add $r0.6 = $r0.1, 0xfbc
;;
c0    add $r0.7 = $r0.1, 0xfcc
c0    stw 0x1058[$r0.1] = $r0.8
;;
c0    add $r0.15 = $r0.1, 0xfd0
c0    stw 0x1064[$r0.1] = $r0.9
;;
c0    add $r0.12 = $r0.1, 0xfd4
c0    stw 0x109c[$r0.1] = $r0.10
;;
c0    add $r0.37 = $r0.1, 0xfd8
c0    stw 0x105c[$r0.1] = $r0.6
;;
c0    add $r0.38 = $r0.1, 0xfdc
c0    stw 0x1060[$r0.1] = $r0.7
;;
c0    add $r0.39 = $r0.1, 0xfec
c0    stw 0x10a0[$r0.1] = $r0.15
;;
c0    add $r0.40 = $r0.1, 0xfee
c0    stw 0x1054[$r0.1] = $r0.12
;;
c0    add $r0.41 = $r0.1, 0xff0
c0    stw 0x10a4[$r0.1] = $r0.37
;;
c0    add $r0.42 = $r0.1, 0xff2
c0    stw 0x10a8[$r0.1] = $r0.38
;;
c0    add $r0.11 = $r0.1, 0xff4
c0    stw 0x10ac[$r0.1] = $r0.39
;;
c0    mov $r0.43 = $r0.0
c0    mov $r0.44 = -1
c0    stw 0x1068[$r0.1] = $r0.40
;;
c0    mov $r0.3 = $r0.14
c0    stw 0x106c[$r0.1] = $r0.41
;;
c0    stw 0x1070[$r0.1] = $r0.42
;;
c0    stw 0x107c[$r0.1] = $r0.11
;;
c0    stw 0x10b0[$r0.1] = $r0.43
;;
c0    stw 0x1078[$r0.1] = $r0.44
;;
.call portable_init, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
c0    stw 0x10[$r0.1] = $r0.0
c0    call $l0.0 = FUNC_portable_init
;;
.call get_seed_32, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    mov $r0.3 = 1
c0    call $l0.0 = FUNC_get_seed_32
;;
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
;;
;;
c0    sth 0[$r0.8] = $r0.3
;;
.call get_seed_32, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    mov $r0.3 = 2
c0    call $l0.0 = FUNC_get_seed_32
;;
c0    ldw $r0.9 = 0x1064[$r0.1]
;;
;;
;;
c0    sth 0[$r0.9] = $r0.3
;;
.call get_seed_32, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    mov $r0.3 = 3
c0    call $l0.0 = FUNC_get_seed_32
;;
c0    ldw $r0.10 = 0x109c[$r0.1]
;;
;;
;;
c0    sth 0[$r0.10] = $r0.3
;;
.call get_seed_32, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    mov $r0.3 = 4
c0    call $l0.0 = FUNC_get_seed_32
;;
c0    ldw $r0.36 = 0x10a0[$r0.1]
;;
;;
;;
c0    stw 0[$r0.36] = $r0.3
;;
.call get_seed_32, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    mov $r0.3 = 5
c0    call $l0.0 = FUNC_get_seed_32
;;
c0    cmpeq $b0.0 = $r0.3, $r0.0
c0    mov $r0.14 = 7
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    mov $r0.2 = $r0.0
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
c0    ldw $r0.10 = 0x109c[$r0.1]
;;
c0    ldw $r0.9 = 0x1064[$r0.1]
;;
c0    ldh.d $r0.15 = 0[$r0.8]
;;
c0    ldh.d $r0.16 = 0[$r0.10]
;;
c0    ldh.d $r0.17 = 0[$r0.9]
;;
c0    ldh.d $r0.18 = 0[$r0.8]
;;
c0    norl $r0.15 = $r0.15, $r0.16
c0    ldh.d $r0.19 = 0[$r0.10]
;;
c0    cmpeq $r0.17 = $r0.17, $r0.0
c0    ldh.d $r0.20 = 0[$r0.9]
;;
c0    cmpeq $r0.18 = $r0.18, 1
c0    ldw $r0.6 = 0x105c[$r0.1]
;;
c0    cmpeq $r0.19 = $r0.19, $r0.0
c0    ldw $r0.7 = 0x1060[$r0.1]
;;
c0    andl $b0.1 = $r0.15, $r0.17
c0    cmpeq $r0.20 = $r0.20, $r0.0
c0    ldw $r0.11 = 0x107c[$r0.1]
;;
c0    ldw $r0.4 = 0x1098[$r0.1]
;;
c0    andl $r0.18 = $r0.18, $r0.19
c0    ldw $r0.32 = 0x1050[$r0.1]
;;
c0    ldw $r0.33 = 0x1074[$r0.1]
;;
c0    ldw $r0.34 = 0x1090[$r0.1]
;;
c0    andl $b0.2 = $r0.18, $r0.20
c0    ldw $r0.35 = 0x1094[$r0.1]
;;
c0    ldw $r0.36 = 0x10a0[$r0.1]
;;
c0    ldw $r0.37 = 0x10a4[$r0.1]
;;
c0    ldw $r0.38 = 0x10a8[$r0.1]
;;
c0    ldw $r0.39 = 0x10ac[$r0.1]
;;
c0    ldw $r0.40 = 0x1068[$r0.1]
;;
c0    ldw $r0.41 = 0x106c[$r0.1]
;;
c0    ldw $r0.42 = 0x1070[$r0.1]
;;
c0    ldw $r0.43 = 0x10b0[$r0.1]
;;
c0    ldw $r0.44 = 0x1078[$r0.1]
;;
c0    stw 0[$r0.12] = $r0.3
c0    brf $b0.0, core_main_L4?3
;;
c0    stw 0[$r0.12] = $r0.14
c0    br $b0.1, core_main_L5?3
;;
-- core_main_L6?3
c0    br $b0.2, core_main_L7?3
;;
-- core_main_L8?3
c0    cmplt $b0.0 = $r0.2, 2
c0    mpyl $r0.3 = $r0.2, 2000
c0    mpyl $r0.5 = $r0.2, 19
;;
c0    ldh.d $r0.14 = 0[$r0.8]
c0    mpyl $r0.15 = $r0.2, 38
c0    mov $r0.13 = 2000
;;
c0    add $r0.2 = $r0.2, 1
c0    ldh.d $r0.16 = 0[$r0.9]
;;
c0    add $r0.3 = $r0.3, $r0.4
c0    sh2add $r0.17 = $r0.5, $r0.6
c0    sh2add $r0.18 = $r0.5, $r0.7
c0    brf $b0.0, core_main_L9?3
;;
c0    sh1add $r0.19 = $r0.15, $r0.8
c0    sh1add $r0.20 = $r0.15, $r0.9
c0    ldh $r0.21 = 0[$r0.10]
c0    sh1add $r0.22 = $r0.15, $r0.10
;;
c0    sh1add $r0.15 = $r0.15, $r0.11
c0    ldw $r0.23 = 0[$r0.12]
c0    sh2add $r0.5 = $r0.5, $r0.12
c0    zxth $r0.2 = $r0.2
;;
c0    stw 0[$r0.17] = $r0.3
;;
c0    stw 0[$r0.18] = $r0.13
;;
c0    cmplt $b0.0 = $r0.2, 2
c0    mpyl $r0.3 = $r0.2, 2000
c0    mpyl $r0.17 = $r0.2, 19
;;
c0    sth 0[$r0.19] = $r0.14
c0    add $r0.2 = $r0.2, 1
c0    mpyl $r0.18 = $r0.2, 38
;;
c0    ldh.d $r0.14 = 0[$r0.8]
;;
c0    add $r0.3 = $r0.4, $r0.3
c0    sh2add $r0.19 = $r0.17, $r0.6
c0    sh2add $r0.24 = $r0.17, $r0.7
c0    sh2add $r0.17 = $r0.17, $r0.12
;;
c0    sh1add $r0.25 = $r0.18, $r0.8
c0    sh1add $r0.26 = $r0.18, $r0.9
c0    sh1add $r0.27 = $r0.18, $r0.10
c0    sh1add $r0.18 = $r0.18, $r0.11
;;
c0    sth 0[$r0.20] = $r0.16
c0    zxth $r0.2 = $r0.2
;;
c0    ldh.d $r0.16 = 0[$r0.9]
;;
c0    sth 0[$r0.22] = $r0.21
;;
c0    ldh.d $r0.20 = 0[$r0.10]
c0    cmplt $b0.1 = $r0.2, 2
c0    mpyl $r0.21 = $r0.2, 2000
;;
c0    sth 0[$r0.15] = $r0.0
c0    mpyl $r0.22 = $r0.2, 19
c0    add $r0.2 = $r0.2, 1
c0    mpyl $r0.28 = $r0.2, 38
;;
c0    stw 0[$r0.5] = $r0.23
c0    brf $b0.0, core_main_L10?3
;;
c0    ldw $r0.5 = 0[$r0.12]
c0    add $r0.21 = $r0.4, $r0.21
;;
c0    sh2add $r0.15 = $r0.22, $r0.6
c0    sh2add $r0.23 = $r0.22, $r0.7
c0    sh1add $r0.29 = $r0.28, $r0.8
c0    sh1add $r0.30 = $r0.28, $r0.9
;;
c0    sh1add $r0.31 = $r0.28, $r0.10
c0    sh1add $r0.28 = $r0.28, $r0.11
c0    sh2add $r0.22 = $r0.22, $r0.12
c0    zxth $r0.2 = $r0.2
;;
c0    stw 0[$r0.19] = $r0.3
;;
c0    stw 0[$r0.24] = $r0.13
;;
c0    sth 0[$r0.25] = $r0.14
;;
c0    ldh.d $r0.3 = 0[$r0.8]
;;
c0    sth 0[$r0.26] = $r0.16
;;
c0    ldh.d $r0.14 = 0[$r0.9]
;;
c0    sth 0[$r0.27] = $r0.20
;;
c0    ldh.d $r0.16 = 0[$r0.10]
;;
c0    sth 0[$r0.18] = $r0.0
;;
c0    stw 0[$r0.17] = $r0.5
c0    brf $b0.1, core_main_L11?3
;;
c0    ldw $r0.5 = 0[$r0.12]
;;
c0    stw 0[$r0.15] = $r0.21
;;
c0    stw 0[$r0.23] = $r0.13
;;
c0    sth 0[$r0.29] = $r0.3
;;
c0    sth 0[$r0.30] = $r0.14
;;
c0    sth 0[$r0.31] = $r0.16
;;
c0    sth 0[$r0.28] = $r0.0
;;
c0    stw 0[$r0.22] = $r0.5
c0    goto core_main_L8?3
;;
-- core_main_L11?3
c0    mov $r0.2 = $r0.0
c0    mov $r0.5 = $r0.43
c0    ldw.d $r0.4 = 0[$r0.12]
;;
c0    goto core_main_L12?3
;;
-- core_main_L13?3
c0    cmplt $b0.0 = $r0.2, 3
c0    add $r0.14 = $r0.2, 1
c0    add $r0.13 = $r0.5, 1
c0    mov $r0.3 = 1
;;
c0    shl $r0.2 = $r0.3, $r0.2
;;
;;
c0    zxth $r0.13 = $r0.13
c0    zxth $r0.14 = $r0.14
c0    brf $b0.0, core_main_L14?3
;;
c0    and $r0.2 = $r0.2, $r0.4
;;
;;
c0    cmplt $b0.0 = $r0.14, 3
c0    shl $r0.15 = $r0.3, $r0.14
c0    add $r0.14 = $r0.14, 1
;;
c0    cmpne $b0.1 = $r0.2, $r0.0
;;
;;
c0    and $r0.15 = $r0.4, $r0.15
c0    zxth $r0.14 = $r0.14
;;
c0    slct $r0.13 = $b0.1, $r0.13, $r0.5
c0    brf $b0.0, core_main_L15?3
;;
;;
c0    cmpne $b0.0 = $r0.15, $r0.0
c0    cmplt $b0.1 = $r0.14, 3
c0    shl $r0.15 = $r0.3, $r0.14
c0    add $r0.14 = $r0.14, 1
;;
c0    add $r0.16 = $r0.13, 1
;;
;;
c0    and $r0.15 = $r0.4, $r0.15
c0    zxth $r0.14 = $r0.14
;;
c0    zxth $r0.16 = $r0.16
;;
;;
c0    cmpne $b0.2 = $r0.15, $r0.0
c0    cmplt $b0.3 = $r0.14, 3
c0    shl $r0.15 = $r0.3, $r0.14
c0    add $r0.14 = $r0.14, 1
;;
c0    slct $r0.16 = $b0.0, $r0.16, $r0.13
c0    brf $b0.1, core_main_L16?3
;;
;;
c0    and $r0.15 = $r0.4, $r0.15
c0    zxth $r0.2 = $r0.14
;;
c0    add $r0.3 = $r0.16, 1
;;
;;
c0    cmpne $b0.0 = $r0.15, $r0.0
;;
c0    zxth $r0.3 = $r0.3
;;
;;
;;
c0    slct $r0.3 = $b0.2, $r0.3, $r0.16
c0    brf $b0.3, core_main_L17?3
;;
;;
;;
c0    add $r0.13 = $r0.3, 1
;;
;;
;;
c0    zxth $r0.13 = $r0.13
;;
;;
;;
c0    slct $r0.5 = $b0.0, $r0.13, $r0.3
;;
;;
c0    goto core_main_L13?3
;;
-- core_main_L17?3
c0    mov $r0.2 = $r0.0
;;
;;
c0    mov $r0.4 = $r0.3
;;
-- core_main_L18?3
c0    cmplt $b0.1 = $r0.2, 2
c0    mpyl $r0.3 = $r0.2, 19
c0    cmplt $r0.5 = $r0.4, $r0.0
c0    mtb $b0.0 = $r0.0
;;
c0    add $r0.2 = $r0.2, 1
c0    cmplt $r0.13 = $r0.4, $r0.0
c0    cmplt $r0.14 = $r0.4, $r0.0
c0    cmplt $r0.15 = $r0.4, $r0.0
;;
;;
c0    sh2add $r0.16 = $r0.3, $r0.7
c0    shru $r0.17 = $r0.4, $r0.5
c0    sh2add $r0.3 = $r0.3, $r0.7
c0    mtb $b0.2 = $r0.5
;;
c0    zxth $r0.2 = $r0.2
c0    shru $r0.18 = $r0.4, $r0.13
c0    mtb $b0.1 = $r0.13
c0    brf $b0.1, core_main_L19?3
;;
c0    shru $r0.19 = $r0.4, $r0.14
c0    shru $r0.20 = $r0.4, $r0.15
c0    mtb $b0.3 = $r0.14
c0    mtb $b0.4 = $r0.15
;;
c0    ldw $r0.16 = 0[$r0.16]
;;
c0    cmplt $b0.5 = $r0.2, 2
c0    mpyl $r0.21 = $r0.2, 19
c0    add $r0.2 = $r0.2, 1
;;
;;
c0    shru $r0.5 = $r0.16, $r0.5
c0    cmpgeu $r0.16 = $r0.16, $r0.4
;;
c0    sh2add $r0.22 = $r0.21, $r0.7
c0    sh2add $r0.21 = $r0.21, $r0.7
c0    zxth $r0.2 = $r0.2
;;
;;
c0    addcg $r0.23, $b0.6 = $r0.5, $r0.5, $b0.0
;;
c0    divs $r0.23, $b0.6 = $r0.0, $r0.17, $b0.6
c0    addcg $r0.5, $b0.7 = $r0.23, $r0.23, $b0.0
c0    mpyl $r0.24 = $r0.2, 19
c0    add $r0.25 = $r0.2, 1
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.26, $b0.6 = $r0.5, $r0.5, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.5, $b0.7 = $r0.26, $r0.26, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.26, $b0.6 = $r0.5, $r0.5, $b0.6
c0    sh2add $r0.5 = $r0.24, $r0.7
c0    sh2add $r0.24 = $r0.24, $r0.7
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.27, $b0.7 = $r0.26, $r0.26, $b0.7
c0    zxth $r0.25 = $r0.25
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.26, $b0.6 = $r0.27, $r0.27, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.27, $b0.7 = $r0.26, $r0.26, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.26, $b0.6 = $r0.27, $r0.27, $b0.6
c0    mpyl $r0.27 = $r0.25, 19
c0    add $r0.28 = $r0.25, 1
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.26, $r0.26, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.26, $b0.6 = $r0.29, $r0.29, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.26, $r0.26, $b0.7
c0    sh2add $r0.26 = $r0.27, $r0.7
c0    sh2add $r0.27 = $r0.27, $r0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.30, $b0.6 = $r0.29, $r0.29, $b0.6
c0    zxth $r0.28 = $r0.28
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.30, $r0.30, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.30, $b0.6 = $r0.29, $r0.29, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.30, $r0.30, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.30, $b0.6 = $r0.29, $r0.29, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.30, $r0.30, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.30, $b0.6 = $r0.29, $r0.29, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.30, $r0.30, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.30, $b0.6 = $r0.29, $r0.29, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.30, $r0.30, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.30, $b0.6 = $r0.29, $r0.29, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.30, $r0.30, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.30, $b0.6 = $r0.29, $r0.29, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.30, $r0.30, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.30, $b0.6 = $r0.29, $r0.29, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.30, $r0.30, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.30, $b0.6 = $r0.29, $r0.29, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.30, $r0.30, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.30, $b0.6 = $r0.29, $r0.29, $b0.6
;;
c0    divs $r0.23, $b0.6 = $r0.23, $r0.17, $b0.6
c0    addcg $r0.29, $b0.7 = $r0.30, $r0.30, $b0.7
;;
c0    divs $r0.23, $b0.7 = $r0.23, $r0.17, $b0.7
c0    addcg $r0.30, $b0.6 = $r0.29, $r0.29, $b0.6
;;
c0    addcg $r0.17, $b0.7 = $r0.30, $r0.30, $b0.7
c0    cmpge $r0.23 = $r0.23, $r0.0
c0    cmplt $b0.6 = $r0.2, 2
c0    mov $r0.2 = $r0.28
;;
c0    orc $r0.17 = $r0.17, $r0.0
c0    cmplt $b0.7 = $r0.25, 2
;;
;;
;;
c0    sh1add $r0.17 = $r0.17, $r0.23
;;
;;
;;
c0    slct $r0.16 = $b0.2, $r0.16, $r0.17
;;
;;
;;
c0    stw 0[$r0.3] = $r0.16
c0    brf $b0.5, core_main_L20?3
;;
c0    ldw $r0.22 = 0[$r0.22]
;;
;;
;;
c0    shru $r0.13 = $r0.22, $r0.13
c0    cmpgeu $r0.22 = $r0.22, $r0.4
;;
;;
;;
c0    addcg $r0.3, $b0.2 = $r0.13, $r0.13, $b0.0
;;
c0    divs $r0.3, $b0.2 = $r0.0, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.3, $r0.3, $b0.0
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.18, $b0.2
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
;;
c0    divs $r0.3, $b0.5 = $r0.3, $r0.18, $b0.5
c0    addcg $r0.16, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    addcg $r0.13, $b0.5 = $r0.16, $r0.16, $b0.5
c0    cmpge $r0.3 = $r0.3, $r0.0
;;
c0    orc $r0.13 = $r0.13, $r0.0
;;
;;
;;
c0    sh1add $r0.13 = $r0.13, $r0.3
;;
;;
;;
c0    slct $r0.22 = $b0.1, $r0.22, $r0.13
;;
;;
;;
c0    stw 0[$r0.21] = $r0.22
c0    brf $b0.6, core_main_L21?3
;;
c0    ldw $r0.5 = 0[$r0.5]
;;
;;
;;
c0    shru $r0.14 = $r0.5, $r0.14
c0    cmpgeu $r0.5 = $r0.5, $r0.4
;;
;;
;;
c0    addcg $r0.3, $b0.1 = $r0.14, $r0.14, $b0.0
;;
c0    divs $r0.3, $b0.1 = $r0.0, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.3, $r0.3, $b0.0
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.19, $b0.1
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.19, $b0.2
c0    addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
c0    addcg $r0.14, $b0.2 = $r0.13, $r0.13, $b0.2
c0    cmpge $r0.3 = $r0.3, $r0.0
;;
c0    orc $r0.14 = $r0.14, $r0.0
;;
;;
;;
c0    sh1add $r0.14 = $r0.14, $r0.3
;;
;;
;;
c0    slct $r0.5 = $b0.3, $r0.5, $r0.14
;;
;;
;;
c0    stw 0[$r0.24] = $r0.5
c0    brf $b0.7, core_main_L22?3
;;
c0    ldw $r0.26 = 0[$r0.26]
;;
;;
;;
c0    shru $r0.15 = $r0.26, $r0.15
c0    cmpgeu $r0.26 = $r0.26, $r0.4
;;
;;
;;
c0    addcg $r0.3, $b0.1 = $r0.15, $r0.15, $b0.0
;;
c0    divs $r0.3, $b0.1 = $r0.0, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.3, $r0.3, $b0.0
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    divs $r0.3, $b0.1 = $r0.3, $r0.20, $b0.1
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
;;
c0    divs $r0.3, $b0.2 = $r0.3, $r0.20, $b0.2
c0    addcg $r0.5, $b0.1 = $r0.15, $r0.15, $b0.1
;;
c0    addcg $r0.15, $b0.2 = $r0.5, $r0.5, $b0.2
c0    cmpge $r0.3 = $r0.3, $r0.0
;;
c0    orc $r0.15 = $r0.15, $r0.0
;;
;;
;;
c0    sh1add $r0.15 = $r0.15, $r0.3
;;
;;
;;
c0    slct $r0.26 = $b0.4, $r0.26, $r0.15
;;
;;
;;
c0    stw 0[$r0.27] = $r0.26
c0    goto core_main_L18?3
;;
-- core_main_L22?3
c0    mov $r0.5 = $r0.34
c0    ldw.d $r0.4 = 0[$r0.7]
;;
c0    ldw.d $r0.15 = 0[$r0.12]
c0    goto core_main_L23?3
;;
-- core_main_L24?3
c0    cmplt $b0.0 = $r0.2, 3
c0    mpylu $r0.13 = $r0.4, $r0.5
c0    ldw.d $r0.3 = 0[$r0.6]
c0    mov $r0.14 = 1
;;
c0    shl $r0.16 = $r0.14, $r0.2
c0    add $r0.17 = $r0.2, 1
c0    ldw.d $r0.18 = 76[$r0.6]
c0    add $r0.19 = $r0.2, 20
;;
c0    add $r0.20 = $r0.5, 1
c0    add $r0.21 = $r0.2, 1
;;
c0    add $r0.3 = $r0.13, $r0.3
c0    brf $b0.0, core_main_L25?3
;;
c0    and $r0.16 = $r0.15, $r0.16
c0    sh2add $r0.17 = $r0.17, $r0.6
c0    add $r0.18 = $r0.13, $r0.18
c0    sh2add $r0.19 = $r0.19, $r0.6
;;
c0    zxth $r0.21 = $r0.21
;;
;;
c0    cmpne $b0.0 = $r0.16, $r0.0
;;
c0    cmplt $b0.1 = $r0.21, 3
c0    shl $r0.13 = $r0.14, $r0.21
c0    add $r0.22 = $r0.21, 1
c0    add $r0.23 = $r0.21, 20
;;
c0    add $r0.24 = $r0.21, 1
;;
c0    brf $b0.0, core_main_L26?3
;;
c0    zxth $r0.5 = $r0.20
c0    and $r0.13 = $r0.15, $r0.13
c0    sh2add $r0.22 = $r0.22, $r0.6
c0    sh2add $r0.23 = $r0.23, $r0.6
;;
c0    stw 0[$r0.17] = $r0.3
c0    zxth $r0.24 = $r0.24
;;
c0    ldw.d $r0.3 = 0[$r0.6]
;;
c0    stw 0[$r0.19] = $r0.18
c0    cmpne $b0.0 = $r0.13, $r0.0
c0    mpylu $r0.16 = $r0.4, $r0.5
c0    add $r0.17 = $r0.5, 1
;;
-- core_main_L27?3
c0    ldw.d $r0.18 = 76[$r0.6]
c0    cmplt $b0.1 = $r0.24, 3
c0    shl $r0.19 = $r0.14, $r0.24
c0    brf $b0.1, core_main_L28?3
;;
c0    add $r0.20 = $r0.24, 1
c0    add $r0.25 = $r0.24, 20
c0    add $r0.26 = $r0.24, 1
;;
c0    add $r0.3 = $r0.16, $r0.3
c0    brf $b0.0, core_main_L29?3
;;
c0    add $r0.18 = $r0.16, $r0.18
c0    zxth $r0.5 = $r0.17
c0    and $r0.19 = $r0.15, $r0.19
;;
c0    sh2add $r0.20 = $r0.20, $r0.6
c0    sh2add $r0.25 = $r0.25, $r0.6
c0    zxth $r0.2 = $r0.26
;;
c0    stw 0[$r0.22] = $r0.3
;;
c0    cmpne $b0.0 = $r0.19, $r0.0
c0    mpylu $r0.13 = $r0.4, $r0.5
c0    add $r0.14 = $r0.5, 1
c0    ldw.d $r0.3 = 0[$r0.6]
;;
c0    stw 0[$r0.23] = $r0.18
c0    brf $b0.1, core_main_L30?3
;;
-- core_main_L31?3
c0    ldw.d $r0.16 = 76[$r0.6]
;;
c0    add $r0.3 = $r0.13, $r0.3
c0    brf $b0.0, core_main_L32?3
;;
c0    zxth $r0.5 = $r0.14
;;
c0    add $r0.16 = $r0.13, $r0.16
;;
c0    stw 0[$r0.20] = $r0.3
;;
;;
c0    stw 0[$r0.25] = $r0.16
c0    goto core_main_L24?3
;;
-- core_main_L32?3
;;
c0    goto core_main_L24?3
;;
-- core_main_L30?3
c0    stw 0x1064[$r0.1] = $r0.9
;;
-- core_main_L34?3
c0    stw 0x1058[$r0.1] = $r0.8
c0    goto core_main_L33?3
;;
-- core_main_L35?3
c0    cmplt $b0.0 = $r0.57, 2
c0    mpyl $r0.58 = $r0.57, 19
c0    ldw.d $r0.3 = 0[$r0.7]
c0    mpyl $r0.2 = $r0.57, 38
;;
;;
;;
c0    sh2add $r0.12 = $r0.58, $r0.12
c0    add $r0.13 = $r0.58, 1
c0    sh1add $r0.2 = $r0.2, $r0.8
c0    brf $b0.0, core_main_L36?3
;;
;;
;;
c0    ldw $r0.12 = 0[$r0.12]
c0    sh2add $r0.13 = $r0.13, $r0.6
;;
c0    ldh.d $r0.5 = 0[$r0.2]
;;
;;
c0    and $r0.12 = $r0.12, 1
c0    ldw.d $r0.4 = 0[$r0.13]
;;
;;
;;
c0    cmpne $b0.0 = $r0.12, $r0.0
;;
;;
;;
c0    brf $b0.0, core_main_L37?3
;;
.call core_list_init, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_list_init
;;
c0    sh2add $r0.58 = $r0.58, $r0.59
c0    mpyl $r0.2 = $r0.57, 19
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    mpyl $r0.13 = $r0.57, 38
c0    mpyl $r0.14 = $r0.57, 76
c0    ldw $r0.9 = 0x1064[$r0.1]
;;
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
c0    sh2add $r0.12 = $r0.2, $r0.12
c0    add $r0.15 = $r0.2, 2
c0    ldw $r0.16 = 0x105c[$r0.1]
;;
c0    sh1add $r0.9 = $r0.13, $r0.9
c0    add $r0.6 = $r0.14, $r0.60
c0    ldw $r0.7 = 0x1060[$r0.1]
;;
c0    stw 0[$r0.58] = $r0.3
c0    sh1add $r0.8 = $r0.13, $r0.8
;;
-- core_main_L38?3
c0    ldw $r0.12 = 0[$r0.12]
c0    sh2add $r0.15 = $r0.15, $r0.16
;;
c0    ldh.d $r0.9 = 0[$r0.9]
;;
c0    ldh.d $r0.8 = 0[$r0.8]
;;
c0    and $r0.12 = $r0.12, 2
c0    ldw.d $r0.4 = 0[$r0.15]
;;
c0    ldw.d $r0.3 = 0[$r0.7]
c0    shl $r0.9 = $r0.9, 16
;;
;;
c0    cmpne $b0.0 = $r0.12, $r0.0
;;
c0    or $r0.5 = $r0.9, $r0.8
;;
;;
c0    brf $b0.0, core_main_L39?3
;;
.call core_init_matrix, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32,$r0.6:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_init_matrix
;;
-- core_main_L39?3
c0    mpyl $r0.2 = $r0.57, 19
c0    mpyl $r0.13 = $r0.57, 38
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
c0    ldw $r0.6 = 0x105c[$r0.1]
;;
c0    sh2add $r0.12 = $r0.2, $r0.12
c0    add $r0.14 = $r0.2, 3
c0    ldw $r0.7 = 0x1060[$r0.1]
;;
c0    sh1add $r0.13 = $r0.13, $r0.8
;;
;;
c0    ldw $r0.12 = 0[$r0.12]
c0    sh2add $r0.14 = $r0.14, $r0.6
;;
c0    ldh.d $r0.4 = 0[$r0.13]
;;
c0    ldw.d $r0.3 = 0[$r0.7]
;;
c0    and $r0.12 = $r0.12, 4
c0    ldw.d $r0.5 = 0[$r0.14]
;;
;;
;;
c0    cmpne $b0.0 = $r0.12, $r0.0
;;
;;
;;
c0    brf $b0.0, core_main_L40?3
;;
.call core_init_state, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:u32), ret()
c0    call $l0.0 = FUNC_core_init_state
;;
-- core_main_L40?3
c0    add $r0.57 = $r0.57, 1
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    ldw $r0.7 = 0x1060[$r0.1]
;;
c0    ldw $r0.6 = 0x105c[$r0.1]
;;
c0    zxth $r0.57 = $r0.57
c0    ldw $r0.9 = 0x1064[$r0.1]
;;
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
;;
c0    goto core_main_L35?3
;;
-- core_main_L37?3
c0    mpyl $r0.2 = $r0.57, 19
c0    mpyl $r0.13 = $r0.57, 38
c0    ldw $r0.3 = 0x1054[$r0.1]
;;
c0    mpyl $r0.14 = $r0.57, 76
c0    ldw $r0.9 = 0x1064[$r0.1]
;;
c0    ldw $r0.16 = 0x105c[$r0.1]
;;
c0    sh2add $r0.12 = $r0.2, $r0.3
c0    add $r0.15 = $r0.2, 2
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
;;
c0    sh1add $r0.9 = $r0.13, $r0.9
c0    add $r0.6 = $r0.14, $r0.60
c0    ldw $r0.7 = 0x1060[$r0.1]
;;
c0    sh1add $r0.8 = $r0.13, $r0.8
c0    goto core_main_L38?3
;;
-- core_main_L36?3
c0    ldw $r0.3 = 0[$r0.62]
c0    mov $r0.57 = $r0.0
c0    mov $r0.58 = $r0.0
c0    mov $r0.4 = 1
;;
c0    mov $r0.59 = $r0.62
;;
;;
c0    cmpeq $b0.0 = $r0.3, $r0.0
;;
;;
;;
c0    brf $b0.0, core_main_L41?3
;;
c0    stw 0[$r0.62] = $r0.4
;;
-- core_main_L42?3
c0    mov $r0.6 = $r0.0
c0    mov $r0.5 = 1072693248
c0    mov $r0.3 = $r0.57
;;
.call _d_lt, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
c0    mov $r0.4 = $r0.58
c0    call $l0.0 = FUNC__d_lt
;;
c0    cmpne $b0.0 = $r0.3, $r0.0
c0    ldw.d $r0.2 = 0[$r0.59]
;;
;;
;;
c0    mpyl $r0.2 = $r0.2, 10
c0    brf $b0.0, core_main_L43?3
;;
;;
;;
.call start_time, caller, arg(), ret()
c0    stw 0[$r0.59] = $r0.2
c0    call $l0.0 = FUNC_start_time
;;
c0    ldw $r0.3 = 0x1058[$r0.1]
;;
;;
.call iterate, caller, arg($r0.3:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_iterate
;;
.call stop_time, caller, arg(), ret()
c0    call $l0.0 = FUNC_stop_time
;;
.call get_time, caller, arg(), ret($r0.3:u32)
c0    call $l0.0 = FUNC_get_time
;;
.call time_in_secs, caller, arg($r0.3:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = FUNC_time_in_secs
;;
c0    mov $r0.58 = $r0.4
c0    mov $r0.57 = $r0.3
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
;;
c0    goto core_main_L42?3
;;
-- core_main_L43?3
c0    mov $r0.4 = $r0.58
c0    mov $r0.3 = $r0.57
;;
.call _d_ufix, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC__d_ufix
;;
c0    cmpne $b0.0 = $r0.3, $r0.0
c0    ldw $r0.4 = 0[$r0.59]
c0    mov $r0.2 = 10
c0    mtb $b0.1 = $r0.0
;;
c0    mov $r0.62 = $r0.59
;;
;;
c0    slct $r0.3 = $b0.0, $r0.3, 1
;;
;;
;;
c0    cmplt $r0.5 = $r0.3, $r0.0
c0    cmpgeu $r0.6 = $r0.2, $r0.3
;;
;;
;;
c0    shru $r0.3 = $r0.3, $r0.5
c0    shru $r0.2 = $r0.2, $r0.5
c0    mtb $b0.0 = $r0.5
;;
;;
;;
c0    addcg $r0.5, $b0.2 = $r0.2, $r0.2, $b0.1
;;
c0    divs $r0.5, $b0.2 = $r0.0, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.1
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    divs $r0.5, $b0.2 = $r0.5, $r0.3, $b0.2
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.3, $b0.3
c0    addcg $r0.7, $b0.2 = $r0.2, $r0.2, $b0.2
;;
c0    addcg $r0.2, $b0.3 = $r0.7, $r0.7, $b0.3
c0    cmpge $r0.5 = $r0.5, $r0.0
;;
c0    orc $r0.2 = $r0.2, $r0.0
;;
;;
;;
c0    sh1add $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    slct $r0.6 = $b0.0, $r0.6, $r0.2
;;
;;
;;
c0    add $r0.6 = $r0.6, 1
;;
;;
;;
c0    mpylu $r0.2 = $r0.4, $r0.6
c0    mpyhs $r0.4 = $r0.4, $r0.6
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.4
;;
;;
;;
c0    stw 0[$r0.59] = $r0.2
;;
-- core_main_L41?3
.call start_time, caller, arg(), ret()
c0    call $l0.0 = FUNC_start_time
;;
c0    ldw $r0.2 = ((default_num_contexts+0)+0)[$r0.0]
c0    mov $r0.57 = $r0.0
c0    mov $r0.3 = 2
;;
c0    mov $r0.58 = $r0.62
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    cmpgtu $b0.0 = $r0.2, 2
;;
;;
;;
c0    brf $b0.0, core_main_L44?3
;;
c0    stw ((default_num_contexts+0)+0)[$r0.0] = $r0.3
;;
-- core_main_L44?3
c0    ldw $r0.2 = ((default_num_contexts+0)+0)[$r0.0]
c0    mpyl $r0.4 = $r0.57, 19
c0    mpyl $r0.5 = $r0.57, 76
;;
c0    ldw.d $r0.6 = 0[$r0.58]
;;
c0    ldw.d $r0.13 = 0[$r0.12]
;;
c0    cmpltu $b0.0 = $r0.57, $r0.2
c0    sh2add $r0.2 = $r0.4, $r0.58
c0    sh2add $r0.4 = $r0.4, $r0.12
c0    add $r0.3 = $r0.5, $r0.8
;;
;;
;;
c0    brf $b0.0, core_main_L45?3
;;
c0    stw 0[$r0.2] = $r0.6
;;
.call core_start_parallel, caller, arg($r0.3:u32), ret($r0.3:u32)
c0    stw 0[$r0.4] = $r0.13
c0    call $l0.0 = FUNC_core_start_parallel
;;
c0    add $r0.57 = $r0.57, 1
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
;;
c0    zxth $r0.57 = $r0.57
;;
;;
c0    goto core_main_L44?3
;;
-- core_main_L45?3
c0    mov $r0.57 = $r0.0
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
;;
;;
-- core_main_L46?3
c0    ldw $r0.2 = ((default_num_contexts+0)+0)[$r0.0]
c0    mpyl $r0.4 = $r0.57, 76
;;
;;
;;
c0    cmpltu $b0.0 = $r0.57, $r0.2
c0    add $r0.3 = $r0.4, $r0.8
;;
;;
;;
c0    brf $b0.0, core_main_L47?3
;;
.call core_stop_parallel, caller, arg($r0.3:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_stop_parallel
;;
c0    add $r0.57 = $r0.57, 1
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
;;
;;
c0    zxth $r0.57 = $r0.57
;;
;;
c0    goto core_main_L46?3
;;
-- core_main_L47?3
.call stop_time, caller, arg(), ret()
c0    call $l0.0 = FUNC_stop_time
;;
.call get_time, caller, arg(), ret($r0.3:u32)
c0    call $l0.0 = FUNC_get_time
;;
c0    mov $r0.4 = $r0.0
c0    stw 0x10d0[$r0.1] = $r0.3
;;
c0    ldw $r0.8 = 0x1058[$r0.1]
;;
;;
;;
c0    ldh $r0.3 = 0[$r0.8]
;;
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crc16
;;
c0    ldw $r0.9 = 0x1064[$r0.1]
c0    mov $r0.4 = $r0.3
;;
;;
;;
c0    ldh $r0.3 = 0[$r0.9]
;;
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crc16
;;
c0    ldh $r0.61 = 0[$r0.61]
c0    mov $r0.4 = $r0.3
;;
;;
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    mov $r0.3 = $r0.61
c0    call $l0.0 = FUNC_crc16
;;
c0    ldw $r0.7 = 0x1060[$r0.1]
c0    mov $r0.4 = $r0.3
;;
;;
;;
c0    ldw $r0.7 = 0[$r0.7]
;;
;;
;;
c0    sxth $r0.3 = $r0.7
;;
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crc16
;;
c0    cmpeq $b0.0 = $r0.3, 6386
c0    stw 0x10d4[$r0.1] = $r0.3
;;
;;
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.9+0)
c0    brf $b0.0, core_main_L48?3
;;
c0    mov $r0.8 = 4
;;
.call printf, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x1078[$r0.1] = $r0.8
c0    call $l0.0 = FUNC_printf
;;
-- core_main_L49?3
;;
;;
c0    ldw $r0.60 = 0x1078[$r0.1]
;;
;;
;;
c0    cmpge $b0.0 = $r0.60, $r0.0
;;
;;
;;
c0    br $b0.0, core_main_L50?3
;;
-- core_main_L51?3
.call check_data_types, caller, arg(), ret($r0.3:s32)
c0    call $l0.0 = FUNC_check_data_types
;;
c0    ldw $r0.7 = 0x1060[$r0.1]
;;
c0    ldw $r0.13 = 0x1074[$r0.1]
;;
;;
c0    ldw $r0.4 = 0[$r0.7]
;;
c0    add $r0.3 = $r0.3, $r0.13
;;
;;
;;
c0    sxth $r0.61 = $r0.3
;;
;;
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    mov $r0.3 = (core_main_?1STRINGPACKET.13+0)
c0    call $l0.0 = FUNC_printf
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.14+0)
c0    ldw $r0.4 = 0x10d0[$r0.1]
;;
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    ldw $r0.3 = 0x10d0[$r0.1]
;;
;;
.call time_in_secs, caller, arg($r0.3:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = FUNC_time_in_secs
;;
c0    mov $r0.5 = $r0.3
c0    mov $r0.6 = $r0.4
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
c0    mov $r0.3 = (core_main_?1STRINGPACKET.15+0)
c0    mov $r0.4 = $r0.0
c0    call $l0.0 = FUNC_printf
;;
c0    ldw $r0.3 = 0x10d0[$r0.1]
;;
;;
.call time_in_secs, caller, arg($r0.3:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = FUNC_time_in_secs
;;
.call _d_gt, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    call $l0.0 = FUNC__d_gt
;;
c0    cmpne $b0.0 = $r0.3, $r0.0
;;
;;
;;
c0    ldw $r0.3 = 0x10d0[$r0.1]
c0    br $b0.0, core_main_L52?3
;;
-- core_main_L53?3
;;
.call time_in_secs, caller, arg($r0.3:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = FUNC_time_in_secs
;;
.call _d_lt, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
c0    mov $r0.6 = $r0.0
c0    mov $r0.5 = 1076101120
c0    call $l0.0 = FUNC__d_lt
;;
c0    cmpne $b0.0 = $r0.3, $r0.0
c0    ldw.d $r0.2 = 0[$r0.58]
;;
c0    ldw.d $r0.5 = ((default_num_contexts+0)+0)[$r0.0]
;;
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.18+0)
c0    br $b0.0, core_main_L54?3
;;
-- core_main_L55?3
c0    mpylu $r0.15 = $r0.2, $r0.5
c0    mpyhs $r0.16 = $r0.2, $r0.5
;;
;;
;;
c0    add $r0.4 = $r0.15, $r0.16
;;
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    mov $r0.4 = (core_main_?1STRINGPACKET.20+0)
c0    mov $r0.3 = (core_main_?1STRINGPACKET.19+0)
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    mov $r0.4 = (core_main_?1STRINGPACKET.22+0)
c0    mov $r0.3 = (core_main_?1STRINGPACKET.21+0)
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    ldw $r0.5 = ((default_num_contexts+0)+0)[$r0.0]
c0    mov $r0.4 = (core_main_?1STRINGPACKET.24+0)
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.23+0)
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    mov $r0.4 = (core_main_?1STRINGPACKET.26+0)
c0    mov $r0.3 = (core_main_?1STRINGPACKET.25+0)
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.27+0)
c0    ldw $r0.4 = 0x10d4[$r0.1]
;;
;;
.call printf, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    mov $r0.57 = $r0.0
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    ldw $r0.6 = 0x1068[$r0.1]
;;
c0    ldw $r0.59 = 0x10d0[$r0.1]
;;
c0    ldw $r0.12 = 0[$r0.12]
;;
c0    ldw $r0.60 = 0x1078[$r0.1]
;;
;;
c0    and $r0.12 = $r0.12, 1
;;
;;
;;
c0    cmpne $b0.0 = $r0.12, $r0.0
;;
;;
;;
c0    brf $b0.0, core_main_L56?3
;;
-- core_main_L57?3
c0    ldw $r0.7 = ((default_num_contexts+0)+0)[$r0.0]
c0    mpyl $r0.2 = $r0.57, 38
c0    mov $r0.4 = $r0.57
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.28+0)
;;
;;
c0    cmpltu $b0.0 = $r0.57, $r0.7
c0    sh1add $r0.2 = $r0.2, $r0.6
;;
;;
;;
c0    ldhu.d $r0.5 = 0[$r0.2]
c0    brf $b0.0, core_main_L58?3
;;
;;
.call printf, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    add $r0.57 = $r0.57, 1
c0    ldw $r0.6 = 0x1068[$r0.1]
;;
;;
;;
c0    zxth $r0.57 = $r0.57
;;
;;
c0    goto core_main_L57?3
;;
-- core_main_L58?3
;;
;;
-- core_main_L56?3
c0    mov $r0.57 = $r0.0
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    ldw $r0.9 = 0x106c[$r0.1]
;;
;;
c0    ldw $r0.12 = 0[$r0.12]
;;
;;
;;
c0    and $r0.12 = $r0.12, 2
;;
;;
;;
c0    cmpne $b0.0 = $r0.12, $r0.0
;;
;;
;;
c0    brf $b0.0, core_main_L59?3
;;
-- core_main_L60?3
c0    ldw $r0.6 = ((default_num_contexts+0)+0)[$r0.0]
c0    mpyl $r0.2 = $r0.57, 38
c0    mov $r0.4 = $r0.57
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.29+0)
;;
;;
c0    cmpltu $b0.0 = $r0.57, $r0.6
c0    sh1add $r0.2 = $r0.2, $r0.9
;;
;;
;;
c0    ldhu.d $r0.5 = 0[$r0.2]
c0    brf $b0.0, core_main_L61?3
;;
;;
.call printf, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    add $r0.57 = $r0.57, 1
c0    ldw $r0.9 = 0x106c[$r0.1]
;;
;;
;;
c0    zxth $r0.57 = $r0.57
;;
;;
c0    goto core_main_L60?3
;;
-- core_main_L61?3
;;
;;
-- core_main_L59?3
c0    mov $r0.57 = $r0.0
c0    mov $r0.62 = $r0.58
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    mov $r0.58 = $r0.63
;;
;;
c0    ldw $r0.12 = 0[$r0.12]
;;
;;
;;
c0    and $r0.12 = $r0.12, 4
;;
;;
;;
c0    cmpne $b0.0 = $r0.12, $r0.0
;;
;;
;;
c0    br $b0.0, core_main_L62?3
;;
-- core_main_L63?3
c0    ldw $r0.6 = ((default_num_contexts+0)+0)[$r0.0]
c0    mpyl $r0.2 = $r0.57, 38
c0    mov $r0.4 = $r0.57
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.31+0)
;;
;;
c0    cmpltu $b0.0 = $r0.57, $r0.6
c0    sh1add $r0.2 = $r0.2, $r0.58
;;
;;
;;
c0    ldhu.d $r0.5 = 0[$r0.2]
c0    brf $b0.0, core_main_L64?3
;;
;;
.call printf, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    add $r0.57 = $r0.57, 1
;;
;;
;;
c0    zxth $r0.57 = $r0.57
;;
;;
c0    goto core_main_L63?3
;;
-- core_main_L64?3
c0    cmpeq $b0.0 = $r0.61, $r0.0
c0    mov $r0.3 = (core_main_?1STRINGPACKET.32+0)
;;
;;
;;
c0    brf $b0.0, core_main_L65?3
;;
.call printf, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    cmpeq $b0.0 = $r0.60, 3
c0    mov $r0.3 = $r0.59
;;
;;
;;
c0    brf $b0.0, core_main_L65?3
;;
.call time_in_secs, caller, arg($r0.3:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = FUNC_time_in_secs
;;
c0    stw 0x10d8[$r0.1] = $r0.3
;;
c0    stw 0x10dc[$r0.1] = $r0.4
;;
c0    ldw $r0.62 = 0[$r0.62]
;;
c0    ldw $r0.2 = ((default_num_contexts+0)+0)[$r0.0]
;;
;;
;;
c0    mpylu $r0.4 = $r0.62, $r0.2
c0    mpyhs $r0.62 = $r0.62, $r0.2
;;
;;
;;
c0    add $r0.3 = $r0.4, $r0.62
;;
;;
.call _d_ufloat, caller, arg($r0.3:s32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = FUNC__d_ufloat
;;
c0    ldw $r0.5 = 0x10d8[$r0.1]
;;
c0    ldw $r0.6 = 0x10dc[$r0.1]
;;
;;
.call _d_div, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = FUNC__d_div
;;
c0    mov $r0.8 = (core_main_?1STRINGPACKET.35+0)
c0    mov $r0.7 = (core_main_?1STRINGPACKET.34+0)
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.33+0)
c0    mov $r0.5 = $r0.3
c0    mov $r0.6 = $r0.4
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret($r0.3:s32)
c0    mov $r0.4 = $r0.0
c0    call $l0.0 = FUNC_printf
;;
c0    ldw $r0.4 = (((mem_name+0)+8)+0)[$r0.0]
c0    mov $r0.3 = (core_main_?1STRINGPACKET.36+0)
;;
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    ldw $r0.4 = ((default_num_contexts+0)+0)[$r0.0]
c0    mov $r0.5 = (core_main_?1STRINGPACKET.38+0)
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.37+0)
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
.call printf, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    mov $r0.3 = (core_main_?1STRINGPACKET.39+0)
c0    call $l0.0 = FUNC_printf
;;
;;
-- core_main_L65?3
c0    cmpgt $b0.0 = $r0.61, $r0.0
c0    mov $r0.3 = (core_main_?1STRINGPACKET.40+0)
;;
;;
;;
c0    brf $b0.0, core_main_L66?3
;;
.call printf, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
-- core_main_L66?3
c0    cmplt $b0.0 = $r0.61, $r0.0
c0    mov $r0.3 = (core_main_?1STRINGPACKET.41+0)
;;
;;
;;
c0    brf $b0.0, core_main_L67?3
;;
.call printf, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
-- core_main_L67?3
c0    ldw $r0.3 = 0x1094[$r0.1]
;;
;;
.call portable_fini, caller, arg($r0.3:u32), ret()
c0    call $l0.0 = FUNC_portable_fini
;;
c0    ldw $l0.0 = 0x1050[$r0.1]
c0    mov $r0.3 = $r0.0
;;
c0    ldw $r0.63 = 0x10cc[$r0.1]
;;
c0    ldw $r0.62 = 0x10c8[$r0.1]
;;
c0    ldw $r0.61 = 0x10c4[$r0.1]
;;
c0    ldw $r0.60 = 0x10c0[$r0.1]
;;
c0    ldw $r0.59 = 0x10bc[$r0.1]
;;
c0    ldw $r0.58 = 0x10b8[$r0.1]
;;
c0    ldw $r0.57 = 0x10b4[$r0.1]
;;
;;
.return ret($r0.3:s32)
.call exit, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_exit
;;
-- core_main_L62?3
c0    mov $r0.57 = $r0.0
c0    ldw $r0.10 = 0x1070[$r0.1]
;;
;;
;;
-- core_main_L68?3
c0    ldw $r0.6 = ((default_num_contexts+0)+0)[$r0.0]
c0    mpyl $r0.2 = $r0.57, 38
c0    mov $r0.4 = $r0.57
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.30+0)
;;
;;
c0    cmpltu $b0.0 = $r0.57, $r0.6
c0    sh1add $r0.2 = $r0.2, $r0.10
;;
;;
;;
c0    ldhu.d $r0.5 = 0[$r0.2]
c0    brf $b0.0, core_main_L69?3
;;
;;
.call printf, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_printf
;;
c0    add $r0.57 = $r0.57, 1
c0    ldw $r0.10 = 0x1070[$r0.1]
;;
;;
;;
c0    zxth $r0.57 = $r0.57
;;
;;
c0    goto core_main_L68?3
;;
-- core_main_L69?3
c0    mov $r0.57 = $r0.0
;;
c0    goto core_main_L63?3
;;
-- core_main_L54?3
.call printf, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    mov $r0.3 = (core_main_?1STRINGPACKET.17+0)
c0    call $l0.0 = FUNC_printf
;;
c0    add $r0.61 = $r0.61, 1
c0    ldw $r0.2 = 0[$r0.58]
c0    mov $r0.3 = (core_main_?1STRINGPACKET.18+0)
;;
c0    ldw $r0.5 = ((default_num_contexts+0)+0)[$r0.0]
;;
;;
c0    sxth $r0.61 = $r0.61
;;
;;
c0    goto core_main_L55?3
;;
-- core_main_L52?3
;;
.call time_in_secs, caller, arg($r0.3:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = FUNC_time_in_secs
;;
c0    stw 0x10e0[$r0.1] = $r0.3
;;
c0    stw 0x10e4[$r0.1] = $r0.4
;;
c0    ldw $r0.2 = 0[$r0.58]
;;
c0    ldw $r0.4 = ((default_num_contexts+0)+0)[$r0.0]
;;
;;
;;
c0    mpylu $r0.5 = $r0.2, $r0.4
c0    mpyhs $r0.2 = $r0.2, $r0.4
;;
;;
;;
c0    add $r0.3 = $r0.5, $r0.2
;;
;;
.call _d_ufloat, caller, arg($r0.3:s32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = FUNC__d_ufloat
;;
c0    ldw $r0.5 = 0x10e0[$r0.1]
;;
c0    ldw $r0.6 = 0x10e4[$r0.1]
;;
;;
.call _d_div, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = FUNC__d_div
;;
c0    mov $r0.3 = (core_main_?1STRINGPACKET.16+0)
c0    mov $r0.5 = $r0.3
c0    mov $r0.6 = $r0.4
;;
.call printf, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
c0    mov $r0.4 = $r0.0
c0    call $l0.0 = FUNC_printf
;;
c0    ldw $r0.3 = 0x10d0[$r0.1]
c0    goto core_main_L53?3
;;
-- core_main_L50?3
c0    mov $r0.3 = $r0.0
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    ldw $r0.6 = 0x1068[$r0.1]
;;
c0    ldw $r0.9 = 0x106c[$r0.1]
;;
c0    ldw $r0.10 = 0x1070[$r0.1]
;;
c0    ldw $r0.13 = 0x1074[$r0.1]
;;
c0    ldw $r0.8 = 0x1078[$r0.1]
;;
c0    ldw $r0.11 = 0x107c[$r0.1]
;;
;;
;;
-- core_main_L70?3
c0    ldw $r0.2 = ((default_num_contexts+0)+0)[$r0.0]
c0    mpyl $r0.4 = $r0.3, 38
c0    mpyl $r0.5 = $r0.3, 19
;;
c0    sh1add $r0.14 = $r0.8, (core_main_9217.list_known_crc+0)
c0    mpyl $r0.15 = $r0.3, 19
c0    mpyl $r0.16 = $r0.3, 38
;;
c0    sh1add $r0.17 = $r0.8, (core_main_9217.matrix_known_crc+0)
c0    mpyl $r0.18 = $r0.3, 19
c0    mpyl $r0.19 = $r0.3, 38
;;
c0    cmpltu $b0.0 = $r0.3, $r0.2
c0    sh1add $r0.20 = $r0.4, $r0.11
c0    sh2add $r0.5 = $r0.5, $r0.12
c0    sh1add $r0.21 = $r0.4, $r0.6
;;
c0    ldhu.d $r0.14 = 0[$r0.14]
c0    sh2add $r0.15 = $r0.15, $r0.12
c0    sh1add $r0.22 = $r0.16, $r0.9
c0    mpyl $r0.23 = $r0.3, 38
;;
c0    ldhu.d $r0.17 = 0[$r0.17]
c0    sh2add $r0.18 = $r0.18, $r0.12
c0    sh1add $r0.24 = $r0.19, $r0.10
c0    add $r0.25 = $r0.3, 1
;;
c0    ldw.d $r0.5 = 0[$r0.5]
c0    sh1add $r0.2 = $r0.8, (core_main_9217.state_known_crc+0)
c0    brf $b0.0, core_main_L71?3
;;
c0    ldhu.d $r0.21 = 0[$r0.21]
c0    sh1add $r0.23 = $r0.23, $r0.11
;;
c0    ldw.d $r0.15 = 0[$r0.15]
;;
c0    and $r0.5 = $r0.5, 1
c0    ldhu.d $r0.22 = 0[$r0.22]
;;
c0    cmpne $r0.26 = $r0.21, $r0.14
c0    ldw.d $r0.18 = 0[$r0.18]
;;
c0    and $r0.15 = $r0.15, 2
c0    ldhu.d $r0.24 = 0[$r0.24]
;;
c0    cmpne $r0.27 = $r0.22, $r0.17
c0    ldhu.d $r0.2 = 0[$r0.2]
;;
c0    sth 0[$r0.20] = $r0.0
c0    andl $b0.0 = $r0.5, $r0.26
c0    and $r0.18 = $r0.18, 4
;;
c0    ldh.d $r0.23 = 0[$r0.23]
;;
c0    andl $b0.1 = $r0.15, $r0.27
c0    cmpne $r0.20 = $r0.24, $r0.2
;;
c0    br $b0.0, core_main_L72?3
;;
-- core_main_L73?3
c0    add $r0.23 = $r0.23, $r0.13
;;
c0    andl $b0.0 = $r0.18, $r0.20
c0    br $b0.1, core_main_L74?3
;;
-- core_main_L75?3
;;
;;
c0    br $b0.0, core_main_L76?3
;;
-- core_main_L77?3
c0    sxth $r0.13 = $r0.23
c0    zxth $r0.3 = $r0.25
;;
;;
c0    goto core_main_L70?3
;;
-- core_main_L76?3
c0    stw 0x1054[$r0.1] = $r0.12
c0    mov $r0.5 = $r0.24
c0    mov $r0.4 = $r0.3
;;
c0    stw 0x1068[$r0.1] = $r0.6
;;
c0    stw 0x106c[$r0.1] = $r0.9
c0    mov $r0.6 = $r0.2
;;
c0    stw 0x1070[$r0.1] = $r0.10
;;
c0    stw 0x1078[$r0.1] = $r0.8
;;
c0    stw 0x1074[$r0.1] = $r0.13
;;
c0    stw 0x107c[$r0.1] = $r0.11
;;
c0    stw 0x108c[$r0.1] = $r0.19
;;
c0    stw 0x1084[$r0.1] = $r0.3
;;
.call printf, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:s32,$r0.6:s32), ret($r0.3:s32)
c0    mov $r0.3 = (core_main_?1STRINGPACKET.12+0)
c0    call $l0.0 = FUNC_printf
;;
c0    ldw $r0.11 = 0x107c[$r0.1]
;;
c0    ldw $r0.19 = 0x108c[$r0.1]
;;
c0    ldw $r0.3 = 0x1084[$r0.1]
;;
c0    ldw $r0.13 = 0x1074[$r0.1]
;;
c0    sh1add $r0.2 = $r0.19, $r0.11
c0    sh1add $r0.19 = $r0.19, $r0.11
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    mpyl $r0.4 = $r0.3, 38
c0    add $r0.25 = $r0.3, 1
c0    ldw $r0.6 = 0x1068[$r0.1]
;;
c0    ldw $r0.9 = 0x106c[$r0.1]
;;
c0    ldh $r0.2 = 0[$r0.2]
;;
c0    sh1add $r0.4 = $r0.4, $r0.11
c0    ldw $r0.10 = 0x1070[$r0.1]
;;
c0    ldw $r0.8 = 0x1078[$r0.1]
;;
c0    add $r0.2 = $r0.2, 1
;;
;;
;;
c0    sth 0[$r0.19] = $r0.2
;;
c0    ldh $r0.4 = 0[$r0.4]
;;
;;
;;
c0    add $r0.23 = $r0.4, $r0.13
;;
;;
c0    goto core_main_L77?3
;;
-- core_main_L74?3
c0    stw 0x1068[$r0.1] = $r0.6
c0    mov $r0.5 = $r0.22
c0    mov $r0.4 = $r0.3
;;
c0    stw 0x106c[$r0.1] = $r0.9
c0    mov $r0.6 = $r0.17
;;
c0    stw 0x1074[$r0.1] = $r0.13
;;
c0    stw 0x1078[$r0.1] = $r0.8
;;
c0    stw 0x1070[$r0.1] = $r0.10
;;
c0    stw 0x1054[$r0.1] = $r0.12
;;
c0    stw 0x107c[$r0.1] = $r0.11
;;
c0    stw 0x1080[$r0.1] = $r0.16
;;
c0    stw 0x1084[$r0.1] = $r0.3
;;
.call printf, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:s32,$r0.6:s32), ret($r0.3:s32)
c0    mov $r0.3 = (core_main_?1STRINGPACKET.11+0)
c0    call $l0.0 = FUNC_printf
;;
c0    ldw $r0.11 = 0x107c[$r0.1]
;;
c0    ldw $r0.16 = 0x1080[$r0.1]
;;
c0    ldw $r0.3 = 0x1084[$r0.1]
;;
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    sh1add $r0.4 = $r0.16, $r0.11
c0    sh1add $r0.16 = $r0.16, $r0.11
c0    ldw $r0.10 = 0x1070[$r0.1]
;;
c0    mpyl $r0.7 = $r0.3, 19
c0    mpyl $r0.5 = $r0.3, 38
c0    ldw $r0.8 = 0x1078[$r0.1]
;;
c0    mpyl $r0.19 = $r0.3, 38
c0    add $r0.25 = $r0.3, 1
c0    ldw $r0.6 = 0x1068[$r0.1]
;;
c0    ldh $r0.4 = 0[$r0.4]
;;
c0    sh2add $r0.7 = $r0.7, $r0.12
c0    sh1add $r0.14 = $r0.8, (core_main_9217.state_known_crc+0)
c0    sh1add $r0.5 = $r0.5, $r0.11
;;
c0    sh1add $r0.15 = $r0.19, $r0.10
c0    ldw $r0.9 = 0x106c[$r0.1]
;;
c0    add $r0.4 = $r0.4, 1
c0    ldw $r0.13 = 0x1074[$r0.1]
;;
c0    ldw $r0.7 = 0[$r0.7]
;;
c0    ldhu.d $r0.24 = 0[$r0.15]
;;
c0    ldhu.d $r0.2 = 0[$r0.14]
;;
c0    sth 0[$r0.16] = $r0.4
c0    and $r0.18 = $r0.7, 4
;;
c0    ldh.d $r0.23 = 0[$r0.5]
;;
c0    cmpne $r0.20 = $r0.24, $r0.2
;;
;;
c0    add $r0.23 = $r0.23, $r0.13
;;
c0    andl $b0.0 = $r0.18, $r0.20
c0    goto core_main_L75?3
;;
-- core_main_L72?3
c0    stw 0x1068[$r0.1] = $r0.6
c0    mov $r0.5 = $r0.21
;;
c0    stw 0x1074[$r0.1] = $r0.13
c0    mov $r0.6 = $r0.14
;;
c0    stw 0x1070[$r0.1] = $r0.10
;;
c0    stw 0x1078[$r0.1] = $r0.8
;;
c0    stw 0x106c[$r0.1] = $r0.9
;;
c0    stw 0x1054[$r0.1] = $r0.12
;;
c0    stw 0x107c[$r0.1] = $r0.11
;;
c0    stw 0x1088[$r0.1] = $r0.4
;;
c0    mov $r0.4 = $r0.3
c0    stw 0x1084[$r0.1] = $r0.3
;;
.call printf, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:s32,$r0.6:s32), ret($r0.3:s32)
c0    mov $r0.3 = (core_main_?1STRINGPACKET.10+0)
c0    call $l0.0 = FUNC_printf
;;
c0    ldw $r0.11 = 0x107c[$r0.1]
;;
c0    ldw $r0.4 = 0x1088[$r0.1]
;;
c0    ldw $r0.3 = 0x1084[$r0.1]
;;
c0    ldw $r0.12 = 0x1054[$r0.1]
;;
c0    sh1add $r0.5 = $r0.4, $r0.11
c0    sh1add $r0.4 = $r0.4, $r0.11
c0    ldw $r0.9 = 0x106c[$r0.1]
;;
c0    mpyl $r0.14 = $r0.3, 19
c0    mpyl $r0.7 = $r0.3, 38
c0    ldw $r0.8 = 0x1078[$r0.1]
;;
c0    mpyl $r0.16 = $r0.3, 38
c0    mpyl $r0.20 = $r0.3, 19
c0    ldw $r0.10 = 0x1070[$r0.1]
;;
c0    ldh $r0.5 = 0[$r0.5]
c0    mpyl $r0.19 = $r0.3, 38
c0    add $r0.25 = $r0.3, 1
;;
c0    sh2add $r0.14 = $r0.14, $r0.12
c0    sh1add $r0.21 = $r0.8, (core_main_9217.matrix_known_crc+0)
c0    sh1add $r0.7 = $r0.7, $r0.11
;;
c0    sh1add $r0.26 = $r0.16, $r0.9
c0    sh2add $r0.20 = $r0.20, $r0.12
c0    sh1add $r0.28 = $r0.8, (core_main_9217.state_known_crc+0)
;;
c0    add $r0.5 = $r0.5, 1
c0    sh1add $r0.29 = $r0.19, $r0.10
c0    ldw $r0.6 = 0x1068[$r0.1]
;;
c0    ldw $r0.14 = 0[$r0.14]
;;
c0    ldhu.d $r0.22 = 0[$r0.26]
;;
c0    ldhu.d $r0.17 = 0[$r0.21]
;;
c0    and $r0.15 = $r0.14, 2
c0    ldw.d $r0.20 = 0[$r0.20]
;;
c0    ldhu.d $r0.24 = 0[$r0.29]
;;
c0    cmpne $r0.27 = $r0.22, $r0.17
c0    ldhu.d $r0.2 = 0[$r0.28]
;;
c0    and $r0.18 = $r0.20, 4
c0    ldw $r0.13 = 0x1074[$r0.1]
;;
c0    sth 0[$r0.4] = $r0.5
;;
c0    ldh.d $r0.23 = 0[$r0.7]
;;
c0    andl $b0.1 = $r0.15, $r0.27
c0    cmpne $r0.20 = $r0.24, $r0.2
;;
c0    goto core_main_L73?3
;;
-- core_main_L71?3
c0    stw 0x1078[$r0.1] = $r0.8
;;
c0    stw 0x1054[$r0.1] = $r0.12
;;
c0    stw 0x1068[$r0.1] = $r0.6
;;
c0    stw 0x106c[$r0.1] = $r0.9
;;
c0    stw 0x1070[$r0.1] = $r0.10
;;
c0    stw 0x1074[$r0.1] = $r0.13
c0    goto core_main_L51?3
;;
-- core_main_L48?3
c0    mov $r0.3 = (core_main_?1STRINGPACKET.7+0)
c0    ldw $r0.2 = 0x10d4[$r0.1]
;;
;;
;;
c0    cmpeq $b0.0 = $r0.2, 20143
;;
;;
;;
c0    brf $b0.0, core_main_L78?3
;;
c0    mov $r0.8 = 2
;;
.call printf, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x1078[$r0.1] = $r0.8
c0    call $l0.0 = FUNC_printf
;;
c0    goto core_main_L49?3
;;
-- core_main_L78?3
c0    mov $r0.3 = (core_main_?1STRINGPACKET.6+0)
c0    ldw $r0.2 = 0x10d4[$r0.1]
;;
;;
;;
c0    cmpeq $b0.0 = $r0.2, 31493
;;
;;
;;
c0    brf $b0.0, core_main_L79?3
;;
c0    mov $r0.8 = 1
;;
.call printf, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x1078[$r0.1] = $r0.8
c0    call $l0.0 = FUNC_printf
;;
c0    goto core_main_L49?3
;;
-- core_main_L79?3
c0    mov $r0.3 = (core_main_?1STRINGPACKET.5+0)
c0    ldw $r0.2 = 0x10d4[$r0.1]
;;
;;
;;
c0    cmpeq $b0.0 = $r0.2, 35330
;;
;;
;;
c0    brf $b0.0, core_main_L80?3
;;
c0    mov $r0.8 = $r0.0
;;
.call printf, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x1078[$r0.1] = $r0.8
c0    call $l0.0 = FUNC_printf
;;
c0    goto core_main_L49?3
;;
-- core_main_L80?3
c0    mov $r0.3 = (core_main_?1STRINGPACKET.8+0)
c0    ldw $r0.2 = 0x10d4[$r0.1]
;;
;;
;;
c0    cmpeq $b0.0 = $r0.2, 59893
;;
;;
;;
c0    brf $b0.0, core_main_L81?3
;;
c0    mov $r0.8 = 3
;;
.call printf, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x1078[$r0.1] = $r0.8
c0    call $l0.0 = FUNC_printf
;;
c0    goto core_main_L49?3
;;
-- core_main_L81?3
c0    mov $r0.13 = -1
;;
c0    stw 0x1074[$r0.1] = $r0.13
c0    goto core_main_L49?3
;;
-- core_main_L29?3
c0    and $r0.19 = $r0.15, $r0.19
c0    brf $b0.1, core_main_L82?3
;;
c0    sh2add $r0.20 = $r0.20, $r0.6
c0    sh2add $r0.25 = $r0.25, $r0.6
c0    zxth $r0.2 = $r0.26
;;
;;
c0    cmpne $b0.0 = $r0.19, $r0.0
c0    mpylu $r0.13 = $r0.4, $r0.5
c0    add $r0.14 = $r0.5, 1
c0    ldw.d $r0.3 = 0[$r0.6]
;;
c0    goto core_main_L31?3
;;
-- core_main_L82?3
c0    stw 0x1064[$r0.1] = $r0.9
;;
c0    goto core_main_L34?3
;;
-- core_main_L28?3
c0    stw 0x1064[$r0.1] = $r0.9
;;
c0    stw 0x1058[$r0.1] = $r0.8
c0    goto core_main_L33?3
;;
-- core_main_L26?3
c0    and $r0.13 = $r0.15, $r0.13
c0    sh2add $r0.22 = $r0.22, $r0.6
c0    sh2add $r0.23 = $r0.23, $r0.6
c0    mov $r0.14 = 1
;;
c0    zxth $r0.24 = $r0.24
;;
c0    ldw.d $r0.3 = 0[$r0.6]
;;
c0    cmpne $b0.0 = $r0.13, $r0.0
c0    mpylu $r0.16 = $r0.4, $r0.5
c0    add $r0.17 = $r0.5, 1
c0    goto core_main_L27?3
;;
-- core_main_L25?3
c0    stw 0x1064[$r0.1] = $r0.9
;;
c0    stw 0x1058[$r0.1] = $r0.8
;;
-- core_main_L33?3
c0    stw 0x1060[$r0.1] = $r0.7
;;
c0    stw 0x1054[$r0.1] = $r0.12
;;
c0    stw 0x1068[$r0.1] = $r0.40
;;
c0    stw 0x106c[$r0.1] = $r0.41
;;
c0    stw 0x1070[$r0.1] = $r0.42
;;
c0    stw 0x107c[$r0.1] = $r0.11
;;
c0    stw 0x1094[$r0.1] = $r0.35
;;
c0    stw 0x1050[$r0.1] = $r0.32
;;
c0    stw 0x10b4[$r0.1] = $r0.57
;;
c0    mov $r0.57 = $r0.0
c0    stw 0x10b8[$r0.1] = $r0.58
;;
c0    stw 0x10bc[$r0.1] = $r0.59
;;
c0    stw 0x10c0[$r0.1] = $r0.60
c0    mov $r0.59 = $r0.37
;;
c0    stw 0x10c4[$r0.1] = $r0.61
c0    mov $r0.60 = $r0.38
;;
c0    mov $r0.61 = $r0.10
c0    stw 0x10c8[$r0.1] = $r0.62
;;
c0    mov $r0.62 = $r0.36
c0    stw 0x10cc[$r0.1] = $r0.63
;;
c0    mov $r0.63 = $r0.39
c0    stw 0x1074[$r0.1] = $r0.33
;;
c0    stw 0x1078[$r0.1] = $r0.44
;;
c0    stw 0x105c[$r0.1] = $r0.6
c0    goto core_main_L35?3
;;
-- core_main_L21?3
c0    mov $r0.5 = $r0.34
c0    ldw.d $r0.4 = 0[$r0.7]
;;
c0    ldw.d $r0.15 = 0[$r0.12]
c0    goto core_main_L23?3
;;
-- core_main_L20?3
c0    mov $r0.5 = $r0.34
c0    ldw.d $r0.4 = 0[$r0.7]
;;
c0    ldw.d $r0.15 = 0[$r0.12]
c0    goto core_main_L23?3
;;
-- core_main_L19?3
c0    ldw.d $r0.4 = 0[$r0.7]
c0    mov $r0.5 = $r0.34
;;
c0    ldw.d $r0.15 = 0[$r0.12]
;;
-- core_main_L23?3
c0    mov $r0.2 = $r0.0
;;
c0    goto core_main_L24?3
;;
-- core_main_L16?3
c0    mov $r0.2 = $r0.0
;;
;;
c0    mov $r0.4 = $r0.16
c0    goto core_main_L18?3
;;
-- core_main_L15?3
c0    mov $r0.2 = $r0.0
;;
;;
c0    mov $r0.4 = $r0.13
c0    goto core_main_L18?3
;;
-- core_main_L14?3
c0    mov $r0.4 = $r0.5
c0    mov $r0.2 = $r0.0
;;
c0    goto core_main_L18?3
;;
-- core_main_L10?3
c0    mov $r0.5 = $r0.43
;;
c0    mov $r0.2 = $r0.0
c0    ldw.d $r0.4 = 0[$r0.12]
;;
c0    goto core_main_L12?3
;;
-- core_main_L9?3
c0    ldw.d $r0.4 = 0[$r0.12]
c0    mov $r0.5 = $r0.43
;;
c0    mov $r0.2 = $r0.0
;;
-- core_main_L12?3
c0    goto core_main_L13?3
;;
-- core_main_L7?3
c0    mov $r0.5 = 102
c0    mov $r0.3 = 13333
;;
c0    sth 0[$r0.8] = $r0.3
;;
c0    sth 0[$r0.9] = $r0.3
;;
c0    sth 0[$r0.10] = $r0.5
c0    goto core_main_L8?3
;;
-- core_main_L5?3
c0    sth 0[$r0.8] = $r0.0
c0    mov $r0.5 = 102
;;
c0    ldh $r0.18 = 0[$r0.8]
;;
c0    sth 0[$r0.9] = $r0.0
;;
c0    ldh.d $r0.20 = 0[$r0.9]
;;
c0    sth 0[$r0.10] = $r0.5
c0    cmpeq $r0.18 = $r0.18, 1
;;
c0    ldh.d $r0.19 = 0[$r0.10]
;;
c0    cmpeq $r0.20 = $r0.20, $r0.0
;;
;;
c0    cmpeq $r0.19 = $r0.19, $r0.0
;;
;;
;;
c0    andl $r0.18 = $r0.18, $r0.19
;;
;;
;;
c0    andl $b0.2 = $r0.18, $r0.20
;;
;;
c0    goto core_main_L6?3
;;
-- core_main_L4?3
c0    br $b0.1, core_main_L5?3
;;
c0    goto core_main_L6?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
-- FUNC_iterate
c0    add $r0.1 = $r0.1, (-0x20)
c0    ldw $r0.2 = 28[$r0.3]
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    stw 0x14[$r0.1] = $r0.57
;;
c0    mov $r0.57 = $r0.0
c0    stw 0x18[$r0.1] = $r0.58
;;
c0    stw 0x1c[$r0.1] = $r0.59
c0    mov $r0.58 = $r0.2
;;
c0    sth 56[$r0.3] = $r0.0
c0    mov $r0.59 = $r0.3
;;
c0    sth 58[$r0.3] = $r0.0
;;
c0    sth 60[$r0.3] = $r0.0
;;
c0    sth 62[$r0.3] = $r0.0
;;
-- core_main_L0?3
c0    cmpltu $b0.0 = $r0.57, $r0.58
c0    mov $r0.4 = 1
c0    mov $r0.3 = $r0.59
;;
;;
;;
c0    brf $b0.0, core_main_L1?3
;;
.call core_bench_list, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_bench_list
;;
c0    ldhu $r0.4 = 56[$r0.59]
;;
;;
.call crcu16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crcu16
;;
c0    sth 56[$r0.59] = $r0.3
c0    mov $r0.4 = -1
;;
.call core_bench_list, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:u32)
c0    mov $r0.3 = $r0.59
c0    call $l0.0 = FUNC_core_bench_list
;;
c0    ldhu $r0.4 = 56[$r0.59]
;;
;;
.call crcu16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crcu16
;;
c0    sth 56[$r0.59] = $r0.3
c0    cmpeq $b0.0 = $r0.57, $r0.0
;;
;;
;;
c0    brf $b0.0, core_main_L2?3
;;
c0    sth 58[$r0.59] = $r0.3
c0    add $r0.57 = $r0.57, 1
;;
-- core_main_L3?3
;;
c0    goto core_main_L0?3
;;
-- core_main_L2?3
c0    add $r0.57 = $r0.57, 1
c0    goto core_main_L3?3
;;
-- core_main_L1?3
c0    mov $r0.3 = $r0.0
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    ldw $r0.59 = 0x1c[$r0.1]
;;
c0    ldw $r0.58 = 0x18[$r0.1]
;;
c0    ldw $r0.57 = 0x14[$r0.1]
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
;;
ENDOFFILE: core_main
FILE: core_list_join
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32)
-- FUNC_calc_func
c0    add $r0.1 = $r0.1, (-0x40)
c0    ldh $r0.2 = 0[$r0.3]
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
;;
c0    shr $r0.5 = $r0.2, 7
c0    and $r0.6 = $r0.2, 127
;;
;;
;;
c0    and $r0.5 = $r0.5, 1
c0    sxth $r0.6 = $r0.6
;;
;;
;;
c0    zxtb $r0.5 = $r0.5
c0    mov $r0.3 = $r0.6
c0    mov $r0.7 = $r0.3
;;
;;
;;
c0    cmpne $b0.0 = $r0.5, $r0.0
;;
;;
;;
c0    brf $b0.0, core_list_join_L0?3
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- core_list_join_L0?3
c0    and $r0.10 = $r0.2, 7
c0    shr $r0.9 = $r0.2, 3
c0    add $r0.11 = $r0.4, 8
c0    stw 0x14[$r0.1] = $r0.4
;;
c0    stw 0x18[$r0.1] = $r0.7
;;
c0    stw 0x1c[$r0.1] = $r0.2
;;
c0    sxth $r0.10 = $r0.10
c0    and $r0.9 = $r0.9, 15
c0    ldw.d $r0.11 = 12[$r0.11]
;;
c0    ldw.d $r0.3 = 24[$r0.4]
;;
c0    ldh.d $r0.5 = 0[$r0.4]
;;
c0    sxth $r0.12 = $r0.9
c0    cmpeq $b0.0 = $r0.10, $r0.0
c0    ldh.d $r0.6 = 2[$r0.4]
;;
c0    ldhu.d $r0.8 = 56[$r0.4]
;;
;;
c0    shl $r0.12 = $r0.12, 4
;;
c0    mov $r0.4 = $r0.11
;;
;;
c0    or $r0.9 = $r0.9, $r0.12
;;
;;
;;
c0    sxth $r0.9 = $r0.9
;;
;;
c0    brf $b0.0, core_list_join_L1?3
;;
c0    max $r0.7 = $r0.9, 34
;;
;;
.call core_bench_state, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32,$r0.6:s32,$r0.7:s32,$r0.8:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_bench_state
;;
c0    sxth $r0.5 = $r0.3
c0    ldw $r0.6 = 0x14[$r0.1]
;;
;;
;;
c0    zxth $r0.3 = $r0.5
c0    stw 0x20[$r0.1] = $r0.5
;;
c0    ldhu $r0.7 = 62[$r0.6]
;;
c0    ldhu.d $r0.4 = 56[$r0.6]
;;
;;
c0    cmpeq $b0.0 = $r0.7, $r0.0
;;
;;
;;
c0    brf $b0.0, core_list_join_L2?3
;;
.call crcu16, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:u32)
c0    sth 62[$r0.6] = $r0.5
c0    call $l0.0 = FUNC_crcu16
;;
-- core_list_join_L3?3
c0    ldw $r0.5 = 0x20[$r0.1]
;;
c0    ldw $r0.2 = 0x1c[$r0.1]
;;
c0    ldw $r0.4 = 0x14[$r0.1]
;;
c0    and $r0.5 = $r0.5, 127
c0    ldw $r0.6 = 0x18[$r0.1]
;;
c0    and $r0.2 = $r0.2, 65280
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    sth 56[$r0.4] = $r0.3
;;
c0    sxth $r0.3 = $r0.5
;;
;;
;;
c0    or $r0.5 = $r0.3, 128
;;
;;
;;
c0    or $r0.5 = $r0.5, $r0.2
;;
;;
;;
.return ret($r0.3:s32)
c0    sth 0[$r0.6] = $r0.5
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- core_list_join_L2?3
c0    zxth $r0.3 = $r0.5
c0    ldhu $r0.4 = 56[$r0.6]
;;
;;
.call crcu16, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crcu16
;;
c0    goto core_list_join_L3?3
;;
-- core_list_join_L1?3
c0    cmpeq $b0.0 = $r0.10, 1
c0    mov $r0.4 = $r0.9
c0    ldw $r0.6 = 0x14[$r0.1]
;;
;;
;;
c0    add $r0.3 = $r0.6, 40
c0    ldhu.d $r0.5 = 56[$r0.6]
c0    brf $b0.0, core_list_join_L4?3
;;
;;
.call core_bench_matrix, caller, arg($r0.3:u32,$r0.4:s32,$r0.5:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_bench_matrix
;;
c0    sxth $r0.5 = $r0.3
c0    ldw $r0.6 = 0x14[$r0.1]
;;
;;
;;
c0    zxth $r0.3 = $r0.5
c0    stw 0x20[$r0.1] = $r0.5
;;
c0    ldhu $r0.7 = 60[$r0.6]
;;
c0    ldhu.d $r0.4 = 56[$r0.6]
;;
;;
c0    cmpeq $b0.0 = $r0.7, $r0.0
;;
;;
;;
c0    brf $b0.0, core_list_join_L5?3
;;
.call crcu16, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:u32)
c0    sth 60[$r0.6] = $r0.5
c0    call $l0.0 = FUNC_crcu16
;;
c0    goto core_list_join_L3?3
;;
-- core_list_join_L5?3
c0    zxth $r0.3 = $r0.5
c0    ldhu $r0.4 = 56[$r0.6]
;;
;;
.call crcu16, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crcu16
;;
c0    goto core_list_join_L3?3
;;
-- core_list_join_L4?3
c0    ldw $r0.2 = 0x14[$r0.1]
;;
c0    ldw $r0.6 = 0x1c[$r0.1]
;;
;;
c0    ldhu $r0.4 = 56[$r0.2]
;;
c0    mov $r0.5 = $r0.6
;;
c0    zxth $r0.3 = $r0.5
c0    stw 0x20[$r0.1] = $r0.5
;;
;;
.call crcu16, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crcu16
;;
c0    goto core_list_join_L3?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
-- FUNC_cmp_complex
c0    add $r0.1 = $r0.1, (-0x20)
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    stw 0x14[$r0.1] = $r0.4
;;
.call calc_func, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    mov $r0.4 = $r0.5
c0    stw 0x18[$r0.1] = $r0.5
c0    call $l0.0 = FUNC_calc_func
;;
c0    stw 0x1c[$r0.1] = $r0.3
;;
c0    ldw $r0.3 = 0x14[$r0.1]
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
;;
.call calc_func, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_calc_func
;;
c0    ldw $r0.2 = 0x1c[$r0.1]
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
c0    sub $r0.3 = $r0.2, $r0.3
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
-- FUNC_cmp_idx
c0    cmpeq $b0.0 = $r0.5, $r0.0
c0    ldh.d $r0.2 = 0[$r0.3]
;;
;;
;;
c0    shr $r0.5 = $r0.2, 8
c0    and $r0.6 = $r0.2, 65280
c0    brf $b0.0, core_list_join_L6?3
;;
;;
;;
c0    and $r0.5 = $r0.5, 255
;;
;;
;;
c0    or $r0.5 = $r0.5, $r0.6
;;
;;
;;
c0    sth 0[$r0.3] = $r0.5
;;
c0    ldh $r0.2 = 0[$r0.4]
;;
c0    ldh $r0.5 = 2[$r0.4]
;;
;;
c0    shr $r0.6 = $r0.2, 8
c0    and $r0.7 = $r0.2, 65280
;;
;;
;;
c0    and $r0.6 = $r0.6, 255
;;
;;
;;
c0    or $r0.6 = $r0.6, $r0.7
;;
;;
;;
c0    sth 0[$r0.4] = $r0.6
;;
-- core_list_join_L7?3
c0    ldh $r0.3 = 2[$r0.3]
;;
;;
;;
c0    sub $r0.3 = $r0.3, $r0.5
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_list_join_L6?3
c0    ldh $r0.4 = 2[$r0.4]
;;
;;
;;
c0    mov $r0.5 = $r0.4
c0    goto core_list_join_L7?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32)
-- FUNC_copy_info
c0    ldh $r0.2 = 0[$r0.4]
;;
;;
;;
c0    sth 0[$r0.3] = $r0.2
;;
c0    ldh $r0.4 = 2[$r0.4]
;;
;;
;;
.return ret()
c0    sth 2[$r0.3] = $r0.4
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32,$r0.4:u32)
-- FUNC_core_bench_list
c0    add $r0.1 = $r0.1, (-0x60)
c0    sxth $r0.5 = $r0.4
c0    ldw $r0.2 = 36[$r0.3]
;;
c0    add $r0.6 = $r0.1, 0x10
c0    stw 0x14[$r0.1] = $l0.0
;;
c0    stw 0x28[$r0.1] = $r0.57
;;
c0    mov $r0.57 = $r0.0
c0    stw 0x2c[$r0.1] = $r0.58
;;
c0    stw 0x30[$r0.1] = $r0.59
;;
c0    stw 0x34[$r0.1] = $r0.60
c0    mov $r0.59 = $r0.2
;;
c0    stw 0x38[$r0.1] = $r0.61
c0    mov $r0.60 = $r0.6
;;
c0    mov $r0.61 = $r0.0
c0    stw 0x3c[$r0.1] = $r0.62
;;
c0    mov $r0.62 = $r0.0
c0    stw 0x40[$r0.1] = $r0.63
;;
c0    mov $r0.63 = $r0.0
c0    stw 0x20[$r0.1] = $r0.3
;;
c0    stw 0x1c[$r0.1] = $r0.5
;;
c0    ldh $r0.58 = 4[$r0.3]
;;
c0    sth 0x12[$r0.1] = $r0.4
;;
;;
-- core_list_join_L8?3
c0    cmplt $b0.0 = $r0.57, $r0.58
c0    and $r0.2 = $r0.57, 255
c0    mov $r0.3 = $r0.59
c0    mov $r0.4 = $r0.60
;;
;;
;;
c0    brf $b0.0, core_list_join_L9?3
;;
.call core_list_find, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    sth 0x10[$r0.1] = $r0.2
c0    call $l0.0 = FUNC_core_list_find
;;
c0    stw 0x18[$r0.1] = $r0.3
;;
.call core_list_reverse, caller, arg($r0.3:u32), ret($r0.3:u32)
c0    mov $r0.3 = $r0.59
c0    call $l0.0 = FUNC_core_list_reverse
;;
c0    mov $r0.59 = $r0.3
c0    add $r0.4 = $r0.62, 1
c0    ldw.d $r0.2 = 0[$r0.3]
c0    add $r0.5 = $r0.57, 1
;;
c0    ldw $r0.6 = 0x18[$r0.1]
;;
c0    ldh.d $r0.7 = 0x12[$r0.1]
;;
c0    ldw.d $r0.2 = 4[$r0.2]
;;
c0    cmpeq $b0.0 = $r0.6, $r0.0
;;
c0    cmpge $b0.1 = $r0.7, $r0.0
c0    add $r0.8 = $r0.7, 1
;;
c0    ldh.d $r0.2 = 0[$r0.2]
;;
c0    brf $b0.0, core_list_join_L10?3
;;
c0    zxth $r0.62 = $r0.4
;;
c0    shr $r0.2 = $r0.2, 8
;;
;;
;;
c0    and $r0.2 = $r0.2, 1
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.61
;;
;;
;;
c0    zxth $r0.61 = $r0.2
;;
;;
c0    brf $b0.1, core_list_join_L11?3
;;
-- core_list_join_L12?3
c0    sth 0x12[$r0.1] = $r0.8
c0    sxth $r0.57 = $r0.5
;;
-- core_list_join_L13?3
;;
c0    goto core_list_join_L8?3
;;
-- core_list_join_L11?3
c0    sxth $r0.57 = $r0.5
c0    goto core_list_join_L13?3
;;
-- core_list_join_L10?3
c0    add $r0.63 = $r0.63, 1
c0    ldw $r0.4 = 0x18[$r0.1]
;;
;;
;;
c0    zxth $r0.63 = $r0.63
c0    ldw $r0.2 = 4[$r0.4]
;;
c0    ldw $r0.6 = 0[$r0.4]
;;
;;
c0    ldh $r0.2 = 0[$r0.2]
;;
c0    cmpne $b0.0 = $r0.6, $r0.0
c0    ldw.d $r0.7 = 0[$r0.6]
;;
;;
c0    and $r0.2 = $r0.2, 1
c0    shr $r0.9 = $r0.2, 9
;;
;;
;;
c0    and $r0.9 = $r0.9, 1
c0    cmpne $b0.2 = $r0.2, $r0.0
;;
;;
;;
c0    add $r0.9 = $r0.9, $r0.61
;;
;;
;;
c0    zxth $r0.9 = $r0.9
;;
;;
;;
c0    slct $r0.61 = $b0.2, $r0.9, $r0.61
c0    brf $b0.0, core_list_join_L14?3
;;
c0    stw 0[$r0.4] = $r0.7
;;
c0    ldw $r0.2 = 0[$r0.3]
;;
;;
;;
c0    stw 0[$r0.6] = $r0.2
;;
c0    stw 0[$r0.3] = $r0.6
;;
c0    ldh $r0.7 = 0x12[$r0.1]
;;
;;
;;
c0    cmpge $b0.0 = $r0.7, $r0.0
c0    add $r0.8 = $r0.7, 1
;;
;;
;;
c0    brf $b0.0, core_list_join_L11?3
;;
c0    goto core_list_join_L12?3
;;
-- core_list_join_L14?3
c0    brf $b0.1, core_list_join_L15?3
;;
c0    goto core_list_join_L12?3
;;
-- core_list_join_L15?3
c0    goto core_list_join_L11?3
;;
-- core_list_join_L9?3
c0    mov $r0.57 = $r0.59
c0    shl $r0.63 = $r0.63, 2
c0    sub $r0.61 = $r0.61, $r0.62
c0    ldw $r0.2 = 0x1c[$r0.1]
;;
c0    mov $r0.4 = cmp_complex
c0    mov $r0.3 = $r0.59
c0    ldw $r0.5 = 0x20[$r0.1]
;;
;;
c0    add $r0.61 = $r0.61, $r0.63
c0    cmpgt $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    zxth $r0.59 = $r0.61
;;
;;
c0    brf $b0.0, core_list_join_L16?3
;;
.call core_list_mergesort, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_list_mergesort
;;
c0    mov $r0.57 = $r0.3
;;
-- core_list_join_L16?3
c0    ldw $r0.3 = 0[$r0.57]
;;
;;
.call core_list_remove, caller, arg($r0.3:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_list_remove
;;
c0    add $r0.4 = $r0.1, 0x10
c0    stw 0x24[$r0.1] = $r0.3
;;
c0    mov $r0.3 = $r0.57
;;
.call core_list_find, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_list_find
;;
c0    ldw.d $r0.2 = 0[$r0.57]
c0    cmpeq $b0.0 = $r0.3, $r0.0
;;
c0    ldw $r0.60 = 0x24[$r0.1]
;;
;;
c0    slct $r0.58 = $b0.0, $r0.2, $r0.3
;;
;;
;;
-- core_list_join_L17?3
c0    cmpne $b0.0 = $r0.58, $r0.0
c0    ldw.d $r0.2 = 4[$r0.57]
c0    mov $r0.4 = $r0.59
;;
;;
;;
c0    ldh.d $r0.3 = 0[$r0.2]
c0    brf $b0.0, core_list_join_L18?3
;;
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crc16
;;
c0    ldw $r0.58 = 0[$r0.58]
c0    mov $r0.59 = $r0.3
;;
;;
c0    goto core_list_join_L17?3
;;
-- core_list_join_L18?3
c0    ldw $r0.4 = 0[$r0.57]
;;
;;
.call core_list_undo_remove, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    mov $r0.3 = $r0.60
c0    call $l0.0 = FUNC_core_list_undo_remove
;;
c0    mov $r0.5 = $r0.0
c0    mov $r0.4 = cmp_idx
c0    mov $r0.3 = $r0.57
;;
.call core_list_mergesort, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_list_mergesort
;;
c0    ldw $r0.58 = 0[$r0.3]
c0    mov $r0.57 = $r0.3
;;
;;
;;
-- core_list_join_L19?3
c0    cmpne $b0.0 = $r0.58, $r0.0
c0    ldw.d $r0.2 = 4[$r0.57]
c0    mov $r0.4 = $r0.59
;;
;;
;;
c0    ldh.d $r0.3 = 0[$r0.2]
c0    brf $b0.0, core_list_join_L20?3
;;
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crc16
;;
c0    ldw $r0.58 = 0[$r0.58]
c0    mov $r0.59 = $r0.3
;;
;;
c0    goto core_list_join_L19?3
;;
-- core_list_join_L20?3
c0    ldw $l0.0 = 0x14[$r0.1]
;;
c0    ldw $r0.63 = 0x40[$r0.1]
;;
c0    mov $r0.3 = $r0.59
c0    ldw $r0.62 = 0x3c[$r0.1]
;;
c0    ldw $r0.61 = 0x38[$r0.1]
;;
c0    ldw $r0.60 = 0x34[$r0.1]
;;
c0    ldw $r0.59 = 0x30[$r0.1]
;;
c0    ldw $r0.58 = 0x2c[$r0.1]
;;
c0    ldw $r0.57 = 0x28[$r0.1]
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.1 + 84, 12; $r0.3:u32,$r0.4:u32,$r0.5:u32)
-- FUNC_core_list_init
c0    add $r0.1 = $r0.1, (-0x60)
c0    mtb $b0.0 = $r0.0
c0    mov $r0.2 = 20
;;
c0    cmplt $r0.9 = $r0.2, $r0.0
c0    cmpgeu $r0.11 = $r0.3, 20
c0    mov $r0.12 = -1
c0    stw 0x18[$r0.1] = $l0.0
;;
c0    add $r0.14 = $r0.1, 0x14
c0    stw 0x20[$r0.1] = $r0.57
c0    mov $r0.13 = -32640
;;
c0    add $r0.57 = $r0.1, 0x10
c0    stw 0x24[$r0.1] = $r0.58
c0    mov $r0.15 = 32767
;;
c0    shru $r0.2 = $r0.2, $r0.9
c0    shru $r0.16 = $r0.3, $r0.9
c0    stw 0x28[$r0.1] = $r0.59
c0    mtb $b0.1 = $r0.9
;;
c0    add $r0.58 = $r0.1, 0x58
c0    stw 0x2c[$r0.1] = $r0.60
;;
c0    stw 0x30[$r0.1] = $r0.61
c0    mov $r0.6 = $r0.57
;;
c0    addcg $r0.9, $b0.2 = $r0.16, $r0.16, $b0.0
c0    stw 0x34[$r0.1] = $r0.62
;;
c0    divs $r0.9, $b0.2 = $r0.0, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.9, $r0.9, $b0.0
c0    stw 0x38[$r0.1] = $r0.63
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
c0    stw 0x3c[$r0.1] = $r0.4
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
c0    stw 0x40[$r0.1] = $r0.14
;;
c0    stw 0x54[$r0.1] = $r0.3
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    stw 0x5c[$r0.1] = $r0.5
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
c0    mov $r0.3 = $r0.4
c0    mov $r0.5 = $r0.58
;;
c0    stw 0x58[$r0.1] = $r0.4
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    divs $r0.9, $b0.2 = $r0.9, $r0.2, $b0.2
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.9, $b0.3 = $r0.9, $r0.2, $b0.3
c0    addcg $r0.17, $b0.2 = $r0.16, $r0.16, $b0.2
;;
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
c0    cmpge $r0.9 = $r0.9, $r0.0
;;
c0    orc $r0.16 = $r0.16, $r0.0
;;
;;
;;
c0    sh1add $r0.16 = $r0.16, $r0.9
;;
;;
;;
c0    slct $r0.11 = $b0.1, $r0.11, $r0.16
;;
;;
;;
c0    add $r0.59 = $r0.11, -2
;;
;;
;;
c0    sh3add $r0.63 = $r0.59, $r0.4
;;
;;
;;
c0    sh2add $r0.10 = $r0.59, $r0.63
c0    stw 0x10[$r0.1] = $r0.63
c0    mov $r0.7 = $r0.63
;;
c0    stw 0[$r0.4] = $r0.0
;;
c0    ldw $r0.2 = 0x10[$r0.1]
;;
c0    stw 0x1c[$r0.1] = $r0.10
c0    mov $r0.8 = $r0.10
;;
;;
c0    stw 4[$r0.4] = $r0.2
;;
c0    sth 2[$r0.2] = $r0.0
;;
c0    ldw $r0.4 = 4[$r0.4]
;;
;;
;;
c0    sth 0[$r0.4] = $r0.13
;;
c0    ldw $r0.2 = 0x58[$r0.1]
c0    mov $r0.4 = $r0.14
;;
c0    ldw $r0.9 = 0x10[$r0.1]
;;
c0    sth 0x16[$r0.1] = $r0.15
;;
c0    add $r0.2 = $r0.2, 8
c0    sth 0x14[$r0.1] = $r0.12
;;
c0    add $r0.9 = $r0.9, 4
;;
;;
c0    stw 0x58[$r0.1] = $r0.2
;;
.call core_list_insert_new, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret($r0.3:u32)
c0    stw 0x10[$r0.1] = $r0.9
c0    call $l0.0 = FUNC_core_list_insert_new
;;
c0    mov $r0.57 = $r0.0
c0    ldw $r0.60 = 0x40[$r0.1]
c0    mov $r0.61 = $r0.58
c0    mov $r0.62 = $r0.57
;;
c0    ldw $r0.59 = 0x3c[$r0.1]
c0    mov $r0.58 = $r0.59
;;
c0    ldw $r0.10 = 0x1c[$r0.1]
;;
;;
;;
-- core_list_join_L21?3
c0    cmpltu $b0.0 = $r0.57, $r0.58
c0    ldh.d $r0.2 = 0x5e[$r0.1]
c0    and $r0.9 = $r0.57, 7
;;
c0    mov $r0.3 = $r0.59
c0    mov $r0.4 = $r0.60
c0    mov $r0.5 = $r0.61
c0    mov $r0.6 = $r0.62
;;
c0    mov $r0.7 = $r0.63
c0    mov $r0.8 = $r0.10
;;
c0    xor $r0.2 = $r0.57, $r0.2
c0    brf $b0.0, core_list_join_L22?3
;;
;;
;;
c0    and $r0.2 = $r0.2, 15
;;
;;
;;
c0    zxth $r0.2 = $r0.2
;;
;;
;;
c0    shl $r0.2 = $r0.2, 3
;;
;;
;;
c0    or $r0.9 = $r0.9, $r0.2
;;
;;
;;
c0    zxth $r0.2 = $r0.9
;;
;;
;;
c0    shl $r0.2 = $r0.2, 8
;;
;;
;;
c0    or $r0.9 = $r0.9, $r0.2
;;
;;
;;
.call core_list_insert_new, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret($r0.3:u32)
c0    sth 0x14[$r0.1] = $r0.9
c0    call $l0.0 = FUNC_core_list_insert_new
;;
c0    add $r0.57 = $r0.57, 1
c0    ldw $r0.10 = 0x1c[$r0.1]
;;
;;
c0    goto core_list_join_L21?3
;;
-- core_list_join_L22?3
c0    ldw $r0.7 = 0[$r0.59]
c0    cmpgeu $r0.6 = $r0.58, 5
c0    mov $r0.3 = 5
c0    mtb $b0.0 = $r0.0
;;
c0    mov $r0.4 = 1
c0    cmplt $r0.8 = $r0.3, $r0.0
;;
;;
c0    mov $r0.2 = $r0.7
;;
c0    shru $r0.3 = $r0.3, $r0.8
c0    shru $r0.58 = $r0.58, $r0.8
c0    mtb $b0.1 = $r0.8
;;
;;
;;
c0    addcg $r0.7, $b0.2 = $r0.58, $r0.58, $b0.0
;;
c0    divs $r0.7, $b0.2 = $r0.0, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.7, $r0.7, $b0.0
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    divs $r0.7, $b0.2 = $r0.7, $r0.3, $b0.2
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
;;
c0    divs $r0.7, $b0.3 = $r0.7, $r0.3, $b0.3
c0    addcg $r0.8, $b0.2 = $r0.58, $r0.58, $b0.2
;;
c0    addcg $r0.58, $b0.3 = $r0.8, $r0.8, $b0.3
c0    cmpge $r0.7 = $r0.7, $r0.0
;;
c0    orc $r0.58 = $r0.58, $r0.0
;;
;;
;;
c0    sh1add $r0.58 = $r0.58, $r0.7
;;
;;
;;
c0    slct $r0.5 = $b0.1, $r0.6, $r0.58
;;
;;
;;
-- core_list_join_L23?3
c0    ldw $r0.3 = 0[$r0.2]
c0    cmpltu $b0.0 = $r0.4, $r0.5
c0    add $r0.6 = $r0.4, 1
;;
c0    ldw.d $r0.7 = 4[$r0.2]
;;
;;
c0    cmpne $b0.1 = $r0.3, $r0.0
c0    cmpltu $b0.2 = $r0.6, $r0.5
c0    add $r0.8 = $r0.6, 1
;;
;;
;;
c0    cmpltu $b0.1 = $r0.8, $r0.5
c0    brf $b0.1, core_list_join_L24?3
;;
c0    brf $b0.0, core_list_join_L25?3
;;
c0    sth 2[$r0.7] = $r0.4
c0    add $r0.3 = $r0.8, 1
;;
-- core_list_join_L26?3
c0    ldw $r0.2 = 0[$r0.2]
;;
;;
c0    mov $r0.4 = $r0.3
;;
c0    ldw $r0.3 = 0[$r0.2]
;;
c0    ldw.d $r0.7 = 4[$r0.2]
;;
;;
c0    cmpne $b0.0 = $r0.3, $r0.0
;;
;;
;;
c0    brf $b0.0, core_list_join_L27?3
;;
c0    brf $b0.2, core_list_join_L28?3
;;
c0    sth 2[$r0.7] = $r0.6
;;
-- core_list_join_L29?3
c0    ldw $r0.2 = 0[$r0.2]
;;
;;
;;
c0    ldw $r0.3 = 0[$r0.2]
;;
c0    ldw.d $r0.6 = 4[$r0.2]
;;
;;
c0    cmpne $b0.0 = $r0.3, $r0.0
;;
;;
;;
c0    brf $b0.0, core_list_join_L30?3
;;
c0    brf $b0.1, core_list_join_L31?3
;;
c0    sth 2[$r0.6] = $r0.8
;;
-- core_list_join_L32?3
c0    ldw $r0.2 = 0[$r0.2]
;;
;;
c0    goto core_list_join_L23?3
;;
-- core_list_join_L31?3
c0    ldh $r0.3 = 0x5e[$r0.1]
c0    add $r0.4 = $r0.8, 1
;;
c0    ldw $r0.6 = 4[$r0.2]
;;
;;
c0    xor $r0.3 = $r0.3, $r0.8
c0    and $r0.7 = $r0.4, 7
;;
;;
;;
c0    shl $r0.7 = $r0.7, 8
;;
;;
;;
c0    or $r0.3 = $r0.3, $r0.7
;;
;;
;;
c0    and $r0.3 = $r0.3, 16383
;;
;;
;;
c0    sth 2[$r0.6] = $r0.3
c0    goto core_list_join_L32?3
;;
-- core_list_join_L30?3
c0    mov $r0.5 = $r0.0
c0    mov $r0.4 = cmp_idx
c0    mov $r0.3 = $r0.59
;;
.call core_list_mergesort, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_list_mergesort
;;
c0    goto core_list_join_L33?3
;;
-- core_list_join_L28?3
c0    ldh $r0.3 = 0x5e[$r0.1]
c0    add $r0.8 = $r0.6, 1
;;
c0    ldw $r0.7 = 4[$r0.2]
;;
;;
c0    xor $r0.3 = $r0.3, $r0.6
c0    and $r0.6 = $r0.8, 7
c0    cmpltu $b0.1 = $r0.8, $r0.5
c0    add $r0.4 = $r0.8, 1
;;
;;
;;
c0    shl $r0.6 = $r0.6, 8
;;
;;
;;
c0    or $r0.3 = $r0.3, $r0.6
;;
;;
;;
c0    and $r0.3 = $r0.3, 16383
;;
;;
;;
c0    sth 2[$r0.7] = $r0.3
c0    goto core_list_join_L29?3
;;
-- core_list_join_L27?3
c0    mov $r0.5 = $r0.0
c0    mov $r0.4 = cmp_idx
c0    mov $r0.3 = $r0.59
;;
.call core_list_mergesort, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_list_mergesort
;;
c0    goto core_list_join_L33?3
;;
-- core_list_join_L25?3
c0    ldh $r0.3 = 0x5e[$r0.1]
c0    add $r0.6 = $r0.4, 1
;;
c0    ldw $r0.7 = 4[$r0.2]
;;
;;
c0    xor $r0.3 = $r0.3, $r0.4
c0    and $r0.4 = $r0.6, 7
c0    cmpltu $b0.2 = $r0.6, $r0.5
c0    add $r0.8 = $r0.6, 1
;;
;;
;;
c0    shl $r0.4 = $r0.4, 8
c0    cmpltu $b0.1 = $r0.8, $r0.5
;;
;;
;;
c0    or $r0.3 = $r0.3, $r0.4
;;
;;
;;
c0    and $r0.3 = $r0.3, 16383
;;
;;
;;
c0    sth 2[$r0.7] = $r0.3
c0    add $r0.3 = $r0.8, 1
c0    goto core_list_join_L26?3
;;
-- core_list_join_L24?3
c0    mov $r0.5 = $r0.0
c0    mov $r0.4 = cmp_idx
c0    mov $r0.3 = $r0.59
;;
.call core_list_mergesort, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_core_list_mergesort
;;
-- core_list_join_L33?3
c0    ldw $l0.0 = 0x18[$r0.1]
;;
c0    ldw $r0.63 = 0x38[$r0.1]
;;
c0    ldw $r0.62 = 0x34[$r0.1]
;;
c0    ldw $r0.61 = 0x30[$r0.1]
;;
c0    ldw $r0.60 = 0x2c[$r0.1]
;;
c0    ldw $r0.59 = 0x28[$r0.1]
;;
c0    ldw $r0.58 = 0x24[$r0.1]
;;
c0    ldw $r0.57 = 0x20[$r0.1]
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32)
-- FUNC_core_list_insert_new
c0    add $r0.1 = $r0.1, (-0x20)
c0    ldw $r0.2 = 0[$r0.5]
c0    mov $r0.9 = $r0.3
;;
c0    mov $r0.3 = $r0.0
c0    stw 0x10[$r0.1] = $l0.0
;;
;;
c0    add $r0.2 = $r0.2, 8
;;
;;
;;
c0    cmpgeu $b0.0 = $r0.2, $r0.7
;;
;;
;;
c0    brf $b0.0, core_list_join_L34?3
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- core_list_join_L34?3
c0    ldw $r0.2 = 0[$r0.6]
c0    mov $r0.3 = $r0.0
;;
;;
;;
c0    add $r0.2 = $r0.2, 4
;;
;;
;;
c0    cmpgeu $b0.0 = $r0.2, $r0.8
;;
;;
;;
c0    brf $b0.0, core_list_join_L35?3
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- core_list_join_L35?3
c0    ldw $r0.2 = 0[$r0.5]
;;
;;
;;
c0    add $r0.7 = $r0.2, 8
c0    stw 0x14[$r0.1] = $r0.2
;;
;;
;;
c0    stw 0[$r0.5] = $r0.7
;;
c0    ldw $r0.5 = 0[$r0.9]
;;
;;
;;
c0    stw 0[$r0.2] = $r0.5
;;
c0    stw 0[$r0.9] = $r0.2
;;
c0    ldw $r0.5 = 0[$r0.6]
;;
;;
;;
c0    stw 4[$r0.2] = $r0.5
;;
c0    ldw $r0.5 = 0[$r0.6]
;;
;;
;;
c0    add $r0.5 = $r0.5, 4
;;
;;
;;
c0    stw 0[$r0.6] = $r0.5
;;
c0    ldw $r0.3 = 4[$r0.2]
;;
;;
.call copy_info, caller, arg($r0.3:u32,$r0.4:u32), ret()
c0    call $l0.0 = FUNC_copy_info
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    ldw $r0.3 = 0x14[$r0.1]
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32)
-- FUNC_core_list_remove
c0    ldw $r0.2 = 0[$r0.3]
;;
c0    ldw $r0.4 = 4[$r0.3]
;;
;;
c0    ldw $r0.5 = 4[$r0.2]
;;
;;
;;
c0    stw 4[$r0.3] = $r0.5
;;
c0    stw 4[$r0.2] = $r0.4
;;
c0    ldw $r0.4 = 0[$r0.3]
;;
;;
;;
c0    ldw $r0.4 = 0[$r0.4]
;;
;;
;;
c0    stw 0[$r0.3] = $r0.4
c0    mov $r0.3 = $r0.2
;;
.return ret($r0.3:u32)
c0    stw 0[$r0.2] = $r0.0
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32)
-- FUNC_core_list_undo_remove
c0    ldw $r0.2 = 4[$r0.4]
;;
c0    ldw $r0.5 = 4[$r0.3]
;;
;;
c0    stw 4[$r0.3] = $r0.2
;;
c0    ldw $r0.2 = 0[$r0.4]
;;
c0    stw 4[$r0.4] = $r0.5
;;
;;
c0    stw 0[$r0.3] = $r0.2
;;
.return ret($r0.3:u32)
c0    stw 0[$r0.4] = $r0.3
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32)
-- FUNC_core_list_find
c0    ldh $r0.5 = 2[$r0.4]
c0    mov $r0.2 = $r0.3
;;
;;
;;
c0    cmpge $b0.0 = $r0.5, $r0.0
c0    mov $r0.4 = $r0.5
c0    mov $r0.3 = $r0.4
;;
;;
;;
c0    brf $b0.0, core_list_join_L36?3
;;
-- core_list_join_L37?3
c0    ldw.d $r0.3 = 4[$r0.2]
;;
c0    ldw.d $r0.5 = 0[$r0.2]
;;
;;
c0    ldh.d $r0.3 = 2[$r0.3]
;;
c0    ldw.d $r0.6 = 4[$r0.5]
;;
c0    ldw.d $r0.7 = 0[$r0.5]
;;
c0    cmpne $r0.3 = $r0.3, $r0.4
;;
c0    ldh.d $r0.6 = 2[$r0.6]
;;
c0    ldw.d $r0.8 = 4[$r0.7]
;;
c0    andl $b0.0 = $r0.2, $r0.3
c0    ldw.d $r0.3 = 0[$r0.7]
;;
c0    cmpne $r0.6 = $r0.6, $r0.4
;;
c0    ldh.d $r0.8 = 2[$r0.8]
;;
c0    ldw.d $r0.9 = 4[$r0.3]
c0    brf $b0.0, core_list_join_L38?3
;;
c0    andl $b0.0 = $r0.5, $r0.6
c0    ldw.d $r0.2 = 0[$r0.3]
;;
c0    cmpne $r0.8 = $r0.8, $r0.4
;;
c0    ldh.d $r0.9 = 2[$r0.9]
;;
c0    brf $b0.0, core_list_join_L39?3
;;
c0    andl $b0.0 = $r0.7, $r0.8
;;
c0    cmpne $r0.9 = $r0.9, $r0.4
;;
;;
c0    brf $b0.0, core_list_join_L40?3
;;
c0    andl $b0.0 = $r0.3, $r0.9
;;
;;
;;
c0    brf $b0.0, core_list_join_L41?3
;;
c0    goto core_list_join_L37?3
;;
-- core_list_join_L41?3
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_list_join_L40?3
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.7
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_list_join_L39?3
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.5
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_list_join_L38?3
c0    mov $r0.3 = $r0.2
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_list_join_L36?3
c0    ldh.d $r0.4 = 0[$r0.3]
;;
;;
;;
-- core_list_join_L42?3
c0    ldw.d $r0.3 = 4[$r0.2]
;;
c0    ldw.d $r0.5 = 0[$r0.2]
;;
;;
c0    ldh.d $r0.3 = 0[$r0.3]
;;
c0    ldw.d $r0.6 = 4[$r0.5]
;;
c0    ldw.d $r0.7 = 0[$r0.5]
;;
c0    and $r0.3 = $r0.3, 255
;;
c0    ldh.d $r0.6 = 0[$r0.6]
;;
c0    ldw.d $r0.8 = 4[$r0.7]
;;
c0    cmpne $r0.3 = $r0.3, $r0.4
c0    ldw.d $r0.9 = 0[$r0.7]
;;
c0    and $r0.6 = $r0.6, 255
;;
c0    ldh.d $r0.8 = 0[$r0.8]
;;
c0    andl $b0.0 = $r0.2, $r0.3
c0    ldw.d $r0.3 = 4[$r0.9]
;;
c0    cmpne $r0.6 = $r0.6, $r0.4
;;
c0    and $r0.8 = $r0.8, 255
;;
c0    ldh.d $r0.3 = 0[$r0.3]
c0    brf $b0.0, core_list_join_L43?3
;;
c0    andl $b0.0 = $r0.5, $r0.6
c0    ldw.d $r0.2 = 0[$r0.9]
;;
c0    cmpne $r0.8 = $r0.8, $r0.4
;;
c0    and $r0.3 = $r0.3, 255
;;
c0    brf $b0.0, core_list_join_L44?3
;;
c0    andl $b0.0 = $r0.7, $r0.8
;;
c0    cmpne $r0.3 = $r0.3, $r0.4
;;
;;
c0    brf $b0.0, core_list_join_L45?3
;;
c0    andl $b0.0 = $r0.9, $r0.3
;;
;;
;;
c0    brf $b0.0, core_list_join_L46?3
;;
c0    goto core_list_join_L42?3
;;
-- core_list_join_L46?3
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.9
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_list_join_L45?3
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.7
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_list_join_L44?3
;;
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.5
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_list_join_L43?3
;;
;;
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.2
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32)
-- FUNC_core_list_reverse
c0    mov $r0.4 = $r0.0
c0    mov $r0.2 = $r0.3
;;
-- core_list_join_L47?3
c0    cmpne $b0.0 = $r0.2, $r0.0
c0    ldw.d $r0.3 = 0[$r0.2]
;;
;;
;;
c0    cmpne $b0.0 = $r0.3, $r0.0
c0    brf $b0.0, core_list_join_L48?3
;;
c0    stw 0[$r0.2] = $r0.4
;;
c0    ldw.d $r0.5 = 0[$r0.3]
;;
c0    brf $b0.0, core_list_join_L49?3
;;
c0    stw 0[$r0.3] = $r0.2
;;
c0    cmpne $b0.0 = $r0.5, $r0.0
c0    ldw.d $r0.6 = 0[$r0.5]
;;
;;
;;
c0    cmpne $b0.0 = $r0.6, $r0.0
c0    mov $r0.4 = $r0.6
c0    brf $b0.0, core_list_join_L50?3
;;
c0    stw 0[$r0.5] = $r0.3
;;
c0    ldw.d $r0.2 = 0[$r0.6]
;;
c0    brf $b0.0, core_list_join_L51?3
;;
c0    stw 0[$r0.6] = $r0.5
c0    goto core_list_join_L47?3
;;
-- core_list_join_L51?3
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.5
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_list_join_L50?3
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_list_join_L49?3
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.2
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_list_join_L48?3
c0    mov $r0.3 = $r0.4
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
-- FUNC_core_list_mergesort
c0    add $r0.1 = $r0.1, (-0x40)
c0    mov $r0.6 = 1
c0    mov $r0.13 = $r0.3
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    stw 0x2c[$r0.1] = $r0.60
;;
c0    stw 0x30[$r0.1] = $r0.59
;;
c0    stw 0x34[$r0.1] = $r0.58
;;
c0    mov $r0.58 = $r0.4
c0    stw 0x38[$r0.1] = $r0.57
;;
c0    mov $r0.57 = $r0.5
;;
-- core_list_join_L52?3
c0    mov $r0.4 = $r0.0
c0    mov $r0.14 = $r0.0
c0    mov $r0.10 = $r0.13
c0    mov $r0.13 = $r0.0
;;
-- core_list_join_L53?3
c0    cmpne $b0.0 = $r0.10, $r0.0
c0    rsub $r0.11 = 3, $r0.6
c0    mov $r0.3 = 1
c0    mov $r0.5 = $r0.10
;;
c0    mov $r0.7 = $r0.0
;;
;;
c0    mov $r0.2 = $r0.11
c0    mov $r0.11 = $r0.6
c0    brf $b0.0, core_list_join_L54?3
;;
c0    add $r0.4 = $r0.4, 1
;;
;;
;;
c0    mov $r0.12 = $r0.4
;;
-- core_list_join_L55?3
c0    cmplt $b0.0 = $r0.2, 3
c0    ldw.d $r0.6 = 0[$r0.5]
c0    mov $r0.4 = $r0.3
c0    cmplt $b0.1 = $r0.2, 2
;;
c0    cmplt $b0.2 = $r0.2, 1
c0    cmplt $b0.3 = $r0.2, $r0.0
c0    add $r0.3 = $r0.3, 4
c0    add $r0.2 = $r0.2, 4
;;
;;
c0    cmpeq $b0.0 = $r0.6, $r0.0
c0    ldw.d $r0.8 = 0[$r0.6]
c0    brf $b0.0, core_list_join_L56?3
;;
;;
;;
c0    cmpeq $b0.0 = $r0.8, $r0.0
c0    ldw.d $r0.9 = 0[$r0.8]
c0    br $b0.0, core_list_join_L57?3
;;
c0    brf $b0.1, core_list_join_L58?3
;;
;;
c0    cmpeq $b0.0 = $r0.9, $r0.0
c0    ldw.d $r0.5 = 0[$r0.9]
c0    br $b0.0, core_list_join_L59?3
;;
c0    brf $b0.2, core_list_join_L60?3
;;
;;
c0    cmpeq $b0.0 = $r0.5, $r0.0
c0    br $b0.0, core_list_join_L61?3
;;
c0    brf $b0.3, core_list_join_L62?3
;;
c0    add $r0.7 = $r0.7, 4
;;
c0    br $b0.0, core_list_join_L63?3
;;
c0    goto core_list_join_L55?3
;;
-- core_list_join_L63?3
c0    mov $r0.4 = $r0.5
c0    mov $r0.2 = $r0.11
c0    mov $r0.59 = $r0.11
c0    mov $r0.3 = $r0.4
;;
c0    add $r0.5 = $r0.3, 3
c0    mov $r0.60 = $r0.12
c0    mov $r0.9 = $r0.13
;;
;;
c0    goto core_list_join_L64?3
;;
-- core_list_join_L65?3
c0    cmpgt $r0.6 = $r0.5, $r0.0
c0    cmpgt $r0.3 = $r0.2, $r0.0
c0    cmpeq $b0.0 = $r0.5, $r0.0
c0    mov $r0.7 = $r0.4
;;
c0    cmpne $b0.1 = $r0.8, $r0.0
;;
;;
c0    andl $r0.3 = $r0.3, $r0.4
;;
;;
;;
c0    orl $b0.2 = $r0.6, $r0.3
;;
;;
;;
c0    brf $b0.2, core_list_join_L66?3
;;
c0    brf $b0.0, core_list_join_L67?3
;;
c0    ldw $r0.4 = 0[$r0.4]
c0    add $r0.2 = $r0.2, -1
;;
;;
c0    brf $b0.1, core_list_join_L68?3
;;
-- core_list_join_L69?3
c0    stw 0[$r0.8] = $r0.7
;;
-- core_list_join_L70?3
c0    mov $r0.8 = $r0.7
c0    goto core_list_join_L65?3
;;
-- core_list_join_L68?3
c0    mov $r0.9 = $r0.7
c0    goto core_list_join_L70?3
;;
-- core_list_join_L67?3
c0    nandl $b0.0 = $r0.2, $r0.4
c0    mov $r0.7 = $r0.10
;;
;;
;;
c0    brf $b0.0, core_list_join_L71?3
;;
c0    ldw $r0.10 = 0[$r0.10]
c0    add $r0.5 = $r0.5, -1
c0    brf $b0.1, core_list_join_L72?3
;;
;;
c0    goto core_list_join_L69?3
;;
-- core_list_join_L72?3
;;
c0    goto core_list_join_L68?3
;;
-- core_list_join_L71?3
c0    stw 0x14[$r0.1] = $r0.9
c0    mov $l0.0 = $r0.58
;;
c0    stw 0x18[$r0.1] = $r0.8
;;
c0    stw 0x1c[$r0.1] = $r0.2
;;
c0    stw 0x20[$r0.1] = $r0.5
;;
c0    stw 0x24[$r0.1] = $r0.4
c0    mov $r0.5 = $r0.57
;;
c0    stw 0x28[$r0.1] = $r0.10
;;
c0    ldw $r0.3 = 4[$r0.10]
;;
c0    ldw $r0.4 = 4[$r0.4]
;;
;;
.call $l0.0, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:s32)
c0    call $l0.0 = $l0.0
;;
c0    cmpgt $b0.0 = $r0.3, $r0.0
c0    ldw $r0.10 = 0x28[$r0.1]
;;
c0    ldw $r0.4 = 0x24[$r0.1]
;;
c0    ldw $r0.5 = 0x20[$r0.1]
;;
c0    ldw.d $r0.3 = 0[$r0.10]
;;
c0    ldw.d $r0.6 = 0[$r0.4]
c0    slct $r0.7 = $b0.0, $r0.4, $r0.10
;;
c0    add $r0.11 = $r0.5, -1
c0    ldw $r0.2 = 0x1c[$r0.1]
;;
c0    slct $r0.10 = $b0.0, $r0.10, $r0.3
c0    ldw $r0.8 = 0x18[$r0.1]
;;
c0    slct $r0.4 = $b0.0, $r0.6, $r0.4
c0    ldw $r0.9 = 0x14[$r0.1]
;;
c0    slct $r0.5 = $b0.0, $r0.5, $r0.11
c0    add $r0.3 = $r0.2, -1
;;
c0    cmpne $b0.1 = $r0.8, $r0.0
;;
;;
c0    slct $r0.2 = $b0.0, $r0.3, $r0.2
;;
c0    brf $b0.1, core_list_join_L73?3
;;
c0    goto core_list_join_L69?3
;;
-- core_list_join_L73?3
c0    goto core_list_join_L68?3
;;
-- core_list_join_L66?3
c0    mov $r0.10 = $r0.4
c0    mov $r0.13 = $r0.9
c0    mov $r0.14 = $r0.8
c0    mov $r0.6 = $r0.59
;;
c0    mov $r0.4 = $r0.60
c0    goto core_list_join_L53?3
;;
-- core_list_join_L62?3
c0    add $r0.5 = $r0.7, 3
c0    mov $r0.4 = $r0.9
c0    mov $r0.2 = $r0.11
c0    mov $r0.59 = $r0.11
;;
c0    mov $r0.60 = $r0.12
c0    mov $r0.9 = $r0.13
;;
c0    goto core_list_join_L64?3
;;
-- core_list_join_L61?3
c0    add $r0.5 = $r0.7, 3
c0    mov $r0.4 = $r0.9
c0    mov $r0.2 = $r0.11
c0    mov $r0.59 = $r0.11
;;
c0    mov $r0.60 = $r0.12
c0    mov $r0.9 = $r0.13
;;
c0    goto core_list_join_L64?3
;;
-- core_list_join_L60?3
c0    add $r0.7 = $r0.7, 2
c0    mov $r0.4 = $r0.8
c0    mov $r0.2 = $r0.11
c0    mov $r0.59 = $r0.11
;;
c0    mov $r0.60 = $r0.12
c0    mov $r0.9 = $r0.13
;;
;;
c0    mov $r0.5 = $r0.7
c0    goto core_list_join_L64?3
;;
-- core_list_join_L59?3
c0    add $r0.7 = $r0.7, 2
c0    mov $r0.4 = $r0.8
c0    mov $r0.2 = $r0.11
c0    mov $r0.59 = $r0.11
;;
c0    mov $r0.60 = $r0.12
c0    mov $r0.9 = $r0.13
;;
;;
c0    mov $r0.5 = $r0.7
c0    goto core_list_join_L64?3
;;
-- core_list_join_L58?3
c0    add $r0.5 = $r0.7, 1
c0    mov $r0.4 = $r0.6
c0    mov $r0.2 = $r0.11
c0    mov $r0.59 = $r0.11
;;
c0    mov $r0.60 = $r0.12
c0    mov $r0.9 = $r0.13
;;
c0    goto core_list_join_L64?3
;;
-- core_list_join_L57?3
c0    add $r0.5 = $r0.7, 1
c0    mov $r0.4 = $r0.6
c0    mov $r0.2 = $r0.11
c0    mov $r0.59 = $r0.11
;;
c0    mov $r0.60 = $r0.12
;;
c0    mov $r0.9 = $r0.13
c0    goto core_list_join_L64?3
;;
-- core_list_join_L56?3
c0    mov $r0.4 = $r0.5
c0    mov $r0.2 = $r0.11
c0    mov $r0.9 = $r0.13
c0    mov $r0.60 = $r0.12
;;
c0    mov $r0.5 = $r0.7
c0    mov $r0.59 = $r0.11
;;
-- core_list_join_L64?3
c0    mov $r0.8 = $r0.14
c0    goto core_list_join_L65?3
;;
-- core_list_join_L54?3
c0    stw 0[$r0.14] = $r0.0
c0    cmple $b0.0 = $r0.4, 1
c0    shl $r0.11 = $r0.11, 1
;;
;;
;;
c0    mov $r0.6 = $r0.11
c0    br $b0.0, core_list_join_L74?3
;;
c0    goto core_list_join_L52?3
;;
-- core_list_join_L74?3
c0    mov $r0.3 = $r0.13
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    ldw $r0.60 = 0x2c[$r0.1]
;;
c0    ldw $r0.59 = 0x30[$r0.1]
;;
c0    ldw $r0.58 = 0x34[$r0.1]
;;
c0    ldw $r0.57 = 0x38[$r0.1]
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
ENDOFFILE: core_list_join
FILE: core_matrix
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
-- FUNC_core_bench_matrix
c0    add $r0.1 = $r0.1, (-0x20)
c0    sxth $r0.7 = $r0.4
c0    ldw $r0.2 = 0[$r0.3]
;;
c0    zxth $r0.8 = $r0.5
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    ldw $r0.4 = 12[$r0.3]
;;
c0    ldw $r0.5 = 4[$r0.3]
;;
c0    stw 0x14[$r0.1] = $r0.8
;;
c0    ldw $r0.6 = 8[$r0.3]
c0    mov $r0.3 = $r0.2
;;
;;
.call matrix_test, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_matrix_test
;;
c0    ldw $r0.4 = 0x14[$r0.1]
;;
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crc16
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32)
-- FUNC_matrix_test
c0    add $r0.1 = $r0.1, (-0x40)
c0    sxth $r0.2 = $r0.7
;;
c0    or $r0.7 = $r0.7, 61440
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    stw 0x14[$r0.1] = $r0.6
;;
c0    stw 0x18[$r0.1] = $r0.4
;;
c0    sxth $r0.6 = $r0.7
c0    mov $r0.4 = $r0.5
c0    stw 0x1c[$r0.1] = $r0.5
;;
c0    stw 0x20[$r0.1] = $r0.3
c0    mov $r0.5 = $r0.2
;;
c0    stw 0x24[$r0.1] = $r0.2
;;
.call matrix_add_const, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret()
c0    stw 0x28[$r0.1] = $r0.6
c0    call $l0.0 = FUNC_matrix_add_const
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
c0    ldw $r0.5 = 0x1c[$r0.1]
;;
c0    ldw $r0.3 = 0x20[$r0.1]
;;
c0    ldw $r0.6 = 0x24[$r0.1]
;;
;;
.call matrix_mul_const, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:s32), ret()
c0    call $l0.0 = FUNC_matrix_mul_const
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
c0    ldw $r0.3 = 0x20[$r0.1]
;;
c0    ldw $r0.5 = 0x28[$r0.1]
;;
;;
.call matrix_sum, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_matrix_sum
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    mov $r0.4 = $r0.0
c0    call $l0.0 = FUNC_crc16
;;
c0    stw 0x2c[$r0.1] = $r0.3
;;
c0    ldw $r0.6 = 0x14[$r0.1]
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
c0    ldw $r0.5 = 0x1c[$r0.1]
;;
c0    ldw $r0.3 = 0x20[$r0.1]
;;
;;
.call matrix_mul_vect, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
c0    call $l0.0 = FUNC_matrix_mul_vect
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
c0    ldw $r0.3 = 0x20[$r0.1]
;;
c0    ldw $r0.5 = 0x28[$r0.1]
;;
;;
.call matrix_sum, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_matrix_sum
;;
c0    ldw $r0.4 = 0x2c[$r0.1]
;;
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crc16
;;
c0    stw 0x30[$r0.1] = $r0.3
;;
c0    ldw $r0.6 = 0x14[$r0.1]
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
c0    ldw $r0.5 = 0x1c[$r0.1]
;;
c0    ldw $r0.3 = 0x20[$r0.1]
;;
;;
.call matrix_mul_matrix, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
c0    call $l0.0 = FUNC_matrix_mul_matrix
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
c0    ldw $r0.3 = 0x20[$r0.1]
;;
c0    ldw $r0.5 = 0x28[$r0.1]
;;
;;
.call matrix_sum, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_matrix_sum
;;
c0    ldw $r0.4 = 0x30[$r0.1]
;;
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crc16
;;
c0    stw 0x34[$r0.1] = $r0.3
;;
c0    ldw $r0.6 = 0x14[$r0.1]
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
c0    ldw $r0.5 = 0x1c[$r0.1]
;;
c0    ldw $r0.3 = 0x20[$r0.1]
;;
;;
.call matrix_mul_matrix_bitextract, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
c0    call $l0.0 = FUNC_matrix_mul_matrix_bitextract
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
c0    ldw $r0.3 = 0x20[$r0.1]
;;
c0    ldw $r0.5 = 0x28[$r0.1]
;;
;;
.call matrix_sum, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_matrix_sum
;;
c0    ldw $r0.4 = 0x34[$r0.1]
;;
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crc16
;;
c0    stw 0x38[$r0.1] = $r0.3
;;
c0    ldw $r0.2 = 0x24[$r0.1]
;;
c0    ldw $r0.4 = 0x1c[$r0.1]
;;
c0    ldw $r0.3 = 0x20[$r0.1]
;;
c0    sub $r0.2 = $r0.0, $r0.2
;;
;;
;;
c0    sxth $r0.5 = $r0.2
;;
;;
.call matrix_add_const, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret()
c0    call $l0.0 = FUNC_matrix_add_const
;;
c0    ldw $r0.2 = 0x38[$r0.1]
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
c0    sxth $r0.3 = $r0.2
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:s32,$r0.6:u32)
-- FUNC_core_init_matrix
c0    cmpne $b0.0 = $r0.5, $r0.0
c0    mov $r0.13 = 4
;;
c0    mov $r0.12 = $r0.0
c0    mov $r0.18 = 1
c0    mov $r0.10 = 3
c0    mov $r0.8 = 2
;;
c0    mov $r0.4 = $r0.0
c0    mov $r0.6 = 1
c0    mov $r0.7 = $r0.6
c0    mov $r0.2 = $r0.4
;;
c0    slct $r0.19 = $b0.0, $r0.5, 1
c0    mov $r0.5 = $r0.3
c0    mov $r0.3 = $r0.7
;;
;;
;;
-- core_matrix_L0?3
c0    cmpltu $b0.0 = $r0.4, $r0.5
c0    shl $r0.7 = $r0.6, 3
c0    shl $r0.9 = $r0.8, 3
c0    shl $r0.11 = $r0.10, 3
;;
c0    shl $r0.14 = $r0.13, 3
;;
;;
c0    mpylu $r0.15 = $r0.7, $r0.6
c0    mpyhs $r0.7 = $r0.7, $r0.6
c0    add $r0.6 = $r0.6, 4
c0    brf $b0.0, core_matrix_L1?3
;;
c0    mpylu $r0.16 = $r0.9, $r0.8
c0    mpyhs $r0.9 = $r0.9, $r0.8
c0    add $r0.8 = $r0.8, 4
;;
c0    mpylu $r0.17 = $r0.11, $r0.10
c0    mpyhs $r0.11 = $r0.11, $r0.10
c0    add $r0.10 = $r0.10, 4
;;
c0    add $r0.15 = $r0.15, $r0.7
c0    mpylu $r0.7 = $r0.14, $r0.13
c0    mpyhs $r0.14 = $r0.14, $r0.13
c0    add $r0.13 = $r0.13, 4
;;
c0    add $r0.16 = $r0.16, $r0.9
;;
c0    add $r0.17 = $r0.17, $r0.11
;;
c0    cmpltu $b0.0 = $r0.15, $r0.5
c0    add $r0.4 = $r0.7, $r0.14
;;
c0    cmpltu $b0.1 = $r0.16, $r0.5
;;
c0    cmpltu $b0.2 = $r0.17, $r0.5
;;
c0    brf $b0.0, core_matrix_L2?3
;;
c0    brf $b0.1, core_matrix_L3?3
;;
c0    brf $b0.2, core_matrix_L4?3
;;
c0    add $r0.12 = $r0.12, 4
;;
;;
c0    goto core_matrix_L0?3
;;
-- core_matrix_L4?3
c0    add $r0.12 = $r0.12, 3
c0    mov $r0.4 = $r0.0
c0    mov $r0.3 = $r0.19
c0    mov $r0.23 = $r0.3
;;
;;
c0    add $r0.2 = $r0.2, -1
;;
c0    add $r0.8 = $r0.12, -1
c0    goto core_matrix_L5?3
;;
-- core_matrix_L6?3
c0    cmpltu $b0.0 = $r0.4, $r0.8
c0    mov $r0.13 = 2
c0    add $r0.12 = $r0.2, 1
c0    add $r0.14 = $r0.2, 2
;;
c0    mov $r0.9 = $r0.15
c0    mov $r0.7 = $r0.0
c0    mov $r0.10 = $r0.5
c0    mov $r0.11 = 1
;;
c0    mov $r0.6 = 65535
c0    mov $r0.18 = $r0.4
c0    mov $r0.19 = $r0.5
;;
c0    mov $r0.20 = $r0.15
c0    brf $b0.0, core_matrix_L7?3
;;
-- core_matrix_L8?3
c0    cmpltu $b0.0 = $r0.7, $r0.8
c0    mpylu $r0.4 = $r0.2, $r0.3
c0    mpyhs $r0.5 = $r0.2, $r0.3
c0    cmpltu $b0.1 = $r0.11, $r0.8
;;
c0    cmpltu $b0.2 = $r0.13, $r0.8
c0    add $r0.11 = $r0.11, 3
c0    add $r0.13 = $r0.13, 3
c0    add $r0.7 = $r0.7, 3
;;
;;
c0    add $r0.4 = $r0.4, $r0.5
c0    brf $b0.0, core_matrix_L9?3
;;
;;
;;
c0    cmplt $b0.0 = $r0.4, $r0.0
c0    add $r0.5 = $r0.4, $r0.6
;;
;;
;;
c0    slct $r0.5 = $b0.0, $r0.5, $r0.4
;;
;;
;;
c0    shr $r0.5 = $r0.5, 16
;;
;;
;;
c0    shl $r0.5 = $r0.5, 16
;;
;;
;;
c0    sub $r0.4 = $r0.4, $r0.5
;;
;;
;;
c0    add $r0.5 = $r0.2, $r0.4
c0    mpylu $r0.15 = $r0.12, $r0.4
c0    mpyhs $r0.16 = $r0.12, $r0.4
;;
;;
;;
c0    add $r0.17 = $r0.2, $r0.5
c0    sth 0[$r0.9] = $r0.5
c0    add $r0.15 = $r0.15, $r0.16
;;
;;
;;
c0    and $r0.17 = $r0.17, 255
c0    cmplt $b0.0 = $r0.15, $r0.0
c0    add $r0.5 = $r0.15, $r0.6
;;
;;
;;
c0    sth 0[$r0.10] = $r0.17
c0    slct $r0.5 = $b0.0, $r0.5, $r0.15
c0    brf $b0.1, core_matrix_L10?3
;;
;;
;;
c0    shr $r0.5 = $r0.5, 16
;;
;;
;;
c0    shl $r0.5 = $r0.5, 16
;;
;;
;;
c0    sub $r0.15 = $r0.15, $r0.5
;;
;;
;;
c0    add $r0.4 = $r0.12, $r0.15
c0    mpylu $r0.5 = $r0.14, $r0.15
c0    mpyhs $r0.16 = $r0.14, $r0.15
;;
;;
;;
c0    add $r0.17 = $r0.12, $r0.4
c0    sth 2[$r0.9] = $r0.4
c0    add $r0.5 = $r0.5, $r0.16
c0    add $r0.12 = $r0.12, 3
;;
;;
;;
c0    and $r0.17 = $r0.17, 255
c0    cmplt $b0.0 = $r0.5, $r0.0
c0    add $r0.4 = $r0.5, $r0.6
;;
;;
;;
c0    sth 2[$r0.10] = $r0.17
c0    slct $r0.4 = $b0.0, $r0.4, $r0.5
c0    brf $b0.2, core_matrix_L11?3
;;
c0    add $r0.2 = $r0.2, 3
;;
;;
c0    shr $r0.4 = $r0.4, 16
;;
;;
;;
c0    shl $r0.4 = $r0.4, 16
;;
;;
;;
c0    sub $r0.3 = $r0.5, $r0.4
;;
;;
;;
c0    add $r0.4 = $r0.14, $r0.3
;;
;;
;;
c0    add $r0.5 = $r0.14, $r0.4
c0    sth 4[$r0.9] = $r0.4
c0    add $r0.9 = $r0.9, 6
c0    add $r0.14 = $r0.14, 3
;;
;;
;;
c0    and $r0.5 = $r0.5, 255
;;
;;
;;
c0    sth 4[$r0.10] = $r0.5
c0    add $r0.10 = $r0.10, 6
;;
;;
c0    goto core_matrix_L8?3
;;
-- core_matrix_L11?3
c0    mov $r0.3 = $r0.15
c0    add $r0.2 = $r0.2, 2
;;
c0    add $r0.19 = $r0.21, $r0.19
c0    add $r0.20 = $r0.21, $r0.20
c0    add $r0.18 = $r0.18, 1
;;
c0    goto core_matrix_L12?3
;;
-- core_matrix_L10?3
c0    mov $r0.3 = $r0.4
c0    add $r0.2 = $r0.2, 1
;;
c0    add $r0.19 = $r0.21, $r0.19
c0    add $r0.20 = $r0.21, $r0.20
c0    add $r0.18 = $r0.18, 1
;;
c0    goto core_matrix_L12?3
;;
-- core_matrix_L9?3
c0    add $r0.19 = $r0.21, $r0.19
c0    add $r0.20 = $r0.21, $r0.20
c0    add $r0.18 = $r0.18, 1
;;
;;
-- core_matrix_L12?3
;;
c0    mov $r0.5 = $r0.19
c0    mov $r0.15 = $r0.20
c0    mov $r0.4 = $r0.18
c0    goto core_matrix_L6?3
;;
-- core_matrix_L7?3
c0    stw 4[$r0.23] = $r0.24
c0    shl $r0.2 = $r0.8, 1
c0    add $r0.4 = $r0.22, -1
c0    mov $r0.3 = $r0.8
;;
c0    stw 8[$r0.23] = $r0.22
;;
c0    stw 0[$r0.23] = $r0.8
;;
c0    mpylu $r0.5 = $r0.2, $r0.8
c0    mpyhs $r0.2 = $r0.2, $r0.8
;;
;;
;;
c0    add $r0.5 = $r0.5, $r0.2
;;
;;
;;
c0    add $r0.4 = $r0.4, $r0.5
;;
;;
;;
c0    and $r0.4 = $r0.4, (~0x3)
;;
;;
;;
c0    add $r0.4 = $r0.4, 4
;;
;;
;;
.return ret($r0.3:u32)
c0    stw 12[$r0.23] = $r0.4
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_matrix_L3?3
c0    add $r0.12 = $r0.12, 2
c0    mov $r0.4 = $r0.0
c0    mov $r0.3 = $r0.19
c0    mov $r0.23 = $r0.3
;;
;;
c0    add $r0.2 = $r0.2, -1
;;
c0    add $r0.8 = $r0.12, -1
c0    goto core_matrix_L5?3
;;
-- core_matrix_L2?3
c0    add $r0.12 = $r0.12, 1
c0    mov $r0.4 = $r0.0
c0    mov $r0.3 = $r0.19
c0    mov $r0.23 = $r0.3
;;
;;
c0    add $r0.2 = $r0.2, -1
;;
c0    add $r0.8 = $r0.12, -1
c0    goto core_matrix_L5?3
;;
-- core_matrix_L1?3
c0    add $r0.2 = $r0.2, -1
c0    mov $r0.4 = $r0.0
c0    mov $r0.23 = $r0.3
;;
c0    add $r0.8 = $r0.12, -1
c0    mov $r0.3 = $r0.19
;;
-- core_matrix_L5?3
;;
c0    and $r0.2 = $r0.2, (~0x3)
;;
c0    shl $r0.6 = $r0.8, 1
c0    shl $r0.21 = $r0.8, 1
;;
;;
c0    add $r0.24 = $r0.2, 4
;;
c0    mpylu $r0.7 = $r0.6, $r0.8
c0    mpyhs $r0.9 = $r0.6, $r0.8
;;
;;
c0    mov $r0.5 = $r0.24
c0    mov $r0.2 = $r0.18
;;
c0    add $r0.7 = $r0.7, $r0.9
;;
;;
;;
c0    add $r0.22 = $r0.24, $r0.7
;;
;;
;;
c0    mov $r0.15 = $r0.22
c0    goto core_matrix_L6?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
-- FUNC_matrix_sum
c0    sxth $r0.7 = $r0.5
c0    mov $r0.6 = $r0.0
;;
c0    shl $r0.23 = $r0.3, 2
c0    mov $r0.4 = $r0.0
c0    mov $r0.5 = $r0.0
c0    mov $r0.2 = $r0.4
;;
c0    mov $r0.8 = $r0.2
c0    mov $r0.3 = $r0.0
c0    mov $r0.10 = $r0.3
;;
;;
-- core_matrix_L13?3
c0    cmpltu $b0.0 = $r0.3, $r0.10
c0    mov $r0.11 = 1
c0    mov $r0.13 = 3
c0    mov $r0.12 = 2
;;
c0    mov $r0.2 = $r0.8
c0    mov $r0.9 = $r0.0
c0    mov $r0.21 = $r0.3
c0    mov $r0.22 = $r0.8
;;
;;
c0    brf $b0.0, core_matrix_L14?3
;;
-- core_matrix_L15?3
c0    cmpltu $b0.0 = $r0.9, $r0.10
c0    ldw.d $r0.3 = 0[$r0.2]
c0    add $r0.8 = $r0.5, 10
c0    cmpltu $b0.1 = $r0.11, $r0.10
;;
c0    ldw.d $r0.14 = 4[$r0.2]
c0    cmpltu $b0.2 = $r0.12, $r0.10
c0    cmpltu $b0.3 = $r0.13, $r0.10
c0    add $r0.9 = $r0.9, 4
;;
c0    ldw.d $r0.15 = 8[$r0.2]
c0    add $r0.11 = $r0.11, 4
c0    add $r0.13 = $r0.13, 4
c0    add $r0.12 = $r0.12, 4
;;
c0    add $r0.16 = $r0.3, $r0.6
c0    sxth $r0.8 = $r0.8
c0    cmple $b0.4 = $r0.3, $r0.4
c0    brf $b0.0, core_matrix_L16?3
;;
c0    cmple $b0.0 = $r0.14, $r0.3
c0    ldw.d $r0.4 = 12[$r0.2]
c0    add $r0.2 = $r0.2, 16
;;
c0    cmple $b0.5 = $r0.15, $r0.14
;;
c0    cmpgt $b0.4 = $r0.16, $r0.7
c0    slct $r0.17 = $b0.4, $r0.0, 1
;;
c0    slct $r0.18 = $b0.0, $r0.0, 1
c0    cmple $b0.0 = $r0.4, $r0.15
;;
c0    slct $r0.19 = $b0.5, $r0.0, 1
;;
c0    slctf $r0.16 = $b0.4, $r0.16, $r0.0
c0    add $r0.5 = $r0.5, $r0.17
;;
c0    slct $r0.17 = $b0.0, $r0.0, 1
;;
;;
c0    sxth $r0.5 = $r0.5
c0    add $r0.20 = $r0.16, $r0.14
;;
;;
;;
c0    slct $r0.8 = $b0.4, $r0.8, $r0.5
c0    cmpgt $b0.0 = $r0.20, $r0.7
c0    brf $b0.1, core_matrix_L17?3
;;
;;
;;
c0    add $r0.8 = $r0.8, 10
c0    slctf $r0.20 = $b0.0, $r0.20, $r0.0
c0    add $r0.18 = $r0.8, $r0.18
;;
;;
;;
c0    sxth $r0.8 = $r0.8
c0    sxth $r0.18 = $r0.18
c0    add $r0.3 = $r0.20, $r0.15
;;
;;
;;
c0    slct $r0.8 = $b0.0, $r0.8, $r0.18
c0    cmpgt $b0.0 = $r0.3, $r0.7
c0    brf $b0.2, core_matrix_L18?3
;;
;;
;;
c0    add $r0.8 = $r0.8, 10
c0    slctf $r0.3 = $b0.0, $r0.3, $r0.0
c0    add $r0.19 = $r0.8, $r0.19
;;
;;
;;
c0    sxth $r0.8 = $r0.8
c0    sxth $r0.19 = $r0.19
c0    add $r0.14 = $r0.3, $r0.4
;;
;;
;;
c0    slct $r0.8 = $b0.0, $r0.8, $r0.19
c0    cmpgt $b0.0 = $r0.14, $r0.7
c0    brf $b0.3, core_matrix_L19?3
;;
;;
;;
c0    add $r0.8 = $r0.8, 10
c0    slctf $r0.6 = $b0.0, $r0.14, $r0.0
c0    add $r0.17 = $r0.8, $r0.17
;;
;;
;;
c0    sxth $r0.8 = $r0.8
c0    sxth $r0.17 = $r0.17
;;
;;
;;
c0    slct $r0.5 = $b0.0, $r0.8, $r0.17
;;
;;
c0    goto core_matrix_L15?3
;;
-- core_matrix_L19?3
c0    mov $r0.6 = $r0.3
c0    mov $r0.4 = $r0.15
;;
;;
c0    mov $r0.5 = $r0.8
c0    add $r0.22 = $r0.23, $r0.22
c0    add $r0.21 = $r0.21, 1
;;
c0    goto core_matrix_L20?3
;;
-- core_matrix_L18?3
c0    mov $r0.6 = $r0.20
c0    mov $r0.4 = $r0.14
;;
;;
c0    mov $r0.5 = $r0.8
c0    add $r0.22 = $r0.23, $r0.22
c0    add $r0.21 = $r0.21, 1
;;
c0    goto core_matrix_L20?3
;;
-- core_matrix_L17?3
c0    mov $r0.6 = $r0.16
c0    mov $r0.4 = $r0.3
;;
;;
c0    mov $r0.5 = $r0.8
c0    add $r0.22 = $r0.23, $r0.22
c0    add $r0.21 = $r0.21, 1
;;
c0    goto core_matrix_L20?3
;;
-- core_matrix_L16?3
c0    add $r0.22 = $r0.23, $r0.22
c0    add $r0.21 = $r0.21, 1
;;
;;
-- core_matrix_L20?3
;;
c0    mov $r0.8 = $r0.22
c0    mov $r0.3 = $r0.21
c0    goto core_matrix_L13?3
;;
-- core_matrix_L14?3
.return ret($r0.3:s32)
c0    mov $r0.3 = $r0.5
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC_matrix_mul_const
c0    sxth $r0.6 = $r0.6
c0    shl $r0.15 = $r0.3, 1
;;
c0    mov $r0.12 = $r0.5
c0    mov $r0.11 = $r0.4
c0    shl $r0.14 = $r0.3, 2
c0    mov $r0.2 = $r0.3
;;
c0    mov $r0.3 = $r0.0
;;
c0    mov $r0.4 = $r0.6
c0    mov $r0.6 = $r0.2
;;
-- core_matrix_L21?3
c0    cmpltu $b0.0 = $r0.3, $r0.6
c0    mov $r0.9 = 2
c0    mov $r0.8 = 1
c0    mov $r0.10 = 3
;;
c0    mov $r0.2 = $r0.12
c0    mov $r0.5 = $r0.0
c0    mov $r0.7 = $r0.11
c0    mov $r0.13 = $r0.12
;;
c0    mov $r0.11 = $r0.3
c0    mov $r0.12 = $r0.11
;;
c0    brf $b0.0, core_matrix_L22?3
;;
-- core_matrix_L23?3
c0    cmpltu $b0.0 = $r0.5, $r0.6
c0    ldh.d $r0.3 = 0[$r0.2]
c0    cmpltu $b0.1 = $r0.8, $r0.6
c0    cmpltu $b0.2 = $r0.9, $r0.6
;;
c0    cmpltu $b0.3 = $r0.10, $r0.6
c0    add $r0.10 = $r0.10, 4
c0    add $r0.9 = $r0.9, 4
c0    add $r0.5 = $r0.5, 4
;;
c0    add $r0.8 = $r0.8, 4
;;
c0    mpyl $r0.3 = $r0.3, $r0.4
c0    brf $b0.0, core_matrix_L24?3
;;
;;
;;
c0    stw 0[$r0.7] = $r0.3
c0    brf $b0.1, core_matrix_L25?3
;;
c0    ldh $r0.3 = 2[$r0.2]
;;
;;
;;
c0    mpyl $r0.3 = $r0.4, $r0.3
;;
;;
;;
c0    stw 4[$r0.7] = $r0.3
c0    brf $b0.2, core_matrix_L26?3
;;
c0    ldh $r0.3 = 4[$r0.2]
;;
;;
;;
c0    mpyl $r0.3 = $r0.4, $r0.3
;;
;;
;;
c0    stw 8[$r0.7] = $r0.3
c0    brf $b0.3, core_matrix_L27?3
;;
c0    ldh $r0.3 = 6[$r0.2]
c0    add $r0.2 = $r0.2, 8
;;
;;
;;
c0    mpyl $r0.3 = $r0.4, $r0.3
;;
;;
;;
c0    stw 12[$r0.7] = $r0.3
c0    add $r0.7 = $r0.7, 16
;;
;;
c0    goto core_matrix_L23?3
;;
-- core_matrix_L27?3
c0    add $r0.12 = $r0.14, $r0.12
c0    add $r0.13 = $r0.15, $r0.13
c0    add $r0.11 = $r0.11, 1
;;
c0    goto core_matrix_L28?3
;;
-- core_matrix_L26?3
c0    add $r0.12 = $r0.14, $r0.12
c0    add $r0.13 = $r0.15, $r0.13
c0    add $r0.11 = $r0.11, 1
;;
c0    goto core_matrix_L28?3
;;
-- core_matrix_L25?3
c0    add $r0.12 = $r0.14, $r0.12
c0    add $r0.13 = $r0.15, $r0.13
c0    add $r0.11 = $r0.11, 1
;;
c0    goto core_matrix_L28?3
;;
-- core_matrix_L24?3
c0    add $r0.12 = $r0.14, $r0.12
c0    add $r0.13 = $r0.15, $r0.13
c0    add $r0.11 = $r0.11, 1
;;
;;
-- core_matrix_L28?3
;;
c0    mov $r0.3 = $r0.11
;;
c0    mov $r0.11 = $r0.12
;;
c0    mov $r0.12 = $r0.13
c0    goto core_matrix_L21?3
;;
-- core_matrix_L22?3
.return ret()
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
-- FUNC_matrix_add_const
c0    sxth $r0.5 = $r0.5
c0    shl $r0.15 = $r0.3, 1
;;
c0    mov $r0.10 = $r0.4
c0    mov $r0.3 = $r0.0
c0    mov $r0.6 = $r0.3
;;
;;
c0    mov $r0.4 = $r0.5
;;
-- core_matrix_L29?3
c0    cmpltu $b0.0 = $r0.3, $r0.6
c0    mov $r0.8 = 2
c0    mov $r0.7 = 1
c0    mov $r0.9 = 3
;;
c0    mov $r0.2 = $r0.10
c0    mov $r0.5 = $r0.0
c0    mov $r0.13 = $r0.3
c0    mov $r0.14 = $r0.10
;;
;;
c0    brf $b0.0, core_matrix_L30?3
;;
-- core_matrix_L31?3
c0    cmpltu $b0.0 = $r0.5, $r0.6
c0    ldh.d $r0.3 = 0[$r0.2]
c0    cmpltu $b0.1 = $r0.7, $r0.6
c0    cmpltu $b0.2 = $r0.8, $r0.6
;;
c0    ldh.d $r0.10 = 2[$r0.2]
c0    cmpltu $b0.3 = $r0.9, $r0.6
c0    add $r0.8 = $r0.8, 4
c0    add $r0.5 = $r0.5, 4
;;
c0    ldh.d $r0.11 = 4[$r0.2]
c0    add $r0.7 = $r0.7, 4
c0    add $r0.9 = $r0.9, 4
;;
c0    add $r0.3 = $r0.3, $r0.4
c0    ldh.d $r0.12 = 6[$r0.2]
c0    brf $b0.0, core_matrix_L32?3
;;
c0    add $r0.10 = $r0.4, $r0.10
;;
c0    add $r0.11 = $r0.4, $r0.11
;;
c0    sth 0[$r0.2] = $r0.3
c0    add $r0.12 = $r0.4, $r0.12
c0    brf $b0.1, core_matrix_L33?3
;;
c0    sth 2[$r0.2] = $r0.10
c0    brf $b0.2, core_matrix_L34?3
;;
c0    sth 4[$r0.2] = $r0.11
c0    brf $b0.3, core_matrix_L35?3
;;
c0    sth 6[$r0.2] = $r0.12
c0    add $r0.2 = $r0.2, 8
;;
;;
c0    goto core_matrix_L31?3
;;
-- core_matrix_L35?3
c0    add $r0.14 = $r0.15, $r0.14
c0    add $r0.13 = $r0.13, 1
;;
c0    goto core_matrix_L36?3
;;
-- core_matrix_L34?3
c0    add $r0.14 = $r0.15, $r0.14
c0    add $r0.13 = $r0.13, 1
;;
c0    goto core_matrix_L36?3
;;
-- core_matrix_L33?3
c0    add $r0.14 = $r0.15, $r0.14
c0    add $r0.13 = $r0.13, 1
;;
c0    goto core_matrix_L36?3
;;
-- core_matrix_L32?3
c0    add $r0.14 = $r0.15, $r0.14
c0    add $r0.13 = $r0.13, 1
;;
;;
-- core_matrix_L36?3
;;
c0    mov $r0.10 = $r0.14
c0    mov $r0.3 = $r0.13
c0    goto core_matrix_L29?3
;;
-- core_matrix_L30?3
.return ret()
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC_matrix_mul_vect
c0    mov $r0.7 = $r0.5
c0    shl $r0.20 = $r0.3, 1
;;
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.4
c0    mov $r0.10 = $r0.6
c0    mov $r0.9 = $r0.3
;;
;;
-- core_matrix_L37?3
c0    cmpltu $b0.0 = $r0.5, $r0.9
c0    sh2add $r0.3 = $r0.5, $r0.6
c0    mov $r0.12 = 2
c0    mov $r0.13 = 3
;;
c0    mov $r0.8 = $r0.0
c0    mov $r0.2 = $r0.10
c0    mov $r0.4 = $r0.7
c0    mov $r0.11 = 1
;;
c0    mov $r0.18 = $r0.7
c0    mov $r0.19 = $r0.10
;;
c0    brf $b0.0, core_matrix_L38?3
;;
c0    stw 0[$r0.3] = $r0.0
;;
-- core_matrix_L39?3
c0    cmpltu $b0.0 = $r0.8, $r0.9
c0    sh2add $r0.7 = $r0.5, $r0.6
c0    ldh.d $r0.3 = 0[$r0.2]
c0    sh2add $r0.10 = $r0.5, $r0.6
;;
c0    ldh.d $r0.14 = 0[$r0.4]
c0    cmpltu $b0.1 = $r0.11, $r0.9
c0    sh2add $r0.15 = $r0.5, $r0.6
c0    cmpltu $b0.2 = $r0.12, $r0.9
;;
c0    sh2add $r0.16 = $r0.5, $r0.6
c0    cmpltu $b0.3 = $r0.13, $r0.9
c0    sh2add $r0.17 = $r0.5, $r0.6
c0    add $r0.8 = $r0.8, 4
;;
c0    ldw.d $r0.7 = 0[$r0.7]
c0    add $r0.13 = $r0.13, 4
c0    add $r0.12 = $r0.12, 4
c0    brf $b0.0, core_matrix_L40?3
;;
c0    mpyl $r0.3 = $r0.3, $r0.14
c0    add $r0.11 = $r0.11, 4
;;
;;
;;
c0    add $r0.7 = $r0.7, $r0.3
;;
;;
;;
c0    stw 0[$r0.10] = $r0.7
c0    brf $b0.1, core_matrix_L41?3
;;
c0    ldh $r0.3 = 2[$r0.2]
;;
c0    ldh $r0.10 = 2[$r0.4]
;;
;;
;;
c0    mpyl $r0.3 = $r0.3, $r0.10
;;
;;
;;
c0    add $r0.7 = $r0.7, $r0.3
;;
;;
;;
c0    stw 0[$r0.15] = $r0.7
c0    brf $b0.2, core_matrix_L42?3
;;
c0    ldh $r0.3 = 4[$r0.2]
;;
c0    ldh $r0.10 = 4[$r0.4]
;;
;;
;;
c0    mpyl $r0.3 = $r0.3, $r0.10
;;
;;
;;
c0    add $r0.7 = $r0.7, $r0.3
;;
;;
;;
c0    stw 0[$r0.16] = $r0.7
c0    brf $b0.3, core_matrix_L43?3
;;
c0    ldh $r0.3 = 6[$r0.2]
c0    add $r0.2 = $r0.2, 8
;;
c0    ldh $r0.10 = 6[$r0.4]
c0    add $r0.4 = $r0.4, 8
;;
;;
;;
c0    mpyl $r0.3 = $r0.3, $r0.10
;;
;;
;;
c0    add $r0.7 = $r0.7, $r0.3
;;
;;
;;
c0    stw 0[$r0.17] = $r0.7
c0    goto core_matrix_L39?3
;;
-- core_matrix_L43?3
c0    mov $r0.10 = $r0.19
c0    add $r0.18 = $r0.20, $r0.18
c0    add $r0.5 = $r0.5, 1
;;
c0    goto core_matrix_L44?3
;;
-- core_matrix_L42?3
c0    mov $r0.10 = $r0.19
c0    add $r0.18 = $r0.20, $r0.18
c0    add $r0.5 = $r0.5, 1
;;
c0    goto core_matrix_L44?3
;;
-- core_matrix_L41?3
c0    mov $r0.10 = $r0.19
c0    add $r0.18 = $r0.20, $r0.18
c0    add $r0.5 = $r0.5, 1
;;
c0    goto core_matrix_L44?3
;;
-- core_matrix_L40?3
c0    add $r0.18 = $r0.20, $r0.18
c0    add $r0.5 = $r0.5, 1
c0    mov $r0.10 = $r0.19
;;
;;
-- core_matrix_L44?3
;;
c0    mov $r0.7 = $r0.18
c0    goto core_matrix_L37?3
;;
-- core_matrix_L38?3
.return ret()
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC_matrix_mul_matrix
c0    mov $r0.21 = $r0.5
c0    mov $r0.8 = $r0.4
;;
c0    mov $r0.2 = $r0.0
c0    shl $r0.31 = $r0.3, 2
c0    shl $r0.30 = $r0.3, 1
c0    mov $r0.11 = $r0.3
;;
c0    mov $r0.19 = $r0.6
;;
;;
-- core_matrix_L45?3
c0    cmpltu $b0.0 = $r0.2, $r0.11
c0    mov $r0.3 = $r0.19
c0    mov $r0.9 = $r0.0
c0    mov $r0.7 = $r0.0
;;
c0    mov $r0.29 = $r0.2
;;
;;
c0    brf $b0.0, core_matrix_L46?3
;;
-- core_matrix_L47?3
c0    cmpltu $b0.0 = $r0.7, $r0.11
c0    sh2add $r0.4 = $r0.7, $r0.8
c0    add $r0.20 = $r0.9, $r0.19
c0    mpylu $r0.6 = $r0.11, 6
;;
c0    shl $r0.22 = $r0.11, 1
c0    shl $r0.18 = $r0.11, 2
c0    mov $r0.14 = 2
c0    mov $r0.16 = 3
;;
c0    mov $r0.10 = $r0.0
c0    mov $r0.12 = 1
c0    mov $r0.2 = $r0.0
c0    mov $r0.5 = $r0.21
;;
c0    add $r0.17 = $r0.6, $r0.20
c0    mov $r0.26 = $r0.9
c0    mov $r0.27 = $r0.19
c0    brf $b0.0, core_matrix_L48?3
;;
c0    stw 0[$r0.4] = $r0.0
c0    add $r0.13 = $r0.22, $r0.20
c0    add $r0.15 = $r0.20, $r0.18
c0    mov $r0.28 = $r0.21
;;
;;
;;
-- core_matrix_L49?3
c0    cmpltu $b0.0 = $r0.10, $r0.11
c0    sh2add $r0.9 = $r0.7, $r0.8
c0    sh1add $r0.4 = $r0.2, $r0.3
c0    ldh.d $r0.6 = 0[$r0.5]
;;
c0    sh2add $r0.19 = $r0.7, $r0.8
c0    cmpltu $b0.1 = $r0.12, $r0.11
c0    sh1add $r0.20 = $r0.2, $r0.13
c0    sh2add $r0.21 = $r0.7, $r0.8
;;
c0    cmpltu $b0.2 = $r0.14, $r0.11
c0    sh1add $r0.22 = $r0.2, $r0.15
c0    sh2add $r0.23 = $r0.7, $r0.8
c0    cmpltu $b0.3 = $r0.16, $r0.11
;;
c0    ldh.d $r0.4 = 0[$r0.4]
c0    sh1add $r0.24 = $r0.2, $r0.17
c0    sh2add $r0.25 = $r0.7, $r0.8
c0    brf $b0.0, core_matrix_L50?3
;;
c0    ldw $r0.9 = 0[$r0.9]
c0    add $r0.16 = $r0.16, 4
c0    add $r0.14 = $r0.14, 4
c0    add $r0.10 = $r0.10, 4
;;
c0    add $r0.2 = $r0.2, $r0.18
c0    add $r0.12 = $r0.12, 4
;;
c0    mpyl $r0.4 = $r0.4, $r0.6
;;
;;
;;
c0    add $r0.9 = $r0.9, $r0.4
;;
;;
;;
c0    stw 0[$r0.19] = $r0.9
c0    brf $b0.1, core_matrix_L51?3
;;
c0    ldh $r0.20 = 0[$r0.20]
;;
c0    ldh $r0.4 = 2[$r0.5]
;;
;;
;;
c0    mpyl $r0.20 = $r0.20, $r0.4
;;
;;
;;
c0    add $r0.9 = $r0.9, $r0.20
;;
;;
;;
c0    stw 0[$r0.21] = $r0.9
c0    brf $b0.2, core_matrix_L52?3
;;
c0    ldh $r0.22 = 0[$r0.22]
;;
c0    ldh $r0.4 = 4[$r0.5]
;;
;;
;;
c0    mpyl $r0.22 = $r0.22, $r0.4
;;
;;
;;
c0    add $r0.9 = $r0.9, $r0.22
;;
;;
;;
c0    stw 0[$r0.23] = $r0.9
c0    brf $b0.3, core_matrix_L53?3
;;
c0    ldh $r0.24 = 0[$r0.24]
;;
c0    ldh $r0.4 = 6[$r0.5]
c0    add $r0.5 = $r0.5, 8
;;
;;
;;
c0    mpyl $r0.24 = $r0.24, $r0.4
;;
;;
;;
c0    add $r0.9 = $r0.9, $r0.24
;;
;;
;;
c0    stw 0[$r0.25] = $r0.9
c0    goto core_matrix_L49?3
;;
-- core_matrix_L53?3
c0    mov $r0.21 = $r0.28
c0    mov $r0.19 = $r0.27
;;
c0    add $r0.3 = $r0.3, 2
c0    add $r0.26 = $r0.26, 2
c0    add $r0.7 = $r0.7, 1
;;
c0    goto core_matrix_L54?3
;;
-- core_matrix_L52?3
c0    mov $r0.21 = $r0.28
c0    mov $r0.19 = $r0.27
;;
c0    add $r0.3 = $r0.3, 2
c0    add $r0.26 = $r0.26, 2
c0    add $r0.7 = $r0.7, 1
;;
c0    goto core_matrix_L54?3
;;
-- core_matrix_L51?3
c0    mov $r0.21 = $r0.28
c0    mov $r0.19 = $r0.27
;;
c0    add $r0.3 = $r0.3, 2
c0    add $r0.26 = $r0.26, 2
c0    add $r0.7 = $r0.7, 1
;;
c0    goto core_matrix_L54?3
;;
-- core_matrix_L50?3
c0    add $r0.3 = $r0.3, 2
c0    add $r0.26 = $r0.26, 2
c0    add $r0.7 = $r0.7, 1
c0    mov $r0.19 = $r0.27
;;
c0    mov $r0.21 = $r0.28
;;
-- core_matrix_L54?3
;;
c0    mov $r0.9 = $r0.26
c0    goto core_matrix_L47?3
;;
-- core_matrix_L48?3
c0    add $r0.21 = $r0.30, $r0.21
c0    add $r0.8 = $r0.31, $r0.8
c0    add $r0.29 = $r0.29, 1
c0    mov $r0.19 = $r0.27
;;
;;
;;
c0    mov $r0.2 = $r0.29
c0    goto core_matrix_L45?3
;;
-- core_matrix_L46?3
.return ret()
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC_matrix_mul_matrix_bitextract
c0    mov $r0.19 = $r0.5
c0    mov $r0.8 = $r0.4
;;
c0    mov $r0.2 = $r0.0
c0    shl $r0.28 = $r0.3, 2
c0    shl $r0.27 = $r0.3, 1
c0    mov $r0.11 = $r0.3
;;
c0    mov $r0.17 = $r0.6
;;
;;
-- core_matrix_L55?3
c0    cmpltu $b0.0 = $r0.2, $r0.11
c0    mov $r0.3 = $r0.17
c0    mov $r0.9 = $r0.0
c0    mov $r0.7 = $r0.0
;;
c0    mov $r0.26 = $r0.2
;;
;;
c0    brf $b0.0, core_matrix_L56?3
;;
-- core_matrix_L57?3
c0    cmpltu $b0.0 = $r0.7, $r0.11
c0    sh2add $r0.4 = $r0.7, $r0.8
c0    add $r0.18 = $r0.9, $r0.17
c0    shl $r0.6 = $r0.11, 2
;;
c0    shl $r0.20 = $r0.11, 1
c0    mov $r0.12 = 1
c0    mov $r0.14 = 2
c0    sh1add $r0.16 = $r0.11, $r0.11
;;
c0    mov $r0.10 = $r0.0
c0    mov $r0.2 = $r0.0
c0    mov $r0.5 = $r0.19
c0    mov $r0.23 = $r0.9
;;
c0    add $r0.15 = $r0.6, $r0.18
c0    mov $r0.24 = $r0.17
c0    mov $r0.25 = $r0.19
c0    brf $b0.0, core_matrix_L58?3
;;
c0    stw 0[$r0.4] = $r0.0
c0    add $r0.13 = $r0.20, $r0.18
;;
;;
;;
-- core_matrix_L59?3
c0    cmpltu $b0.0 = $r0.10, $r0.11
c0    sh1add $r0.4 = $r0.2, $r0.3
c0    ldh.d $r0.6 = 0[$r0.5]
c0    sh2add $r0.9 = $r0.7, $r0.8
;;
c0    sh2add $r0.17 = $r0.7, $r0.8
c0    cmpltu $b0.1 = $r0.12, $r0.11
c0    sh1add $r0.18 = $r0.2, $r0.13
c0    sh2add $r0.19 = $r0.7, $r0.8
;;
c0    cmpltu $b0.2 = $r0.14, $r0.11
c0    sh1add $r0.20 = $r0.2, $r0.15
c0    sh2add $r0.21 = $r0.7, $r0.8
c0    add $r0.10 = $r0.10, 3
;;
c0    ldh.d $r0.4 = 0[$r0.4]
c0    add $r0.12 = $r0.12, 3
c0    add $r0.14 = $r0.14, 3
c0    brf $b0.0, core_matrix_L60?3
;;
c0    ldw $r0.9 = 0[$r0.9]
c0    add $r0.2 = $r0.2, $r0.16
;;
;;
c0    mpyl $r0.4 = $r0.4, $r0.6
;;
;;
;;
c0    shr $r0.6 = $r0.4, 5
c0    shr $r0.4 = $r0.4, 2
;;
;;
;;
c0    and $r0.6 = $r0.6, 127
c0    and $r0.4 = $r0.4, 15
;;
;;
;;
c0    mpylu $r0.22 = $r0.6, $r0.4
c0    mpyhs $r0.6 = $r0.6, $r0.4
;;
;;
;;
c0    add $r0.22 = $r0.22, $r0.6
;;
;;
;;
c0    add $r0.9 = $r0.9, $r0.22
;;
;;
;;
c0    stw 0[$r0.17] = $r0.9
c0    brf $b0.1, core_matrix_L61?3
;;
c0    ldh $r0.18 = 0[$r0.18]
;;
c0    ldh $r0.4 = 2[$r0.5]
;;
;;
;;
c0    mpyl $r0.18 = $r0.18, $r0.4
;;
;;
;;
c0    shr $r0.4 = $r0.18, 5
c0    shr $r0.18 = $r0.18, 2
;;
;;
;;
c0    and $r0.4 = $r0.4, 127
c0    and $r0.18 = $r0.18, 15
;;
;;
;;
c0    mpylu $r0.6 = $r0.4, $r0.18
c0    mpyhs $r0.4 = $r0.4, $r0.18
;;
;;
;;
c0    add $r0.6 = $r0.6, $r0.4
;;
;;
;;
c0    add $r0.9 = $r0.9, $r0.6
;;
;;
;;
c0    stw 0[$r0.19] = $r0.9
c0    brf $b0.2, core_matrix_L62?3
;;
c0    ldh $r0.20 = 0[$r0.20]
;;
c0    ldh $r0.4 = 4[$r0.5]
c0    add $r0.5 = $r0.5, 6
;;
;;
;;
c0    mpyl $r0.20 = $r0.20, $r0.4
;;
;;
;;
c0    shr $r0.4 = $r0.20, 5
c0    shr $r0.20 = $r0.20, 2
;;
;;
;;
c0    and $r0.4 = $r0.4, 127
c0    and $r0.20 = $r0.20, 15
;;
;;
;;
c0    mpylu $r0.6 = $r0.4, $r0.20
c0    mpyhs $r0.4 = $r0.4, $r0.20
;;
;;
;;
c0    add $r0.6 = $r0.6, $r0.4
;;
;;
;;
c0    add $r0.9 = $r0.9, $r0.6
;;
;;
;;
c0    stw 0[$r0.21] = $r0.9
c0    goto core_matrix_L59?3
;;
-- core_matrix_L62?3
c0    mov $r0.19 = $r0.25
c0    mov $r0.17 = $r0.24
;;
c0    add $r0.3 = $r0.3, 2
c0    add $r0.23 = $r0.23, 2
c0    add $r0.7 = $r0.7, 1
;;
c0    goto core_matrix_L63?3
;;
-- core_matrix_L61?3
c0    mov $r0.19 = $r0.25
c0    mov $r0.17 = $r0.24
;;
c0    add $r0.3 = $r0.3, 2
c0    add $r0.23 = $r0.23, 2
c0    add $r0.7 = $r0.7, 1
;;
c0    goto core_matrix_L63?3
;;
-- core_matrix_L60?3
c0    add $r0.3 = $r0.3, 2
c0    add $r0.23 = $r0.23, 2
c0    add $r0.7 = $r0.7, 1
c0    mov $r0.17 = $r0.24
;;
c0    mov $r0.19 = $r0.25
;;
-- core_matrix_L63?3
;;
c0    mov $r0.9 = $r0.23
c0    goto core_matrix_L57?3
;;
-- core_matrix_L58?3
c0    add $r0.25 = $r0.27, $r0.25
c0    add $r0.8 = $r0.28, $r0.8
c0    add $r0.26 = $r0.26, 1
c0    mov $r0.17 = $r0.24
;;
;;
;;
c0    mov $r0.19 = $r0.25
c0    mov $r0.2 = $r0.26
c0    goto core_matrix_L55?3
;;
-- core_matrix_L56?3
.return ret()
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
ENDOFFILE: core_matrix
FILE: core_portme
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32)
-- FUNC_portable_malloc
c0    mov $r0.3 = $r0.0
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32)
-- FUNC_portable_free
;;
.return ret()
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg()
-- FUNC_start_time
c0    add $r0.1 = $r0.1, (-0x20)
;;
.call clock, caller, arg(), ret($r0.3:u32)
c0    stw 0x10[$r0.1] = $l0.0
c0    call $l0.0 = FUNC_clock
;;
c0    stw ((core_portme_9217.start_time_val+0)+0)[$r0.0] = $r0.3
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret()
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg()
-- FUNC_stop_time
c0    add $r0.1 = $r0.1, (-0x20)
;;
.call clock, caller, arg(), ret($r0.3:u32)
c0    stw 0x10[$r0.1] = $l0.0
c0    call $l0.0 = FUNC_clock
;;
c0    stw ((core_portme_9217.stop_time_val+0)+0)[$r0.0] = $r0.3
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret()
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg()
-- FUNC_get_time
c0    ldw $r0.2 = ((core_portme_9217.stop_time_val+0)+0)[$r0.0]
;;
c0    ldw $r0.4 = ((core_portme_9217.start_time_val+0)+0)[$r0.0]
;;
;;
;;
c0    sub $r0.3 = $r0.2, $r0.4
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
-- FUNC_time_in_secs
c0    add $r0.1 = $r0.1, (-0x20)
;;
.call _d_ufloat, caller, arg($r0.3:s32), ret($r0.3:u32,$r0.4:u32)
c0    stw 0x10[$r0.1] = $l0.0
c0    call $l0.0 = FUNC__d_ufloat
;;
.call _d_div, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    mov $r0.6 = $r0.0
c0    mov $r0.5 = 1098372996
c0    call $l0.0 = FUNC__d_div
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
-- FUNC_portable_init
c0    mov $r0.2 = 1
;;
.return ret()
c0    stb 4[$r0.3] = $r0.2
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32)
-- FUNC_portable_fini
c0    stb 4[$r0.3] = $r0.0
;;
.return ret()
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
-- FUNC_core_start_parallel
c0    add $r0.1 = $r0.1, (-0x20)
c0    add $r0.2 = $r0.3, 68
c0    mov $r0.4 = $r0.0
;;
c0    mov $r0.5 = iterate
c0    mov $r0.6 = $r0.3
c0    stw 0x10[$r0.1] = $l0.0
;;
;;
.call vthread_create, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
c0    mov $r0.3 = $r0.2
c0    call $l0.0 = FUNC_vthread_create
;;
c0    zxtb $r0.3 = $r0.3
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
-- FUNC_core_stop_parallel
c0    add $r0.1 = $r0.1, (-0x20)
c0    ldw $r0.3 = 68[$r0.3]
;;
c0    add $r0.4 = $r0.1, 0x10
c0    stw 0x14[$r0.1] = $l0.0
;;
;;
.call vthread_join, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_vthread_join
;;
c0    zxtb $r0.3 = $r0.3
c0    ldw $l0.0 = 0x14[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
ENDOFFILE: core_portme
FILE: core_state
.entry caller, sp=$r0.1, rl=$l0.0, asize=-128, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32)
-- FUNC_core_bench_state
c0    add $r0.1 = $r0.1, (-0x80)
c0    sxth $r0.9 = $r0.7
c0    zxth $r0.8 = $r0.8
;;
c0    sxth $r0.12 = $r0.6
c0    add $r0.7 = $r0.1, 0x10
c0    add $r0.10 = $r0.1, 0x34
c0    stw 0x54[$r0.1] = $l0.0
;;
c0    sxth $r0.13 = $r0.5
c0    mov $r0.2 = $r0.0
c0    mov $r0.5 = $r0.3
c0    mov $r0.6 = $r0.4
;;
c0    stw 0x30[$r0.1] = $r0.4
;;
c0    mov $r0.4 = $r0.7
c0    mov $r0.3 = $r0.10
c0    mov $r0.10 = $r0.7
c0    mov $r0.11 = $r0.10
;;
c0    mov $r0.7 = $l0.0
;;
;;
;;
-- core_state_L0?3
c0    cmpltu $b0.0 = $r0.2, 8
c0    add $r0.2 = $r0.2, 4
;;
;;
;;
c0    brf $b0.0, core_state_L1?3
;;
c0    stw 0[$r0.3] = $r0.0
;;
c0    stw 0[$r0.4] = $r0.0
;;
c0    stw 4[$r0.3] = $r0.0
;;
c0    stw 4[$r0.4] = $r0.0
;;
c0    stw 8[$r0.3] = $r0.0
;;
c0    stw 8[$r0.4] = $r0.0
;;
c0    stw 12[$r0.3] = $r0.0
c0    add $r0.3 = $r0.3, 16
;;
c0    stw 12[$r0.4] = $r0.0
c0    add $r0.4 = $r0.4, 16
;;
;;
c0    goto core_state_L0?3
;;
-- core_state_L1?3
c0    add $r0.2 = $r0.1, 0x30
c0    stw 0x54[$r0.1] = $r0.7
;;
c0    stw 0x58[$r0.1] = $r0.57
;;
c0    stw 0x5c[$r0.1] = $r0.58
;;
c0    mov $r0.58 = $r0.11
c0    stw 0x60[$r0.1] = $r0.59
c0    mov $r0.57 = $r0.2
;;
c0    mov $r0.59 = $r0.10
c0    stw 0x64[$r0.1] = $r0.13
;;
c0    stw 0x68[$r0.1] = $r0.12
;;
c0    stw 0x6c[$r0.1] = $r0.9
;;
c0    stw 0x70[$r0.1] = $r0.8
;;
c0    stw 0x74[$r0.1] = $r0.5
;;
c0    stw 0x78[$r0.1] = $r0.6
;;
-- core_state_L2?3
c0    ldw $r0.2 = 0x30[$r0.1]
c0    mov $r0.3 = $r0.57
c0    mov $r0.4 = $r0.58
;;
;;
;;
c0    ldbu $r0.2 = 0[$r0.2]
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, core_state_L3?3
;;
.call core_state_transition, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_core_state_transition
;;
c0    sh2add $r0.2 = $r0.3, $r0.59
c0    sh2add $r0.3 = $r0.3, $r0.59
;;
;;
;;
c0    ldw $r0.2 = 0[$r0.2]
;;
;;
;;
c0    add $r0.2 = $r0.2, 1
;;
;;
;;
c0    stw 0[$r0.3] = $r0.2
c0    goto core_state_L2?3
;;
-- core_state_L3?3
c0    ldw $r0.2 = 0x78[$r0.1]
;;
c0    ldw $r0.13 = 0x64[$r0.1]
;;
c0    ldw $r0.6 = 0x74[$r0.1]
;;
c0    ldw $r0.5 = 0x6c[$r0.1]
;;
c0    stw 0x30[$r0.1] = $r0.2
c0    zxtb $r0.4 = $r0.13
;;
c0    add $r0.3 = $r0.2, $r0.6
;;
;;
;;
-- core_state_L4?3
c0    ldw $r0.2 = 0x30[$r0.1]
;;
;;
;;
c0    cmpltu $b0.0 = $r0.2, $r0.3
c0    ldbu.d $r0.6 = 0[$r0.2]
;;
;;
;;
c0    cmpne $b0.0 = $r0.6, 44
c0    xor $r0.7 = $r0.6, $r0.4
c0    brf $b0.0, core_state_L5?3
;;
;;
;;
c0    brf $b0.0, core_state_L6?3
;;
c0    stb 0[$r0.2] = $r0.7
;;
-- core_state_L6?3
c0    ldw $r0.2 = 0x30[$r0.1]
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    stw 0x30[$r0.1] = $r0.2
c0    cmpltu $b0.0 = $r0.2, $r0.3
;;
c0    ldbu.d $r0.6 = 0[$r0.2]
;;
;;
c0    brf $b0.0, core_state_L7?3
;;
c0    cmpne $b0.0 = $r0.6, 44
c0    xor $r0.7 = $r0.6, $r0.4
;;
;;
;;
c0    brf $b0.0, core_state_L8?3
;;
c0    stb 0[$r0.2] = $r0.7
;;
-- core_state_L8?3
c0    ldw $r0.2 = 0x30[$r0.1]
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    stw 0x30[$r0.1] = $r0.2
c0    cmpltu $b0.0 = $r0.2, $r0.3
;;
c0    ldbu.d $r0.6 = 0[$r0.2]
;;
;;
c0    brf $b0.0, core_state_L9?3
;;
c0    cmpne $b0.0 = $r0.6, 44
c0    xor $r0.7 = $r0.6, $r0.4
;;
;;
;;
c0    brf $b0.0, core_state_L10?3
;;
c0    stb 0[$r0.2] = $r0.7
;;
-- core_state_L10?3
c0    ldw $r0.2 = 0x30[$r0.1]
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    stw 0x30[$r0.1] = $r0.2
c0    cmpltu $b0.0 = $r0.2, $r0.3
;;
c0    ldbu.d $r0.6 = 0[$r0.2]
;;
;;
c0    brf $b0.0, core_state_L11?3
;;
c0    cmpne $b0.0 = $r0.6, 44
c0    xor $r0.7 = $r0.6, $r0.4
;;
;;
;;
c0    brf $b0.0, core_state_L12?3
;;
c0    stb 0[$r0.2] = $r0.7
;;
-- core_state_L12?3
c0    ldw $r0.2 = 0x30[$r0.1]
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    stw 0x30[$r0.1] = $r0.2
c0    goto core_state_L4?3
;;
-- core_state_L11?3
c0    stw 0x6c[$r0.1] = $r0.5
c0    add $r0.57 = $r0.1, 0x30
;;
c0    ldw $r0.4 = 0x78[$r0.1]
c0    goto core_state_L13?3
;;
-- core_state_L14?3
c0    ldw $r0.2 = 0x30[$r0.1]
c0    mov $r0.3 = $r0.57
c0    mov $r0.4 = $r0.58
;;
;;
;;
c0    ldbu $r0.2 = 0[$r0.2]
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, core_state_L15?3
;;
.call core_state_transition, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_core_state_transition
;;
c0    sh2add $r0.2 = $r0.3, $r0.59
c0    sh2add $r0.3 = $r0.3, $r0.59
;;
;;
;;
c0    ldw $r0.2 = 0[$r0.2]
;;
;;
;;
c0    add $r0.2 = $r0.2, 1
;;
;;
;;
c0    stw 0[$r0.3] = $r0.2
c0    goto core_state_L14?3
;;
-- core_state_L15?3
c0    ldw $r0.2 = 0x78[$r0.1]
;;
c0    ldw $r0.12 = 0x68[$r0.1]
;;
c0    ldw $r0.6 = 0x74[$r0.1]
;;
c0    ldw $r0.5 = 0x6c[$r0.1]
;;
c0    stw 0x30[$r0.1] = $r0.2
c0    zxtb $r0.4 = $r0.12
;;
c0    add $r0.3 = $r0.2, $r0.6
;;
;;
;;
-- core_state_L16?3
c0    ldw $r0.2 = 0x30[$r0.1]
;;
;;
;;
c0    cmpltu $b0.0 = $r0.2, $r0.3
c0    ldbu.d $r0.6 = 0[$r0.2]
;;
;;
;;
c0    cmpne $b0.0 = $r0.6, 44
c0    xor $r0.7 = $r0.6, $r0.4
c0    brf $b0.0, core_state_L17?3
;;
;;
;;
c0    brf $b0.0, core_state_L18?3
;;
c0    stb 0[$r0.2] = $r0.7
;;
-- core_state_L18?3
c0    ldw $r0.2 = 0x30[$r0.1]
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    stw 0x30[$r0.1] = $r0.2
c0    cmpltu $b0.0 = $r0.2, $r0.3
;;
c0    ldbu.d $r0.6 = 0[$r0.2]
;;
;;
c0    brf $b0.0, core_state_L19?3
;;
c0    cmpne $b0.0 = $r0.6, 44
c0    xor $r0.7 = $r0.6, $r0.4
;;
;;
;;
c0    brf $b0.0, core_state_L20?3
;;
c0    stb 0[$r0.2] = $r0.7
;;
-- core_state_L20?3
c0    ldw $r0.2 = 0x30[$r0.1]
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    stw 0x30[$r0.1] = $r0.2
c0    cmpltu $b0.0 = $r0.2, $r0.3
;;
c0    ldbu.d $r0.6 = 0[$r0.2]
;;
;;
c0    brf $b0.0, core_state_L21?3
;;
c0    cmpne $b0.0 = $r0.6, 44
c0    xor $r0.7 = $r0.6, $r0.4
;;
;;
;;
c0    brf $b0.0, core_state_L22?3
;;
c0    stb 0[$r0.2] = $r0.7
;;
-- core_state_L22?3
c0    ldw $r0.2 = 0x30[$r0.1]
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    stw 0x30[$r0.1] = $r0.2
c0    cmpltu $b0.0 = $r0.2, $r0.3
;;
c0    ldbu.d $r0.6 = 0[$r0.2]
;;
;;
c0    brf $b0.0, core_state_L23?3
;;
c0    cmpne $b0.0 = $r0.6, 44
c0    xor $r0.7 = $r0.6, $r0.4
;;
;;
;;
c0    brf $b0.0, core_state_L24?3
;;
c0    stb 0[$r0.2] = $r0.7
;;
-- core_state_L24?3
c0    ldw $r0.2 = 0x30[$r0.1]
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    stw 0x30[$r0.1] = $r0.2
c0    goto core_state_L16?3
;;
-- core_state_L23?3
c0    mov $r0.57 = $r0.0
c0    stw 0x7c[$r0.1] = $r0.60
;;
c0    mov $r0.60 = $r0.58
c0    goto core_state_L25?3
;;
-- core_state_L26?3
c0    cmpltu $b0.0 = $r0.57, 8
c0    sh2add $r0.2 = $r0.57, $r0.59
c0    mov $r0.4 = $r0.58
;;
;;
;;
c0    ldw.d $r0.3 = 0[$r0.2]
c0    brf $b0.0, core_state_L27?3
;;
;;
.call crcu32, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crcu32
;;
c0    sh2add $r0.2 = $r0.57, $r0.60
c0    mov $r0.4 = $r0.3
;;
;;
;;
c0    ldw $r0.3 = 0[$r0.2]
;;
;;
.call crcu32, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crcu32
;;
c0    mov $r0.58 = $r0.3
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    goto core_state_L26?3
;;
-- core_state_L27?3
c0    ldw $l0.0 = 0x54[$r0.1]
;;
c0    ldw $r0.60 = 0x7c[$r0.1]
;;
c0    mov $r0.3 = $r0.58
c0    ldw $r0.59 = 0x60[$r0.1]
;;
c0    ldw $r0.58 = 0x5c[$r0.1]
;;
c0    ldw $r0.57 = 0x58[$r0.1]
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x80), $l0.0
;;
-- core_state_L21?3
c0    mov $r0.57 = $r0.0
c0    stw 0x7c[$r0.1] = $r0.60
;;
c0    mov $r0.60 = $r0.58
c0    goto core_state_L25?3
;;
-- core_state_L19?3
c0    mov $r0.57 = $r0.0
c0    stw 0x7c[$r0.1] = $r0.60
;;
c0    mov $r0.60 = $r0.58
c0    goto core_state_L25?3
;;
-- core_state_L17?3
c0    mov $r0.57 = $r0.0
c0    stw 0x7c[$r0.1] = $r0.60
;;
c0    mov $r0.60 = $r0.58
;;
-- core_state_L25?3
c0    ldw $r0.58 = 0x70[$r0.1]
;;
;;
c0    goto core_state_L26?3
;;
-- core_state_L9?3
c0    stw 0x6c[$r0.1] = $r0.5
c0    add $r0.57 = $r0.1, 0x30
;;
c0    ldw $r0.4 = 0x78[$r0.1]
c0    goto core_state_L13?3
;;
-- core_state_L7?3
c0    stw 0x6c[$r0.1] = $r0.5
c0    add $r0.57 = $r0.1, 0x30
;;
c0    ldw $r0.4 = 0x78[$r0.1]
c0    goto core_state_L13?3
;;
-- core_state_L5?3
c0    add $r0.57 = $r0.1, 0x30
c0    stw 0x6c[$r0.1] = $r0.5
;;
c0    ldw $r0.4 = 0x78[$r0.1]
;;
-- core_state_L13?3
;;
;;
c0    stw 0x30[$r0.1] = $r0.4
c0    goto core_state_L14?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
-- FUNC_core_init_state
c0    add $r0.1 = $r0.1, (-0x20)
c0    sxth $r0.16 = $r0.4
c0    mov $r0.15 = $r0.0
;;
c0    mov $r0.11 = $r0.0
c0    add $r0.12 = $r0.3, -1
c0    stw 0x0[$r0.1] = $l0.0
c0    mov $r0.13 = $r0.5
;;
c0    mov $r0.5 = $r0.0
c0    mov $r0.17 = $r0.3
c0    mov $r0.18 = $l0.0
;;
;;
;;
-- core_state_L28?3
c0    add $r0.10 = $r0.5, 1
c0    cmpgtu $b0.0 = $r0.5, $r0.0
c0    mov $r0.9 = 3
c0    add $r0.14 = $r0.11, $r0.13
;;
c0    mov $r0.7 = 1
c0    mov $r0.2 = $r0.15
c0    mov $r0.4 = $r0.0
c0    mov $r0.8 = 2
;;
;;
c0    add $r0.10 = $r0.10, $r0.11
c0    mov $r0.6 = $r0.14
;;
;;
;;
c0    cmpltu $b0.1 = $r0.10, $r0.12
;;
;;
;;
c0    brf $b0.1, core_state_L29?3
;;
c0    brf $b0.0, core_state_L30?3
;;
-- core_state_L31?3
c0    cmpltu $b0.0 = $r0.4, $r0.5
c0    ldbu.d $r0.3 = 0[$r0.2]
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
c0    brf $b0.0, core_state_L32?3
;;
c0    stb 0[$r0.6] = $r0.3
c0    brf $b0.1, core_state_L33?3
;;
c0    ldbu $r0.3 = 1[$r0.2]
;;
;;
;;
c0    stb 1[$r0.6] = $r0.3
c0    brf $b0.2, core_state_L34?3
;;
c0    ldbu $r0.3 = 2[$r0.2]
;;
;;
;;
c0    stb 2[$r0.6] = $r0.3
c0    brf $b0.3, core_state_L35?3
;;
c0    ldbu $r0.3 = 3[$r0.2]
c0    add $r0.2 = $r0.2, 4
;;
;;
;;
c0    stb 3[$r0.6] = $r0.3
c0    add $r0.6 = $r0.6, 4
;;
;;
c0    goto core_state_L31?3
;;
-- core_state_L35?3
c0    mov $r0.3 = 44
c0    maxu $r0.2 = $r0.5, $r0.0
c0    add $r0.4 = $r0.5, 1
c0    goto core_state_L36?3
;;
-- core_state_L30?3
c0    add $r0.16 = $r0.16, 1
;;
;;
;;
c0    sxth $r0.4 = $r0.16
c0    and $r0.6 = $r0.16, 7
;;
;;
;;
c0    cmplt $r0.7 = $r0.6, $r0.0
c0    cmpgt $r0.8 = $r0.6, 7
c0    sh2add $r0.9 = $r0.6, (core_state_?1.core_init_state.TAGPACKET.0+0)
;;
c0    shr $r0.10 = $r0.4, 3
c0    mov $r0.16 = $r0.4
;;
;;
c0    orl $b0.0 = $r0.7, $r0.8
c0    ldw.d $l0.0 = 0[$r0.9]
;;
c0    and $r0.10 = $r0.10, 3
;;
;;
c0    br $b0.0, core_state_L28?3
;;
c0    sh2add $r0.10 = $r0.10, (core_state_9217.intpat+0)
c0    mov $r0.5 = 4
;;
c0    goto $l0.0
;;
-- core_state_L37?3
-- FUNC_core_state__?1.core_init_state.TAG.0.0
;;
c0    ldw $r0.15 = 0[$r0.10]
;;
;;
c0    goto core_state_L28?3
;;
-- FUNC_core_state__?1.core_init_state.TAG.0.7
c0    shr $r0.2 = $r0.16, 3
c0    mov $r0.5 = 8
;;
;;
;;
c0    and $r0.2 = $r0.2, 3
;;
;;
;;
c0    sh2add $r0.2 = $r0.2, (core_state_9217.errpat+0)
;;
;;
;;
c0    ldw $r0.15 = 0[$r0.2]
;;
;;
c0    goto core_state_L28?3
;;
-- FUNC_core_state__?1.core_init_state.TAG.0.6
c0    mov $r0.5 = 8
c0    shr $r0.2 = $r0.16, 3
c0    goto core_state_L38?3
;;
-- FUNC_core_state__?1.core_init_state.TAG.0.5
c0    shr $r0.2 = $r0.16, 3
c0    mov $r0.5 = 8
;;
-- core_state_L38?3
;;
;;
c0    and $r0.2 = $r0.2, 3
;;
;;
;;
c0    sh2add $r0.2 = $r0.2, (core_state_9217.scipat+0)
;;
;;
;;
c0    ldw $r0.15 = 0[$r0.2]
;;
;;
c0    goto core_state_L28?3
;;
-- FUNC_core_state__?1.core_init_state.TAG.0.4
c0    mov $r0.5 = 8
c0    shr $r0.2 = $r0.16, 3
c0    goto core_state_L39?3
;;
-- FUNC_core_state__?1.core_init_state.TAG.0.3
c0    shr $r0.2 = $r0.16, 3
c0    mov $r0.5 = 8
;;
-- core_state_L39?3
;;
;;
c0    and $r0.2 = $r0.2, 3
;;
;;
;;
c0    sh2add $r0.2 = $r0.2, (core_state_9217.floatpat+0)
;;
;;
;;
c0    ldw $r0.15 = 0[$r0.2]
;;
;;
c0    goto core_state_L28?3
;;
-- FUNC_core_state__?1.core_init_state.TAG.0.2
c0    shr $r0.2 = $r0.16, 3
;;
;;
;;
c0    and $r0.10 = $r0.2, 3
;;
;;
;;
c0    sh2add $r0.10 = $r0.10, (core_state_9217.intpat+0)
;;
c0    goto core_state_L37?3
;;
-- FUNC_core_state__?1.core_init_state.TAG.0.1
c0    shr $r0.2 = $r0.16, 3
;;
;;
;;
c0    and $r0.10 = $r0.2, 3
;;
;;
;;
c0    sh2add $r0.10 = $r0.10, (core_state_9217.intpat+0)
;;
c0    goto core_state_L37?3
;;
-- core_state_L34?3
c0    mov $r0.3 = 44
c0    maxu $r0.2 = $r0.5, $r0.0
c0    add $r0.4 = $r0.5, 1
c0    goto core_state_L36?3
;;
-- core_state_L33?3
c0    mov $r0.3 = 44
c0    maxu $r0.2 = $r0.5, $r0.0
c0    add $r0.4 = $r0.5, 1
c0    goto core_state_L36?3
;;
-- core_state_L32?3
c0    maxu $r0.2 = $r0.5, $r0.0
c0    add $r0.4 = $r0.5, 1
c0    mov $r0.3 = 44
;;
-- core_state_L36?3
;;
;;
c0    add $r0.2 = $r0.2, $r0.13
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.11
;;
;;
;;
c0    stb 0[$r0.2] = $r0.3
c0    add $r0.11 = $r0.4, $r0.11
;;
;;
c0    goto core_state_L30?3
;;
-- core_state_L29?3
c0    add $r0.4 = $r0.13, $r0.11
c0    add $r0.5 = $r0.11, 1
c0    add $r0.7 = $r0.11, 3
c0    add $r0.6 = $r0.11, 2
;;
c0    mov $r0.3 = $r0.17
c0    mov $r0.2 = $r0.11
;;
;;
-- core_state_L40?3
c0    cmpltu $b0.0 = $r0.2, $r0.3
c0    cmpltu $b0.1 = $r0.5, $r0.3
c0    cmpltu $b0.2 = $r0.6, $r0.3
c0    cmpltu $b0.3 = $r0.7, $r0.3
;;
c0    add $r0.5 = $r0.5, 4
c0    add $r0.7 = $r0.7, 4
c0    add $r0.6 = $r0.6, 4
c0    add $r0.2 = $r0.2, 4
;;
;;
c0    brf $b0.0, core_state_L41?3
;;
c0    stb 0[$r0.4] = $r0.0
c0    brf $b0.1, core_state_L41?3
;;
c0    stb 1[$r0.4] = $r0.0
c0    brf $b0.2, core_state_L41?3
;;
c0    stb 2[$r0.4] = $r0.0
c0    brf $b0.3, core_state_L41?3
;;
c0    stb 3[$r0.4] = $r0.0
c0    add $r0.4 = $r0.4, 4
;;
;;
c0    goto core_state_L40?3
;;
-- core_state_L41?3
c0    mov $l0.0 = $r0.18
c0    stw 0x0[$r0.1] = $r0.18
;;
;;
;;
.return ret()
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32)
-- FUNC_core_state_9217.ee_isdigit
c0    zxtb $r0.3 = $r0.3
;;
;;
;;
c0    cmple $r0.2 = $r0.3, 57
c0    cmpge $r0.3 = $r0.3, 48
;;
;;
;;
c0    and $r0.2 = $r0.2, $r0.3
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    slctf $r0.2 = $b0.0, $r0.0, 1
;;
;;
;;
c0    zxtb $r0.3 = $r0.2
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32)
-- FUNC_core_state_transition
c0    add $r0.1 = $r0.1, (-0x40)
c0    ldw $r0.2 = 0[$r0.3]
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    stw 0x18[$r0.1] = $r0.57
;;
c0    stw 0x1c[$r0.1] = $r0.58
c0    mov $r0.57 = $r0.2
;;
c0    mov $r0.58 = $r0.0
c0    stw 0x20[$r0.1] = $r0.59
;;
c0    mov $r0.59 = $r0.4
c0    stw 0x24[$r0.1] = $r0.3
;;
-- core_state_L42?3
c0    ldbu $r0.3 = 0[$r0.57]
c0    cmpne $r0.2 = $r0.58, 1
c0    cmpeq $b0.0 = $r0.58, $r0.0
;;
;;
;;
c0    andl $b0.1 = $r0.3, $r0.2
c0    cmpeq $b0.2 = $r0.3, 44
c0    stw 0x14[$r0.1] = $r0.3
;;
;;
;;
c0    brf $b0.1, core_state_L43?3
;;
c0    br $b0.2, core_state_L44?3
;;
c0    brf $b0.0, core_state_L45?3
;;
.call core_state_9217.ee_isdigit, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_core_state_9217.ee_isdigit
;;
c0    cmpne $b0.0 = $r0.3, $r0.0
c0    mov $r0.58 = 4
c0    ldw.d $r0.2 = 0[$r0.59]
;;
;;
;;
c0    add $r0.2 = $r0.2, 1
c0    brf $b0.0, core_state_L46?3
;;
-- core_state_L47?3
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    stw 0[$r0.59] = $r0.2
c0    goto core_state_L42?3
;;
-- core_state_L46?3
c0    mov $r0.58 = 2
c0    ldw $r0.3 = 0x14[$r0.1]
;;
c0    ldw.d $r0.4 = 0[$r0.59]
;;
;;
c0    cmpeq $r0.5 = $r0.3, 43
c0    cmpeq $r0.3 = $r0.3, 45
;;
c0    mov $r0.2 = $r0.4
;;
;;
c0    orl $b0.0 = $r0.5, $r0.3
;;
;;
;;
c0    brf $b0.0, core_state_L48?3
;;
c0    add $r0.2 = $r0.2, 1
c0    goto core_state_L47?3
;;
-- core_state_L48?3
c0    mov $r0.58 = 5
c0    ldw $r0.3 = 0x14[$r0.1]
;;
c0    ldw.d $r0.2 = 0[$r0.59]
;;
;;
c0    cmpeq $b0.0 = $r0.3, 46
;;
;;
;;
c0    brf $b0.0, core_state_L49?3
;;
c0    add $r0.2 = $r0.2, 1
c0    goto core_state_L47?3
;;
-- core_state_L49?3
c0    ldw $r0.3 = 4[$r0.59]
c0    mov $r0.58 = 1
;;
c0    ldw $r0.2 = 0[$r0.59]
;;
;;
c0    add $r0.3 = $r0.3, 1
;;
;;
;;
c0    stw 4[$r0.59] = $r0.3
c0    add $r0.2 = $r0.2, 1
c0    goto core_state_L47?3
;;
-- core_state_L45?3
c0    cmpeq $b0.0 = $r0.58, 2
c0    stw 0x14[$r0.1] = $r0.3
;;
;;
;;
c0    brf $b0.0, core_state_L50?3
;;
.call core_state_9217.ee_isdigit, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_core_state_9217.ee_isdigit
;;
c0    cmpne $b0.0 = $r0.3, $r0.0
c0    ldw.d $r0.2 = 8[$r0.59]
c0    mov $r0.58 = 4
;;
;;
;;
c0    add $r0.2 = $r0.2, 1
c0    brf $b0.0, core_state_L51?3
;;
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    stw 8[$r0.59] = $r0.2
c0    goto core_state_L42?3
;;
-- core_state_L51?3
c0    ldw.d $r0.3 = 8[$r0.59]
c0    mov $r0.58 = 5
;;
c0    ldw $r0.4 = 0x14[$r0.1]
;;
;;
c0    add $r0.3 = $r0.3, 1
;;
c0    cmpeq $b0.0 = $r0.4, 46
;;
;;
;;
c0    brf $b0.0, core_state_L52?3
;;
c0    stw 8[$r0.59] = $r0.3
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    goto core_state_L42?3
;;
-- core_state_L52?3
c0    ldw $r0.2 = 8[$r0.59]
c0    mov $r0.58 = 1
c0    add $r0.57 = $r0.57, 1
;;
;;
;;
c0    add $r0.2 = $r0.2, 1
;;
;;
;;
c0    stw 8[$r0.59] = $r0.2
c0    goto core_state_L42?3
;;
-- core_state_L50?3
c0    cmpeq $b0.0 = $r0.58, 3
c0    cmpeq $r0.4 = $r0.3, 43
c0    cmpeq $r0.5 = $r0.3, 45
c0    ldw.d $r0.2 = 12[$r0.59]
;;
;;
;;
c0    orl $b0.0 = $r0.4, $r0.5
c0    add $r0.2 = $r0.2, 1
c0    brf $b0.0, core_state_L53?3
;;
c0    mov $r0.58 = 6
;;
;;
c0    brf $b0.0, core_state_L54?3
;;
c0    stw 12[$r0.59] = $r0.2
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    goto core_state_L42?3
;;
-- core_state_L54?3
c0    ldw $r0.2 = 12[$r0.59]
c0    mov $r0.58 = 1
c0    add $r0.57 = $r0.57, 1
;;
;;
;;
c0    add $r0.2 = $r0.2, 1
;;
;;
;;
c0    stw 12[$r0.59] = $r0.2
c0    goto core_state_L42?3
;;
-- core_state_L53?3
c0    cmpeq $b0.1 = $r0.58, 4
c0    cmpeq $b0.2 = $r0.3, 46
c0    ldw.d $r0.4 = 16[$r0.59]
;;
;;
;;
c0    add $r0.4 = $r0.4, 1
c0    brf $b0.1, core_state_L55?3
;;
c0    brf $b0.2, core_state_L56?3
;;
c0    mov $r0.58 = 5
c0    add $r0.57 = $r0.57, 1
;;
c0    stw 16[$r0.59] = $r0.4
;;
c0    goto core_state_L42?3
;;
-- core_state_L56?3
.call core_state_9217.ee_isdigit, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_core_state_9217.ee_isdigit
;;
c0    cmpeq $b0.0 = $r0.3, $r0.0
c0    ldw.d $r0.2 = 16[$r0.59]
;;
;;
;;
c0    add $r0.2 = $r0.2, 1
c0    brf $b0.0, core_state_L57?3
;;
c0    mov $r0.58 = 1
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    stw 16[$r0.59] = $r0.2
c0    goto core_state_L42?3
;;
-- core_state_L57?3
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    goto core_state_L42?3
;;
-- core_state_L55?3
c0    cmpeq $b0.0 = $r0.58, 5
c0    cmpeq $r0.5 = $r0.3, 69
c0    cmpeq $r0.6 = $r0.3, 101
c0    ldw.d $r0.2 = 20[$r0.59]
;;
;;
;;
c0    orl $b0.0 = $r0.5, $r0.6
c0    add $r0.2 = $r0.2, 1
c0    brf $b0.0, core_state_L58?3
;;
;;
;;
c0    brf $b0.0, core_state_L59?3
;;
c0    mov $r0.58 = 3
c0    stw 20[$r0.59] = $r0.2
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    goto core_state_L42?3
;;
-- core_state_L59?3
.call core_state_9217.ee_isdigit, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_core_state_9217.ee_isdigit
;;
c0    cmpeq $b0.0 = $r0.3, $r0.0
c0    ldw.d $r0.2 = 20[$r0.59]
;;
;;
;;
c0    add $r0.2 = $r0.2, 1
c0    brf $b0.0, core_state_L60?3
;;
c0    mov $r0.58 = 1
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    stw 20[$r0.59] = $r0.2
c0    goto core_state_L42?3
;;
-- core_state_L60?3
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    goto core_state_L42?3
;;
-- core_state_L58?3
c0    cmpeq $b0.1 = $r0.58, 6
;;
;;
;;
c0    brf $b0.1, core_state_L61?3
;;
.call core_state_9217.ee_isdigit, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_core_state_9217.ee_isdigit
;;
c0    cmpne $b0.0 = $r0.3, $r0.0
c0    ldw.d $r0.2 = 24[$r0.59]
c0    mov $r0.58 = 7
;;
;;
;;
c0    add $r0.2 = $r0.2, 1
c0    brf $b0.0, core_state_L62?3
;;
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    stw 24[$r0.59] = $r0.2
c0    goto core_state_L42?3
;;
-- core_state_L62?3
c0    ldw $r0.3 = 24[$r0.59]
c0    mov $r0.58 = 1
c0    add $r0.57 = $r0.57, 1
;;
;;
;;
c0    add $r0.3 = $r0.3, 1
;;
;;
;;
c0    stw 24[$r0.59] = $r0.3
c0    goto core_state_L42?3
;;
-- core_state_L61?3
c0    cmpeq $b0.0 = $r0.58, 7
;;
;;
;;
c0    brf $b0.0, core_state_L63?3
;;
.call core_state_9217.ee_isdigit, caller, arg($r0.3:s32), ret($r0.3:s32)
c0    call $l0.0 = FUNC_core_state_9217.ee_isdigit
;;
c0    cmpeq $b0.0 = $r0.3, $r0.0
c0    ldw.d $r0.2 = 4[$r0.59]
;;
;;
;;
c0    add $r0.2 = $r0.2, 1
c0    brf $b0.0, core_state_L64?3
;;
c0    mov $r0.58 = 1
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    stw 4[$r0.59] = $r0.2
c0    goto core_state_L42?3
;;
-- core_state_L64?3
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    goto core_state_L42?3
;;
-- core_state_L63?3
c0    add $r0.57 = $r0.57, 1
;;
;;
c0    goto core_state_L42?3
;;
-- core_state_L44?3
c0    add $r0.57 = $r0.57, 1
c0    mov $r0.3 = $r0.58
;;
;;
c0    ldw $r0.2 = 0x24[$r0.1]
c0    goto core_state_L65?3
;;
-- core_state_L43?3
c0    mov $r0.3 = $r0.58
c0    ldw $r0.2 = 0x24[$r0.1]
;;
-- core_state_L65?3
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    ldw $r0.59 = 0x20[$r0.1]
;;
c0    ldw $r0.58 = 0x1c[$r0.1]
;;
c0    stw 0[$r0.2] = $r0.57
;;
c0    ldw $r0.57 = 0x18[$r0.1]
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
ENDOFFILE: core_state
FILE: core_util
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32)
-- FUNC_get_seed_32
c0    cmpeq $b0.0 = $r0.3, 1
;;
;;
;;
c0    brf $b0.0, core_util_L0?3
;;
c0    ldw $r0.3 = ((seed1_volatile+0)+0)[$r0.0]
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_util_L0?3
c0    cmpeq $b0.0 = $r0.3, 2
;;
;;
;;
c0    brf $b0.0, core_util_L1?3
;;
c0    ldw $r0.3 = ((seed2_volatile+0)+0)[$r0.0]
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_util_L1?3
c0    cmpeq $b0.0 = $r0.3, 3
;;
;;
;;
c0    brf $b0.0, core_util_L2?3
;;
c0    ldw $r0.3 = ((seed3_volatile+0)+0)[$r0.0]
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_util_L2?3
c0    cmpeq $b0.0 = $r0.3, 4
;;
;;
;;
c0    brf $b0.0, core_util_L3?3
;;
c0    ldw $r0.3 = ((seed4_volatile+0)+0)[$r0.0]
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_util_L3?3
c0    cmpeq $b0.0 = $r0.3, 5
;;
;;
;;
c0    brf $b0.0, core_util_L4?3
;;
c0    ldw $r0.3 = ((seed5_volatile+0)+0)[$r0.0]
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_util_L4?3
.return ret($r0.3:s32)
c0    mov $r0.3 = $r0.0
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32)
-- FUNC_crcu8
c0    zxth $r0.2 = $r0.4
c0    zxtb $r0.3 = $r0.3
;;
c0    mov $r0.7 = $r0.0
;;
;;
c0    mov $r0.4 = $r0.3
;;
-- core_util_L5?3
c0    and $r0.3 = $r0.2, 1
c0    and $r0.5 = $r0.4, 1
c0    xor $r0.6 = $r0.2, 16386
;;
c0    cmplt $b0.0 = $r0.7, 8
c0    shr $r0.4 = $r0.4, 1
c0    add $r0.7 = $r0.7, 1
;;
;;
c0    xor $r0.3 = $r0.3, $r0.5
c0    zxth $r0.6 = $r0.6
;;
c0    zxtb $r0.4 = $r0.4
c0    zxtb $r0.7 = $r0.7
c0    brf $b0.0, core_util_L6?3
;;
;;
c0    zxtb $r0.3 = $r0.3
;;
c0    cmplt $b0.0 = $r0.7, 8
c0    and $r0.5 = $r0.4, 1
c0    shr $r0.4 = $r0.4, 1
c0    add $r0.7 = $r0.7, 1
;;
;;
c0    cmpeq $b0.1 = $r0.3, 1
;;
c0    zxtb $r0.4 = $r0.4
c0    zxtb $r0.7 = $r0.7
;;
;;
c0    slct $r0.6 = $b0.1, $r0.6, $r0.2
c0    slctf $r0.3 = $b0.1, $r0.0, 1
;;
;;
;;
c0    shr $r0.6 = $r0.6, 1
c0    cmpne $b0.1 = $r0.3, $r0.0
;;
;;
;;
c0    or $r0.3 = $r0.6, 32768
c0    and $r0.6 = $r0.6, 32767
;;
;;
;;
c0    zxth $r0.3 = $r0.3
c0    zxth $r0.6 = $r0.6
;;
;;
;;
c0    slct $r0.3 = $b0.1, $r0.3, $r0.6
c0    brf $b0.0, core_util_L7?3
;;
;;
;;
c0    and $r0.6 = $r0.3, 1
c0    xor $r0.8 = $r0.3, 16386
;;
;;
;;
c0    xor $r0.6 = $r0.6, $r0.5
c0    zxth $r0.8 = $r0.8
;;
;;
;;
c0    zxtb $r0.6 = $r0.6
;;
;;
;;
c0    cmpeq $b0.0 = $r0.6, 1
;;
;;
;;
c0    slct $r0.8 = $b0.0, $r0.8, $r0.3
c0    slctf $r0.3 = $b0.0, $r0.0, 1
;;
;;
;;
c0    shr $r0.8 = $r0.8, 1
c0    cmpne $b0.0 = $r0.3, $r0.0
;;
;;
;;
c0    or $r0.3 = $r0.8, 32768
c0    and $r0.8 = $r0.8, 32767
;;
;;
;;
c0    zxth $r0.3 = $r0.3
c0    zxth $r0.8 = $r0.8
;;
;;
;;
c0    slct $r0.2 = $b0.0, $r0.3, $r0.8
;;
;;
c0    goto core_util_L5?3
;;
-- core_util_L7?3
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- core_util_L6?3
;;
.return ret($r0.3:u32)
c0    mov $r0.3 = $r0.2
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC_crcu16
c0    add $r0.1 = $r0.1, (-0x20)
c0    zxth $r0.4 = $r0.4
c0    zxtb $r0.2 = $r0.3
;;
c0    zxth $r0.5 = $r0.3
c0    stw 0x10[$r0.1] = $l0.0
;;
;;
c0    mov $r0.3 = $r0.2
;;
.call crcu8, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    stw 0x14[$r0.1] = $r0.5
c0    call $l0.0 = FUNC_crcu8
;;
c0    mov $r0.4 = $r0.3
;;
;;
c0    ldw $r0.5 = 0x14[$r0.1]
;;
;;
;;
c0    shr $r0.5 = $r0.5, 8
;;
;;
;;
c0    zxtb $r0.3 = $r0.5
;;
;;
.call crcu8, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crcu8
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC_crcu32
c0    add $r0.1 = $r0.1, (-0x20)
c0    zxth $r0.4 = $r0.4
c0    sxth $r0.2 = $r0.3
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    stw 0x14[$r0.1] = $r0.3
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    mov $r0.3 = $r0.2
c0    call $l0.0 = FUNC_crc16
;;
c0    mov $r0.4 = $r0.3
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
;;
;;
c0    shru $r0.2 = $r0.2, 16
;;
;;
;;
c0    sxth $r0.3 = $r0.2
;;
;;
.call crc16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crc16
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC_crc16
c0    add $r0.1 = $r0.1, (-0x20)
c0    zxth $r0.3 = $r0.3
c0    zxth $r0.4 = $r0.4
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
.call crcu16, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:u32)
c0    call $l0.0 = FUNC_crcu16
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg()
-- FUNC_check_data_types
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.3 = $r0.0
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
ENDOFFILE: core_util
FILE: floatlib
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
-- floatlib_FUNC_estimateDiv64To32
c0    add $r0.1 = $r0.1, (-0x20)
c0    cmpleu $b0.0 = $r0.5, $r0.3
c0    mov $r0.2 = $r0.3
;;
c0    mov $r0.3 = (~0x0)
;;
;;
c0    brf $b0.0, floatlib_L0?3
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L0?3
c0    shru $r0.11 = $r0.5, 16
c0    mtb $b0.0 = $r0.0
c0    mov $r0.12 = (~0xffff)
;;
c0    shl $r0.3 = $r0.5, 16
c0    mov $r0.9 = $r0.12
c0    add $r0.13 = $r0.1, 0x4
c0    mov $r0.6 = $r0.1
;;
c0    mov $r0.10 = $r0.0
;;
c0    shl $r0.16 = $r0.11, 16
c0    cmplt $r0.14 = $r0.11, $r0.0
c0    cmpgeu $r0.15 = $r0.2, $r0.11
;;
;;
;;
c0    shru $r0.18 = $r0.11, $r0.14
c0    shru $r0.17 = $r0.2, $r0.14
c0    cmpgtu $b0.2 = $r0.16, $r0.2
c0    mtb $b0.1 = $r0.14
;;
;;
;;
c0    addcg $r0.14, $b0.3 = $r0.17, $r0.17, $b0.0
;;
c0    divs $r0.14, $b0.3 = $r0.0, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.14, $r0.14, $b0.0
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    divs $r0.14, $b0.3 = $r0.14, $r0.18, $b0.3
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
;;
c0    divs $r0.14, $b0.4 = $r0.14, $r0.18, $b0.4
c0    addcg $r0.16, $b0.3 = $r0.17, $r0.17, $b0.3
;;
c0    addcg $r0.17, $b0.4 = $r0.16, $r0.16, $b0.4
c0    cmpge $r0.14 = $r0.14, $r0.0
;;
c0    orc $r0.17 = $r0.17, $r0.0
;;
;;
;;
c0    sh1add $r0.17 = $r0.17, $r0.14
;;
;;
;;
c0    slct $r0.15 = $b0.1, $r0.15, $r0.17
;;
;;
;;
c0    shl $r0.15 = $r0.15, 16
;;
;;
;;
c0    slct $r0.8 = $b0.2, $r0.15, $r0.12
;;
;;
;;
c0    add $r0.7 = $r0.8, $r0.12
c0    mpylhu $r0.15 = $r0.5, $r0.8
c0    mpylhu $r0.14 = $r0.8, $r0.5
;;
c0    mpyhhu $r0.5 = $r0.5, $r0.8
c0    mpyllu $r0.12 = $r0.5, $r0.8
;;
;;
c0    add $r0.15 = $r0.14, $r0.15
;;
;;
;;
c0    shru $r0.15 = $r0.15, 16
c0    cmpltu $r0.14 = $r0.15, $r0.14
c0    shl $r0.16 = $r0.15, 16
;;
;;
;;
c0    shl $r0.14 = $r0.14, 16
c0    add $r0.12 = $r0.12, $r0.16
c0    add $r0.15 = $r0.15, $r0.5
c0    mov $r0.5 = $r0.13
;;
;;
;;
c0    cmpltu $r0.16 = $r0.12, $r0.16
c0    stw 0x8[$r0.1] = $r0.12
c0    sub $r0.4 = $r0.4, $r0.12
c0    cmpltu $r0.13 = $r0.4, $r0.12
;;
;;
;;
c0    add $r0.14 = $r0.14, $r0.16
c0    stw 0[$r0.1] = $r0.4
;;
c0    mov $r0.4 = $r0.11
;;
;;
c0    add $r0.15 = $r0.15, $r0.14
;;
;;
;;
c0    stw 0xc[$r0.1] = $r0.15
c0    sub $r0.2 = $r0.2, $r0.15
;;
;;
;;
c0    sub $r0.2 = $r0.2, $r0.13
;;
;;
;;
c0    stw 0x4[$r0.1] = $r0.2
;;
-- floatlib_L1?3
c0    ldw.d $r0.2 = 0[$r0.1]
;;
c0    ldw $r0.11 = 0x4[$r0.1]
;;
;;
c0    add $r0.12 = $r0.2, $r0.3
;;
c0    cmplt $b0.0 = $r0.11, $r0.0
c0    add $r0.13 = $r0.11, $r0.4
;;
;;
c0    cmpltu $r0.2 = $r0.12, $r0.2
;;
c0    brf $b0.0, floatlib_L2?3
;;
c0    stw 0[$r0.6] = $r0.12
c0    add $r0.8 = $r0.8, -131072
;;
c0    add $r0.13 = $r0.13, $r0.2
c0    ldw.d $r0.2 = 0[$r0.1]
;;
;;
;;
c0    stw 0[$r0.5] = $r0.13
c0    add $r0.11 = $r0.3, $r0.2
;;
c0    ldw $r0.12 = 0x4[$r0.1]
;;
;;
c0    cmpltu $r0.2 = $r0.11, $r0.2
;;
c0    cmplt $b0.0 = $r0.12, $r0.0
;;
;;
c0    add $r0.2 = $r0.4, $r0.2
;;
c0    brf $b0.0, floatlib_L3?3
;;
c0    stw 0[$r0.6] = $r0.11
c0    add $r0.10 = $r0.10, -131072
;;
c0    add $r0.2 = $r0.2, $r0.12
c0    ldw.d $r0.11 = 0[$r0.1]
;;
;;
;;
c0    stw 0[$r0.5] = $r0.2
c0    add $r0.12 = $r0.3, $r0.11
;;
c0    ldw $r0.2 = 0x4[$r0.1]
;;
;;
c0    cmpltu $r0.11 = $r0.12, $r0.11
;;
c0    cmplt $b0.0 = $r0.2, $r0.0
;;
;;
c0    add $r0.11 = $r0.4, $r0.11
;;
c0    brf $b0.0, floatlib_L4?3
;;
c0    stw 0[$r0.6] = $r0.12
c0    add $r0.7 = $r0.7, (~0x1ffff)
;;
c0    add $r0.11 = $r0.11, $r0.2
c0    ldw.d $r0.2 = 0[$r0.1]
;;
;;
;;
c0    stw 0[$r0.5] = $r0.11
c0    add $r0.12 = $r0.3, $r0.2
;;
c0    ldw $r0.11 = 0x4[$r0.1]
;;
;;
c0    cmpltu $r0.2 = $r0.12, $r0.2
;;
c0    cmplt $b0.0 = $r0.11, $r0.0
;;
;;
c0    add $r0.2 = $r0.4, $r0.2
;;
c0    brf $b0.0, floatlib_L5?3
;;
c0    stw 0[$r0.6] = $r0.12
c0    add $r0.9 = $r0.9, (~0x1ffff)
;;
c0    add $r0.2 = $r0.2, $r0.11
;;
;;
;;
c0    stw 0[$r0.5] = $r0.2
c0    goto floatlib_L1?3
;;
-- floatlib_L5?3
c0    mov $r0.10 = $r0.9
c0    ldw $r0.5 = 0[$r0.1]
c0    shl $r0.7 = $r0.4, 16
;;
c0    cmplt $r0.6 = $r0.4, $r0.0
c0    mtb $b0.0 = $r0.0
;;
c0    ldw $r0.2 = 0x4[$r0.1]
;;
c0    add $r0.8 = $r0.8, $r0.10
c0    goto floatlib_L6?3
;;
-- floatlib_L4?3
c0    mov $r0.10 = $r0.9
c0    mov $r0.8 = $r0.7
c0    ldw $r0.5 = 0[$r0.1]
c0    shl $r0.7 = $r0.4, 16
;;
c0    cmplt $r0.6 = $r0.4, $r0.0
c0    mtb $b0.0 = $r0.0
;;
c0    ldw $r0.2 = 0x4[$r0.1]
;;
c0    add $r0.8 = $r0.8, $r0.10
c0    goto floatlib_L6?3
;;
-- floatlib_L3?3
c0    mov $r0.8 = $r0.7
c0    ldw $r0.5 = 0[$r0.1]
c0    shl $r0.7 = $r0.4, 16
;;
c0    cmplt $r0.6 = $r0.4, $r0.0
c0    mtb $b0.0 = $r0.0
;;
c0    ldw $r0.2 = 0x4[$r0.1]
;;
c0    add $r0.8 = $r0.8, $r0.10
c0    goto floatlib_L6?3
;;
-- floatlib_L2?3
c0    ldw $r0.5 = 0[$r0.1]
c0    shl $r0.7 = $r0.4, 16
c0    cmplt $r0.6 = $r0.4, $r0.0
c0    mtb $b0.0 = $r0.0
;;
c0    ldw $r0.2 = 0x4[$r0.1]
;;
c0    add $r0.8 = $r0.8, $r0.10
;;
-- floatlib_L6?3
c0    shru $r0.5 = $r0.5, 16
c0    shru $r0.9 = $r0.4, $r0.6
c0    mtb $b0.1 = $r0.6
;;
c0    shl $r0.2 = $r0.2, 16
;;
;;
;;
c0    or $r0.5 = $r0.5, $r0.2
;;
;;
;;
c0    stw 0x4[$r0.1] = $r0.5
c0    shru $r0.6 = $r0.5, $r0.6
c0    cmpgeu $r0.4 = $r0.5, $r0.4
c0    cmpgtu $b0.2 = $r0.7, $r0.5
;;
;;
;;
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.0
;;
c0    divs $r0.5, $b0.3 = $r0.0, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.0
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    divs $r0.5, $b0.3 = $r0.5, $r0.9, $b0.3
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
;;
c0    divs $r0.5, $b0.4 = $r0.5, $r0.9, $b0.4
c0    addcg $r0.2, $b0.3 = $r0.6, $r0.6, $b0.3
;;
c0    addcg $r0.6, $b0.4 = $r0.2, $r0.2, $b0.4
c0    cmpge $r0.5 = $r0.5, $r0.0
;;
c0    orc $r0.6 = $r0.6, $r0.0
;;
;;
;;
c0    sh1add $r0.6 = $r0.6, $r0.5
;;
;;
;;
c0    slct $r0.4 = $b0.1, $r0.4, $r0.6
;;
;;
;;
c0    slct $r0.4 = $b0.2, $r0.4, 65535
;;
;;
;;
c0    or $r0.3 = $r0.8, $r0.4
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32)
-- floatlib_FUNC_countLeadingZeros32
c0    cmpgeu $b0.0 = $r0.3, 65536
;;
c0    shl $r0.2 = $r0.3, 16
;;
;;
c0    slct $r0.4 = $b0.0, $r0.0, 16
;;
c0    slct $r0.3 = $b0.0, $r0.3, $r0.2
;;
;;
c0    add $r0.2 = $r0.4, 8
;;
c0    cmpgeu $b0.0 = $r0.3, 16777216
c0    shl $r0.5 = $r0.3, 8
;;
;;
;;
c0    slct $r0.3 = $b0.0, $r0.3, $r0.5
c0    slct $r0.4 = $b0.0, $r0.4, $r0.2
;;
;;
;;
c0    shru $r0.3 = $r0.3, 24
;;
;;
;;
c0    sh2add $r0.3 = $r0.3, (floatlib_?1PACKET.37+0)
;;
;;
;;
c0    ldw $r0.3 = 0[$r0.3]
;;
;;
;;
c0    add $r0.3 = $r0.4, $r0.3
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32)
-- floatlib_FUNC_float_raise
c0    ldw $r0.2 = ((floatlib_?1PACKET.3+0)+0)[$r0.0]
;;
;;
;;
c0    or $r0.3 = $r0.3, $r0.2
;;
;;
;;
.return ret()
c0    stw ((floatlib_?1PACKET.3+0)+0)[$r0.0] = $r0.3
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
-- floatlib_FUNC_float32ToCommonNaN
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.2 = $r0.3, 22
c0    shru $r0.6 = $r0.3, 31
;;
c0    and $r0.7 = $r0.3, 4194303
c0    shl $r0.4 = $r0.3, 9
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    mov $r0.5 = $r0.0
;;
c0    and $r0.2 = $r0.2, 511
c0    mov $r0.8 = $r0.3
;;
c0    mov $r0.3 = $r0.6
;;
;;
c0    cmpeq $r0.2 = $r0.2, 510
;;
;;
;;
c0    andl $b0.0 = $r0.2, $r0.7
;;
;;
;;
c0    br $b0.0, floatlib_L7?3
;;
-- floatlib_L8?3
.return ret($r0.3:s32,$r0.4:u32,$r0.5:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L7?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    stw 0x14[$r0.1] = $r0.8
c0    mov $r0.3 = 16
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    mov $r0.5 = $r0.0
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
;;
;;
c0    shru $r0.3 = $r0.2, 31
c0    shl $r0.4 = $r0.2, 9
;;
;;
c0    goto floatlib_L8?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32)
-- floatlib_FUNC_propagateFloat32NaN
c0    add $r0.1 = $r0.1, (-0x40)
c0    shl $r0.2 = $r0.4, 1
c0    shru $r0.5 = $r0.4, 22
;;
c0    shru $r0.7 = $r0.3, 22
c0    or $r0.6 = $r0.3, 4194304
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    and $r0.9 = $r0.4, 4194303
c0    or $r0.8 = $r0.4, 4194304
;;
c0    cmpgtu $r0.2 = $r0.2, (~0xffffff)
c0    and $r0.5 = $r0.5, 511
;;
c0    and $r0.7 = $r0.7, 511
c0    and $r0.3 = $r0.3, 4194303
;;
;;
c0    cmpeq $r0.5 = $r0.5, 510
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
c0    cmpeq $r0.7 = $r0.7, 510
;;
;;
c0    andl $r0.5 = $r0.5, $r0.9
c0    slct $r0.4 = $b0.0, $r0.8, $r0.6
;;
c0    andl $r0.7 = $r0.7, $r0.3
;;
;;
c0    cmpne $b0.0 = $r0.5, $r0.0
;;
c0    or $r0.9 = $r0.5, $r0.7
c0    cmpne $b0.1 = $r0.7, $r0.0
;;
;;
;;
c0    cmpne $b0.2 = $r0.9, $r0.0
c0    slct $r0.4 = $b0.1, $r0.6, $r0.4
;;
;;
;;
c0    slct $r0.3 = $b0.0, $r0.8, $r0.4
c0    br $b0.2, floatlib_L9?3
;;
-- floatlib_L10?3
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L9?3
c0    stw 0x14[$r0.1] = $r0.5
;;
c0    stw 0x18[$r0.1] = $r0.7
;;
c0    stw 0x1c[$r0.1] = $r0.6
c0    mov $r0.3 = 16
;;
c0    stw 0x20[$r0.1] = $r0.8
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    stw 0x24[$r0.1] = $r0.2
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw $r0.6 = 0x1c[$r0.1]
;;
c0    ldw $r0.8 = 0x20[$r0.1]
;;
c0    ldw $r0.2 = 0x24[$r0.1]
;;
c0    ldw $r0.7 = 0x18[$r0.1]
;;
c0    ldw $r0.5 = 0x14[$r0.1]
;;
c0    cmpne $b0.1 = $r0.2, $r0.0
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    cmpne $b0.2 = $r0.7, $r0.0
;;
c0    cmpne $b0.0 = $r0.5, $r0.0
;;
c0    slct $r0.2 = $b0.1, $r0.8, $r0.6
;;
;;
;;
c0    slct $r0.4 = $b0.2, $r0.6, $r0.2
;;
;;
;;
c0    slct $r0.3 = $b0.0, $r0.8, $r0.4
c0    goto floatlib_L10?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32)
-- floatlib_FUNC_float64ToCommonNaN
c0    add $r0.1 = $r0.1, (-0x40)
c0    shru $r0.2 = $r0.3, 19
c0    shru $r0.6 = $r0.3, 31
;;
c0    and $r0.7 = $r0.3, 524287
c0    shl $r0.5 = $r0.4, 12
c0    stw 0x1c[$r0.1] = $l0.0
;;
c0    shl $r0.8 = $r0.3, 12
c0    shru $r0.9 = $r0.4, 20
;;
c0    and $r0.2 = $r0.2, 4095
c0    mov $r0.10 = $r0.3
;;
c0    orl $r0.7 = $r0.4, $r0.7
;;
c0    or $r0.8 = $r0.8, $r0.9
c0    mov $r0.3 = $r0.6
;;
c0    cmpeq $r0.2 = $r0.2, 4094
;;
;;
c0    mov $r0.9 = $r0.4
;;
c0    andl $b0.0 = $r0.2, $r0.7
c0    mov $r0.4 = $r0.8
;;
;;
;;
c0    br $b0.0, floatlib_L11?3
;;
-- floatlib_L12?3
c0    stw 0x10[$r0.1] = $r0.6
;;
c0    stw 0x18[$r0.1] = $r0.5
;;
.return ret($r0.3:s32,$r0.4:u32,$r0.5:u32)
c0    stw 0x14[$r0.1] = $r0.8
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L11?3
c0    stw 0x20[$r0.1] = $r0.9
c0    mov $r0.3 = 16
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    stw 0x24[$r0.1] = $r0.10
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw $l0.0 = 0x1c[$r0.1]
;;
c0    ldw $r0.2 = 0x20[$r0.1]
;;
c0    ldw $r0.7 = 0x24[$r0.1]
;;
;;
c0    shl $r0.5 = $r0.2, 12
c0    shru $r0.9 = $r0.2, 20
;;
c0    shru $r0.6 = $r0.7, 31
c0    shl $r0.2 = $r0.7, 12
;;
;;
;;
c0    or $r0.8 = $r0.2, $r0.9
c0    mov $r0.3 = $r0.6
;;
;;
;;
c0    mov $r0.4 = $r0.8
c0    goto floatlib_L12?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:s32,$r0.4:u32,$r0.5:u32)
-- floatlib_FUNC_commonNaNToFloat64
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.2 = $r0.4, 12
c0    shl $r0.3 = $r0.3, 31
;;
c0    shru $r0.5 = $r0.5, 12
c0    shl $r0.4 = $r0.4, 20
;;
;;
c0    or $r0.2 = $r0.2, 2146959360
;;
c0    or $r0.4 = $r0.5, $r0.4
;;
;;
c0    or $r0.3 = $r0.2, $r0.3
;;
c0    stw 0x4[$r0.1] = $r0.4
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    stw 0[$r0.1] = $r0.3
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- floatlib_FUNC_propagateFloat64NaN
c0    add $r0.1 = $r0.1, (-0x40)
c0    shl $r0.2 = $r0.5, 1
c0    shru $r0.7 = $r0.5, 19
;;
c0    and $r0.8 = $r0.5, 1048575
c0    shru $r0.9 = $r0.3, 19
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    or $r0.10 = $r0.3, 524288
c0    or $r0.11 = $r0.5, 524288
;;
c0    cmpgeu $r0.2 = $r0.2, (~0x1fffff)
c0    and $r0.7 = $r0.7, 4095
;;
c0    orl $r0.8 = $r0.6, $r0.8
c0    and $r0.12 = $r0.5, 524287
;;
c0    and $r0.9 = $r0.9, 4095
c0    and $r0.3 = $r0.3, 524287
;;
c0    cmpeq $r0.7 = $r0.7, 4094
;;
c0    andl $r0.2 = $r0.2, $r0.8
c0    orl $r0.12 = $r0.6, $r0.12
;;
c0    cmpeq $r0.9 = $r0.9, 4094
c0    orl $r0.3 = $r0.4, $r0.3
c0    mov $r0.5 = $r0.4
;;
;;
c0    andl $r0.7 = $r0.7, $r0.12
;;
c0    andl $r0.9 = $r0.9, $r0.3
c0    mov $r0.4 = $r0.6
;;
;;
c0    cmpne $b0.0 = $r0.7, $r0.0
;;
c0    or $r0.6 = $r0.7, $r0.9
c0    mov $r0.3 = $r0.11
;;
;;
;;
c0    cmpne $b0.1 = $r0.6, $r0.0
;;
;;
;;
c0    br $b0.1, floatlib_L13?3
;;
-- floatlib_L14?3
c0    brf $b0.0, floatlib_L15?3
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L15?3
c0    cmpne $b0.0 = $r0.9, $r0.0
c0    mov $r0.4 = $r0.5
c0    mov $r0.6 = $r0.4
c0    mov $r0.11 = $r0.3
;;
c0    mov $r0.3 = $r0.10
;;
;;
c0    brf $b0.0, floatlib_L16?3
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L16?3
c0    cmpne $b0.0 = $r0.2, $r0.0
c0    mov $r0.4 = $r0.6
c0    mov $r0.2 = $r0.4
c0    mov $r0.10 = $r0.3
;;
c0    mov $r0.3 = $r0.11
;;
;;
c0    brf $b0.0, floatlib_L17?3
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L17?3
.return ret($r0.3:u32,$r0.4:u32)
c0    mov $r0.4 = $r0.2
c0    mov $r0.3 = $r0.10
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L13?3
c0    stw 0x14[$r0.1] = $r0.5
;;
c0    stw 0x18[$r0.1] = $r0.3
;;
c0    stw 0x1c[$r0.1] = $r0.4
c0    mov $r0.3 = 16
;;
c0    stw 0x20[$r0.1] = $r0.10
;;
c0    stw 0x24[$r0.1] = $r0.9
;;
c0    stw 0x28[$r0.1] = $r0.2
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    stw 0x2c[$r0.1] = $r0.7
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    ldw $r0.5 = 0x14[$r0.1]
;;
c0    ldw $r0.7 = 0x2c[$r0.1]
;;
c0    ldw $r0.3 = 0x18[$r0.1]
;;
c0    ldw $r0.4 = 0x1c[$r0.1]
;;
c0    cmpne $b0.0 = $r0.7, $r0.0
c0    ldw $r0.10 = 0x20[$r0.1]
;;
c0    ldw $r0.9 = 0x24[$r0.1]
;;
c0    ldw $r0.2 = 0x28[$r0.1]
;;
;;
c0    goto floatlib_L14?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.1 + 52, 12; $r0.3:s32,$r0.4:s32,$r0.5:u32)
-- floatlib_FUNC_roundAndPackFloat32
c0    add $r0.1 = $r0.1, (-0x40)
c0    ldw $r0.2 = ((floatlib_?1PACKET.2+0)+0)[$r0.0]
;;
c0    cmpne $b0.0 = $r0.3, $r0.0
c0    and $r0.6 = $r0.5, 127
c0    zxth $r0.7 = $r0.4
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    ldw.d $r0.8 = ((floatlib_?1PACKET.3+0)+0)[$r0.0]
;;
c0    cmpeq $r0.9 = $r0.2, $r0.0
c0    cmpeq $b0.3 = $r0.2, 3
c0    cmpeq $b0.1 = $r0.2, 2
c0    cmpeq $b0.2 = $r0.2, 1
;;
c0    cmpge $b0.4 = $r0.7, 253
c0    cmpne $b0.5 = $r0.6, $r0.0
c0    xor $r0.10 = $r0.6, 64
;;
c0    stw 0x34[$r0.1] = $r0.3
c0    or $r0.8 = $r0.8, 1
;;
c0    slct $r0.2 = $b0.1, $r0.0, 127
c0    slct $r0.11 = $b0.2, $r0.0, 127
c0    cmpeq $b0.6 = $r0.9, $r0.0
;;
c0    cmpeq $r0.10 = $r0.10, $r0.0
c0    ldw.d $r0.7 = 0x34[$r0.1]
;;
c0    stw 0x38[$r0.1] = $r0.4
;;
c0    stw 0x3c[$r0.1] = $r0.5
c0    slct $r0.2 = $b0.0, $r0.2, $r0.11
;;
c0    ldw.d $r0.12 = 0x3c[$r0.1]
c0    and $r0.10 = $r0.9, $r0.10
c0    shl $r0.7 = $r0.7, 31
;;
;;
c0    slctf $r0.2 = $b0.3, $r0.2, $r0.0
;;
c0    orc $r0.10 = $r0.10, $r0.0
;;
;;
c0    slct $r0.2 = $b0.6, $r0.2, 64
;;
;;
c0    br $b0.4, floatlib_L18?3
;;
-- floatlib_L19?3
c0    add $r0.12 = $r0.12, $r0.2
c0    brf $b0.5, floatlib_L20?3
;;
c0    stw ((floatlib_?1PACKET.3+0)+0)[$r0.0] = $r0.8
;;
-- floatlib_L21?3
;;
c0    shru $r0.12 = $r0.12, 7
;;
;;
;;
c0    and $r0.12 = $r0.12, $r0.10
;;
;;
;;
c0    stw 0x3c[$r0.1] = $r0.12
c0    cmpeq $b0.0 = $r0.12, $r0.0
;;
c0    ldw.d $r0.2 = 0x3c[$r0.1]
;;
;;
c0    brf $b0.0, floatlib_L22?3
;;
c0    stw 0x38[$r0.1] = $r0.0
c0    add $r0.2 = $r0.2, $r0.7
;;
-- floatlib_L23?3
c0    ldw $r0.4 = 0x38[$r0.1]
;;
;;
;;
c0    shl $r0.4 = $r0.4, 23
;;
;;
;;
c0    add $r0.3 = $r0.2, $r0.4
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L22?3
c0    add $r0.2 = $r0.2, $r0.7
c0    goto floatlib_L23?3
;;
-- floatlib_L20?3
c0    ldw $r0.3 = 0x3c[$r0.1]
;;
;;
;;
c0    mov $r0.12 = $r0.3
;;
c0    add $r0.12 = $r0.12, $r0.2
;;
c0    goto floatlib_L21?3
;;
-- floatlib_L18?3
c0    cmpgt $r0.4 = $r0.4, 253
c0    cmpeq $r0.11 = $r0.4, 253
c0    add $r0.5 = $r0.5, $r0.2
c0    stw 0x14[$r0.1] = $r0.2
;;
c0    mov $r0.3 = 5
;;
;;
c0    cmplt $r0.5 = $r0.5, $r0.0
;;
;;
;;
c0    andl $r0.11 = $r0.11, $r0.5
;;
;;
;;
c0    orl $b0.0 = $r0.4, $r0.11
;;
;;
;;
c0    brf $b0.0, floatlib_L24?3
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw $r0.4 = 0x34[$r0.1]
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    shl $r0.4 = $r0.4, 31
;;
c0    cmpeq $r0.2 = $r0.2, $r0.0
;;
;;
c0    add $r0.4 = $r0.4, 2139095040
;;
;;
;;
c0    sub $r0.3 = $r0.4, $r0.2
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L24?3
c0    mov $r0.3 = 2
c0    stw 0x18[$r0.1] = $r0.9
;;
c0    ldw.d $r0.4 = 0x3c[$r0.1]
;;
c0    ldw $r0.5 = 0x38[$r0.1]
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
c0    ldw.d $r0.13 = ((floatlib_?1PACKET.1+0)+0)[$r0.0]
c0    cmpne $r0.11 = $r0.4, $r0.0
;;
c0    cmplt $b0.0 = $r0.5, $r0.0
c0    sub $r0.14 = $r0.0, $r0.5
c0    cmplt $r0.5 = $r0.5, -1
;;
c0    add $r0.2 = $r0.4, $r0.2
;;
c0    cmpeq $r0.13 = $r0.13, 1
;;
c0    sub $r0.15 = $r0.0, $r0.14
c0    shru $r0.16 = $r0.4, $r0.14
c0    cmpge $b0.1 = $r0.14, 32
c0    cmpeq $b0.2 = $r0.14, $r0.0
;;
c0    cmpltu $r0.2 = $r0.2, (~0x7fffffff)
c0    brf $b0.0, floatlib_L25?3
;;
c0    stw 0x38[$r0.1] = $r0.0
;;
c0    and $r0.15 = $r0.15, 31
;;
c0    orl $r0.13 = $r0.13, $r0.2
;;
;;
c0    shl $r0.15 = $r0.4, $r0.15
;;
c0    orl $r0.13 = $r0.13, $r0.5
;;
;;
c0    cmpne $r0.15 = $r0.15, $r0.0
;;
;;
;;
c0    or $r0.16 = $r0.16, $r0.15
;;
;;
;;
c0    slct $r0.11 = $b0.1, $r0.11, $r0.16
;;
;;
;;
c0    slct $r0.4 = $b0.2, $r0.4, $r0.11
;;
;;
;;
c0    stw 0x3c[$r0.1] = $r0.4
c0    and $r0.6 = $r0.4, 127
;;
;;
;;
c0    andl $b0.0 = $r0.13, $r0.6
c0    stw 0x1c[$r0.1] = $r0.6
;;
;;
;;
c0    brf $b0.0, floatlib_L26?3
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw.d $r0.3 = ((floatlib_?1PACKET.3+0)+0)[$r0.0]
;;
c0    ldw $r0.6 = 0x1c[$r0.1]
;;
c0    ldw $r0.9 = 0x18[$r0.1]
;;
c0    or $r0.8 = $r0.3, 1
c0    ldw.d $r0.3 = 0x34[$r0.1]
;;
c0    cmpne $b0.5 = $r0.6, $r0.0
c0    ldw.d $r0.12 = 0x3c[$r0.1]
c0    xor $r0.4 = $r0.6, 64
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    shl $r0.7 = $r0.3, 31
c0    ldw $r0.2 = 0x14[$r0.1]
;;
c0    cmpeq $r0.4 = $r0.4, $r0.0
;;
;;
;;
c0    and $r0.4 = $r0.9, $r0.4
;;
;;
;;
c0    orc $r0.10 = $r0.4, $r0.0
;;
;;
c0    goto floatlib_L19?3
;;
-- floatlib_L26?3
c0    ldw $r0.6 = 0x1c[$r0.1]
;;
c0    ldw $r0.9 = 0x18[$r0.1]
;;
c0    ldw.d $r0.12 = 0x3c[$r0.1]
;;
c0    cmpne $b0.5 = $r0.6, $r0.0
c0    xor $r0.3 = $r0.6, 64
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
;;
c0    cmpeq $r0.3 = $r0.3, $r0.0
;;
;;
;;
c0    and $r0.3 = $r0.9, $r0.3
;;
;;
;;
c0    orc $r0.10 = $r0.3, $r0.0
;;
;;
c0    goto floatlib_L19?3
;;
-- floatlib_L25?3
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    ldw $r0.9 = 0x18[$r0.1]
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
;;
c0    goto floatlib_L19?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:s32,$r0.4:s32,$r0.5:u32)
-- floatlib_FUNC_normalizeRoundAndPackFloat32
c0    add $r0.1 = $r0.1, (-0x20)
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    stw 0x14[$r0.1] = $r0.3
;;
c0    stw 0x18[$r0.1] = $r0.4
c0    mov $r0.3 = $r0.5
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x1c[$r0.1] = $r0.5
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
c0    add $r0.2 = $r0.3, -1
;;
c0    ldw $r0.6 = 0x18[$r0.1]
;;
c0    ldw $r0.7 = 0x1c[$r0.1]
;;
;;
c0    add $r0.6 = $r0.6, 1
;;
c0    shl $r0.5 = $r0.7, $r0.2
;;
;;
c0    sub $r0.4 = $r0.6, $r0.3
c0    ldw $r0.3 = 0x14[$r0.1]
;;
;;
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_roundAndPackFloat32
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32)
-- floatlib_FUNC_normalizeFloat64Subnormal
c0    add $r0.1 = $r0.1, (-0x40)
c0    cmpeq $b0.0 = $r0.3, $r0.0
c0    mov $r0.2 = $r0.3
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    stw 0x14[$r0.1] = $r0.7
;;
c0    stw 0x18[$r0.1] = $r0.6
c0    mov $r0.3 = $r0.4
c0    brf $b0.0, floatlib_L27?3
;;
c0    stw 0x1c[$r0.1] = $r0.5
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x20[$r0.1] = $r0.4
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
c0    add $r0.2 = $r0.3, -11
c0    rsub $r0.4 = -20, $r0.3
c0    ldw $r0.6 = 0x18[$r0.1]
;;
c0    ldw $r0.7 = 0x14[$r0.1]
;;
c0    ldw $r0.5 = 0x20[$r0.1]
;;
c0    sub $r0.3 = $r0.0, $r0.2
c0    cmpge $b0.0 = $r0.2, $r0.0
c0    and $r0.8 = $r0.2, 31
c0    ldw $r0.9 = 0x1c[$r0.1]
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    shl $r0.10 = $r0.5, $r0.2
;;
c0    shru $r0.3 = $r0.5, $r0.3
c0    shl $r0.8 = $r0.5, $r0.8
;;
;;
;;
c0    slct $r0.10 = $b0.0, $r0.10, $r0.3
c0    slctf $r0.8 = $b0.0, $r0.8, $r0.0
;;
;;
;;
c0    stw 0[$r0.6] = $r0.10
;;
c0    stw 0[$r0.7] = $r0.8
;;
.return ret()
c0    stw 0[$r0.9] = $r0.4
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L27?3
c0    stw 0x1c[$r0.1] = $r0.5
c0    mov $r0.3 = $r0.2
;;
c0    stw 0x20[$r0.1] = $r0.4
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x24[$r0.1] = $r0.2
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
c0    add $r0.2 = $r0.3, -11
c0    rsub $r0.3 = 12, $r0.3
c0    ldw $r0.7 = 0x14[$r0.1]
;;
c0    ldw $r0.4 = 0x20[$r0.1]
;;
c0    ldw $r0.5 = 0x24[$r0.1]
;;
c0    sub $r0.6 = $r0.0, $r0.2
c0    cmpeq $b0.0 = $r0.2, $r0.0
c0    ldw $r0.8 = 0x18[$r0.1]
;;
c0    shl $r0.9 = $r0.4, $r0.2
c0    ldw $r0.10 = 0x1c[$r0.1]
;;
c0    shl $r0.2 = $r0.5, $r0.2
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    and $r0.6 = $r0.6, 31
;;
c0    stw 0[$r0.7] = $r0.9
;;
;;
c0    shru $r0.4 = $r0.4, $r0.6
;;
;;
;;
c0    or $r0.2 = $r0.2, $r0.4
;;
;;
;;
c0    slct $r0.5 = $b0.0, $r0.5, $r0.2
;;
;;
;;
c0    stw 0[$r0.8] = $r0.5
;;
.return ret()
c0    stw 0[$r0.10] = $r0.3
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32)
-- floatlib_FUNC_packFloat64
c0    shl $r0.4 = $r0.4, 20
c0    shl $r0.3 = $r0.3, 31
;;
;;
;;
c0    add $r0.5 = $r0.5, $r0.3
;;
;;
;;
c0    add $r0.3 = $r0.5, $r0.4
c0    mov $r0.4 = $r0.6
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.1 + 48, 20; $r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32,$r0.7:u32)
-- floatlib_FUNC_roundAndPackFloat64
c0    add $r0.1 = $r0.1, (-0x40)
c0    cmplt $r0.2 = $r0.7, $r0.0
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    ldw $r0.8 = ((floatlib_?1PACKET.2+0)+0)[$r0.0]
;;
c0    stw 0x30[$r0.1] = $r0.3
;;
c0    stw 0x34[$r0.1] = $r0.4
;;
c0    stw 0x38[$r0.1] = $r0.5
c0    cmpeq $r0.3 = $r0.8, $r0.0
c0    cmpeq $b0.0 = $r0.8, 3
;;
c0    stw 0x3c[$r0.1] = $r0.6
;;
c0    stw 0x40[$r0.1] = $r0.7
;;
c0    cmpeq $b0.1 = $r0.3, $r0.0
;;
;;
;;
c0    brf $b0.1, floatlib_L28?3
;;
c0    mov $r0.2 = $r0.0
c0    brf $b0.0, floatlib_L29?3
;;
-- floatlib_L28?3
c0    ldw $r0.7 = 0x34[$r0.1]
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
c0    ldw.d $r0.9 = 0x40[$r0.1]
;;
c0    ldw.d $r0.10 = ((floatlib_?1PACKET.3+0)+0)[$r0.0]
;;
c0    zxth $r0.11 = $r0.7
c0    ldw.d $r0.12 = 0x40[$r0.1]
;;
c0    cmpne $b0.1 = $r0.9, $r0.0
c0    ldw.d $r0.13 = 0x3c[$r0.1]
;;
c0    or $r0.10 = $r0.10, 1
c0    ldw.d $r0.14 = 0x38[$r0.1]
;;
c0    cmpge $b0.2 = $r0.11, 2045
c0    add $r0.15 = $r0.12, $r0.12
;;
c0    add $r0.9 = $r0.13, 1
c0    ldw.d $r0.16 = 0x30[$r0.1]
;;
c0    ldw.d $r0.4 = 0x34[$r0.1]
;;
c0    cmpeq $r0.15 = $r0.15, $r0.0
c0    br $b0.2, floatlib_L30?3
;;
-- floatlib_L31?3
c0    cmpltu $r0.13 = $r0.9, $r0.13
c0    brf $b0.1, floatlib_L32?3
;;
c0    stw ((floatlib_?1PACKET.3+0)+0)[$r0.0] = $r0.10
c0    brf $b0.0, floatlib_L33?3
;;
-- floatlib_L34?3
c0    and $r0.3 = $r0.3, $r0.15
;;
c0    add $r0.14 = $r0.14, $r0.13
;;
;;
c0    orc $r0.3 = $r0.3, $r0.0
;;
c0    stw 0x38[$r0.1] = $r0.14
;;
c0    ldw $r0.5 = 0x38[$r0.1]
;;
c0    and $r0.9 = $r0.9, $r0.3
;;
;;
;;
c0    stw 0x3c[$r0.1] = $r0.9
c0    mov $r0.3 = $r0.16
;;
-- floatlib_L35?3
c0    ldw $r0.6 = 0x3c[$r0.1]
;;
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L33?3
c0    ldw $r0.2 = 0x3c[$r0.1]
c0    mov $r0.3 = $r0.16
;;
-- floatlib_L36?3
c0    ldw $r0.6 = 0x38[$r0.1]
;;
c0    ldw.d $r0.5 = 0x38[$r0.1]
;;
;;
c0    or $r0.2 = $r0.2, $r0.6
;;
;;
;;
c0    cmpeq $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L37?3
;;
c0    stw 0x34[$r0.1] = $r0.0
;;
c0    ldw $r0.4 = 0x34[$r0.1]
;;
;;
c0    goto floatlib_L35?3
;;
-- floatlib_L37?3
c0    ldw $r0.5 = 0x38[$r0.1]
;;
;;
c0    goto floatlib_L35?3
;;
-- floatlib_L32?3
c0    ldw.d $r0.2 = 0x3c[$r0.1]
c0    brf $b0.0, floatlib_L38?3
;;
;;
;;
c0    mov $r0.13 = $r0.2
;;
c0    cmpltu $r0.13 = $r0.9, $r0.13
;;
c0    goto floatlib_L34?3
;;
-- floatlib_L38?3
c0    mov $r0.3 = $r0.16
;;
;;
c0    ldw $r0.2 = 0x3c[$r0.1]
c0    goto floatlib_L36?3
;;
-- floatlib_L30?3
c0    cmpeq $r0.5 = $r0.7, 2045
c0    stw 0x14[$r0.1] = $r0.8
c0    mov $r0.6 = $r0.3
;;
c0    cmpgt $r0.7 = $r0.7, 2045
c0    ldw $r0.11 = 0x38[$r0.1]
;;
c0    ldw $r0.15 = 0x3c[$r0.1]
c0    mov $r0.3 = 5
;;
c0    andl $r0.5 = $r0.5, $r0.2
;;
c0    cmpeq $r0.11 = $r0.11, 2097151
;;
c0    cmpeq $r0.15 = $r0.15, (~0x0)
;;
;;
;;
c0    andl $r0.11 = $r0.11, $r0.15
;;
;;
;;
c0    andl $r0.5 = $r0.5, $r0.11
;;
;;
;;
c0    orl $b0.2 = $r0.7, $r0.5
;;
;;
;;
c0    brf $b0.2, floatlib_L39?3
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw $r0.3 = 0x30[$r0.1]
c0    mov $r0.6 = (~0x0)
;;
c0    mov $r0.4 = 2046
c0    ldw $r0.8 = 0x14[$r0.1]
;;
c0    mov $r0.5 = 1048575
;;
c0    cmpeq $r0.7 = $r0.3, $r0.0
;;
c0    cmpeq $r0.15 = $r0.8, 3
c0    cmpeq $r0.8 = $r0.8, 2
c0    cmpeq $r0.11 = $r0.8, 1
;;
;;
;;
c0    andl $r0.8 = $r0.3, $r0.8
c0    andl $r0.11 = $r0.11, $r0.7
;;
;;
;;
c0    orl $r0.15 = $r0.15, $r0.11
;;
;;
;;
c0    orl $b0.0 = $r0.15, $r0.8
;;
;;
;;
c0    brf $b0.0, floatlib_L40?3
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L40?3
c0    ldw $r0.3 = 0x30[$r0.1]
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
;;
c0    mov $r0.4 = 2047
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L39?3
c0    add $r0.5 = $r0.1, 0x38
c0    cmpeq $r0.4 = $r0.2, $r0.0
c0    stw 0x18[$r0.1] = $r0.6
;;
c0    ldw.d $r0.6 = ((floatlib_?1PACKET.1+0)+0)[$r0.0]
c0    add $r0.7 = $r0.1, 0x3c
;;
c0    ldw.d $r0.11 = 0x38[$r0.1]
c0    add $r0.17 = $r0.1, 0x40
;;
c0    ldw.d $r0.18 = 0x3c[$r0.1]
c0    mov $r0.3 = 2
;;
c0    ldw $r0.19 = 0x34[$r0.1]
c0    cmpeq $r0.6 = $r0.6, 1
;;
c0    cmpltu $r0.20 = $r0.11, 2097151
c0    cmpeq $r0.21 = $r0.11, 2097151
;;
c0    cmpltu $r0.22 = $r0.18, (~0x0)
c0    ldw.d $r0.23 = 0x40[$r0.1]
c0    mov $r0.24 = $r0.18
;;
c0    cmplt $b0.2 = $r0.19, $r0.0
c0    sub $r0.26 = $r0.0, $r0.19
c0    cmplt $r0.25 = $r0.19, -1
c0    orl $r0.6 = $r0.6, $r0.4
;;
c0    mov $r0.27 = $r0.11
;;
c0    andl $r0.21 = $r0.21, $r0.22
c0    mov $r0.28 = $r0.23
;;
c0    sub $r0.4 = $r0.0, $r0.26
c0    orl $r0.6 = $r0.6, $r0.20
c0    cmpeq $b0.2 = $r0.26, $r0.0
c0    brf $b0.2, floatlib_L41?3
;;
;;
c0    orl $r0.25 = $r0.25, $r0.21
;;
c0    and $r0.4 = $r0.4, 31
;;
;;
c0    orl $r0.6 = $r0.6, $r0.25
;;
;;
c0    brf $b0.2, floatlib_L42?3
;;
-- floatlib_L43?3
c0    stw 0[$r0.17] = $r0.28
;;
c0    ldw $r0.4 = 0x40[$r0.1]
;;
c0    stw 0[$r0.7] = $r0.24
;;
c0    stw 0[$r0.5] = $r0.27
;;
c0    stw 0x34[$r0.1] = $r0.0
c0    andl $b0.2 = $r0.6, $r0.4
;;
;;
;;
c0    brf $b0.2, floatlib_L44?3
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
-- floatlib_L44?3
c0    ldw.d $r0.4 = 0x30[$r0.1]
;;
c0    ldw.d $r0.5 = 0x40[$r0.1]
;;
c0    ldw $r0.8 = 0x14[$r0.1]
;;
c0    cmpne $b0.2 = $r0.4, $r0.0
c0    ldw $r0.3 = 0x18[$r0.1]
;;
c0    cmplt $r0.6 = $r0.5, $r0.0
c0    ldw $r0.7 = 0x40[$r0.1]
;;
c0    cmpeq $r0.11 = $r0.8, 1
c0    cmpeq $r0.17 = $r0.8, 2
c0    ldw.d $r0.18 = ((floatlib_?1PACKET.3+0)+0)[$r0.0]
;;
c0    cmpne $b0.3 = $r0.3, $r0.0
c0    ldw.d $r0.13 = 0x3c[$r0.1]
;;
c0    cmpne $b0.1 = $r0.7, $r0.0
c0    ldw.d $r0.12 = 0x40[$r0.1]
;;
c0    andl $r0.11 = $r0.5, $r0.11
c0    andl $r0.17 = $r0.5, $r0.17
c0    or $r0.10 = $r0.18, 1
;;
c0    ldw.d $r0.14 = 0x38[$r0.1]
c0    add $r0.9 = $r0.13, 1
;;
c0    add $r0.15 = $r0.12, $r0.12
c0    ldw.d $r0.16 = 0x30[$r0.1]
;;
c0    slct $r0.11 = $b0.2, $r0.11, $r0.17
;;
;;
;;
c0    slct $r0.2 = $b0.3, $r0.6, $r0.11
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
c0    ldw.d $r0.4 = 0x34[$r0.1]
;;
c0    cmpeq $r0.15 = $r0.15, $r0.0
c0    goto floatlib_L31?3
;;
-- floatlib_L42?3
c0    cmplt $b0.0 = $r0.26, 32
c0    shl $r0.9 = $r0.18, $r0.4
c0    shru $r0.10 = $r0.18, $r0.26
c0    cmpne $r0.2 = $r0.23, $r0.0
;;
c0    shl $r0.12 = $r0.11, $r0.4
c0    shru $r0.27 = $r0.11, $r0.26
c0    mov $r0.3 = 2
;;
;;
c0    or $r0.28 = $r0.2, $r0.9
c0    brf $b0.0, floatlib_L45?3
;;
c0    or $r0.24 = $r0.10, $r0.12
;;
;;
c0    goto floatlib_L43?3
;;
-- floatlib_L45?3
c0    cmpge $b0.1 = $r0.26, 64
c0    cmpne $r0.2 = $r0.11, $r0.0
c0    cmpeq $b0.0 = $r0.26, 64
c0    shl $r0.4 = $r0.11, $r0.4
;;
c0    cmpeq $b0.2 = $r0.26, 32
c0    or $r0.8 = $r0.18, $r0.23
c0    and $r0.26 = $r0.26, 31
c0    mov $r0.27 = $r0.0
;;
c0    mov $r0.3 = 2
;;
c0    slct $r0.2 = $b0.0, $r0.11, $r0.2
;;
c0    shru $r0.26 = $r0.11, $r0.26
c0    slct $r0.23 = $b0.2, $r0.23, $r0.8
;;
;;
c0    slct $r0.2 = $b0.1, $r0.2, $r0.4
;;
c0    slctf $r0.26 = $b0.1, $r0.26, $r0.0
c0    cmpne $r0.23 = $r0.23, $r0.0
;;
;;
c0    slct $r0.9 = $b0.2, $r0.18, $r0.2
;;
c0    slct $r0.24 = $b0.2, $r0.11, $r0.26
;;
;;
c0    or $r0.28 = $r0.23, $r0.9
;;
;;
c0    goto floatlib_L43?3
;;
-- floatlib_L41?3
c0    add $r0.15 = $r0.12, $r0.12
c0    ldw $r0.3 = 0x18[$r0.1]
;;
;;
c0    ldw.d $r0.4 = 0x34[$r0.1]
;;
c0    cmpeq $r0.15 = $r0.15, $r0.0
c0    goto floatlib_L31?3
;;
-- floatlib_L29?3
c0    ldw $r0.4 = 0x30[$r0.1]
c0    cmpeq $r0.5 = $r0.8, 1
c0    cmpeq $r0.6 = $r0.8, 2
;;
c0    ldw.d $r0.7 = 0x40[$r0.1]
;;
;;
c0    cmpne $b0.0 = $r0.4, $r0.0
;;
c0    andl $r0.5 = $r0.5, $r0.7
c0    andl $r0.7 = $r0.7, $r0.6
;;
;;
;;
c0    slct $r0.2 = $b0.0, $r0.5, $r0.7
;;
;;
c0    goto floatlib_L28?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.1 + 48, 16; $r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32)
-- floatlib_FUNC_normalizeRoundAndPackFloat64
c0    add $r0.1 = $r0.1, (-0x40)
c0    cmpeq $b0.0 = $r0.5, $r0.0
c0    add $r0.2 = $r0.4, -32
;;
c0    stw 0x14[$r0.1] = $l0.0
;;
c0    stw 0x30[$r0.1] = $r0.3
;;
c0    stw 0x34[$r0.1] = $r0.4
;;
c0    stw 0x38[$r0.1] = $r0.5
;;
c0    stw 0x3c[$r0.1] = $r0.6
c0    brf $b0.0, floatlib_L46?3
;;
c0    stw 0x38[$r0.1] = $r0.6
;;
c0    ldw $r0.3 = 0x38[$r0.1]
;;
c0    stw 0x3c[$r0.1] = $r0.0
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x34[$r0.1] = $r0.2
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
-- floatlib_L47?3
c0    add $r0.3 = $r0.3, -11
c0    ldw.d $r0.2 = 0x38[$r0.1]
;;
c0    ldw.d $r0.8 = 0x3c[$r0.1]
;;
c0    ldw.d $r0.9 = 0x34[$r0.1]
;;
c0    cmpge $b0.0 = $r0.3, $r0.0
c0    sub $r0.11 = $r0.0, $r0.3
c0    shl $r0.10 = $r0.2, $r0.3
c0    cmpeq $b0.1 = $r0.3, $r0.0
;;
c0    shl $r0.12 = $r0.8, $r0.3
c0    ldw.d $r0.13 = 0x30[$r0.1]
;;
c0    sub $r0.4 = $r0.9, $r0.3
;;
c0    and $r0.11 = $r0.11, 31
c0    brf $b0.0, floatlib_L48?3
;;
c0    stw 0x10[$r0.1] = $r0.0
;;
c0    stw 0x3c[$r0.1] = $r0.12
c0    mov $r0.3 = $r0.13
;;
c0    shru $r0.8 = $r0.8, $r0.11
c0    ldw $r0.6 = 0x3c[$r0.1]
;;
c0    stw 0x34[$r0.1] = $r0.4
;;
;;
c0    or $r0.10 = $r0.10, $r0.8
;;
;;
;;
c0    slct $r0.2 = $b0.1, $r0.2, $r0.10
;;
;;
;;
c0    stw 0x38[$r0.1] = $r0.2
;;
-- floatlib_L49?3
c0    ldw $r0.5 = 0x38[$r0.1]
;;
c0    ldw $r0.7 = 0x10[$r0.1]
;;
;;
.call roundAndPackFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_roundAndPackFloat64
;;
c0    ldw $l0.0 = 0x14[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L48?3
c0    ldw $r0.2 = 0x38[$r0.1]
c0    sub $r0.3 = $r0.0, $r0.3
;;
c0    ldw $r0.5 = 0x3c[$r0.1]
;;
c0    stw 0x34[$r0.1] = $r0.4
;;
c0    cmpne $r0.7 = $r0.2, $r0.0
c0    sub $r0.8 = $r0.0, $r0.3
c0    cmpge $b0.1 = $r0.3, 64
c0    cmpeq $b0.0 = $r0.3, 64
;;
c0    shru $r0.9 = $r0.2, $r0.3
c0    cmpge $b0.3 = $r0.3, 32
c0    cmpeq $b0.2 = $r0.3, 32
c0    cmpne $b0.4 = $r0.3, $r0.0
;;
c0    shru $r0.11 = $r0.5, $r0.3
c0    and $r0.10 = $r0.3, 31
c0    cmpeq $b0.6 = $r0.3, $r0.0
c0    cmpeq $b0.5 = $r0.3, $r0.0
;;
c0    and $r0.8 = $r0.8, 31
c0    slct $r0.7 = $b0.0, $r0.2, $r0.7
;;
c0    slctf $r0.12 = $b0.2, $r0.5, $r0.0
c0    slctf $r0.9 = $b0.3, $r0.9, $r0.0
;;
c0    shru $r0.10 = $r0.2, $r0.10
;;
c0    shl $r0.8 = $r0.5, $r0.8
c0    shl $r0.13 = $r0.2, $r0.8
;;
c0    slct $r0.12 = $b0.3, $r0.12, $r0.0
c0    slct $r0.9 = $b0.5, $r0.2, $r0.9
;;
c0    slctf $r0.10 = $b0.1, $r0.10, $r0.0
;;
c0    or $r0.11 = $r0.11, $r0.13
c0    slct $r0.7 = $b0.1, $r0.7, $r0.13
;;
c0    cmpne $r0.12 = $r0.12, $r0.0
;;
c0    slct $r0.2 = $b0.2, $r0.2, $r0.10
;;
c0    slct $r0.7 = $b0.2, $r0.5, $r0.7
;;
;;
c0    slct $r0.2 = $b0.3, $r0.2, $r0.11
;;
c0    slct $r0.7 = $b0.3, $r0.7, $r0.8
;;
;;
c0    slct $r0.5 = $b0.6, $r0.5, $r0.2
;;
c0    or $r0.7 = $r0.7, $r0.12
;;
;;
c0    stw 0x3c[$r0.1] = $r0.5
;;
c0    slct $r0.7 = $b0.4, $r0.7, $r0.0
c0    ldw $r0.6 = 0x3c[$r0.1]
;;
;;
;;
c0    stw 0x10[$r0.1] = $r0.7
;;
c0    ldw $r0.3 = 0x30[$r0.1]
;;
c0    stw 0x38[$r0.1] = $r0.9
;;
c0    goto floatlib_L49?3
;;
-- floatlib_L46?3
c0    ldw $r0.3 = 0x38[$r0.1]
;;
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
c0    goto floatlib_L47?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:s32)
-- FUNC__r_ilfloat
c0    add $r0.1 = $r0.1, (-0x20)
c0    cmpeq $r0.2 = $r0.3, $r0.0
c0    cmpeq $b0.0 = $r0.3, $r0.0
;;
c0    cmpeq $r0.4 = $r0.3, (~0x7fffffff)
c0    stw 0x10[$r0.1] = $l0.0
;;
;;
c0    slct $r0.5 = $b0.0, $r0.0, (~0x30ffffff)
;;
c0    orl $b0.0 = $r0.2, $r0.4
;;
;;
c0    mov $r0.3 = $r0.5
c0    mov $r0.2 = $r0.3
;;
c0    brf $b0.0, floatlib_L50?3
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L50?3
c0    sub $r0.6 = $r0.0, $r0.2
c0    cmplt $r0.3 = $r0.2, $r0.0
c0    cmplt $b0.0 = $r0.2, $r0.0
c0    mov $r0.4 = 156
;;
;;
;;
c0    slct $r0.5 = $b0.0, $r0.6, $r0.2
;;
;;
.call normalizeRoundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_normalizeRoundAndPackFloat32
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
-- FUNC__r_ufloat
c0    add $r0.1 = $r0.1, (-0x20)
c0    cmpeq $b0.0 = $r0.3, $r0.0
c0    mov $r0.2 = $r0.3
;;
c0    mov $r0.3 = $r0.0
c0    stw 0x10[$r0.1] = $l0.0
;;
;;
c0    brf $b0.0, floatlib_L51?3
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L51?3
.call normalizeRoundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    mov $r0.5 = $r0.2
c0    mov $r0.4 = 156
c0    mov $r0.3 = $r0.0
c0    call $l0.0 = floatlib_FUNC_normalizeRoundAndPackFloat32
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:s32)
-- FUNC__d_ilfloat
c0    add $r0.1 = $r0.1, (-0x40)
c0    cmpeq $b0.0 = $r0.3, $r0.0
c0    mov $r0.5 = $r0.0
;;
c0    mov $r0.6 = $r0.0
c0    mov $r0.4 = $r0.0
c0    stw 0x18[$r0.1] = $l0.0
c0    mov $r0.2 = $r0.3
;;
c0    mov $r0.3 = $r0.0
;;
c0    brf $b0.0, floatlib_L52?3
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L52?3
c0    sub $r0.6 = $r0.0, $r0.2
c0    cmplt $r0.5 = $r0.2, $r0.0
;;
;;
;;
c0    stw 0x1c[$r0.1] = $r0.5
c0    mtb $b0.0 = $r0.5
;;
;;
;;
c0    slct $r0.5 = $b0.0, $r0.6, $r0.2
;;
;;
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x20[$r0.1] = $r0.5
c0    mov $r0.3 = $r0.5
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
c0    add $r0.2 = $r0.3, -11
c0    rsub $r0.4 = 1053, $r0.3
c0    mov $r0.7 = $r0.3
;;
;;
c0    ldw $r0.8 = 0x20[$r0.1]
;;
c0    cmpge $b0.0 = $r0.2, $r0.0
c0    ldw $r0.3 = 0x1c[$r0.1]
;;
;;
c0    shl $r0.8 = $r0.8, $r0.2
;;
c0    brf $b0.0, floatlib_L53?3
;;
c0    stw 0x10[$r0.1] = $r0.0
;;
c0    ldw $r0.6 = 0x10[$r0.1]
;;
c0    stw 0x14[$r0.1] = $r0.8
;;
-- floatlib_L54?3
c0    ldw $r0.5 = 0x14[$r0.1]
;;
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L53?3
c0    sub $r0.2 = $r0.0, $r0.2
c0    ldw $r0.5 = 0x20[$r0.1]
;;
;;
;;
c0    zxth $r0.7 = $r0.2
c0    sub $r0.6 = $r0.0, $r0.2
c0    and $r0.2 = $r0.2, 31
;;
;;
;;
c0    and $r0.6 = $r0.6, 31
c0    shru $r0.2 = $r0.5, $r0.2
c0    shru $r0.8 = $r0.0, $r0.7
c0    cmplt $b0.0 = $r0.7, 64
;;
c0    shru $r0.9 = $r0.5, $r0.7
c0    cmpge $b0.1 = $r0.7, 32
c0    cmpeq $b0.3 = $r0.7, $r0.0
c0    cmpne $b0.2 = $r0.7, $r0.0
;;
;;
c0    shl $r0.6 = $r0.5, $r0.6
c0    slct $r0.2 = $b0.0, $r0.2, $r0.0
;;
c0    slctf $r0.9 = $b0.1, $r0.9, $r0.0
;;
;;
c0    or $r0.6 = $r0.6, $r0.8
;;
c0    slct $r0.5 = $b0.3, $r0.5, $r0.9
;;
;;
c0    slct $r0.2 = $b0.1, $r0.2, $r0.6
;;
c0    stw 0x14[$r0.1] = $r0.5
;;
;;
c0    slct $r0.2 = $b0.2, $r0.2, $r0.0
;;
;;
;;
c0    stw 0x10[$r0.1] = $r0.2
;;
c0    ldw $r0.6 = 0x10[$r0.1]
;;
c0    goto floatlib_L54?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
-- FUNC__d_ufloat
c0    add $r0.1 = $r0.1, (-0x20)
c0    cmpeq $b0.0 = $r0.3, $r0.0
c0    mov $r0.5 = $r0.0
;;
c0    mov $r0.6 = $r0.0
c0    mov $r0.4 = $r0.0
c0    stw 0x18[$r0.1] = $l0.0
c0    mov $r0.2 = $r0.3
;;
c0    mov $r0.3 = $r0.0
;;
c0    brf $b0.0, floatlib_L55?3
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L55?3
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    mov $r0.3 = $r0.2
c0    stw 0x1c[$r0.1] = $r0.2
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
c0    add $r0.2 = $r0.3, -11
c0    rsub $r0.4 = 1053, $r0.3
c0    mov $r0.7 = $r0.3
;;
;;
c0    ldw $r0.8 = 0x1c[$r0.1]
;;
c0    cmpge $b0.0 = $r0.2, $r0.0
c0    mov $r0.3 = $r0.0
;;
;;
c0    shl $r0.8 = $r0.8, $r0.2
;;
c0    brf $b0.0, floatlib_L56?3
;;
c0    stw 0x10[$r0.1] = $r0.0
;;
c0    ldw $r0.6 = 0x10[$r0.1]
;;
c0    stw 0x14[$r0.1] = $r0.8
;;
-- floatlib_L57?3
c0    ldw $r0.5 = 0x14[$r0.1]
;;
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L56?3
c0    sub $r0.2 = $r0.0, $r0.2
c0    mov $r0.3 = $r0.0
c0    ldw $r0.5 = 0x1c[$r0.1]
;;
;;
;;
c0    zxth $r0.7 = $r0.2
c0    sub $r0.6 = $r0.0, $r0.2
c0    and $r0.2 = $r0.2, 31
;;
;;
;;
c0    and $r0.6 = $r0.6, 31
c0    shru $r0.2 = $r0.5, $r0.2
c0    shru $r0.8 = $r0.0, $r0.7
c0    cmplt $b0.0 = $r0.7, 64
;;
c0    shru $r0.9 = $r0.5, $r0.7
c0    cmpge $b0.1 = $r0.7, 32
c0    cmpeq $b0.3 = $r0.7, $r0.0
c0    cmpne $b0.2 = $r0.7, $r0.0
;;
;;
c0    shl $r0.6 = $r0.5, $r0.6
c0    slct $r0.2 = $b0.0, $r0.2, $r0.0
;;
c0    slctf $r0.9 = $b0.1, $r0.9, $r0.0
;;
;;
c0    or $r0.6 = $r0.6, $r0.8
;;
c0    slct $r0.5 = $b0.3, $r0.5, $r0.9
;;
;;
c0    slct $r0.2 = $b0.1, $r0.2, $r0.6
;;
c0    stw 0x14[$r0.1] = $r0.5
;;
;;
c0    slct $r0.2 = $b0.2, $r0.2, $r0.0
;;
;;
;;
c0    stw 0x10[$r0.1] = $r0.2
;;
c0    ldw $r0.6 = 0x10[$r0.1]
;;
c0    goto floatlib_L57?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:s32)
-- floatlib_FUNC_float32_to_int32_round_to_zero
c0    add $r0.1 = $r0.1, (-0x40)
c0    and $r0.2 = $r0.3, 8388607
;;
c0    shru $r0.6 = $r0.3, 23
c0    shru $r0.5 = $r0.3, 31
c0    stw 0x10[$r0.1] = $l0.0
c0    mov $r0.7 = $r0.3
;;
c0    ldw.d $r0.8 = ((floatlib_?1PACKET.3+0)+0)[$r0.0]
;;
;;
c0    and $r0.6 = $r0.6, 255
c0    mov $r0.3 = $r0.0
;;
c0    or $r0.8 = $r0.8, 1
;;
;;
c0    add $r0.9 = $r0.6, -158
c0    cmple $b0.0 = $r0.6, 126
c0    or $r0.10 = $r0.2, $r0.6
;;
;;
;;
c0    cmpge $b0.1 = $r0.9, $r0.0
c0    cmpne $b0.2 = $r0.10, $r0.0
;;
;;
;;
c0    br $b0.1, floatlib_L58?3
;;
c0    brf $b0.0, floatlib_L59?3
;;
c0    brf $b0.2, floatlib_L60?3
;;
.return ret($r0.3:s32)
c0    stw ((floatlib_?1PACKET.3+0)+0)[$r0.0] = $r0.8
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L60?3
.return ret($r0.3:s32)
c0    mov $r0.3 = $r0.0
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L59?3
c0    or $r0.2 = $r0.2, 8388608
c0    sub $r0.4 = $r0.0, $r0.9
c0    and $r0.6 = $r0.9, 31
;;
c0    ldw.d $r0.7 = ((floatlib_?1PACKET.3+0)+0)[$r0.0]
c0    mtb $b0.0 = $r0.5
;;
;;
c0    shl $r0.2 = $r0.2, 8
;;
c0    or $r0.7 = $r0.7, 1
;;
;;
c0    shru $r0.4 = $r0.2, $r0.4
c0    shl $r0.6 = $r0.2, $r0.6
;;
;;
;;
c0    cmpne $b0.1 = $r0.6, $r0.0
c0    sub $r0.2 = $r0.0, $r0.4
;;
;;
;;
c0    slct $r0.3 = $b0.0, $r0.2, $r0.4
c0    brf $b0.1, floatlib_L61?3
;;
c0    stw ((floatlib_?1PACKET.3+0)+0)[$r0.0] = $r0.7
;;
-- floatlib_L62?3
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L61?3
c0    mtb $b0.0 = $r0.5
;;
;;
;;
c0    slct $r0.3 = $b0.0, $r0.2, $r0.4
;;
c0    goto floatlib_L62?3
;;
-- floatlib_L58?3
c0    cmpeq $b0.0 = $r0.7, (~0x30ffffff)
c0    cmpeq $b0.1 = $r0.4, $r0.0
;;
;;
;;
c0    slct $r0.3 = $b0.1, $r0.0, (~0x7fffffff)
c0    brf $b0.0, floatlib_L63?3
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L63?3
c0    stw 0x14[$r0.1] = $r0.4
;;
c0    stw 0x18[$r0.1] = $r0.5
;;
c0    stw 0x1c[$r0.1] = $r0.2
c0    mov $r0.3 = 16
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    stw 0x20[$r0.1] = $r0.6
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    mov $r0.2 = 2147483647
c0    ldw $r0.5 = 0x18[$r0.1]
;;
c0    ldw $r0.6 = 0x1c[$r0.1]
;;
c0    ldw $r0.7 = 0x20[$r0.1]
;;
c0    cmpeq $r0.5 = $r0.5, $r0.0
c0    ldw $r0.4 = 0x14[$r0.1]
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
c0    cmpeq $r0.7 = $r0.7, 255
;;
c0    cmpne $b0.0 = $r0.4, $r0.0
;;
;;
c0    andl $r0.7 = $r0.7, $r0.6
;;
c0    slct $r0.3 = $b0.0, $r0.2, (~0x0)
;;
;;
c0    orl $b0.0 = $r0.5, $r0.7
;;
;;
;;
c0    brf $b0.0, floatlib_L64?3
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L64?3
c0    ldw $r0.4 = 0x14[$r0.1]
;;
;;
;;
c0    cmpeq $b0.0 = $r0.4, $r0.0
;;
;;
;;
c0    slct $r0.3 = $b0.0, $r0.0, (~0x7fffffff)
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32)
-- FUNC__d_r
c0    add $r0.1 = $r0.1, (-0x40)
c0    and $r0.2 = $r0.3, 8388607
;;
c0    shru $r0.8 = $r0.3, 23
c0    shru $r0.7 = $r0.3, 31
c0    stw 0x18[$r0.1] = $l0.0
;;
;;
c0    shru $r0.5 = $r0.2, 3
c0    shl $r0.6 = $r0.2, 29
;;
c0    and $r0.8 = $r0.8, 255
c0    mov $r0.9 = $r0.3
;;
c0    mov $r0.3 = $r0.7
;;
;;
c0    cmpeq $b0.0 = $r0.8, 255
c0    cmpeq $b0.1 = $r0.8, $r0.0
c0    add $r0.4 = $r0.8, 896
;;
;;
;;
c0    br $b0.0, floatlib_L65?3
;;
c0    br $b0.1, floatlib_L66?3
;;
-- floatlib_L67?3
c0    stw 0x14[$r0.1] = $r0.5
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    stw 0x10[$r0.1] = $r0.6
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L66?3
c0    cmpeq $b0.0 = $r0.2, $r0.0
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    mov $r0.3 = $r0.7
;;
c0    mov $r0.4 = $r0.0
;;
;;
c0    brf $b0.0, floatlib_L68?3
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L68?3
c0    stw 0x1c[$r0.1] = $r0.7
c0    mov $r0.3 = $r0.2
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x20[$r0.1] = $r0.2
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
c0    add $r0.2 = $r0.3, -8
c0    rsub $r0.8 = 8, $r0.3
;;
c0    ldw $r0.3 = 0x1c[$r0.1]
;;
c0    ldw $r0.7 = 0x20[$r0.1]
;;
c0    add $r0.4 = $r0.8, 896
;;
;;
c0    shl $r0.7 = $r0.7, $r0.2
;;
;;
;;
c0    shru $r0.5 = $r0.7, 3
c0    shl $r0.6 = $r0.7, 29
;;
;;
c0    goto floatlib_L67?3
;;
-- floatlib_L65?3
c0    cmpne $b0.0 = $r0.2, $r0.0
c0    mov $r0.3 = $r0.9
;;
;;
;;
c0    brf $b0.0, floatlib_L69?3
;;
.call float32ToCommonNaN, caller, arg($r0.3:u32), ret($r0.3:s32,$r0.4:u32,$r0.5:u32)
c0    call $l0.0 = floatlib_FUNC_float32ToCommonNaN
;;
.call commonNaNToFloat64, caller, arg($r0.3:s32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_commonNaNToFloat64
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L69?3
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    mov $r0.3 = $r0.7
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    mov $r0.4 = 2047
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:s32)
-- floatlib_FUNC_addFloat32Sigs
c0    add $r0.1 = $r0.1, (-0x20)
c0    and $r0.2 = $r0.3, 8388607
;;
c0    and $r0.6 = $r0.4, 8388607
c0    shru $r0.7 = $r0.3, 23
c0    stw 0x18[$r0.1] = $l0.0
;;
c0    shru $r0.8 = $r0.4, 23
c0    mov $r0.9 = $r0.3
;;
c0    shl $r0.2 = $r0.2, 6
;;
c0    and $r0.7 = $r0.7, 255
c0    shl $r0.6 = $r0.6, 6
c0    mov $r0.3 = $r0.5
;;
c0    and $r0.8 = $r0.8, 255
;;
c0    stw 0x14[$r0.1] = $r0.2
;;
c0    cmpeq $b0.0 = $r0.7, 255
c0    mov $r0.10 = $r0.7
c0    ldw.d $r0.2 = 0x14[$r0.1]
;;
c0    sub $r0.11 = $r0.7, $r0.8
c0    stw 0x10[$r0.1] = $r0.6
c0    cmpeq $b0.1 = $r0.8, $r0.0
c0    add $r0.12 = $r0.10, -1
;;
c0    ldw.d $r0.6 = 0x10[$r0.1]
;;
c0    or $r0.2 = $r0.2, 536870912
;;
c0    cmpgt $b0.2 = $r0.11, $r0.0
;;
c0    cmpne $r0.13 = $r0.6, $r0.0
;;
;;
c0    brf $b0.2, floatlib_L70?3
;;
c0    br $b0.0, floatlib_L71?3
;;
c0    brf $b0.1, floatlib_L72?3
;;
c0    add $r0.11 = $r0.11, -1
c0    stw 0x14[$r0.1] = $r0.2
;;
;;
;;
-- floatlib_L73?3
c0    sub $r0.7 = $r0.0, $r0.11
c0    shru $r0.8 = $r0.6, $r0.11
c0    cmpge $b0.0 = $r0.11, 32
c0    cmpeq $b0.1 = $r0.11, $r0.0
;;
;;
;;
c0    and $r0.7 = $r0.7, 31
;;
;;
;;
c0    shl $r0.7 = $r0.6, $r0.7
;;
;;
;;
c0    cmpne $r0.7 = $r0.7, $r0.0
;;
;;
;;
c0    or $r0.8 = $r0.8, $r0.7
;;
;;
;;
c0    slct $r0.13 = $b0.0, $r0.13, $r0.8
;;
;;
;;
c0    slct $r0.6 = $b0.1, $r0.6, $r0.13
;;
;;
;;
c0    stw 0x10[$r0.1] = $r0.6
;;
-- floatlib_L74?3
c0    ldw $r0.6 = 0x10[$r0.1]
;;
;;
;;
c0    add $r0.2 = $r0.2, $r0.6
;;
;;
;;
c0    shl $r0.6 = $r0.2, 1
;;
;;
;;
c0    cmpge $b0.0 = $r0.6, $r0.0
;;
;;
;;
c0    slct $r0.5 = $b0.0, $r0.6, $r0.2
c0    slct $r0.4 = $b0.0, $r0.12, $r0.10
;;
;;
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_roundAndPackFloat32
;;
-- floatlib_L75?3
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L72?3
c0    ldw $r0.4 = 0x10[$r0.1]
c0    mov $r0.3 = $r0.5
;;
c0    stw 0x14[$r0.1] = $r0.2
;;
;;
c0    or $r0.4 = $r0.4, 536870912
;;
;;
;;
c0    stw 0x10[$r0.1] = $r0.4
;;
c0    ldw $r0.6 = 0x10[$r0.1]
;;
;;
;;
c0    cmpne $r0.13 = $r0.6, $r0.0
;;
;;
c0    goto floatlib_L73?3
;;
-- floatlib_L71?3
c0    ldw $r0.2 = 0x14[$r0.1]
c0    mov $r0.3 = $r0.9
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L76?3
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat32NaN
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L76?3
c0    mov $r0.3 = $r0.9
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L70?3
c0    cmplt $b0.0 = $r0.11, $r0.0
c0    cmpeq $b0.1 = $r0.8, 255
c0    cmpeq $b0.2 = $r0.7, $r0.0
c0    ldw.d $r0.6 = 0x14[$r0.1]
;;
c0    mov $r0.10 = $r0.8
c0    mov $r0.3 = $r0.5
;;
c0    add $r0.12 = $r0.10, -1
;;
c0    cmpne $r0.13 = $r0.6, $r0.0
c0    brf $b0.0, floatlib_L77?3
;;
c0    br $b0.1, floatlib_L78?3
;;
c0    brf $b0.2, floatlib_L79?3
;;
c0    add $r0.11 = $r0.11, 1
;;
;;
;;
-- floatlib_L80?3
c0    sub $r0.11 = $r0.0, $r0.11
;;
;;
;;
c0    sub $r0.9 = $r0.0, $r0.11
c0    shru $r0.14 = $r0.6, $r0.11
c0    cmpge $b0.0 = $r0.11, 32
c0    cmpeq $b0.1 = $r0.11, $r0.0
;;
;;
;;
c0    and $r0.9 = $r0.9, 31
;;
;;
;;
c0    shl $r0.9 = $r0.6, $r0.9
;;
;;
;;
c0    cmpne $r0.9 = $r0.9, $r0.0
;;
;;
;;
c0    or $r0.14 = $r0.14, $r0.9
;;
;;
;;
c0    slct $r0.13 = $b0.0, $r0.13, $r0.14
;;
;;
;;
c0    slct $r0.6 = $b0.1, $r0.6, $r0.13
;;
;;
;;
c0    stw 0x14[$r0.1] = $r0.6
;;
c0    ldw $r0.6 = 0x14[$r0.1]
;;
;;
;;
c0    or $r0.2 = $r0.6, 536870912
;;
;;
;;
c0    stw 0x14[$r0.1] = $r0.2
c0    goto floatlib_L74?3
;;
-- floatlib_L79?3
c0    ldw $r0.2 = 0x14[$r0.1]
;;
;;
;;
c0    or $r0.2 = $r0.2, 536870912
;;
;;
;;
c0    stw 0x14[$r0.1] = $r0.2
;;
c0    ldw $r0.6 = 0x14[$r0.1]
;;
;;
;;
c0    cmpne $r0.13 = $r0.6, $r0.0
;;
;;
c0    goto floatlib_L80?3
;;
-- floatlib_L78?3
c0    ldw $r0.2 = 0x10[$r0.1]
c0    mov $r0.3 = $r0.9
c0    mov $r0.5 = $r0.3
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L81?3
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat32NaN
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L81?3
c0    shl $r0.5 = $r0.5, 31
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
c0    add $r0.3 = $r0.5, 2139095040
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L77?3
c0    cmpeq $b0.0 = $r0.7, 255
c0    cmpeq $b0.1 = $r0.7, $r0.0
c0    ldw.d $r0.2 = 0x10[$r0.1]
c0    shl $r0.6 = $r0.3, 31
;;
c0    ldw.d $r0.8 = 0x14[$r0.1]
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
c0    br $b0.0, floatlib_L82?3
;;
c0    add $r0.2 = $r0.2, $r0.8
c0    brf $b0.1, floatlib_L83?3
;;
;;
;;
c0    shru $r0.2 = $r0.2, 6
;;
;;
;;
c0    add $r0.3 = $r0.2, $r0.6
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L83?3
c0    ldw $r0.6 = 0x10[$r0.1]
c0    mov $r0.4 = $r0.7
;;
c0    ldw $r0.7 = 0x14[$r0.1]
;;
;;
c0    add $r0.6 = $r0.6, 1073741824
;;
;;
;;
c0    add $r0.5 = $r0.6, $r0.7
;;
;;
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_roundAndPackFloat32
;;
c0    goto floatlib_L75?3
;;
-- floatlib_L82?3
c0    ldw $r0.2 = 0x10[$r0.1]
c0    mov $r0.3 = $r0.9
;;
c0    ldw $r0.5 = 0x14[$r0.1]
;;
;;
;;
c0    or $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L84?3
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat32NaN
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L84?3
c0    mov $r0.3 = $r0.9
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:s32)
-- floatlib_FUNC_subFloat32Sigs
c0    add $r0.1 = $r0.1, (-0x20)
c0    and $r0.2 = $r0.3, 8388607
;;
c0    and $r0.6 = $r0.4, 8388607
c0    shru $r0.7 = $r0.3, 23
c0    stw 0x18[$r0.1] = $l0.0
;;
c0    shru $r0.8 = $r0.4, 23
c0    mov $r0.9 = $r0.3
;;
c0    shl $r0.2 = $r0.2, 7
;;
c0    and $r0.7 = $r0.7, 255
c0    shl $r0.6 = $r0.6, 7
c0    mov $r0.3 = $r0.5
;;
c0    and $r0.8 = $r0.8, 255
;;
c0    stw 0x14[$r0.1] = $r0.2
;;
c0    cmpeq $b0.0 = $r0.7, 255
c0    ldw.d $r0.2 = 0x14[$r0.1]
c0    mov $r0.10 = $r0.7
;;
c0    sub $r0.11 = $r0.7, $r0.8
c0    stw 0x10[$r0.1] = $r0.6
c0    cmpeq $b0.1 = $r0.8, $r0.0
c0    add $r0.10 = $r0.10, -1
;;
c0    ldw.d $r0.6 = 0x10[$r0.1]
;;
c0    or $r0.2 = $r0.2, 1073741824
;;
c0    cmpgt $b0.2 = $r0.11, $r0.0
c0    mov $r0.12 = $r0.4
;;
c0    cmpne $r0.13 = $r0.6, $r0.0
c0    mov $r0.4 = $r0.10
;;
;;
c0    brf $b0.2, floatlib_L85?3
;;
c0    br $b0.0, floatlib_L86?3
;;
c0    brf $b0.1, floatlib_L87?3
;;
c0    add $r0.11 = $r0.11, -1
c0    stw 0x14[$r0.1] = $r0.2
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
;;
-- floatlib_L88?3
c0    sub $r0.7 = $r0.0, $r0.11
c0    shru $r0.8 = $r0.6, $r0.11
c0    cmpge $b0.0 = $r0.11, 32
c0    cmpeq $b0.1 = $r0.11, $r0.0
;;
;;
;;
c0    and $r0.7 = $r0.7, 31
;;
;;
;;
c0    shl $r0.7 = $r0.6, $r0.7
;;
;;
;;
c0    cmpne $r0.7 = $r0.7, $r0.0
;;
;;
;;
c0    or $r0.8 = $r0.8, $r0.7
;;
;;
;;
c0    slct $r0.13 = $b0.0, $r0.13, $r0.8
;;
;;
;;
c0    slct $r0.6 = $b0.1, $r0.6, $r0.13
;;
;;
;;
c0    stw 0x10[$r0.1] = $r0.6
;;
-- floatlib_L89?3
c0    ldw $r0.6 = 0x10[$r0.1]
;;
;;
;;
c0    sub $r0.5 = $r0.2, $r0.6
;;
;;
.call normalizeRoundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_normalizeRoundAndPackFloat32
;;
-- floatlib_L90?3
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L87?3
c0    ldw $r0.7 = 0x10[$r0.1]
c0    mov $r0.3 = $r0.5
;;
c0    stw 0x14[$r0.1] = $r0.2
;;
;;
c0    or $r0.7 = $r0.7, 1073741824
;;
;;
;;
c0    stw 0x10[$r0.1] = $r0.7
;;
c0    ldw $r0.6 = 0x10[$r0.1]
;;
;;
;;
c0    cmpne $r0.13 = $r0.6, $r0.0
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
c0    goto floatlib_L88?3
;;
-- floatlib_L86?3
c0    ldw $r0.2 = 0x14[$r0.1]
c0    mov $r0.4 = $r0.12
c0    mov $r0.3 = $r0.9
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L91?3
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat32NaN
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L91?3
c0    mov $r0.3 = $r0.9
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L85?3
c0    cmplt $b0.0 = $r0.11, $r0.0
c0    cmpeq $b0.1 = $r0.8, 255
c0    cmpeq $b0.2 = $r0.7, $r0.0
c0    ldw.d $r0.2 = 0x14[$r0.1]
;;
c0    ldw.d $r0.6 = 0x10[$r0.1]
c0    mov $r0.10 = $r0.8
;;
c0    add $r0.4 = $r0.10, -1
;;
c0    cmpne $r0.13 = $r0.2, $r0.0
c0    brf $b0.0, floatlib_L92?3
;;
c0    or $r0.6 = $r0.6, 1073741824
c0    br $b0.1, floatlib_L93?3
;;
c0    brf $b0.2, floatlib_L94?3
;;
c0    add $r0.11 = $r0.11, 1
c0    xor $r0.3 = $r0.5, 1
;;
c0    stw 0x10[$r0.1] = $r0.6
;;
c0    ldw $r0.6 = 0x10[$r0.1]
;;
-- floatlib_L95?3
c0    sub $r0.11 = $r0.0, $r0.11
;;
;;
;;
c0    sub $r0.9 = $r0.0, $r0.11
c0    shru $r0.10 = $r0.2, $r0.11
c0    cmpge $b0.0 = $r0.11, 32
c0    cmpeq $b0.1 = $r0.11, $r0.0
;;
;;
;;
c0    and $r0.9 = $r0.9, 31
;;
;;
;;
c0    shl $r0.9 = $r0.2, $r0.9
;;
;;
;;
c0    cmpne $r0.9 = $r0.9, $r0.0
;;
;;
;;
c0    or $r0.10 = $r0.10, $r0.9
;;
;;
;;
c0    slct $r0.13 = $b0.0, $r0.13, $r0.10
;;
;;
;;
c0    slct $r0.2 = $b0.1, $r0.2, $r0.13
;;
;;
;;
c0    stw 0x14[$r0.1] = $r0.2
;;
-- floatlib_L96?3
c0    ldw $r0.2 = 0x14[$r0.1]
;;
;;
;;
c0    sub $r0.5 = $r0.6, $r0.2
;;
;;
.call normalizeRoundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_normalizeRoundAndPackFloat32
;;
c0    goto floatlib_L90?3
;;
-- floatlib_L94?3
c0    ldw $r0.7 = 0x14[$r0.1]
c0    xor $r0.5 = $r0.5, 1
;;
c0    stw 0x10[$r0.1] = $r0.6
;;
;;
c0    or $r0.7 = $r0.7, 1073741824
c0    mov $r0.3 = $r0.5
;;
;;
;;
c0    stw 0x14[$r0.1] = $r0.7
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
;;
;;
c0    cmpne $r0.13 = $r0.2, $r0.0
;;
;;
c0    ldw $r0.6 = 0x10[$r0.1]
c0    goto floatlib_L95?3
;;
-- floatlib_L93?3
c0    ldw $r0.2 = 0x10[$r0.1]
c0    mov $r0.4 = $r0.12
c0    mov $r0.3 = $r0.9
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L97?3
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat32NaN
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L97?3
c0    xor $r0.5 = $r0.5, 1
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
c0    shl $r0.5 = $r0.5, 31
;;
;;
;;
c0    add $r0.3 = $r0.5, 2139095040
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L92?3
c0    cmpeq $b0.0 = $r0.7, 255
c0    cmpne $b0.1 = $r0.7, $r0.0
c0    cmpne $b0.2 = $r0.7, $r0.0
c0    ldw.d $r0.6 = 0x10[$r0.1]
;;
c0    ldw.d $r0.10 = 0x14[$r0.1]
c0    mov $r0.3 = $r0.5
;;
c0    ldw.d $r0.2 = 0x14[$r0.1]
;;
c0    slct $r0.8 = $b0.1, $r0.8, 1
c0    slct $r0.7 = $b0.2, $r0.7, 1
c0    br $b0.0, floatlib_L98?3
;;
c0    cmpltu $b0.0 = $r0.6, $r0.10
;;
;;
;;
c0    add $r0.4 = $r0.7, -1
c0    brf $b0.0, floatlib_L99?3
;;
;;
c0    goto floatlib_L89?3
;;
-- floatlib_L99?3
c0    cmpltu $b0.0 = $r0.10, $r0.6
c0    ldw.d $r0.6 = 0x10[$r0.1]
c0    mov $r0.10 = $r0.8
c0    xor $r0.3 = $r0.3, 1
;;
c0    add $r0.10 = $r0.10, -1
;;
;;
c0    brf $b0.0, floatlib_L100?3
;;
c0    mov $r0.4 = $r0.10
c0    goto floatlib_L96?3
;;
-- floatlib_L100?3
c0    ldw $r0.2 = ((floatlib_?1PACKET.2+0)+0)[$r0.0]
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
c0    cmpeq $r0.2 = $r0.2, 1
;;
;;
;;
c0    shl $r0.3 = $r0.2, 31
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L98?3
c0    ldw $r0.5 = 0x10[$r0.1]
c0    mov $r0.4 = $r0.12
c0    mov $r0.3 = $r0.9
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
;;
;;
c0    or $r0.5 = $r0.5, $r0.2
;;
;;
;;
c0    cmpne $b0.0 = $r0.5, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L101?3
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat32NaN
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L101?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    mov $r0.3 = 16
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw $l0.0 = 0x18[$r0.1]
c0    mov $r0.3 = 2147483647
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC__r_add
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.5 = $r0.3, 31
c0    shru $r0.2 = $r0.4, 31
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
;;
c0    cmpeq $b0.0 = $r0.5, $r0.2
;;
;;
;;
c0    brf $b0.0, floatlib_L102?3
;;
.call addFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_addFloat32Sigs
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L102?3
.call subFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_subFloat32Sigs
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC__r_sub
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.5 = $r0.3, 31
c0    shru $r0.2 = $r0.4, 31
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
;;
c0    cmpeq $b0.0 = $r0.5, $r0.2
;;
;;
;;
c0    brf $b0.0, floatlib_L103?3
;;
.call subFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_subFloat32Sigs
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L103?3
.call addFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_addFloat32Sigs
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32)
-- FUNC__r_mul
c0    add $r0.1 = $r0.1, (-0x40)
c0    shru $r0.2 = $r0.4, 23
c0    shru $r0.6 = $r0.3, 31
;;
c0    and $r0.8 = $r0.3, 8388607
c0    shru $r0.7 = $r0.4, 31
c0    stw 0x18[$r0.1] = $l0.0
;;
c0    and $r0.9 = $r0.4, 8388607
c0    shru $r0.10 = $r0.3, 23
;;
c0    and $r0.2 = $r0.2, 255
;;
c0    xor $r0.6 = $r0.6, $r0.7
c0    or $r0.11 = $r0.8, 8388608
;;
c0    and $r0.10 = $r0.10, 255
c0    or $r0.12 = $r0.9, 8388608
;;
c0    cmpeq $b0.0 = $r0.2, 255
c0    cmpeq $b0.1 = $r0.2, $r0.0
;;
c0    shl $r0.11 = $r0.11, 7
c0    mov $r0.7 = $r0.3
;;
c0    cmpeq $b0.2 = $r0.10, 255
c0    cmpeq $b0.3 = $r0.10, $r0.0
c0    add $r0.13 = $r0.2, $r0.10
c0    shl $r0.12 = $r0.12, 8
;;
c0    mov $r0.3 = $r0.6
;;
;;
c0    add $r0.16 = $r0.13, -127
c0    mpylhu $r0.14 = $r0.12, $r0.11
c0    mpylhu $r0.15 = $r0.11, $r0.12
c0    br $b0.2, floatlib_L104?3
;;
c0    mpyllu $r0.17 = $r0.11, $r0.12
c0    mpyhhu $r0.18 = $r0.11, $r0.12
c0    add $r0.19 = $r0.13, -128
c0    br $b0.0, floatlib_L105?3
;;
c0    br $b0.3, floatlib_L106?3
;;
-- floatlib_L107?3
c0    add $r0.15 = $r0.14, $r0.15
c0    br $b0.1, floatlib_L108?3
;;
-- floatlib_L109?3
;;
;;
c0    shru $r0.6 = $r0.15, 16
c0    cmpltu $r0.14 = $r0.15, $r0.14
c0    shl $r0.2 = $r0.15, 16
;;
;;
;;
c0    shl $r0.14 = $r0.14, 16
c0    add $r0.17 = $r0.17, $r0.2
c0    add $r0.6 = $r0.6, $r0.18
;;
;;
;;
c0    cmpltu $r0.2 = $r0.17, $r0.2
c0    stw 0x14[$r0.1] = $r0.17
c0    cmpne $r0.7 = $r0.17, $r0.0
;;
;;
;;
c0    add $r0.14 = $r0.14, $r0.2
;;
;;
;;
c0    add $r0.6 = $r0.6, $r0.14
;;
;;
;;
c0    stw 0x10[$r0.1] = $r0.6
c0    or $r0.7 = $r0.6, $r0.7
;;
;;
;;
c0    shl $r0.2 = $r0.7, 1
;;
;;
;;
c0    cmplt $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    slct $r0.5 = $b0.0, $r0.7, $r0.2
c0    slct $r0.4 = $b0.0, $r0.16, $r0.19
;;
;;
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_roundAndPackFloat32
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L108?3
c0    cmpeq $b0.0 = $r0.9, $r0.0
c0    shl $r0.3 = $r0.6, 31
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
c0    brf $b0.0, floatlib_L110?3
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L110?3
c0    stw 0x1c[$r0.1] = $r0.6
c0    mov $r0.3 = $r0.9
;;
c0    stw 0x28[$r0.1] = $r0.8
;;
c0    stw 0x2c[$r0.1] = $r0.10
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x20[$r0.1] = $r0.9
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
c0    add $r0.2 = $r0.3, -8
c0    rsub $r0.3 = 9, $r0.3
c0    ldw $r0.8 = 0x28[$r0.1]
;;
c0    ldw $r0.10 = 0x2c[$r0.1]
;;
c0    ldw $r0.9 = 0x20[$r0.1]
;;
c0    or $r0.11 = $r0.8, 8388608
;;
c0    add $r0.13 = $r0.3, $r0.10
c0    ldw $r0.3 = 0x1c[$r0.1]
;;
c0    shl $r0.9 = $r0.9, $r0.2
;;
c0    shl $r0.11 = $r0.11, 7
;;
c0    add $r0.16 = $r0.13, -127
c0    add $r0.19 = $r0.13, -128
;;
c0    or $r0.12 = $r0.9, 8388608
;;
;;
;;
c0    shl $r0.12 = $r0.12, 8
;;
;;
;;
c0    mpyllu $r0.17 = $r0.11, $r0.12
c0    mpylhu $r0.14 = $r0.12, $r0.11
;;
c0    mpylhu $r0.15 = $r0.11, $r0.12
c0    mpyhhu $r0.18 = $r0.11, $r0.12
;;
;;
;;
c0    add $r0.15 = $r0.14, $r0.15
c0    goto floatlib_L109?3
;;
-- floatlib_L106?3
c0    cmpeq $b0.0 = $r0.8, $r0.0
c0    shl $r0.3 = $r0.6, 31
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
c0    brf $b0.0, floatlib_L111?3
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L111?3
c0    stw 0x1c[$r0.1] = $r0.6
c0    mov $r0.3 = $r0.8
;;
c0    stw 0x20[$r0.1] = $r0.9
;;
c0    stw 0x24[$r0.1] = $r0.2
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x28[$r0.1] = $r0.8
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
c0    add $r0.2 = $r0.3, -8
c0    rsub $r0.10 = 9, $r0.3
c0    ldw $r0.9 = 0x20[$r0.1]
;;
c0    ldw $r0.4 = 0x24[$r0.1]
;;
c0    ldw $r0.8 = 0x28[$r0.1]
;;
c0    or $r0.5 = $r0.9, 8388608
c0    ldw $r0.3 = 0x1c[$r0.1]
;;
c0    cmpeq $b0.1 = $r0.4, $r0.0
c0    add $r0.13 = $r0.4, $r0.10
;;
c0    shl $r0.8 = $r0.8, $r0.2
;;
c0    shl $r0.12 = $r0.5, 8
c0    mov $r0.6 = $r0.3
;;
c0    add $r0.16 = $r0.13, -127
;;
c0    or $r0.2 = $r0.8, 8388608
;;
;;
;;
c0    shl $r0.11 = $r0.2, 7
;;
;;
;;
c0    mpylhu $r0.14 = $r0.12, $r0.11
c0    mpylhu $r0.15 = $r0.11, $r0.12
;;
c0    mpyllu $r0.17 = $r0.11, $r0.12
c0    mpyhhu $r0.18 = $r0.11, $r0.12
c0    add $r0.19 = $r0.13, -128
;;
c0    goto floatlib_L107?3
;;
-- floatlib_L105?3
c0    cmpne $b0.0 = $r0.9, $r0.0
c0    mov $r0.3 = $r0.7
;;
;;
;;
c0    brf $b0.0, floatlib_L112?3
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat32NaN
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L112?3
c0    or $r0.8 = $r0.8, $r0.10
c0    mov $r0.3 = 16
;;
;;
;;
c0    cmpeq $b0.0 = $r0.8, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L113?3
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw $l0.0 = 0x18[$r0.1]
c0    mov $r0.3 = 2147483647
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L113?3
c0    shl $r0.6 = $r0.6, 31
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
c0    add $r0.3 = $r0.6, 2139095040
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L104?3
c0    cmpeq $r0.5 = $r0.2, 255
c0    mov $r0.3 = $r0.7
;;
;;
;;
c0    andl $r0.5 = $r0.5, $r0.9
;;
;;
;;
c0    orl $b0.0 = $r0.8, $r0.5
;;
;;
;;
c0    brf $b0.0, floatlib_L114?3
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat32NaN
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L114?3
c0    or $r0.9 = $r0.9, $r0.2
c0    mov $r0.3 = 16
;;
;;
;;
c0    cmpeq $b0.0 = $r0.9, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L115?3
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw $l0.0 = 0x18[$r0.1]
c0    mov $r0.3 = 2147483647
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L115?3
c0    shl $r0.6 = $r0.6, 31
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
c0    add $r0.3 = $r0.6, 2139095040
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32,$r0.4:u32)
-- FUNC__r_div
c0    add $r0.1 = $r0.1, (-0x60)
c0    shru $r0.2 = $r0.4, 23
c0    shru $r0.10 = $r0.3, 31
;;
c0    and $r0.12 = $r0.3, 8388607
c0    shru $r0.11 = $r0.4, 31
c0    stw 0x20[$r0.1] = $l0.0
;;
c0    and $r0.13 = $r0.4, 8388607
c0    shru $r0.14 = $r0.3, 23
c0    mov $r0.15 = $r0.4
;;
c0    and $r0.2 = $r0.2, 255
;;
c0    xor $r0.16 = $r0.10, $r0.11
c0    or $r0.17 = $r0.12, 8388608
;;
c0    and $r0.14 = $r0.14, 255
c0    or $r0.18 = $r0.13, 8388608
c0    mov $r0.4 = $r0.0
;;
c0    cmpeq $b0.0 = $r0.2, 255
c0    cmpeq $b0.1 = $r0.2, $r0.0
;;
c0    shl $r0.17 = $r0.17, 7
c0    stw 0x24[$r0.1] = $r0.16
;;
c0    cmpeq $b0.2 = $r0.14, 255
c0    cmpeq $b0.3 = $r0.14, $r0.0
c0    sub $r0.11 = $r0.14, $r0.2
c0    shl $r0.10 = $r0.18, 8
;;
;;
c0    add $r0.16 = $r0.17, $r0.17
c0    shru $r0.19 = $r0.17, 1
;;
c0    add $r0.18 = $r0.11, 125
c0    add $r0.20 = $r0.11, 126
c0    stw 0x28[$r0.1] = $r0.10
c0    br $b0.2, floatlib_L116?3
;;
c0    mov $r0.5 = $r0.10
c0    br $b0.0, floatlib_L117?3
;;
c0    cmpgtu $b0.0 = $r0.10, $r0.16
c0    br $b0.1, floatlib_L118?3
;;
-- floatlib_L119?3
c0    br $b0.3, floatlib_L120?3
;;
-- floatlib_L121?3
;;
c0    slct $r0.2 = $b0.0, $r0.17, $r0.19
c0    slct $r0.14 = $b0.0, $r0.18, $r0.20
;;
;;
;;
c0    stw 0x2c[$r0.1] = $r0.2
c0    mov $r0.3 = $r0.2
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
c0    stw 0x30[$r0.1] = $r0.14
c0    call $l0.0 = floatlib_FUNC_estimateDiv64To32
;;
c0    and $r0.10 = $r0.3, 63
c0    mov $r0.7 = $r0.3
c0    mov $r0.8 = (~0x0)
c0    ldw $r0.2 = 0x28[$r0.1]
;;
c0    add $r0.4 = $r0.1, 0x14
c0    add $r0.5 = $r0.1, 0x10
c0    add $r0.6 = $r0.3, (~0x0)
c0    ldw $r0.11 = 0x2c[$r0.1]
;;
c0    mov $r0.9 = $r0.0
c0    ldw $r0.12 = 0x20[$r0.1]
;;
c0    cmpleu $b0.0 = $r0.10, 2
c0    mpylhu $r0.13 = $r0.3, $r0.2
c0    mpylhu $r0.14 = $r0.2, $r0.3
;;
c0    mpyllu $r0.15 = $r0.2, $r0.3
c0    mpyhhu $r0.16 = $r0.2, $r0.3
;;
;;
c0    add $r0.14 = $r0.13, $r0.14
c0    brf $b0.0, floatlib_L122?3
;;
c0    mov $r0.3 = $r0.2
;;
;;
c0    shru $r0.10 = $r0.14, 16
c0    cmpltu $r0.13 = $r0.14, $r0.13
c0    shl $r0.2 = $r0.14, 16
;;
;;
;;
c0    shl $r0.13 = $r0.13, 16
c0    add $r0.15 = $r0.15, $r0.2
c0    add $r0.10 = $r0.10, $r0.16
c0    ldw $r0.14 = 0x30[$r0.1]
;;
;;
;;
c0    cmpltu $r0.2 = $r0.15, $r0.2
c0    stw 0x1c[$r0.1] = $r0.15
c0    sub $r0.17 = $r0.0, $r0.15
c0    cmpgtu $r0.16 = $r0.15, $r0.0
;;
;;
;;
c0    add $r0.13 = $r0.13, $r0.2
c0    stw 0x10[$r0.1] = $r0.17
;;
;;
;;
c0    add $r0.10 = $r0.10, $r0.13
;;
;;
;;
c0    sub $r0.11 = $r0.11, $r0.10
c0    ldw $r0.13 = 0x24[$r0.1]
;;
c0    stw 0x18[$r0.1] = $r0.10
;;
;;
c0    sub $r0.11 = $r0.11, $r0.16
;;
;;
;;
c0    stw 0x14[$r0.1] = $r0.11
;;
-- floatlib_L123?3
c0    ldw.d $r0.2 = 0x10[$r0.1]
;;
c0    ldw $r0.10 = 0x14[$r0.1]
;;
;;
c0    add $r0.11 = $r0.2, $r0.3
;;
c0    cmplt $b0.0 = $r0.10, $r0.0
;;
;;
c0    cmpltu $r0.2 = $r0.11, $r0.2
;;
c0    brf $b0.0, floatlib_L124?3
;;
c0    stw 0[$r0.5] = $r0.11
c0    add $r0.7 = $r0.7, -2
;;
c0    add $r0.10 = $r0.10, $r0.2
c0    ldw.d $r0.2 = 0x10[$r0.1]
;;
;;
;;
c0    stw 0[$r0.4] = $r0.10
c0    add $r0.11 = $r0.3, $r0.2
;;
c0    ldw $r0.10 = 0x14[$r0.1]
;;
;;
c0    cmpltu $r0.2 = $r0.11, $r0.2
;;
c0    cmplt $b0.0 = $r0.10, $r0.0
;;
;;
c0    add $r0.10 = $r0.10, $r0.2
;;
c0    brf $b0.0, floatlib_L125?3
;;
c0    stw 0[$r0.5] = $r0.11
c0    add $r0.9 = $r0.9, -2
;;
c0    ldw.d $r0.2 = 0x10[$r0.1]
;;
c0    stw 0[$r0.4] = $r0.10
;;
c0    ldw $r0.10 = 0x14[$r0.1]
;;
c0    add $r0.11 = $r0.3, $r0.2
;;
;;
c0    cmplt $b0.0 = $r0.10, $r0.0
;;
c0    cmpltu $r0.2 = $r0.11, $r0.2
;;
;;
c0    brf $b0.0, floatlib_L126?3
;;
c0    add $r0.10 = $r0.10, $r0.2
c0    stw 0[$r0.5] = $r0.11
c0    add $r0.6 = $r0.6, (~0x1)
;;
c0    ldw.d $r0.2 = 0x10[$r0.1]
;;
;;
c0    stw 0[$r0.4] = $r0.10
;;
c0    ldw $r0.10 = 0x14[$r0.1]
c0    add $r0.11 = $r0.3, $r0.2
;;
;;
;;
c0    cmplt $b0.0 = $r0.10, $r0.0
c0    cmpltu $r0.2 = $r0.11, $r0.2
;;
;;
;;
c0    add $r0.10 = $r0.10, $r0.2
c0    brf $b0.0, floatlib_L127?3
;;
c0    stw 0[$r0.5] = $r0.11
c0    add $r0.8 = $r0.8, (~0x1)
;;
;;
c0    stw 0[$r0.4] = $r0.10
c0    goto floatlib_L123?3
;;
-- floatlib_L127?3
c0    mov $r0.9 = $r0.8
c0    stw 0x24[$r0.1] = $r0.13
;;
c0    goto floatlib_L128?3
;;
-- floatlib_L126?3
c0    mov $r0.9 = $r0.8
c0    mov $r0.7 = $r0.6
c0    stw 0x24[$r0.1] = $r0.13
c0    goto floatlib_L128?3
;;
-- floatlib_L125?3
c0    mov $r0.7 = $r0.6
c0    stw 0x24[$r0.1] = $r0.13
c0    goto floatlib_L128?3
;;
-- floatlib_L124?3
c0    stw 0x24[$r0.1] = $r0.13
;;
-- floatlib_L128?3
c0    add $r0.7 = $r0.7, $r0.9
c0    stw 0x30[$r0.1] = $r0.14
;;
c0    stw 0x20[$r0.1] = $r0.12
;;
c0    ldw $r0.2 = 0x10[$r0.1]
;;
;;
;;
c0    cmpne $r0.2 = $r0.2, $r0.0
;;
;;
;;
c0    or $r0.5 = $r0.7, $r0.2
;;
c0    ldw $r0.4 = 0x30[$r0.1]
;;
c0    ldw $r0.3 = 0x24[$r0.1]
c0    goto floatlib_L129?3
;;
-- floatlib_L122?3
c0    mov $r0.5 = $r0.7
c0    ldw $r0.4 = 0x30[$r0.1]
;;
c0    ldw $r0.3 = 0x24[$r0.1]
;;
-- floatlib_L129?3
;;
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_roundAndPackFloat32
;;
c0    ldw $l0.0 = 0x20[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L120?3
c0    cmpeq $b0.1 = $r0.12, $r0.0
c0    ldw $r0.16 = 0x24[$r0.1]
;;
c0    ldw $l0.0 = 0x20[$r0.1]
;;
;;
c0    shl $r0.3 = $r0.16, 31
c0    brf $b0.1, floatlib_L130?3
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L130?3
c0    stw 0x3c[$r0.1] = $r0.13
;;
c0    stw 0x40[$r0.1] = $r0.2
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    mov $r0.3 = $r0.12
c0    stw 0x34[$r0.1] = $r0.12
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
c0    add $r0.2 = $r0.3, -8
c0    rsub $r0.14 = 9, $r0.3
c0    mov $r0.4 = $r0.0
c0    ldw $r0.13 = 0x3c[$r0.1]
;;
c0    ldw $r0.3 = 0x40[$r0.1]
;;
c0    ldw $r0.12 = 0x34[$r0.1]
;;
c0    or $r0.13 = $r0.13, 8388608
;;
c0    sub $r0.11 = $r0.14, $r0.3
;;
c0    shl $r0.12 = $r0.12, $r0.2
;;
c0    shl $r0.10 = $r0.13, 8
;;
c0    add $r0.18 = $r0.11, 125
c0    add $r0.20 = $r0.11, 126
;;
c0    or $r0.12 = $r0.12, 8388608
;;
c0    stw 0x28[$r0.1] = $r0.10
c0    mov $r0.5 = $r0.10
;;
;;
c0    shl $r0.17 = $r0.12, 7
;;
;;
;;
c0    add $r0.16 = $r0.17, $r0.17
c0    shru $r0.19 = $r0.17, 1
;;
;;
;;
c0    cmpgtu $b0.0 = $r0.10, $r0.16
;;
c0    goto floatlib_L121?3
;;
-- floatlib_L118?3
c0    cmpeq $b0.1 = $r0.13, $r0.0
c0    or $r0.2 = $r0.12, $r0.14
c0    mov $r0.3 = 16
;;
;;
;;
c0    cmpeq $b0.0 = $r0.2, $r0.0
c0    brf $b0.1, floatlib_L131?3
;;
;;
;;
c0    brf $b0.0, floatlib_L132?3
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw $l0.0 = 0x20[$r0.1]
c0    mov $r0.3 = 2147483647
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L132?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    mov $r0.3 = 128
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw $r0.16 = 0x24[$r0.1]
;;
c0    ldw $l0.0 = 0x20[$r0.1]
;;
;;
c0    shl $r0.16 = $r0.16, 31
;;
;;
;;
c0    add $r0.3 = $r0.16, 2139095040
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L131?3
c0    stw 0x34[$r0.1] = $r0.12
c0    mov $r0.3 = $r0.13
;;
c0    stw 0x38[$r0.1] = $r0.14
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
c0    stw 0x3c[$r0.1] = $r0.13
c0    call $l0.0 = floatlib_FUNC_countLeadingZeros32
;;
c0    add $r0.6 = $r0.3, -8
c0    rsub $r0.2 = 9, $r0.3
c0    mov $r0.4 = $r0.0
c0    ldw $r0.12 = 0x34[$r0.1]
;;
c0    ldw $r0.14 = 0x38[$r0.1]
;;
c0    ldw $r0.13 = 0x3c[$r0.1]
;;
c0    or $r0.3 = $r0.12, 8388608
;;
c0    cmpeq $b0.3 = $r0.14, $r0.0
c0    sub $r0.11 = $r0.14, $r0.2
;;
c0    shl $r0.13 = $r0.13, $r0.6
;;
c0    shl $r0.17 = $r0.3, 7
;;
c0    add $r0.18 = $r0.11, 125
c0    add $r0.20 = $r0.11, 126
;;
c0    or $r0.3 = $r0.13, 8388608
;;
c0    add $r0.16 = $r0.17, $r0.17
c0    shru $r0.19 = $r0.17, 1
;;
;;
c0    shl $r0.10 = $r0.3, 8
;;
;;
;;
c0    stw 0x28[$r0.1] = $r0.10
c0    mov $r0.5 = $r0.10
;;
c0    cmpgtu $b0.0 = $r0.10, $r0.16
c0    goto floatlib_L119?3
;;
-- floatlib_L117?3
c0    cmpne $b0.0 = $r0.13, $r0.0
c0    mov $r0.4 = $r0.15
;;
;;
;;
c0    brf $b0.0, floatlib_L133?3
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat32NaN
;;
c0    ldw $l0.0 = 0x20[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L133?3
c0    ldw $r0.16 = 0x24[$r0.1]
;;
c0    ldw $l0.0 = 0x20[$r0.1]
;;
;;
c0    shl $r0.3 = $r0.16, 31
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L116?3
c0    cmpne $b0.0 = $r0.12, $r0.0
c0    mov $r0.4 = $r0.15
;;
;;
;;
c0    brf $b0.0, floatlib_L134?3
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat32NaN
;;
c0    ldw $l0.0 = 0x20[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L134?3
c0    cmpeq $b0.0 = $r0.2, 255
c0    cmpne $b0.1 = $r0.13, $r0.0
c0    mov $r0.4 = $r0.15
;;
;;
;;
c0    brf $b0.0, floatlib_L135?3
;;
c0    brf $b0.1, floatlib_L136?3
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat32NaN
;;
c0    ldw $l0.0 = 0x20[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L136?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    mov $r0.3 = 16
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    ldw $l0.0 = 0x20[$r0.1]
c0    mov $r0.3 = 2147483647
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L135?3
c0    ldw $r0.16 = 0x24[$r0.1]
;;
c0    ldw $l0.0 = 0x20[$r0.1]
;;
;;
c0    shl $r0.16 = $r0.16, 31
;;
;;
;;
c0    add $r0.3 = $r0.16, 2139095040
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC__r_eq
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.2 = $r0.3, 23
c0    shru $r0.5 = $r0.4, 23
;;
c0    and $r0.6 = $r0.3, 8388607
c0    or $r0.7 = $r0.3, $r0.4
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    and $r0.8 = $r0.4, 8388607
c0    cmpeq $r0.9 = $r0.3, $r0.4
;;
c0    and $r0.2 = $r0.2, 255
c0    and $r0.5 = $r0.5, 255
;;
c0    shl $r0.7 = $r0.7, 1
;;
;;
c0    cmpeq $r0.2 = $r0.2, 255
c0    cmpeq $r0.5 = $r0.5, 255
;;
c0    cmpeq $r0.7 = $r0.7, $r0.0
;;
;;
c0    andl $r0.2 = $r0.2, $r0.6
c0    andl $r0.5 = $r0.5, $r0.8
;;
c0    orl $r0.9 = $r0.9, $r0.7
;;
;;
c0    orl $b0.0 = $r0.2, $r0.5
;;
c0    mov $r0.3 = $r0.9
c0    mov $r0.2 = $r0.3
;;
;;
c0    br $b0.0, floatlib_L137?3
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L137?3
c0    shru $r0.5 = $r0.2, 22
c0    and $r0.6 = $r0.2, 4194303
c0    shru $r0.7 = $r0.4, 22
;;
c0    and $r0.8 = $r0.4, 4194303
c0    mov $r0.3 = 16
;;
;;
c0    and $r0.5 = $r0.5, 511
c0    and $r0.7 = $r0.7, 511
;;
;;
;;
c0    cmpeq $r0.5 = $r0.5, 510
c0    cmpeq $r0.7 = $r0.7, 510
;;
;;
;;
c0    andl $r0.5 = $r0.5, $r0.6
c0    andl $r0.7 = $r0.7, $r0.8
;;
;;
;;
c0    orl $b0.0 = $r0.5, $r0.7
;;
;;
;;
c0    brf $b0.0, floatlib_L138?3
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
-- floatlib_L138?3
c0    mov $r0.3 = $r0.0
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC__r_le
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.2 = $r0.3, 23
c0    shru $r0.5 = $r0.4, 23
;;
c0    and $r0.6 = $r0.3, 8388607
c0    shru $r0.7 = $r0.3, 31
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    and $r0.8 = $r0.4, 8388607
c0    shru $r0.9 = $r0.4, 31
c0    or $r0.10 = $r0.3, $r0.4
;;
c0    and $r0.2 = $r0.2, 255
c0    and $r0.5 = $r0.5, 255
;;
;;
c0    cmpne $b0.0 = $r0.7, $r0.9
c0    shl $r0.10 = $r0.10, 1
;;
c0    cmpeq $r0.2 = $r0.2, 255
c0    cmpeq $r0.5 = $r0.5, 255
;;
;;
c0    cmpeq $r0.10 = $r0.10, $r0.0
;;
c0    andl $r0.2 = $r0.2, $r0.6
c0    andl $r0.5 = $r0.5, $r0.8
;;
;;
c0    orl $r0.10 = $r0.7, $r0.10
;;
c0    orl $b0.1 = $r0.2, $r0.5
;;
;;
c0    mov $r0.3 = $r0.10
c0    mov $r0.2 = $r0.3
;;
c0    br $b0.1, floatlib_L139?3
;;
c0    brf $b0.0, floatlib_L140?3
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L140?3
c0    cmpeq $r0.2 = $r0.2, $r0.4
c0    cmpltu $r0.5 = $r0.2, $r0.4
;;
;;
;;
c0    xor $r0.5 = $r0.5, $r0.7
;;
;;
;;
c0    orl $r0.3 = $r0.2, $r0.5
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L139?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    mov $r0.3 = 16
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    mov $r0.3 = $r0.0
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC__r_lt
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.2 = $r0.3, 23
c0    shru $r0.5 = $r0.4, 23
;;
c0    and $r0.6 = $r0.3, 8388607
c0    shru $r0.7 = $r0.3, 31
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    and $r0.8 = $r0.4, 8388607
c0    shru $r0.9 = $r0.4, 31
c0    or $r0.10 = $r0.3, $r0.4
;;
c0    and $r0.2 = $r0.2, 255
c0    and $r0.5 = $r0.5, 255
;;
;;
c0    cmpne $b0.0 = $r0.7, $r0.9
c0    shl $r0.10 = $r0.10, 1
;;
c0    cmpeq $r0.2 = $r0.2, 255
c0    cmpeq $r0.5 = $r0.5, 255
;;
;;
c0    andl $r0.10 = $r0.7, $r0.10
;;
c0    andl $r0.2 = $r0.2, $r0.6
c0    andl $r0.5 = $r0.5, $r0.8
;;
;;
c0    mov $r0.3 = $r0.10
c0    mov $r0.6 = $r0.3
;;
c0    orl $b0.1 = $r0.2, $r0.5
;;
;;
;;
c0    br $b0.1, floatlib_L141?3
;;
c0    brf $b0.0, floatlib_L142?3
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L142?3
c0    cmpne $r0.6 = $r0.6, $r0.4
c0    cmpltu $r0.2 = $r0.6, $r0.4
;;
;;
;;
c0    xor $r0.2 = $r0.2, $r0.7
;;
;;
;;
c0    andl $r0.3 = $r0.6, $r0.2
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L141?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    mov $r0.3 = 16
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    mov $r0.3 = $r0.0
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:s32)
-- floatlib_FUNC_float64_to_int32_round_to_zero
c0    add $r0.1 = $r0.1, (-0x40)
c0    and $r0.2 = $r0.3, 1048575
;;
c0    shru $r0.7 = $r0.3, 20
c0    shru $r0.6 = $r0.3, 31
c0    cmpne $b0.0 = $r0.5, $r0.0
c0    stw 0x18[$r0.1] = $l0.0
;;
c0    ldw.d $r0.9 = 0x14[$r0.1]
c0    mov $r0.8 = (~0x3fffffff)
;;
c0    or $r0.10 = $r0.4, $r0.2
c0    ldw.d $r0.11 = ((floatlib_?1PACKET.3+0)+0)[$r0.0]
;;
c0    and $r0.7 = $r0.7, 2047
c0    slct $r0.8 = $b0.0, $r0.8, (~0x0)
;;
c0    cmpne $b0.1 = $r0.9, $r0.0
;;
c0    or $r0.11 = $r0.11, 1
;;
c0    add $r0.12 = $r0.7, -1043
c0    cmpeq $r0.13 = $r0.7, 2047
;;
;;
;;
c0    cmpge $b0.0 = $r0.12, $r0.0
c0    cmpgt $b0.2 = $r0.12, 11
c0    andl $b0.3 = $r0.13, $r0.10
;;
;;
;;
c0    brf $b0.0, floatlib_L143?3
;;
c0    brf $b0.2, floatlib_L144?3
;;
c0    slctf $r0.6 = $b0.3, $r0.6, $r0.0
c0    stw 0x10[$r0.1] = $r0.8
;;
c0    ldw $r0.2 = 0x10[$r0.1]
;;
;;
-- floatlib_L145?3
c0    orl $r0.4 = $r0.6, $r0.5
c0    mtb $b0.0 = $r0.6
;;
c0    sub $r0.7 = $r0.0, $r0.2
;;
;;
;;
c0    slct $r0.3 = $b0.0, $r0.7, $r0.2
;;
;;
;;
c0    cmplt $r0.2 = $r0.3, $r0.0
c0    andl $r0.4 = $r0.3, $r0.4
;;
;;
;;
c0    xor $r0.2 = $r0.6, $r0.2
;;
;;
;;
c0    andl $b0.0 = $r0.4, $r0.2
;;
;;
;;
c0    br $b0.0, floatlib_L146?3
;;
c0    brf $b0.1, floatlib_L147?3
;;
.return ret($r0.3:s32)
c0    stw ((floatlib_?1PACKET.3+0)+0)[$r0.0] = $r0.11
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L147?3
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L146?3
c0    stw 0x1c[$r0.1] = $r0.6
c0    mov $r0.3 = 16
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    stw 0x20[$r0.1] = $r0.5
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    mov $r0.2 = (~0x7fffffff)
c0    ldw $l0.0 = 0x18[$r0.1]
;;
c0    ldw $r0.6 = 0x1c[$r0.1]
;;
c0    ldw $r0.5 = 0x20[$r0.1]
;;
;;
c0    mtb $b0.0 = $r0.6
;;
c0    cmpne $b0.1 = $r0.5, $r0.0
;;
;;
c0    slct $r0.3 = $b0.0, $r0.2, 2147483647
;;
c0    brf $b0.1, floatlib_L148?3
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L148?3
c0    ldw $r0.6 = 0x1c[$r0.1]
;;
;;
;;
c0    mtb $b0.0 = $r0.6
;;
;;
;;
c0    slct $r0.3 = $b0.0, $r0.0, (~0x0)
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L144?3
c0    or $r0.2 = $r0.2, 1048576
c0    sub $r0.3 = $r0.0, $r0.12
c0    cmpeq $b0.0 = $r0.12, $r0.0
;;
c0    shl $r0.7 = $r0.4, $r0.12
;;
;;
c0    shl $r0.12 = $r0.2, $r0.12
c0    and $r0.3 = $r0.3, 31
;;
c0    stw 0x14[$r0.1] = $r0.7
;;
c0    ldw.d $r0.9 = 0x14[$r0.1]
;;
c0    shru $r0.4 = $r0.4, $r0.3
;;
;;
c0    cmpne $b0.1 = $r0.9, $r0.0
;;
c0    or $r0.12 = $r0.12, $r0.4
;;
;;
;;
c0    slct $r0.2 = $b0.0, $r0.2, $r0.12
;;
;;
;;
c0    stw 0x10[$r0.1] = $r0.2
;;
c0    ldw.d $r0.2 = ((floatlib_?1PACKET.3+0)+0)[$r0.0]
;;
;;
;;
c0    or $r0.11 = $r0.2, 1
;;
c0    ldw $r0.2 = 0x10[$r0.1]
;;
c0    goto floatlib_L145?3
;;
-- floatlib_L143?3
c0    cmplt $b0.0 = $r0.7, 1022
c0    or $r0.3 = $r0.7, $r0.2
;;
;;
;;
c0    or $r0.3 = $r0.3, $r0.4
c0    brf $b0.0, floatlib_L149?3
;;
c0    stw 0x10[$r0.1] = $r0.0
;;
;;
c0    stw 0x14[$r0.1] = $r0.3
;;
c0    ldw.d $r0.9 = 0x14[$r0.1]
;;
;;
;;
c0    cmpne $b0.1 = $r0.9, $r0.0
;;
c0    ldw $r0.2 = 0x10[$r0.1]
;;
c0    goto floatlib_L145?3
;;
-- floatlib_L149?3
c0    or $r0.2 = $r0.2, 1048576
c0    sub $r0.12 = $r0.0, $r0.12
c0    and $r0.7 = $r0.12, 31
;;
;;
;;
c0    shru $r0.2 = $r0.2, $r0.12
c0    shl $r0.7 = $r0.2, $r0.7
;;
;;
;;
c0    or $r0.7 = $r0.7, $r0.4
c0    stw 0x10[$r0.1] = $r0.2
;;
;;
;;
c0    stw 0x14[$r0.1] = $r0.7
;;
c0    ldw.d $r0.9 = 0x14[$r0.1]
;;
;;
;;
c0    cmpne $b0.1 = $r0.9, $r0.0
;;
c0    ldw $r0.2 = 0x10[$r0.1]
;;
c0    goto floatlib_L145?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32)
-- FUNC__r_d
c0    add $r0.1 = $r0.1, (-0x40)
c0    and $r0.2 = $r0.3, 1048575
;;
c0    shru $r0.6 = $r0.3, 20
c0    shru $r0.5 = $r0.3, 31
c0    stw 0x18[$r0.1] = $l0.0
;;
c0    stw 0x1c[$r0.1] = $r0.4
;;
c0    or $r0.7 = $r0.4, $r0.2
c0    stw 0x20[$r0.1] = $r0.3
;;
c0    and $r0.6 = $r0.6, 2047
;;
;;
c0    cmpne $b0.0 = $r0.7, $r0.0
;;
c0    cmpeq $b0.1 = $r0.6, 2047
;;
;;
;;
c0    brf $b0.1, floatlib_L150?3
;;
c0    brf $b0.0, floatlib_L151?3
;;
.call float64ToCommonNaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32,$r0.4:u32,$r0.5:u32)
c0    call $l0.0 = floatlib_FUNC_float64ToCommonNaN
;;
c0    shru $r0.2 = $r0.4, 9
c0    ldw $r0.4 = 0x1c[$r0.1]
;;
c0    ldw $r0.3 = 0x20[$r0.1]
;;
;;
.call float64ToCommonNaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32,$r0.4:u32,$r0.5:u32)
c0    stw 0x24[$r0.1] = $r0.2
c0    call $l0.0 = floatlib_FUNC_float64ToCommonNaN
;;
c0    shl $r0.3 = $r0.3, 31
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
c0    ldw $r0.2 = 0x24[$r0.1]
;;
;;
;;
c0    or $r0.2 = $r0.2, 2143289344
;;
;;
;;
c0    or $r0.3 = $r0.2, $r0.3
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L151?3
c0    shl $r0.5 = $r0.5, 31
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
c0    add $r0.3 = $r0.5, 2139095040
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L150?3
c0    shl $r0.7 = $r0.4, 10
c0    shru $r0.9 = $r0.4, 22
c0    shl $r0.8 = $r0.2, 10
c0    shru $r0.10 = $r0.2, 22
;;
c0    cmpne $b0.0 = $r0.6, $r0.0
c0    add $r0.11 = $r0.6, -897
c0    mov $r0.3 = $r0.5
;;
;;
c0    cmpne $r0.7 = $r0.7, $r0.0
c0    stw 0x10[$r0.1] = $r0.10
;;
c0    mov $r0.4 = $r0.11
;;
;;
c0    or $r0.7 = $r0.7, $r0.8
;;
;;
;;
c0    or $r0.7 = $r0.7, $r0.9
;;
;;
;;
c0    stw 0x14[$r0.1] = $r0.7
c0    or $r0.2 = $r0.7, 1073741824
c0    brf $b0.0, floatlib_L152?3
;;
;;
;;
c0    stw 0x14[$r0.1] = $r0.2
;;
-- floatlib_L153?3
c0    ldw $r0.5 = 0x14[$r0.1]
;;
;;
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_roundAndPackFloat32
;;
c0    ldw $l0.0 = 0x18[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L152?3
c0    mov $r0.3 = $r0.5
;;
c0    goto floatlib_L153?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32)
-- floatlib_FUNC_addFloat64Sigs
c0    add $r0.1 = $r0.1, (-0x40)
c0    and $r0.2 = $r0.3, 1048575
;;
c0    and $r0.8 = $r0.5, 1048575
c0    shru $r0.9 = $r0.3, 20
c0    stw 0x2c[$r0.1] = $l0.0
;;
c0    stw 0x1c[$r0.1] = $r0.4
c0    shru $r0.10 = $r0.5, 20
;;
c0    stw 0x18[$r0.1] = $r0.2
c0    or $r0.11 = $r0.4, $r0.2
;;
c0    and $r0.9 = $r0.9, 2047
c0    stw 0x14[$r0.1] = $r0.6
;;
c0    and $r0.10 = $r0.10, 2047
c0    stw 0x10[$r0.1] = $r0.8
;;
c0    cmpne $b0.0 = $r0.11, $r0.0
;;
c0    cmpeq $b0.1 = $r0.9, 2047
;;
c0    sub $r0.2 = $r0.9, $r0.10
;;
;;
;;
c0    cmpgt $b0.2 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.2, floatlib_L154?3
;;
c0    brf $b0.1, floatlib_L155?3
;;
c0    brf $b0.0, floatlib_L156?3
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat64NaN
;;
c0    ldw $l0.0 = 0x2c[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L156?3
c0    ldw $l0.0 = 0x2c[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L155?3
c0    cmpeq $b0.0 = $r0.10, $r0.0
c0    ldw.d $r0.8 = 0x10[$r0.1]
c0    add $r0.11 = $r0.1, 0x10
c0    add $r0.12 = $r0.1, 0x14
;;
c0    ldw.d $r0.13 = 0x14[$r0.1]
c0    mov $r0.14 = $r0.0
c0    add $r0.15 = $r0.1, 0x20
c0    mov $r0.16 = $r0.0
;;
c0    mov $r0.18 = $r0.9
c0    ldw.d $r0.17 = 0x1c[$r0.1]
c0    mov $r0.3 = $r0.7
;;
c0    mov $r0.19 = $r0.8
c0    ldw.d $r0.10 = 0x18[$r0.1]
c0    add $r0.20 = $r0.18, -1
c0    brf $b0.0, floatlib_L157?3
;;
c0    add $r0.2 = $r0.2, -1
c0    mov $r0.21 = $r0.13
;;
;;
c0    or $r0.10 = $r0.10, 1048576
;;
-- floatlib_L158?3
c0    sub $r0.22 = $r0.0, $r0.2
c0    cmpeq $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    and $r0.22 = $r0.22, 31
;;
;;
c0    brf $b0.0, floatlib_L159?3
;;
-- floatlib_L160?3
c0    stw 0[$r0.12] = $r0.21
;;
c0    ldw $r0.8 = 0x14[$r0.1]
;;
c0    stw 0[$r0.11] = $r0.19
;;
c0    ldw $r0.11 = 0x10[$r0.1]
;;
c0    stw 0[$r0.15] = $r0.16
c0    add $r0.8 = $r0.17, $r0.8
;;
-- floatlib_L161?3
c0    ldw.d $r0.12 = 0x20[$r0.1]
;;
c0    stw 0x18[$r0.1] = $r0.10
;;
c0    cmpltu $r0.17 = $r0.8, $r0.17
c0    stw 0x24[$r0.1] = $r0.8
;;
c0    ldw.d $r0.13 = 0x24[$r0.1]
c0    cmpne $r0.12 = $r0.12, $r0.0
;;
;;
c0    add $r0.10 = $r0.10, $r0.17
;;
c0    shl $r0.14 = $r0.13, 31
c0    shru $r0.8 = $r0.13, 1
;;
;;
c0    add $r0.10 = $r0.10, $r0.11
;;
c0    or $r0.14 = $r0.14, $r0.12
;;
;;
c0    stw 0x28[$r0.1] = $r0.10
c0    cmpltu $b0.0 = $r0.10, 2097152
;;
c0    ldw.d $r0.11 = 0x28[$r0.1]
;;
;;
c0    br $b0.0, floatlib_L162?3
;;
c0    mov $r0.4 = $r0.18
c0    stw 0x20[$r0.1] = $r0.14
c0    shl $r0.12 = $r0.11, 31
c0    shru $r0.10 = $r0.11, 1
;;
-- floatlib_L163?3
c0    ldw $r0.7 = 0x20[$r0.1]
;;
;;
c0    or $r0.12 = $r0.12, $r0.8
c0    stw 0x28[$r0.1] = $r0.10
;;
c0    ldw $r0.5 = 0x28[$r0.1]
;;
;;
c0    stw 0x24[$r0.1] = $r0.12
;;
-- floatlib_L164?3
c0    ldw $r0.6 = 0x24[$r0.1]
;;
;;
.call roundAndPackFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_roundAndPackFloat64
;;
c0    ldw $l0.0 = 0x2c[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L162?3
c0    ldw $r0.5 = 0x28[$r0.1]
c0    mov $r0.3 = $r0.7
c0    mov $r0.4 = $r0.20
;;
c0    ldw $r0.7 = 0x20[$r0.1]
;;
;;
c0    goto floatlib_L164?3
;;
-- floatlib_L159?3
c0    cmplt $b0.0 = $r0.2, 32
c0    shl $r0.4 = $r0.13, $r0.22
c0    shru $r0.5 = $r0.13, $r0.2
c0    cmpne $r0.14 = $r0.14, $r0.0
;;
c0    shl $r0.6 = $r0.8, $r0.22
c0    shru $r0.19 = $r0.8, $r0.2
c0    mov $r0.3 = $r0.7
;;
;;
c0    or $r0.16 = $r0.14, $r0.4
c0    brf $b0.0, floatlib_L165?3
;;
c0    or $r0.21 = $r0.5, $r0.6
;;
;;
c0    goto floatlib_L160?3
;;
-- floatlib_L165?3
c0    cmpge $b0.1 = $r0.2, 64
c0    cmpne $r0.4 = $r0.8, $r0.0
c0    cmpeq $b0.0 = $r0.2, 64
c0    shl $r0.22 = $r0.8, $r0.22
;;
c0    cmpeq $b0.2 = $r0.2, 32
c0    and $r0.2 = $r0.2, 31
c0    mov $r0.19 = $r0.0
c0    mov $r0.3 = $r0.7
;;
;;
c0    slct $r0.4 = $b0.0, $r0.8, $r0.4
;;
c0    shru $r0.2 = $r0.8, $r0.2
c0    slctf $r0.14 = $b0.2, $r0.13, $r0.0
;;
;;
c0    slct $r0.4 = $b0.1, $r0.4, $r0.22
;;
c0    slctf $r0.2 = $b0.1, $r0.2, $r0.0
c0    cmpne $r0.14 = $r0.14, $r0.0
;;
;;
c0    slct $r0.4 = $b0.2, $r0.13, $r0.4
;;
c0    slct $r0.21 = $b0.2, $r0.8, $r0.2
;;
;;
c0    or $r0.16 = $r0.14, $r0.4
;;
;;
c0    goto floatlib_L160?3
;;
-- floatlib_L157?3
c0    ldw $r0.4 = 0x10[$r0.1]
c0    mov $r0.21 = $r0.13
c0    mov $r0.3 = $r0.7
;;
;;
;;
c0    or $r0.4 = $r0.4, 1048576
;;
;;
;;
c0    stw 0x10[$r0.1] = $r0.4
;;
c0    ldw $r0.8 = 0x10[$r0.1]
;;
;;
;;
c0    mov $r0.19 = $r0.8
c0    or $r0.10 = $r0.10, 1048576
c0    goto floatlib_L158?3
;;
-- floatlib_L154?3
c0    cmplt $b0.0 = $r0.2, $r0.0
c0    cmpeq $b0.1 = $r0.10, 2047
c0    ldw.d $r0.8 = 0x14[$r0.1]
;;
c0    ldw.d $r0.11 = 0x10[$r0.1]
;;
;;
c0    brf $b0.0, floatlib_L166?3
;;
c0    or $r0.8 = $r0.8, $r0.11
c0    brf $b0.1, floatlib_L167?3
;;
;;
;;
c0    cmpne $b0.0 = $r0.8, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L168?3
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat64NaN
;;
c0    ldw $l0.0 = 0x2c[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L168?3
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    mov $r0.3 = $r0.7
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    mov $r0.4 = 2047
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x2c[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L167?3
c0    cmpeq $b0.0 = $r0.9, $r0.0
c0    ldw.d $r0.4 = 0x18[$r0.1]
c0    add $r0.5 = $r0.1, 0x18
c0    add $r0.6 = $r0.1, 0x1c
;;
c0    ldw.d $r0.11 = 0x1c[$r0.1]
c0    add $r0.12 = $r0.1, 0x20
c0    mov $r0.13 = $r0.0
c0    mov $r0.18 = $r0.10
;;
c0    ldw.d $r0.8 = 0x14[$r0.1]
c0    add $r0.20 = $r0.18, -1
c0    mov $r0.3 = $r0.7
;;
c0    mov $r0.9 = $r0.4
c0    brf $b0.0, floatlib_L169?3
;;
c0    add $r0.2 = $r0.2, 1
c0    mov $r0.14 = $r0.11
;;
;;
;;
-- floatlib_L170?3
c0    sub $r0.2 = $r0.0, $r0.2
;;
;;
;;
c0    sub $r0.15 = $r0.0, $r0.2
c0    cmpeq $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    and $r0.15 = $r0.15, 31
;;
;;
c0    brf $b0.0, floatlib_L171?3
;;
-- floatlib_L172?3
c0    stw 0[$r0.12] = $r0.13
;;
c0    stw 0[$r0.6] = $r0.14
;;
c0    ldw $r0.17 = 0x1c[$r0.1]
;;
c0    stw 0[$r0.5] = $r0.9
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
;;
;;
c0    or $r0.10 = $r0.4, 1048576
;;
c0    ldw $r0.11 = 0x10[$r0.1]
;;
c0    add $r0.8 = $r0.17, $r0.8
c0    goto floatlib_L161?3
;;
-- floatlib_L171?3
c0    shl $r0.16 = $r0.4, $r0.15
c0    cmpne $r0.10 = $r0.4, $r0.0
c0    cmpge $b0.1 = $r0.2, 64
c0    cmpeq $b0.0 = $r0.2, 64
;;
c0    cmpge $b0.3 = $r0.2, 32
c0    cmpeq $b0.2 = $r0.2, 32
c0    shl $r0.15 = $r0.11, $r0.15
c0    and $r0.17 = $r0.2, 31
;;
c0    shru $r0.19 = $r0.11, $r0.2
c0    shru $r0.2 = $r0.4, $r0.2
c0    mov $r0.3 = $r0.7
;;
c0    slct $r0.10 = $b0.0, $r0.4, $r0.10
;;
c0    shru $r0.17 = $r0.4, $r0.17
c0    slctf $r0.21 = $b0.2, $r0.11, $r0.0
;;
c0    or $r0.19 = $r0.19, $r0.16
c0    slctf $r0.9 = $b0.3, $r0.2, $r0.0
;;
c0    slct $r0.10 = $b0.1, $r0.10, $r0.16
;;
c0    slctf $r0.17 = $b0.1, $r0.17, $r0.0
c0    slct $r0.21 = $b0.3, $r0.21, $r0.0
;;
;;
c0    slct $r0.11 = $b0.2, $r0.11, $r0.10
;;
c0    slct $r0.4 = $b0.2, $r0.4, $r0.17
c0    cmpne $r0.21 = $r0.21, $r0.0
;;
;;
c0    slct $r0.11 = $b0.3, $r0.11, $r0.15
;;
c0    slct $r0.14 = $b0.3, $r0.4, $r0.19
;;
;;
c0    or $r0.13 = $r0.11, $r0.21
;;
;;
c0    goto floatlib_L172?3
;;
-- floatlib_L169?3
c0    ldw $r0.15 = 0x18[$r0.1]
c0    mov $r0.14 = $r0.11
c0    mov $r0.3 = $r0.7
;;
;;
;;
c0    or $r0.15 = $r0.15, 1048576
;;
;;
;;
c0    stw 0x18[$r0.1] = $r0.15
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
;;
;;
c0    mov $r0.9 = $r0.4
c0    goto floatlib_L170?3
;;
-- floatlib_L166?3
c0    cmpeq $b0.0 = $r0.9, 2047
c0    ldw.d $r0.2 = 0x14[$r0.1]
;;
c0    ldw.d $r0.8 = 0x18[$r0.1]
;;
c0    ldw.d $r0.10 = 0x10[$r0.1]
;;
c0    ldw.d $r0.11 = 0x1c[$r0.1]
c0    brf $b0.0, floatlib_L173?3
;;
c0    or $r0.2 = $r0.2, $r0.8
;;
;;
c0    or $r0.10 = $r0.10, $r0.11
;;
;;
;;
c0    or $r0.2 = $r0.2, $r0.10
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L174?3
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat64NaN
;;
c0    ldw $l0.0 = 0x2c[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L174?3
c0    ldw $l0.0 = 0x2c[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L173?3
c0    ldw $r0.2 = 0x1c[$r0.1]
c0    cmpeq $b0.0 = $r0.9, $r0.0
c0    mov $r0.3 = $r0.7
c0    mov $r0.4 = $r0.0
;;
c0    ldw $r0.8 = 0x14[$r0.1]
;;
c0    ldw $r0.10 = 0x18[$r0.1]
;;
c0    ldw $r0.11 = 0x10[$r0.1]
;;
c0    add $r0.6 = $r0.2, $r0.8
;;
;;
;;
c0    cmpltu $r0.2 = $r0.6, $r0.2
c0    stw 0x24[$r0.1] = $r0.6
;;
;;
;;
c0    add $r0.10 = $r0.10, $r0.2
;;
;;
;;
c0    add $r0.5 = $r0.10, $r0.11
;;
;;
;;
c0    stw 0x28[$r0.1] = $r0.5
c0    brf $b0.0, floatlib_L175?3
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x2c[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L175?3
c0    mov $r0.4 = $r0.9
c0    ldw $r0.13 = 0x24[$r0.1]
c0    mov $r0.3 = $r0.7
;;
c0    ldw $r0.2 = 0x28[$r0.1]
;;
c0    stw 0x20[$r0.1] = $r0.0
;;
c0    ldw $r0.12 = 0x20[$r0.1]
c0    shl $r0.14 = $r0.13, 31
c0    shru $r0.8 = $r0.13, 1
;;
c0    or $r0.2 = $r0.2, 2097152
;;
;;
c0    cmpne $r0.12 = $r0.12, $r0.0
;;
c0    stw 0x28[$r0.1] = $r0.2
;;
c0    ldw $r0.11 = 0x28[$r0.1]
;;
c0    or $r0.14 = $r0.14, $r0.12
;;
;;
;;
c0    stw 0x20[$r0.1] = $r0.14
c0    shl $r0.12 = $r0.11, 31
c0    shru $r0.10 = $r0.11, 1
c0    goto floatlib_L163?3
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32)
-- floatlib_FUNC_subFloat64Sigs
c0    add $r0.1 = $r0.1, (-0x40)
c0    and $r0.2 = $r0.3, 1048575
;;
c0    and $r0.9 = $r0.5, 1048575
c0    shru $r0.8 = $r0.4, 22
c0    stw 0x28[$r0.1] = $l0.0
;;
c0    shru $r0.13 = $r0.3, 20
c0    shl $r0.11 = $r0.4, 10
c0    shl $r0.12 = $r0.6, 10
c0    shru $r0.10 = $r0.6, 22
;;
c0    shru $r0.14 = $r0.5, 20
c0    shl $r0.2 = $r0.2, 10
;;
c0    shl $r0.9 = $r0.9, 10
;;
c0    and $r0.13 = $r0.13, 2047
c0    stw 0x1c[$r0.1] = $r0.11
;;
c0    and $r0.14 = $r0.14, 2047
c0    stw 0x18[$r0.1] = $r0.12
c0    or $r0.2 = $r0.2, $r0.8
;;
c0    or $r0.9 = $r0.9, $r0.10
;;
c0    cmpeq $b0.0 = $r0.13, 2047
;;
c0    sub $r0.8 = $r0.13, $r0.14
c0    stw 0x14[$r0.1] = $r0.2
c0    or $r0.11 = $r0.11, $r0.2
;;
c0    stw 0x10[$r0.1] = $r0.9
;;
;;
c0    cmpgt $b0.1 = $r0.8, $r0.0
c0    cmpne $b0.2 = $r0.11, $r0.0
;;
;;
;;
c0    brf $b0.1, floatlib_L176?3
;;
c0    brf $b0.0, floatlib_L177?3
;;
c0    brf $b0.2, floatlib_L178?3
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat64NaN
;;
c0    ldw $l0.0 = 0x28[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L178?3
c0    ldw $l0.0 = 0x28[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L177?3
c0    cmpeq $b0.0 = $r0.14, $r0.0
c0    ldw.d $r0.2 = 0x10[$r0.1]
c0    add $r0.9 = $r0.1, 0x10
c0    add $r0.10 = $r0.1, 0x18
;;
c0    ldw.d $r0.11 = 0x18[$r0.1]
c0    mov $r0.12 = $r0.13
c0    mov $r0.3 = $r0.7
;;
c0    ldw.d $r0.15 = 0x14[$r0.1]
c0    add $r0.4 = $r0.12, -11
;;
c0    mov $r0.14 = $r0.2
c0    ldw.d $r0.16 = 0x1c[$r0.1]
c0    brf $b0.0, floatlib_L179?3
;;
c0    add $r0.8 = $r0.8, -1
c0    mov $r0.17 = $r0.11
;;
c0    or $r0.15 = $r0.15, 1073741824
;;
;;
-- floatlib_L180?3
c0    sub $r0.12 = $r0.0, $r0.8
c0    cmpeq $b0.0 = $r0.8, $r0.0
;;
;;
;;
c0    and $r0.12 = $r0.12, 31
;;
;;
c0    brf $b0.0, floatlib_L181?3
;;
-- floatlib_L182?3
c0    stw 0x14[$r0.1] = $r0.15
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
c0    stw 0[$r0.9] = $r0.14
;;
c0    ldw $r0.9 = 0x10[$r0.1]
;;
c0    stw 0[$r0.10] = $r0.17
;;
-- floatlib_L183?3
c0    ldw $r0.10 = 0x18[$r0.1]
;;
c0    sub $r0.2 = $r0.2, $r0.9
;;
;;
c0    sub $r0.12 = $r0.16, $r0.10
c0    cmpltu $r0.11 = $r0.16, $r0.10
;;
;;
;;
c0    stw 0x24[$r0.1] = $r0.12
c0    sub $r0.2 = $r0.2, $r0.11
;;
c0    ldw $r0.6 = 0x24[$r0.1]
;;
;;
c0    stw 0x20[$r0.1] = $r0.2
;;
-- floatlib_L184?3
c0    ldw $r0.5 = 0x20[$r0.1]
;;
;;
.call normalizeRoundAndPackFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_normalizeRoundAndPackFloat64
;;
c0    ldw $l0.0 = 0x28[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L181?3
c0    shl $r0.5 = $r0.2, $r0.12
c0    or $r0.13 = $r0.11, $r0.2
c0    cmpge $b0.0 = $r0.8, 64
c0    and $r0.6 = $r0.8, 31
;;
c0    cmpeq $b0.1 = $r0.8, 32
c0    shru $r0.19 = $r0.11, $r0.8
c0    cmpne $r0.18 = $r0.11, $r0.0
c0    shl $r0.12 = $r0.11, $r0.12
;;
c0    cmpge $b0.2 = $r0.8, 32
c0    shru $r0.8 = $r0.2, $r0.8
c0    mov $r0.3 = $r0.7
;;
c0    or $r0.11 = $r0.11, $r0.5
c0    cmpne $r0.13 = $r0.13, $r0.0
c0    shru $r0.6 = $r0.2, $r0.6
;;
c0    cmpne $r0.12 = $r0.12, $r0.0
c0    or $r0.19 = $r0.19, $r0.5
c0    or $r0.18 = $r0.18, $r0.2
;;
c0    slctf $r0.14 = $b0.2, $r0.8, $r0.0
;;
c0    cmpne $r0.11 = $r0.11, $r0.0
;;
c0    or $r0.19 = $r0.19, $r0.12
;;
;;
c0    or $r0.11 = $r0.11, $r0.6
;;
;;
;;
c0    slct $r0.13 = $b0.0, $r0.13, $r0.11
;;
;;
;;
c0    slct $r0.18 = $b0.1, $r0.18, $r0.13
;;
;;
;;
c0    slct $r0.17 = $b0.2, $r0.18, $r0.19
;;
;;
c0    goto floatlib_L182?3
;;
-- floatlib_L179?3
c0    ldw $r0.5 = 0x10[$r0.1]
c0    mov $r0.17 = $r0.11
c0    mov $r0.3 = $r0.7
;;
;;
;;
c0    or $r0.5 = $r0.5, 1073741824
;;
;;
;;
c0    stw 0x10[$r0.1] = $r0.5
;;
c0    ldw $r0.2 = 0x10[$r0.1]
;;
;;
;;
c0    mov $r0.14 = $r0.2
c0    or $r0.15 = $r0.15, 1073741824
;;
c0    goto floatlib_L180?3
;;
-- floatlib_L176?3
c0    cmplt $b0.0 = $r0.8, $r0.0
c0    cmpeq $b0.1 = $r0.14, 2047
c0    ldw.d $r0.2 = 0x18[$r0.1]
;;
c0    ldw.d $r0.9 = 0x10[$r0.1]
;;
;;
c0    brf $b0.0, floatlib_L185?3
;;
c0    or $r0.2 = $r0.2, $r0.9
c0    brf $b0.1, floatlib_L186?3
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L187?3
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat64NaN
;;
c0    ldw $l0.0 = 0x28[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L187?3
c0    xor $r0.3 = $r0.7, 1
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
;;
c0    mov $r0.4 = 2047
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x28[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L186?3
c0    cmpeq $b0.0 = $r0.13, $r0.0
c0    ldw.d $r0.5 = 0x14[$r0.1]
c0    add $r0.9 = $r0.1, 0x14
c0    add $r0.10 = $r0.1, 0x1c
;;
c0    ldw.d $r0.11 = 0x1c[$r0.1]
c0    mov $r0.12 = $r0.14
;;
c0    ldw.d $r0.2 = 0x10[$r0.1]
c0    add $r0.4 = $r0.12, -11
;;
c0    mov $r0.13 = $r0.5
c0    ldw.d $r0.15 = 0x18[$r0.1]
c0    brf $b0.0, floatlib_L188?3
;;
c0    add $r0.8 = $r0.8, 1
c0    mov $r0.16 = $r0.11
;;
c0    or $r0.2 = $r0.2, 1073741824
;;
;;
-- floatlib_L189?3
c0    sub $r0.8 = $r0.0, $r0.8
;;
;;
;;
c0    sub $r0.12 = $r0.0, $r0.8
c0    cmpeq $b0.0 = $r0.8, $r0.0
;;
;;
;;
c0    and $r0.12 = $r0.12, 31
;;
;;
c0    brf $b0.0, floatlib_L190?3
;;
-- floatlib_L191?3
c0    stw 0x10[$r0.1] = $r0.2
c0    xor $r0.7 = $r0.7, 1
;;
c0    ldw $r0.2 = 0x10[$r0.1]
;;
c0    stw 0[$r0.9] = $r0.13
;;
c0    ldw $r0.5 = 0x14[$r0.1]
c0    mov $r0.3 = $r0.7
;;
c0    stw 0[$r0.10] = $r0.16
;;
-- floatlib_L192?3
c0    ldw $r0.9 = 0x1c[$r0.1]
;;
c0    sub $r0.2 = $r0.2, $r0.5
;;
;;
c0    sub $r0.11 = $r0.15, $r0.9
c0    cmpltu $r0.10 = $r0.15, $r0.9
;;
;;
;;
c0    stw 0x24[$r0.1] = $r0.11
c0    sub $r0.2 = $r0.2, $r0.10
;;
c0    ldw $r0.6 = 0x24[$r0.1]
;;
;;
c0    stw 0x20[$r0.1] = $r0.2
c0    goto floatlib_L184?3
;;
-- floatlib_L190?3
c0    shl $r0.3 = $r0.5, $r0.12
c0    or $r0.14 = $r0.11, $r0.5
c0    cmpge $b0.0 = $r0.8, 64
c0    and $r0.6 = $r0.8, 31
;;
c0    cmpeq $b0.1 = $r0.8, 32
c0    shru $r0.18 = $r0.11, $r0.8
c0    cmpne $r0.17 = $r0.11, $r0.0
c0    shl $r0.12 = $r0.11, $r0.12
;;
c0    cmpge $b0.2 = $r0.8, 32
c0    shru $r0.8 = $r0.5, $r0.8
;;
c0    or $r0.11 = $r0.11, $r0.3
c0    cmpne $r0.14 = $r0.14, $r0.0
c0    shru $r0.6 = $r0.5, $r0.6
;;
c0    cmpne $r0.12 = $r0.12, $r0.0
c0    or $r0.18 = $r0.18, $r0.3
c0    or $r0.17 = $r0.17, $r0.5
;;
c0    slctf $r0.13 = $b0.2, $r0.8, $r0.0
;;
c0    cmpne $r0.11 = $r0.11, $r0.0
;;
c0    or $r0.18 = $r0.18, $r0.12
;;
;;
c0    or $r0.11 = $r0.11, $r0.6
;;
;;
;;
c0    slct $r0.14 = $b0.0, $r0.14, $r0.11
;;
;;
;;
c0    slct $r0.17 = $b0.1, $r0.17, $r0.14
;;
;;
;;
c0    slct $r0.16 = $b0.2, $r0.17, $r0.18
;;
;;
c0    goto floatlib_L191?3
;;
-- floatlib_L188?3
c0    ldw $r0.3 = 0x14[$r0.1]
c0    mov $r0.16 = $r0.11
;;
;;
;;
c0    or $r0.3 = $r0.3, 1073741824
;;
;;
;;
c0    stw 0x14[$r0.1] = $r0.3
;;
c0    ldw $r0.5 = 0x14[$r0.1]
;;
;;
;;
c0    mov $r0.13 = $r0.5
c0    or $r0.2 = $r0.2, 1073741824
;;
c0    goto floatlib_L189?3
;;
-- floatlib_L185?3
c0    cmpeq $b0.0 = $r0.13, 2047
c0    cmpne $b0.1 = $r0.13, $r0.0
c0    cmpne $b0.2 = $r0.13, $r0.0
;;
c0    ldw.d $r0.8 = 0x10[$r0.1]
c0    mov $r0.3 = $r0.7
c0    mov $r0.9 = $r0.3
;;
c0    ldw.d $r0.10 = 0x14[$r0.1]
;;
c0    slct $r0.14 = $b0.1, $r0.14, 1
c0    slct $r0.13 = $b0.2, $r0.13, 1
c0    ldw.d $r0.2 = 0x14[$r0.1]
c0    br $b0.0, floatlib_L193?3
;;
c0    ldw.d $r0.16 = 0x1c[$r0.1]
;;
c0    cmpltu $b0.0 = $r0.8, $r0.10
;;
c0    mov $r0.12 = $r0.13
;;
c0    add $r0.4 = $r0.12, -11
;;
c0    brf $b0.0, floatlib_L194?3
;;
c0    ldw $r0.9 = 0x10[$r0.1]
;;
c0    goto floatlib_L183?3
;;
-- floatlib_L194?3
c0    cmpltu $b0.0 = $r0.10, $r0.8
c0    ldw.d $r0.2 = 0x10[$r0.1]
c0    mov $r0.12 = $r0.14
;;
c0    ldw.d $r0.15 = 0x18[$r0.1]
c0    add $r0.4 = $r0.12, -11
;;
;;
c0    brf $b0.0, floatlib_L195?3
;;
c0    xor $r0.3 = $r0.3, 1
;;
c0    ldw $r0.5 = 0x14[$r0.1]
;;
c0    goto floatlib_L192?3
;;
-- floatlib_L195?3
c0    ldw $r0.5 = 0x18[$r0.1]
c0    mov $r0.12 = $r0.13
;;
c0    ldw $r0.6 = 0x1c[$r0.1]
c0    add $r0.4 = $r0.12, -11
;;
c0    ldw.d $r0.2 = 0x14[$r0.1]
;;
c0    ldw.d $r0.16 = 0x1c[$r0.1]
;;
c0    cmpltu $b0.0 = $r0.5, $r0.6
;;
;;
;;
c0    brf $b0.0, floatlib_L196?3
;;
c0    ldw $r0.9 = 0x10[$r0.1]
;;
c0    goto floatlib_L183?3
;;
-- floatlib_L196?3
c0    cmpltu $b0.0 = $r0.6, $r0.5
c0    ldw.d $r0.2 = 0x10[$r0.1]
c0    mov $r0.12 = $r0.14
c0    xor $r0.3 = $r0.3, 1
;;
c0    ldw.d $r0.15 = 0x18[$r0.1]
c0    add $r0.4 = $r0.12, -11
;;
;;
c0    brf $b0.0, floatlib_L197?3
;;
c0    ldw $r0.5 = 0x14[$r0.1]
;;
c0    goto floatlib_L192?3
;;
-- floatlib_L197?3
c0    ldw $r0.2 = ((floatlib_?1PACKET.2+0)+0)[$r0.0]
c0    mov $r0.4 = $r0.0
c0    mov $r0.5 = $r0.0
;;
c0    mov $r0.6 = $r0.0
;;
;;
c0    cmpeq $r0.3 = $r0.2, 1
;;
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x28[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L193?3
c0    ldw $r0.7 = 0x18[$r0.1]
c0    mov $r0.3 = $r0.9
;;
c0    ldw $r0.8 = 0x14[$r0.1]
;;
c0    ldw $r0.2 = 0x10[$r0.1]
;;
c0    ldw $r0.9 = 0x1c[$r0.1]
;;
c0    or $r0.7 = $r0.7, $r0.8
;;
;;
c0    or $r0.2 = $r0.2, $r0.9
;;
;;
;;
c0    or $r0.7 = $r0.7, $r0.2
;;
;;
;;
c0    cmpne $b0.0 = $r0.7, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L198?3
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat64NaN
;;
c0    ldw $l0.0 = 0x28[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
-- floatlib_L198?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    mov $r0.3 = 16
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    mov $r0.4 = (~0x0)
c0    ldw $l0.0 = 0x28[$r0.1]
c0    mov $r0.3 = 2147483647
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x40), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC__d_add
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.7 = $r0.3, 31
c0    shru $r0.2 = $r0.5, 31
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
;;
c0    cmpeq $b0.0 = $r0.7, $r0.2
;;
;;
;;
c0    brf $b0.0, floatlib_L199?3
;;
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_addFloat64Sigs
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L199?3
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_subFloat64Sigs
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC__d_sub
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.7 = $r0.3, 31
c0    shru $r0.2 = $r0.5, 31
;;
c0    stw 0x10[$r0.1] = $l0.0
;;
;;
c0    cmpeq $b0.0 = $r0.7, $r0.2
;;
;;
;;
c0    brf $b0.0, floatlib_L200?3
;;
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_subFloat64Sigs
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L200?3
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_addFloat64Sigs
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC__d_mul
c0    add $r0.1 = $r0.1, (-0x60)
c0    shru $r0.2 = $r0.3, 20
c0    shru $r0.8 = $r0.5, 20
;;
c0    and $r0.9 = $r0.3, 1048575
c0    shru $r0.10 = $r0.3, 31
c0    stw 0x50[$r0.1] = $l0.0
;;
c0    stw 0x24[$r0.1] = $r0.4
c0    and $r0.12 = $r0.5, 1048575
c0    shru $r0.11 = $r0.5, 31
;;
c0    and $r0.2 = $r0.2, 2047
c0    and $r0.8 = $r0.8, 2047
;;
c0    ldw.d $r0.13 = 0x24[$r0.1]
;;
c0    stw 0x20[$r0.1] = $r0.9
c0    xor $r0.10 = $r0.10, $r0.11
;;
c0    cmpeq $b0.0 = $r0.2, 2047
c0    cmpeq $b0.1 = $r0.8, 2047
;;
c0    cmpeq $b0.2 = $r0.2, $r0.0
c0    ldw.d $r0.14 = 0x20[$r0.1]
;;
c0    stw 0x1c[$r0.1] = $r0.2
c0    mov $r0.11 = $r0.3
;;
c0    ldw.d $r0.15 = 0x1c[$r0.1]
c0    mov $r0.3 = $r0.10
;;
c0    stw 0x10[$r0.1] = $r0.8
c0    or $r0.14 = $r0.14, 1048576
;;
c0    ldw.d $r0.2 = 0x10[$r0.1]
;;
c0    ldw.d $r0.8 = 0x10[$r0.1]
;;
c0    stw 0x18[$r0.1] = $r0.6
;;
c0    cmpeq $b0.3 = $r0.2, $r0.0
c0    ldw.d $r0.16 = 0x18[$r0.1]
;;
c0    stw 0x14[$r0.1] = $r0.12
c0    add $r0.8 = $r0.8, -1024
c0    br $b0.0, floatlib_L201?3
;;
c0    ldw.d $r0.12 = 0x14[$r0.1]
c0    br $b0.1, floatlib_L202?3
;;
c0    shl $r0.2 = $r0.16, 12
c0    shru $r0.11 = $r0.16, 20
c0    br $b0.2, floatlib_L203?3
;;
-- floatlib_L204?3
c0    add $r0.8 = $r0.8, $r0.15
c0    br $b0.3, floatlib_L205?3
;;
-- floatlib_L206?3
c0    stw 0x20[$r0.1] = $r0.14
c0    shl $r0.12 = $r0.12, 12
;;
c0    stw 0x18[$r0.1] = $r0.2
c0    mpylhu $r0.9 = $r0.2, $r0.13
c0    mpylhu $r0.16 = $r0.13, $r0.2
;;
c0    mpyllu $r0.15 = $r0.13, $r0.2
c0    mpyhhu $r0.17 = $r0.13, $r0.2
;;
c0    or $r0.12 = $r0.12, $r0.11
c0    mpylhu $r0.18 = $r0.14, $r0.2
c0    mpylhu $r0.19 = $r0.2, $r0.14
;;
c0    mpyllu $r0.20 = $r0.2, $r0.14
c0    add $r0.16 = $r0.9, $r0.16
c0    mpyhhu $r0.21 = $r0.2, $r0.14
;;
;;
c0    stw 0x14[$r0.1] = $r0.12
c0    mpylhu $r0.11 = $r0.12, $r0.13
c0    mpylhu $r0.22 = $r0.13, $r0.12
c0    add $r0.18 = $r0.18, $r0.19
;;
c0    mpyllu $r0.24 = $r0.13, $r0.12
c0    shru $r0.23 = $r0.16, 16
c0    cmpltu $r0.9 = $r0.16, $r0.9
c0    shl $r0.2 = $r0.16, 16
;;
c0    mpyhhu $r0.25 = $r0.13, $r0.12
c0    mpylhu $r0.26 = $r0.14, $r0.12
;;
c0    mpyllu $r0.28 = $r0.12, $r0.14
c0    add $r0.22 = $r0.11, $r0.22
c0    mpylhu $r0.27 = $r0.12, $r0.14
c0    shl $r0.29 = $r0.18, 16
;;
c0    shl $r0.9 = $r0.9, 16
c0    add $r0.15 = $r0.15, $r0.2
c0    add $r0.23 = $r0.23, $r0.17
c0    cmpltu $r0.19 = $r0.18, $r0.19
;;
c0    mpyhhu $r0.30 = $r0.12, $r0.14
c0    shru $r0.16 = $r0.18, 16
;;
c0    shru $r0.32 = $r0.22, 16
c0    cmpltu $r0.11 = $r0.22, $r0.11
c0    shl $r0.31 = $r0.22, 16
c0    add $r0.26 = $r0.26, $r0.27
;;
c0    cmpltu $r0.2 = $r0.15, $r0.2
c0    cmpne $r0.17 = $r0.15, $r0.0
c0    shl $r0.19 = $r0.19, 16
c0    add $r0.20 = $r0.20, $r0.29
;;
c0    stw 0x4c[$r0.1] = $r0.15
c0    add $r0.16 = $r0.16, $r0.21
;;
c0    shl $r0.11 = $r0.11, 16
c0    add $r0.24 = $r0.24, $r0.31
c0    add $r0.32 = $r0.32, $r0.25
c0    shl $r0.12 = $r0.26, 16
;;
c0    add $r0.9 = $r0.9, $r0.2
c0    shru $r0.18 = $r0.26, 16
c0    cmpltu $r0.27 = $r0.26, $r0.27
c0    cmpltu $r0.29 = $r0.20, $r0.29
;;
c0    stw 0x48[$r0.1] = $r0.15
;;
c0    cmpltu $r0.31 = $r0.24, $r0.31
c0    add $r0.28 = $r0.28, $r0.12
c0    stw 0x34[$r0.1] = $r0.20
;;
c0    add $r0.23 = $r0.23, $r0.9
c0    shl $r0.27 = $r0.27, 16
c0    add $r0.18 = $r0.18, $r0.30
c0    add $r0.19 = $r0.19, $r0.29
;;
;;
c0    add $r0.11 = $r0.11, $r0.31
c0    cmpltu $r0.12 = $r0.28, $r0.12
;;
c0    add $r0.23 = $r0.23, $r0.24
c0    add $r0.16 = $r0.16, $r0.19
;;
;;
c0    add $r0.32 = $r0.32, $r0.11
c0    add $r0.27 = $r0.27, $r0.12
;;
c0    cmpltu $r0.24 = $r0.23, $r0.24
c0    add $r0.2 = $r0.20, $r0.23
;;
;;
c0    add $r0.18 = $r0.18, $r0.27
;;
c0    add $r0.32 = $r0.32, $r0.24
c0    stw 0x44[$r0.1] = $r0.2
c0    cmpltu $r0.20 = $r0.2, $r0.20
c0    or $r0.17 = $r0.2, $r0.17
;;
;;
;;
c0    add $r0.32 = $r0.28, $r0.32
c0    stw 0x40[$r0.1] = $r0.17
c0    add $r0.16 = $r0.16, $r0.20
c0    cmpne $r0.2 = $r0.17, $r0.0
;;
;;
;;
c0    cmpltu $r0.28 = $r0.32, $r0.28
c0    add $r0.9 = $r0.32, $r0.16
c0    stw 0x2c[$r0.1] = $r0.16
;;
;;
;;
c0    add $r0.18 = $r0.18, $r0.28
c0    cmpltu $r0.32 = $r0.9, $r0.32
c0    add $r0.13 = $r0.13, $r0.9
c0    stw 0x38[$r0.1] = $r0.9
;;
;;
;;
c0    add $r0.18 = $r0.18, $r0.32
c0    cmpltu $r0.9 = $r0.13, $r0.9
c0    shl $r0.12 = $r0.13, 31
c0    shru $r0.11 = $r0.13, 1
;;
c0    stw 0x3c[$r0.1] = $r0.13
;;
;;
c0    add $r0.14 = $r0.14, $r0.9
c0    stw 0x30[$r0.1] = $r0.18
c0    or $r0.12 = $r0.12, $r0.2
;;
;;
;;
c0    add $r0.14 = $r0.14, $r0.18
;;
;;
;;
c0    cmpgeu $b0.0 = $r0.14, 2097152
c0    shl $r0.9 = $r0.14, 31
c0    shru $r0.2 = $r0.14, 1
;;
c0    stw 0x28[$r0.1] = $r0.14
;;
;;
c0    or $r0.11 = $r0.11, $r0.9
c0    brf $b0.0, floatlib_L207?3
;;
c0    stw 0x28[$r0.1] = $r0.2
c0    add $r0.4 = $r0.8, 1
;;
c0    ldw $r0.5 = 0x28[$r0.1]
;;
c0    stw 0x3c[$r0.1] = $r0.11
;;
c0    ldw $r0.6 = 0x3c[$r0.1]
;;
c0    stw 0x40[$r0.1] = $r0.12
;;
-- floatlib_L208?3
c0    ldw $r0.7 = 0x40[$r0.1]
;;
;;
.call roundAndPackFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_roundAndPackFloat64
;;
c0    ldw $l0.0 = 0x50[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L207?3
c0    ldw $r0.5 = 0x28[$r0.1]
c0    mov $r0.3 = $r0.10
c0    mov $r0.4 = $r0.8
;;
c0    ldw $r0.6 = 0x3c[$r0.1]
;;
c0    goto floatlib_L208?3
;;
-- floatlib_L205?3
c0    ldw $r0.7 = 0x18[$r0.1]
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    mov $r0.3 = $r0.10
;;
c0    ldw $r0.2 = 0x14[$r0.1]
c0    mov $r0.4 = $r0.0
;;
;;
;;
c0    or $r0.7 = $r0.7, $r0.2
;;
;;
;;
c0    cmpeq $b0.0 = $r0.7, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L209?3
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x50[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L209?3
c0    add $r0.6 = $r0.1, 0x14
c0    add $r0.7 = $r0.1, 0x18
c0    add $r0.5 = $r0.1, 0x10
c0    stw 0x54[$r0.1] = $r0.10
;;
c0    ldw $r0.3 = 0x14[$r0.1]
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
;;
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
c0    call $l0.0 = floatlib_FUNC_normalizeFloat64Subnormal
;;
c0    ldw $r0.2 = 0x10[$r0.1]
;;
c0    ldw $r0.4 = 0x20[$r0.1]
;;
c0    ldw $r0.15 = 0x1c[$r0.1]
;;
c0    add $r0.8 = $r0.2, -1024
c0    ldw $r0.12 = 0x14[$r0.1]
;;
c0    or $r0.14 = $r0.4, 1048576
c0    ldw $r0.16 = 0x18[$r0.1]
;;
c0    ldw $r0.13 = 0x24[$r0.1]
;;
c0    ldw $r0.3 = 0x54[$r0.1]
;;
;;
;;
c0    mov $r0.10 = $r0.3
c0    shl $r0.2 = $r0.16, 12
c0    shru $r0.11 = $r0.16, 20
;;
c0    add $r0.8 = $r0.8, $r0.15
c0    goto floatlib_L206?3
;;
-- floatlib_L203?3
c0    or $r0.4 = $r0.4, $r0.9
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    mov $r0.3 = $r0.10
;;
;;
;;
c0    cmpeq $b0.0 = $r0.4, $r0.0
c0    mov $r0.4 = $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L210?3
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x50[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L210?3
c0    add $r0.6 = $r0.1, 0x20
c0    add $r0.7 = $r0.1, 0x24
c0    add $r0.5 = $r0.1, 0x1c
c0    stw 0x54[$r0.1] = $r0.10
;;
c0    ldw $r0.3 = 0x20[$r0.1]
;;
c0    ldw $r0.4 = 0x24[$r0.1]
;;
;;
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
c0    call $l0.0 = floatlib_FUNC_normalizeFloat64Subnormal
;;
c0    ldw $r0.2 = 0x10[$r0.1]
;;
c0    ldw.d $r0.4 = 0x10[$r0.1]
;;
c0    ldw.d $r0.5 = 0x20[$r0.1]
;;
c0    cmpeq $b0.3 = $r0.2, $r0.0
c0    ldw.d $r0.15 = 0x1c[$r0.1]
;;
c0    add $r0.8 = $r0.4, -1024
c0    ldw.d $r0.16 = 0x18[$r0.1]
;;
c0    or $r0.14 = $r0.5, 1048576
c0    ldw.d $r0.13 = 0x24[$r0.1]
;;
c0    ldw $r0.3 = 0x54[$r0.1]
;;
;;
;;
c0    mov $r0.10 = $r0.3
c0    ldw.d $r0.12 = 0x14[$r0.1]
;;
c0    shl $r0.2 = $r0.16, 12
c0    shru $r0.11 = $r0.16, 20
c0    goto floatlib_L204?3
;;
-- floatlib_L202?3
c0    ldw $r0.2 = 0x18[$r0.1]
c0    mov $r0.3 = $r0.11
;;
c0    ldw $r0.7 = 0x14[$r0.1]
;;
;;
;;
c0    or $r0.2 = $r0.2, $r0.7
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L211?3
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat64NaN
;;
c0    ldw $l0.0 = 0x50[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L211?3
c0    ldw $r0.2 = 0x24[$r0.1]
c0    mov $r0.3 = 16
;;
c0    ldw $r0.4 = 0x1c[$r0.1]
;;
c0    ldw $r0.5 = 0x20[$r0.1]
;;
;;
c0    or $r0.2 = $r0.2, $r0.4
;;
;;
;;
c0    or $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    cmpeq $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L213?3
;;
c0    goto floatlib_L212?3
;;
-- floatlib_L213?3
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    mov $r0.3 = $r0.10
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    mov $r0.4 = 2047
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x50[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L201?3
c0    ldw $r0.2 = 0x10[$r0.1]
c0    mov $r0.3 = $r0.11
;;
c0    ldw $r0.7 = 0x18[$r0.1]
;;
c0    ldw $r0.8 = 0x14[$r0.1]
;;
c0    ldw $r0.9 = 0x24[$r0.1]
c0    cmpeq $r0.2 = $r0.2, 2047
;;
c0    ldw $r0.11 = 0x20[$r0.1]
;;
c0    or $r0.7 = $r0.7, $r0.8
;;
;;
c0    or $r0.9 = $r0.9, $r0.11
;;
c0    andl $r0.2 = $r0.2, $r0.7
;;
;;
;;
c0    orl $b0.0 = $r0.9, $r0.2
;;
;;
;;
c0    brf $b0.0, floatlib_L214?3
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat64NaN
;;
c0    ldw $l0.0 = 0x50[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L214?3
c0    ldw $r0.2 = 0x18[$r0.1]
c0    mov $r0.3 = 16
;;
c0    ldw $r0.5 = 0x10[$r0.1]
;;
c0    ldw $r0.6 = 0x14[$r0.1]
;;
;;
c0    or $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    or $r0.2 = $r0.2, $r0.6
;;
;;
;;
c0    cmpeq $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L215?3
;;
-- floatlib_L212?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    mov $r0.4 = (~0x0)
c0    ldw $l0.0 = 0x50[$r0.1]
c0    mov $r0.3 = 2147483647
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
-- floatlib_L215?3
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    mov $r0.3 = $r0.10
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    mov $r0.4 = 2047
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x50[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x60), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-128, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC__d_div
c0    add $r0.1 = $r0.1, (-0x80)
c0    shru $r0.2 = $r0.3, 20
c0    shru $r0.12 = $r0.5, 20
;;
c0    and $r0.13 = $r0.3, 1048575
c0    shru $r0.14 = $r0.3, 31
c0    stw 0x74[$r0.1] = $l0.0
;;
c0    stw 0x10[$r0.1] = $r0.4
c0    and $r0.16 = $r0.5, 1048575
c0    shru $r0.15 = $r0.5, 31
;;
c0    and $r0.2 = $r0.2, 2047
c0    and $r0.12 = $r0.12, 2047
;;
c0    ldw.d $r0.17 = 0x10[$r0.1]
;;
c0    stw 0x14[$r0.1] = $r0.13
c0    xor $r0.18 = $r0.14, $r0.15
;;
c0    cmpeq $b0.0 = $r0.2, 2047
c0    cmpeq $b0.1 = $r0.12, 2047
;;
c0    cmpeq $b0.2 = $r0.12, $r0.0
c0    ldw.d $r0.19 = 0x14[$r0.1]
c0    shl $r0.21 = $r0.17, 11
c0    shru $r0.20 = $r0.17, 21
;;
c0    stw 0x78[$r0.1] = $r0.18
;;
c0    stw 0x18[$r0.1] = $r0.2
;;
c0    ldw.d $r0.14 = 0x18[$r0.1]
c0    or $r0.19 = $r0.19, 1048576
c0    shru $r0.15 = $r0.21, 1
;;
c0    ldw.d $r0.17 = 0x18[$r0.1]
;;
c0    stw 0x24[$r0.1] = $r0.12
;;
c0    cmpeq $b0.3 = $r0.14, $r0.0
c0    ldw.d $r0.12 = 0x24[$r0.1]
c0    shl $r0.19 = $r0.19, 11
;;
c0    stw 0x20[$r0.1] = $r0.6
c0    add $r0.17 = $r0.17, 1021
;;
c0    ldw.d $r0.18 = 0x20[$r0.1]
;;
c0    stw 0x1c[$r0.1] = $r0.16
c0    or $r0.19 = $r0.19, $r0.20
c0    br $b0.0, floatlib_L216?3
;;
c0    sub $r0.17 = $r0.17, $r0.12
c0    ldw.d $r0.14 = 0x1c[$r0.1]
c0    br $b0.1, floatlib_L217?3
;;
c0    shl $r0.23 = $r0.18, 11
c0    shru $r0.22 = $r0.18, 21
c0    br $b0.2, floatlib_L218?3
;;
-- floatlib_L219?3
c0    shru $r0.2 = $r0.19, 1
c0    shl $r0.13 = $r0.19, 31
c0    br $b0.3, floatlib_L220?3
;;
-- floatlib_L221?3
c0    stw 0x14[$r0.1] = $r0.19
c0    or $r0.14 = $r0.14, 1048576
;;
c0    stw 0x10[$r0.1] = $r0.21
c0    cmpleu $r0.12 = $r0.23, $r0.21
;;
c0    stw 0x20[$r0.1] = $r0.23
c0    or $r0.15 = $r0.15, $r0.13
;;
c0    shl $r0.14 = $r0.14, 11
;;
;;
;;
c0    or $r0.14 = $r0.14, $r0.22
;;
;;
;;
c0    stw 0x1c[$r0.1] = $r0.14
c0    cmpltu $r0.16 = $r0.14, $r0.19
c0    cmpeq $r0.13 = $r0.14, $r0.19
;;
c0    ldw.d $r0.5 = 0x1c[$r0.1]
;;
;;
c0    andl $r0.13 = $r0.13, $r0.12
;;
;;
;;
c0    orl $b0.0 = $r0.16, $r0.13
;;
;;
;;
c0    brf $b0.0, floatlib_L222?3
;;
c0    stw 0x14[$r0.1] = $r0.2
c0    add $r0.19 = $r0.17, 1
;;
c0    ldw $r0.3 = 0x14[$r0.1]
;;
c0    stw 0x10[$r0.1] = $r0.15
;;
-- floatlib_L223?3
c0    stw 0x7c[$r0.1] = $r0.19
;;
c0    ldw $r0.4 = 0x10[$r0.1]
;;
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_estimateDiv64To32
;;
c0    ldw $r0.2 = 0x20[$r0.1]
c0    add $r0.5 = $r0.1, 0x28
c0    add $r0.8 = $r0.3, (~0x0)
c0    mov $r0.10 = (~0x0)
;;
c0    ldw $r0.4 = 0x1c[$r0.1]
c0    add $r0.6 = $r0.1, 0x2c
c0    add $r0.7 = $r0.1, 0x30
c0    mov $r0.11 = $r0.0
;;
c0    mov $r0.9 = $r0.3
c0    ldw $r0.12 = 0x10[$r0.1]
c0    mov $r0.20 = $r0.3
;;
c0    mpylhu $r0.13 = $r0.3, $r0.2
c0    mpylhu $r0.14 = $r0.2, $r0.3
c0    ldw $r0.15 = 0x14[$r0.1]
;;
c0    mpyllu $r0.16 = $r0.2, $r0.3
c0    mpyhhu $r0.17 = $r0.2, $r0.3
c0    ldw $r0.18 = 0x78[$r0.1]
;;
c0    stw 0x34[$r0.1] = $r0.3
c0    mpylhu $r0.19 = $r0.4, $r0.3
c0    mpylhu $r0.21 = $r0.3, $r0.4
;;
c0    mpyllu $r0.22 = $r0.3, $r0.4
c0    add $r0.14 = $r0.13, $r0.14
c0    mpyhhu $r0.23 = $r0.3, $r0.4
;;
;;
c0    add $r0.19 = $r0.19, $r0.21
;;
c0    shru $r0.25 = $r0.14, 16
c0    cmpltu $r0.13 = $r0.14, $r0.13
c0    shl $r0.24 = $r0.14, 16
c0    mov $r0.3 = $r0.2
;;
;;
c0    shru $r0.26 = $r0.19, 16
c0    cmpltu $r0.21 = $r0.19, $r0.21
c0    shl $r0.2 = $r0.19, 16
;;
c0    shl $r0.13 = $r0.13, 16
c0    add $r0.16 = $r0.16, $r0.24
c0    add $r0.25 = $r0.25, $r0.17
;;
;;
c0    shl $r0.21 = $r0.21, 16
c0    add $r0.22 = $r0.22, $r0.2
c0    add $r0.26 = $r0.26, $r0.23
c0    ldw $r0.19 = 0x7c[$r0.1]
;;
c0    cmpltu $r0.24 = $r0.16, $r0.24
c0    stw 0x38[$r0.1] = $r0.16
c0    sub $r0.17 = $r0.0, $r0.16
c0    cmpgtu $r0.14 = $r0.16, $r0.0
;;
c0    stw 0x3c[$r0.1] = $r0.16
;;
c0    cmpltu $r0.2 = $r0.22, $r0.2
c0    stw 0x48[$r0.1] = $r0.22
;;
c0    add $r0.13 = $r0.13, $r0.24
c0    stw 0x30[$r0.1] = $r0.17
;;
c0    ldw $r0.17 = 0x74[$r0.1]
;;
c0    add $r0.21 = $r0.21, $r0.2
;;
c0    add $r0.25 = $r0.25, $r0.13
;;
;;
c0    add $r0.26 = $r0.26, $r0.21
;;
c0    add $r0.25 = $r0.25, $r0.22
;;
;;
;;
c0    stw 0x40[$r0.1] = $r0.25
c0    cmpltu $r0.22 = $r0.25, $r0.22
c0    sub $r0.2 = $r0.12, $r0.25
c0    cmpltu $r0.13 = $r0.12, $r0.25
;;
c0    stw 0x44[$r0.1] = $r0.25
;;
;;
c0    add $r0.26 = $r0.26, $r0.22
c0    cmpltu $r0.12 = $r0.2, $r0.14
c0    sub $r0.16 = $r0.2, $r0.14
c0    sub $r0.15 = $r0.15, $r0.13
;;
;;
;;
c0    stw 0x4c[$r0.1] = $r0.26
c0    add $r0.12 = $r0.26, $r0.12
;;
c0    stw 0x50[$r0.1] = $r0.26
;;
c0    stw 0x2c[$r0.1] = $r0.16
;;
c0    sub $r0.15 = $r0.15, $r0.12
;;
;;
;;
c0    stw 0x28[$r0.1] = $r0.15
;;
-- floatlib_L224?3
c0    ldw.d $r0.2 = 0x30[$r0.1]
;;
c0    ldw.d $r0.12 = 0x2c[$r0.1]
;;
c0    ldw $r0.13 = 0x28[$r0.1]
;;
c0    add $r0.14 = $r0.2, $r0.3
;;
c0    add $r0.15 = $r0.12, $r0.4
;;
c0    cmplt $b0.0 = $r0.13, $r0.0
;;
c0    cmpltu $r0.2 = $r0.14, $r0.2
;;
c0    cmpltu $r0.12 = $r0.15, $r0.12
;;
c0    brf $b0.0, floatlib_L225?3
;;
c0    add $r0.15 = $r0.15, $r0.2
c0    stw 0[$r0.7] = $r0.14
c0    add $r0.9 = $r0.9, -2
;;
c0    ldw.d $r0.14 = 0x30[$r0.1]
;;
;;
c0    cmpltu $r0.2 = $r0.15, $r0.2
c0    stw 0[$r0.6] = $r0.15
;;
c0    ldw.d $r0.16 = 0x2c[$r0.1]
c0    add $r0.15 = $r0.3, $r0.14
;;
;;
c0    add $r0.13 = $r0.13, $r0.2
;;
c0    add $r0.2 = $r0.4, $r0.16
c0    cmpltu $r0.14 = $r0.15, $r0.14
;;
;;
c0    add $r0.13 = $r0.13, $r0.12
;;
c0    cmpltu $r0.2 = $r0.2, $r0.16
c0    add $r0.12 = $r0.2, $r0.14
;;
;;
c0    stw 0[$r0.5] = $r0.13
;;
c0    ldw $r0.13 = 0x28[$r0.1]
c0    cmpltu $r0.14 = $r0.12, $r0.14
;;
;;
;;
c0    cmplt $b0.0 = $r0.13, $r0.0
c0    add $r0.13 = $r0.13, $r0.14
;;
;;
;;
c0    add $r0.13 = $r0.13, $r0.2
c0    brf $b0.0, floatlib_L226?3
;;
c0    stw 0[$r0.7] = $r0.15
c0    add $r0.11 = $r0.11, -2
;;
c0    ldw.d $r0.2 = 0x30[$r0.1]
;;
c0    stw 0[$r0.6] = $r0.12
;;
c0    ldw.d $r0.12 = 0x2c[$r0.1]
;;
c0    stw 0[$r0.5] = $r0.13
c0    add $r0.14 = $r0.3, $r0.2
;;
c0    ldw $r0.13 = 0x28[$r0.1]
;;
c0    add $r0.15 = $r0.4, $r0.12
;;
c0    cmpltu $r0.2 = $r0.14, $r0.2
;;
c0    cmplt $b0.0 = $r0.13, $r0.0
;;
c0    cmpltu $r0.12 = $r0.15, $r0.12
;;
c0    add $r0.15 = $r0.15, $r0.2
;;
c0    brf $b0.0, floatlib_L227?3
;;
c0    stw 0[$r0.7] = $r0.14
c0    add $r0.8 = $r0.8, (~0x1)
;;
c0    cmpltu $r0.2 = $r0.15, $r0.2
c0    ldw.d $r0.14 = 0x30[$r0.1]
;;
c0    stw 0[$r0.6] = $r0.15
;;
c0    ldw.d $r0.15 = 0x2c[$r0.1]
;;
c0    add $r0.13 = $r0.13, $r0.2
c0    add $r0.2 = $r0.3, $r0.14
;;
;;
c0    add $r0.16 = $r0.4, $r0.15
;;
c0    add $r0.13 = $r0.13, $r0.12
c0    cmpltu $r0.14 = $r0.2, $r0.14
;;
;;
c0    cmpltu $r0.15 = $r0.16, $r0.15
;;
c0    stw 0[$r0.5] = $r0.13
c0    add $r0.16 = $r0.16, $r0.14
;;
c0    ldw $r0.12 = 0x28[$r0.1]
;;
;;
c0    cmpltu $r0.14 = $r0.16, $r0.14
;;
c0    cmplt $b0.0 = $r0.12, $r0.0
;;
;;
c0    add $r0.12 = $r0.12, $r0.14
;;
c0    brf $b0.0, floatlib_L228?3
;;
c0    stw 0[$r0.7] = $r0.2
c0    add $r0.10 = $r0.10, (~0x1)
;;
c0    add $r0.12 = $r0.12, $r0.15
c0    stw 0[$r0.6] = $r0.16
;;
;;
;;
c0    stw 0[$r0.5] = $r0.12
c0    goto floatlib_L224?3
;;
-- floatlib_L228?3
c0    mov $r0.11 = $r0.10
c0    stw 0x78[$r0.1] = $r0.18
c0    goto floatlib_L229?3
;;
-- floatlib_L230?3
c0    ldw.d $r0.2 = 0x6c[$r0.1]
;;
c0    ldw.d $r0.12 = 0x30[$r0.1]
;;
c0    ldw $r0.13 = 0x2c[$r0.1]
;;
c0    add $r0.14 = $r0.2, $r0.3
;;
c0    add $r0.15 = $r0.12, $r0.4
;;
c0    cmplt $b0.0 = $r0.13, $r0.0
;;
c0    cmpltu $r0.2 = $r0.14, $r0.2
;;
c0    cmpltu $r0.12 = $r0.15, $r0.12
;;
c0    brf $b0.0, floatlib_L231?3
;;
c0    add $r0.15 = $r0.15, $r0.2
c0    stw 0[$r0.7] = $r0.14
c0    add $r0.9 = $r0.9, -2
;;
c0    ldw.d $r0.14 = 0x6c[$r0.1]
;;
;;
c0    cmpltu $r0.2 = $r0.15, $r0.2
c0    stw 0[$r0.6] = $r0.15
;;
c0    ldw.d $r0.16 = 0x30[$r0.1]
c0    add $r0.15 = $r0.3, $r0.14
;;
;;
c0    add $r0.13 = $r0.13, $r0.2
;;
c0    add $r0.2 = $r0.4, $r0.16
c0    cmpltu $r0.14 = $r0.15, $r0.14
;;
;;
c0    add $r0.13 = $r0.13, $r0.12
;;
c0    cmpltu $r0.2 = $r0.2, $r0.16
c0    add $r0.12 = $r0.2, $r0.14
;;
;;
c0    stw 0[$r0.5] = $r0.13
;;
c0    ldw $r0.13 = 0x2c[$r0.1]
c0    cmpltu $r0.14 = $r0.12, $r0.14
;;
;;
;;
c0    cmplt $b0.0 = $r0.13, $r0.0
c0    add $r0.13 = $r0.13, $r0.14
;;
;;
;;
c0    add $r0.13 = $r0.13, $r0.2
c0    brf $b0.0, floatlib_L232?3
;;
c0    stw 0[$r0.7] = $r0.15
c0    add $r0.11 = $r0.11, -2
;;
c0    ldw.d $r0.2 = 0x6c[$r0.1]
;;
c0    stw 0[$r0.6] = $r0.12
;;
c0    ldw.d $r0.12 = 0x30[$r0.1]
;;
c0    stw 0[$r0.5] = $r0.13
c0    add $r0.14 = $r0.3, $r0.2
;;
c0    ldw $r0.13 = 0x2c[$r0.1]
;;
c0    add $r0.15 = $r0.4, $r0.12
;;
c0    cmpltu $r0.2 = $r0.14, $r0.2
;;
c0    cmplt $b0.0 = $r0.13, $r0.0
;;
c0    cmpltu $r0.12 = $r0.15, $r0.12
;;
c0    add $r0.15 = $r0.15, $r0.2
;;
c0    brf $b0.0, floatlib_L233?3
;;
c0    stw 0[$r0.7] = $r0.14
c0    add $r0.8 = $r0.8, (~0x1)
;;
c0    cmpltu $r0.2 = $r0.15, $r0.2
c0    ldw.d $r0.14 = 0x6c[$r0.1]
;;
c0    stw 0[$r0.6] = $r0.15
;;
c0    ldw.d $r0.15 = 0x30[$r0.1]
;;
c0    add $r0.13 = $r0.13, $r0.2
c0    add $r0.2 = $r0.3, $r0.14
;;
;;
c0    add $r0.16 = $r0.4, $r0.15
;;
c0    add $r0.13 = $r0.13, $r0.12
c0    cmpltu $r0.14 = $r0.2, $r0.14
;;
;;
c0    cmpltu $r0.15 = $r0.16, $r0.15
;;
c0    stw 0[$r0.5] = $r0.13
c0    add $r0.16 = $r0.16, $r0.14
;;
c0    ldw $r0.12 = 0x2c[$r0.1]
;;
;;
c0    cmpltu $r0.14 = $r0.16, $r0.14
;;
c0    cmplt $b0.0 = $r0.12, $r0.0
;;
;;
c0    add $r0.12 = $r0.12, $r0.14
;;
c0    brf $b0.0, floatlib_L234?3
;;
c0    stw 0[$r0.7] = $r0.2
c0    add $r0.10 = $r0.10, (~0x1)
;;
c0    add $r0.12 = $r0.12, $r0.15
c0    stw 0[$r0.6] = $r0.16
;;
;;
;;
c0    stw 0[$r0.5] = $r0.12
c0    goto floatlib_L230?3
;;
-- floatlib_L234?3
c0    mov $r0.11 = $r0.10
c0    stw 0x7c[$r0.1] = $r0.19
c0    mov $r0.3 = $r0.18
;;
c0    goto floatlib_L235?3
;;
-- floatlib_L237?3
c0    goto floatlib_L236?3
;;
-- floatlib_L233?3
c0    mov $r0.11 = $r0.10
c0    mov $r0.9 = $r0.8
c0    stw 0x7c[$r0.1] = $r0.19
c0    mov $r0.3 = $r0.18
;;
c0    goto floatlib_L235?3
;;
-- floatlib_L232?3
c0    mov $r0.9 = $r0.8
c0    stw 0x7c[$r0.1] = $r0.19
c0    mov $r0.3 = $r0.18
;;
c0    goto floatlib_L235?3
;;
-- floatlib_L231?3
c0    mov $r0.3 = $r0.18
c0    stw 0x7c[$r0.1] = $r0.19
;;
-- floatlib_L235?3
c0    add $r0.9 = $r0.9, $r0.11
c0    stw 0x74[$r0.1] = $r0.17
;;
c0    ldw.d $r0.2 = 0x6c[$r0.1]
;;
c0    ldw.d $r0.4 = 0x2c[$r0.1]
;;
c0    cmpne $b0.0 = $r0.9, $r0.20
c0    ldw.d $r0.5 = 0x30[$r0.1]
;;
;;
c0    or $r0.2 = $r0.2, $r0.4
;;
c0    brf $b0.0, floatlib_L237?3
;;
c0    stw 0x54[$r0.1] = $r0.9
;;
-- floatlib_L236?3
c0    ldw $r0.4 = 0x54[$r0.1]
c0    or $r0.2 = $r0.2, $r0.5
;;
;;
;;
c0    cmpne $r0.2 = $r0.2, $r0.0
;;
;;
;;
c0    or $r0.4 = $r0.4, $r0.2
;;
;;
;;
c0    stw 0x54[$r0.1] = $r0.4
;;
c0    ldw $r0.2 = 0x34[$r0.1]
c0    goto floatlib_L238?3
;;
-- floatlib_L239?3
c0    ldw $r0.2 = 0x34[$r0.1]
c0    mov $r0.3 = $r0.18
;;
-- floatlib_L238?3
c0    ldw $r0.8 = 0x54[$r0.1]
;;
c0    ldw $r0.4 = 0x7c[$r0.1]
;;
c0    shl $r0.9 = $r0.2, 21
c0    shru $r0.5 = $r0.2, 11
;;
c0    shl $r0.7 = $r0.8, 21
c0    shru $r0.10 = $r0.8, 11
;;
;;
c0    stw 0x34[$r0.1] = $r0.5
;;
c0    stw 0x70[$r0.1] = $r0.7
c0    or $r0.6 = $r0.9, $r0.10
;;
;;
;;
.call roundAndPackFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
c0    stw 0x54[$r0.1] = $r0.6
c0    call $l0.0 = floatlib_FUNC_roundAndPackFloat64
;;
c0    ldw $l0.0 = 0x74[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x80), $l0.0
;;
-- floatlib_L241?3
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
c0    call $l0.0 = floatlib_FUNC_estimateDiv64To32
;;
c0    goto floatlib_L240?3
;;
-- floatlib_L227?3
c0    mov $r0.11 = $r0.10
c0    mov $r0.9 = $r0.8
c0    stw 0x78[$r0.1] = $r0.18
c0    goto floatlib_L229?3
;;
-- floatlib_L226?3
c0    mov $r0.9 = $r0.8
c0    stw 0x78[$r0.1] = $r0.18
;;
c0    goto floatlib_L229?3
;;
-- floatlib_L225?3
c0    stw 0x78[$r0.1] = $r0.18
;;
-- floatlib_L229?3
c0    add $r0.9 = $r0.9, $r0.11
c0    stw 0x7c[$r0.1] = $r0.19
;;
c0    stw 0x74[$r0.1] = $r0.17
;;
c0    ldw.d $r0.3 = 0x2c[$r0.1]
;;
c0    cmpne $b0.0 = $r0.9, $r0.20
c0    ldw.d $r0.4 = 0x30[$r0.1]
;;
c0    ldw.d $r0.5 = 0x1c[$r0.1]
;;
;;
c0    brf $b0.0, floatlib_L241?3
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
c0    stw 0x34[$r0.1] = $r0.9
c0    call $l0.0 = floatlib_FUNC_estimateDiv64To32
;;
-- floatlib_L240?3
c0    and $r0.12 = $r0.3, 1023
c0    ldw.d $r0.2 = 0x20[$r0.1]
c0    mov $r0.10 = (~0x0)
;;
c0    ldw.d $r0.4 = 0x1c[$r0.1]
c0    add $r0.5 = $r0.1, 0x2c
c0    add $r0.6 = $r0.1, 0x30
c0    add $r0.8 = $r0.3, (~0x0)
;;
c0    mov $r0.9 = $r0.3
c0    ldw.d $r0.13 = 0x30[$r0.1]
c0    add $r0.7 = $r0.1, 0x6c
c0    mov $r0.11 = $r0.0
;;
c0    cmpleu $b0.0 = $r0.12, 4
c0    mpylhu $r0.14 = $r0.3, $r0.2
c0    mpylhu $r0.15 = $r0.2, $r0.3
c0    ldw.d $r0.16 = 0x2c[$r0.1]
;;
c0    mpyllu $r0.19 = $r0.2, $r0.3
c0    mpyhhu $r0.20 = $r0.2, $r0.3
c0    ldw $r0.18 = 0x78[$r0.1]
;;
c0    mpylhu $r0.21 = $r0.4, $r0.3
c0    mpylhu $r0.22 = $r0.3, $r0.4
c0    ldw $r0.17 = 0x74[$r0.1]
;;
c0    stw 0x54[$r0.1] = $r0.3
c0    mpyllu $r0.12 = $r0.4, $r0.3
c0    add $r0.15 = $r0.14, $r0.15
c0    mpyhhu $r0.23 = $r0.3, $r0.4
;;
c0    brf $b0.0, floatlib_L239?3
;;
c0    add $r0.21 = $r0.21, $r0.22
;;
c0    shru $r0.25 = $r0.15, 16
c0    cmpltu $r0.14 = $r0.15, $r0.14
c0    shl $r0.24 = $r0.15, 16
;;
;;
c0    shru $r0.27 = $r0.21, 16
c0    cmpltu $r0.22 = $r0.21, $r0.22
c0    shl $r0.26 = $r0.21, 16
;;
c0    shl $r0.14 = $r0.14, 16
c0    add $r0.19 = $r0.19, $r0.24
c0    add $r0.25 = $r0.25, $r0.20
;;
;;
c0    shl $r0.22 = $r0.22, 16
c0    add $r0.12 = $r0.12, $r0.26
c0    add $r0.27 = $r0.27, $r0.23
;;
c0    cmpltu $r0.24 = $r0.19, $r0.24
c0    stw 0x58[$r0.1] = $r0.19
c0    sub $r0.20 = $r0.0, $r0.19
c0    cmpgtu $r0.15 = $r0.19, $r0.0
;;
c0    stw 0x5c[$r0.1] = $r0.19
;;
c0    cmpltu $r0.26 = $r0.12, $r0.26
c0    stw 0x64[$r0.1] = $r0.12
;;
c0    add $r0.14 = $r0.14, $r0.24
c0    stw 0x6c[$r0.1] = $r0.20
;;
c0    ldw $r0.19 = 0x7c[$r0.1]
c0    mov $r0.20 = $r0.3
;;
c0    add $r0.22 = $r0.22, $r0.26
c0    mov $r0.3 = $r0.2
;;
c0    add $r0.25 = $r0.25, $r0.14
;;
;;
c0    add $r0.27 = $r0.27, $r0.22
;;
c0    add $r0.25 = $r0.25, $r0.12
;;
;;
;;
c0    stw 0x60[$r0.1] = $r0.25
c0    cmpltu $r0.12 = $r0.25, $r0.12
c0    sub $r0.2 = $r0.13, $r0.25
c0    cmpltu $r0.14 = $r0.13, $r0.25
;;
c0    stw 0x3c[$r0.1] = $r0.25
;;
;;
c0    add $r0.27 = $r0.27, $r0.12
c0    cmpltu $r0.13 = $r0.2, $r0.15
c0    sub $r0.21 = $r0.2, $r0.15
c0    sub $r0.16 = $r0.16, $r0.14
;;
;;
;;
c0    stw 0x44[$r0.1] = $r0.27
c0    add $r0.13 = $r0.27, $r0.13
;;
c0    stw 0x68[$r0.1] = $r0.27
;;
c0    stw 0x30[$r0.1] = $r0.21
;;
c0    sub $r0.16 = $r0.16, $r0.13
;;
;;
;;
c0    stw 0x2c[$r0.1] = $r0.16
c0    goto floatlib_L230?3
;;
-- floatlib_L222?3
c0    mov $r0.19 = $r0.17
c0    ldw $r0.3 = 0x14[$r0.1]
;;
c0    goto floatlib_L223?3
;;
-- floatlib_L220?3
c0    ldw $r0.7 = 0x10[$r0.1]
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    mov $r0.4 = $r0.0
;;
c0    ldw $r0.8 = 0x14[$r0.1]
;;
c0    ldw $r0.3 = 0x78[$r0.1]
;;
;;
c0    or $r0.7 = $r0.7, $r0.8
;;
;;
;;
c0    cmpeq $b0.0 = $r0.7, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L242?3
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x74[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x80), $l0.0
;;
-- floatlib_L242?3
c0    ldw $r0.3 = 0x14[$r0.1]
c0    add $r0.6 = $r0.1, 0x14
c0    add $r0.7 = $r0.1, 0x10
c0    add $r0.5 = $r0.1, 0x18
;;
c0    ldw $r0.4 = 0x10[$r0.1]
;;
;;
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
c0    call $l0.0 = floatlib_FUNC_normalizeFloat64Subnormal
;;
c0    ldw $r0.2 = 0x14[$r0.1]
;;
c0    ldw $r0.3 = 0x10[$r0.1]
;;
c0    ldw $r0.4 = 0x18[$r0.1]
;;
c0    ldw $r0.12 = 0x24[$r0.1]
c0    or $r0.2 = $r0.2, 1048576
;;
c0    shl $r0.21 = $r0.3, 11
c0    shru $r0.20 = $r0.3, 21
c0    ldw $r0.14 = 0x1c[$r0.1]
;;
c0    add $r0.4 = $r0.4, 1021
c0    ldw $r0.18 = 0x20[$r0.1]
;;
c0    shl $r0.2 = $r0.2, 11
;;
c0    shru $r0.15 = $r0.21, 1
;;
c0    sub $r0.17 = $r0.4, $r0.12
;;
c0    or $r0.19 = $r0.2, $r0.20
;;
;;
c0    shl $r0.23 = $r0.18, 11
c0    shru $r0.22 = $r0.18, 21
;;
c0    shru $r0.2 = $r0.19, 1
c0    shl $r0.13 = $r0.19, 31
c0    goto floatlib_L221?3
;;
-- floatlib_L218?3
c0    or $r0.6 = $r0.6, $r0.16
c0    or $r0.4 = $r0.4, $r0.2
c0    mov $r0.3 = 16
;;
;;
;;
c0    cmpeq $b0.0 = $r0.6, $r0.0
c0    or $r0.4 = $r0.4, $r0.13
;;
;;
;;
c0    cmpeq $b0.0 = $r0.4, $r0.0
c0    brf $b0.0, floatlib_L243?3
;;
;;
;;
c0    brf $b0.0, floatlib_L244?3
;;
-- floatlib_L245?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    mov $r0.4 = (~0x0)
c0    ldw $l0.0 = 0x74[$r0.1]
c0    mov $r0.3 = 2147483647
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x80), $l0.0
;;
-- floatlib_L244?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    mov $r0.3 = 128
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    ldw $r0.3 = 0x78[$r0.1]
;;
c0    mov $r0.4 = 2047
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x74[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x80), $l0.0
;;
-- floatlib_L243?3
c0    ldw $r0.3 = 0x1c[$r0.1]
c0    add $r0.6 = $r0.1, 0x1c
c0    add $r0.7 = $r0.1, 0x20
c0    add $r0.5 = $r0.1, 0x24
;;
c0    ldw $r0.4 = 0x20[$r0.1]
;;
;;
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
c0    call $l0.0 = floatlib_FUNC_normalizeFloat64Subnormal
;;
c0    ldw.d $r0.2 = 0x14[$r0.1]
;;
c0    ldw.d $r0.3 = 0x10[$r0.1]
;;
c0    ldw $r0.14 = 0x18[$r0.1]
;;
c0    ldw.d $r0.4 = 0x18[$r0.1]
c0    or $r0.2 = $r0.2, 1048576
;;
c0    ldw.d $r0.12 = 0x24[$r0.1]
c0    shl $r0.21 = $r0.3, 11
c0    shru $r0.20 = $r0.3, 21
;;
c0    cmpeq $b0.3 = $r0.14, $r0.0
c0    ldw.d $r0.18 = 0x20[$r0.1]
;;
c0    add $r0.17 = $r0.4, 1021
c0    shl $r0.2 = $r0.2, 11
;;
c0    shru $r0.15 = $r0.21, 1
;;
;;
c0    or $r0.19 = $r0.2, $r0.20
;;
c0    sub $r0.17 = $r0.17, $r0.12
c0    ldw.d $r0.14 = 0x1c[$r0.1]
;;
c0    shl $r0.23 = $r0.18, 11
c0    shru $r0.22 = $r0.18, 21
c0    goto floatlib_L219?3
;;
-- floatlib_L217?3
c0    ldw $r0.2 = 0x20[$r0.1]
;;
c0    ldw $r0.7 = 0x1c[$r0.1]
;;
;;
;;
c0    or $r0.2 = $r0.2, $r0.7
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L246?3
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat64NaN
;;
c0    ldw $l0.0 = 0x74[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x80), $l0.0
;;
-- floatlib_L246?3
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    mov $r0.4 = $r0.0
c0    ldw $r0.3 = 0x78[$r0.1]
;;
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x74[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x80), $l0.0
;;
-- floatlib_L216?3
c0    ldw $r0.2 = 0x10[$r0.1]
;;
c0    ldw $r0.7 = 0x14[$r0.1]
;;
;;
;;
c0    or $r0.2 = $r0.2, $r0.7
;;
;;
;;
c0    cmpne $b0.0 = $r0.2, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L247?3
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat64NaN
;;
c0    ldw $l0.0 = 0x74[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x80), $l0.0
;;
-- floatlib_L247?3
c0    ldw $r0.2 = 0x24[$r0.1]
;;
c0    ldw.d $r0.7 = 0x20[$r0.1]
;;
c0    ldw.d $r0.8 = 0x1c[$r0.1]
;;
c0    cmpeq $b0.0 = $r0.2, 2047
;;
;;
c0    or $r0.7 = $r0.7, $r0.8
;;
c0    brf $b0.0, floatlib_L248?3
;;
;;
c0    cmpne $b0.0 = $r0.7, $r0.0
;;
;;
;;
c0    brf $b0.0, floatlib_L249?3
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_propagateFloat64NaN
;;
c0    ldw $l0.0 = 0x74[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x80), $l0.0
;;
-- floatlib_L249?3
c0    mov $r0.3 = 16
c0    goto floatlib_L245?3
;;
-- floatlib_L248?3
c0    mov $r0.5 = $r0.0
c0    mov $r0.6 = $r0.0
c0    ldw $r0.3 = 0x78[$r0.1]
;;
c0    mov $r0.4 = 2047
;;
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = floatlib_FUNC_packFloat64
;;
c0    ldw $l0.0 = 0x74[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x80), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC__d_eq
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.2 = $r0.3, 20
c0    shru $r0.7 = $r0.5, 20
;;
c0    and $r0.8 = $r0.3, 1048575
c0    or $r0.9 = $r0.3, $r0.5
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    and $r0.10 = $r0.5, 1048575
c0    cmpeq $r0.12 = $r0.4, $r0.6
c0    cmpeq $r0.11 = $r0.3, $r0.5
;;
c0    and $r0.2 = $r0.2, 2047
c0    and $r0.7 = $r0.7, 2047
;;
c0    or $r0.8 = $r0.4, $r0.8
c0    shl $r0.9 = $r0.9, 1
;;
c0    or $r0.10 = $r0.6, $r0.10
;;
c0    cmpeq $r0.2 = $r0.2, 2047
c0    cmpeq $r0.7 = $r0.7, 2047
;;
c0    norl $r0.9 = $r0.4, $r0.9
;;
;;
c0    andl $r0.2 = $r0.2, $r0.8
c0    andl $r0.7 = $r0.7, $r0.10
;;
c0    orl $r0.11 = $r0.11, $r0.9
;;
;;
c0    orl $b0.0 = $r0.2, $r0.7
;;
c0    andl $r0.12 = $r0.12, $r0.11
;;
;;
c0    br $b0.0, floatlib_L250?3
;;
.return ret($r0.3:s32)
c0    mov $r0.3 = $r0.12
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L250?3
c0    shru $r0.2 = $r0.3, 19
c0    and $r0.7 = $r0.3, 524287
c0    shru $r0.8 = $r0.5, 19
;;
c0    and $r0.9 = $r0.5, 524287
;;
;;
c0    and $r0.2 = $r0.2, 4095
c0    orl $r0.7 = $r0.7, $r0.4
c0    mov $r0.3 = 16
;;
c0    and $r0.8 = $r0.8, 4095
c0    orl $r0.9 = $r0.9, $r0.6
;;
;;
c0    cmpeq $r0.2 = $r0.2, 4094
;;
c0    cmpeq $r0.8 = $r0.8, 4094
;;
;;
c0    andl $r0.2 = $r0.2, $r0.7
;;
c0    andl $r0.8 = $r0.8, $r0.9
;;
;;
;;
c0    orl $b0.0 = $r0.2, $r0.8
;;
;;
;;
c0    brf $b0.0, floatlib_L251?3
;;
.call float_raise, caller, arg($r0.3:s32), ret()
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
-- floatlib_L251?3
c0    mov $r0.3 = $r0.0
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC__d_le
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.2 = $r0.3, 20
c0    shru $r0.7 = $r0.5, 20
;;
c0    and $r0.8 = $r0.3, 1048575
c0    shru $r0.9 = $r0.3, 31
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    and $r0.10 = $r0.5, 1048575
c0    shru $r0.11 = $r0.5, 31
c0    or $r0.12 = $r0.3, $r0.5
;;
c0    and $r0.2 = $r0.2, 2047
c0    and $r0.7 = $r0.7, 2047
;;
c0    or $r0.8 = $r0.4, $r0.8
;;
c0    or $r0.10 = $r0.6, $r0.10
c0    cmpne $b0.0 = $r0.9, $r0.11
c0    shl $r0.12 = $r0.12, 1
;;
c0    cmpeq $r0.2 = $r0.2, 2047
c0    cmpeq $r0.7 = $r0.7, 2047
;;
;;
c0    or $r0.12 = $r0.4, $r0.12
;;
c0    andl $r0.2 = $r0.2, $r0.8
c0    andl $r0.7 = $r0.7, $r0.10
;;
;;
c0    or $r0.12 = $r0.12, $r0.6
;;
c0    orl $b0.1 = $r0.2, $r0.7
;;
;;
c0    cmpeq $r0.12 = $r0.12, $r0.0
;;
c0    br $b0.1, floatlib_L252?3
;;
c0    brf $b0.0, floatlib_L253?3
;;
c0    orl $r0.3 = $r0.9, $r0.12
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L253?3
c0    cmpltu $r0.8 = $r0.5, $r0.3
c0    cmpeq $r0.2 = $r0.5, $r0.3
c0    cmpeq $r0.10 = $r0.3, $r0.5
c0    cmpleu $r0.7 = $r0.6, $r0.4
;;
c0    cmpltu $r0.3 = $r0.3, $r0.5
c0    cmpleu $r0.4 = $r0.4, $r0.6
c0    mtb $b0.0 = $r0.9
;;
;;
c0    andl $r0.2 = $r0.2, $r0.7
;;
c0    andl $r0.10 = $r0.10, $r0.4
;;
;;
c0    orl $r0.8 = $r0.8, $r0.2
;;
c0    orl $r0.3 = $r0.3, $r0.10
;;
;;
;;
c0    slct $r0.3 = $b0.0, $r0.8, $r0.3
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L252?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    mov $r0.3 = 16
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    mov $r0.3 = $r0.0
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC__d_lt
c0    add $r0.1 = $r0.1, (-0x20)
c0    shru $r0.2 = $r0.3, 20
c0    shru $r0.7 = $r0.5, 20
;;
c0    and $r0.8 = $r0.3, 1048575
c0    shru $r0.9 = $r0.3, 31
c0    stw 0x10[$r0.1] = $l0.0
;;
c0    and $r0.10 = $r0.5, 1048575
c0    shru $r0.11 = $r0.5, 31
c0    or $r0.12 = $r0.3, $r0.5
;;
c0    and $r0.2 = $r0.2, 2047
c0    and $r0.7 = $r0.7, 2047
;;
c0    or $r0.8 = $r0.4, $r0.8
;;
c0    or $r0.10 = $r0.6, $r0.10
c0    cmpne $b0.0 = $r0.9, $r0.11
c0    shl $r0.12 = $r0.12, 1
;;
c0    cmpeq $r0.2 = $r0.2, 2047
c0    cmpeq $r0.7 = $r0.7, 2047
;;
;;
c0    or $r0.12 = $r0.4, $r0.12
;;
c0    andl $r0.2 = $r0.2, $r0.8
c0    andl $r0.7 = $r0.7, $r0.10
;;
;;
c0    or $r0.12 = $r0.12, $r0.6
;;
c0    orl $b0.1 = $r0.2, $r0.7
;;
;;
c0    andl $r0.12 = $r0.9, $r0.12
;;
c0    br $b0.1, floatlib_L254?3
;;
c0    brf $b0.0, floatlib_L255?3
;;
.return ret($r0.3:s32)
c0    mov $r0.3 = $r0.12
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L255?3
c0    cmpltu $r0.8 = $r0.5, $r0.3
c0    cmpeq $r0.2 = $r0.5, $r0.3
c0    cmpeq $r0.10 = $r0.3, $r0.5
c0    cmpltu $r0.7 = $r0.6, $r0.4
;;
c0    cmpltu $r0.3 = $r0.3, $r0.5
c0    cmpltu $r0.4 = $r0.4, $r0.6
c0    mtb $b0.0 = $r0.9
;;
;;
c0    andl $r0.2 = $r0.2, $r0.7
;;
c0    andl $r0.10 = $r0.10, $r0.4
;;
;;
c0    orl $r0.8 = $r0.8, $r0.2
;;
c0    orl $r0.3 = $r0.3, $r0.10
;;
;;
;;
c0    slct $r0.3 = $b0.0, $r0.8, $r0.3
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
-- floatlib_L254?3
.call float_raise, caller, arg($r0.3:s32), ret()
c0    mov $r0.3 = 16
c0    call $l0.0 = floatlib_FUNC_float_raise
;;
c0    mov $r0.3 = $r0.0
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32)
-- FUNC__r_neg
c0    xor $r0.3 = $r0.3, (~0x7fffffff)
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
-- FUNC__r_recip
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.4 = $r0.3
;;
.call _r_div, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
c0    stw 0x10[$r0.1] = $l0.0
c0    mov $r0.3 = 0x3f800000
c0    call $l0.0 = FUNC__r_div
;;
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC__r_ne
c0    add $r0.1 = $r0.1, (-0x20)
;;
.call _r_eq, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    stw 0x10[$r0.1] = $l0.0
c0    call $l0.0 = FUNC__r_eq
;;
c0    cmpeq $r0.3 = $r0.3, $r0.0
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC__r_gt
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.3 = $r0.4
c0    mov $r0.2 = $r0.3
;;
.call _r_lt, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    stw 0x10[$r0.1] = $l0.0
c0    mov $r0.4 = $r0.2
c0    call $l0.0 = FUNC__r_lt
;;
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC__r_ge
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.3 = $r0.4
c0    mov $r0.2 = $r0.3
;;
.call _r_le, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
c0    stw 0x10[$r0.1] = $l0.0
c0    mov $r0.4 = $r0.2
c0    call $l0.0 = FUNC__r_le
;;
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32)
-- FUNC__d_neg
c0    xor $r0.3 = $r0.3, (~0x7fffffff)
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC__d_recip
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.6 = $r0.4
c0    mov $r0.5 = $r0.3
;;
c0    mov $r0.4 = $r0.0
c0    stw 0x10[$r0.1] = $l0.0
c0    mov $r0.3 = 1072693248
;;
.call _d_div, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
c0    call $l0.0 = FUNC__d_div
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC__d_ne
c0    add $r0.1 = $r0.1, (-0x20)
;;
.call _d_eq, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
c0    stw 0x10[$r0.1] = $l0.0
c0    call $l0.0 = FUNC__d_eq
;;
c0    cmpeq $r0.3 = $r0.3, $r0.0
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC__d_gt
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.4 = $r0.6
c0    mov $r0.2 = $r0.4
;;
c0    mov $r0.3 = $r0.5
c0    stw 0x10[$r0.1] = $l0.0
c0    mov $r0.7 = $r0.3
c0    mov $r0.6 = $r0.2
;;
.call _d_lt, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
c0    mov $r0.5 = $r0.7
c0    call $l0.0 = FUNC__d_lt
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC__d_ge
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.4 = $r0.6
c0    mov $r0.2 = $r0.4
;;
c0    mov $r0.3 = $r0.5
c0    stw 0x10[$r0.1] = $l0.0
c0    mov $r0.7 = $r0.3
c0    mov $r0.6 = $r0.2
;;
.call _d_le, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
c0    mov $r0.5 = $r0.7
c0    call $l0.0 = FUNC__d_le
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
-- FUNC__r_fix
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.4 = 1
;;
.call float32_to_int32_round_to_zero, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:s32)
c0    stw 0x10[$r0.1] = $l0.0
c0    call $l0.0 = floatlib_FUNC_float32_to_int32_round_to_zero
;;
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
-- FUNC__r_ufix
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.4 = $r0.0
;;
.call float32_to_int32_round_to_zero, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:s32)
c0    stw 0x10[$r0.1] = $l0.0
c0    call $l0.0 = floatlib_FUNC_float32_to_int32_round_to_zero
;;
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC__d_fix
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.5 = 1
;;
.call float64_to_int32_round_to_zero, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:s32)
c0    stw 0x10[$r0.1] = $l0.0
c0    call $l0.0 = floatlib_FUNC_float64_to_int32_round_to_zero
;;
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
-- FUNC__d_ufix
c0    add $r0.1 = $r0.1, (-0x20)
c0    mov $r0.5 = $r0.0
;;
.call float64_to_int32_round_to_zero, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:s32)
c0    stw 0x10[$r0.1] = $l0.0
c0    call $l0.0 = floatlib_FUNC_float64_to_int32_round_to_zero
;;
;;
;;
c0    ldw $l0.0 = 0x10[$r0.1]
;;
;;
;;
.return ret($r0.3:u32)
c0    return $r0.1 = $r0.1, (0x20), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg()
-- FUNC_fpgetround
c0    ldw $r0.3 = ((floatlib_?1PACKET.2+0)+0)[$r0.0]
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32)
-- FUNC_fpsetround
c0    stw ((floatlib_?1PACKET.2+0)+0)[$r0.0] = $r0.3
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg()
-- FUNC_fpgetmask
c0    ldw $r0.3 = ((floatlib_?1PACKET.4+0)+0)[$r0.0]
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32)
-- FUNC_fpsetmask
c0    stw ((floatlib_?1PACKET.4+0)+0)[$r0.0] = $r0.3
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg()
-- FUNC_fpgetsticky
c0    ldw $r0.3 = ((floatlib_?1PACKET.3+0)+0)[$r0.0]
;;
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32)
-- FUNC_fpsetsticky
c0    stw ((floatlib_?1PACKET.3+0)+0)[$r0.0] = $r0.3
;;
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
ENDOFFILE: floatlib
FILE: pthread
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
-- FUNC_vthread_create
c0    asm,1 $r0.2, $r0.7 = $r0.4, $r0.5, $r0.6
;;
;;
;;
c0    stw 0[$r0.3] = $r0.7
;;
.return ret($r0.3:s32)
c0    mov $r0.3 = $r0.2
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32)
-- FUNC_vthread_join
c0    asm,2 $r0.2, $r0.5 = $r0.3
;;
c0    cmpne $b0.0 = $r0.4, $r0.0
;;
;;
c0    mov $r0.3 = $r0.2
;;
c0    brf $b0.0, pthread_L0?3
;;
.return ret($r0.3:s32)
c0    stw 0[$r0.4] = $r0.5
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
-- pthread_L0?3
.return ret($r0.3:s32)
c0    return $r0.1 = $r0.1, (0x0), $l0.0
;;
ENDOFFILE: pthread


##Import
FUNC_clock
FUNC_printf
default_num_contexts
seed1_volatile
seed2_volatile
seed3_volatile
seed4_volatile
seed5_volatile


##ImportObjects


##Instruction Labels
0000 - FUNC_main
01ac - core_main_L6?3
01b0 - core_main_L8?3
02f0 - core_main_L11?3
0300 - core_main_L13?3
03a8 - core_main_L17?3
03b0 - core_main_L18?3
08fc - core_main_L22?3
090c - core_main_L24?3
0998 - core_main_L27?3
09f0 - core_main_L31?3
0a10 - core_main_L32?3
0a14 - core_main_L30?3
0a18 - core_main_L34?3
0a20 - core_main_L35?3
0a9c - core_main_L38?3
0acc - core_main_L39?3
0b14 - core_main_L40?3
0b34 - core_main_L37?3
0b6c - core_main_L36?3
0b8c - core_main_L42?3
0bdc - core_main_L43?3
0d40 - core_main_L41?3
0d68 - core_main_L44?3
0db0 - core_main_L45?3
0db8 - core_main_L46?3
0de0 - core_main_L47?3
0e4c - core_main_L49?3
0e58 - core_main_L51?3
0ec0 - core_main_L53?3
0ee4 - core_main_L55?3
0f58 - core_main_L57?3
0f8c - core_main_L58?3
0f8c - core_main_L56?3
0fa8 - core_main_L60?3
0fdc - core_main_L61?3
0fdc - core_main_L59?3
0ffc - core_main_L63?3
102c - core_main_L64?3
10b8 - core_main_L65?3
10c8 - core_main_L66?3
10d8 - core_main_L67?3
1108 - core_main_L62?3
1110 - core_main_L68?3
1144 - core_main_L69?3
114c - core_main_L54?3
116c - core_main_L52?3
11b8 - core_main_L50?3
11d8 - core_main_L70?3
1280 - core_main_L73?3
128c - core_main_L75?3
1290 - core_main_L77?3
129c - core_main_L76?3
1324 - core_main_L74?3
13d8 - core_main_L72?3
14b0 - core_main_L71?3
14cc - core_main_L48?3
14ec - core_main_L78?3
150c - core_main_L79?3
152c - core_main_L80?3
154c - core_main_L81?3
1558 - core_main_L29?3
1580 - core_main_L82?3
1588 - core_main_L28?3
1594 - core_main_L26?3
15bc - core_main_L25?3
15c4 - core_main_L33?3
1628 - core_main_L21?3
1638 - core_main_L20?3
1648 - core_main_L19?3
1654 - core_main_L23?3
165c - core_main_L16?3
1668 - core_main_L15?3
1674 - core_main_L14?3
1680 - core_main_L10?3
1690 - core_main_L9?3
169c - core_main_L12?3
16a0 - core_main_L7?3
16b8 - core_main_L5?3
16ec - core_main_L4?3
16f4 - FUNC_iterate
1728 - core_main_L0?3
1770 - core_main_L3?3
1774 - core_main_L2?3
177c - core_main_L1?3
1794 - FUNC_calc_func
17c8 - core_list_join_L0?3
1848 - core_list_join_L3?3
187c - core_list_join_L2?3
188c - core_list_join_L1?3
18d4 - core_list_join_L5?3
18e4 - core_list_join_L4?3
1904 - FUNC_cmp_complex
193c - FUNC_cmp_idx
1978 - core_list_join_L7?3
1984 - core_list_join_L6?3
1990 - FUNC_copy_info
19a4 - FUNC_core_bench_list
19fc - core_list_join_L8?3
1a6c - core_list_join_L12?3
1a74 - core_list_join_L13?3
1a78 - core_list_join_L11?3
1a80 - core_list_join_L10?3
1ae4 - core_list_join_L14?3
1aec - core_list_join_L15?3
1af0 - core_list_join_L9?3
1b24 - core_list_join_L16?3
1b4c - core_list_join_L17?3
1b70 - core_list_join_L18?3
1b94 - core_list_join_L19?3
1bb8 - core_list_join_L20?3
1be0 - FUNC_core_list_init
1de8 - core_list_join_L21?3
1e44 - core_list_join_L22?3
1f84 - core_list_join_L23?3
1fb4 - core_list_join_L26?3
1fd4 - core_list_join_L29?3
1ff0 - core_list_join_L32?3
1ff8 - core_list_join_L31?3
2020 - core_list_join_L30?3
2034 - core_list_join_L28?3
2064 - core_list_join_L27?3
2078 - core_list_join_L25?3
20b0 - core_list_join_L24?3
20c0 - core_list_join_L33?3
20e4 - FUNC_core_list_insert_new
2108 - core_list_join_L34?3
2120 - core_list_join_L35?3
2164 - FUNC_core_list_remove
2190 - FUNC_core_list_undo_remove
21b0 - FUNC_core_list_find
21c8 - core_list_join_L37?3
222c - core_list_join_L41?3
2230 - core_list_join_L40?3
2238 - core_list_join_L39?3
2240 - core_list_join_L38?3
2248 - core_list_join_L36?3
224c - core_list_join_L42?3
22c0 - core_list_join_L46?3
22c8 - core_list_join_L45?3
22d0 - core_list_join_L44?3
22d8 - core_list_join_L43?3
22e0 - FUNC_core_list_reverse
22e8 - core_list_join_L47?3
2330 - core_list_join_L51?3
2338 - core_list_join_L50?3
233c - core_list_join_L49?3
2344 - core_list_join_L48?3
234c - FUNC_core_list_mergesort
2374 - core_list_join_L52?3
2384 - core_list_join_L53?3
23ac - core_list_join_L55?3
2410 - core_list_join_L63?3
2430 - core_list_join_L65?3
2460 - core_list_join_L69?3
2464 - core_list_join_L70?3
246c - core_list_join_L68?3
2474 - core_list_join_L67?3
2490 - core_list_join_L72?3
2494 - core_list_join_L71?3
250c - core_list_join_L73?3
2510 - core_list_join_L66?3
2528 - core_list_join_L62?3
2544 - core_list_join_L61?3
2560 - core_list_join_L60?3
2580 - core_list_join_L59?3
25a0 - core_list_join_L58?3
25bc - core_list_join_L57?3
25d8 - core_list_join_L56?3
25f0 - core_list_join_L64?3
25f8 - core_list_join_L54?3
2610 - core_list_join_L74?3
262c - FUNC_core_bench_matrix
2668 - FUNC_matrix_test
2788 - FUNC_core_init_matrix
27bc - core_matrix_L0?3
2834 - core_matrix_L4?3
2850 - core_matrix_L6?3
2884 - core_matrix_L8?3
2968 - core_matrix_L11?3
2980 - core_matrix_L10?3
2998 - core_matrix_L9?3
29a4 - core_matrix_L12?3
29b4 - core_matrix_L7?3
29ec - core_matrix_L3?3
2a08 - core_matrix_L2?3
2a24 - core_matrix_L1?3
2a38 - core_matrix_L5?3
2a68 - FUNC_matrix_sum
2a8c - core_matrix_L13?3
2ab0 - core_matrix_L15?3
2b98 - core_matrix_L19?3
2bb0 - core_matrix_L18?3
2bc8 - core_matrix_L17?3
2be0 - core_matrix_L16?3
2be8 - core_matrix_L20?3
2bf4 - core_matrix_L14?3
2bfc - FUNC_matrix_mul_const
2c20 - core_matrix_L21?3
2c4c - core_matrix_L23?3
2cb8 - core_matrix_L27?3
2cc8 - core_matrix_L26?3
2cd8 - core_matrix_L25?3
2ce8 - core_matrix_L24?3
2cf4 - core_matrix_L28?3
2d04 - core_matrix_L22?3
2d08 - FUNC_matrix_add_const
2d20 - core_matrix_L29?3
2d44 - core_matrix_L31?3
2dac - core_matrix_L35?3
2db8 - core_matrix_L34?3
2dc4 - core_matrix_L33?3
2dd0 - core_matrix_L32?3
2dd8 - core_matrix_L36?3
2de4 - core_matrix_L30?3
2de8 - FUNC_matrix_mul_vect
2e00 - core_matrix_L37?3
2e30 - core_matrix_L39?3
2ed4 - core_matrix_L43?3
2ee4 - core_matrix_L42?3
2ef4 - core_matrix_L41?3
2f04 - core_matrix_L40?3
2f10 - core_matrix_L44?3
2f18 - core_matrix_L38?3
2f1c - FUNC_matrix_mul_matrix
2f38 - core_matrix_L45?3
2f50 - core_matrix_L47?3
2fa0 - core_matrix_L49?3
3054 - core_matrix_L53?3
306c - core_matrix_L52?3
3084 - core_matrix_L51?3
309c - core_matrix_L50?3
30b0 - core_matrix_L54?3
30b8 - core_matrix_L48?3
30d0 - core_matrix_L46?3
30d4 - FUNC_matrix_mul_matrix_bitextract
30f0 - core_matrix_L55?3
3108 - core_matrix_L57?3
3150 - core_matrix_L59?3
3230 - core_matrix_L62?3
3248 - core_matrix_L61?3
3260 - core_matrix_L60?3
3274 - core_matrix_L63?3
327c - core_matrix_L58?3
3298 - core_matrix_L56?3
329c - FUNC_portable_malloc
32a4 - FUNC_portable_free
32a8 - FUNC_start_time
32c0 - FUNC_stop_time
32d8 - FUNC_get_time
32e8 - FUNC_time_in_secs
3308 - FUNC_portable_init
3314 - FUNC_portable_fini
331c - FUNC_core_start_parallel
3348 - FUNC_core_stop_parallel
3368 - FUNC_core_bench_state
33ac - core_state_L0?3
33e4 - core_state_L1?3
341c - core_state_L2?3
3450 - core_state_L3?3
346c - core_state_L4?3
348c - core_state_L6?3
34b4 - core_state_L8?3
34dc - core_state_L10?3
3504 - core_state_L12?3
3514 - core_state_L11?3
3524 - core_state_L14?3
3558 - core_state_L15?3
3574 - core_state_L16?3
3594 - core_state_L18?3
35bc - core_state_L20?3
35e4 - core_state_L22?3
360c - core_state_L24?3
361c - core_state_L23?3
362c - core_state_L26?3
3660 - core_state_L27?3
367c - core_state_L21?3
368c - core_state_L19?3
369c - core_state_L17?3
36a8 - core_state_L25?3
36b0 - core_state_L9?3
36c0 - core_state_L7?3
36d0 - core_state_L5?3
36dc - core_state_L13?3
36e4 - FUNC_core_init_state
370c - core_state_L28?3
3740 - core_state_L31?3
379c - core_state_L35?3
37ac - core_state_L30?3
37e8 - FUNC_core_state__?1.core_init_state.TAG.0.0
37e8 - core_state_L37?3
37f0 - FUNC_core_state__?1.core_init_state.TAG.0.7
3808 - FUNC_core_state__?1.core_init_state.TAG.0.6
3814 - FUNC_core_state__?1.core_init_state.TAG.0.5
381c - core_state_L38?3
382c - FUNC_core_state__?1.core_init_state.TAG.0.4
3838 - FUNC_core_state__?1.core_init_state.TAG.0.3
3840 - core_state_L39?3
3850 - FUNC_core_state__?1.core_init_state.TAG.0.2
3860 - FUNC_core_state__?1.core_init_state.TAG.0.1
3870 - core_state_L34?3
3880 - core_state_L33?3
3890 - core_state_L32?3
389c - core_state_L36?3
38b0 - core_state_L29?3
38c8 - core_state_L40?3
3910 - core_state_L41?3
391c - FUNC_core_state_9217.ee_isdigit
393c - FUNC_core_state_transition
3964 - core_state_L42?3
39a0 - core_state_L47?3
39ac - core_state_L46?3
39d4 - core_state_L48?3
39f0 - core_state_L49?3
3a0c - core_state_L45?3
3a3c - core_state_L51?3
3a60 - core_state_L52?3
3a78 - core_state_L50?3
3aa8 - core_state_L54?3
3ac0 - core_state_L53?3
3ae8 - core_state_L56?3
3b0c - core_state_L57?3
3b14 - core_state_L55?3
3b44 - core_state_L59?3
3b68 - core_state_L60?3
3b70 - core_state_L58?3
3b9c - core_state_L62?3
3bb4 - core_state_L61?3
3be0 - core_state_L64?3
3be8 - core_state_L63?3
3bf0 - core_state_L44?3
3c00 - core_state_L43?3
3c08 - core_state_L65?3
3c20 - FUNC_get_seed_32
3c30 - core_util_L0?3
3c40 - core_util_L1?3
3c50 - core_util_L2?3
3c60 - core_util_L3?3
3c70 - core_util_L4?3
3c78 - FUNC_crcu8
3c88 - core_util_L5?3
3d3c - core_util_L7?3
3d40 - core_util_L6?3
3d48 - FUNC_crcu16
3d84 - FUNC_crcu32
3dbc - FUNC_crc16
3dd8 - FUNC_check_data_types
3de4 - floatlib_FUNC_estimateDiv64To32
3dfc - floatlib_L0?3
3fbc - floatlib_L1?3
4070 - floatlib_L5?3
4090 - floatlib_L4?3
40b4 - floatlib_L3?3
40d4 - floatlib_L2?3
40ec - floatlib_L6?3
4234 - floatlib_FUNC_countLeadingZeros32
426c - floatlib_FUNC_float_raise
427c - floatlib_FUNC_float32ToCommonNaN
42b0 - floatlib_L8?3
42b4 - floatlib_L7?3
42d8 - floatlib_FUNC_propagateFloat32NaN
433c - floatlib_L10?3
4340 - floatlib_L9?3
4390 - floatlib_FUNC_float64ToCommonNaN
43d8 - floatlib_L12?3
43e8 - floatlib_L11?3
4424 - floatlib_FUNC_commonNaNToFloat64
4450 - floatlib_FUNC_propagateFloat64NaN
44c0 - floatlib_L14?3
44c8 - floatlib_L15?3
44e4 - floatlib_L16?3
4500 - floatlib_L17?3
450c - floatlib_L13?3
4558 - floatlib_FUNC_roundAndPackFloat32
45d4 - floatlib_L19?3
45e0 - floatlib_L21?3
4600 - floatlib_L23?3
4610 - floatlib_L22?3
4618 - floatlib_L20?3
4628 - floatlib_L18?3
4670 - floatlib_L24?3
4730 - floatlib_L26?3
475c - floatlib_L25?3
476c - floatlib_FUNC_normalizeRoundAndPackFloat32
47b0 - floatlib_FUNC_normalizeFloat64Subnormal
4828 - floatlib_L27?3
488c - floatlib_FUNC_packFloat64
48a4 - floatlib_FUNC_roundAndPackFloat64
48e0 - floatlib_L28?3
4924 - floatlib_L31?3
4934 - floatlib_L34?3
4954 - floatlib_L35?3
4964 - floatlib_L33?3
496c - floatlib_L36?3
498c - floatlib_L37?3
4994 - floatlib_L32?3
49a8 - floatlib_L38?3
49b4 - floatlib_L30?3
4a34 - floatlib_L40?3
4a50 - floatlib_L39?3
4acc - floatlib_L43?3
4aec - floatlib_L44?3
4b58 - floatlib_L42?3
4b84 - floatlib_L45?3
4bd0 - floatlib_L41?3
4be4 - floatlib_L29?3
4c08 - floatlib_FUNC_normalizeRoundAndPackFloat64
4c40 - floatlib_L47?3
4c98 - floatlib_L49?3
4cac - floatlib_L48?3
4d54 - floatlib_L46?3
4d60 - FUNC__r_ilfloat
4d8c - floatlib_L50?3
4dac - FUNC__r_ufloat
4dc8 - floatlib_L51?3
4de0 - FUNC__d_ilfloat
4e10 - floatlib_L52?3
4e5c - floatlib_L54?3
4e6c - floatlib_L53?3
4ecc - FUNC__d_ufloat
4efc - floatlib_L55?3
4f34 - floatlib_L57?3
4f44 - floatlib_L56?3
4fa8 - floatlib_FUNC_float32_to_int32_round_to_zero
4ff8 - floatlib_L60?3
5000 - floatlib_L59?3
5038 - floatlib_L62?3
503c - floatlib_L61?3
5048 - floatlib_L58?3
505c - floatlib_L63?3
50ac - floatlib_L64?3
50bc - FUNC__d_r
50f8 - floatlib_L67?3
510c - floatlib_L66?3
5130 - floatlib_L68?3
5164 - floatlib_L65?3
5180 - floatlib_L69?3
519c - floatlib_FUNC_addFloat32Sigs
5210 - floatlib_L73?3
523c - floatlib_L74?3
5258 - floatlib_L75?3
5260 - floatlib_L72?3
5280 - floatlib_L71?3
529c - floatlib_L76?3
52a8 - floatlib_L70?3
52d8 - floatlib_L80?3
5318 - floatlib_L79?3
5330 - floatlib_L78?3
5350 - floatlib_L81?3
5360 - floatlib_L77?3
5390 - floatlib_L83?3
53ac - floatlib_L82?3
53d0 - floatlib_L84?3
53dc - floatlib_FUNC_subFloat32Sigs
545c - floatlib_L88?3
5488 - floatlib_L89?3
5494 - floatlib_L90?3
549c - floatlib_L87?3
54c0 - floatlib_L86?3
54e0 - floatlib_L91?3
54ec - floatlib_L85?3
552c - floatlib_L95?3
555c - floatlib_L96?3
556c - floatlib_L94?3
5594 - floatlib_L93?3
55b4 - floatlib_L97?3
55c8 - floatlib_L92?3
5600 - floatlib_L99?3
5620 - floatlib_L100?3
5634 - floatlib_L98?3
565c - floatlib_L101?3
5670 - FUNC__r_add
5694 - floatlib_L102?3
56a0 - FUNC__r_sub
56c4 - floatlib_L103?3
56d0 - FUNC__r_mul
574c - floatlib_L107?3
5754 - floatlib_L109?3
57a4 - floatlib_L108?3
57b8 - floatlib_L110?3
5820 - floatlib_L106?3
5834 - floatlib_L111?3
58a0 - floatlib_L105?3
58b8 - floatlib_L112?3
58d8 - floatlib_L113?3
58e8 - floatlib_L104?3
5908 - floatlib_L114?3
5928 - floatlib_L115?3
5938 - FUNC__r_div
59bc - floatlib_L119?3
59c0 - floatlib_L121?3
5a6c - floatlib_L123?3
5b10 - floatlib_L127?3
5b1c - floatlib_L126?3
5b2c - floatlib_L125?3
5b38 - floatlib_L124?3
5b3c - floatlib_L128?3
5b60 - floatlib_L122?3
5b6c - floatlib_L129?3
5b78 - floatlib_L120?3
5b90 - floatlib_L130?3
5bf4 - floatlib_L118?3
5c1c - floatlib_L132?3
5c38 - floatlib_L131?3
5ca0 - floatlib_L117?3
5cb8 - floatlib_L133?3
5cc8 - floatlib_L116?3
5ce0 - floatlib_L134?3
5d00 - floatlib_L136?3
5d14 - floatlib_L135?3
5d28 - FUNC__r_eq
5d80 - floatlib_L137?3
5db8 - floatlib_L138?3
5dc4 - FUNC__r_le
5e28 - floatlib_L140?3
5e3c - floatlib_L139?3
5e50 - FUNC__r_lt
5eb0 - floatlib_L142?3
5ec4 - floatlib_L141?3
5ed8 - floatlib_FUNC_float64_to_int32_round_to_zero
5f38 - floatlib_L145?3
5f68 - floatlib_L147?3
5f6c - floatlib_L146?3
5fa0 - floatlib_L148?3
5fb0 - floatlib_L144?3
5ff4 - floatlib_L143?3
601c - floatlib_L149?3
604c - FUNC__r_d
60b0 - floatlib_L151?3
60c0 - floatlib_L150?3
6100 - floatlib_L153?3
6110 - floatlib_L152?3
6118 - floatlib_FUNC_addFloat64Sigs
6174 - floatlib_L156?3
617c - floatlib_L155?3
61c4 - floatlib_L158?3
61d4 - floatlib_L160?3
61ec - floatlib_L161?3
6238 - floatlib_L163?3
624c - floatlib_L164?3
625c - floatlib_L162?3
6270 - floatlib_L159?3
629c - floatlib_L165?3
62e4 - floatlib_L157?3
6308 - floatlib_L154?3
6338 - floatlib_L168?3
6354 - floatlib_L167?3
6390 - floatlib_L170?3
63a4 - floatlib_L172?3
63c8 - floatlib_L171?3
6430 - floatlib_L169?3
6450 - floatlib_L166?3
6488 - floatlib_L174?3
6490 - floatlib_L173?3
64d4 - floatlib_L175?3
6518 - floatlib_FUNC_subFloat64Sigs
6594 - floatlib_L178?3
659c - floatlib_L177?3
65d8 - floatlib_L180?3
65e8 - floatlib_L182?3
65fc - floatlib_L183?3
661c - floatlib_L184?3
662c - floatlib_L181?3
6690 - floatlib_L179?3
66b4 - floatlib_L176?3
66e4 - floatlib_L187?3
6700 - floatlib_L186?3
6738 - floatlib_L189?3
674c - floatlib_L191?3
6768 - floatlib_L192?3
678c - floatlib_L190?3
67ec - floatlib_L188?3
680c - floatlib_L185?3
6854 - floatlib_L194?3
6878 - floatlib_L195?3
68a0 - floatlib_L196?3
68c4 - floatlib_L197?3
68e4 - floatlib_L193?3
6918 - floatlib_L198?3
6930 - FUNC__d_add
6954 - floatlib_L199?3
6960 - FUNC__d_sub
6984 - floatlib_L200?3
6990 - FUNC__d_mul
6a24 - floatlib_L204?3
6a2c - floatlib_L206?3
6bcc - floatlib_L208?3
6bdc - floatlib_L207?3
6bf0 - floatlib_L205?3
6c20 - floatlib_L209?3
6c74 - floatlib_L203?3
6c9c - floatlib_L210?3
6cf4 - floatlib_L202?3
6d18 - floatlib_L211?3
6d3c - floatlib_L213?3
6d58 - floatlib_L201?3
6d94 - floatlib_L214?3
6db4 - floatlib_L212?3
6dc8 - floatlib_L215?3
6de4 - FUNC__d_div
6e8c - floatlib_L219?3
6e98 - floatlib_L221?3
6ee4 - floatlib_L223?3
6ffc - floatlib_L224?3
7110 - floatlib_L228?3
711c - floatlib_L230?3
7230 - floatlib_L234?3
7240 - floatlib_L237?3
7244 - floatlib_L233?3
7258 - floatlib_L232?3
7268 - floatlib_L231?3
7270 - floatlib_L235?3
7294 - floatlib_L236?3
72b0 - floatlib_L239?3
72b8 - floatlib_L238?3
72ec - floatlib_L241?3
72f4 - floatlib_L227?3
7304 - floatlib_L226?3
7310 - floatlib_L225?3
7314 - floatlib_L229?3
733c - floatlib_L240?3
7458 - floatlib_L222?3
7464 - floatlib_L220?3
7494 - floatlib_L242?3
74f8 - floatlib_L218?3
7518 - floatlib_L245?3
752c - floatlib_L244?3
7550 - floatlib_L243?3
75b4 - floatlib_L217?3
75d4 - floatlib_L246?3
75f0 - floatlib_L216?3
7610 - floatlib_L247?3
763c - floatlib_L249?3
7644 - floatlib_L248?3
7660 - FUNC__d_eq
76c4 - floatlib_L250?3
7704 - floatlib_L251?3
7710 - FUNC__d_le
777c - floatlib_L253?3
77b0 - floatlib_L252?3
77c4 - FUNC__d_lt
7830 - floatlib_L255?3
7864 - floatlib_L254?3
7878 - FUNC__r_neg
7880 - FUNC__r_recip
789c - FUNC__r_ne
78b4 - FUNC__r_gt
78d4 - FUNC__r_ge
78f4 - FUNC__d_neg
78fc - FUNC__d_recip
7920 - FUNC__d_ne
7938 - FUNC__d_gt
7964 - FUNC__d_ge
7990 - FUNC__r_fix
79a8 - FUNC__r_ufix
79c0 - FUNC__d_fix
79d8 - FUNC__d_ufix
79f0 - FUNC_fpgetround
79f8 - FUNC_fpsetround
7a00 - FUNC_fpgetmask
7a08 - FUNC_fpsetmask
7a10 - FUNC_fpgetsticky
7a18 - FUNC_fpsetsticky
7a20 - FUNC_vthread_create
7a30 - FUNC_vthread_join
7a48 - pthread_L0?3


##Data Labels
0000 - core_main_?1STRINGPACKET.5
0030 - core_main_?1STRINGPACKET.8
0060 - core_main_?1STRINGPACKET.10
0090 - core_main_?1STRINGPACKET.12
00c0 - core_main_?1STRINGPACKET.13
00d8 - core_main_?1STRINGPACKET.14
00f0 - core_main_?1STRINGPACKET.15
0108 - core_main_?1STRINGPACKET.16
0120 - core_main_?1STRINGPACKET.17
0160 - core_main_?1STRINGPACKET.18
0178 - core_main_?1STRINGPACKET.19
0190 - core_main_?1STRINGPACKET.20
01c0 - core_main_?1STRINGPACKET.21
01d8 - core_main_?1STRINGPACKET.22
01e0 - core_main_?1STRINGPACKET.25
01f8 - core_main_?1STRINGPACKET.26
0248 - core_main_?1STRINGPACKET.34
0278 - core_main_?1STRINGPACKET.35
0280 - core_main_?1STRINGPACKET.36
0288 - core_main_?1STRINGPACKET.31
02a4 - core_main_?1STRINGPACKET.6
02d0 - core_main_?1STRINGPACKET.7
0304 - core_main_?1STRINGPACKET.9
0330 - core_main_?1STRINGPACKET.11
0364 - core_main_?1STRINGPACKET.23
0378 - core_main_?1STRINGPACKET.24
0384 - core_main_?1STRINGPACKET.27
03a0 - core_main_?1STRINGPACKET.32
03ec - core_main_?1STRINGPACKET.33
0408 - core_main_?1STRINGPACKET.37
0414 - core_main_?1STRINGPACKET.38
0420 - core_main_?1STRINGPACKET.39
0424 - core_main_?1STRINGPACKET.40
0438 - core_main_?1STRINGPACKET.41
049c - core_main_?1STRINGPACKET.30
04b8 - core_main_?1STRINGPACKET.29
04d4 - core_main_?1STRINGPACKET.28
04f0 - core_main_?1STRINGPACKET.core_main_9217..1
04f8 - core_main_?1STRINGPACKET.core_main_9217..2
0500 - core_main_?1STRINGPACKET.core_main_9217..3
0508 - core_main_9217.list_known_crc
0514 - core_main_9217.matrix_known_crc
0520 - core_main_9217.state_known_crc
052c - mem_name
0538 - seed5_volatile
053c - seed4_volatile
0540 - seed3_volatile
0544 - seed2_volatile
0548 - seed1_volatile
054c - default_num_contexts
0550 - core_state_?1.core_init_state.TAGPACKET.0
0570 - core_state_9217.errpat
0580 - core_state_9217.intpat
0590 - core_state_?1STRINGPACKET.core_state_9217..1
0598 - core_state_?1STRINGPACKET.core_state_9217..2
05a0 - core_state_?1STRINGPACKET.core_state_9217..3
05a8 - core_state_?1STRINGPACKET.core_state_9217..4
05b0 - core_state_9217.floatpat
05c0 - core_state_9217.scipat
05d0 - core_state_?1STRINGPACKET.core_state_9217..13
05dc - core_state_?1STRINGPACKET.core_state_9217..14
05e8 - core_state_?1STRINGPACKET.core_state_9217..15
05f4 - core_state_?1STRINGPACKET.core_state_9217..16
0600 - core_state_?1STRINGPACKET.core_state_9217..5
060c - core_state_?1STRINGPACKET.core_state_9217..6
0618 - core_state_?1STRINGPACKET.core_state_9217..7
0624 - core_state_?1STRINGPACKET.core_state_9217..8
0630 - core_state_?1STRINGPACKET.core_state_9217..9
063c - core_state_?1STRINGPACKET.core_state_9217..10
0648 - core_state_?1STRINGPACKET.core_state_9217..11
0654 - core_state_?1STRINGPACKET.core_state_9217..12
0660 - floatlib_?1PACKET.37
0a60 - floatlib_?1PACKET.3
0a64 - floatlib_?1PACKET.1
0a68 - floatlib_?1PACKET.2
0a6c - floatlib_?1PACKET.4


##Data Section - 2672 - Data_align=32
0000 - 366b2070 - 00110110011010110010000001110000
0004 - 6572666f - 01100101011100100110011001101111
0008 - 726d616e - 01110010011011010110000101101110
000c - 63652072 - 01100011011001010010000001110010
0010 - 756e2070 - 01110101011011100010000001110000
0014 - 6172616d - 01100001011100100110000101101101
0018 - 65746572 - 01100101011101000110010101110010
001c - 7320666f - 01110011001000000110011001101111
0020 - 7220636f - 01110010001000000110001101101111
0024 - 72656d61 - 01110010011001010110110101100001
0028 - 726b2e0a - 01110010011010110010111000001010
002c - 00000000 - 00000000000000000000000000000000
0030 - 324b2070 - 00110010010010110010000001110000
0034 - 6572666f - 01100101011100100110011001101111
0038 - 726d616e - 01110010011011010110000101101110
003c - 63652072 - 01100011011001010010000001110010
0040 - 756e2070 - 01110101011011100010000001110000
0044 - 6172616d - 01100001011100100110000101101101
0048 - 65746572 - 01100101011101000110010101110010
004c - 7320666f - 01110011001000000110011001101111
0050 - 7220636f - 01110010001000000110001101101111
0054 - 72656d61 - 01110010011001010110110101100001
0058 - 726b2e0a - 01110010011010110010111000001010
005c - 00000000 - 00000000000000000000000000000000
0060 - 5b25755d - 01011011001001010111010101011101
0064 - 4552524f - 01000101010100100101001001001111
0068 - 5221206c - 01010010001000010010000001101100
006c - 69737420 - 01101001011100110111010000100000
0070 - 63726320 - 01100011011100100110001100100000
0074 - 30782530 - 00110000011110000010010100110000
0078 - 3478202d - 00110100011110000010000000101101
007c - 2073686f - 00100000011100110110100001101111
0080 - 756c6420 - 01110101011011000110010000100000
0084 - 62652030 - 01100010011001010010000000110000
0088 - 78253034 - 01111000001001010011000000110100
008c - 780a0000 - 01111000000010100000000000000000
0090 - 5b25755d - 01011011001001010111010101011101
0094 - 4552524f - 01000101010100100101001001001111
0098 - 52212073 - 01010010001000010010000001110011
009c - 74617465 - 01110100011000010111010001100101
00a0 - 20637263 - 00100000011000110111001001100011
00a4 - 20307825 - 00100000001100000111100000100101
00a8 - 30347820 - 00110000001101000111100000100000
00ac - 2d207368 - 00101101001000000111001101101000
00b0 - 6f756c64 - 01101111011101010110110001100100
00b4 - 20626520 - 00100000011000100110010100100000
00b8 - 30782530 - 00110000011110000010010100110000
00bc - 34780a00 - 00110100011110000000101000000000
00c0 - 436f7265 - 01000011011011110111001001100101
00c4 - 4d61726b - 01001101011000010111001001101011
00c8 - 2053697a - 00100000010100110110100101111010
00cc - 65202020 - 01100101001000000010000000100000
00d0 - 203a2025 - 00100000001110100010000000100101
00d4 - 6c750a00 - 01101100011101010000101000000000
00d8 - 546f7461 - 01010100011011110111010001100001
00dc - 6c207469 - 01101100001000000111010001101001
00e0 - 636b7320 - 01100011011010110111001100100000
00e4 - 20202020 - 00100000001000000010000000100000
00e8 - 203a2025 - 00100000001110100010000000100101
00ec - 6c750a00 - 01101100011101010000101000000000
00f0 - 546f7461 - 01010100011011110111010001100001
00f4 - 6c207469 - 01101100001000000111010001101001
00f8 - 6d652028 - 01101101011001010010000000101000
00fc - 73656373 - 01110011011001010110001101110011
0100 - 293a2025 - 00101001001110100010000000100101
0104 - 660a0000 - 01100110000010100000000000000000
0108 - 49746572 - 01001001011101000110010101110010
010c - 6174696f - 01100001011101000110100101101111
0110 - 6e732f53 - 01101110011100110010111101010011
0114 - 65632020 - 01100101011000110010000000100000
0118 - 203a2025 - 00100000001110100010000000100101
011c - 660a0000 - 01100110000010100000000000000000
0120 - 4552524f - 01000101010100100101001001001111
0124 - 5221204d - 01010010001000010010000001001101
0128 - 75737420 - 01110101011100110111010000100000
012c - 65786563 - 01100101011110000110010101100011
0130 - 75746520 - 01110101011101000110010100100000
0134 - 666f7220 - 01100110011011110111001000100000
0138 - 6174206c - 01100001011101000010000001101100
013c - 65617374 - 01100101011000010111001101110100
0140 - 20313020 - 00100000001100010011000000100000
0144 - 73656373 - 01110011011001010110001101110011
0148 - 20666f72 - 00100000011001100110111101110010
014c - 20612076 - 00100000011000010010000001110110
0150 - 616c6964 - 01100001011011000110100101100100
0154 - 20726573 - 00100000011100100110010101110011
0158 - 756c7421 - 01110101011011000111010000100001
015c - 0a000000 - 00001010000000000000000000000000
0160 - 49746572 - 01001001011101000110010101110010
0164 - 6174696f - 01100001011101000110100101101111
0168 - 6e732020 - 01101110011100110010000000100000
016c - 20202020 - 00100000001000000010000000100000
0170 - 203a2025 - 00100000001110100010000000100101
0174 - 6c750a00 - 01101100011101010000101000000000
0178 - 436f6d70 - 01000011011011110110110101110000
017c - 696c6572 - 01101001011011000110010101110010
0180 - 20766572 - 00100000011101100110010101110010
0184 - 73696f6e - 01110011011010010110111101101110
0188 - 203a2025 - 00100000001110100010000000100101
018c - 730a0000 - 01110011000010100000000000000000
0190 - 506c6561 - 01010000011011000110010101100001
0194 - 73652070 - 01110011011001010010000001110000
0198 - 75742063 - 01110101011101000010000001100011
019c - 6f6d7069 - 01101111011011010111000001101001
01a0 - 6c657220 - 01101100011001010111001000100000
01a4 - 76657273 - 01110110011001010111001001110011
01a8 - 696f6e20 - 01101001011011110110111000100000
01ac - 68657265 - 01101000011001010111001001100101
01b0 - 2028652e - 00100000001010000110010100101110
01b4 - 672e2067 - 01100111001011100010000001100111
01b8 - 63632034 - 01100011011000110010000000110100
01bc - 2e312900 - 00101110001100010010100100000000
01c0 - 436f6d70 - 01000011011011110110110101110000
01c4 - 696c6572 - 01101001011011000110010101110010
01c8 - 20666c61 - 00100000011001100110110001100001
01cc - 67732020 - 01100111011100110010000000100000
01d0 - 203a2025 - 00100000001110100010000000100101
01d4 - 730a0000 - 01110011000010100000000000000000
01d8 - 544f444f - 01010100010011110100010001001111
01dc - 00000000 - 00000000000000000000000000000000
01e0 - 4d656d6f - 01001101011001010110110101101111
01e4 - 7279206c - 01110010011110010010000001101100
01e8 - 6f636174 - 01101111011000110110000101110100
01ec - 696f6e20 - 01101001011011110110111000100000
01f0 - 203a2025 - 00100000001110100010000000100101
01f4 - 730a0000 - 01110011000010100000000000000000
01f8 - 506c6561 - 01010000011011000110010101100001
01fc - 73652070 - 01110011011001010010000001110000
0200 - 75742064 - 01110101011101000010000001100100
0204 - 61746120 - 01100001011101000110000100100000
0208 - 6d656d6f - 01101101011001010110110101101111
020c - 7279206c - 01110010011110010010000001101100
0210 - 6f636174 - 01101111011000110110000101110100
0214 - 696f6e20 - 01101001011011110110111000100000
0218 - 68657265 - 01101000011001010111001001100101
021c - 0a090909 - 00001010000010010000100100001001
0220 - 28652e67 - 00101000011001010010111001100111
0224 - 2e20636f - 00101110001000000110001101101111
0228 - 64652069 - 01100100011001010010000001101001
022c - 6e20666c - 01101110001000000110011001101100
0230 - 6173682c - 01100001011100110110100000101100
0234 - 20646174 - 00100000011001000110000101110100
0238 - 61206f6e - 01100001001000000110111101101110
023c - 20686561 - 00100000011010000110010101100001
0240 - 70206574 - 01110000001000000110010101110100
0244 - 63290000 - 01100011001010010000000000000000
0248 - 506c6561 - 01010000011011000110010101100001
024c - 73652070 - 01110011011001010010000001110000
0250 - 75742063 - 01110101011101000010000001100011
0254 - 6f6d7069 - 01101111011011010111000001101001
0258 - 6c657220 - 01101100011001010111001000100000
025c - 76657273 - 01110110011001010111001001110011
0260 - 696f6e20 - 01101001011011110110111000100000
0264 - 68657265 - 01101000011001010111001001100101
0268 - 2028652e - 00100000001010000110010100101110
026c - 672e2067 - 01100111001011100010000001100111
0270 - 63632034 - 01100011011000110010000000110100
0274 - 2e312900 - 00101110001100010010100100000000
0278 - 544f444f - 01010100010011110100010001001111
027c - 00000000 - 00000000000000000000000000000000
0280 - 202f2025 - 00100000001011110010000000100101
0284 - 73000000 - 01110011000000000000000000000000
0288 - 5b25645d - 01011011001001010110010001011101
028c - 63726366 - 01100011011100100110001101100110
0290 - 696e616c - 01101001011011100110000101101100
0294 - 20202020 - 00100000001000000010000000100000
0298 - 20203a20 - 00100000001000000011101000100000
029c - 30782530 - 00110000011110000010010100110000
02a0 - 34780a00 - 00110100011110000000101000000000
02a4 - 366b2076 - 00110110011010110010000001110110
02a8 - 616c6964 - 01100001011011000110100101100100
02ac - 6174696f - 01100001011101000110100101101111
02b0 - 6e207275 - 01101110001000000111001001110101
02b4 - 6e207061 - 01101110001000000111000001100001
02b8 - 72616d65 - 01110010011000010110110101100101
02bc - 74657273 - 01110100011001010111001001110011
02c0 - 20666f72 - 00100000011001100110111101110010
02c4 - 20636f72 - 00100000011000110110111101110010
02c8 - 656d6172 - 01100101011011010110000101110010
02cc - 6b2e0a00 - 01101011001011100000101000000000
02d0 - 50726f66 - 01010000011100100110111101100110
02d4 - 696c6520 - 01101001011011000110010100100000
02d8 - 67656e65 - 01100111011001010110111001100101
02dc - 72617469 - 01110010011000010111010001101001
02e0 - 6f6e2072 - 01101111011011100010000001110010
02e4 - 756e2070 - 01110101011011100010000001110000
02e8 - 6172616d - 01100001011100100110000101101101
02ec - 65746572 - 01100101011101000110010101110010
02f0 - 7320666f - 01110011001000000110011001101111
02f4 - 7220636f - 01110010001000000110001101101111
02f8 - 72656d61 - 01110010011001010110110101100001
02fc - 726b2e0a - 01110010011010110010111000001010
0300 - 00000000 - 00000000000000000000000000000000
0304 - 324b2076 - 00110010010010110010000001110110
0308 - 616c6964 - 01100001011011000110100101100100
030c - 6174696f - 01100001011101000110100101101111
0310 - 6e207275 - 01101110001000000111001001110101
0314 - 6e207061 - 01101110001000000111000001100001
0318 - 72616d65 - 01110010011000010110110101100101
031c - 74657273 - 01110100011001010111001001110011
0320 - 20666f72 - 00100000011001100110111101110010
0324 - 20636f72 - 00100000011000110110111101110010
0328 - 656d6172 - 01100101011011010110000101110010
032c - 6b2e0a00 - 01101011001011100000101000000000
0330 - 5b25755d - 01011011001001010111010101011101
0334 - 4552524f - 01000101010100100101001001001111
0338 - 5221206d - 01010010001000010010000001101101
033c - 61747269 - 01100001011101000111001001101001
0340 - 78206372 - 01111000001000000110001101110010
0344 - 63203078 - 01100011001000000011000001111000
0348 - 25303478 - 00100101001100000011010001111000
034c - 202d2073 - 00100000001011010010000001110011
0350 - 686f756c - 01101000011011110111010101101100
0354 - 64206265 - 01100100001000000110001001100101
0358 - 20307825 - 00100000001100000111100000100101
035c - 3034780a - 00110000001101000111100000001010
0360 - 00000000 - 00000000000000000000000000000000
0364 - 50617261 - 01010000011000010111001001100001
0368 - 6c6c656c - 01101100011011000110010101101100
036c - 20257320 - 00100000001001010111001100100000
0370 - 3a202564 - 00111010001000000010010101100100
0374 - 0a000000 - 00001010000000000000000000000000
0378 - 50546872 - 01010000010101000110100001110010
037c - 65616473 - 01100101011000010110010001110011
0380 - 00000000 - 00000000000000000000000000000000
0384 - 73656564 - 01110011011001010110010101100100
0388 - 63726320 - 01100011011100100110001100100000
038c - 20202020 - 00100000001000000010000000100000
0390 - 20202020 - 00100000001000000010000000100000
0394 - 203a2030 - 00100000001110100010000000110000
0398 - 78253034 - 01111000001001010011000000110100
039c - 780a0000 - 01111000000010100000000000000000
03a0 - 436f7272 - 01000011011011110111001001110010
03a4 - 65637420 - 01100101011000110111010000100000
03a8 - 6f706572 - 01101111011100000110010101110010
03ac - 6174696f - 01100001011101000110100101101111
03b0 - 6e207661 - 01101110001000000111011001100001
03b4 - 6c696461 - 01101100011010010110010001100001
03b8 - 7465642e - 01110100011001010110010000101110
03bc - 20536565 - 00100000010100110110010101100101
03c0 - 20726561 - 00100000011100100110010101100001
03c4 - 646d652e - 01100100011011010110010100101110
03c8 - 74787420 - 01110100011110000111010000100000
03cc - 666f7220 - 01100110011011110111001000100000
03d0 - 72756e20 - 01110010011101010110111000100000
03d4 - 616e6420 - 01100001011011100110010000100000
03d8 - 7265706f - 01110010011001010111000001101111
03dc - 7274696e - 01110010011101000110100101101110
03e0 - 67207275 - 01100111001000000111001001110101
03e4 - 6c65732e - 01101100011001010111001100101110
03e8 - 0a000000 - 00001010000000000000000000000000
03ec - 436f7265 - 01000011011011110111001001100101
03f0 - 4d61726b - 01001101011000010111001001101011
03f4 - 20312e30 - 00100000001100010010111000110000
03f8 - 203a2025 - 00100000001110100010000000100101
03fc - 66202f20 - 01100110001000000010111100100000
0400 - 25732025 - 00100101011100110010000000100101
0404 - 73000000 - 01110011000000000000000000000000
0408 - 202f2025 - 00100000001011110010000000100101
040c - 643a2573 - 01100100001110100010010101110011
0410 - 00000000 - 00000000000000000000000000000000
0414 - 50546872 - 01010000010101000110100001110010
0418 - 65616473 - 01100101011000010110010001110011
041c - 00000000 - 00000000000000000000000000000000
0420 - 0a000000 - 00001010000000000000000000000000
0424 - 4572726f - 01000101011100100111001001101111
0428 - 72732064 - 01110010011100110010000001100100
042c - 65746563 - 01100101011101000110010101100011
0430 - 7465640a - 01110100011001010110010000001010
0434 - 00000000 - 00000000000000000000000000000000
0438 - 43616e6e - 01000011011000010110111001101110
043c - 6f742076 - 01101111011101000010000001110110
0440 - 616c6964 - 01100001011011000110100101100100
0444 - 61746520 - 01100001011101000110010100100000
0448 - 6f706572 - 01101111011100000110010101110010
044c - 6174696f - 01100001011101000110100101101111
0450 - 6e20666f - 01101110001000000110011001101111
0454 - 72207468 - 01110010001000000111010001101000
0458 - 65736520 - 01100101011100110110010100100000
045c - 73656564 - 01110011011001010110010101100100
0460 - 2076616c - 00100000011101100110000101101100
0464 - 7565732c - 01110101011001010111001100101100
0468 - 20706c65 - 00100000011100000110110001100101
046c - 61736520 - 01100001011100110110010100100000
0470 - 636f6d70 - 01100011011011110110110101110000
0474 - 61726520 - 01100001011100100110010100100000
0478 - 77697468 - 01110111011010010111010001101000
047c - 20726573 - 00100000011100100110010101110011
0480 - 756c7473 - 01110101011011000111010001110011
0484 - 206f6e20 - 00100000011011110110111000100000
0488 - 61206b6e - 01100001001000000110101101101110
048c - 6f776e20 - 01101111011101110110111000100000
0490 - 706c6174 - 01110000011011000110000101110100
0494 - 666f726d - 01100110011011110111001001101101
0498 - 2e0a0000 - 00101110000010100000000000000000
049c - 5b25645d - 01011011001001010110010001011101
04a0 - 63726373 - 01100011011100100110001101110011
04a4 - 74617465 - 01110100011000010111010001100101
04a8 - 20202020 - 00100000001000000010000000100000
04ac - 20203a20 - 00100000001000000011101000100000
04b0 - 30782530 - 00110000011110000010010100110000
04b4 - 34780a00 - 00110100011110000000101000000000
04b8 - 5b25645d - 01011011001001010110010001011101
04bc - 6372636d - 01100011011100100110001101101101
04c0 - 61747269 - 01100001011101000111001001101001
04c4 - 78202020 - 01111000001000000010000000100000
04c8 - 20203a20 - 00100000001000000011101000100000
04cc - 30782530 - 00110000011110000010010100110000
04d0 - 34780a00 - 00110100011110000000101000000000
04d4 - 5b25645d - 01011011001001010110010001011101
04d8 - 6372636c - 01100011011100100110001101101100
04dc - 69737420 - 01101001011100110111010000100000
04e0 - 20202020 - 00100000001000000010000000100000
04e4 - 20203a20 - 00100000001000000011101000100000
04e8 - 30782530 - 00110000011110000010010100110000
04ec - 34780a00 - 00110100011110000000101000000000
04f0 - 53746174 - 01010011011101000110000101110100
04f4 - 69630000 - 01101001011000110000000000000000
04f8 - 48656170 - 01001000011001010110000101110000
04fc - 00000000 - 00000000000000000000000000000000
0500 - 53746163 - 01010011011101000110000101100011
0504 - 6b000000 - 01101011000000000000000000000000
0508 - d4b03340 - 11010100101100000011001101000000
050c - 6a79e714 - 01101010011110011110011100010100
0510 - e3c10000 - 11100011110000010000000000000000
0514 - be521199 - 10111110010100100001000110011001
0518 - 56081fd7 - 01010110000010000001111111010111
051c - 07470000 - 00000111010001110000000000000000
0520 - 5e4739bf - 01011110010001110011100110111111
0524 - e5a48e3a - 11100101101001001000111000111010
0528 - 8d840000 - 10001101100001000000000000000000
052c - 000004f0 - 00000000000000000000010011110000
0530 - 000004f8 - 00000000000000000000010011111000
0534 - 00000500 - 00000000000000000000010100000000
0538 - 00000000 - 00000000000000000000000000000000
053c - 0000012c - 00000000000000000000000100101100
0540 - 00000066 - 00000000000000000000000001100110
0544 - 00003415 - 00000000000000000011010000010101
0548 - 00003415 - 00000000000000000011010000010101
054c - 00000002 - 00000000000000000000000000000010
0550 - LABEL: FUNC_core_state__?1.core_init_state.TAG.0.0
0554 - LABEL: FUNC_core_state__?1.core_init_state.TAG.0.1
0558 - LABEL: FUNC_core_state__?1.core_init_state.TAG.0.2
055c - LABEL: FUNC_core_state__?1.core_init_state.TAG.0.3
0560 - LABEL: FUNC_core_state__?1.core_init_state.TAG.0.4
0564 - LABEL: FUNC_core_state__?1.core_init_state.TAG.0.5
0568 - LABEL: FUNC_core_state__?1.core_init_state.TAG.0.6
056c - LABEL: FUNC_core_state__?1.core_init_state.TAG.0.7
0570 - 000005d0 - 00000000000000000000010111010000
0574 - 000005dc - 00000000000000000000010111011100
0578 - 000005e8 - 00000000000000000000010111101000
057c - 000005f4 - 00000000000000000000010111110100
0580 - 00000590 - 00000000000000000000010110010000
0584 - 00000598 - 00000000000000000000010110011000
0588 - 000005a0 - 00000000000000000000010110100000
058c - 000005a8 - 00000000000000000000010110101000
0590 - 35303132 - 00110101001100000011000100110010
0594 - 00000000 - 00000000000000000000000000000000
0598 - 31323334 - 00110001001100100011001100110100
059c - 00000000 - 00000000000000000000000000000000
05a0 - 2d383734 - 00101101001110000011011100110100
05a4 - 00000000 - 00000000000000000000000000000000
05a8 - 2b313232 - 00101011001100010011001000110010
05ac - 00000000 - 00000000000000000000000000000000
05b0 - 00000600 - 00000000000000000000011000000000
05b4 - 0000060c - 00000000000000000000011000001100
05b8 - 00000618 - 00000000000000000000011000011000
05bc - 00000624 - 00000000000000000000011000100100
05c0 - 00000630 - 00000000000000000000011000110000
05c4 - 0000063c - 00000000000000000000011000111100
05c8 - 00000648 - 00000000000000000000011001001000
05cc - 00000654 - 00000000000000000000011001010100
05d0 - 54302e33 - 01010100001100000010111000110011
05d4 - 652d3146 - 01100101001011010011000101000110
05d8 - 00000000 - 00000000000000000000000000000000
05dc - 2d542e54 - 00101101010101000010111001010100
05e0 - 2b2b5471 - 00101011001010110101010001110001
05e4 - 00000000 - 00000000000000000000000000000000
05e8 - 3154332e - 00110001010101000011001100101110
05ec - 3465347a - 00110100011001010011010001111010
05f0 - 00000000 - 00000000000000000000000000000000
05f4 - 33342e30 - 00110011001101000010111000110000
05f8 - 652d545e - 01100101001011010101010001011110
05fc - 00000000 - 00000000000000000000000000000000
0600 - 33352e35 - 00110011001101010010111000110101
0604 - 34343030 - 00110100001101000011000000110000
0608 - 00000000 - 00000000000000000000000000000000
060c - 2e313233 - 00101110001100010011001000110011
0610 - 34353030 - 00110100001101010011000000110000
0614 - 00000000 - 00000000000000000000000000000000
0618 - 2d313130 - 00101101001100010011000100110000
061c - 2e373030 - 00101110001101110011000000110000
0620 - 00000000 - 00000000000000000000000000000000
0624 - 2b302e36 - 00101011001100000010111000110110
0628 - 34343030 - 00110100001101000011000000110000
062c - 00000000 - 00000000000000000000000000000000
0630 - 352e3530 - 00110101001011100011010100110000
0634 - 30652b33 - 00110000011001010010101100110011
0638 - 00000000 - 00000000000000000000000000000000
063c - 2d2e3132 - 00101101001011100011000100110010
0640 - 33652d32 - 00110011011001010010110100110010
0644 - 00000000 - 00000000000000000000000000000000
0648 - 2d383765 - 00101101001110000011011101100101
064c - 2b383332 - 00101011001110000011001100110010
0650 - 00000000 - 00000000000000000000000000000000
0654 - 2b302e36 - 00101011001100000010111000110110
0658 - 652d3132 - 01100101001011010011000100110010
065c - 00000000 - 00000000000000000000000000000000
0660 - 00000008 - 00000000000000000000000000001000
0664 - 00000007 - 00000000000000000000000000000111
0668 - 00000006 - 00000000000000000000000000000110
066c - 00000006 - 00000000000000000000000000000110
0670 - 00000005 - 00000000000000000000000000000101
0674 - 00000005 - 00000000000000000000000000000101
0678 - 00000005 - 00000000000000000000000000000101
067c - 00000005 - 00000000000000000000000000000101
0680 - 00000004 - 00000000000000000000000000000100
0684 - 00000004 - 00000000000000000000000000000100
0688 - 00000004 - 00000000000000000000000000000100
068c - 00000004 - 00000000000000000000000000000100
0690 - 00000004 - 00000000000000000000000000000100
0694 - 00000004 - 00000000000000000000000000000100
0698 - 00000004 - 00000000000000000000000000000100
069c - 00000004 - 00000000000000000000000000000100
06a0 - 00000003 - 00000000000000000000000000000011
06a4 - 00000003 - 00000000000000000000000000000011
06a8 - 00000003 - 00000000000000000000000000000011
06ac - 00000003 - 00000000000000000000000000000011
06b0 - 00000003 - 00000000000000000000000000000011
06b4 - 00000003 - 00000000000000000000000000000011
06b8 - 00000003 - 00000000000000000000000000000011
06bc - 00000003 - 00000000000000000000000000000011
06c0 - 00000003 - 00000000000000000000000000000011
06c4 - 00000003 - 00000000000000000000000000000011
06c8 - 00000003 - 00000000000000000000000000000011
06cc - 00000003 - 00000000000000000000000000000011
06d0 - 00000003 - 00000000000000000000000000000011
06d4 - 00000003 - 00000000000000000000000000000011
06d8 - 00000003 - 00000000000000000000000000000011
06dc - 00000003 - 00000000000000000000000000000011
06e0 - 00000002 - 00000000000000000000000000000010
06e4 - 00000002 - 00000000000000000000000000000010
06e8 - 00000002 - 00000000000000000000000000000010
06ec - 00000002 - 00000000000000000000000000000010
06f0 - 00000002 - 00000000000000000000000000000010
06f4 - 00000002 - 00000000000000000000000000000010
06f8 - 00000002 - 00000000000000000000000000000010
06fc - 00000002 - 00000000000000000000000000000010
0700 - 00000002 - 00000000000000000000000000000010
0704 - 00000002 - 00000000000000000000000000000010
0708 - 00000002 - 00000000000000000000000000000010
070c - 00000002 - 00000000000000000000000000000010
0710 - 00000002 - 00000000000000000000000000000010
0714 - 00000002 - 00000000000000000000000000000010
0718 - 00000002 - 00000000000000000000000000000010
071c - 00000002 - 00000000000000000000000000000010
0720 - 00000002 - 00000000000000000000000000000010
0724 - 00000002 - 00000000000000000000000000000010
0728 - 00000002 - 00000000000000000000000000000010
072c - 00000002 - 00000000000000000000000000000010
0730 - 00000002 - 00000000000000000000000000000010
0734 - 00000002 - 00000000000000000000000000000010
0738 - 00000002 - 00000000000000000000000000000010
073c - 00000002 - 00000000000000000000000000000010
0740 - 00000002 - 00000000000000000000000000000010
0744 - 00000002 - 00000000000000000000000000000010
0748 - 00000002 - 00000000000000000000000000000010
074c - 00000002 - 00000000000000000000000000000010
0750 - 00000002 - 00000000000000000000000000000010
0754 - 00000002 - 00000000000000000000000000000010
0758 - 00000002 - 00000000000000000000000000000010
075c - 00000002 - 00000000000000000000000000000010
0760 - 00000001 - 00000000000000000000000000000001
0764 - 00000001 - 00000000000000000000000000000001
0768 - 00000001 - 00000000000000000000000000000001
076c - 00000001 - 00000000000000000000000000000001
0770 - 00000001 - 00000000000000000000000000000001
0774 - 00000001 - 00000000000000000000000000000001
0778 - 00000001 - 00000000000000000000000000000001
077c - 00000001 - 00000000000000000000000000000001
0780 - 00000001 - 00000000000000000000000000000001
0784 - 00000001 - 00000000000000000000000000000001
0788 - 00000001 - 00000000000000000000000000000001
078c - 00000001 - 00000000000000000000000000000001
0790 - 00000001 - 00000000000000000000000000000001
0794 - 00000001 - 00000000000000000000000000000001
0798 - 00000001 - 00000000000000000000000000000001
079c - 00000001 - 00000000000000000000000000000001
07a0 - 00000001 - 00000000000000000000000000000001
07a4 - 00000001 - 00000000000000000000000000000001
07a8 - 00000001 - 00000000000000000000000000000001
07ac - 00000001 - 00000000000000000000000000000001
07b0 - 00000001 - 00000000000000000000000000000001
07b4 - 00000001 - 00000000000000000000000000000001
07b8 - 00000001 - 00000000000000000000000000000001
07bc - 00000001 - 00000000000000000000000000000001
07c0 - 00000001 - 00000000000000000000000000000001
07c4 - 00000001 - 00000000000000000000000000000001
07c8 - 00000001 - 00000000000000000000000000000001
07cc - 00000001 - 00000000000000000000000000000001
07d0 - 00000001 - 00000000000000000000000000000001
07d4 - 00000001 - 00000000000000000000000000000001
07d8 - 00000001 - 00000000000000000000000000000001
07dc - 00000001 - 00000000000000000000000000000001
07e0 - 00000001 - 00000000000000000000000000000001
07e4 - 00000001 - 00000000000000000000000000000001
07e8 - 00000001 - 00000000000000000000000000000001
07ec - 00000001 - 00000000000000000000000000000001
07f0 - 00000001 - 00000000000000000000000000000001
07f4 - 00000001 - 00000000000000000000000000000001
07f8 - 00000001 - 00000000000000000000000000000001
07fc - 00000001 - 00000000000000000000000000000001
0800 - 00000001 - 00000000000000000000000000000001
0804 - 00000001 - 00000000000000000000000000000001
0808 - 00000001 - 00000000000000000000000000000001
080c - 00000001 - 00000000000000000000000000000001
0810 - 00000001 - 00000000000000000000000000000001
0814 - 00000001 - 00000000000000000000000000000001
0818 - 00000001 - 00000000000000000000000000000001
081c - 00000001 - 00000000000000000000000000000001
0820 - 00000001 - 00000000000000000000000000000001
0824 - 00000001 - 00000000000000000000000000000001
0828 - 00000001 - 00000000000000000000000000000001
082c - 00000001 - 00000000000000000000000000000001
0830 - 00000001 - 00000000000000000000000000000001
0834 - 00000001 - 00000000000000000000000000000001
0838 - 00000001 - 00000000000000000000000000000001
083c - 00000001 - 00000000000000000000000000000001
0840 - 00000001 - 00000000000000000000000000000001
0844 - 00000001 - 00000000000000000000000000000001
0848 - 00000001 - 00000000000000000000000000000001
084c - 00000001 - 00000000000000000000000000000001
0850 - 00000001 - 00000000000000000000000000000001
0854 - 00000001 - 00000000000000000000000000000001
0858 - 00000001 - 00000000000000000000000000000001
085c - 00000001 - 00000000000000000000000000000001
0860 - 00000000 - 00000000000000000000000000000000
0864 - 00000000 - 00000000000000000000000000000000
0868 - 00000000 - 00000000000000000000000000000000
086c - 00000000 - 00000000000000000000000000000000
0870 - 00000000 - 00000000000000000000000000000000
0874 - 00000000 - 00000000000000000000000000000000
0878 - 00000000 - 00000000000000000000000000000000
087c - 00000000 - 00000000000000000000000000000000
0880 - 00000000 - 00000000000000000000000000000000
0884 - 00000000 - 00000000000000000000000000000000
0888 - 00000000 - 00000000000000000000000000000000
088c - 00000000 - 00000000000000000000000000000000
0890 - 00000000 - 00000000000000000000000000000000
0894 - 00000000 - 00000000000000000000000000000000
0898 - 00000000 - 00000000000000000000000000000000
089c - 00000000 - 00000000000000000000000000000000
08a0 - 00000000 - 00000000000000000000000000000000
08a4 - 00000000 - 00000000000000000000000000000000
08a8 - 00000000 - 00000000000000000000000000000000
08ac - 00000000 - 00000000000000000000000000000000
08b0 - 00000000 - 00000000000000000000000000000000
08b4 - 00000000 - 00000000000000000000000000000000
08b8 - 00000000 - 00000000000000000000000000000000
08bc - 00000000 - 00000000000000000000000000000000
08c0 - 00000000 - 00000000000000000000000000000000
08c4 - 00000000 - 00000000000000000000000000000000
08c8 - 00000000 - 00000000000000000000000000000000
08cc - 00000000 - 00000000000000000000000000000000
08d0 - 00000000 - 00000000000000000000000000000000
08d4 - 00000000 - 00000000000000000000000000000000
08d8 - 00000000 - 00000000000000000000000000000000
08dc - 00000000 - 00000000000000000000000000000000
08e0 - 00000000 - 00000000000000000000000000000000
08e4 - 00000000 - 00000000000000000000000000000000
08e8 - 00000000 - 00000000000000000000000000000000
08ec - 00000000 - 00000000000000000000000000000000
08f0 - 00000000 - 00000000000000000000000000000000
08f4 - 00000000 - 00000000000000000000000000000000
08f8 - 00000000 - 00000000000000000000000000000000
08fc - 00000000 - 00000000000000000000000000000000
0900 - 00000000 - 00000000000000000000000000000000
0904 - 00000000 - 00000000000000000000000000000000
0908 - 00000000 - 00000000000000000000000000000000
090c - 00000000 - 00000000000000000000000000000000
0910 - 00000000 - 00000000000000000000000000000000
0914 - 00000000 - 00000000000000000000000000000000
0918 - 00000000 - 00000000000000000000000000000000
091c - 00000000 - 00000000000000000000000000000000
0920 - 00000000 - 00000000000000000000000000000000
0924 - 00000000 - 00000000000000000000000000000000
0928 - 00000000 - 00000000000000000000000000000000
092c - 00000000 - 00000000000000000000000000000000
0930 - 00000000 - 00000000000000000000000000000000
0934 - 00000000 - 00000000000000000000000000000000
0938 - 00000000 - 00000000000000000000000000000000
093c - 00000000 - 00000000000000000000000000000000
0940 - 00000000 - 00000000000000000000000000000000
0944 - 00000000 - 00000000000000000000000000000000
0948 - 00000000 - 00000000000000000000000000000000
094c - 00000000 - 00000000000000000000000000000000
0950 - 00000000 - 00000000000000000000000000000000
0954 - 00000000 - 00000000000000000000000000000000
0958 - 00000000 - 00000000000000000000000000000000
095c - 00000000 - 00000000000000000000000000000000
0960 - 00000000 - 00000000000000000000000000000000
0964 - 00000000 - 00000000000000000000000000000000
0968 - 00000000 - 00000000000000000000000000000000
096c - 00000000 - 00000000000000000000000000000000
0970 - 00000000 - 00000000000000000000000000000000
0974 - 00000000 - 00000000000000000000000000000000
0978 - 00000000 - 00000000000000000000000000000000
097c - 00000000 - 00000000000000000000000000000000
0980 - 00000000 - 00000000000000000000000000000000
0984 - 00000000 - 00000000000000000000000000000000
0988 - 00000000 - 00000000000000000000000000000000
098c - 00000000 - 00000000000000000000000000000000
0990 - 00000000 - 00000000000000000000000000000000
0994 - 00000000 - 00000000000000000000000000000000
0998 - 00000000 - 00000000000000000000000000000000
099c - 00000000 - 00000000000000000000000000000000
09a0 - 00000000 - 00000000000000000000000000000000
09a4 - 00000000 - 00000000000000000000000000000000
09a8 - 00000000 - 00000000000000000000000000000000
09ac - 00000000 - 00000000000000000000000000000000
09b0 - 00000000 - 00000000000000000000000000000000
09b4 - 00000000 - 00000000000000000000000000000000
09b8 - 00000000 - 00000000000000000000000000000000
09bc - 00000000 - 00000000000000000000000000000000
09c0 - 00000000 - 00000000000000000000000000000000
09c4 - 00000000 - 00000000000000000000000000000000
09c8 - 00000000 - 00000000000000000000000000000000
09cc - 00000000 - 00000000000000000000000000000000
09d0 - 00000000 - 00000000000000000000000000000000
09d4 - 00000000 - 00000000000000000000000000000000
09d8 - 00000000 - 00000000000000000000000000000000
09dc - 00000000 - 00000000000000000000000000000000
09e0 - 00000000 - 00000000000000000000000000000000
09e4 - 00000000 - 00000000000000000000000000000000
09e8 - 00000000 - 00000000000000000000000000000000
09ec - 00000000 - 00000000000000000000000000000000
09f0 - 00000000 - 00000000000000000000000000000000
09f4 - 00000000 - 00000000000000000000000000000000
09f8 - 00000000 - 00000000000000000000000000000000
09fc - 00000000 - 00000000000000000000000000000000
0a00 - 00000000 - 00000000000000000000000000000000
0a04 - 00000000 - 00000000000000000000000000000000
0a08 - 00000000 - 00000000000000000000000000000000
0a0c - 00000000 - 00000000000000000000000000000000
0a10 - 00000000 - 00000000000000000000000000000000
0a14 - 00000000 - 00000000000000000000000000000000
0a18 - 00000000 - 00000000000000000000000000000000
0a1c - 00000000 - 00000000000000000000000000000000
0a20 - 00000000 - 00000000000000000000000000000000
0a24 - 00000000 - 00000000000000000000000000000000
0a28 - 00000000 - 00000000000000000000000000000000
0a2c - 00000000 - 00000000000000000000000000000000
0a30 - 00000000 - 00000000000000000000000000000000
0a34 - 00000000 - 00000000000000000000000000000000
0a38 - 00000000 - 00000000000000000000000000000000
0a3c - 00000000 - 00000000000000000000000000000000
0a40 - 00000000 - 00000000000000000000000000000000
0a44 - 00000000 - 00000000000000000000000000000000
0a48 - 00000000 - 00000000000000000000000000000000
0a4c - 00000000 - 00000000000000000000000000000000
0a50 - 00000000 - 00000000000000000000000000000000
0a54 - 00000000 - 00000000000000000000000000000000
0a58 - 00000000 - 00000000000000000000000000000000
0a5c - 00000000 - 00000000000000000000000000000000
0a60 - 00000000 - 00000000000000000000000000000000
0a64 - 00000000 - 00000000000000000000000000000000
0a68 - 00000000 - 00000000000000000000000000000000
0a6c - 00000000 - 00000000000000000000000000000000


##BSS Labels - 8 - Bss_align=32
0000 - core_portme_9217.start_time_val
0004 - core_portme_9217.stop_time_val
