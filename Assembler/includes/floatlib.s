 ## Target: VEX 1 cluster (big endian)
.comment ""
.comment "Copyright (C) 1990-2007 Hewlett-Packard Company"
.comment "VEX C compiler version 3.41 (20070125 release)"
.comment ""
.comment "-dir /home/elds2/vex-3.41 -c -ms -mas_g -fexpand-div"
.sversion 3.41
.rta 2
.section .bss
.align 32
.section .data
.align 32
.equ _?1TEMPLATEPACKET.5, 0x0
 ## Begin estimateDiv64To32
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32)
estimateDiv64To32:
.trace 3
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    cmpleu $b0.0 = $r0.5, $r0.3   ## bblock 0, line 150,  t198(I1),  t134,  t132
	c0    mov $r0.2 = $r0.3   ## t132
;;								## 0
	c0    mov $r0.3 = (~0x0)   ## (~0x0)(I32)
;;								## 1
	c0    brf $b0.0, L0?3   ## bblock 0, line 150,  t198(I1)
;;								## 2
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 5, line 151,  t119,  ?2.1?2auto_size(I32),  t118
;;								## 3
.trace 4
L0?3:
	c0    shru $r0.11 = $r0.5, 16   ## bblock 1, line 152,  t162(I16),  t134,  16(SI32)
	c0    mtb $b0.0 = $r0.0   ## 0(I32)
	c0    mov $r0.12 = (~0xffff)   ## (~0xffff)(I32)
;;								## 0
	c0    shl $r0.15 = $r0.11, 16   ## bblock 1, line 153,  t5,  t162(I16),  16(SI32)
	c0    cmplt $r0.13 = $r0.11, $r0.0   ## bblock 1, line 153,  t202,  t162(I16),  0(I32)
	c0    cmpgeu $r0.14 = $r0.2, $r0.11   ## bblock 1, line 153,  t208,  t132,  t162(I16)
	c0    mov $r0.9 = $r0.12   ## bblock 1, line 0,  t188,  (~0xffff)(I32)
;;								## 1
	c0    shru $r0.17 = $r0.11, $r0.13   ## bblock 1, line 153,  t200,  t162(I16),  t202
	c0    shru $r0.16 = $r0.2, $r0.13   ## bblock 1, line 153,  t199,  t132,  t202
	c0    cmpgtu $b0.2 = $r0.15, $r0.2   ## bblock 1, line 153,  t209(I1),  t5,  t132
	c0    mtb $b0.1 = $r0.13   ## t202
;;								## 2
	c0    shl $r0.3 = $r0.5, 16   ## bblock 1, line 187,  t91,  t134,  16(SI32)
	c0    addcg $r0.13, $b0.3 = $r0.16, $r0.16, $b0.0   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  0(I32)
	c0    mov $r0.6 = $r0.1   ## bblock 1, line 177,  t95,  t119
	c0    mov $r0.10 = $r0.0   ## bblock 1, line 0,  t174,  0(I32)
;;								## 3
	c0    divs $r0.13, $b0.3 = $r0.0, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  0(I32),  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.13, $r0.13, $b0.0   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  0(I32)
;;								## 4
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 5
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 6
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 7
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 8
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 9
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 10
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 11
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 12
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 13
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 14
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 15
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 16
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 17
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 18
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 19
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 20
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 21
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 22
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 23
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 24
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 25
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 26
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 27
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 28
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 29
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 30
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 31
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 32
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 33
	c0    divs $r0.13, $b0.3 = $r0.13, $r0.17, $b0.3   ## bblock 1, line 153,  t201,  t203(I1),  t201,  t200,  t203(I1)
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
;;								## 34
	c0    divs $r0.13, $b0.4 = $r0.13, $r0.17, $b0.4   ## bblock 1, line 153,  t201,  t204(I1),  t201,  t200,  t204(I1)
	c0    addcg $r0.15, $b0.3 = $r0.16, $r0.16, $b0.3   ## bblock 1, line 153,  t199,  t203(I1),  t199,  t199,  t203(I1)
;;								## 35
	c0    addcg $r0.16, $b0.4 = $r0.15, $r0.15, $b0.4   ## bblock 1, line 153,  t199,  t204(I1),  t199,  t199,  t204(I1)
	c0    cmpge $r0.13 = $r0.13, $r0.0   ## bblock 1, line 153,  t205,  t201,  0(I32)
;;								## 36
	c0    orc $r0.16 = $r0.16, $r0.0   ## bblock 1, line 153,  t206,  t199,  0(I32)
;;								## 37
	c0    sh1add $r0.16 = $r0.16, $r0.13   ## bblock 1, line 153,  t207,  t206,  t205
;;								## 38
	c0    slct $r0.14 = $b0.1, $r0.14, $r0.16   ## bblock 1, line 153,  t9,  t202,  t208,  t207
;;								## 39
	c0    shl $r0.14 = $r0.14, 16   ## bblock 1, line 153,  t10,  t9,  16(SI32)
;;								## 40
	c0    slct $r0.8 = $b0.2, $r0.14, $r0.12   ## bblock 1, line 153,  t168,  t209(I1),  t10,  (~0xffff)(I32)
;;								## 41
	c0    add $r0.7 = $r0.8, $r0.12   ## bblock 1, line 0,  t187,  t168,  (~0xffff)(I32)
	c0    mpylhu $r0.14 = $r0.5, $r0.8   ## bblock 1, line 164,  t38,  t134,  t168
	c0    mpylhu $r0.13 = $r0.8, $r0.5   ## bblock 1, line 165,  t45,  t168,  t134
;;								## 42
	c0    mpyhhu $r0.5 = $r0.5, $r0.8   ## bblock 1, line 166,  t41,  t134,  t168
	c0    mpyllu $r0.12 = $r0.5, $r0.8   ## bblock 1, line 163,  t51,  t134,  t168
;;								## 43
	c0    add $r0.14 = $r0.13, $r0.14   ## bblock 1, line 167,  t49,  t45,  t38
;;								## 44
	c0    shru $r0.14 = $r0.14, 16   ## bblock 1, line 168,  t43(I16),  t49,  16(SI32)
	c0    cmpltu $r0.13 = $r0.14, $r0.13   ## bblock 1, line 168,  t46,  t49,  t45
	c0    shl $r0.15 = $r0.14, 16   ## bblock 1, line 169,  t56,  t49,  16(SI32)
;;								## 45
	c0    shl $r0.13 = $r0.13, 16   ## bblock 1, line 168,  t47,  t46,  16(SI32)
	c0    add $r0.12 = $r0.12, $r0.15   ## bblock 1, line 170,  t74,  t51,  t56
	c0    add $r0.14 = $r0.14, $r0.5   ## bblock 1, line 171,  t210,  t43(I16),  t41
	c0    add $r0.5 = $r0.1, 0x4   ## bblock 1, line 176,  t102,  t119,  offset(rem0?1.2)=0x4(P32)
;;								## 46
	c0    cmpltu $r0.15 = $r0.12, $r0.15   ## bblock 1, line 171,  t57,  t74,  t56
	c0    stw 0x8[$r0.1] = $r0.12   ## bblock 1, line 172, t119, t74
	c0    sub $r0.4 = $r0.4, $r0.12   ## bblock 1, line 182,  t71,  t133,  t74
	c0    cmpltu $r0.16 = $r0.4, $r0.12   ## bblock 1, line 183,  t75,  t133,  t74
;;								## 47
	c0    add $r0.13 = $r0.13, $r0.15   ## bblock 1, line 171,  t211,  t47,  t57
	c0    stw 0[$r0.1] = $r0.4   ## bblock 1, line 182, t119, t71
;;								## 48
	c0    add $r0.14 = $r0.14, $r0.13   ## bblock 1, line 171,  t76,  t210,  t211
	c0    mov $r0.4 = $r0.11   ## t162(I16)
;;								## 49
	c0    stw 0xc[$r0.1] = $r0.14   ## bblock 1, line 173, t119, t76
	c0    sub $r0.2 = $r0.2, $r0.14   ## bblock 1, line 183,  t212,  t132,  t76
;;								## 50
	c0    sub $r0.2 = $r0.2, $r0.16   ## bblock 1, line 183,  t78,  t212,  t75
;;								## 51
	c0    stw 0x4[$r0.1] = $r0.2   ## bblock 1, line 183, t119, t78
;;								## 52
.trace 1
L1?3:
	c0    ldw.d $r0.2 = 0[$r0.1]   ## [spec] bblock 4, line 192, t182, t119
;;								## 0
	c0    ldw $r0.11 = 0x4[$r0.1]   ## bblock 2, line 185, t80, t119
	      xnop 1
;;								## 2
	c0    add $r0.12 = $r0.2, $r0.3   ## [spec] bblock 4, line 195,  t181,  t182,  t91
;;								## 3
	c0    cmplt $b0.0 = $r0.11, $r0.0   ## bblock 2, line 185,  t213(I1),  t80,  0(SI32)
	c0    cmpltu $r0.2 = $r0.12, $r0.2   ## [spec] bblock 4, line 197,  t180,  t181,  t182
	c0    add $r0.13 = $r0.11, $r0.4   ## [spec] bblock 4, line 197,  t225,  t80,  t162(I16)
;;								## 4
	c0    add $r0.13 = $r0.13, $r0.2   ## [spec] bblock 4, line 197,  t179,  t225,  t180
;;								## 5
	c0    brf $b0.0, L2?3   ## bblock 2, line 185,  t213(I1)
;;								## 6
	c0    stw 0[$r0.5] = $r0.13   ## bblock 4, line 197, t102, t179
	c0    add $r0.8 = $r0.8, -131072   ## [spec] bblock 10, line 186-2,  t168,  t168,  -131072(SI32)
;;								## 7
	c0    ldw $r0.2 = 0x4[$r0.1]   ## bblock 4, line 185-1, t186, t119
;;								## 8
	c0    stw 0[$r0.6] = $r0.12   ## bblock 4, line 196, t95, t181
;;								## 9
	c0    ldw.d $r0.11 = 0[$r0.1]   ## [spec] bblock 13, line 192-1, t97, t119
;;								## 10
	c0    cmplt $b0.0 = $r0.2, $r0.0   ## bblock 4, line 185-1,  t226(I1),  t186,  0(SI32)
	      xnop 1
;;								## 12
	c0    add $r0.12 = $r0.3, $r0.11   ## [spec] bblock 13, line 195-1,  t96,  t91,  t97
	c0    brf $b0.0, L3?3   ## bblock 4, line 185-1,  t226(I1)
;;								## 13
	c0    cmpltu $r0.11 = $r0.12, $r0.11   ## bblock 13, line 197-1,  t98,  t96,  t97
	c0    stw 0[$r0.6] = $r0.12   ## bblock 13, line 196-1, t95, t96
	c0    add $r0.10 = $r0.10, -131072   ## [spec] bblock 7, line 186-3,  t174,  t174,  -131072(SI32)
;;								## 14
	c0    add $r0.11 = $r0.4, $r0.11   ## bblock 13, line 197-1,  t230,  t162(I16),  t98
	c0    ldw.d $r0.12 = 0[$r0.1]   ## [spec] bblock 10, line 192-2, t171, t119
;;								## 15
	c0    add $r0.11 = $r0.11, $r0.2   ## bblock 13, line 197-1,  t101,  t230,  t186
;;								## 16
	c0    stw 0[$r0.5] = $r0.11   ## bblock 13, line 197-1, t102, t101
;;								## 17
	c0    ldw $r0.2 = 0x4[$r0.1]   ## bblock 13, line 185-2, t173, t119
	c0    add $r0.11 = $r0.3, $r0.12   ## [spec] bblock 10, line 195-2,  t172,  t91,  t171
;;								## 18
	c0    cmpltu $r0.12 = $r0.11, $r0.12   ## [spec] bblock 10, line 197-2,  t169,  t172,  t171
;;								## 19
	c0    add $r0.12 = $r0.4, $r0.12   ## [spec] bblock 10, line 197-2,  t228,  t162(I16),  t169
;;								## 20
	c0    cmplt $b0.0 = $r0.2, $r0.0   ## bblock 13, line 185-2,  t231(I1),  t173,  0(SI32)
	c0    add $r0.12 = $r0.12, $r0.2   ## [spec] bblock 10, line 197-2,  t170,  t228,  t173
	      xnop 1
;;								## 22
	c0    brf $b0.0, L4?3   ## bblock 13, line 185-2,  t231(I1)
;;								## 23
	c0    stw 0[$r0.6] = $r0.11   ## bblock 10, line 196-2, t95, t172
	c0    add $r0.7 = $r0.7, (~0x1ffff)   ## bblock 10, line 0,  t187,  t187,  (~0x1ffff)(I32)
;;								## 24
	c0    ldw.d $r0.2 = 0[$r0.1]   ## [spec] bblock 7, line 192-3, t183, t119
;;								## 25
	c0    stw 0[$r0.5] = $r0.12   ## bblock 10, line 197-2, t102, t170
;;								## 26
	c0    ldw $r0.11 = 0x4[$r0.1]   ## bblock 10, line 185-3, t184, t119
;;								## 27
	c0    add $r0.12 = $r0.3, $r0.2   ## [spec] bblock 7, line 195-3,  t177,  t91,  t183
;;								## 28
	c0    cmpltu $r0.2 = $r0.12, $r0.2   ## [spec] bblock 7, line 197-3,  t175,  t177,  t183
;;								## 29
	c0    cmplt $b0.0 = $r0.11, $r0.0   ## bblock 10, line 185-3,  t229(I1),  t184,  0(SI32)
	c0    add $r0.2 = $r0.4, $r0.2   ## [spec] bblock 7, line 197-3,  t227,  t162(I16),  t175
;;								## 30
	c0    add $r0.2 = $r0.2, $r0.11   ## [spec] bblock 7, line 197-3,  t176,  t227,  t184
;;								## 31
	c0    brf $b0.0, L5?3   ## bblock 10, line 185-3,  t229(I1)
;;								## 32
	c0    stw 0[$r0.6] = $r0.12   ## bblock 7, line 196-3, t95, t177
	c0    add $r0.9 = $r0.9, (~0x1ffff)   ## bblock 7, line 0,  t188,  t188,  (~0x1ffff)(I32)
;;								## 33
	c0    stw 0[$r0.5] = $r0.2   ## bblock 7, line 197-3, t102, t176
	c0    goto L1?3 ## goto
;;								## 34
.trace 8
L5?3:
	c0    mov $r0.10 = $r0.9   ## bblock 8, line 0,  t166,  t188
	   ## bblock 8, line 0,  t160,  t168## $r0.8(skipped)
	c0    ldw $r0.2 = 0[$r0.1]   ## bblock 3, line 200, t103, t119
	c0    cmplt $b0.1 = $r0.4, $r0.0   ## bblock 3, line 201,  t217,  t162(I16),  0(I32)
;;								## 0
	c0    shl $r0.6 = $r0.4, 16   ## bblock 3, line 201,  t110,  t162(I16),  16(SI32)
	c0    mtb $b0.0 = $r0.0   ## 0(I32)
;;								## 1
	c0    mfb $r0.5 = $b0.1   ## t217
;;								## 2
	c0    shru $r0.9 = $r0.4, $r0.5   ## bblock 3, line 201,  t215,  t162(I16),  t217
	c0    ldw $r0.7 = 0x4[$r0.1]   ## bblock 3, line 200, t105, t119
;;								## 3
	c0    goto L6?3 ## goto
;;								## 4
.trace 7
L4?3:
	c0    mov $r0.10 = $r0.9   ## bblock 11, line 0,  t166,  t188
	c0    mov $r0.8 = $r0.7   ## bblock 11, line 0,  t160,  t187
	c0    ldw $r0.2 = 0[$r0.1]   ## bblock 3, line 200, t103, t119
	c0    cmplt $b0.1 = $r0.4, $r0.0   ## bblock 3, line 201,  t217,  t162(I16),  0(I32)
;;								## 0
	c0    shl $r0.6 = $r0.4, 16   ## bblock 3, line 201,  t110,  t162(I16),  16(SI32)
	c0    mtb $b0.0 = $r0.0   ## 0(I32)
;;								## 1
	c0    mfb $r0.5 = $b0.1   ## t217
;;								## 2
	c0    shru $r0.9 = $r0.4, $r0.5   ## bblock 3, line 201,  t215,  t162(I16),  t217
	c0    ldw $r0.7 = 0x4[$r0.1]   ## bblock 3, line 200, t105, t119
;;								## 3
	c0    goto L6?3 ## goto
;;								## 4
.trace 6
L3?3:
	   ## bblock 14, line 0,  t166,  t174## $r0.10(skipped)
	c0    mov $r0.8 = $r0.7   ## bblock 14, line 0,  t160,  t187
	c0    ldw $r0.2 = 0[$r0.1]   ## bblock 3, line 200, t103, t119
	c0    cmplt $b0.1 = $r0.4, $r0.0   ## bblock 3, line 201,  t217,  t162(I16),  0(I32)
;;								## 0
	c0    shl $r0.6 = $r0.4, 16   ## bblock 3, line 201,  t110,  t162(I16),  16(SI32)
	c0    mtb $b0.0 = $r0.0   ## 0(I32)
;;								## 1
	c0    mfb $r0.5 = $b0.1   ## t217
;;								## 2
	c0    shru $r0.9 = $r0.4, $r0.5   ## bblock 3, line 201,  t215,  t162(I16),  t217
	c0    ldw $r0.7 = 0x4[$r0.1]   ## bblock 3, line 200, t105, t119
;;								## 3
	c0    goto L6?3 ## goto
;;								## 4
.trace 5
L2?3:
	c0    ldw $r0.2 = 0[$r0.1]   ## bblock 3, line 200, t103, t119
	c0    shl $r0.6 = $r0.4, 16   ## bblock 3, line 201,  t110,  t162(I16),  16(SI32)
	c0    cmplt $r0.5 = $r0.4, $r0.0   ## bblock 3, line 201,  t217,  t162(I16),  0(I32)
	c0    mtb $b0.0 = $r0.0   ## 0(I32)
;;								## 0
	   ## bblock 15, line 0,  t160,  t168## $r0.8(skipped)
	c0    ldw $r0.7 = 0x4[$r0.1]   ## bblock 3, line 200, t105, t119
	c0    shru $r0.9 = $r0.4, $r0.5   ## bblock 3, line 201,  t215,  t162(I16),  t217
	c0    mtb $b0.1 = $r0.5   ## t217
;;								## 1
	   ## bblock 15, line 0,  t166,  t174## $r0.10(skipped)
;;								## 2
L6?3:
	c0    add $r0.8 = $r0.8, $r0.10   ## bblock 3, line 0,  t185,  t160,  t166
	c0    shru $r0.2 = $r0.2, 16   ## bblock 3, line 200,  t104(I16),  t103,  16(SI32)
;;								## 3
	c0    shl $r0.7 = $r0.7, 16   ## bblock 3, line 200,  t106,  t105,  16(SI32)
;;								## 4
	c0    or $r0.2 = $r0.2, $r0.7   ## bblock 3, line 200,  t112,  t104(I16),  t106
;;								## 5
	c0    stw 0x4[$r0.1] = $r0.2   ## bblock 3, line 200, t119, t112
	c0    shru $r0.5 = $r0.2, $r0.5   ## bblock 3, line 201,  t214,  t112,  t217
	c0    cmpgeu $r0.4 = $r0.2, $r0.4   ## bblock 3, line 201,  t223,  t112,  t162(I16)
	c0    cmpgtu $b0.2 = $r0.6, $r0.2   ## bblock 3, line 201,  t224(I1),  t110,  t112
;;								## 6
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.0   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  0(I32)
;;								## 7
	c0    divs $r0.6, $b0.3 = $r0.0, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  0(I32),  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.0   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  0(I32)
;;								## 8
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 9
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 10
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 11
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 12
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 13
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 14
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 15
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 16
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 17
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 18
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 19
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 20
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 21
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 22
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 23
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 24
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 25
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 26
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 27
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 28
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 29
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 30
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 31
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 32
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 33
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 34
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 35
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 36
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 37
	c0    divs $r0.6, $b0.3 = $r0.6, $r0.9, $b0.3   ## bblock 3, line 201,  t216,  t218(I1),  t216,  t215,  t218(I1)
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
;;								## 38
	c0    divs $r0.6, $b0.4 = $r0.6, $r0.9, $b0.4   ## bblock 3, line 201,  t216,  t219(I1),  t216,  t215,  t219(I1)
	c0    addcg $r0.2, $b0.3 = $r0.5, $r0.5, $b0.3   ## bblock 3, line 201,  t214,  t218(I1),  t214,  t214,  t218(I1)
;;								## 39
	c0    addcg $r0.5, $b0.4 = $r0.2, $r0.2, $b0.4   ## bblock 3, line 201,  t214,  t219(I1),  t214,  t214,  t219(I1)
	c0    cmpge $r0.6 = $r0.6, $r0.0   ## bblock 3, line 201,  t220,  t216,  0(I32)
;;								## 40
	c0    orc $r0.5 = $r0.5, $r0.0   ## bblock 3, line 201,  t221,  t214,  0(I32)
;;								## 41
	c0    sh1add $r0.5 = $r0.5, $r0.6   ## bblock 3, line 201,  t222,  t221,  t220
;;								## 42
	c0    slct $r0.4 = $b0.1, $r0.4, $r0.5   ## bblock 3, line 201,  t114,  t217,  t223,  t222
;;								## 43
	c0    slct $r0.4 = $b0.2, $r0.4, 65535   ## bblock 3, line 201,  t115,  t224(I1),  t114,  65535(SI32)
;;								## 44
.return ret($r0.3:u32)
	c0    or $r0.3 = $r0.8, $r0.4   ## bblock 3, line 201,  t117,  t185,  t115
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 3, line 202,  t119,  ?2.1?2auto_size(I32),  t118
;;								## 45
.endp
.section .bss
.section .data
.equ _?1PACKET.8, 0x0
.equ _?1PACKET.7, 0x4
.equ _?1PACKET.10, 0x8
.equ _?1PACKET.9, 0xc
.section .data
.section .text
.equ ?2.1?2auto_size, 0x20
 ## End estimateDiv64To32
 ## Begin countLeadingZeros32
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32)
countLeadingZeros32:
.trace 1
	      ## auto_size == 0
	c0    cmpgeu $b0.0 = $r0.3, 65536   ## bblock 0, line 228,  t31(I1),  t37,  65536(SI32)
;;								## 0
	c0    shl $r0.2 = $r0.3, 16   ## bblock 0, line 230,  t32,  t37,  16(SI32)
	c0    slct $r0.4 = $b0.0, $r0.0, 16   ## bblock 0, line 229,  t39,  t31(I1),  0(SI32),  16(SI32)
;;								## 1
	c0    slct $r0.3 = $b0.0, $r0.3, $r0.2   ## bblock 0, line 230,  t38,  t31(I1),  t37,  t32
	c0    add $r0.2 = $r0.4, 8   ## bblock 0, line 233,  t36,  t39,  8(SI32)
;;								## 2
	c0    cmpgeu $b0.0 = $r0.3, 16777216   ## bblock 0, line 232,  t34(I1),  t38,  16777216(SI32)
	c0    shl $r0.5 = $r0.3, 8   ## bblock 0, line 234,  t35,  t38,  8(SI32)
;;								## 3
	c0    slct $r0.3 = $b0.0, $r0.3, $r0.5   ## bblock 0, line 234,  t29,  t34(I1),  t38,  t35
	c0    slct $r0.4 = $b0.0, $r0.4, $r0.2   ## bblock 0, line 233,  t30,  t34(I1),  t39,  t36
;;								## 4
	c0    shru $r0.3 = $r0.3, 24   ## bblock 0, line 236,  t13(I8),  t29,  24(SI32)
;;								## 5
	c0    sh2add $r0.3 = $r0.3, (_?1PACKET.37 + 0)   ## bblock 0, line 236,  t40,  t13(I8),  addr(countLeadingZerosHigh?1.8)(P32)
;;								## 6
	c0    ldw $r0.3 = 0[$r0.3]   ## bblock 0, line 236, t14, t40
	      xnop 2
;;								## 9
.return ret($r0.3:s32)
	c0    add $r0.3 = $r0.4, $r0.3   ## bblock 0, line 236,  t16,  t30,  t14
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 237,  t18,  ?2.2?2auto_size(I32),  t17
;;								## 10
.endp
.section .bss
.section .data
_?1PACKET.37:
    .data4 8
    .data4 7
    .data4 6
    .data4 6
    .data4 5
    .data4 5
    .data4 5
    .data4 5
    .data4 4
    .data4 4
    .data4 4
    .data4 4
    .data4 4
    .data4 4
    .data4 4
    .data4 4
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 3
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 2
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 1
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
    .data4 0
.section .data
.section .text
.equ ?2.2?2auto_size, 0x0
 ## End countLeadingZeros32
 ## Begin float_raise
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32)
float_raise:
.trace 1
	      ## auto_size == 0
	c0    ldw $r0.2 = ((_?1PACKET.3 + 0) + 0)[$r0.0]   ## bblock 0, line 240, t0, 0(I32)
	      xnop 2
;;								## 2
	c0    or $r0.3 = $r0.3, $r0.2   ## bblock 0, line 242,  t15,  t1,  t0
;;								## 3
.return ret()
	c0    stw ((_?1PACKET.3 + 0) + 0)[$r0.0] = $r0.3   ## bblock 0, line 248, 0(I32), t15
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 248,  t4,  ?2.3?2auto_size(I32),  t3
;;								## 4
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.3?2auto_size, 0x0
 ## End float_raise
 ## Begin float32ToCommonNaN
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
float32ToCommonNaN:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.2 = $r0.3, 22   ## bblock 0, line 256,  t1(I10),  t25,  22(SI32)
	c0    shru $r0.6 = $r0.3, 31   ## [spec] bblock 1, line 258,  t10(I1),  t25,  31(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, 511   ## bblock 0, line 256,  t2,  t1(I10),  511(I32)
	c0    shl $r0.4 = $r0.3, 9   ## [spec] bblock 1, line 260,  t11,  t25,  9(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t13
;;								## 1
	c0    cmpeq $r0.2 = $r0.2, 510   ## bblock 0, line 256,  t3,  t2,  510(SI32)
	c0    and $r0.7 = $r0.3, 4194303   ## bblock 0, line 256,  t5,  t25,  4194303(I32)
;;								## 2
	c0    andl $b0.0 = $r0.2, $r0.7   ## bblock 0, line 256,  t29(I1),  t3,  t5
	c0    mov $r0.5 = $r0.0   ## 0(SI32)
	c0    mov $r0.8 = $r0.3   ## t25
;;								## 3
	c0    mov $r0.3 = $r0.6   ## [spec] t10(I1)
;;								## 4
	c0    br $b0.0, L7?3   ## bblock 0, line 256,  t29(I1)
;;								## 5
L8?3:
.return ret($r0.3:s32,$r0.4:u32,$r0.5:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 261,  t14,  ?2.4?2auto_size(I32),  t13
;;								## 6
.trace 2
L7?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 2, line 257,  raddr(float_raise)(P32),  16(SI32)
	c0    stw 0x14[$r0.1] = $r0.8  ## spill ## t25
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    mov $r0.5 = $r0.0   ## 0(SI32)
	c0    ldw $r0.2 = 0x14[$r0.1]  ## restore ## t25
;;								## 1
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t13
	      xnop 1
;;								## 3
	c0    shru $r0.3 = $r0.2, 31   ## bblock 1, line 258,  t10(I1),  t25,  31(SI32)
	c0    shl $r0.4 = $r0.2, 9   ## bblock 1, line 260,  t11,  t25,  9(SI32)
;;								## 4
	c0    goto L8?3 ## goto
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.4?2scratch.0, 0x0
.equ ?2.4?2ras_p, 0x10
.equ ?2.4?2spill_p, 0x14
.section .data
.section .text
.equ ?2.4?2auto_size, 0x20
 ## End float32ToCommonNaN
 ## Begin propagateFloat32NaN
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32)
propagateFloat32NaN:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    shl $r0.2 = $r0.4, 1   ## bblock 0, line 270,  t11,  t22,  1(SI32)
	c0    shru $r0.5 = $r0.4, 22   ## bblock 0, line 271,  t14(I10),  t22,  22(SI32)
;;								## 0
	c0    cmpgtu $r0.2 = $r0.2, (~0xffffff)   ## bblock 0, line 270,  t52,  t11,  (~0xffffff)(I32)
	c0    shru $r0.6 = $r0.3, 22   ## bblock 0, line 269,  t4(I10),  t20,  22(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t36
;;								## 1
	c0    or $r0.7 = $r0.3, 4194304   ## bblock 0, line 272,  t49,  t20,  4194304(I32)
	c0    or $r0.8 = $r0.4, 4194304   ## bblock 0, line 273,  t50,  t22,  4194304(I32)
;;								## 2
	c0    and $r0.5 = $r0.5, 511   ## bblock 0, line 271,  t15,  t14(I10),  511(I32)
	c0    and $r0.4 = $r0.4, 4194303   ## bblock 0, line 271,  t18,  t22,  4194303(I32)
;;								## 3
	c0    and $r0.6 = $r0.6, 511   ## bblock 0, line 269,  t5,  t4(I10),  511(I32)
	c0    cmpeq $r0.5 = $r0.5, 510   ## bblock 0, line 271,  t16,  t15,  510(SI32)
;;								## 4
	c0    cmpeq $r0.6 = $r0.6, 510   ## bblock 0, line 269,  t6,  t5,  510(SI32)
	c0    andl $r0.5 = $r0.5, $r0.4   ## bblock 0, line 271,  t51,  t16,  t18
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## [spec] bblock 1, line 279,  t59(I1),  t52,  0(SI32)
;;								## 5
	c0    and $r0.3 = $r0.3, 4194303   ## bblock 0, line 269,  t8,  t20,  4194303(I32)
	c0    slct $r0.4 = $b0.0, $r0.8, $r0.7   ## [spec] bblock 1, line 279,  t33,  t59(I1),  t50,  t49
	c0    cmpne $b0.1 = $r0.5, $r0.0   ## [spec] bblock 1, line 279,  t61(I1),  t51,  0(SI32)
;;								## 6
	c0    andl $r0.6 = $r0.6, $r0.3   ## bblock 0, line 269,  t53,  t6,  t8
;;								## 7
	c0    or $r0.9 = $r0.5, $r0.6   ## bblock 0, line 277,  t57,  t51,  t53
	c0    cmpne $b0.0 = $r0.6, $r0.0   ## [spec] bblock 1, line 279,  t60(I1),  t53,  0(SI32)
;;								## 8
	c0    cmpne $b0.2 = $r0.9, $r0.0   ## bblock 0, line 277,  t58,  t57,  0(I32)
	c0    slct $r0.4 = $b0.0, $r0.7, $r0.4   ## [spec] bblock 1, line 279,  t34,  t60(I1),  t49,  t33
;;								## 9
	c0    slct $r0.3 = $b0.1, $r0.8, $r0.4   ## [spec] bblock 1, line 279,  t35,  t61(I1),  t50,  t34
;;								## 10
	c0    br $b0.2, L9?3   ## bblock 0, line 277,  t58
;;								## 11
L10?3:
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 1, line 279,  t37,  ?2.5?2auto_size(I32),  t36
;;								## 12
.trace 2
L9?3:
	c0    stw 0x14[$r0.1] = $r0.5  ## spill ## t51
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    stw 0x18[$r0.1] = $r0.6  ## spill ## t53
;;								## 1
	c0    stw 0x1c[$r0.1] = $r0.7  ## spill ## t49
;;								## 2
	c0    stw 0x20[$r0.1] = $r0.8  ## spill ## t50
;;								## 3
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 2, line 278,  raddr(float_raise)(P32),  16(SI32)
	c0    stw 0x24[$r0.1] = $r0.2  ## spill ## t52
;;								## 4
	c0    ldw $r0.2 = 0x24[$r0.1]  ## restore ## t52
;;								## 5
	c0    ldw $r0.7 = 0x1c[$r0.1]  ## restore ## t49
;;								## 6
	c0    ldw $r0.8 = 0x20[$r0.1]  ## restore ## t50
;;								## 7
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 1, line 279,  t59(I1),  t52,  0(SI32)
	c0    ldw $r0.6 = 0x18[$r0.1]  ## restore ## t53
;;								## 8
	c0    ldw $r0.5 = 0x14[$r0.1]  ## restore ## t51
;;								## 9
	c0    slct $r0.4 = $b0.0, $r0.8, $r0.7   ## bblock 1, line 279,  t33,  t59(I1),  t50,  t49
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t36
;;								## 10
	c0    cmpne $b0.0 = $r0.6, $r0.0   ## bblock 1, line 279,  t60(I1),  t53,  0(SI32)
;;								## 11
	c0    slct $r0.4 = $b0.0, $r0.7, $r0.4   ## bblock 1, line 279,  t34,  t60(I1),  t49,  t33
	c0    cmpne $b0.0 = $r0.5, $r0.0   ## bblock 1, line 279,  t61(I1),  t51,  0(SI32)
;;								## 12
	c0    slct $r0.3 = $b0.0, $r0.8, $r0.4   ## bblock 1, line 279,  t35,  t61(I1),  t50,  t34
	c0    goto L10?3 ## goto
;;								## 13
.endp
.section .bss
.section .data
.equ ?2.5?2scratch.0, 0x0
.equ ?2.5?2ras_p, 0x10
.equ ?2.5?2spill_p, 0x14
.section .data
.section .text
.equ ?2.5?2auto_size, 0x40
 ## End propagateFloat32NaN
 ## Begin float64ToCommonNaN
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32)
float64ToCommonNaN:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    shru $r0.2 = $r0.3, 19   ## bblock 0, line 294,  t1(I13),  t47,  19(SI32)
	c0    shru $r0.6 = $r0.3, 31   ## [spec] bblock 1, line 297,  t31,  t47,  31(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, 4095   ## bblock 0, line 294,  t2,  t1(I13),  4095(I32)
	c0    shl $r0.5 = $r0.4, 12   ## [spec] bblock 1, line 304,  t33,  t48,  12(SI32)
	c0    stw 0x1c[$r0.1] = $l0.0  ## spill ## t34
;;								## 1
	c0    cmpeq $r0.2 = $r0.2, 4094   ## bblock 0, line 294,  t3,  t2,  4094(SI32)
	c0    and $r0.7 = $r0.3, 524287   ## bblock 0, line 295,  t6,  t47,  524287(I32)
;;								## 2
	c0    orl $r0.7 = $r0.4, $r0.7   ## bblock 0, line 295,  t7,  t48,  t6
	c0    shl $r0.8 = $r0.3, 12   ## [spec] bblock 1, line 306,  t27,  t47,  12(SI32)
	c0    shru $r0.9 = $r0.4, 20   ## [spec] bblock 1, line 306,  t24(I12),  t48,  20(I32)
	c0    mov $r0.10 = $r0.3   ## t47
;;								## 3
	c0    andl $b0.0 = $r0.2, $r0.7   ## bblock 0, line 295,  t55(I1),  t3,  t7
	c0    or $r0.8 = $r0.8, $r0.9   ## [spec] bblock 1, line 306,  t32,  t27,  t24(I12)
	c0    mov $r0.3 = $r0.6   ## [spec] t31
;;								## 4
	c0    mov $r0.9 = $r0.4   ## t48
;;								## 5
	c0    mov $r0.4 = $r0.8   ## [spec] t32
	c0    br $b0.0, L11?3   ## bblock 0, line 295,  t55(I1)
;;								## 6
L12?3:
	c0    stw 0x10[$r0.1] = $r0.6   ## bblock 1, line 297, t35, t31
;;								## 7
	c0    stw 0x18[$r0.1] = $r0.5   ## bblock 1, line 304, t35, t33
;;								## 8
.return ret($r0.3:s32,$r0.4:u32,$r0.5:u32)
	c0    stw 0x14[$r0.1] = $r0.8   ## bblock 1, line 305, t35, t32
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 1, line 308,  t35,  ?2.6?2auto_size(I32),  t34
;;								## 9
.trace 2
L11?3:
	c0    stw 0x20[$r0.1] = $r0.9  ## spill ## t48
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 2, line 296,  raddr(float_raise)(P32),  16(SI32)
	c0    stw 0x24[$r0.1] = $r0.10  ## spill ## t47
;;								## 1
	c0    ldw $r0.2 = 0x24[$r0.1]  ## restore ## t47
;;								## 2
	c0    ldw $r0.7 = 0x20[$r0.1]  ## restore ## t48
;;								## 3
	c0    ldw $l0.0 = 0x1c[$r0.1]  ## restore ## t34
;;								## 4
	c0    shru $r0.3 = $r0.2, 31   ## bblock 1, line 297,  t31,  t47,  31(SI32)
	c0    shl $r0.9 = $r0.2, 12   ## bblock 1, line 306,  t27,  t47,  12(SI32)
;;								## 5
	c0    shl $r0.5 = $r0.7, 12   ## bblock 1, line 304,  t33,  t48,  12(SI32)
	c0    shru $r0.2 = $r0.7, 20   ## bblock 1, line 306,  t24(I12),  t48,  20(I32)
	c0    mov $r0.6 = $r0.3   ## t31
;;								## 6
	c0    or $r0.4 = $r0.9, $r0.2   ## bblock 1, line 306,  t32,  t27,  t24(I12)
;;								## 7
	c0    mov $r0.8 = $r0.4   ## t32
	c0    goto L12?3 ## goto
;;								## 8
.endp
.section .bss
.section .data
.equ ?2.6?2scratch.0, 0x0
.equ _?1PACKET.44, 0x10
.equ ?2.6?2ras_p, 0x1c
.equ ?2.6?2spill_p, 0x20
.section .data
.section .text
.equ ?2.6?2auto_size, 0x40
 ## End float64ToCommonNaN
 ## Begin commonNaNToFloat64
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:s32,$r0.4:u32,$r0.5:u32)
commonNaNToFloat64:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.2 = $r0.4, 12   ## bblock 0, line 329,  t31,  t61,  12(I32)
	c0    shl $r0.3 = $r0.3, 31   ## bblock 0, line 338,  t33,  t51,  31(SI32)
;;								## 0
	c0    shru $r0.5 = $r0.5, 12   ## bblock 0, line 328,  t63(I20),  t60,  12(I32)
	c0    shl $r0.4 = $r0.4, 20   ## bblock 0, line 328,  t65,  t61,  20(I32)
	c0    or $r0.2 = $r0.2, 2146959360   ## bblock 0, line 338,  t71,  t31,  2146959360(I32)
;;								## 1
	c0    or $r0.4 = $r0.5, $r0.4   ## bblock 0, line 328,  t36,  t63(I20),  t65
	c0    or $r0.3 = $r0.2, $r0.3   ## bblock 0, line 338,  t35,  t71,  t33
;;								## 2
	c0    stw 0[$r0.1] = $r0.3   ## bblock 0, line 338, t38, t35
;;								## 3
.return ret($r0.3:u32,$r0.4:u32)
	c0    stw 0x4[$r0.1] = $r0.4   ## bblock 0, line 335, t38, t36
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 0, line 339,  t38,  ?2.7?2auto_size(I32),  t37
;;								## 4
.endp
.section .bss
.section .data
.equ _?1PACKET.50, 0x0
.section .data
.section .text
.equ ?2.7?2auto_size, 0x20
 ## End commonNaNToFloat64
 ## Begin propagateFloat64NaN
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
propagateFloat64NaN:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    shl $r0.2 = $r0.5, 1   ## bblock 0, line 350,  t18,  t36,  1(SI32)
	c0    shru $r0.7 = $r0.5, 19   ## bblock 0, line 352,  t26(I13),  t36,  19(SI32)
;;								## 0
	c0    cmpgeu $r0.2 = $r0.2, (~0x1fffff)   ## bblock 0, line 350,  t19,  t18,  (~0x1fffff)(I32)
	c0    shru $r0.8 = $r0.3, 19   ## bblock 0, line 348,  t9(I13),  t34,  19(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t51
;;								## 1
	c0    and $r0.9 = $r0.5, 1048575   ## bblock 0, line 351,  t22,  t36,  1048575(I32)
	c0    or $r0.10 = $r0.3, 524288   ## bblock 0, line 354,  t66,  t34,  524288(I32)
;;								## 2
	c0    orl $r0.9 = $r0.6, $r0.9   ## bblock 0, line 351,  t23,  t69,  t22
	c0    and $r0.7 = $r0.7, 4095   ## bblock 0, line 352,  t27,  t26(I13),  4095(I32)
	c0    mov $r0.11 = $r0.3   ## t34
;;								## 3
	c0    andl $r0.2 = $r0.2, $r0.9   ## bblock 0, line 351,  t71,  t19,  t23
	c0    or $r0.3 = $r0.5, 524288   ## bblock 0, line 355,  t68,  t36,  524288(I32)
;;								## 4
	c0    cmpeq $r0.7 = $r0.7, 4094   ## bblock 0, line 352,  t28,  t27,  4094(SI32)
	c0    and $r0.5 = $r0.5, 524287   ## bblock 0, line 353,  t31,  t36,  524287(I32)
;;								## 5
	c0    and $r0.8 = $r0.8, 4095   ## bblock 0, line 348,  t10,  t9(I13),  4095(I32)
	c0    orl $r0.5 = $r0.6, $r0.5   ## bblock 0, line 353,  t32,  t69,  t31
;;								## 6
	c0    cmpeq $r0.8 = $r0.8, 4094   ## bblock 0, line 348,  t11,  t10,  4094(SI32)
	c0    andl $r0.7 = $r0.7, $r0.5   ## bblock 0, line 353,  t70,  t28,  t32
;;								## 7
	c0    and $r0.11 = $r0.11, 524287   ## bblock 0, line 349,  t14,  t34,  524287(I32)
	c0    cmpne $b0.0 = $r0.7, $r0.0   ## [spec] bblock 1, line 361,  t82(I1),  t70,  0(SI32)
;;								## 8
	c0    orl $r0.11 = $r0.4, $r0.11   ## bblock 0, line 349,  t15,  t67,  t14
	c0    mov $r0.5 = $r0.4   ## t67
;;								## 9
	c0    andl $r0.8 = $r0.8, $r0.11   ## bblock 0, line 349,  t72,  t11,  t15
	c0    mov $r0.4 = $r0.6   ## t69
;;								## 10
	c0    or $r0.6 = $r0.7, $r0.8   ## bblock 0, line 359,  t80,  t70,  t72
;;								## 11
	c0    cmpne $b0.1 = $r0.6, $r0.0   ## bblock 0, line 359,  t81,  t80,  0(I32)
	      xnop 1
;;								## 13
	c0    br $b0.1, L13?3   ## bblock 0, line 359,  t81
;;								## 14
L14?3:
	c0    brf $b0.0, L15?3   ## bblock 1, line 361,  t82(I1)
;;								## 15
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 7, line 361,  t52,  ?2.8?2auto_size(I32),  t51
;;								## 16
.trace 2
L15?3:
	c0    cmpne $b0.0 = $r0.8, $r0.0   ## bblock 2, line 361,  t83(I1),  t72,  0(SI32)
	c0    mov $r0.4 = $r0.5   ## t67
	c0    mov $r0.6 = $r0.4   ## t69
	c0    mov $r0.5 = $r0.3   ## t68
;;								## 0
	c0    mov $r0.3 = $r0.10   ## t66
;;								## 1
	c0    brf $b0.0, L16?3   ## bblock 2, line 361,  t83(I1)
;;								## 2
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 6, line 361,  t52,  ?2.8?2auto_size(I32),  t51
;;								## 3
.trace 3
L16?3:
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 3, line 361,  t84(I1),  t71,  0(SI32)
	c0    mov $r0.4 = $r0.6   ## t69
	c0    mov $r0.2 = $r0.4   ## t67
	c0    mov $r0.10 = $r0.3   ## t66
;;								## 0
	c0    mov $r0.3 = $r0.5   ## t68
;;								## 1
	c0    brf $b0.0, L17?3   ## bblock 3, line 361,  t84(I1)
;;								## 2
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 5, line 361,  t52,  ?2.8?2auto_size(I32),  t51
;;								## 3
.trace 4
L17?3:
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 4, line 361,  t52,  ?2.8?2auto_size(I32),  t51
	c0    mov $r0.4 = $r0.2   ## t67
	c0    mov $r0.3 = $r0.10   ## t66
;;								## 0
.trace 5
L13?3:
	c0    stw 0x14[$r0.1] = $r0.5  ## spill ## t67
;;								## 0
	c0    stw 0x18[$r0.1] = $r0.4  ## spill ## t69
;;								## 1
	c0    stw 0x1c[$r0.1] = $r0.3  ## spill ## t68
;;								## 2
	c0    stw 0x20[$r0.1] = $r0.10  ## spill ## t66
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 3
	c0    stw 0x24[$r0.1] = $r0.8  ## spill ## t72
;;								## 4
	c0    stw 0x28[$r0.1] = $r0.2  ## spill ## t71
;;								## 5
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 8, line 360,  raddr(float_raise)(P32),  16(SI32)
	c0    stw 0x2c[$r0.1] = $r0.7  ## spill ## t70
;;								## 6
	c0    ldw $r0.7 = 0x2c[$r0.1]  ## restore ## t70
;;								## 7
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t51
;;								## 8
	c0    ldw $r0.5 = 0x14[$r0.1]  ## restore ## t67
;;								## 9
	c0    cmpne $b0.0 = $r0.7, $r0.0   ## bblock 1, line 361,  t82(I1),  t70,  0(SI32)
	c0    ldw $r0.4 = 0x18[$r0.1]  ## restore ## t69
;;								## 10
	c0    ldw $r0.3 = 0x1c[$r0.1]  ## restore ## t68
;;								## 11
	c0    ldw $r0.10 = 0x20[$r0.1]  ## restore ## t66
;;								## 12
	c0    ldw $r0.8 = 0x24[$r0.1]  ## restore ## t72
;;								## 13
	c0    ldw $r0.2 = 0x28[$r0.1]  ## restore ## t71
	      xnop 1
;;								## 15
	c0    goto L14?3 ## goto
;;								## 16
.endp
.section .bss
.section .data
.equ ?2.8?2scratch.0, 0x0
.equ ?2.8?2ras_p, 0x10
.equ ?2.8?2spill_p, 0x14
.section .data
.section .text
.equ ?2.8?2auto_size, 0x40
 ## End propagateFloat64NaN
 ## Begin roundAndPackFloat32
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.1 + 52, 12; $r0.3:s32,$r0.4:s32,$r0.5:u32)
roundAndPackFloat32:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    ldw $r0.2 = ((_?1PACKET.2 + 0) + 0)[$r0.0]   ## bblock 0, line 371, t104, 0(I32)
;;								## 0
	c0    cmpne $b0.0 = $r0.3, $r0.0   ## bblock 0, line 385,  t170(I1),  t155,  0(I32)
	c0    and $r0.6 = $r0.5, 127   ## bblock 0, line 393,  t101,  t8,  127(I32)
	c0    zxth $r0.7 = $r0.4   ## bblock 0, line 397,  t11(I16),  t10
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t82
;;								## 1
	c0    cmpge $b0.1 = $r0.7, 253   ## bblock 0, line 397,  t172(I1),  t11(I16),  253(SI32)
	c0    cmpne $b0.2 = $r0.6, $r0.0   ## [spec] bblock 2, line 432,  t173(I1),  t101,  0(SI32)
	c0    ldw.d $r0.8 = ((_?1PACKET.3 + 0) + 0)[$r0.0]   ## [spec] bblock 6, line 433, t62, 0(I32)
;;								## 2
	c0    cmpeq $r0.9 = $r0.2, $r0.0   ## bblock 0, line 372,  t103,  t104,  0(I32)
	c0    cmpeq $b0.5 = $r0.2, 3   ## bblock 0, line 378,  t151(I1),  t104,  3(SI32)
	c0    cmpeq $b0.3 = $r0.2, 2   ## bblock 0, line 384,  t156(I1),  t104,  2(SI32)
	c0    cmpeq $b0.4 = $r0.2, 1   ## bblock 0, line 388,  t159(I1),  t104,  1(SI32)
;;								## 3
	c0    slct $r0.2 = $b0.3, $r0.0, 127   ## bblock 0, line 385,  t158,  t156(I1),  0(SI32),  127(SI32)
	c0    slct $r0.7 = $b0.4, $r0.0, 127   ## bblock 0, line 389,  t161,  t159(I1),  0(SI32),  127(SI32)
	c0    cmpeq $b0.6 = $r0.9, $r0.0   ## bblock 0, line 379,  t171(I1),  t103,  0(I32)
	c0    xor $r0.10 = $r0.6, 64   ## [spec] bblock 3, line 435,  t71,  t101,  64(SI32)
;;								## 4
	c0    slct $r0.2 = $b0.0, $r0.2, $r0.7   ## bblock 0, line 385,  t162,  t170(I1),  t158,  t161
	c0    or $r0.8 = $r0.8, 1   ## [spec] bblock 6, line 433,  t63,  t62,  1(I32)
	c0    cmpeq $r0.10 = $r0.10, $r0.0   ## [spec] bblock 3, line 435,  t72,  t71,  0(I32)
;;								## 5
	c0    stw 0x34[$r0.1] = $r0.3   ## bblock 0, line 364, t83, t155
	c0    slctf $r0.2 = $b0.5, $r0.2, $r0.0   ## bblock 0, line 379,  t163,  t151(I1),  t162,  0(SI32)
	c0    and $r0.10 = $r0.9, $r0.10   ## [spec] bblock 3, line 435,  t174,  t103,  t72
;;								## 6
	c0    slct $r0.2 = $b0.6, $r0.2, 64   ## bblock 0, line 379,  t102,  t171(I1),  t163,  64(SI32)
	c0    orc $r0.10 = $r0.10, $r0.0   ## [spec] bblock 3, line 435,  t73,  t174,  0(I32)
	c0    ldw.d $r0.7 = 0x34[$r0.1]   ## [spec] bblock 4, line 438, t79, t83
;;								## 7
	c0    stw 0x38[$r0.1] = $r0.4   ## bblock 0, line 364, t83, t10
;;								## 8
	c0    stw 0x3c[$r0.1] = $r0.5   ## bblock 0, line 364, t83, t8
	c0    br $b0.1, L18?3   ## bblock 0, line 397,  t172(I1)
;;								## 9
L19?3:
	c0    ldw.d $r0.4 = 0x3c[$r0.1]   ## [spec] bblock 3, line 434, t65, t83
	c0    shl $r0.7 = $r0.7, 31   ## [spec] bblock 4, line 438,  t80,  t79,  31(SI32)
	c0    brf $b0.2, L20?3   ## bblock 2, line 432,  t173(I1)
;;								## 10
	c0    stw ((_?1PACKET.3 + 0) + 0)[$r0.0] = $r0.8   ## bblock 6, line 433, 0(I32), t63
;;								## 11
L21?3:
;;								## 12
	c0    add $r0.4 = $r0.4, $r0.2   ## bblock 3, line 434,  t66,  t65,  t102
;;								## 13
	c0    shru $r0.4 = $r0.4, 7   ## bblock 3, line 434,  t68(I25),  t66,  7(SI32)
;;								## 14
	c0    and $r0.4 = $r0.4, $r0.10   ## bblock 3, line 435,  t75,  t68(I25),  t73
;;								## 15
	c0    stw 0x3c[$r0.1] = $r0.4   ## bblock 3, line 435, t83, t75
	c0    cmpeq $b0.0 = $r0.4, $r0.0   ## bblock 3, line 436,  t175(I1),  t75,  0(SI32)
;;								## 16
	c0    ldw.d $r0.2 = 0x3c[$r0.1]   ## [spec] bblock 4, line 438, t76, t83
;;								## 17
	c0    brf $b0.0, L22?3   ## bblock 3, line 436,  t175(I1)
;;								## 18
	c0    stw 0x38[$r0.1] = $r0.0   ## bblock 5, line 437, t83, 0(SI32)
;;								## 19
L23?3:
	c0    ldw $r0.4 = 0x38[$r0.1]   ## bblock 4, line 438, t77, t83
	c0    add $r0.2 = $r0.2, $r0.7   ## bblock 4, line 438,  t176,  t76,  t80
	      xnop 2
;;								## 22
	c0    shl $r0.4 = $r0.4, 23   ## bblock 4, line 438,  t78,  t77,  23(SI32)
;;								## 23
.return ret($r0.3:u32)
	c0    add $r0.3 = $r0.2, $r0.4   ## bblock 4, line 438,  t81,  t176,  t78
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 4, line 438,  t83,  ?2.9?2auto_size(I32),  t82
;;								## 24
.trace 2
L22?3:
	c0    goto L23?3 ## goto
;;								## 0
.trace 3
L20?3:
	      xnop 1
;;								## 1
	c0    ldw.d $r0.4 = 0x3c[$r0.1]   ## [spec] bblock 3, line 434, t65, t83
;;								## 2
	c0    goto L21?3 ## goto
;;								## 3
.trace 4
L18?3:
	c0    cmpgt $r0.4 = $r0.4, 253   ## bblock 7, line 398,  t13,  t10,  253(SI32)
	c0    cmpeq $r0.11 = $r0.4, 253   ## bblock 7, line 399,  t15,  t10,  253(SI32)
	c0    add $r0.5 = $r0.5, $r0.2   ## bblock 7, line 400,  t18,  t8,  t102
	c0    stw 0x14[$r0.1] = $r0.2  ## spill ## t102
;;								## 0
	c0    cmplt $r0.5 = $r0.5, $r0.0   ## bblock 7, line 400,  t19,  t18,  0(SI32)
	c0    mov $r0.3 = 5   ## 5(SI32)
;;								## 1
	c0    andl $r0.11 = $r0.11, $r0.5   ## bblock 7, line 400,  t20,  t15,  t19
;;								## 2
	c0    orl $b0.0 = $r0.4, $r0.11   ## bblock 7, line 401,  t178(I1),  t13,  t20
	      xnop 1
;;								## 4
	c0    brf $b0.0, L24?3   ## bblock 7, line 401,  t178(I1)
;;								## 5
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 16, line 402,  raddr(float_raise)(P32),  5(SI32)
;;								## 6
	c0    ldw $r0.4 = 0x34[$r0.1]   ## bblock 17, line 403, t23, t83
;;								## 7
	c0    ldw $r0.2 = 0x14[$r0.1]  ## restore ## t102
;;								## 8
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t82
;;								## 9
	c0    shl $r0.4 = $r0.4, 31   ## bblock 17, line 403,  t24,  t23,  31(SI32)
;;								## 10
	c0    cmpeq $r0.2 = $r0.2, $r0.0   ## bblock 17, line 404,  t22,  t102,  0(I32)
	c0    add $r0.4 = $r0.4, 2139095040   ## bblock 17, line 404,  t184,  t24,  2139095040(I32)
;;								## 11
	c0    sub $r0.3 = $r0.4, $r0.2   ## bblock 17, line 404,  t25,  t184,  t22
;;								## 12
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 17, line 404,  t83,  ?2.9?2auto_size(I32),  t82
;;								## 13
.trace 5
L24?3:
	c0    mov $r0.3 = 2   ## 2(SI32)
	c0    stw 0x18[$r0.1] = $r0.9  ## spill ## t103
;;								## 0
	c0    ldw.d $r0.4 = 0x3c[$r0.1]   ## [spec] bblock 9, line 409, t121, t83
;;								## 1
	c0    ldw $r0.5 = 0x38[$r0.1]   ## bblock 8, line 406, t26, t83
;;								## 2
	c0    ldw $r0.2 = 0x14[$r0.1]  ## restore ## t102
;;								## 3
	c0    ldw.d $r0.12 = ((_?1PACKET.1 + 0) + 0)[$r0.0]   ## [spec] bblock 9, line 407, t27, 0(I32)
	c0    cmpne $r0.11 = $r0.4, $r0.0   ## [spec] bblock 9, line 422,  t129,  t121,  0(I32)
;;								## 4
	c0    cmplt $b0.0 = $r0.5, $r0.0   ## bblock 8, line 406,  t179(I1),  t26,  0(SI32)
	c0    sub $r0.13 = $r0.0, $r0.5   ## [spec] bblock 9, line 415,  t120,  0(I32),  t26
	c0    cmplt $r0.5 = $r0.5, -1   ## [spec] bblock 9, line 408,  t30,  t26,  -1(SI32)
;;								## 5
	c0    sub $r0.14 = $r0.0, $r0.13   ## [spec] bblock 9, line 419,  t123,  0(I32),  t120
	c0    shru $r0.15 = $r0.4, $r0.13   ## [spec] bblock 9, line 419,  t124,  t121,  t120
	c0    cmpge $b0.1 = $r0.13, 32   ## [spec] bblock 9, line 418,  t122(I1),  t120,  32(SI32)
	c0    cmpeq $b0.3 = $r0.13, $r0.0   ## [spec] bblock 9, line 409,  t182(I1),  t120,  0(I32)
;;								## 6
	c0    cmpeq $r0.12 = $r0.12, 1   ## [spec] bblock 9, line 407,  t28,  t27,  1(SI32)
	c0    add $r0.2 = $r0.4, $r0.2   ## [spec] bblock 9, line 409,  t33,  t121,  t102
	c0    and $r0.14 = $r0.14, 31   ## [spec] bblock 9, line 419,  t125,  t123,  31(I32)
	c0    brf $b0.0, L25?3   ## bblock 8, line 406,  t179(I1)
;;								## 7
	c0    cmpltu $r0.2 = $r0.2, (~0x7fffffff)   ## bblock 9, line 409,  t34,  t33,  (~0x7fffffff)(I32)
	c0    shl $r0.14 = $r0.4, $r0.14   ## bblock 9, line 419,  t126,  t121,  t125
;;								## 8
	c0    orl $r0.12 = $r0.12, $r0.2   ## bblock 9, line 409,  t180,  t28,  t34
	c0    cmpne $r0.14 = $r0.14, $r0.0   ## bblock 9, line 419,  t127,  t126,  0(I32)
	c0    stw 0x38[$r0.1] = $r0.0   ## bblock 9, line 426, t83, 0(SI32)
;;								## 9
	c0    orl $r0.12 = $r0.12, $r0.5   ## bblock 9, line 409,  t100,  t180,  t30
	c0    or $r0.15 = $r0.15, $r0.14   ## bblock 9, line 419,  t128,  t124,  t127
;;								## 10
	c0    slct $r0.11 = $b0.1, $r0.11, $r0.15   ## bblock 9, line 419,  t130,  t122(I1),  t129,  t128
;;								## 11
	c0    slct $r0.4 = $b0.3, $r0.4, $r0.11   ## bblock 9, line 409,  t57,  t182(I1),  t121,  t130
;;								## 12
	c0    stw 0x3c[$r0.1] = $r0.4   ## bblock 9, line 424, t83, t57
	c0    and $r0.6 = $r0.4, 127   ## bblock 9, line 427,  t101,  t57,  127(I32)
;;								## 13
	c0    andl $b0.0 = $r0.12, $r0.6   ## bblock 9, line 428,  t183(I1),  t100,  t101
	c0    stw 0x1c[$r0.1] = $r0.6  ## spill ## t101
	      xnop 1
;;								## 15
	c0    brf $b0.0, L26?3   ## bblock 9, line 428,  t183(I1)
;;								## 16
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 13, line 429,  raddr(float_raise)(P32),  2(SI32)
;;								## 17
	c0    ldw.d $r0.3 = ((_?1PACKET.3 + 0) + 0)[$r0.0]   ## [spec] bblock 6, line 433, t62, 0(I32)
;;								## 18
	c0    ldw $r0.6 = 0x1c[$r0.1]  ## restore ## t101
;;								## 19
	c0    ldw $r0.9 = 0x18[$r0.1]  ## restore ## t103
;;								## 20
	c0    or $r0.8 = $r0.3, 1   ## [spec] bblock 6, line 433,  t63,  t62,  1(I32)
	c0    ldw.d $r0.7 = 0x34[$r0.1]   ## [spec] bblock 4, line 438, t79, t83
;;								## 21
	c0    cmpne $b0.2 = $r0.6, $r0.0   ## bblock 2, line 432,  t173(I1),  t101,  0(SI32)
	c0    xor $r0.3 = $r0.6, 64   ## [spec] bblock 3, line 435,  t71,  t101,  64(SI32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t82
;;								## 22
	c0    cmpeq $r0.3 = $r0.3, $r0.0   ## [spec] bblock 3, line 435,  t72,  t71,  0(I32)
	c0    ldw $r0.2 = 0x14[$r0.1]  ## restore ## t102
;;								## 23
	c0    and $r0.3 = $r0.9, $r0.3   ## [spec] bblock 3, line 435,  t174,  t103,  t72
;;								## 24
	c0    orc $r0.10 = $r0.3, $r0.0   ## [spec] bblock 3, line 435,  t73,  t174,  0(I32)
	c0    goto L19?3 ## goto
;;								## 25
.trace 7
L26?3:
	c0    ldw $r0.6 = 0x1c[$r0.1]  ## restore ## t101
;;								## 0
	c0    ldw $r0.9 = 0x18[$r0.1]  ## restore ## t103
;;								## 1
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t82
;;								## 2
	c0    cmpne $b0.2 = $r0.6, $r0.0   ## bblock 2, line 432,  t173(I1),  t101,  0(SI32)
	c0    xor $r0.3 = $r0.6, 64   ## [spec] bblock 3, line 435,  t71,  t101,  64(SI32)
	c0    ldw $r0.2 = 0x14[$r0.1]  ## restore ## t102
;;								## 3
	c0    cmpeq $r0.3 = $r0.3, $r0.0   ## [spec] bblock 3, line 435,  t72,  t71,  0(I32)
;;								## 4
	c0    and $r0.3 = $r0.9, $r0.3   ## [spec] bblock 3, line 435,  t174,  t103,  t72
;;								## 5
	c0    orc $r0.10 = $r0.3, $r0.0   ## [spec] bblock 3, line 435,  t73,  t174,  0(I32)
	c0    goto L19?3 ## goto
;;								## 6
.trace 6
L25?3:
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t82
;;								## 0
	c0    ldw $r0.2 = 0x14[$r0.1]  ## restore ## t102
;;								## 1
	c0    ldw $r0.9 = 0x18[$r0.1]  ## restore ## t103
	      xnop 1
;;								## 3
	c0    goto L19?3 ## goto
;;								## 4
.endp
.section .bss
.section .data
.equ ?2.9?2scratch.0, 0x0
.equ ?2.9?2ras_p, 0x10
.equ ?2.9?2spill_p, 0x14
.equ ?2.9?2pab_p.1, 0x34
.section .data
.section .text
.equ ?2.9?2auto_size, 0x40
 ## End roundAndPackFloat32
 ## Begin normalizeRoundAndPackFloat32
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:s32,$r0.4:s32,$r0.5:u32)
normalizeRoundAndPackFloat32:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
;;								## 0
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t11
;;								## 1
	c0    stw 0x14[$r0.1] = $r0.3  ## spill ## t25
;;								## 2
	c0    stw 0x18[$r0.1] = $r0.4  ## spill ## t26
	c0    mov $r0.3 = $r0.5   ## t27
;;								## 3
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    call $l0.0 = countLeadingZeros32   ## bblock 0, line 443,  raddr(countLeadingZeros32)(P32),  t27
	c0    stw 0x1c[$r0.1] = $r0.5  ## spill ## t27
;;								## 4
	c0    add $r0.6 = $r0.3, -1   ## bblock 1, line 443,  t9,  t0,  -1(SI32)
	c0    ldw $r0.2 = 0x18[$r0.1]  ## restore ## t26
;;								## 5
	c0    ldw $r0.7 = 0x1c[$r0.1]  ## restore ## t27
	      xnop 1
;;								## 7
	c0    add $r0.2 = $r0.2, 1   ## bblock 1, line 444,  t32,  t26,  1(SI32)
;;								## 8
	c0    sub $r0.4 = $r0.2, $r0.3   ## bblock 1, line 444,  t7,  t32,  t0
	c0    shl $r0.5 = $r0.7, $r0.6   ## bblock 1, line 444,  t10,  t27,  t9
	c0    ldw $r0.3 = 0x14[$r0.1]  ## restore ## t25
	      xnop 1
;;								## 10
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
	c0    call $l0.0 = roundAndPackFloat32   ## bblock 1, line 444,  raddr(roundAndPackFloat32)(P32),  t25,  t7,  t10
;;								## 11
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t11
	      xnop 3
;;								## 15
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 444,  t12,  ?2.10?2auto_size(I32),  t11
;;								## 16
.endp
.section .bss
.section .data
.equ ?2.10?2scratch.0, 0x0
.equ ?2.10?2ras_p, 0x10
.equ ?2.10?2spill_p, 0x14
.section .data
.section .text
.equ ?2.10?2auto_size, 0x20
 ## End normalizeRoundAndPackFloat32
.equ _?1TEMPLATEPACKET.9, 0x0
 ## Begin normalizeFloat64Subnormal
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32)
normalizeFloat64Subnormal:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    cmpeq $b0.0 = $r0.3, $r0.0   ## bblock 0, line 455,  t93(I1),  t67,  0(SI32)
	c0    mov $r0.2 = $r0.3   ## t67
;;								## 0
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t51
;;								## 1
	c0    stw 0x14[$r0.1] = $r0.7  ## spill ## t71
	c0    mov $r0.3 = $r0.4   ## t68
	c0    brf $b0.0, L27?3   ## bblock 0, line 455,  t93(I1)
;;								## 2
	c0    stw 0x18[$r0.1] = $r0.6  ## spill ## t70
;;								## 3
	c0    stw 0x1c[$r0.1] = $r0.5  ## spill ## t69
;;								## 4
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    call $l0.0 = countLeadingZeros32   ## bblock 4, line 456,  raddr(countLeadingZeros32)(P32),  t68
	c0    stw 0x20[$r0.1] = $r0.4  ## spill ## t68
;;								## 5
	c0    add $r0.2 = $r0.3, -11   ## bblock 5, line 456,  t79,  t1,  -11(SI32)
	c0    sub $r0.5 = -20, $r0.3   ## bblock 5, line 468,  t21,  -20(SI32),  t1
	c0    ldw $r0.4 = 0x20[$r0.1]  ## restore ## t68
;;								## 6
	c0    sub $r0.3 = $r0.0, $r0.2   ## bblock 5, line 459,  t83,  0(I32),  t79
	c0    cmpge $b0.0 = $r0.2, $r0.0   ## bblock 5, line 458,  t82(I1),  t79,  0(SI32)
	c0    and $r0.7 = $r0.2, 31   ## bblock 5, line 460,  t85,  t79,  31(I32)
	c0    ldw $r0.6 = 0x18[$r0.1]  ## restore ## t70
;;								## 7
	c0    ldw $r0.8 = 0x14[$r0.1]  ## restore ## t71
;;								## 8
	c0    shru $r0.3 = $r0.4, $r0.3   ## bblock 5, line 459,  t84,  t68,  t83
	c0    shl $r0.2 = $r0.4, $r0.2   ## bblock 5, line 463,  t87,  t68,  t79
	c0    shl $r0.7 = $r0.4, $r0.7   ## bblock 5, line 460,  t86,  t68,  t85
	c0    ldw $r0.9 = 0x1c[$r0.1]  ## restore ## t69
;;								## 9
	c0    slct $r0.2 = $b0.0, $r0.2, $r0.3   ## bblock 5, line 459,  t78,  t82(I1),  t87,  t84
	c0    slctf $r0.7 = $b0.0, $r0.7, $r0.0   ## bblock 5, line 460,  t77,  t82(I1),  t86,  0(SI32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t51
;;								## 10
	c0    stw 0[$r0.6] = $r0.2   ## bblock 5, line 466, t70, t78
;;								## 11
	c0    stw 0[$r0.8] = $r0.7   ## bblock 5, line 467, t71, t77
;;								## 12
	c0    stw 0[$r0.9] = $r0.5   ## bblock 5, line 468, t69, t21
;;								## 13
L28?3:
.return ret()
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 3, line 485,  t52,  ?2.11?2auto_size(I32),  t51
;;								## 14
.trace 2
L27?3:
	c0    stw 0x1c[$r0.1] = $r0.5  ## spill ## t69
	c0    mov $r0.3 = $r0.2   ## t67
;;								## 0
	c0    stw 0x18[$r0.1] = $r0.6  ## spill ## t70
;;								## 1
	c0    stw 0x20[$r0.1] = $r0.4  ## spill ## t68
;;								## 2
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    call $l0.0 = countLeadingZeros32   ## bblock 1, line 471,  raddr(countLeadingZeros32)(P32),  t67
	c0    stw 0x24[$r0.1] = $r0.2  ## spill ## t67
;;								## 3
	c0    add $r0.2 = $r0.3, -11   ## bblock 2, line 471,  t48,  t23,  -11(SI32)
	c0    sub $r0.3 = 12, $r0.3   ## bblock 2, line 483,  t49,  12(SI32),  t23
	c0    ldw $r0.4 = 0x20[$r0.1]  ## restore ## t68
;;								## 4
	c0    sub $r0.5 = $r0.0, $r0.2   ## bblock 2, line 481,  t39,  0(I32),  t48
	c0    cmpeq $b0.0 = $r0.2, $r0.0   ## bblock 2, line 481,  t94(I1),  t48,  0(SI32)
	c0    ldw $r0.6 = 0x24[$r0.1]  ## restore ## t67
;;								## 5
	c0    and $r0.5 = $r0.5, 31   ## bblock 2, line 481,  t40,  t39,  31(I32)
	c0    ldw $r0.7 = 0x14[$r0.1]  ## restore ## t71
;;								## 6
	c0    shl $r0.4 = $r0.4, $r0.2   ## bblock 2, line 478,  t33,  t68,  t48
	c0    shru $r0.5 = $r0.4, $r0.5   ## bblock 2, line 481,  t41,  t68,  t40
	c0    ldw $r0.8 = 0x18[$r0.1]  ## restore ## t70
;;								## 7
	c0    shl $r0.2 = $r0.6, $r0.2   ## bblock 2, line 481,  t44,  t67,  t48
	c0    ldw $r0.9 = 0x1c[$r0.1]  ## restore ## t69
;;								## 8
	c0    or $r0.2 = $r0.2, $r0.5   ## bblock 2, line 481,  t45,  t44,  t41
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t51
;;								## 9
	c0    stw 0[$r0.7] = $r0.4   ## bblock 2, line 478, t71, t33
	c0    slct $r0.6 = $b0.0, $r0.6, $r0.2   ## bblock 2, line 481,  t46,  t94(I1),  t67,  t45
;;								## 10
	c0    stw 0[$r0.8] = $r0.6   ## bblock 2, line 479, t70, t46
;;								## 11
	c0    stw 0[$r0.9] = $r0.3   ## bblock 2, line 483, t69, t49
	c0    goto L28?3 ## goto
;;								## 12
.endp
.section .bss
.section .data
.equ ?2.11?2scratch.0, 0x0
.equ ?2.11?2ras_p, 0x10
.equ ?2.11?2spill_p, 0x14
.section .data
.section .text
.equ ?2.11?2auto_size, 0x40
 ## End normalizeFloat64Subnormal
 ## Begin packFloat64
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32)
packFloat64:
.trace 1
	      ## auto_size == 0
	c0    shl $r0.4 = $r0.4, 20   ## bblock 0, line 492,  t3,  t2,  20(SI32)
	c0    shl $r0.3 = $r0.3, 31   ## bblock 0, line 492,  t5,  t4,  31(SI32)
;;								## 0
	c0    add $r0.5 = $r0.5, $r0.3   ## bblock 0, line 492,  t30,  t1,  t5
;;								## 1
.return ret($r0.3:u32,$r0.4:u32)
	c0    add $r0.3 = $r0.5, $r0.4   ## bblock 0, line 492,  t7,  t30,  t3
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 493,  t10,  ?2.12?2auto_size(I32),  t9
	c0    mov $r0.4 = $r0.6   ## t8
;;								## 2
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.12?2auto_size, 0x0
 ## End packFloat64
 ## Begin roundAndPackFloat64
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.1 + 48, 20; $r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32,$r0.7:u32)
roundAndPackFloat64:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    cmplt $r0.2 = $r0.7, $r0.0   ## bblock 0, line 505,  t202,  t3,  0(SI32)
;;								## 0
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t167
;;								## 1
	c0    ldw $r0.8 = ((_?1PACKET.2 + 0) + 0)[$r0.0]   ## bblock 0, line 503, t204, 0(I32)
;;								## 2
	c0    stw 0x30[$r0.1] = $r0.3   ## bblock 0, line 497, t168, t178
;;								## 3
	c0    stw 0x34[$r0.1] = $r0.4   ## bblock 0, line 497, t168, t179
;;								## 4
	c0    stw 0x38[$r0.1] = $r0.5   ## bblock 0, line 497, t168, t180
	c0    cmpeq $r0.3 = $r0.8, $r0.0   ## bblock 0, line 504,  t203,  t204,  0(I32)
	c0    cmpeq $b0.0 = $r0.8, 3   ## [spec] bblock 36, line 507,  t294(I1),  t204,  3(SI32)
;;								## 5
	c0    stw 0x3c[$r0.1] = $r0.6   ## bblock 0, line 497, t168, t181
	c0    cmpeq $b0.1 = $r0.3, $r0.0   ## bblock 0, line 506,  t264(I1),  t203,  0(SI32)
;;								## 6
	c0    stw 0x40[$r0.1] = $r0.7   ## bblock 0, line 497, t168, t3
;;								## 7
	c0    brf $b0.1, L29?3   ## bblock 0, line 506,  t264(I1)
;;								## 8
	c0    mov $r0.2 = $r0.0   ## [spec] bblock 40, line 508,  t202,  0(SI32)
	c0    brf $b0.0, L30?3   ## bblock 36, line 507,  t294(I1)
;;								## 9
.trace 2
L29?3:
	c0    ldw $r0.7 = 0x34[$r0.1]   ## bblock 1, line 522, t16, t168
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## [spec] bblock 3, line 606,  t267(I1),  t202,  0(SI32)
;;								## 0
	c0    ldw.d $r0.9 = 0x40[$r0.1]   ## [spec] bblock 2, line 604, t130, t168
;;								## 1
	c0    ldw.d $r0.10 = ((_?1PACKET.3 + 0) + 0)[$r0.0]   ## [spec] bblock 9, line 605, t131, 0(I32)
;;								## 2
	c0    zxth $r0.11 = $r0.7   ## bblock 1, line 522,  t17(I16),  t16
	c0    ldw.d $r0.12 = 0x40[$r0.1]   ## [spec] bblock 8, line 618, t153, t168
;;								## 3
	c0    cmpge $b0.1 = $r0.11, 2045   ## bblock 1, line 522,  t265(I1),  t17(I16),  2045(SI32)
	c0    cmpne $b0.2 = $r0.9, $r0.0   ## [spec] bblock 2, line 604,  t266(I1),  t130,  0(SI32)
;;								## 4
	c0    or $r0.10 = $r0.10, 1   ## [spec] bblock 9, line 605,  t132,  t131,  1(I32)
	c0    ldw.d $r0.13 = 0x3c[$r0.1]   ## [spec] bblock 8, line 611, t144, t168
;;								## 5
	c0    ldw.d $r0.11 = 0x38[$r0.1]   ## [spec] bblock 8, line 610, t147, t168
	c0    add $r0.9 = $r0.12, $r0.12   ## [spec] bblock 8, line 618,  t154,  t153,  t153
	c0    br $b0.1, L31?3   ## bblock 1, line 522,  t265(I1)
;;								## 6
L32?3:
	c0    cmpeq $r0.9 = $r0.9, $r0.0   ## [spec] bblock 8, line 618,  t155,  t154,  0(I32)
	c0    ldw.d $r0.7 = 0x30[$r0.1]   ## [spec] bblock 5, line 624, t163, t168
	c0    brf $b0.2, L33?3   ## bblock 2, line 604,  t266(I1)
;;								## 7
	c0    add $r0.12 = $r0.13, 1   ## [spec] bblock 8, line 614,  t150,  t144,  1(SI32)
	c0    and $r0.3 = $r0.3, $r0.9   ## [spec] bblock 8, line 618,  t269,  t203,  t155
	c0    ldw.d $r0.4 = 0x34[$r0.1]   ## [spec] bblock 5, line 624, t164, t168
;;								## 8
	c0    stw ((_?1PACKET.3 + 0) + 0)[$r0.0] = $r0.10   ## bblock 9, line 605, 0(I32), t132
	c0    cmpltu $r0.13 = $r0.12, $r0.13   ## [spec] bblock 8, line 616,  t145,  t150,  t144
	c0    orc $r0.3 = $r0.3, $r0.0   ## [spec] bblock 8, line 618,  t156,  t269,  0(I32)
;;								## 9
L34?3:
	c0    add $r0.11 = $r0.11, $r0.13   ## [spec] bblock 8, line 616,  t148,  t147,  t145
	c0    and $r0.12 = $r0.12, $r0.3   ## [spec] bblock 8, line 618,  t157,  t150,  t156
	c0    brf $b0.0, L35?3   ## bblock 3, line 606,  t267(I1)
;;								## 10
	c0    stw 0x3c[$r0.1] = $r0.12   ## bblock 8, line 618, t168, t157
	c0    mov $r0.3 = $r0.7   ## [spec] t163
;;								## 11
	c0    ldw $r0.6 = 0x3c[$r0.1]   ## bblock 5, line 624, t166, t168
;;								## 12
	c0    stw 0x38[$r0.1] = $r0.11   ## bblock 8, line 616, t168, t148
;;								## 13
L36?3:
	c0    ldw $r0.5 = 0x38[$r0.1]   ## bblock 5, line 624, t165, t168
	      xnop 1
;;								## 15
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 5, line 624,  raddr(packFloat64)(P32),  t163,  t164,  t165,  t166
;;								## 16
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t167
	      xnop 3
;;								## 20
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 6, line 624,  t168,  ?2.13?2auto_size(I32),  t167
;;								## 21
.trace 3
L35?3:
	c0    ldw $r0.2 = 0x3c[$r0.1]   ## bblock 4, line 621, t158, t168
	c0    mov $r0.3 = $r0.7   ## t163
;;								## 0
	c0    ldw $r0.5 = 0x38[$r0.1]   ## bblock 4, line 621, t159, t168
	      xnop 2
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.5   ## bblock 4, line 621,  t160,  t158,  t159
;;								## 4
	c0    cmpeq $b0.0 = $r0.2, $r0.0   ## bblock 4, line 621,  t268(I1),  t160,  0(SI32)
	      xnop 1
;;								## 6
	c0    brf $b0.0, L37?3   ## bblock 4, line 621,  t268(I1)
;;								## 7
	c0    stw 0x34[$r0.1] = $r0.0   ## bblock 7, line 622, t168, 0(SI32)
;;								## 8
	c0    ldw $r0.4 = 0x34[$r0.1]   ## bblock 5, line 624, t164, t168
;;								## 9
	c0    ldw $r0.6 = 0x3c[$r0.1]   ## bblock 5, line 624, t166, t168
;;								## 10
	c0    goto L36?3 ## goto
;;								## 11
.trace 7
L37?3:
	c0    ldw $r0.6 = 0x3c[$r0.1]   ## bblock 5, line 624, t166, t168
;;								## 0
	c0    goto L36?3 ## goto
;;								## 1
.trace 4
L33?3:
	c0    add $r0.12 = $r0.13, 1   ## [spec] bblock 8, line 614,  t150,  t144,  1(SI32)
	c0    and $r0.3 = $r0.3, $r0.9   ## [spec] bblock 8, line 618,  t269,  t203,  t155
;;								## 0
	c0    cmpltu $r0.13 = $r0.12, $r0.13   ## [spec] bblock 8, line 616,  t145,  t150,  t144
	c0    orc $r0.3 = $r0.3, $r0.0   ## [spec] bblock 8, line 618,  t156,  t269,  0(I32)
	c0    ldw.d $r0.4 = 0x34[$r0.1]   ## [spec] bblock 5, line 624, t164, t168
;;								## 1
	c0    goto L34?3 ## goto
;;								## 2
.trace 8
L31?3:
	c0    cmpeq $r0.5 = $r0.7, 2045   ## bblock 10, line 524,  t21,  t16,  2045(SI32)
	c0    stw 0x14[$r0.1] = $r0.8  ## spill ## t204
	c0    mov $r0.6 = $r0.3   ## t203
;;								## 0
	c0    ldw $r0.12 = 0x38[$r0.1]   ## bblock 10, line 525, t22, t168
	c0    andl $r0.5 = $r0.5, $r0.2   ## bblock 10, line 526,  t270,  t21,  t202
	c0    mov $r0.3 = 5   ## 5(SI32)
;;								## 1
	c0    cmpgt $r0.7 = $r0.7, 2045   ## bblock 10, line 523,  t19,  t16,  2045(SI32)
	c0    ldw $r0.11 = 0x3c[$r0.1]   ## bblock 10, line 525, t24, t168
	      xnop 1
;;								## 3
	c0    cmpeq $r0.12 = $r0.12, 2097151   ## bblock 10, line 525,  t23,  t22,  2097151(SI32)
;;								## 4
	c0    cmpeq $r0.11 = $r0.11, (~0x0)   ## bblock 10, line 525,  t25,  t24,  (~0x0)(I32)
;;								## 5
	c0    andl $r0.12 = $r0.12, $r0.11   ## bblock 10, line 526,  t271,  t23,  t25
;;								## 6
	c0    andl $r0.5 = $r0.5, $r0.12   ## bblock 10, line 526,  t27,  t270,  t271
;;								## 7
	c0    orl $b0.1 = $r0.7, $r0.5   ## bblock 10, line 527,  t273(I1),  t19,  t27
	      xnop 1
;;								## 9
	c0    brf $b0.1, L38?3   ## bblock 10, line 527,  t273(I1)
;;								## 10
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 30, line 528,  raddr(float_raise)(P32),  5(SI32)
;;								## 11
	c0    ldw $r0.3 = 0x30[$r0.1]   ## bblock 31, line 530, t34, t168
	c0    mov $r0.6 = (~0x0)   ## (~0x0)(I32)
;;								## 12
	c0    mov $r0.4 = 2046   ## 2046(SI32)
	c0    ldw $r0.8 = 0x14[$r0.1]  ## restore ## t204
;;								## 13
	c0    mov $r0.5 = 1048575   ## 1048575(I32)
;;								## 14
	c0    cmpeq $r0.7 = $r0.3, $r0.0   ## bblock 31, line 531,  t291,  t34,  0(I32)
;;								## 15
	c0    cmpeq $r0.12 = $r0.8, 3   ## bblock 31, line 529,  t29,  t204,  3(SI32)
	c0    cmpeq $r0.8 = $r0.8, 2   ## bblock 31, line 530,  t32,  t204,  2(SI32)
	c0    cmpeq $r0.11 = $r0.8, 1   ## bblock 31, line 531,  t36,  t204,  1(SI32)
;;								## 16
	c0    andl $r0.8 = $r0.3, $r0.8   ## bblock 31, line 530,  t33,  t34,  t32
	c0    andl $r0.11 = $r0.11, $r0.7   ## bblock 31, line 531,  t37,  t36,  t291
;;								## 17
	c0    orl $r0.12 = $r0.12, $r0.11   ## bblock 31, line 532,  t292,  t29,  t37
;;								## 18
	c0    orl $b0.0 = $r0.12, $r0.8   ## bblock 31, line 532,  t293(I1),  t292,  t33
	      xnop 1
;;								## 20
	c0    brf $b0.0, L39?3   ## bblock 31, line 532,  t293(I1)
;;								## 21
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 34, line 533,  raddr(packFloat64)(P32),  t34,  2046(SI32),  1048575(I32),  (~0x0)(I32)
;;								## 22
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t167
	      xnop 3
;;								## 26
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 35, line 533,  t168,  ?2.13?2auto_size(I32),  t167
;;								## 27
.trace 10
L39?3:
	c0    ldw $r0.3 = 0x30[$r0.1]   ## bblock 32, line 535, t43, t168
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
;;								## 0
	c0    mov $r0.4 = 2047   ## 2047(SI32)
;;								## 1
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 32, line 535,  raddr(packFloat64)(P32),  t43,  2047(SI32),  0(I32),  0(I32)
;;								## 2
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t167
	      xnop 3
;;								## 6
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 33, line 535,  t168,  ?2.13?2auto_size(I32),  t167
;;								## 7
.trace 9
L38?3:
	c0    add $r0.5 = $r0.1, 0x38   ## [spec] bblock 12, line 550,  t192,  t168,  offset(zSig0?1.53)(P32)
	c0    cmpeq $r0.4 = $r0.2, $r0.0   ## [spec] bblock 12, line 542,  t277,  t202,  0(I32)
	c0    stw 0x18[$r0.1] = $r0.6  ## spill ## t203
;;								## 0
	c0    ldw.d $r0.6 = ((_?1PACKET.1 + 0) + 0)[$r0.0]   ## [spec] bblock 12, line 538, t45, 0(I32)
	c0    add $r0.7 = $r0.1, 0x3c   ## [spec] bblock 12, line 551,  t191,  t168,  offset(zSig1?1.53)(P32)
;;								## 1
	c0    ldw.d $r0.11 = 0x38[$r0.1]   ## [spec] bblock 12, line 541, t200, t168
	c0    add $r0.12 = $r0.1, 0x40   ## [spec] bblock 12, line 552,  t190,  t168,  offset(zSig2?1.53)(P32)
;;								## 2
	c0    ldw.d $r0.13 = 0x3c[$r0.1]   ## [spec] bblock 12, line 542, t199, t168
	c0    mov $r0.3 = 2   ## 2(SI32)
;;								## 3
	c0    ldw $r0.14 = 0x34[$r0.1]   ## bblock 11, line 537, t44, t168
	c0    cmpeq $r0.6 = $r0.6, 1   ## [spec] bblock 12, line 538,  t46,  t45,  1(SI32)
;;								## 4
	c0    cmpltu $r0.15 = $r0.11, 2097151   ## [spec] bblock 12, line 541,  t51,  t200,  2097151(SI32)
	c0    orl $r0.6 = $r0.6, $r0.4   ## [spec] bblock 12, line 542,  t276,  t46,  t277
	c0    mov $r0.16 = $r0.11   ## [spec] bblock 29, line 541,  t195,  t200
;;								## 5
	c0    cmpeq $r0.4 = $r0.11, 2097151   ## [spec] bblock 12, line 542,  t53,  t200,  2097151(SI32)
	c0    cmpltu $r0.17 = $r0.13, (~0x0)   ## [spec] bblock 12, line 542,  t55,  t199,  (~0x0)(I32)
	c0    orl $r0.6 = $r0.6, $r0.15   ## [spec] bblock 12, line 542,  t279,  t276,  t51
;;								## 6
	c0    cmplt $b0.1 = $r0.14, $r0.0   ## bblock 11, line 537,  t274(I1),  t44,  0(SI32)
	c0    sub $r0.18 = $r0.0, $r0.14   ## [spec] bblock 12, line 553,  t197,  0(I32),  t44
	c0    cmplt $r0.15 = $r0.14, -1   ## [spec] bblock 12, line 539,  t48,  t44,  -1(SI32)
	c0    andl $r0.4 = $r0.4, $r0.17   ## [spec] bblock 12, line 542,  t56,  t53,  t55
;;								## 7
	c0    sub $r0.17 = $r0.0, $r0.18   ## [spec] bblock 12, line 553,  t64,  0(I32),  t197
	c0    orl $r0.15 = $r0.15, $r0.4   ## [spec] bblock 12, line 542,  t278,  t48,  t56
	c0    ldw.d $r0.19 = 0x40[$r0.1]   ## [spec] bblock 12, line 546, t198, t168
;;								## 8
	c0    orl $r0.6 = $r0.6, $r0.15   ## [spec] bblock 12, line 542,  t201,  t279,  t278
	c0    and $r0.17 = $r0.17, 31   ## [spec] bblock 12, line 548,  t196,  t64,  31(I32)
	c0    cmpeq $b0.1 = $r0.18, $r0.0   ## [spec] bblock 12, line 553,  t281(I1),  t197,  0(SI32)
	c0    brf $b0.1, L40?3   ## bblock 11, line 537,  t274(I1)
;;								## 9
	c0    mov $r0.4 = $r0.13   ## [spec] bblock 29, line 542,  t194,  t199
;;								## 10
	c0    mov $r0.14 = $r0.19   ## [spec] bblock 29, line 546,  t193,  t198
	c0    brf $b0.1, L41?3   ## bblock 12, line 553,  t281(I1)
;;								## 11
L42?3:
	c0    stw 0[$r0.12] = $r0.14   ## bblock 19, line 584, t190, t193
;;								## 12
	c0    ldw $r0.11 = 0x40[$r0.1]   ## bblock 19, line 589, t117, t168
;;								## 13
	c0    stw 0[$r0.7] = $r0.4   ## bblock 19, line 585, t191, t194
;;								## 14
	c0    stw 0[$r0.5] = $r0.16   ## bblock 19, line 586, t192, t195
;;								## 15
	c0    stw 0x34[$r0.1] = $r0.0   ## bblock 19, line 588, t168, 0(SI32)
	c0    andl $b0.1 = $r0.6, $r0.11   ## bblock 19, line 589,  t284(I1),  t201,  t117
	      xnop 1
;;								## 17
	c0    brf $b0.1, L43?3   ## bblock 19, line 589,  t284(I1)
;;								## 18
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 25, line 590,  raddr(float_raise)(P32),  2(SI32)
;;								## 19
L43?3:
	c0    ldw.d $r0.4 = 0x30[$r0.1]   ## [spec] bblock 20, line 595, t248, t168
;;								## 20
	c0    ldw.d $r0.5 = 0x40[$r0.1]   ## [spec] bblock 20, line 592, t253, t168
;;								## 21
	c0    ldw $r0.8 = 0x14[$r0.1]  ## restore ## t204
;;								## 22
	c0    cmpne $b0.1 = $r0.4, $r0.0   ## bblock 20, line 596,  t287(I1),  t248,  0(I32)
	c0    ldw $r0.3 = 0x18[$r0.1]  ## restore ## t203
;;								## 23
	c0    cmplt $r0.4 = $r0.5, $r0.0   ## bblock 20, line 592,  t246,  t253,  0(SI32)
	c0    ldw $r0.6 = 0x40[$r0.1]   ## bblock 2, line 604, t130, t168
;;								## 24
	c0    cmpeq $r0.7 = $r0.8, 1   ## bblock 20, line 596,  t249,  t204,  1(SI32)
	c0    cmpeq $r0.11 = $r0.8, 2   ## bblock 20, line 599,  t252,  t204,  2(SI32)
	c0    ldw.d $r0.12 = ((_?1PACKET.3 + 0) + 0)[$r0.0]   ## [spec] bblock 9, line 605, t131, 0(I32)
;;								## 25
	c0    andl $r0.7 = $r0.5, $r0.7   ## bblock 20, line 596,  t251,  t253,  t249
	c0    andl $r0.11 = $r0.5, $r0.11   ## bblock 20, line 599,  t254,  t253,  t252
	c0    cmpne $b0.3 = $r0.3, $r0.0   ## bblock 20, line 592,  t288(I1),  t203,  0(I32)
;;								## 26
	c0    slct $r0.7 = $b0.1, $r0.7, $r0.11   ## bblock 20, line 596,  t255,  t287(I1),  t251,  t254
	c0    cmpne $b0.2 = $r0.6, $r0.0   ## bblock 2, line 604,  t266(I1),  t130,  0(SI32)
	c0    ldw.d $r0.5 = 0x40[$r0.1]   ## [spec] bblock 8, line 618, t153, t168
;;								## 27
	c0    slct $r0.2 = $b0.3, $r0.4, $r0.7   ## bblock 20, line 592,  t202,  t288(I1),  t246,  t255
	c0    or $r0.10 = $r0.12, 1   ## [spec] bblock 9, line 605,  t132,  t131,  1(I32)
;;								## 28
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## [spec] bblock 3, line 606,  t267(I1),  t202,  0(SI32)
;;								## 29
	c0    add $r0.9 = $r0.5, $r0.5   ## [spec] bblock 8, line 618,  t154,  t153,  t153
	c0    ldw.d $r0.13 = 0x3c[$r0.1]   ## [spec] bblock 8, line 611, t144, t168
;;								## 30
	c0    ldw.d $r0.11 = 0x38[$r0.1]   ## [spec] bblock 8, line 610, t147, t168
	c0    goto L32?3 ## goto
;;								## 31
.trace 12
L41?3:
	c0    cmplt $b0.0 = $r0.18, 32   ## bblock 13, line 559,  t282(I1),  t197,  32(SI32)
	c0    shl $r0.9 = $r0.13, $r0.17   ## [spec] bblock 28, line 560,  t209,  t199,  t196
	c0    shru $r0.10 = $r0.13, $r0.18   ## [spec] bblock 28, line 561,  t79,  t199,  t197
	c0    cmpne $r0.2 = $r0.19, $r0.0   ## [spec] bblock 18, line 582,  t108,  t198,  0(I32)
;;								## 0
	c0    shl $r0.15 = $r0.11, $r0.17   ## [spec] bblock 28, line 561,  t82,  t200,  t196
	c0    shru $r0.16 = $r0.11, $r0.18   ## [spec] bblock 28, line 562,  t195,  t200,  t197
	c0    or $r0.14 = $r0.2, $r0.9   ## [spec] bblock 18, line 582,  t193,  t108,  t209
	c0    mov $r0.3 = 2   ## 2(SI32)
;;								## 1
	c0    or $r0.4 = $r0.10, $r0.15   ## [spec] bblock 28, line 561,  t194,  t79,  t82
	c0    brf $b0.0, L44?3   ## bblock 13, line 559,  t282(I1)
	      ## goto
;;
	c0    goto L42?3 ## goto
;;								## 2
.trace 14
L44?3:
	c0    cmpge $b0.1 = $r0.18, 64   ## bblock 14, line 571,  t235(I1),  t197,  64(SI32)
	c0    cmpne $r0.2 = $r0.11, $r0.0   ## bblock 14, line 576,  t239,  t200,  0(I32)
	c0    cmpeq $b0.0 = $r0.18, 64   ## bblock 14, line 576,  t283(I1),  t197,  64(SI32)
	c0    shl $r0.17 = $r0.11, $r0.17   ## bblock 14, line 572,  t236,  t200,  t196
;;								## 0
	c0    cmpeq $b0.0 = $r0.18, 32   ## bblock 14, line 565,  t231(I1),  t197,  32(SI32)
	c0    or $r0.8 = $r0.13, $r0.19   ## bblock 14, line 570,  t234,  t199,  t198
	c0    slct $r0.2 = $b0.0, $r0.11, $r0.2   ## bblock 14, line 576,  t241,  t283(I1),  t200,  t239
	c0    and $r0.18 = $r0.18, 31   ## bblock 14, line 573,  t237,  t197,  31(I32)
;;								## 1
	c0    shru $r0.18 = $r0.11, $r0.18   ## bblock 14, line 573,  t238,  t200,  t237
	c0    mov $r0.16 = $r0.0   ## bblock 14, line 577,  t195,  0(SI32)
	c0    slct $r0.2 = $b0.1, $r0.2, $r0.17   ## bblock 14, line 572,  t242,  t235(I1),  t241,  t236
	c0    slct $r0.19 = $b0.0, $r0.19, $r0.8   ## bblock 14, line 570,  t198,  t231(I1),  t198,  t234
;;								## 2
	c0    slct $r0.9 = $b0.0, $r0.13, $r0.2   ## bblock 14, line 566,  t209,  t231(I1),  t199,  t242
	c0    slctf $r0.18 = $b0.1, $r0.18, $r0.0   ## bblock 14, line 573,  t243,  t235(I1),  t238,  0(SI32)
	c0    cmpne $r0.2 = $r0.19, $r0.0   ## bblock 18, line 582,  t108,  t198,  0(I32)
	c0    mov $r0.3 = 2   ## 2(SI32)
;;								## 3
	c0    slct $r0.4 = $b0.0, $r0.11, $r0.18   ## bblock 14, line 567,  t194,  t231(I1),  t200,  t243
	c0    or $r0.14 = $r0.2, $r0.9   ## bblock 18, line 582,  t193,  t108,  t209
	c0    goto L42?3 ## goto
;;								## 4
.trace 11
L40?3:
	c0    ldw $r0.3 = 0x18[$r0.1]  ## restore ## t203
;;								## 0
	c0    ldw.d $r0.13 = 0x3c[$r0.1]   ## [spec] bblock 8, line 611, t144, t168
;;								## 1
	c0    ldw.d $r0.11 = 0x38[$r0.1]   ## [spec] bblock 8, line 610, t147, t168
	c0    goto L32?3 ## goto
;;								## 2
.trace 5
L30?3:
	c0    ldw $r0.4 = 0x30[$r0.1]   ## bblock 37, line 511, t224, t168
	c0    cmpeq $r0.5 = $r0.8, 1   ## bblock 37, line 512,  t225,  t204,  1(SI32)
	c0    cmpeq $r0.6 = $r0.8, 2   ## bblock 37, line 515,  t228,  t204,  2(SI32)
;;								## 0
	c0    ldw.d $r0.7 = 0x40[$r0.1]   ## [spec] bblock 37, line 512, t229, t168
	      xnop 1
;;								## 2
	c0    cmpne $b0.0 = $r0.4, $r0.0   ## bblock 37, line 512,  t297(I1),  t224,  0(I32)
;;								## 3
	c0    andl $r0.5 = $r0.5, $r0.7   ## bblock 37, line 512,  t227,  t225,  t229
	c0    andl $r0.7 = $r0.7, $r0.6   ## bblock 37, line 515,  t230,  t229,  t228
;;								## 4
	c0    slct $r0.2 = $b0.0, $r0.5, $r0.7   ## bblock 37, line 512,  t202,  t297(I1),  t227,  t230
	c0    goto L29?3 ## goto
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.13?2scratch.0, 0x0
.equ ?2.13?2ras_p, 0x10
.equ ?2.13?2spill_p, 0x14
.equ ?2.13?2pab_p.1, 0x30
.section .data
.section .text
.equ ?2.13?2auto_size, 0x40
 ## End roundAndPackFloat64
 ## Begin normalizeRoundAndPackFloat64
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.1 + 48, 16; $r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32)
normalizeRoundAndPackFloat64:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    cmpeq $b0.0 = $r0.5, $r0.0   ## bblock 0, line 633,  t209(I1),  t0,  0(SI32)
	c0    add $r0.2 = $r0.4, -32   ## [spec] bblock 18, line 636,  t3,  t109,  -32(SI32)
;;								## 0
	c0    stw 0x14[$r0.1] = $l0.0  ## spill ## t97
;;								## 1
	c0    stw 0x30[$r0.1] = $r0.3   ## bblock 0, line 628, t98, t108
;;								## 2
	c0    stw 0x34[$r0.1] = $r0.4   ## bblock 0, line 628, t98, t109
;;								## 3
	c0    stw 0x38[$r0.1] = $r0.5   ## bblock 0, line 628, t98, t0
;;								## 4
	c0    stw 0x3c[$r0.1] = $r0.6   ## bblock 0, line 628, t98, t111
	c0    brf $b0.0, L45?3   ## bblock 0, line 633,  t209(I1)
;;								## 5
	c0    stw 0x38[$r0.1] = $r0.6   ## bblock 18, line 634, t98, t111
;;								## 6
	c0    ldw $r0.3 = 0x38[$r0.1]   ## bblock 1, line 638, t5, t98
;;								## 7
	c0    stw 0x3c[$r0.1] = $r0.0   ## bblock 18, line 635, t98, 0(SI32)
;;								## 8
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    stw 0x34[$r0.1] = $r0.2   ## bblock 18, line 636, t98, t3
	c0    call $l0.0 = countLeadingZeros32   ## bblock 1, line 638,  raddr(countLeadingZeros32)(P32),  t5
;;								## 9
L46?3:
	c0    add $r0.3 = $r0.3, -11   ## bblock 2, line 638,  t128,  t4,  -11(SI32)
	c0    ldw.d $r0.2 = 0x38[$r0.1]   ## [spec] bblock 17, line 644, t24, t98
;;								## 10
	c0    cmpge $b0.0 = $r0.3, $r0.0   ## bblock 2, line 639,  t210(I1),  t128,  0(SI32)
	c0    ldw.d $r0.8 = 0x3c[$r0.1]   ## [spec] bblock 17, line 645, t19, t98
	c0    sub $r0.9 = $r0.0, $r0.3   ## [spec] bblock 17, line 650,  t21,  0(I32),  t128
;;								## 11
	c0    and $r0.9 = $r0.9, 31   ## [spec] bblock 17, line 650,  t22,  t21,  31(I32)
	c0    cmpeq $b0.1 = $r0.3, $r0.0   ## [spec] bblock 17, line 650,  t215(I1),  t128,  0(SI32)
	c0    ldw.d $r0.10 = 0x34[$r0.1]   ## [spec] bblock 11, line 700, t87, t98
;;								## 12
	c0    shl $r0.11 = $r0.2, $r0.3   ## [spec] bblock 17, line 650,  t26,  t24,  t128
	c0    ldw.d $r0.12 = 0x30[$r0.1]   ## [spec] bblock 11, line 701, t92, t98
	c0    brf $b0.0, L47?3   ## bblock 2, line 639,  t210(I1)
;;								## 13
	c0    stw 0x10[$r0.1] = $r0.0   ## bblock 17, line 640, t98, 0(SI32)
	c0    shl $r0.13 = $r0.8, $r0.3   ## bblock 17, line 647,  t15,  t19,  t128
	c0    shru $r0.9 = $r0.8, $r0.9   ## bblock 17, line 650,  t23,  t19,  t22
;;								## 14
	c0    stw 0x3c[$r0.1] = $r0.13   ## bblock 17, line 647, t98, t15
	c0    or $r0.11 = $r0.11, $r0.9   ## bblock 17, line 650,  t27,  t26,  t23
	c0    sub $r0.4 = $r0.10, $r0.3   ## bblock 11, line 700,  t93,  t87,  t128
;;								## 15
	c0    slct $r0.2 = $b0.1, $r0.2, $r0.11   ## bblock 17, line 650,  t28,  t215(I1),  t24,  t27
	c0    ldw $r0.6 = 0x3c[$r0.1]   ## bblock 11, line 701, t95, t98
	c0    mov $r0.3 = $r0.12   ## [spec] t92
;;								## 16
	c0    stw 0x38[$r0.1] = $r0.2   ## bblock 17, line 648, t98, t28
;;								## 17
L48?3:
	c0    ldw $r0.5 = 0x38[$r0.1]   ## bblock 11, line 701, t94, t98
;;								## 18
	c0    ldw $r0.7 = 0x10[$r0.1]   ## bblock 11, line 701, t96, t98
;;								## 19
	c0    stw 0x34[$r0.1] = $r0.4   ## bblock 11, line 700, t98, t93
;;								## 20
.call roundAndPackFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = roundAndPackFloat64   ## bblock 11, line 701,  raddr(roundAndPackFloat64)(P32),  t92,  t93,  t94,  t95,  t96
;;								## 21
	c0    ldw $l0.0 = 0x14[$r0.1]  ## restore ## t97
	      xnop 3
;;								## 25
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 12, line 701,  t98,  ?2.14?2auto_size(I32),  t97
;;								## 26
.trace 2
L47?3:
	c0    ldw $r0.2 = 0x38[$r0.1]   ## bblock 3, line 655, t185, t98
	c0    sub $r0.5 = $r0.0, $r0.3   ## bblock 3, line 664,  t174,  0(I32),  t128
;;								## 0
	c0    sub $r0.6 = $r0.0, $r0.5   ## bblock 3, line 664,  t35,  0(I32),  t174
	c0    cmpeq $b0.2 = $r0.5, 32   ## bblock 3, line 676,  t184(I1),  t174,  32(SI32)
	c0    cmpge $b0.1 = $r0.5, 64   ## bblock 3, line 682,  t188(I1),  t174,  64(SI32)
	c0    cmpeq $b0.0 = $r0.5, 64   ## bblock 3, line 687,  t211(I1),  t174,  64(SI32)
;;								## 1
	c0    ldw $r0.7 = 0x3c[$r0.1]   ## bblock 3, line 656, t187, t98
	c0    and $r0.6 = $r0.6, 31   ## bblock 3, line 659,  t118,  t35,  31(I32)
	c0    cmpge $b0.3 = $r0.5, 32   ## bblock 3, line 670,  t178(I1),  t174,  32(SI32)
;;								## 2
	c0    cmpne $r0.8 = $r0.2, $r0.0   ## bblock 3, line 687,  t192,  t185,  0(I32)
	c0    shru $r0.11 = $r0.2, $r0.5   ## bblock 3, line 673,  t183,  t185,  t174
	c0    shl $r0.9 = $r0.2, $r0.6   ## bblock 3, line 672,  t189,  t185,  t118
	c0    cmpne $b0.4 = $r0.5, $r0.0   ## bblock 3, line 657,  t213(I1),  t174,  0(I32)
;;								## 3
	c0    and $r0.12 = $r0.5, 31   ## bblock 3, line 684,  t190,  t174,  31(I32)
	c0    slct $r0.8 = $b0.0, $r0.2, $r0.8   ## bblock 3, line 687,  t194,  t211(I1),  t185,  t192
	c0    slctf $r0.11 = $b0.3, $r0.11, $r0.0   ## bblock 3, line 673,  t203,  t178(I1),  t183,  0(SI32)
	c0    cmpeq $b0.0 = $r0.5, $r0.0   ## bblock 3, line 655,  t214(I1),  t174,  0(I32)
;;								## 4
	c0    shl $r0.6 = $r0.7, $r0.6   ## bblock 3, line 671,  t179,  t187,  t118
	c0    slct $r0.8 = $b0.1, $r0.8, $r0.9   ## bblock 3, line 683,  t195,  t188(I1),  t194,  t189
	c0    slctf $r0.13 = $b0.2, $r0.7, $r0.0   ## bblock 3, line 681,  t199,  t184(I1),  t187,  0(SI32)
	c0    slct $r0.11 = $b0.0, $r0.2, $r0.11   ## bblock 3, line 655,  t117,  t214(I1),  t185,  t203
;;								## 5
	c0    shru $r0.14 = $r0.7, $r0.5   ## bblock 3, line 672,  t180,  t187,  t174
	c0    shru $r0.12 = $r0.2, $r0.12   ## bblock 3, line 684,  t191,  t185,  t190
	c0    slct $r0.8 = $b0.2, $r0.7, $r0.8   ## bblock 3, line 677,  t198,  t184(I1),  t187,  t195
	c0    slct $r0.13 = $b0.3, $r0.13, $r0.0   ## bblock 3, line 681,  t204,  t178(I1),  t199,  0(SI32)
;;								## 6
	c0    or $r0.14 = $r0.14, $r0.9   ## bblock 3, line 672,  t182,  t180,  t189
	c0    slct $r0.8 = $b0.3, $r0.8, $r0.6   ## bblock 3, line 671,  t201,  t178(I1),  t198,  t179
	c0    slctf $r0.12 = $b0.1, $r0.12, $r0.0   ## bblock 3, line 684,  t196,  t188(I1),  t191,  0(SI32)
	c0    cmpne $r0.13 = $r0.13, $r0.0   ## bblock 3, line 693,  t205,  t204,  0(I32)
;;								## 7
	c0    slct $r0.2 = $b0.2, $r0.2, $r0.12   ## bblock 3, line 678,  t197,  t184(I1),  t185,  t196
	c0    cmpeq $b0.0 = $r0.5, $r0.0   ## bblock 3, line 656,  t212(I1),  t174,  0(I32)
	c0    or $r0.8 = $r0.8, $r0.13   ## bblock 3, line 693,  t206,  t201,  t205
	c0    sub $r0.4 = $r0.10, $r0.3   ## bblock 11, line 700,  t93,  t87,  t128
;;								## 8
	c0    slct $r0.2 = $b0.3, $r0.2, $r0.14   ## bblock 3, line 672,  t202,  t178(I1),  t197,  t182
	c0    slct $r0.8 = $b0.4, $r0.8, $r0.0   ## bblock 3, line 657,  t115,  t213(I1),  t206,  0(SI32)
;;								## 9
	c0    slct $r0.7 = $b0.0, $r0.7, $r0.2   ## bblock 3, line 656,  t116,  t212(I1),  t187,  t202
	c0    stw 0x10[$r0.1] = $r0.8   ## bblock 3, line 695, t98, t115
;;								## 10
	c0    ldw $r0.3 = 0x30[$r0.1]   ## bblock 11, line 701, t92, t98
;;								## 11
	c0    stw 0x38[$r0.1] = $r0.11   ## bblock 3, line 697, t98, t117
;;								## 12
	c0    stw 0x3c[$r0.1] = $r0.7   ## bblock 3, line 696, t98, t116
;;								## 13
	c0    ldw $r0.6 = 0x3c[$r0.1]   ## bblock 11, line 701, t95, t98
;;								## 14
	c0    goto L48?3 ## goto
;;								## 15
.trace 3
L45?3:
	c0    ldw $r0.3 = 0x38[$r0.1]   ## bblock 1, line 638, t5, t98
	      xnop 1
;;								## 1
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    call $l0.0 = countLeadingZeros32   ## bblock 1, line 638,  raddr(countLeadingZeros32)(P32),  t5
;;								## 2
	c0    goto L46?3 ## goto
;;								## 3
.endp
.section .bss
.section .data
.equ ?2.14?2scratch.0, 0x0
.equ _?1PACKET.105, 0x10
.equ ?2.14?2ras_p, 0x14
.equ ?2.14?2pab_p.1, 0x30
.section .data
.section .text
.equ ?2.14?2auto_size, 0x40
 ## End normalizeRoundAndPackFloat64
 ## Begin _r_ilfloat
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:s32)
_r_ilfloat::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    cmpeq $r0.2 = $r0.3, $r0.0   ## bblock 0, line 706,  t28,  t26,  0(I32)
	c0    cmpeq $b0.0 = $r0.3, $r0.0   ## [spec] bblock 3, line 707,  t30(I1),  t26,  0(SI32)
;;								## 0
	c0    cmpeq $r0.4 = $r0.3, (~0x7fffffff)   ## bblock 0, line 706,  t3,  t26,  (~0x7fffffff)(I32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t14
;;								## 1
	c0    orl $b0.1 = $r0.2, $r0.4   ## bblock 0, line 706,  t27(I1),  t28,  t3
	c0    slct $r0.3 = $b0.0, $r0.0, (~0x30ffffff)   ## [spec] bblock 3, line 707,  t5,  t30(I1),  0(SI32),  (~0x30ffffff)(I32)
	c0    mov $r0.2 = $r0.3   ## t26
	      xnop 1
;;								## 3
	c0    brf $b0.1, L49?3   ## bblock 0, line 706,  t27(I1)
;;								## 4
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 3, line 707,  t15,  ?2.15?2auto_size(I32),  t14
;;								## 5
.trace 2
L49?3:
	c0    sub $r0.6 = $r0.0, $r0.2   ## bblock 1, line 708,  t11,  0(I32),  t26
	c0    cmplt $r0.3 = $r0.2, $r0.0   ## bblock 1, line 708,  t8,  t26,  0(SI32)
	c0    cmplt $b0.0 = $r0.2, $r0.0   ## bblock 1, line 708,  t29(I1),  t26,  0(SI32)
	c0    mov $r0.4 = 156   ## 156(SI32)
;;								## 0
.call normalizeRoundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
	c0    slct $r0.5 = $b0.0, $r0.6, $r0.2   ## bblock 1, line 708,  t13,  t29(I1),  t11,  t26
	c0    call $l0.0 = normalizeRoundAndPackFloat32   ## bblock 1, line 708,  raddr(normalizeRoundAndPackFloat32)(P32),  t8,  156(SI32),  t13
;;								## 1
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t14
	      xnop 3
;;								## 5
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 708,  t15,  ?2.15?2auto_size(I32),  t14
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.15?2scratch.0, 0x0
.equ ?2.15?2ras_p, 0x10
.section .data
.section .text
.equ ?2.15?2auto_size, 0x20
 ## End _r_ilfloat
 ## Begin _r_ufloat
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
_r_ufloat::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    cmpeq $b0.0 = $r0.3, $r0.0   ## bblock 0, line 713,  t16(I1),  t15,  0(SI32)
	c0    mov $r0.2 = $r0.3   ## t15
;;								## 0
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t3
;;								## 1
	c0    brf $b0.0, L50?3   ## bblock 0, line 713,  t16(I1)
;;								## 2
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 3, line 714,  t4,  ?2.16?2auto_size(I32),  t3
;;								## 3
.trace 2
L50?3:
.call normalizeRoundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
	c0    call $l0.0 = normalizeRoundAndPackFloat32   ## bblock 1, line 715,  raddr(normalizeRoundAndPackFloat32)(P32),  0(SI32),  156(SI32),  t15
	c0    mov $r0.5 = $r0.2   ## t15
	c0    mov $r0.4 = 156   ## 156(SI32)
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
;;								## 0
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t3
	      xnop 3
;;								## 4
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 715,  t4,  ?2.16?2auto_size(I32),  t3
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.16?2scratch.0, 0x0
.equ ?2.16?2ras_p, 0x10
.section .data
.section .text
.equ ?2.16?2auto_size, 0x20
 ## End _r_ufloat
 ## Begin _d_ilfloat
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:s32)
_d_ilfloat::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    cmpeq $b0.0 = $r0.3, $r0.0   ## bblock 0, line 725,  t107(I1),  t69,  0(SI32)
	c0    mov $r0.5 = $r0.0   ## 0(I32)
;;								## 0
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    mov $r0.4 = $r0.0   ## 0(SI32)
	c0    stw 0x18[$r0.1] = $l0.0  ## spill ## t57
	c0    mov $r0.2 = $r0.3   ## t69
;;								## 1
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    brf $b0.0, L51?3   ## bblock 0, line 725,  t107(I1)
;;								## 2
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 12, line 726,  raddr(packFloat64)(P32),  0(SI32),  0(SI32),  0(I32),  0(I32)
;;								## 3
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t57
	      xnop 3
;;								## 7
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 13, line 726,  t58,  ?2.17?2auto_size(I32),  t57
;;								## 8
.trace 2
L51?3:
	c0    sub $r0.6 = $r0.0, $r0.2   ## bblock 1, line 728,  t7,  0(I32),  t69
	c0    cmplt $r0.5 = $r0.2, $r0.0   ## bblock 1, line 727,  t80,  t69,  0(SI32)
;;								## 0
	c0    stw 0x1c[$r0.1] = $r0.5  ## spill ## t80
	c0    mtb $b0.0 = $r0.5   ## t80
	      xnop 1
;;								## 2
	c0    slct $r0.3 = $b0.0, $r0.6, $r0.2   ## bblock 1, line 728,  t79,  t80,  t7,  t69
;;								## 3
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    call $l0.0 = countLeadingZeros32   ## bblock 1, line 729,  raddr(countLeadingZeros32)(P32),  t79
	c0    stw 0x20[$r0.1] = $r0.3  ## spill ## t79
;;								## 4
	c0    add $r0.2 = $r0.3, -11   ## bblock 2, line 729,  t78,  t10,  -11(SI32)
	c0    sub $r0.4 = 1053, $r0.3   ## [spec] bblock 7, line 759,  t54,  1053(SI32),  t10
	c0    ldw $r0.7 = 0x20[$r0.1]  ## restore ## t79
;;								## 5
	c0    cmpge $b0.0 = $r0.2, $r0.0   ## bblock 2, line 730,  t109(I1),  t78,  0(SI32)
	c0    mov $r0.8 = $r0.3   ## t10
;;								## 6
	c0    ldw $r0.3 = 0x1c[$r0.1]  ## restore ## t80
;;								## 7
	c0    shl $r0.7 = $r0.7, $r0.2   ## [spec] bblock 11, line 731,  t16,  t79,  t78
	c0    brf $b0.0, L52?3   ## bblock 2, line 730,  t109(I1)
;;								## 8
	c0    stw 0x14[$r0.1] = $r0.7   ## bblock 11, line 731, t58, t16
;;								## 9
	c0    ldw $r0.5 = 0x14[$r0.1]   ## bblock 7, line 759, t55, t58
;;								## 10
	c0    stw 0x10[$r0.1] = $r0.0   ## bblock 11, line 732, t58, 0(SI32)
;;								## 11
L53?3:
	c0    ldw $r0.6 = 0x10[$r0.1]   ## bblock 7, line 759, t56, t58
	      xnop 1
;;								## 13
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 7, line 759,  raddr(packFloat64)(P32),  t80,  t54,  t55,  t56
;;								## 14
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t57
	      xnop 3
;;								## 18
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 8, line 759,  t58,  ?2.17?2auto_size(I32),  t57
;;								## 19
.trace 3
L52?3:
	c0    sub $r0.2 = $r0.0, $r0.2   ## bblock 3, line 743,  t19,  0(I32),  t78
	c0    ldw $r0.5 = 0x20[$r0.1]  ## restore ## t79
;;								## 0
	c0    zxth $r0.7 = $r0.2   ## bblock 3, line 738,  t91(I16),  t19
	c0    sub $r0.6 = $r0.0, $r0.2   ## bblock 3, line 743,  t24,  0(I32),  t19
	c0    and $r0.2 = $r0.2, 31   ## bblock 3, line 752,  t99,  t19,  31(I32)
;;								## 1
	c0    and $r0.6 = $r0.6, 31   ## bblock 3, line 742,  t70,  t24,  31(I32)
	c0    shru $r0.8 = $r0.0, $r0.7   ## bblock 3, line 748,  t95,  0(SI32),  t91(I16)
	c0    cmpge $b0.1 = $r0.7, 32   ## bblock 3, line 747,  t94(I1),  t91(I16),  32(SI32)
	c0    cmplt $b0.0 = $r0.7, 64   ## bblock 3, line 752,  t110(I1),  t91(I16),  64(SI32)
;;								## 2
	c0    shru $r0.9 = $r0.5, $r0.7   ## bblock 3, line 749,  t96,  t79,  t91(I16)
	c0    shl $r0.6 = $r0.5, $r0.6   ## bblock 3, line 748,  t97,  t79,  t70
	c0    shru $r0.2 = $r0.5, $r0.2   ## bblock 3, line 752,  t100,  t79,  t99
	c0    cmpne $b0.2 = $r0.7, $r0.0   ## bblock 3, line 737,  t112(I1),  t91(I16),  0(I32)
;;								## 3
	c0    or $r0.6 = $r0.6, $r0.8   ## bblock 3, line 748,  t98,  t97,  t95
	c0    slct $r0.2 = $b0.0, $r0.2, $r0.0   ## bblock 3, line 752,  t101,  t110(I1),  t100,  0(SI32)
	c0    slctf $r0.9 = $b0.1, $r0.9, $r0.0   ## bblock 3, line 749,  t103,  t94(I1),  t96,  0(SI32)
	c0    cmpeq $b0.0 = $r0.7, $r0.0   ## bblock 3, line 736,  t111(I1),  t91(I16),  0(I32)
;;								## 4
	c0    slct $r0.5 = $b0.0, $r0.5, $r0.9   ## bblock 3, line 736,  t74,  t111(I1),  t79,  t103
	c0    slct $r0.2 = $b0.1, $r0.2, $r0.6   ## bblock 3, line 748,  t104,  t94(I1),  t101,  t98
;;								## 5
	c0    stw 0x14[$r0.1] = $r0.5   ## bblock 3, line 756, t58, t74
	c0    slct $r0.2 = $b0.2, $r0.2, $r0.0   ## bblock 3, line 737,  t73,  t112(I1),  t104,  0(SI32)
;;								## 6
	c0    stw 0x10[$r0.1] = $r0.2   ## bblock 3, line 755, t58, t73
;;								## 7
	c0    ldw $r0.5 = 0x14[$r0.1]   ## bblock 7, line 759, t55, t58
;;								## 8
	c0    goto L53?3 ## goto
;;								## 9
.endp
.section .bss
.section .data
.equ ?2.17?2scratch.0, 0x0
.equ _?1PACKET.126, 0x10
.equ _?1PACKET.125, 0x14
.equ ?2.17?2ras_p, 0x18
.equ ?2.17?2spill_p, 0x1c
.section .data
.section .text
.equ ?2.17?2auto_size, 0x40
 ## End _d_ilfloat
 ## Begin _d_ufloat
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
_d_ufloat::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    cmpeq $b0.0 = $r0.3, $r0.0   ## bblock 0, line 767,  t97(I1),  t61,  0(SI32)
	c0    mov $r0.5 = $r0.0   ## 0(I32)
;;								## 0
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    mov $r0.4 = $r0.0   ## 0(SI32)
	c0    stw 0x18[$r0.1] = $l0.0  ## spill ## t49
	c0    mov $r0.2 = $r0.3   ## t61
;;								## 1
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    brf $b0.0, L54?3   ## bblock 0, line 767,  t97(I1)
;;								## 2
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 12, line 768,  raddr(packFloat64)(P32),  0(SI32),  0(SI32),  0(I32),  0(I32)
;;								## 3
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t49
	      xnop 3
;;								## 7
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 13, line 768,  t50,  ?2.18?2auto_size(I32),  t49
;;								## 8
.trace 2
L54?3:
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    call $l0.0 = countLeadingZeros32   ## bblock 1, line 770,  raddr(countLeadingZeros32)(P32),  t61
	c0    mov $r0.3 = $r0.2   ## t61
	c0    stw 0x1c[$r0.1] = $r0.2  ## spill ## t61
;;								## 0
	c0    add $r0.2 = $r0.3, -11   ## bblock 2, line 770,  t70,  t3,  -11(SI32)
	c0    sub $r0.4 = 1053, $r0.3   ## [spec] bblock 7, line 800,  t46,  1053(SI32),  t3
	c0    ldw $r0.7 = 0x1c[$r0.1]  ## restore ## t61
;;								## 1
	c0    cmpge $b0.0 = $r0.2, $r0.0   ## bblock 2, line 771,  t98(I1),  t70,  0(SI32)
	c0    mov $r0.8 = $r0.3   ## t3
;;								## 2
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
;;								## 3
	c0    shl $r0.7 = $r0.7, $r0.2   ## [spec] bblock 11, line 772,  t9,  t61,  t70
	c0    brf $b0.0, L55?3   ## bblock 2, line 771,  t98(I1)
;;								## 4
	c0    stw 0x14[$r0.1] = $r0.7   ## bblock 11, line 772, t50, t9
;;								## 5
	c0    ldw $r0.5 = 0x14[$r0.1]   ## bblock 7, line 800, t47, t50
;;								## 6
	c0    stw 0x10[$r0.1] = $r0.0   ## bblock 11, line 773, t50, 0(SI32)
;;								## 7
L56?3:
	c0    ldw $r0.6 = 0x10[$r0.1]   ## bblock 7, line 800, t48, t50
	      xnop 1
;;								## 9
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 7, line 800,  raddr(packFloat64)(P32),  0(SI32),  t46,  t47,  t48
;;								## 10
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t49
	      xnop 3
;;								## 14
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 8, line 800,  t50,  ?2.18?2auto_size(I32),  t49
;;								## 15
.trace 3
L55?3:
	c0    sub $r0.2 = $r0.0, $r0.2   ## bblock 3, line 784,  t12,  0(I32),  t70
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    ldw $r0.5 = 0x1c[$r0.1]  ## restore ## t61
;;								## 0
	c0    zxth $r0.7 = $r0.2   ## bblock 3, line 779,  t81(I16),  t12
	c0    sub $r0.6 = $r0.0, $r0.2   ## bblock 3, line 784,  t17,  0(I32),  t12
	c0    and $r0.2 = $r0.2, 31   ## bblock 3, line 793,  t89,  t12,  31(I32)
;;								## 1
	c0    and $r0.6 = $r0.6, 31   ## bblock 3, line 783,  t62,  t17,  31(I32)
	c0    shru $r0.8 = $r0.0, $r0.7   ## bblock 3, line 789,  t85,  0(SI32),  t81(I16)
	c0    cmpge $b0.1 = $r0.7, 32   ## bblock 3, line 788,  t84(I1),  t81(I16),  32(SI32)
	c0    cmplt $b0.0 = $r0.7, 64   ## bblock 3, line 793,  t99(I1),  t81(I16),  64(SI32)
;;								## 2
	c0    shru $r0.9 = $r0.5, $r0.7   ## bblock 3, line 790,  t86,  t61,  t81(I16)
	c0    shl $r0.6 = $r0.5, $r0.6   ## bblock 3, line 789,  t87,  t61,  t62
	c0    shru $r0.2 = $r0.5, $r0.2   ## bblock 3, line 793,  t90,  t61,  t89
	c0    cmpne $b0.2 = $r0.7, $r0.0   ## bblock 3, line 778,  t101(I1),  t81(I16),  0(I32)
;;								## 3
	c0    or $r0.6 = $r0.6, $r0.8   ## bblock 3, line 789,  t88,  t87,  t85
	c0    slct $r0.2 = $b0.0, $r0.2, $r0.0   ## bblock 3, line 793,  t91,  t99(I1),  t90,  0(SI32)
	c0    slctf $r0.9 = $b0.1, $r0.9, $r0.0   ## bblock 3, line 790,  t93,  t84(I1),  t86,  0(SI32)
	c0    cmpeq $b0.0 = $r0.7, $r0.0   ## bblock 3, line 777,  t100(I1),  t81(I16),  0(I32)
;;								## 4
	c0    slct $r0.5 = $b0.0, $r0.5, $r0.9   ## bblock 3, line 777,  t66,  t100(I1),  t61,  t93
	c0    slct $r0.2 = $b0.1, $r0.2, $r0.6   ## bblock 3, line 789,  t94,  t84(I1),  t91,  t88
;;								## 5
	c0    stw 0x14[$r0.1] = $r0.5   ## bblock 3, line 797, t50, t66
	c0    slct $r0.2 = $b0.2, $r0.2, $r0.0   ## bblock 3, line 778,  t65,  t101(I1),  t94,  0(SI32)
;;								## 6
	c0    stw 0x10[$r0.1] = $r0.2   ## bblock 3, line 796, t50, t65
;;								## 7
	c0    ldw $r0.5 = 0x14[$r0.1]   ## bblock 7, line 800, t47, t50
;;								## 8
	c0    goto L56?3 ## goto
;;								## 9
.endp
.section .bss
.section .data
.equ ?2.18?2scratch.0, 0x0
.equ _?1PACKET.137, 0x10
.equ _?1PACKET.136, 0x14
.equ ?2.18?2ras_p, 0x18
.equ ?2.18?2spill_p, 0x1c
.section .data
.section .text
.equ ?2.18?2auto_size, 0x20
 ## End _d_ufloat
 ## Begin float32_to_int32_round_to_zero
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:s32)
float32_to_int32_round_to_zero:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    and $r0.2 = $r0.3, 8388607   ## bblock 0, line 810,  t61,  t58,  8388607(I32)
;;								## 0
	c0    shru $r0.6 = $r0.3, 23   ## bblock 0, line 811,  t3(I9),  t58,  23(SI32)
	c0    shru $r0.5 = $r0.3, 31   ## bblock 0, line 812,  t64(I1),  t58,  31(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t45
	c0    mov $r0.7 = $r0.3   ## t58
;;								## 1
	c0    and $r0.6 = $r0.6, 255   ## bblock 0, line 811,  t63,  t3(I9),  255(I32)
	c0    ldw.d $r0.8 = ((_?1PACKET.3 + 0) + 0)[$r0.0]   ## [spec] bblock 7, line 827, t25, 0(I32)
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
;;								## 2
	c0    add $r0.9 = $r0.6, -158   ## bblock 0, line 813,  t62,  t63,  -158(SI32)
	c0    cmple $b0.0 = $r0.6, 126   ## [spec] bblock 1, line 825,  t66(I1),  t63,  126(SI32)
	c0    or $r0.10 = $r0.2, $r0.6   ## [spec] bblock 5, line 826,  t68,  t61,  t63
;;								## 3
	c0    cmpge $b0.1 = $r0.9, $r0.0   ## bblock 0, line 817,  t65(I1),  t62,  0(SI32)
	c0    cmpne $b0.2 = $r0.10, $r0.0   ## [spec] bblock 5, line 826,  t69,  t68,  0(I32)
;;								## 4
	c0    or $r0.8 = $r0.8, 1   ## [spec] bblock 7, line 827,  t26,  t25,  1(I32)
;;								## 5
	c0    br $b0.1, L57?3   ## bblock 0, line 817,  t65(I1)
;;								## 6
	c0    brf $b0.0, L58?3   ## bblock 1, line 825,  t66(I1)
;;								## 7
	c0    brf $b0.2, L59?3   ## bblock 5, line 826,  t69
;;								## 8
.return ret($r0.3:s32)
	c0    stw ((_?1PACKET.3 + 0) + 0)[$r0.0] = $r0.8   ## bblock 7, line 827, 0(I32), t26
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 6, line 828,  t46,  ?2.19?2auto_size(I32),  t45
;;								## 9
.trace 3
L59?3:
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 6, line 828,  t46,  ?2.19?2auto_size(I32),  t45
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
;;								## 0
.trace 2
L58?3:
	c0    or $r0.2 = $r0.2, 8388608   ## bblock 2, line 830,  t28,  t61,  8388608(I32)
	c0    sub $r0.4 = $r0.0, $r0.9   ## bblock 2, line 831,  t32,  0(I32),  t62
	c0    and $r0.6 = $r0.9, 31   ## bblock 2, line 832,  t36,  t62,  31(I32)
;;								## 0
	c0    shl $r0.2 = $r0.2, 8   ## bblock 2, line 830,  t34,  t28,  8(SI32)
	c0    ldw.d $r0.7 = ((_?1PACKET.3 + 0) + 0)[$r0.0]   ## [spec] bblock 4, line 833, t38, 0(I32)
	c0    mtb $b0.0 = $r0.5   ## t64(I1)
;;								## 1
	c0    shru $r0.4 = $r0.2, $r0.4   ## bblock 2, line 831,  t60,  t34,  t32
	c0    shl $r0.6 = $r0.2, $r0.6   ## bblock 2, line 832,  t37,  t34,  t36
;;								## 2
	c0    cmpne $b0.1 = $r0.6, $r0.0   ## bblock 2, line 832,  t67(I1),  t37,  0(SI32)
	c0    sub $r0.2 = $r0.0, $r0.4   ## [spec] bblock 3, line 835,  t42,  0(I32),  t60
;;								## 3
	c0    or $r0.7 = $r0.7, 1   ## [spec] bblock 4, line 833,  t39,  t38,  1(I32)
	c0    slct $r0.3 = $b0.0, $r0.2, $r0.4   ## [spec] bblock 3, line 835,  t44,  t64(I1),  t42,  t60
;;								## 4
	c0    brf $b0.1, L60?3   ## bblock 2, line 832,  t67(I1)
;;								## 5
.return ret($r0.3:s32)
	c0    stw ((_?1PACKET.3 + 0) + 0)[$r0.0] = $r0.7   ## bblock 4, line 833, 0(I32), t39
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 3, line 835,  t46,  ?2.19?2auto_size(I32),  t45
;;								## 6
.trace 4
L60?3:
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 3, line 835,  t46,  ?2.19?2auto_size(I32),  t45
;;								## 0
.trace 5
L57?3:
	c0    cmpeq $b0.0 = $r0.7, (~0x30ffffff)   ## bblock 8, line 818,  t70(I1),  t58,  (~0x30ffffff)(I32)
	c0    cmpeq $b0.1 = $r0.4, $r0.0   ## [spec] bblock 13, line 819,  t76(I1),  t59,  0(SI32)
;;								## 0
	c0    slct $r0.3 = $b0.1, $r0.0, (~0x7fffffff)   ## [spec] bblock 13, line 819,  t12,  t76(I1),  0(SI32),  (~0x7fffffff)(I32)
;;								## 1
	c0    brf $b0.0, L61?3   ## bblock 8, line 818,  t70(I1)
;;								## 2
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 13, line 819,  t46,  ?2.19?2auto_size(I32),  t45
;;								## 3
.trace 6
L61?3:
	c0    stw 0x14[$r0.1] = $r0.4  ## spill ## t59
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    stw 0x18[$r0.1] = $r0.5  ## spill ## t64(I1)
;;								## 1
	c0    stw 0x1c[$r0.1] = $r0.2  ## spill ## t61
;;								## 2
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 9, line 820,  raddr(float_raise)(P32),  16(SI32)
	c0    stw 0x20[$r0.1] = $r0.6  ## spill ## t63
;;								## 3
	c0    mov $r0.2 = 2147483647   ## 2147483647(SI32)
	c0    ldw $r0.6 = 0x20[$r0.1]  ## restore ## t63
;;								## 4
	c0    ldw $r0.5 = 0x1c[$r0.1]  ## restore ## t61
;;								## 5
	c0    ldw $r0.7 = 0x18[$r0.1]  ## restore ## t64(I1)
;;								## 6
	c0    cmpeq $r0.6 = $r0.6, 255   ## bblock 10, line 821,  t15,  t63,  255(SI32)
	c0    ldw $r0.4 = 0x14[$r0.1]  ## restore ## t59
;;								## 7
	c0    andl $r0.6 = $r0.6, $r0.5   ## bblock 10, line 821,  t17,  t15,  t61
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t45
;;								## 8
	c0    cmpeq $r0.7 = $r0.7, $r0.0   ## bblock 10, line 821,  t73,  t64(I1),  0(I32)
;;								## 9
	c0    orl $b0.0 = $r0.7, $r0.6   ## bblock 10, line 821,  t72(I1),  t73,  t17
	c0    cmpne $b0.1 = $r0.4, $r0.0   ## [spec] bblock 12, line 822,  t75(I1),  t59,  0(SI32)
;;								## 10
	c0    slct $r0.3 = $b0.1, $r0.2, (~0x0)   ## [spec] bblock 12, line 822,  t19,  t75(I1),  2147483647(SI32),  (~0x0)(I32)
;;								## 11
	c0    brf $b0.0, L62?3   ## bblock 10, line 821,  t72(I1)
;;								## 12
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 12, line 822,  t46,  ?2.19?2auto_size(I32),  t45
;;								## 13
.trace 7
L62?3:
	c0    ldw $r0.4 = 0x14[$r0.1]  ## restore ## t59
	      xnop 2
;;								## 2
	c0    cmpeq $b0.0 = $r0.4, $r0.0   ## bblock 11, line 823,  t74(I1),  t59,  0(SI32)
;;								## 3
.return ret($r0.3:s32)
	c0    slct $r0.3 = $b0.0, $r0.0, (~0x7fffffff)   ## bblock 11, line 823,  t21,  t74(I1),  0(SI32),  (~0x7fffffff)(I32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 11, line 823,  t46,  ?2.19?2auto_size(I32),  t45
;;								## 4
.endp
.section .bss
.section .data
.equ ?2.19?2scratch.0, 0x0
.equ ?2.19?2ras_p, 0x10
.equ ?2.19?2spill_p, 0x14
.section .data
.section .text
.equ ?2.19?2auto_size, 0x40
 ## End float32_to_int32_round_to_zero
 ## Begin _d_r
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32)
_d_r::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    and $r0.2 = $r0.3, 8388607   ## bblock 0, line 844,  t92,  t82,  8388607(I32)
;;								## 0
	c0    shru $r0.8 = $r0.3, 23   ## bblock 0, line 845,  t3(I9),  t82,  23(SI32)
	c0    shru $r0.7 = $r0.3, 31   ## bblock 0, line 846,  t94(I1),  t82,  31(SI32)
	c0    shru $r0.5 = $r0.2, 3   ## [spec] bblock 2, line 882,  t68,  t92,  3(I32)
	c0    stw 0x18[$r0.1] = $l0.0  ## spill ## t70
;;								## 1
	c0    and $r0.8 = $r0.8, 255   ## bblock 0, line 845,  t93,  t3(I9),  255(I32)
	c0    shl $r0.6 = $r0.2, 29   ## [spec] bblock 2, line 881,  t69,  t92,  29(I32)
	c0    mov $r0.9 = $r0.3   ## t82
;;								## 2
	c0    cmpeq $b0.0 = $r0.8, 255   ## bblock 0, line 850,  t107(I1),  t93,  255(SI32)
	c0    cmpeq $b0.1 = $r0.8, $r0.0   ## [spec] bblock 1, line 858,  t108(I1),  t93,  0(SI32)
	c0    add $r0.4 = $r0.8, 896   ## [spec] bblock 2, line 891,  t67,  t93,  896(SI32)
;;								## 3
	c0    mov $r0.3 = $r0.7   ## t94(I1)
;;								## 4
	c0    br $b0.0, L63?3   ## bblock 0, line 850,  t107(I1)
;;								## 5
	c0    br $b0.1, L64?3   ## bblock 1, line 858,  t108(I1)
;;								## 6
L65?3:
	c0    stw 0x14[$r0.1] = $r0.5   ## bblock 2, line 889, t71, t68
;;								## 7
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    stw 0x10[$r0.1] = $r0.6   ## bblock 2, line 888, t71, t69
	c0    call $l0.0 = packFloat64   ## bblock 2, line 891,  raddr(packFloat64)(P32),  t94(I1),  t67,  t68,  t69
;;								## 8
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t70
	      xnop 3
;;								## 12
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 6, line 891,  t71,  ?2.20?2auto_size(I32),  t70
;;								## 13
.trace 3
L64?3:
	c0    cmpeq $b0.0 = $r0.2, $r0.0   ## bblock 9, line 859,  t109(I1),  t92,  0(SI32)
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    mov $r0.3 = $r0.7   ## t94(I1)
;;								## 0
	c0    mov $r0.4 = $r0.0   ## 0(SI32)
;;								## 1
	c0    brf $b0.0, L66?3   ## bblock 9, line 859,  t109(I1)
;;								## 2
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 12, line 860,  raddr(packFloat64)(P32),  t94(I1),  0(SI32),  0(I32),  0(I32)
;;								## 3
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t70
	      xnop 3
;;								## 7
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 13, line 860,  t71,  ?2.20?2auto_size(I32),  t70
;;								## 8
.trace 5
L66?3:
	c0    stw 0x1c[$r0.1] = $r0.7  ## spill ## t94(I1)
	c0    mov $r0.3 = $r0.2   ## t92
;;								## 0
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    call $l0.0 = countLeadingZeros32   ## bblock 10, line 862,  raddr(countLeadingZeros32)(P32),  t92
	c0    stw 0x20[$r0.1] = $r0.2  ## spill ## t92
;;								## 1
	c0    add $r0.2 = $r0.3, -8   ## bblock 11, line 862,  t29,  t23,  -8(SI32)
	c0    sub $r0.8 = 8, $r0.3   ## bblock 11, line 866,  t93,  8(SI32),  t23
	c0    ldw $r0.7 = 0x20[$r0.1]  ## restore ## t92
;;								## 2
	c0    add $r0.4 = $r0.8, 896   ## bblock 2, line 891,  t67,  t93,  896(SI32)
	c0    ldw $r0.3 = 0x1c[$r0.1]  ## restore ## t94(I1)
	      xnop 1
;;								## 4
	c0    shl $r0.7 = $r0.7, $r0.2   ## bblock 11, line 863,  t92,  t92,  t29
;;								## 5
	c0    shru $r0.5 = $r0.7, 3   ## bblock 2, line 882,  t68,  t92,  3(I32)
	c0    shl $r0.6 = $r0.7, 29   ## bblock 2, line 881,  t69,  t92,  29(I32)
	c0    goto L65?3 ## goto
;;								## 6
.trace 2
L63?3:
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 14, line 851,  t110(I1),  t92,  0(SI32)
	c0    mov $r0.3 = $r0.9   ## t82
	      xnop 1
;;								## 1
	c0    brf $b0.0, L67?3   ## bblock 14, line 851,  t110(I1)
;;								## 2
.call float32ToCommonNaN, caller, arg($r0.3:u32), ret($r0.3:s32,$r0.4:u32,$r0.5:u32)
	c0    call $l0.0 = float32ToCommonNaN   ## bblock 17, line 852,  raddr(float32ToCommonNaN)(P32),  t82
;;								## 3
.call commonNaNToFloat64, caller, arg($r0.3:s32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = commonNaNToFloat64   ## bblock 18, line 852,  raddr(commonNaNToFloat64)(P32),  t11,  t12,  t13
;;								## 4
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t70
	      xnop 3
;;								## 8
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 19, line 852,  t71,  ?2.20?2auto_size(I32),  t70
;;								## 9
.trace 4
L67?3:
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    mov $r0.3 = $r0.7   ## t94(I1)
;;								## 0
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 15, line 853,  raddr(packFloat64)(P32),  t94(I1),  2047(SI32),  0(I32),  0(I32)
	c0    mov $r0.4 = 2047   ## 2047(SI32)
;;								## 1
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t70
	      xnop 3
;;								## 5
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 16, line 853,  t71,  ?2.20?2auto_size(I32),  t70
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.20?2scratch.0, 0x0
.equ _?1PACKET.155, 0x10
.equ _?1PACKET.154, 0x14
.equ ?2.20?2ras_p, 0x18
.equ ?2.20?2spill_p, 0x1c
.section .data
.section .text
.equ ?2.20?2auto_size, 0x40
 ## End _d_r
 ## Begin addFloat32Sigs
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:s32)
addFloat32Sigs:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    and $r0.2 = $r0.3, 8388607   ## bblock 0, line 900,  t13,  t137,  8388607(I32)
;;								## 0
	c0    and $r0.6 = $r0.4, 8388607   ## bblock 0, line 902,  t15,  t138,  8388607(I32)
	c0    shl $r0.2 = $r0.2, 6   ## bblock 0, line 905,  t14,  t13,  6(SI32)
	c0    stw 0x18[$r0.1] = $l0.0  ## spill ## t123
;;								## 1
	c0    shru $r0.7 = $r0.3, 23   ## bblock 0, line 901,  t3(I9),  t137,  23(SI32)
	c0    shru $r0.8 = $r0.4, 23   ## bblock 0, line 903,  t8(I9),  t138,  23(SI32)
	c0    shl $r0.6 = $r0.6, 6   ## bblock 0, line 906,  t16,  t15,  6(SI32)
	c0    mov $r0.9 = $r0.3   ## t137
;;								## 2
	c0    and $r0.7 = $r0.7, 255   ## bblock 0, line 901,  t152,  t3(I9),  255(I32)
	c0    and $r0.8 = $r0.8, 255   ## bblock 0, line 903,  t151,  t8(I9),  255(I32)
	c0    stw 0x14[$r0.1] = $r0.2   ## bblock 0, line 905, t124, t14
	c0    mov $r0.3 = $r0.5   ## t139
;;								## 3
	c0    sub $r0.2 = $r0.7, $r0.8   ## bblock 0, line 904,  t148,  t152,  t151
	c0    cmpeq $b0.0 = $r0.7, 255   ## [spec] bblock 28, line 911,  t211(I1),  t152,  255(SI32)
	c0    cmpeq $b0.1 = $r0.8, $r0.0   ## [spec] bblock 29, line 916,  t212(I1),  t151,  0(SI32)
	c0    ldw.d $r0.10 = 0x14[$r0.1]   ## [spec] bblock 19, line 990, t105, t124
;;								## 4
	c0    stw 0x10[$r0.1] = $r0.6   ## bblock 0, line 906, t124, t16
	c0    cmpgt $b0.2 = $r0.2, $r0.0   ## bblock 0, line 907,  t200(I1),  t148,  0(SI32)
	c0    mov $r0.11 = $r0.7   ## [spec] bblock 31, line 938,  t150,  t152
;;								## 5
	c0    ldw.d $r0.6 = 0x10[$r0.1]   ## [spec] bblock 31, line 924, t186, t124
	c0    add $r0.12 = $r0.11, -1   ## [spec] bblock 19, line 992,  t198,  t150,  -1(SI32)
;;								## 6
	c0    or $r0.10 = $r0.10, 536870912   ## [spec] bblock 19, line 990,  t108,  t105,  536870912(I32)
	c0    brf $b0.2, L68?3   ## bblock 0, line 907,  t200(I1)
;;								## 7
	c0    br $b0.0, L69?3   ## bblock 28, line 911,  t211(I1)
;;								## 8
	c0    cmpne $r0.8 = $r0.6, $r0.0   ## [spec] bblock 31, line 934,  t194,  t186,  0(I32)
	c0    brf $b0.1, L70?3   ## bblock 29, line 916,  t212(I1)
;;								## 9
	c0    add $r0.2 = $r0.2, -1   ## bblock 37, line 917,  t148,  t148,  -1(SI32)
	c0    stw 0x14[$r0.1] = $r0.10   ## bblock 19, line 990, t124, t108
;;								## 10
L71?3:
	c0    sub $r0.7 = $r0.0, $r0.2   ## bblock 31, line 931,  t188,  0(I32),  t148
	c0    shru $r0.9 = $r0.6, $r0.2   ## bblock 31, line 931,  t189,  t186,  t148
	c0    cmpge $b0.0 = $r0.2, 32   ## bblock 31, line 930,  t187(I1),  t148,  32(SI32)
	c0    cmpeq $b0.1 = $r0.2, $r0.0   ## bblock 31, line 924,  t213(I1),  t148,  0(I32)
;;								## 11
	c0    and $r0.7 = $r0.7, 31   ## bblock 31, line 931,  t190,  t188,  31(I32)
;;								## 12
	c0    shl $r0.7 = $r0.6, $r0.7   ## bblock 31, line 931,  t191,  t186,  t190
;;								## 13
	c0    cmpne $r0.7 = $r0.7, $r0.0   ## bblock 31, line 931,  t192,  t191,  0(I32)
;;								## 14
	c0    or $r0.9 = $r0.9, $r0.7   ## bblock 31, line 931,  t193,  t189,  t192
;;								## 15
	c0    slct $r0.8 = $b0.0, $r0.8, $r0.9   ## bblock 31, line 931,  t195,  t187(I1),  t194,  t193
;;								## 16
	c0    slct $r0.6 = $b0.1, $r0.6, $r0.8   ## bblock 31, line 924,  t145,  t213(I1),  t186,  t195
;;								## 17
	c0    stw 0x10[$r0.1] = $r0.6   ## bblock 31, line 936, t124, t145
;;								## 18
L72?3:
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 19, line 991, t107, t124
	      xnop 2
;;								## 21
	c0    add $r0.10 = $r0.10, $r0.2   ## bblock 19, line 991,  t164,  t108,  t107
;;								## 22
	c0    shl $r0.2 = $r0.10, 1   ## bblock 19, line 991,  t197,  t164,  1(SI32)
;;								## 23
	c0    cmpge $b0.0 = $r0.2, $r0.0   ## bblock 19, line 993,  t163(I1),  t197,  0(SI32)
;;								## 24
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
	c0    slct $r0.5 = $b0.0, $r0.2, $r0.10   ## bblock 19, line 991,  t149,  t163(I1),  t197,  t164
	c0    slct $r0.4 = $b0.0, $r0.12, $r0.11   ## bblock 19, line 995,  t154,  t163(I1),  t198,  t150
	c0    call $l0.0 = roundAndPackFloat32   ## bblock 5, line 998,  raddr(roundAndPackFloat32)(P32),  t139,  t154,  t149
;;								## 25
L73?3:
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t123
	      xnop 3
;;								## 29
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 6, line 998,  t124,  ?2.21?2auto_size(I32),  t123
;;								## 30
.trace 4
L70?3:
	c0    ldw $r0.4 = 0x10[$r0.1]   ## bblock 30, line 920, t27, t124
	c0    mov $r0.3 = $r0.5   ## t139
;;								## 0
	c0    stw 0x14[$r0.1] = $r0.10   ## bblock 19, line 990, t124, t108
	      xnop 1
;;								## 2
	c0    or $r0.4 = $r0.4, 536870912   ## bblock 30, line 920,  t28,  t27,  536870912(I32)
;;								## 3
	c0    stw 0x10[$r0.1] = $r0.4   ## bblock 30, line 920, t124, t28
;;								## 4
	c0    ldw $r0.6 = 0x10[$r0.1]   ## bblock 31, line 924, t186, t124
	      xnop 2
;;								## 7
	c0    cmpne $r0.8 = $r0.6, $r0.0   ## bblock 31, line 934,  t194,  t186,  0(I32)
	c0    goto L71?3 ## goto
;;								## 8
.trace 7
L69?3:
	c0    ldw $r0.2 = 0x14[$r0.1]   ## bblock 38, line 912, t19, t124
	c0    mov $r0.3 = $r0.9   ## t137
	      xnop 2
;;								## 2
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 38, line 912,  t214(I1),  t19,  0(SI32)
	      xnop 1
;;								## 4
	c0    brf $b0.0, L74?3   ## bblock 38, line 912,  t214(I1)
;;								## 5
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = propagateFloat32NaN   ## bblock 40, line 913,  raddr(propagateFloat32NaN)(P32),  t137,  t138
;;								## 6
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t123
	      xnop 3
;;								## 10
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 41, line 913,  t124,  ?2.21?2auto_size(I32),  t123
;;								## 11
.trace 9
L74?3:
	c0    mov $r0.3 = $r0.9   ## t137
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t123
	      xnop 3
;;								## 3
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 39, line 914,  t124,  ?2.21?2auto_size(I32),  t123
;;								## 4
.trace 2
L68?3:
	c0    cmplt $b0.0 = $r0.2, $r0.0   ## bblock 1, line 940,  t201(I1),  t148,  0(SI32)
	c0    cmpeq $b0.1 = $r0.8, 255   ## [spec] bblock 12, line 944,  t207(I1),  t151,  255(SI32)
	c0    cmpeq $b0.2 = $r0.7, $r0.0   ## [spec] bblock 13, line 950,  t208(I1),  t152,  0(SI32)
	c0    ldw.d $r0.13 = 0x14[$r0.1]   ## [spec] bblock 15, line 958, t175, t124
;;								## 0
	c0    mov $r0.11 = $r0.8   ## [spec] bblock 15, line 972,  t150,  t151
	c0    mov $r0.3 = $r0.5   ## t139
;;								## 1
	c0    add $r0.12 = $r0.11, -1   ## [spec] bblock 19, line 992,  t198,  t150,  -1(SI32)
	c0    brf $b0.0, L75?3   ## bblock 1, line 940,  t201(I1)
;;								## 2
	c0    cmpne $r0.6 = $r0.13, $r0.0   ## [spec] bblock 15, line 968,  t183,  t175,  0(I32)
	c0    br $b0.1, L76?3   ## bblock 12, line 944,  t207(I1)
;;								## 3
	c0    brf $b0.2, L77?3   ## bblock 13, line 950,  t208(I1)
;;								## 4
	c0    add $r0.2 = $r0.2, 1   ## bblock 23, line 951,  t148,  t148,  1(SI32)
;;								## 5
L78?3:
	c0    sub $r0.2 = $r0.0, $r0.2   ## bblock 15, line 961,  t174,  0(I32),  t148
;;								## 6
	c0    sub $r0.9 = $r0.0, $r0.2   ## bblock 15, line 965,  t177,  0(I32),  t174
	c0    shru $r0.14 = $r0.13, $r0.2   ## bblock 15, line 965,  t178,  t175,  t174
	c0    cmpge $b0.0 = $r0.2, 32   ## bblock 15, line 964,  t176(I1),  t174,  32(SI32)
	c0    cmpeq $b0.1 = $r0.2, $r0.0   ## bblock 15, line 958,  t209(I1),  t174,  0(I32)
;;								## 7
	c0    and $r0.9 = $r0.9, 31   ## bblock 15, line 965,  t179,  t177,  31(I32)
;;								## 8
	c0    shl $r0.9 = $r0.13, $r0.9   ## bblock 15, line 965,  t180,  t175,  t179
;;								## 9
	c0    cmpne $r0.9 = $r0.9, $r0.0   ## bblock 15, line 965,  t181,  t180,  0(I32)
;;								## 10
	c0    or $r0.14 = $r0.14, $r0.9   ## bblock 15, line 965,  t182,  t178,  t181
;;								## 11
	c0    slct $r0.6 = $b0.0, $r0.6, $r0.14   ## bblock 15, line 965,  t184,  t176(I1),  t183,  t182
;;								## 12
	c0    slct $r0.13 = $b0.1, $r0.13, $r0.6   ## bblock 15, line 958,  t141,  t209(I1),  t175,  t184
;;								## 13
	c0    stw 0x14[$r0.1] = $r0.13   ## bblock 15, line 970, t124, t141
;;								## 14
	c0    ldw $r0.6 = 0x14[$r0.1]   ## bblock 19, line 990, t105, t124
	      xnop 2
;;								## 17
	c0    or $r0.10 = $r0.6, 536870912   ## bblock 19, line 990,  t108,  t105,  536870912(I32)
;;								## 18
	c0    stw 0x14[$r0.1] = $r0.10   ## bblock 19, line 990, t124, t108
	c0    goto L72?3 ## goto
;;								## 19
.trace 5
L77?3:
	c0    ldw $r0.4 = 0x14[$r0.1]   ## bblock 14, line 954, t62, t124
	      xnop 2
;;								## 2
	c0    or $r0.4 = $r0.4, 536870912   ## bblock 14, line 954,  t63,  t62,  536870912(I32)
;;								## 3
	c0    stw 0x14[$r0.1] = $r0.4   ## bblock 14, line 954, t124, t63
;;								## 4
	c0    ldw $r0.13 = 0x14[$r0.1]   ## bblock 15, line 958, t175, t124
	      xnop 2
;;								## 7
	c0    cmpne $r0.6 = $r0.13, $r0.0   ## bblock 15, line 968,  t183,  t175,  0(I32)
	c0    goto L78?3 ## goto
;;								## 8
.trace 10
L76?3:
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 24, line 945, t52, t124
	c0    mov $r0.3 = $r0.9   ## t137
	c0    mov $r0.5 = $r0.3   ## t139
	      xnop 2
;;								## 2
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 24, line 945,  t210(I1),  t52,  0(SI32)
	      xnop 1
;;								## 4
	c0    brf $b0.0, L79?3   ## bblock 24, line 945,  t210(I1)
;;								## 5
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = propagateFloat32NaN   ## bblock 26, line 946,  raddr(propagateFloat32NaN)(P32),  t137,  t138
;;								## 6
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t123
	      xnop 3
;;								## 10
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 27, line 946,  t124,  ?2.21?2auto_size(I32),  t123
;;								## 11
.trace 12
L79?3:
	c0    shl $r0.5 = $r0.5, 31   ## bblock 25, line 947,  t57,  t139,  31(SI32)
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t123
;;								## 0
	c0    add $r0.3 = $r0.5, 2139095040   ## bblock 25, line 948,  t58,  t57,  2139095040(I32)
	      xnop 2
;;								## 3
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 25, line 948,  t124,  ?2.21?2auto_size(I32),  t123
;;								## 4
.trace 3
L75?3:
	c0    cmpeq $b0.0 = $r0.7, 255   ## bblock 2, line 978,  t202(I1),  t152,  255(SI32)
	c0    cmpeq $b0.1 = $r0.7, $r0.0   ## [spec] bblock 3, line 983,  t203(I1),  t152,  0(SI32)
	c0    ldw.d $r0.2 = 0x10[$r0.1]   ## [spec] bblock 7, line 985, t94, t124
	c0    shl $r0.6 = $r0.3, 31   ## [spec] bblock 7, line 984,  t99,  t139,  31(SI32)
;;								## 0
	c0    ldw.d $r0.8 = 0x14[$r0.1]   ## [spec] bblock 7, line 985, t95, t124
;;								## 1
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t123
	c0    br $b0.0, L80?3   ## bblock 2, line 978,  t202(I1)
;;								## 2
	c0    brf $b0.1, L81?3   ## bblock 3, line 983,  t203(I1)
;;								## 3
	c0    add $r0.2 = $r0.2, $r0.8   ## bblock 7, line 985,  t96,  t94,  t95
;;								## 4
	c0    shru $r0.2 = $r0.2, 6   ## bblock 7, line 985,  t97(I26),  t96,  6(SI32)
;;								## 5
.return ret($r0.3:u32)
	c0    add $r0.3 = $r0.2, $r0.6   ## bblock 7, line 985,  t100,  t97(I26),  t99
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 7, line 985,  t124,  ?2.21?2auto_size(I32),  t123
;;								## 6
.trace 6
L81?3:
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 4, line 986, t101, t124
	c0    mov $r0.4 = $r0.7   ## bblock 4, line 987,  t154,  t152
;;								## 0
	c0    ldw $r0.6 = 0x14[$r0.1]   ## bblock 4, line 986, t102, t124
	      xnop 1
;;								## 2
	c0    add $r0.2 = $r0.2, 1073741824   ## bblock 4, line 986,  t204,  t101,  1073741824(SI32)
;;								## 3
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
	c0    add $r0.5 = $r0.2, $r0.6   ## bblock 4, line 986,  t149,  t204,  t102
	c0    call $l0.0 = roundAndPackFloat32   ## bblock 5, line 998,  raddr(roundAndPackFloat32)(P32),  t139,  t154,  t149
;;								## 4
	c0    goto L73?3 ## goto
;;								## 5
.trace 8
L80?3:
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 8, line 979, t87, t124
	c0    mov $r0.3 = $r0.9   ## t137
;;								## 0
	c0    ldw $r0.5 = 0x14[$r0.1]   ## bblock 8, line 979, t88, t124
	      xnop 2
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.5   ## bblock 8, line 979,  t205,  t87,  t88
;;								## 4
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 8, line 979,  t206,  t205,  0(I32)
	      xnop 1
;;								## 6
	c0    brf $b0.0, L82?3   ## bblock 8, line 979,  t206
;;								## 7
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = propagateFloat32NaN   ## bblock 10, line 980,  raddr(propagateFloat32NaN)(P32),  t137,  t138
;;								## 8
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t123
	      xnop 3
;;								## 12
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 11, line 980,  t124,  ?2.21?2auto_size(I32),  t123
;;								## 13
.trace 11
L82?3:
	c0    mov $r0.3 = $r0.9   ## t137
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t123
	      xnop 3
;;								## 3
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 9, line 981,  t124,  ?2.21?2auto_size(I32),  t123
;;								## 4
.endp
.section .bss
.section .data
.equ ?2.21?2scratch.0, 0x0
.equ _?1PACKET.169, 0x10
.equ _?1PACKET.168, 0x14
.equ ?2.21?2ras_p, 0x18
.section .data
.section .text
.equ ?2.21?2auto_size, 0x20
 ## End addFloat32Sigs
 ## Begin subFloat32Sigs
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:s32)
subFloat32Sigs:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    and $r0.2 = $r0.3, 8388607   ## bblock 0, line 1007,  t13,  t134,  8388607(I32)
;;								## 0
	c0    and $r0.6 = $r0.4, 8388607   ## bblock 0, line 1009,  t15,  t135,  8388607(I32)
	c0    shl $r0.2 = $r0.2, 7   ## bblock 0, line 1012,  t14,  t13,  7(SI32)
	c0    stw 0x18[$r0.1] = $l0.0  ## spill ## t120
;;								## 1
	c0    shru $r0.7 = $r0.3, 23   ## bblock 0, line 1008,  t3(I9),  t134,  23(SI32)
	c0    shru $r0.8 = $r0.4, 23   ## bblock 0, line 1010,  t8(I9),  t135,  23(SI32)
	c0    shl $r0.6 = $r0.6, 7   ## bblock 0, line 1013,  t16,  t15,  7(SI32)
	c0    mov $r0.9 = $r0.3   ## t134
;;								## 2
	c0    and $r0.7 = $r0.7, 255   ## bblock 0, line 1008,  t149,  t3(I9),  255(I32)
	c0    and $r0.8 = $r0.8, 255   ## bblock 0, line 1010,  t148,  t8(I9),  255(I32)
	c0    stw 0x14[$r0.1] = $r0.2   ## bblock 0, line 1012, t121, t14
	c0    mov $r0.3 = $r0.5   ## t136
;;								## 3
	c0    sub $r0.2 = $r0.7, $r0.8   ## bblock 0, line 1011,  t145,  t149,  t148
	c0    cmpeq $b0.0 = $r0.7, 255   ## [spec] bblock 31, line 1079,  t213(I1),  t149,  255(SI32)
	c0    cmpeq $b0.1 = $r0.8, $r0.0   ## [spec] bblock 32, line 1084,  t214(I1),  t148,  0(SI32)
	c0    ldw.d $r0.10 = 0x14[$r0.1]   ## [spec] bblock 34, line 1106, t108, t121
;;								## 4
	c0    stw 0x10[$r0.1] = $r0.6   ## bblock 0, line 1013, t121, t16
	c0    cmpgt $b0.2 = $r0.2, $r0.0   ## bblock 0, line 1014,  t200(I1),  t145,  0(SI32)
	c0    mov $r0.11 = $r0.7   ## [spec] bblock 10, line 1109,  t147,  t149
;;								## 5
	c0    ldw.d $r0.6 = 0x10[$r0.1]   ## [spec] bblock 34, line 1092, t184, t121
	c0    mov $r0.12 = $r0.4   ## t135
;;								## 6
	c0    or $r0.10 = $r0.10, 1073741824   ## [spec] bblock 34, line 1106,  t109,  t108,  1073741824(I32)
	c0    add $r0.4 = $r0.11, -1   ## [spec] bblock 8, line 1111,  t118,  t147,  -1(SI32)
	c0    brf $b0.2, L83?3   ## bblock 0, line 1014,  t200(I1)
;;								## 7
	c0    br $b0.0, L84?3   ## bblock 31, line 1079,  t213(I1)
;;								## 8
	c0    cmpne $r0.8 = $r0.6, $r0.0   ## [spec] bblock 34, line 1102,  t192,  t184,  0(I32)
	c0    brf $b0.1, L85?3   ## bblock 32, line 1084,  t214(I1)
;;								## 9
	c0    add $r0.2 = $r0.2, -1   ## bblock 40, line 1085,  t145,  t145,  -1(SI32)
	c0    stw 0x14[$r0.1] = $r0.10   ## bblock 34, line 1106, t121, t109
;;								## 10
L86?3:
	c0    sub $r0.7 = $r0.0, $r0.2   ## bblock 34, line 1099,  t186,  0(I32),  t145
	c0    shru $r0.9 = $r0.6, $r0.2   ## bblock 34, line 1099,  t187,  t184,  t145
	c0    cmpge $b0.0 = $r0.2, 32   ## bblock 34, line 1098,  t185(I1),  t145,  32(SI32)
	c0    cmpeq $b0.1 = $r0.2, $r0.0   ## bblock 34, line 1092,  t215(I1),  t145,  0(I32)
;;								## 11
	c0    and $r0.7 = $r0.7, 31   ## bblock 34, line 1099,  t188,  t186,  31(I32)
	c0    ldw $r0.2 = 0x14[$r0.1]   ## bblock 10, line 1108, t111, t121
;;								## 12
	c0    shl $r0.7 = $r0.6, $r0.7   ## bblock 34, line 1099,  t189,  t184,  t188
;;								## 13
	c0    cmpne $r0.7 = $r0.7, $r0.0   ## bblock 34, line 1099,  t190,  t189,  0(I32)
;;								## 14
	c0    or $r0.9 = $r0.9, $r0.7   ## bblock 34, line 1099,  t191,  t187,  t190
;;								## 15
	c0    slct $r0.8 = $b0.0, $r0.8, $r0.9   ## bblock 34, line 1099,  t193,  t185(I1),  t192,  t191
;;								## 16
	c0    slct $r0.6 = $b0.1, $r0.6, $r0.8   ## bblock 34, line 1092,  t138,  t215(I1),  t184,  t193
;;								## 17
	c0    stw 0x10[$r0.1] = $r0.6   ## bblock 34, line 1104, t121, t138
;;								## 18
L87?3:
	c0    ldw $r0.6 = 0x10[$r0.1]   ## bblock 10, line 1108, t110, t121
	      xnop 2
;;								## 21
.call normalizeRoundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
	c0    sub $r0.5 = $r0.2, $r0.6   ## bblock 10, line 1108,  t146,  t111,  t110
	c0    call $l0.0 = normalizeRoundAndPackFloat32   ## bblock 8, line 1112,  raddr(normalizeRoundAndPackFloat32)(P32),  t136,  t118,  t146
;;								## 22
L88?3:
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t120
	      xnop 3
;;								## 26
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 9, line 1112,  t121,  ?2.22?2auto_size(I32),  t120
;;								## 27
.trace 4
L85?3:
	c0    ldw $r0.7 = 0x10[$r0.1]   ## bblock 33, line 1088, t86, t121
	c0    mov $r0.3 = $r0.5   ## t136
;;								## 0
	c0    stw 0x14[$r0.1] = $r0.10   ## bblock 34, line 1106, t121, t109
	      xnop 1
;;								## 2
	c0    or $r0.7 = $r0.7, 1073741824   ## bblock 33, line 1088,  t87,  t86,  1073741824(I32)
;;								## 3
	c0    stw 0x10[$r0.1] = $r0.7   ## bblock 33, line 1088, t121, t87
;;								## 4
	c0    ldw $r0.6 = 0x10[$r0.1]   ## bblock 34, line 1092, t184, t121
	      xnop 2
;;								## 7
	c0    cmpne $r0.8 = $r0.6, $r0.0   ## bblock 34, line 1102,  t192,  t184,  0(I32)
	c0    goto L86?3 ## goto
;;								## 8
.trace 8
L84?3:
	c0    ldw $r0.2 = 0x14[$r0.1]   ## bblock 41, line 1080, t78, t121
	c0    mov $r0.4 = $r0.12   ## t135
	c0    mov $r0.3 = $r0.9   ## t134
	      xnop 2
;;								## 2
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 41, line 1080,  t216(I1),  t78,  0(SI32)
	      xnop 1
;;								## 4
	c0    brf $b0.0, L89?3   ## bblock 41, line 1080,  t216(I1)
;;								## 5
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = propagateFloat32NaN   ## bblock 43, line 1081,  raddr(propagateFloat32NaN)(P32),  t134,  t135
;;								## 6
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t120
	      xnop 3
;;								## 10
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 44, line 1081,  t121,  ?2.22?2auto_size(I32),  t120
;;								## 11
.trace 10
L89?3:
	c0    mov $r0.3 = $r0.9   ## t134
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t120
	      xnop 3
;;								## 3
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 42, line 1082,  t121,  ?2.22?2auto_size(I32),  t120
;;								## 4
.trace 2
L83?3:
	c0    cmplt $b0.0 = $r0.2, $r0.0   ## bblock 1, line 1016,  t201(I1),  t145,  0(SI32)
	c0    cmpeq $b0.1 = $r0.8, 255   ## [spec] bblock 17, line 1041,  t209(I1),  t148,  255(SI32)
	c0    cmpeq $b0.2 = $r0.7, $r0.0   ## [spec] bblock 18, line 1047,  t210(I1),  t149,  0(SI32)
	c0    ldw.d $r0.10 = 0x14[$r0.1]   ## [spec] bblock 20, line 1055, t173, t121
;;								## 0
	c0    ldw.d $r0.6 = 0x10[$r0.1]   ## [spec] bblock 20, line 1069, t69, t121
	c0    mov $r0.11 = $r0.8   ## [spec] bblock 7, line 1072,  t147,  t148
;;								## 1
	c0    add $r0.4 = $r0.11, -1   ## [spec] bblock 8, line 1111,  t118,  t147,  -1(SI32)
	c0    brf $b0.0, L90?3   ## bblock 1, line 1016,  t201(I1)
;;								## 2
	c0    cmpne $r0.11 = $r0.10, $r0.0   ## [spec] bblock 20, line 1065,  t181,  t173,  0(I32)
	c0    br $b0.1, L91?3   ## bblock 17, line 1041,  t209(I1)
;;								## 3
	c0    or $r0.6 = $r0.6, 1073741824   ## [spec] bblock 20, line 1069,  t70,  t69,  1073741824(I32)
	c0    brf $b0.2, L92?3   ## bblock 18, line 1047,  t210(I1)
;;								## 4
	c0    add $r0.2 = $r0.2, 1   ## bblock 26, line 1048,  t145,  t145,  1(SI32)
	c0    stw 0x10[$r0.1] = $r0.6   ## bblock 20, line 1069, t121, t70
	c0    xor $r0.3 = $r0.5, 1   ## bblock 7, line 1073,  t136,  t136,  1(SI32)
;;								## 5
L93?3:
	c0    sub $r0.2 = $r0.0, $r0.2   ## bblock 20, line 1058,  t172,  0(I32),  t145
	c0    ldw $r0.6 = 0x10[$r0.1]   ## bblock 7, line 1071, t72, t121
;;								## 6
	c0    sub $r0.9 = $r0.0, $r0.2   ## bblock 20, line 1062,  t175,  0(I32),  t172
	c0    shru $r0.12 = $r0.10, $r0.2   ## bblock 20, line 1062,  t176,  t173,  t172
	c0    cmpge $b0.0 = $r0.2, 32   ## bblock 20, line 1061,  t174(I1),  t172,  32(SI32)
	c0    cmpeq $b0.1 = $r0.2, $r0.0   ## bblock 20, line 1055,  t211(I1),  t172,  0(I32)
;;								## 7
	c0    and $r0.9 = $r0.9, 31   ## bblock 20, line 1062,  t177,  t175,  31(I32)
;;								## 8
	c0    shl $r0.9 = $r0.10, $r0.9   ## bblock 20, line 1062,  t178,  t173,  t177
;;								## 9
	c0    cmpne $r0.9 = $r0.9, $r0.0   ## bblock 20, line 1062,  t179,  t178,  0(I32)
;;								## 10
	c0    or $r0.12 = $r0.12, $r0.9   ## bblock 20, line 1062,  t180,  t176,  t179
;;								## 11
	c0    slct $r0.11 = $b0.0, $r0.11, $r0.12   ## bblock 20, line 1062,  t182,  t174(I1),  t181,  t180
;;								## 12
	c0    slct $r0.10 = $b0.1, $r0.10, $r0.11   ## bblock 20, line 1055,  t142,  t211(I1),  t173,  t182
;;								## 13
	c0    stw 0x14[$r0.1] = $r0.10   ## bblock 20, line 1067, t121, t142
;;								## 14
L94?3:
	c0    ldw $r0.9 = 0x14[$r0.1]   ## bblock 7, line 1071, t71, t121
	      xnop 2
;;								## 17
.call normalizeRoundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
	c0    sub $r0.5 = $r0.6, $r0.9   ## bblock 7, line 1071,  t146,  t72,  t71
	c0    call $l0.0 = normalizeRoundAndPackFloat32   ## bblock 8, line 1112,  raddr(normalizeRoundAndPackFloat32)(P32),  t136,  t118,  t146
;;								## 18
	c0    goto L88?3 ## goto
;;								## 19
.trace 6
L92?3:
	c0    ldw $r0.7 = 0x14[$r0.1]   ## bblock 19, line 1051, t46, t121
	c0    xor $r0.3 = $r0.5, 1   ## bblock 7, line 1073,  t136,  t136,  1(SI32)
;;								## 0
	c0    stw 0x10[$r0.1] = $r0.6   ## bblock 20, line 1069, t121, t70
	      xnop 1
;;								## 2
	c0    or $r0.7 = $r0.7, 1073741824   ## bblock 19, line 1051,  t47,  t46,  1073741824(I32)
;;								## 3
	c0    stw 0x14[$r0.1] = $r0.7   ## bblock 19, line 1051, t121, t47
;;								## 4
	c0    ldw $r0.10 = 0x14[$r0.1]   ## bblock 20, line 1055, t173, t121
	      xnop 2
;;								## 7
	c0    cmpne $r0.11 = $r0.10, $r0.0   ## bblock 20, line 1065,  t181,  t173,  0(I32)
	c0    goto L93?3 ## goto
;;								## 8
.trace 11
L91?3:
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 27, line 1042, t35, t121
	c0    mov $r0.4 = $r0.12   ## t135
	c0    mov $r0.3 = $r0.9   ## t134
	      xnop 2
;;								## 2
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 27, line 1042,  t212(I1),  t35,  0(SI32)
	      xnop 1
;;								## 4
	c0    brf $b0.0, L95?3   ## bblock 27, line 1042,  t212(I1)
;;								## 5
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = propagateFloat32NaN   ## bblock 29, line 1043,  raddr(propagateFloat32NaN)(P32),  t134,  t135
;;								## 6
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t120
	      xnop 3
;;								## 10
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 30, line 1043,  t121,  ?2.22?2auto_size(I32),  t120
;;								## 11
.trace 12
L95?3:
	c0    xor $r0.5 = $r0.5, 1   ## bblock 28, line 1044,  t40,  t136,  1(SI32)
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t120
;;								## 0
	c0    shl $r0.5 = $r0.5, 31   ## bblock 28, line 1044,  t41,  t40,  31(SI32)
;;								## 1
	c0    add $r0.3 = $r0.5, 2139095040   ## bblock 28, line 1045,  t42,  t41,  2139095040(I32)
	      xnop 1
;;								## 3
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 28, line 1045,  t121,  ?2.22?2auto_size(I32),  t120
;;								## 4
.trace 3
L90?3:
	c0    cmpeq $b0.0 = $r0.7, 255   ## bblock 2, line 1021,  t202(I1),  t149,  255(SI32)
	c0    cmpne $b0.1 = $r0.7, $r0.0   ## [spec] bblock 3, line 1028,  t203(I1),  t149,  0(I32)
	c0    cmpne $b0.2 = $r0.7, $r0.0   ## [spec] bblock 3, line 1028,  t204(I1),  t149,  0(I32)
	c0    ldw.d $r0.10 = 0x10[$r0.1]   ## [spec] bblock 3, line 1031, t26, t121
;;								## 0
	c0    slct $r0.8 = $b0.1, $r0.8, 1   ## [spec] bblock 3, line 1028,  t148,  t203(I1),  t148,  1(SI32)
	c0    slct $r0.7 = $b0.2, $r0.7, 1   ## [spec] bblock 3, line 1028,  t149,  t204(I1),  t149,  1(SI32)
	c0    ldw.d $r0.6 = 0x14[$r0.1]   ## [spec] bblock 3, line 1031, t27, t121
	c0    mov $r0.3 = $r0.5   ## t136
;;								## 1
	c0    ldw.d $r0.2 = 0x14[$r0.1]   ## [spec] bblock 10, line 1108, t111, t121
	c0    mov $r0.11 = $r0.7   ## [spec] bblock 10, line 1109,  t147,  t149
	c0    br $b0.0, L96?3   ## bblock 2, line 1021,  t202(I1)
;;								## 2
	c0    add $r0.4 = $r0.11, -1   ## [spec] bblock 8, line 1111,  t118,  t147,  -1(SI32)
;;								## 3
	c0    cmpltu $b0.0 = $r0.10, $r0.6   ## bblock 3, line 1031,  t205(I1),  t26,  t27
	      xnop 1
;;								## 5
	c0    brf $b0.0, L97?3   ## bblock 3, line 1031,  t205(I1)
	      ## goto
;;
	c0    goto L87?3 ## goto
;;								## 6
.trace 5
L97?3:
	c0    cmpltu $b0.0 = $r0.6, $r0.10   ## bblock 5, line 1033,  t206(I1),  t27,  t26
	c0    ldw.d $r0.6 = 0x10[$r0.1]   ## [spec] bblock 7, line 1071, t72, t121
	c0    mov $r0.11 = $r0.8   ## [spec] bblock 7, line 1072,  t147,  t148
	c0    xor $r0.3 = $r0.3, 1   ## [spec] bblock 7, line 1073,  t136,  t136,  1(SI32)
;;								## 0
	c0    add $r0.4 = $r0.11, -1   ## [spec] bblock 8, line 1111,  t118,  t147,  -1(SI32)
;;								## 1
	c0    brf $b0.0, L98?3   ## bblock 5, line 1033,  t206(I1)
	      ## goto
;;
	c0    goto L94?3 ## goto
;;								## 2
.trace 7
L98?3:
	c0    ldw $r0.2 = ((_?1PACKET.2 + 0) + 0)[$r0.0]   ## bblock 6, line 1035, t30, 0(I32)
;;								## 0
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t120
	      xnop 1
;;								## 2
	c0    cmpeq $r0.2 = $r0.2, 1   ## bblock 6, line 1035,  t31,  t30,  1(SI32)
;;								## 3
	c0    shl $r0.3 = $r0.2, 31   ## bblock 6, line 1035,  t33,  t31,  31(SI32)
;;								## 4
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 6, line 1036,  t121,  ?2.22?2auto_size(I32),  t120
;;								## 5
.trace 9
L96?3:
	c0    ldw $r0.5 = 0x10[$r0.1]   ## bblock 12, line 1022, t20, t121
	c0    mov $r0.4 = $r0.12   ## t135
	c0    mov $r0.3 = $r0.9   ## t134
;;								## 0
	c0    ldw $r0.6 = 0x14[$r0.1]   ## bblock 12, line 1022, t21, t121
	      xnop 2
;;								## 3
	c0    or $r0.5 = $r0.5, $r0.6   ## bblock 12, line 1022,  t207,  t20,  t21
;;								## 4
	c0    cmpne $b0.0 = $r0.5, $r0.0   ## bblock 12, line 1022,  t208,  t207,  0(I32)
	      xnop 1
;;								## 6
	c0    brf $b0.0, L99?3   ## bblock 12, line 1022,  t208
;;								## 7
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = propagateFloat32NaN   ## bblock 15, line 1023,  raddr(propagateFloat32NaN)(P32),  t134,  t135
;;								## 8
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t120
	      xnop 3
;;								## 12
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 16, line 1023,  t121,  ?2.22?2auto_size(I32),  t120
;;								## 13
.trace 13
L99?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 13, line 1024,  raddr(float_raise)(P32),  16(SI32)
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t120
	c0    mov $r0.3 = 2147483647   ## 2147483647(I32)
	      xnop 3
;;								## 4
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 14, line 1025,  t121,  ?2.22?2auto_size(I32),  t120
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.22?2scratch.0, 0x0
.equ _?1PACKET.184, 0x10
.equ _?1PACKET.183, 0x14
.equ ?2.22?2ras_p, 0x18
.section .data
.section .text
.equ ?2.22?2auto_size, 0x20
 ## End subFloat32Sigs
 ## Begin _r_add
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
_r_add::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.5 = $r0.3, 31   ## bblock 0, line 1119,  t30(I1),  t27,  31(SI32)
	c0    shru $r0.2 = $r0.4, 31   ## bblock 0, line 1120,  t5(I1),  t28,  31(SI32)
;;								## 0
	c0    cmpeq $b0.0 = $r0.5, $r0.2   ## bblock 0, line 1121,  t31(I1),  t30(I1),  t5(I1)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t14
	      xnop 1
;;								## 2
	c0    brf $b0.0, L100?3   ## bblock 0, line 1121,  t31(I1)
;;								## 3
.call addFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:u32)
	c0    call $l0.0 = addFloat32Sigs   ## bblock 3, line 1122,  raddr(addFloat32Sigs)(P32),  t27,  t28,  t30(I1)
;;								## 4
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t14
	      xnop 3
;;								## 8
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 4, line 1122,  t15,  ?2.23?2auto_size(I32),  t14
;;								## 9
.trace 2
L100?3:
.call subFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:u32)
	c0    call $l0.0 = subFloat32Sigs   ## bblock 1, line 1125,  raddr(subFloat32Sigs)(P32),  t27,  t28,  t30(I1)
;;								## 0
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t14
	      xnop 3
;;								## 4
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 1125,  t15,  ?2.23?2auto_size(I32),  t14
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.23?2scratch.0, 0x0
.equ ?2.23?2ras_p, 0x10
.section .data
.section .text
.equ ?2.23?2auto_size, 0x20
 ## End _r_add
 ## Begin _r_sub
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
_r_sub::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.5 = $r0.3, 31   ## bblock 0, line 1133,  t30(I1),  t27,  31(SI32)
	c0    shru $r0.2 = $r0.4, 31   ## bblock 0, line 1134,  t5(I1),  t28,  31(SI32)
;;								## 0
	c0    cmpeq $b0.0 = $r0.5, $r0.2   ## bblock 0, line 1135,  t31(I1),  t30(I1),  t5(I1)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t14
	      xnop 1
;;								## 2
	c0    brf $b0.0, L101?3   ## bblock 0, line 1135,  t31(I1)
;;								## 3
.call subFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:u32)
	c0    call $l0.0 = subFloat32Sigs   ## bblock 3, line 1136,  raddr(subFloat32Sigs)(P32),  t27,  t28,  t30(I1)
;;								## 4
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t14
	      xnop 3
;;								## 8
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 4, line 1136,  t15,  ?2.24?2auto_size(I32),  t14
;;								## 9
.trace 2
L101?3:
.call addFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:u32)
	c0    call $l0.0 = addFloat32Sigs   ## bblock 1, line 1139,  raddr(addFloat32Sigs)(P32),  t27,  t28,  t30(I1)
;;								## 0
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t14
	      xnop 3
;;								## 4
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 1139,  t15,  ?2.24?2auto_size(I32),  t14
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.24?2scratch.0, 0x0
.equ ?2.24?2ras_p, 0x10
.section .data
.section .text
.equ ?2.24?2auto_size, 0x20
 ## End _r_sub
 ## Begin _r_mul
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32)
_r_mul::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    shru $r0.2 = $r0.4, 23   ## bblock 0, line 1153,  t10(I9),  t159,  23(SI32)
	c0    shru $r0.6 = $r0.3, 31   ## bblock 0, line 1151,  t15(I1),  t158,  31(SI32)
;;								## 0
	c0    shru $r0.8 = $r0.3, 23   ## bblock 0, line 1150,  t3(I9),  t158,  23(SI32)
	c0    and $r0.2 = $r0.2, 255   ## bblock 0, line 1153,  t179,  t10(I9),  255(I32)
	c0    shru $r0.7 = $r0.4, 31   ## bblock 0, line 1154,  t14(I1),  t159,  31(SI32)
	c0    stw 0x18[$r0.1] = $l0.0  ## spill ## t145
;;								## 1
	c0    and $r0.10 = $r0.4, 8388607   ## bblock 0, line 1152,  t176,  t159,  8388607(I32)
	c0    and $r0.8 = $r0.8, 255   ## bblock 0, line 1150,  t180,  t3(I9),  255(I32)
	c0    mov $r0.9 = $r0.3   ## t158
;;								## 2
	c0    and $r0.11 = $r0.9, 8388607   ## bblock 0, line 1149,  t177,  t158,  8388607(I32)
	c0    xor $r0.3 = $r0.6, $r0.7   ## bblock 0, line 1155,  t181,  t15(I1),  t14(I1)
	c0    cmpeq $b0.0 = $r0.8, 255   ## bblock 0, line 1159,  t197(I1),  t180,  255(SI32)
;;								## 3
	c0    cmpeq $b0.1 = $r0.2, 255   ## [spec] bblock 1, line 1172,  t198(I1),  t179,  255(SI32)
	c0    cmpeq $b0.2 = $r0.8, $r0.0   ## [spec] bblock 2, line 1184,  t199(I1),  t180,  0(SI32)
	c0    or $r0.6 = $r0.10, 8388608   ## [spec] bblock 4, line 1207,  t76,  t176,  8388608(I32)
;;								## 4
	c0    or $r0.7 = $r0.11, 8388608   ## [spec] bblock 4, line 1206,  t73,  t177,  8388608(I32)
	c0    shl $r0.6 = $r0.6, 8   ## [spec] bblock 4, line 1207,  t89,  t76,  8(SI32)
	c0    br $b0.0, L102?3   ## bblock 0, line 1159,  t197(I1)
;;								## 5
	c0    cmpeq $b0.0 = $r0.2, $r0.0   ## [spec] bblock 3, line 1196,  t200(I1),  t179,  0(SI32)
	c0    add $r0.12 = $r0.2, $r0.8   ## [spec] bblock 4, line 1205,  t196,  t179,  t180
	c0    shl $r0.7 = $r0.7, 7   ## [spec] bblock 4, line 1206,  t84,  t73,  7(SI32)
	c0    br $b0.1, L103?3   ## bblock 1, line 1172,  t198(I1)
;;								## 6
	c0    add $r0.14 = $r0.12, -127   ## [spec] bblock 4, line 1205,  t192,  t196,  -127(SI32)
	c0    mpylhu $r0.9 = $r0.6, $r0.7   ## [spec] bblock 4, line 1220,  t111,  t89,  t84
	c0    mpylhu $r0.13 = $r0.7, $r0.6   ## [spec] bblock 4, line 1219,  t104,  t84,  t89
	c0    br $b0.2, L104?3   ## bblock 2, line 1184,  t199(I1)
;;								## 7
L105?3:
	c0    mpyllu $r0.2 = $r0.7, $r0.6   ## [spec] bblock 4, line 1218,  t117,  t84,  t89
	c0    mpyhhu $r0.15 = $r0.7, $r0.6   ## [spec] bblock 4, line 1221,  t107,  t84,  t89
	c0    add $r0.12 = $r0.12, -128   ## [spec] bblock 4, line 1236,  t188,  t196,  -128(SI32)
	c0    br $b0.0, L106?3   ## bblock 3, line 1196,  t200(I1)
;;								## 8
L107?3:
	c0    add $r0.13 = $r0.9, $r0.13   ## bblock 4, line 1222,  t115,  t111,  t104
;;								## 9
	c0    shru $r0.7 = $r0.13, 16   ## bblock 4, line 1223,  t109(I16),  t115,  16(SI32)
	c0    cmpltu $r0.9 = $r0.13, $r0.9   ## bblock 4, line 1223,  t112,  t115,  t111
	c0    shl $r0.6 = $r0.13, 16   ## bblock 4, line 1224,  t122,  t115,  16(SI32)
;;								## 10
	c0    shl $r0.9 = $r0.9, 16   ## bblock 4, line 1223,  t113,  t112,  16(SI32)
	c0    add $r0.2 = $r0.2, $r0.6   ## bblock 4, line 1225,  t132,  t117,  t122
	c0    add $r0.7 = $r0.7, $r0.15   ## bblock 4, line 1226,  t201,  t109(I16),  t107
;;								## 11
	c0    cmpltu $r0.6 = $r0.2, $r0.6   ## bblock 4, line 1226,  t123,  t132,  t122
	c0    stw 0x14[$r0.1] = $r0.2   ## bblock 4, line 1227, t146, t132
	c0    cmpne $r0.8 = $r0.2, $r0.0   ## bblock 4, line 1232,  t133,  t132,  0(I32)
;;								## 12
	c0    add $r0.9 = $r0.9, $r0.6   ## bblock 4, line 1226,  t202,  t113,  t123
;;								## 13
	c0    add $r0.7 = $r0.7, $r0.9   ## bblock 4, line 1226,  t131,  t201,  t202
;;								## 14
	c0    stw 0x10[$r0.1] = $r0.7   ## bblock 4, line 1228, t146, t131
	c0    or $r0.8 = $r0.7, $r0.8   ## bblock 4, line 1232,  t191,  t131,  t133
;;								## 15
	c0    shl $r0.2 = $r0.8, 1   ## bblock 4, line 1234,  t187,  t191,  1(SI32)
;;								## 16
	c0    cmplt $b0.0 = $r0.2, $r0.0   ## bblock 4, line 1234,  t186(I1),  t187,  0(SI32)
;;								## 17
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
	c0    slct $r0.5 = $b0.0, $r0.8, $r0.2   ## bblock 4, line 1234,  t175,  t186(I1),  t191,  t187
	c0    slct $r0.4 = $b0.0, $r0.14, $r0.12   ## bblock 4, line 1236,  t178,  t186(I1),  t192,  t188
	c0    call $l0.0 = roundAndPackFloat32   ## bblock 4, line 1238,  raddr(roundAndPackFloat32)(P32),  t181,  t178,  t175
;;								## 18
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t145
	      xnop 3
;;								## 22
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 6, line 1238,  t146,  ?2.25?2auto_size(I32),  t145
;;								## 23
.trace 5
L106?3:
	c0    cmpeq $b0.0 = $r0.10, $r0.0   ## bblock 8, line 1197,  t203(I1),  t176,  0(SI32)
	c0    shl $r0.4 = $r0.3, 31   ## [spec] bblock 11, line 1198,  t60,  t181,  31(SI32)
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t145
;;								## 0
	c0    mov $r0.3 = $r0.4   ## [spec] t60
	c0    mov $r0.2 = $r0.3   ## t181
;;								## 1
	c0    brf $b0.0, L108?3   ## bblock 8, line 1197,  t203(I1)
;;								## 2
;;								## 3
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 11, line 1198,  t146,  ?2.25?2auto_size(I32),  t145
;;								## 4
.trace 9
L108?3:
	c0    stw 0x1c[$r0.1] = $r0.2  ## spill ## t181
	c0    mov $r0.3 = $r0.10   ## t176
;;								## 0
	c0    stw 0x28[$r0.1] = $r0.11  ## spill ## t177
;;								## 1
	c0    stw 0x2c[$r0.1] = $r0.8  ## spill ## t180
;;								## 2
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    call $l0.0 = countLeadingZeros32   ## bblock 9, line 1200,  raddr(countLeadingZeros32)(P32),  t176
	c0    stw 0x20[$r0.1] = $r0.10  ## spill ## t176
;;								## 3
	c0    add $r0.2 = $r0.3, -8   ## bblock 10, line 1200,  t67,  t61,  -8(SI32)
	c0    sub $r0.3 = 9, $r0.3   ## bblock 10, line 1202,  t179,  9(SI32),  t61
	c0    ldw $r0.10 = 0x20[$r0.1]  ## restore ## t176
;;								## 4
	c0    ldw $r0.11 = 0x28[$r0.1]  ## restore ## t177
;;								## 5
	c0    ldw $r0.8 = 0x2c[$r0.1]  ## restore ## t180
;;								## 6
	c0    shl $r0.10 = $r0.10, $r0.2   ## bblock 10, line 1201,  t176,  t176,  t67
;;								## 7
	c0    or $r0.11 = $r0.11, 8388608   ## bblock 4, line 1206,  t73,  t177,  8388608(I32)
	c0    or $r0.10 = $r0.10, 8388608   ## bblock 4, line 1207,  t76,  t176,  8388608(I32)
;;								## 8
	c0    add $r0.3 = $r0.3, $r0.8   ## bblock 4, line 1205,  t196,  t179,  t180
	c0    shl $r0.7 = $r0.11, 7   ## bblock 4, line 1206,  t84,  t73,  7(SI32)
	c0    shl $r0.6 = $r0.10, 8   ## bblock 4, line 1207,  t89,  t76,  8(SI32)
;;								## 9
	c0    add $r0.14 = $r0.3, -127   ## bblock 4, line 1205,  t192,  t196,  -127(SI32)
	c0    mpylhu $r0.9 = $r0.6, $r0.7   ## bblock 4, line 1220,  t111,  t89,  t84
	c0    mpylhu $r0.13 = $r0.7, $r0.6   ## bblock 4, line 1219,  t104,  t84,  t89
	c0    add $r0.12 = $r0.3, -128   ## bblock 4, line 1236,  t188,  t196,  -128(SI32)
;;								## 10
	c0    ldw $r0.3 = 0x1c[$r0.1]  ## restore ## t181
	      xnop 1
;;								## 12
	c0    mpyllu $r0.2 = $r0.7, $r0.6   ## [spec] bblock 4, line 1218,  t117,  t84,  t89
	c0    mpyhhu $r0.15 = $r0.7, $r0.6   ## [spec] bblock 4, line 1221,  t107,  t84,  t89
	c0    goto L107?3 ## goto
;;								## 13
.trace 4
L104?3:
	c0    cmpeq $b0.0 = $r0.11, $r0.0   ## bblock 12, line 1185,  t204(I1),  t177,  0(SI32)
	c0    shl $r0.4 = $r0.3, 31   ## [spec] bblock 15, line 1186,  t47,  t181,  31(SI32)
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t145
;;								## 0
	c0    mov $r0.3 = $r0.4   ## [spec] t47
	c0    mov $r0.5 = $r0.3   ## t181
;;								## 1
	c0    brf $b0.0, L109?3   ## bblock 12, line 1185,  t204(I1)
;;								## 2
;;								## 3
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 15, line 1186,  t146,  ?2.25?2auto_size(I32),  t145
;;								## 4
.trace 8
L109?3:
	c0    stw 0x1c[$r0.1] = $r0.5  ## spill ## t181
	c0    mov $r0.3 = $r0.11   ## t177
;;								## 0
	c0    stw 0x20[$r0.1] = $r0.10  ## spill ## t176
;;								## 1
	c0    stw 0x24[$r0.1] = $r0.2  ## spill ## t179
;;								## 2
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    call $l0.0 = countLeadingZeros32   ## bblock 13, line 1188,  raddr(countLeadingZeros32)(P32),  t177
	c0    stw 0x28[$r0.1] = $r0.11  ## spill ## t177
;;								## 3
	c0    add $r0.2 = $r0.3, -8   ## bblock 14, line 1188,  t54,  t48,  -8(SI32)
	c0    sub $r0.8 = 9, $r0.3   ## bblock 14, line 1190,  t180,  9(SI32),  t48
	c0    ldw $r0.11 = 0x28[$r0.1]  ## restore ## t177
;;								## 4
	c0    ldw $r0.4 = 0x24[$r0.1]  ## restore ## t179
;;								## 5
	c0    ldw $r0.10 = 0x20[$r0.1]  ## restore ## t176
;;								## 6
	c0    shl $r0.11 = $r0.11, $r0.2   ## bblock 14, line 1189,  t177,  t177,  t54
	c0    ldw $r0.3 = 0x1c[$r0.1]  ## restore ## t181
;;								## 7
	c0    cmpeq $b0.0 = $r0.4, $r0.0   ## bblock 3, line 1196,  t200(I1),  t179,  0(SI32)
	c0    add $r0.12 = $r0.4, $r0.8   ## [spec] bblock 4, line 1205,  t196,  t179,  t180
	c0    or $r0.2 = $r0.11, 8388608   ## [spec] bblock 4, line 1206,  t73,  t177,  8388608(I32)
;;								## 8
	c0    add $r0.14 = $r0.12, -127   ## [spec] bblock 4, line 1205,  t192,  t196,  -127(SI32)
	c0    shl $r0.7 = $r0.2, 7   ## [spec] bblock 4, line 1206,  t84,  t73,  7(SI32)
	c0    or $r0.2 = $r0.10, 8388608   ## [spec] bblock 4, line 1207,  t76,  t176,  8388608(I32)
;;								## 9
	c0    shl $r0.6 = $r0.2, 8   ## [spec] bblock 4, line 1207,  t89,  t76,  8(SI32)
;;								## 10
	c0    mpylhu $r0.9 = $r0.6, $r0.7   ## [spec] bblock 4, line 1220,  t111,  t89,  t84
	c0    mpylhu $r0.13 = $r0.7, $r0.6   ## [spec] bblock 4, line 1219,  t104,  t84,  t89
	c0    goto L105?3 ## goto
;;								## 11
.trace 3
L103?3:
	c0    cmpne $b0.1 = $r0.10, $r0.0   ## bblock 16, line 1173,  t205(I1),  t176,  0(SI32)
	c0    mov $r0.3 = $r0.9   ## t158
	c0    mov $r0.2 = $r0.3   ## t181
	      xnop 1
;;								## 1
	c0    brf $b0.1, L110?3   ## bblock 16, line 1173,  t205(I1)
;;								## 2
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = propagateFloat32NaN   ## bblock 21, line 1174,  raddr(propagateFloat32NaN)(P32),  t158,  t159
;;								## 3
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t145
	      xnop 3
;;								## 7
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 22, line 1174,  t146,  ?2.25?2auto_size(I32),  t145
;;								## 8
.trace 7
L110?3:
	c0    or $r0.11 = $r0.11, $r0.8   ## bblock 17, line 1175,  t39,  t177,  t180
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    cmpeq $b0.0 = $r0.11, $r0.0   ## bblock 17, line 1175,  t206(I1),  t39,  0(SI32)
	      xnop 1
;;								## 2
	c0    brf $b0.0, L111?3   ## bblock 17, line 1175,  t206(I1)
;;								## 3
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 19, line 1176,  raddr(float_raise)(P32),  16(SI32)
;;								## 4
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t145
	c0    mov $r0.3 = 2147483647   ## 2147483647(I32)
	      xnop 3
;;								## 8
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 20, line 1177,  t146,  ?2.25?2auto_size(I32),  t145
;;								## 9
.trace 11
L111?3:
	c0    shl $r0.2 = $r0.2, 31   ## bblock 18, line 1179,  t41,  t181,  31(SI32)
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t145
;;								## 0
	c0    add $r0.3 = $r0.2, 2139095040   ## bblock 18, line 1179,  t42,  t41,  2139095040(I32)
	      xnop 2
;;								## 3
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 18, line 1179,  t146,  ?2.25?2auto_size(I32),  t145
;;								## 4
.trace 2
L102?3:
	c0    cmpeq $r0.5 = $r0.2, 255   ## bblock 23, line 1160,  t20,  t179,  255(SI32)
	c0    mov $r0.3 = $r0.9   ## t158
	c0    mov $r0.6 = $r0.3   ## t181
;;								## 0
	c0    andl $r0.5 = $r0.5, $r0.10   ## bblock 23, line 1160,  t22,  t20,  t176
;;								## 1
	c0    orl $b0.0 = $r0.11, $r0.5   ## bblock 23, line 1160,  t208(I1),  t177,  t22
	      xnop 1
;;								## 3
	c0    brf $b0.0, L112?3   ## bblock 23, line 1160,  t208(I1)
;;								## 4
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = propagateFloat32NaN   ## bblock 28, line 1161,  raddr(propagateFloat32NaN)(P32),  t158,  t159
;;								## 5
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t145
	      xnop 3
;;								## 9
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 29, line 1161,  t146,  ?2.25?2auto_size(I32),  t145
;;								## 10
.trace 6
L112?3:
	c0    or $r0.10 = $r0.10, $r0.2   ## bblock 24, line 1163,  t28,  t176,  t179
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    cmpeq $b0.0 = $r0.10, $r0.0   ## bblock 24, line 1163,  t209(I1),  t28,  0(SI32)
	      xnop 1
;;								## 2
	c0    brf $b0.0, L113?3   ## bblock 24, line 1163,  t209(I1)
;;								## 3
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 26, line 1164,  raddr(float_raise)(P32),  16(SI32)
;;								## 4
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t145
	c0    mov $r0.3 = 2147483647   ## 2147483647(I32)
	      xnop 3
;;								## 8
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 27, line 1165,  t146,  ?2.25?2auto_size(I32),  t145
;;								## 9
.trace 10
L113?3:
	c0    shl $r0.6 = $r0.6, 31   ## bblock 25, line 1167,  t30,  t181,  31(SI32)
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t145
;;								## 0
	c0    add $r0.3 = $r0.6, 2139095040   ## bblock 25, line 1167,  t31,  t30,  2139095040(I32)
	      xnop 2
;;								## 3
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 25, line 1167,  t146,  ?2.25?2auto_size(I32),  t145
;;								## 4
.endp
.section .bss
.section .data
.equ ?2.25?2scratch.0, 0x0
.equ _?1PACKET.209, 0x10
.equ _?1PACKET.210, 0x14
.equ ?2.25?2ras_p, 0x18
.equ ?2.25?2spill_p, 0x1c
.section .data
.section .text
.equ ?2.25?2auto_size, 0x40
 ## End _r_mul
 ## Begin _r_div
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32,$r0.4:u32)
_r_div::
.trace 3
	c0    add $r0.1 = $r0.1, (-0x60)
	c0    shru $r0.2 = $r0.4, 23   ## bblock 0, line 1253,  t10(I9),  t198,  23(SI32)
	c0    shru $r0.10 = $r0.3, 31   ## bblock 0, line 1251,  t15(I1),  t197,  31(SI32)
;;								## 0
	c0    shru $r0.12 = $r0.3, 23   ## bblock 0, line 1250,  t3(I9),  t197,  23(SI32)
	c0    and $r0.2 = $r0.2, 255   ## bblock 0, line 1253,  t230,  t10(I9),  255(I32)
	c0    shru $r0.11 = $r0.4, 31   ## bblock 0, line 1254,  t14(I1),  t198,  31(SI32)
	c0    stw 0x20[$r0.1] = $l0.0  ## spill ## t184
;;								## 1
	c0    and $r0.14 = $r0.3, 8388607   ## bblock 0, line 1249,  t228,  t197,  8388607(I32)
	c0    and $r0.12 = $r0.12, 255   ## bblock 0, line 1250,  t231,  t3(I9),  255(I32)
	c0    xor $r0.13 = $r0.10, $r0.11   ## bblock 0, line 1255,  t232,  t15(I1),  t14(I1)
;;								## 2
	c0    and $r0.10 = $r0.4, 8388607   ## bblock 0, line 1252,  t227,  t198,  8388607(I32)
	c0    cmpeq $b0.0 = $r0.12, 255   ## bblock 0, line 1259,  t287(I1),  t231,  255(SI32)
	c0    stw 0x24[$r0.1] = $r0.13  ## spill ## t232
;;								## 3
	c0    cmpeq $b0.1 = $r0.2, 255   ## [spec] bblock 1, line 1273,  t288(I1),  t230,  255(SI32)
	c0    cmpeq $b0.2 = $r0.2, $r0.0   ## [spec] bblock 2, line 1281,  t289(I1),  t230,  0(SI32)
	c0    or $r0.11 = $r0.14, 8388608   ## [spec] bblock 4, line 1310,  t71,  t228,  8388608(I32)
;;								## 4
	c0    shl $r0.11 = $r0.11, 7   ## [spec] bblock 4, line 1310,  t248,  t71,  7(SI32)
	c0    or $r0.13 = $r0.10, 8388608   ## [spec] bblock 4, line 1311,  t74,  t227,  8388608(I32)
	c0    br $b0.0, L114?3   ## bblock 0, line 1259,  t287(I1)
;;								## 5
	c0    add $r0.15 = $r0.11, $r0.11   ## [spec] bblock 4, line 1312,  t79,  t248,  t248
	c0    shl $r0.16 = $r0.13, 8   ## [spec] bblock 4, line 1311,  t240,  t74,  8(SI32)
	c0    shru $r0.17 = $r0.11, 1   ## [spec] bblock 4, line 1313,  t243(I31),  t248,  1(SI32)
	c0    br $b0.1, L115?3   ## bblock 1, line 1273,  t288(I1)
;;								## 6
	c0    sub $r0.13 = $r0.12, $r0.2   ## [spec] bblock 4, line 1309,  t284,  t231,  t230
	c0    cmpgtu $b0.0 = $r0.16, $r0.15   ## [spec] bblock 4, line 1312,  t242(I1),  t240,  t79
	c0    stw 0x28[$r0.1] = $r0.16  ## spill ## [spec] t240
	c0    br $b0.2, L116?3   ## bblock 2, line 1281,  t289(I1)
;;								## 7
L117?3:
	c0    cmpeq $b0.1 = $r0.12, $r0.0   ## bblock 3, line 1300,  t290(I1),  t231,  0(SI32)
	c0    add $r0.15 = $r0.13, 125   ## [spec] bblock 4, line 1309,  t249,  t284,  125(SI32)
	c0    add $r0.18 = $r0.13, 126   ## [spec] bblock 4, line 1314,  t244,  t284,  126(SI32)
	c0    slct $r0.3 = $b0.0, $r0.11, $r0.17   ## [spec] bblock 4, line 1313,  t241,  t242(I1),  t248,  t243(I31)
;;								## 8
	c0    mov $r0.4 = $r0.0   ## 0(I32)
	c0    mov $r0.5 = $r0.16   ## [spec] t240
	c0    stw 0x2c[$r0.1] = $r0.3  ## spill ## [spec] t241
	c0    mov $r0.11 = $r0.14   ## t228
;;								## 9
	c0    slct $r0.14 = $b0.0, $r0.15, $r0.18   ## [spec] bblock 4, line 1314,  t229,  t242(I1),  t249,  t244
	c0    br $b0.1, L118?3   ## bblock 3, line 1300,  t290(I1)
;;								## 10
L119?3:
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0    call $l0.0 = estimateDiv64To32   ## bblock 4, line 1316,  raddr(estimateDiv64To32)(P32),  t241,  0(I32),  t240
	c0    stw 0x30[$r0.1] = $r0.14  ## spill ## [spec] t229
;;								## 11
	c0    and $r0.10 = $r0.3, 63   ## bblock 6, line 1317,  t88,  t84,  63(I32)
	c0    mov $r0.7 = $r0.3   ## bblock 6, line 1316,  t253,  t84
	c0    mov $r0.8 = (~0x0)   ## [spec] bblock 9, line 0,  t273,  (~0x0)(I32)
	c0    ldw $r0.2 = 0x28[$r0.1]  ## restore ## [spec] t240
;;								## 12
	c0    cmpleu $b0.0 = $r0.10, 2   ## bblock 6, line 1317,  t291(I1),  t88,  2(SI32)
	c0    add $r0.4 = $r0.1, 0x14   ## [spec] bblock 9, line 1341,  t175,  t185,  offset(rem0?1.190)=0x14(P32)
	c0    add $r0.6 = $r0.3, (~0x0)   ## [spec] bblock 9, line 0,  t274,  t84,  (~0x0)(I32)
	c0    ldw $r0.11 = 0x2c[$r0.1]  ## restore ## [spec] t241
;;								## 13
	c0    add $r0.5 = $r0.1, 0x10   ## [spec] bblock 9, line 1342,  t168,  t185,  offset(rem1?1.190)=0x10(P32)
	c0    mov $r0.9 = $r0.0   ## [spec] bblock 9, line 0,  t252,  0(I32)
	c0    ldw $r0.12 = 0x20[$r0.1]  ## restore ## t184
;;								## 14
	c0    mpylhu $r0.10 = $r0.3, $r0.2   ## [spec] bblock 9, line 1329,  t122,  t84,  t240
	c0    mpylhu $r0.13 = $r0.2, $r0.3   ## [spec] bblock 9, line 1328,  t115,  t240,  t84
	c0    ldw $r0.14 = 0x30[$r0.1]  ## restore ## [spec] t229
	c0    brf $b0.0, L120?3   ## bblock 6, line 1317,  t291(I1)
;;								## 15
	c0    mpyllu $r0.15 = $r0.2, $r0.3   ## bblock 9, line 1327,  t128,  t240,  t84
	c0    mpyhhu $r0.16 = $r0.2, $r0.3   ## bblock 9, line 1330,  t118,  t240,  t84
;;								## 16
	c0    add $r0.13 = $r0.10, $r0.13   ## bblock 9, line 1331,  t126,  t122,  t115
;;								## 17
	c0    shru $r0.18 = $r0.13, 16   ## bblock 9, line 1333,  t120(I16),  t126,  16(SI32)
	c0    cmpltu $r0.10 = $r0.13, $r0.10   ## bblock 9, line 1333,  t123,  t126,  t122
	c0    shl $r0.17 = $r0.13, 16   ## bblock 9, line 1334,  t133,  t126,  16(SI32)
	c0    mov $r0.3 = $r0.2   ## [spec] t240
;;								## 18
	c0    shl $r0.10 = $r0.10, 16   ## bblock 9, line 1333,  t124,  t123,  16(SI32)
	c0    add $r0.15 = $r0.15, $r0.17   ## bblock 9, line 1335,  t150,  t128,  t133
	c0    add $r0.18 = $r0.18, $r0.16   ## bblock 9, line 1336,  t292,  t120(I16),  t118
	c0    ldw $r0.13 = 0x24[$r0.1]  ## restore ## t232
;;								## 19
	c0    cmpltu $r0.17 = $r0.15, $r0.17   ## bblock 9, line 1336,  t134,  t150,  t133
	c0    stw 0x1c[$r0.1] = $r0.15   ## bblock 9, line 1337, t185, t150
	c0    sub $r0.16 = $r0.0, $r0.15   ## bblock 9, line 1347,  t147,  0(I32),  t150
	c0    cmpgtu $r0.2 = $r0.15, $r0.0   ## bblock 9, line 1348,  t151,  t150,  0(SI32)
;;								## 20
	c0    add $r0.10 = $r0.10, $r0.17   ## bblock 9, line 1336,  t293,  t124,  t134
	c0    stw 0x10[$r0.1] = $r0.16   ## bblock 9, line 1347, t185, t147
;;								## 21
	c0    add $r0.18 = $r0.18, $r0.10   ## bblock 9, line 1336,  t152,  t292,  t293
;;								## 22
	c0    stw 0x18[$r0.1] = $r0.18   ## bblock 9, line 1338, t185, t152
	c0    sub $r0.11 = $r0.11, $r0.18   ## bblock 9, line 1348,  t294,  t241,  t152
;;								## 23
	c0    sub $r0.11 = $r0.11, $r0.2   ## bblock 9, line 1348,  t154,  t294,  t151
;;								## 24
	c0    stw 0x14[$r0.1] = $r0.11   ## bblock 9, line 1348, t185, t154
;;								## 25
.trace 1
L121?3:
	c0    ldw.d $r0.2 = 0x10[$r0.1]   ## [spec] bblock 12, line 1356, t266, t185
;;								## 0
	c0    ldw $r0.10 = 0x14[$r0.1]   ## bblock 10, line 1350, t257, t185
	      xnop 1
;;								## 2
	c0    add $r0.11 = $r0.2, $r0.3   ## [spec] bblock 12, line 1359,  t267,  t266,  t240
;;								## 3
	c0    cmplt $b0.0 = $r0.10, $r0.0   ## bblock 10, line 1350,  t295(I1),  t257,  0(SI32)
	c0    cmpltu $r0.2 = $r0.11, $r0.2   ## [spec] bblock 12, line 1361,  t268,  t267,  t266
;;								## 4
	c0    add $r0.10 = $r0.10, $r0.2   ## [spec] bblock 12, line 1361,  t269,  t257,  t268
;;								## 5
	c0    brf $b0.0, L122?3   ## bblock 10, line 1350,  t295(I1)
;;								## 6
	c0    stw 0[$r0.4] = $r0.10   ## bblock 12, line 1361, t175, t269
	c0    add $r0.7 = $r0.7, -2   ## [spec] bblock 42, line 1351-2,  t253,  t253,  -2(SI32)
;;								## 7
	c0    ldw $r0.2 = 0x14[$r0.1]   ## bblock 12, line 1350-1, t261, t185
;;								## 8
	c0    stw 0[$r0.5] = $r0.11   ## bblock 12, line 1360, t168, t267
;;								## 9
	c0    ldw.d $r0.10 = 0x10[$r0.1]   ## [spec] bblock 45, line 1356-1, t260, t185
;;								## 10
	c0    cmplt $b0.0 = $r0.2, $r0.0   ## bblock 12, line 1350-1,  t296(I1),  t261,  0(SI32)
	      xnop 1
;;								## 12
	c0    add $r0.11 = $r0.3, $r0.10   ## [spec] bblock 45, line 1359-1,  t258,  t240,  t260
	c0    brf $b0.0, L123?3   ## bblock 12, line 1350-1,  t296(I1)
;;								## 13
	c0    cmpltu $r0.10 = $r0.11, $r0.10   ## bblock 45, line 1361-1,  t259,  t258,  t260
	c0    stw 0[$r0.5] = $r0.11   ## bblock 45, line 1360-1, t168, t258
	c0    add $r0.9 = $r0.9, -2   ## [spec] bblock 13, line 1351-3,  t252,  t252,  -2(SI32)
;;								## 14
	c0    add $r0.2 = $r0.2, $r0.10   ## bblock 45, line 1361-1,  t272,  t261,  t259
	c0    ldw.d $r0.10 = 0x10[$r0.1]   ## [spec] bblock 42, line 1356-2, t262, t185
;;								## 15
	c0    stw 0[$r0.4] = $r0.2   ## bblock 45, line 1361-1, t175, t272
;;								## 16
	c0    ldw $r0.2 = 0x14[$r0.1]   ## bblock 45, line 1350-2, t271, t185
;;								## 17
	c0    add $r0.11 = $r0.3, $r0.10   ## [spec] bblock 42, line 1359-2,  t265,  t240,  t262
;;								## 18
	c0    cmpltu $r0.10 = $r0.11, $r0.10   ## [spec] bblock 42, line 1361-2,  t264,  t265,  t262
;;								## 19
	c0    cmplt $b0.0 = $r0.2, $r0.0   ## bblock 45, line 1350-2,  t305(I1),  t271,  0(SI32)
	c0    add $r0.2 = $r0.2, $r0.10   ## [spec] bblock 42, line 1361-2,  t263,  t271,  t264
	      xnop 1
;;								## 21
	c0    brf $b0.0, L124?3   ## bblock 45, line 1350-2,  t305(I1)
;;								## 22
	c0    stw 0[$r0.5] = $r0.11   ## bblock 42, line 1360-2, t168, t265
	c0    add $r0.6 = $r0.6, (~0x1)   ## bblock 42, line 0,  t274,  t274,  (~0x1)(I32)
;;								## 23
	c0    ldw.d $r0.10 = 0x10[$r0.1]   ## [spec] bblock 13, line 1356-3, t170, t185
;;								## 24
	c0    stw 0[$r0.4] = $r0.2   ## bblock 42, line 1361-2, t175, t263
;;								## 25
	c0    ldw $r0.2 = 0x14[$r0.1]   ## bblock 42, line 1350-3, t156, t185
;;								## 26
	c0    add $r0.11 = $r0.3, $r0.10   ## [spec] bblock 13, line 1359-3,  t169,  t240,  t170
;;								## 27
	c0    cmpltu $r0.10 = $r0.11, $r0.10   ## [spec] bblock 13, line 1361-3,  t171,  t169,  t170
;;								## 28
	c0    cmplt $b0.0 = $r0.2, $r0.0   ## bblock 42, line 1350-3,  t304(I1),  t156,  0(SI32)
	c0    add $r0.2 = $r0.2, $r0.10   ## [spec] bblock 13, line 1361-3,  t174,  t156,  t171
	      xnop 1
;;								## 30
	c0    brf $b0.0, L125?3   ## bblock 42, line 1350-3,  t304(I1)
;;								## 31
	c0    stw 0[$r0.5] = $r0.11   ## bblock 13, line 1360-3, t168, t169
	c0    add $r0.8 = $r0.8, (~0x1)   ## bblock 13, line 0,  t273,  t273,  (~0x1)(I32)
;;								## 32
	c0    stw 0[$r0.4] = $r0.2   ## bblock 13, line 1361-3, t175, t174
	c0    goto L121?3 ## goto
;;								## 33
.trace 8
L125?3:
	c0    mov $r0.9 = $r0.8   ## bblock 40, line 0,  t254,  t273
	   ## bblock 40, line 0,  t255,  t253## $r0.7(skipped)
	c0    stw 0x24[$r0.1] = $r0.13  ## spill ## t232
	c0    goto L126?3 ## goto
;;								## 0
.trace 7
L124?3:
	c0    mov $r0.9 = $r0.8   ## bblock 43, line 0,  t254,  t273
	c0    mov $r0.7 = $r0.6   ## bblock 43, line 0,  t255,  t274
	c0    stw 0x24[$r0.1] = $r0.13  ## spill ## t232
	c0    goto L126?3 ## goto
;;								## 0
.trace 6
L123?3:
	   ## bblock 46, line 0,  t254,  t252## $r0.9(skipped)
	c0    mov $r0.7 = $r0.6   ## bblock 46, line 0,  t255,  t274
	c0    stw 0x24[$r0.1] = $r0.13  ## spill ## t232
	c0    goto L126?3 ## goto
;;								## 0
.trace 5
L122?3:
	   ## bblock 47, line 0,  t254,  t252## $r0.9(skipped)
	   ## bblock 47, line 0,  t255,  t253## $r0.7(skipped)
	c0    stw 0x24[$r0.1] = $r0.13  ## spill ## t232
;;								## 0
L126?3:
	c0    add $r0.7 = $r0.7, $r0.9   ## bblock 11, line 0,  t226,  t255,  t254
	c0    stw 0x20[$r0.1] = $r0.12  ## spill ## t184
;;								## 1
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 11, line 1364, t177, t185
	      xnop 2
;;								## 4
	c0    cmpne $r0.2 = $r0.2, $r0.0   ## bblock 11, line 1364,  t178,  t177,  0(I32)
;;								## 5
	c0    or $r0.5 = $r0.7, $r0.2   ## bblock 11, line 1364,  t253,  t226,  t178
	c0    ldw $r0.3 = 0x24[$r0.1]  ## restore ## t232
;;								## 6
	c0    goto L127?3 ## goto
;;								## 7
.trace 4
L120?3:
	c0    mov $r0.5 = $r0.7   ## t253
	c0    ldw $r0.3 = 0x24[$r0.1]  ## restore ## t232
	      xnop 1
;;								## 1
L127?3:
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
	c0    call $l0.0 = roundAndPackFloat32   ## bblock 7, line 1366,  raddr(roundAndPackFloat32)(P32),  t232,  t229,  t253
	c0    mov $r0.4 = $r0.14   ## t229
;;								## 2
	c0    ldw $l0.0 = 0x20[$r0.1]  ## restore ## t184
	      xnop 3
;;								## 6
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 8, line 1366,  t185,  ?2.26?2auto_size(I32),  t184
;;								## 7
.trace 12
L118?3:
	c0    cmpeq $b0.0 = $r0.11, $r0.0   ## bblock 14, line 1301,  t297(I1),  t228,  0(SI32)
	c0    ldw $r0.13 = 0x24[$r0.1]  ## restore ## t232
;;								## 0
	c0    ldw $l0.0 = 0x20[$r0.1]  ## restore ## t184
;;								## 1
	c0    brf $b0.0, L128?3   ## bblock 14, line 1301,  t297(I1)
;;								## 2
	c0    shl $r0.3 = $r0.13, 31   ## bblock 17, line 1302,  t58,  t232,  31(SI32)
	      xnop 1
;;								## 4
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 17, line 1302,  t185,  ?2.26?2auto_size(I32),  t184
;;								## 5
.trace 16
L128?3:
	c0    stw 0x3c[$r0.1] = $r0.10  ## spill ## t227
	c0    mov $r0.3 = $r0.11   ## t228
;;								## 0
	c0    stw 0x40[$r0.1] = $r0.2  ## spill ## t230
;;								## 1
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    call $l0.0 = countLeadingZeros32   ## bblock 15, line 1304,  raddr(countLeadingZeros32)(P32),  t228
	c0    stw 0x34[$r0.1] = $r0.11  ## spill ## t228
;;								## 2
	c0    add $r0.2 = $r0.3, -8   ## bblock 16, line 1304,  t65,  t59,  -8(SI32)
	c0    sub $r0.12 = 9, $r0.3   ## bblock 16, line 1306,  t231,  9(SI32),  t59
	c0    mov $r0.4 = $r0.0   ## 0(I32)
	c0    ldw $r0.6 = 0x34[$r0.1]  ## restore ## t228
;;								## 3
	c0    ldw $r0.10 = 0x3c[$r0.1]  ## restore ## t227
;;								## 4
	c0    ldw $r0.7 = 0x40[$r0.1]  ## restore ## t230
;;								## 5
	c0    shl $r0.6 = $r0.6, $r0.2   ## bblock 16, line 1305,  t228,  t228,  t65
;;								## 6
	c0    or $r0.11 = $r0.6, 8388608   ## bblock 4, line 1310,  t71,  t228,  8388608(I32)
	c0    or $r0.13 = $r0.10, 8388608   ## bblock 4, line 1311,  t74,  t227,  8388608(I32)
;;								## 7
	c0    sub $r0.13 = $r0.12, $r0.7   ## bblock 4, line 1309,  t284,  t231,  t230
	c0    shl $r0.11 = $r0.11, 7   ## bblock 4, line 1310,  t248,  t71,  7(SI32)
	c0    shl $r0.5 = $r0.13, 8   ## bblock 4, line 1311,  t240,  t74,  8(SI32)
;;								## 8
	c0    add $r0.2 = $r0.13, 125   ## bblock 4, line 1309,  t249,  t284,  125(SI32)
	c0    add $r0.15 = $r0.11, $r0.11   ## bblock 4, line 1312,  t79,  t248,  t248
	c0    shru $r0.17 = $r0.11, 1   ## bblock 4, line 1313,  t243(I31),  t248,  1(SI32)
	c0    stw 0x28[$r0.1] = $r0.5  ## spill ## t240
;;								## 9
	c0    cmpgtu $b0.0 = $r0.5, $r0.15   ## bblock 4, line 1312,  t242(I1),  t240,  t79
	c0    add $r0.18 = $r0.13, 126   ## bblock 4, line 1314,  t244,  t284,  126(SI32)
;;								## 10
	c0    slct $r0.3 = $b0.0, $r0.11, $r0.17   ## bblock 4, line 1313,  t241,  t242(I1),  t248,  t243(I31)
	c0    slct $r0.14 = $b0.0, $r0.2, $r0.18   ## bblock 4, line 1314,  t229,  t242(I1),  t249,  t244
;;								## 11
	c0    stw 0x2c[$r0.1] = $r0.3  ## spill ## t241
	c0    goto L119?3 ## goto
;;								## 12
.trace 11
L116?3:
	c0    cmpeq $b0.0 = $r0.10, $r0.0   ## bblock 18, line 1282,  t298(I1),  t227,  0(SI32)
	c0    or $r0.2 = $r0.14, $r0.12   ## [spec] bblock 21, line 1283,  t42,  t228,  t231
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    cmpeq $b0.1 = $r0.2, $r0.0   ## [spec] bblock 21, line 1283,  t299(I1),  t42,  0(SI32)
;;								## 1
	c0    brf $b0.0, L129?3   ## bblock 18, line 1282,  t298(I1)
;;								## 2
	c0    brf $b0.1, L130?3   ## bblock 21, line 1283,  t299(I1)
;;								## 3
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 24, line 1284,  raddr(float_raise)(P32),  16(SI32)
;;								## 4
	c0    ldw $l0.0 = 0x20[$r0.1]  ## restore ## t184
	c0    mov $r0.3 = 2147483647   ## 2147483647(I32)
	      xnop 3
;;								## 8
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 25, line 1285,  t185,  ?2.26?2auto_size(I32),  t184
;;								## 9
.trace 18
L130?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 22, line 1287,  raddr(float_raise)(P32),  128(SI32)
	c0    mov $r0.3 = 128   ## 128(SI32)
;;								## 0
	c0    ldw $r0.13 = 0x24[$r0.1]  ## restore ## t232
;;								## 1
	c0    ldw $l0.0 = 0x20[$r0.1]  ## restore ## t184
	      xnop 1
;;								## 3
	c0    shl $r0.13 = $r0.13, 31   ## bblock 23, line 1288,  t44,  t232,  31(SI32)
;;								## 4
	c0    add $r0.3 = $r0.13, 2139095040   ## bblock 23, line 1289,  t45,  t44,  2139095040(I32)
;;								## 5
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 23, line 1289,  t185,  ?2.26?2auto_size(I32),  t184
;;								## 6
.trace 15
L129?3:
	c0    stw 0x34[$r0.1] = $r0.14  ## spill ## t228
	c0    mov $r0.3 = $r0.10   ## t227
;;								## 0
	c0    stw 0x38[$r0.1] = $r0.12  ## spill ## t231
;;								## 1
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:s32)
	c0    call $l0.0 = countLeadingZeros32   ## bblock 19, line 1292,  raddr(countLeadingZeros32)(P32),  t227
	c0    stw 0x3c[$r0.1] = $r0.10  ## spill ## t227
;;								## 2
	c0    add $r0.4 = $r0.3, -8   ## bblock 20, line 1292,  t52,  t46,  -8(SI32)
	c0    sub $r0.2 = 9, $r0.3   ## bblock 20, line 1294,  t230,  9(SI32),  t46
	c0    ldw $r0.10 = 0x3c[$r0.1]  ## restore ## t227
;;								## 3
	c0    ldw $r0.14 = 0x34[$r0.1]  ## restore ## t228
;;								## 4
	c0    ldw $r0.12 = 0x38[$r0.1]  ## restore ## t231
;;								## 5
	c0    shl $r0.10 = $r0.10, $r0.4   ## bblock 20, line 1293,  t227,  t227,  t52
;;								## 6
	c0    or $r0.4 = $r0.14, 8388608   ## [spec] bblock 4, line 1310,  t71,  t228,  8388608(I32)
	c0    or $r0.3 = $r0.10, 8388608   ## [spec] bblock 4, line 1311,  t74,  t227,  8388608(I32)
;;								## 7
	c0    sub $r0.13 = $r0.12, $r0.2   ## [spec] bblock 4, line 1309,  t284,  t231,  t230
	c0    shl $r0.11 = $r0.4, 7   ## [spec] bblock 4, line 1310,  t248,  t71,  7(SI32)
	c0    shl $r0.16 = $r0.3, 8   ## [spec] bblock 4, line 1311,  t240,  t74,  8(SI32)
;;								## 8
	c0    add $r0.15 = $r0.11, $r0.11   ## [spec] bblock 4, line 1312,  t79,  t248,  t248
	c0    shru $r0.17 = $r0.11, 1   ## [spec] bblock 4, line 1313,  t243(I31),  t248,  1(SI32)
	c0    stw 0x28[$r0.1] = $r0.16  ## spill ## [spec] t240
;;								## 9
	c0    cmpgtu $b0.0 = $r0.16, $r0.15   ## [spec] bblock 4, line 1312,  t242(I1),  t240,  t79
;;								## 10
	c0    goto L117?3 ## goto
;;								## 11
.trace 10
L115?3:
	c0    cmpne $b0.0 = $r0.10, $r0.0   ## bblock 26, line 1274,  t300(I1),  t227,  0(SI32)
	      xnop 1
;;								## 1
	c0    brf $b0.0, L131?3   ## bblock 26, line 1274,  t300(I1)
;;								## 2
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = propagateFloat32NaN   ## bblock 28, line 1275,  raddr(propagateFloat32NaN)(P32),  t197,  t198
;;								## 3
	c0    ldw $l0.0 = 0x20[$r0.1]  ## restore ## t184
	      xnop 3
;;								## 7
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 29, line 1275,  t185,  ?2.26?2auto_size(I32),  t184
;;								## 8
.trace 14
L131?3:
	c0    ldw $r0.13 = 0x24[$r0.1]  ## restore ## t232
;;								## 0
	c0    ldw $l0.0 = 0x20[$r0.1]  ## restore ## t184
	      xnop 1
;;								## 2
	c0    shl $r0.3 = $r0.13, 31   ## bblock 27, line 1276,  t37,  t232,  31(SI32)
	      xnop 1
;;								## 4
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 27, line 1276,  t185,  ?2.26?2auto_size(I32),  t184
;;								## 5
.trace 9
L114?3:
	c0    cmpne $b0.0 = $r0.14, $r0.0   ## bblock 30, line 1260,  t301(I1),  t228,  0(SI32)
	      xnop 1
;;								## 1
	c0    brf $b0.0, L132?3   ## bblock 30, line 1260,  t301(I1)
;;								## 2
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = propagateFloat32NaN   ## bblock 38, line 1261,  raddr(propagateFloat32NaN)(P32),  t197,  t198
;;								## 3
	c0    ldw $l0.0 = 0x20[$r0.1]  ## restore ## t184
	      xnop 3
;;								## 7
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 39, line 1261,  t185,  ?2.26?2auto_size(I32),  t184
;;								## 8
.trace 13
L132?3:
	c0    cmpeq $b0.0 = $r0.2, 255   ## bblock 31, line 1262,  t302(I1),  t230,  255(SI32)
	c0    cmpne $b0.1 = $r0.10, $r0.0   ## [spec] bblock 33, line 1263,  t303(I1),  t227,  0(SI32)
	      xnop 1
;;								## 1
	c0    brf $b0.0, L133?3   ## bblock 31, line 1262,  t302(I1)
;;								## 2
	c0    brf $b0.1, L134?3   ## bblock 33, line 1263,  t303(I1)
;;								## 3
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = propagateFloat32NaN   ## bblock 36, line 1264,  raddr(propagateFloat32NaN)(P32),  t197,  t198
;;								## 4
	c0    ldw $l0.0 = 0x20[$r0.1]  ## restore ## t184
	      xnop 3
;;								## 8
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 37, line 1264,  t185,  ?2.26?2auto_size(I32),  t184
;;								## 9
.trace 19
L134?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 34, line 1265,  raddr(float_raise)(P32),  16(SI32)
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    ldw $l0.0 = 0x20[$r0.1]  ## restore ## t184
	c0    mov $r0.3 = 2147483647   ## 2147483647(I32)
	      xnop 3
;;								## 4
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 35, line 1266,  t185,  ?2.26?2auto_size(I32),  t184
;;								## 5
.trace 17
L133?3:
	c0    ldw $r0.13 = 0x24[$r0.1]  ## restore ## t232
;;								## 0
	c0    ldw $l0.0 = 0x20[$r0.1]  ## restore ## t184
	      xnop 1
;;								## 2
	c0    shl $r0.13 = $r0.13, 31   ## bblock 32, line 1268,  t28,  t232,  31(SI32)
;;								## 3
	c0    add $r0.3 = $r0.13, 2139095040   ## bblock 32, line 1268,  t29,  t28,  2139095040(I32)
;;								## 4
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 32, line 1268,  t185,  ?2.26?2auto_size(I32),  t184
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.26?2scratch.0, 0x0
.equ _?1PACKET.235, 0x10
.equ _?1PACKET.234, 0x14
.equ _?1PACKET.236, 0x18
.equ _?1PACKET.237, 0x1c
.equ ?2.26?2ras_p, 0x20
.equ ?2.26?2spill_p, 0x24
.section .data
.section .text
.equ ?2.26?2auto_size, 0x60
 ## End _r_div
 ## Begin _r_eq
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
_r_eq::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.2 = $r0.3, 23   ## bblock 0, line 1374,  t1(I9),  t50,  23(SI32)
	c0    shru $r0.5 = $r0.4, 23   ## bblock 0, line 1375,  t8(I9),  t51,  23(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, 255   ## bblock 0, line 1374,  t2,  t1(I9),  255(I32)
	c0    and $r0.6 = $r0.3, 8388607   ## bblock 0, line 1374,  t5,  t50,  8388607(I32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t37
;;								## 1
	c0    and $r0.5 = $r0.5, 255   ## bblock 0, line 1375,  t9,  t8(I9),  255(I32)
	c0    cmpeq $r0.2 = $r0.2, 255   ## bblock 0, line 1374,  t3,  t2,  255(SI32)
	c0    and $r0.7 = $r0.4, 8388607   ## bblock 0, line 1375,  t12,  t51,  8388607(I32)
;;								## 2
	c0    cmpeq $r0.5 = $r0.5, 255   ## bblock 0, line 1375,  t10,  t9,  255(SI32)
	c0    andl $r0.2 = $r0.2, $r0.6   ## bblock 0, line 1374,  t6,  t3,  t5
	c0    cmpeq $r0.8 = $r0.3, $r0.4   ## [spec] bblock 1, line 1383,  t30,  t50,  t51
	c0    or $r0.6 = $r0.3, $r0.4   ## [spec] bblock 1, line 1383,  t33,  t50,  t51
;;								## 3
	c0    andl $r0.5 = $r0.5, $r0.7   ## bblock 0, line 1375,  t13,  t10,  t12
	c0    shl $r0.6 = $r0.6, 1   ## [spec] bblock 1, line 1383,  t34,  t33,  1(SI32)
;;								## 4
	c0    orl $b0.0 = $r0.2, $r0.5   ## bblock 0, line 1376,  t54(I1),  t6,  t13
	c0    cmpeq $r0.6 = $r0.6, $r0.0   ## [spec] bblock 1, line 1383,  t56,  t34,  0(I32)
;;								## 5
	c0    orl $r0.3 = $r0.8, $r0.6   ## [spec] bblock 1, line 1383,  t36,  t30,  t56
	c0    mov $r0.2 = $r0.3   ## t50
;;								## 6
	c0    br $b0.0, L135?3   ## bblock 0, line 1376,  t54(I1)
;;								## 7
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 1383,  t38,  ?2.27?2auto_size(I32),  t37
;;								## 8
.trace 2
L135?3:
	c0    shru $r0.5 = $r0.2, 22   ## bblock 2, line 1377,  t15(I10),  t50,  22(SI32)
	c0    and $r0.6 = $r0.2, 4194303   ## bblock 2, line 1377,  t19,  t50,  4194303(I32)
	c0    shru $r0.7 = $r0.4, 22   ## bblock 2, line 1378,  t22(I10),  t51,  22(SI32)
;;								## 0
	c0    and $r0.5 = $r0.5, 511   ## bblock 2, line 1377,  t16,  t15(I10),  511(I32)
	c0    and $r0.7 = $r0.7, 511   ## bblock 2, line 1378,  t23,  t22(I10),  511(I32)
;;								## 1
	c0    cmpeq $r0.5 = $r0.5, 510   ## bblock 2, line 1377,  t17,  t16,  510(SI32)
	c0    cmpeq $r0.7 = $r0.7, 510   ## bblock 2, line 1378,  t24,  t23,  510(SI32)
;;								## 2
	c0    andl $r0.5 = $r0.5, $r0.6   ## bblock 2, line 1377,  t20,  t17,  t19
	c0    and $r0.4 = $r0.4, 4194303   ## bblock 2, line 1378,  t26,  t51,  4194303(I32)
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 3
	c0    andl $r0.7 = $r0.7, $r0.4   ## bblock 2, line 1378,  t27,  t24,  t26
;;								## 4
	c0    orl $b0.0 = $r0.5, $r0.7   ## bblock 2, line 1378,  t59(I1),  t20,  t27
	      xnop 1
;;								## 6
	c0    brf $b0.0, L136?3   ## bblock 2, line 1378,  t59(I1)
;;								## 7
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 4, line 1379,  raddr(float_raise)(P32),  16(SI32)
;;								## 8
L136?3:
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t37
	      xnop 3
;;								## 12
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 3, line 1381,  t38,  ?2.27?2auto_size(I32),  t37
;;								## 13
.endp
.section .bss
.section .data
.equ ?2.27?2scratch.0, 0x0
.equ ?2.27?2ras_p, 0x10
.section .data
.section .text
.equ ?2.27?2auto_size, 0x20
 ## End _r_eq
 ## Begin _r_le
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
_r_le::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.2 = $r0.3, 23   ## bblock 0, line 1392,  t1(I9),  t49,  23(SI32)
	c0    shru $r0.5 = $r0.4, 23   ## bblock 0, line 1393,  t8(I9),  t50,  23(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, 255   ## bblock 0, line 1392,  t2,  t1(I9),  255(I32)
	c0    and $r0.6 = $r0.3, 8388607   ## bblock 0, line 1392,  t5,  t49,  8388607(I32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t36
;;								## 1
	c0    and $r0.5 = $r0.5, 255   ## bblock 0, line 1393,  t9,  t8(I9),  255(I32)
	c0    cmpeq $r0.2 = $r0.2, 255   ## bblock 0, line 1392,  t3,  t2,  255(SI32)
	c0    and $r0.7 = $r0.4, 8388607   ## bblock 0, line 1393,  t12,  t50,  8388607(I32)
;;								## 2
	c0    cmpeq $r0.5 = $r0.5, 255   ## bblock 0, line 1393,  t10,  t9,  255(SI32)
	c0    andl $r0.2 = $r0.2, $r0.6   ## bblock 0, line 1392,  t6,  t3,  t5
	c0    shru $r0.6 = $r0.3, 31   ## [spec] bblock 1, line 1398,  t52(I1),  t49,  31(SI32)
	c0    shru $r0.8 = $r0.4, 31   ## [spec] bblock 1, line 1399,  t19(I1),  t50,  31(SI32)
;;								## 3
	c0    andl $r0.5 = $r0.5, $r0.7   ## bblock 0, line 1393,  t13,  t10,  t12
	c0    cmpne $b0.0 = $r0.6, $r0.8   ## [spec] bblock 1, line 1400,  t56(I1),  t52(I1),  t19(I1)
	c0    or $r0.7 = $r0.3, $r0.4   ## [spec] bblock 3, line 1401,  t23,  t49,  t50
;;								## 4
	c0    orl $b0.1 = $r0.2, $r0.5   ## bblock 0, line 1394,  t55(I1),  t6,  t13
	c0    shl $r0.7 = $r0.7, 1   ## [spec] bblock 3, line 1401,  t24,  t23,  1(SI32)
;;								## 5
	c0    cmpeq $r0.7 = $r0.7, $r0.0   ## [spec] bblock 3, line 1401,  t59,  t24,  0(I32)
;;								## 6
	c0    orl $r0.3 = $r0.6, $r0.7   ## [spec] bblock 3, line 1401,  t26,  t52(I1),  t59
	c0    mov $r0.2 = $r0.3   ## t49
	c0    br $b0.1, L137?3   ## bblock 0, line 1394,  t55(I1)
;;								## 7
	c0    brf $b0.0, L138?3   ## bblock 1, line 1400,  t56(I1)
;;								## 8
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 3, line 1401,  t37,  ?2.28?2auto_size(I32),  t36
;;								## 9
.trace 2
L138?3:
	c0    cmpeq $r0.2 = $r0.2, $r0.4   ## bblock 2, line 1402,  t29,  t49,  t50
	c0    cmpltu $r0.5 = $r0.2, $r0.4   ## bblock 2, line 1402,  t32,  t49,  t50
;;								## 0
	c0    xor $r0.5 = $r0.5, $r0.6   ## bblock 2, line 1402,  t34,  t32,  t52(I1)
;;								## 1
.return ret($r0.3:s32)
	c0    orl $r0.3 = $r0.2, $r0.5   ## bblock 2, line 1402,  t35,  t29,  t34
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 1402,  t37,  ?2.28?2auto_size(I32),  t36
;;								## 2
.trace 3
L137?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 4, line 1395,  raddr(float_raise)(P32),  16(SI32)
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t36
	      xnop 3
;;								## 4
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 5, line 1396,  t37,  ?2.28?2auto_size(I32),  t36
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.28?2scratch.0, 0x0
.equ ?2.28?2ras_p, 0x10
.section .data
.section .text
.equ ?2.28?2auto_size, 0x20
 ## End _r_le
 ## Begin _r_lt
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
_r_lt::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.2 = $r0.3, 23   ## bblock 0, line 1411,  t1(I9),  t49,  23(SI32)
	c0    shru $r0.5 = $r0.4, 23   ## bblock 0, line 1412,  t8(I9),  t50,  23(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, 255   ## bblock 0, line 1411,  t2,  t1(I9),  255(I32)
	c0    and $r0.6 = $r0.3, 8388607   ## bblock 0, line 1411,  t5,  t49,  8388607(I32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t36
;;								## 1
	c0    and $r0.5 = $r0.5, 255   ## bblock 0, line 1412,  t9,  t8(I9),  255(I32)
	c0    cmpeq $r0.2 = $r0.2, 255   ## bblock 0, line 1411,  t3,  t2,  255(SI32)
	c0    and $r0.7 = $r0.4, 8388607   ## bblock 0, line 1412,  t12,  t50,  8388607(I32)
;;								## 2
	c0    cmpeq $r0.5 = $r0.5, 255   ## bblock 0, line 1412,  t10,  t9,  255(SI32)
	c0    andl $r0.2 = $r0.2, $r0.6   ## bblock 0, line 1411,  t6,  t3,  t5
	c0    shru $r0.6 = $r0.3, 31   ## [spec] bblock 1, line 1417,  t52(I1),  t49,  31(SI32)
	c0    shru $r0.8 = $r0.4, 31   ## [spec] bblock 1, line 1418,  t19(I1),  t50,  31(SI32)
;;								## 3
	c0    andl $r0.5 = $r0.5, $r0.7   ## bblock 0, line 1412,  t13,  t10,  t12
	c0    cmpne $b0.0 = $r0.6, $r0.8   ## [spec] bblock 1, line 1419,  t56(I1),  t52(I1),  t19(I1)
	c0    or $r0.7 = $r0.3, $r0.4   ## [spec] bblock 3, line 1420,  t23,  t49,  t50
;;								## 4
	c0    orl $b0.1 = $r0.2, $r0.5   ## bblock 0, line 1413,  t55(I1),  t6,  t13
	c0    shl $r0.7 = $r0.7, 1   ## [spec] bblock 3, line 1420,  t24,  t23,  1(SI32)
;;								## 5
	c0    andl $r0.3 = $r0.6, $r0.7   ## [spec] bblock 3, line 1420,  t26,  t52(I1),  t24
	c0    mov $r0.2 = $r0.3   ## t49
;;								## 6
	c0    br $b0.1, L139?3   ## bblock 0, line 1413,  t55(I1)
;;								## 7
	c0    brf $b0.0, L140?3   ## bblock 1, line 1419,  t56(I1)
;;								## 8
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 3, line 1420,  t37,  ?2.29?2auto_size(I32),  t36
;;								## 9
.trace 2
L140?3:
	c0    cmpne $r0.2 = $r0.2, $r0.4   ## bblock 2, line 1421,  t29,  t49,  t50
	c0    cmpltu $r0.5 = $r0.2, $r0.4   ## bblock 2, line 1421,  t32,  t49,  t50
;;								## 0
	c0    xor $r0.5 = $r0.5, $r0.6   ## bblock 2, line 1421,  t34,  t32,  t52(I1)
;;								## 1
.return ret($r0.3:s32)
	c0    andl $r0.3 = $r0.2, $r0.5   ## bblock 2, line 1421,  t35,  t29,  t34
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 1421,  t37,  ?2.29?2auto_size(I32),  t36
;;								## 2
.trace 3
L139?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 4, line 1414,  raddr(float_raise)(P32),  16(SI32)
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t36
	      xnop 3
;;								## 4
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 5, line 1415,  t37,  ?2.29?2auto_size(I32),  t36
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.29?2scratch.0, 0x0
.equ ?2.29?2ras_p, 0x10
.section .data
.section .text
.equ ?2.29?2auto_size, 0x20
 ## End _r_lt
 ## Begin float64_to_int32_round_to_zero
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:s32)
float64_to_int32_round_to_zero:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    and $r0.2 = $r0.3, 1048575   ## bblock 0, line 1433,  t104,  t6,  1048575(I32)
;;								## 0
	c0    shru $r0.7 = $r0.3, 20   ## bblock 0, line 1434,  t4(I12),  t6,  20(SI32)
	c0    shru $r0.6 = $r0.3, 31   ## bblock 0, line 1435,  t107(I1),  t6,  31(SI32)
	c0    cmpne $b0.0 = $r0.5, $r0.0   ## [spec] bblock 15, line 1441,  t123(I1),  t96,  0(SI32)
	c0    stw 0x18[$r0.1] = $l0.0  ## spill ## t80
;;								## 1
	c0    and $r0.7 = $r0.7, 2047   ## bblock 0, line 1434,  t106,  t4(I12),  2047(I32)
	c0    mov $r0.8 = (~0x3fffffff)   ## (~0x3fffffff)(I32)
;;								## 2
	c0    add $r0.9 = $r0.7, -1043   ## bblock 0, line 1436,  t105,  t106,  -1043(SI32)
	c0    or $r0.10 = $r0.4, $r0.2   ## [spec] bblock 15, line 1439,  t16,  t103,  t104
	c0    slct $r0.8 = $b0.0, $r0.8, (~0x0)   ## [spec] bblock 15, line 1441,  t18,  t123(I1),  (~0x3fffffff)(I32),  (~0x0)(I32)
;;								## 3
	c0    cmpge $b0.0 = $r0.9, $r0.0   ## bblock 0, line 1437,  t112(I1),  t105,  0(SI32)
	c0    cmpgt $b0.1 = $r0.9, 11   ## [spec] bblock 13, line 1438,  t120(I1),  t105,  11(SI32)
	c0    cmpeq $r0.11 = $r0.7, 2047   ## [spec] bblock 15, line 1439,  t13,  t106,  2047(SI32)
;;								## 4
	c0    andl $b0.2 = $r0.11, $r0.10   ## [spec] bblock 15, line 1439,  t110(I1),  t13,  t16
	c0    ldw.d $r0.12 = 0x14[$r0.1]   ## [spec] bblock 4, line 1481, t76, t81
;;								## 5
	c0    ldw.d $r0.10 = ((_?1PACKET.3 + 0) + 0)[$r0.0]   ## [spec] bblock 6, line 1482, t77, 0(I32)
	c0    brf $b0.0, L141?3   ## bblock 0, line 1437,  t112(I1)
;;								## 6
	c0    brf $b0.1, L142?3   ## bblock 13, line 1438,  t120(I1)
;;								## 7
	c0    slctf $r0.6 = $b0.2, $r0.6, $r0.0   ## bblock 15, line 1440,  t107(I1),  t110(I1),  t107(I1),  0(SI32)
	c0    stw 0x10[$r0.1] = $r0.8   ## bblock 15, line 1441, t81, t18
	c0    cmpne $b0.0 = $r0.12, $r0.0   ## [spec] bblock 4, line 1481,  t117(I1),  t76,  0(SI32)
;;								## 8
L143?3:
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 3, line 1468, t62, t81
	c0    orl $r0.4 = $r0.6, $r0.5   ## bblock 3, line 1473,  t109(I1),  t107(I1),  t96
	c0    or $r0.10 = $r0.10, 1   ## [spec] bblock 6, line 1482,  t78,  t77,  1(I32)
	c0    mtb $b0.1 = $r0.6   ## t107(I1)
	      xnop 2
;;								## 11
	c0    sub $r0.7 = $r0.0, $r0.2   ## bblock 3, line 1468,  t61,  0(I32),  t62
;;								## 12
	c0    slct $r0.3 = $b0.1, $r0.7, $r0.2   ## bblock 3, line 1468,  t102,  t107(I1),  t61,  t62
;;								## 13
	c0    cmplt $r0.2 = $r0.3, $r0.0   ## bblock 3, line 1472,  t65,  t102,  0(SI32)
	c0    andl $r0.4 = $r0.3, $r0.4   ## bblock 3, line 1472,  t115,  t102,  t109(I1)
;;								## 14
	c0    xor $r0.2 = $r0.6, $r0.2   ## bblock 3, line 1472,  t67,  t107(I1),  t65
;;								## 15
	c0    andl $b0.1 = $r0.4, $r0.2   ## bblock 3, line 1472,  t116(I1),  t115,  t67
	      xnop 1
;;								## 17
	c0    br $b0.1, L144?3   ## bblock 3, line 1472,  t116(I1)
;;								## 18
	c0    brf $b0.0, L145?3   ## bblock 4, line 1481,  t117(I1)
;;								## 19
.return ret($r0.3:s32)
	c0    stw ((_?1PACKET.3 + 0) + 0)[$r0.0] = $r0.10   ## bblock 6, line 1482, 0(I32), t78
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 5, line 1483,  t81,  ?2.30?2auto_size(I32),  t80
;;								## 20
.trace 3
L145?3:
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 5, line 1483,  t81,  ?2.30?2auto_size(I32),  t80
;;								## 0
.trace 6
L144?3:
	c0    stw 0x1c[$r0.1] = $r0.6  ## spill ## t107(I1)
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 8, line 1474,  raddr(float_raise)(P32),  16(SI32)
	c0    stw 0x20[$r0.1] = $r0.5  ## spill ## t96
;;								## 1
	c0    mov $r0.2 = (~0x7fffffff)   ## (~0x7fffffff)(I32)
	c0    ldw $r0.5 = 0x20[$r0.1]  ## restore ## t96
;;								## 2
	c0    ldw $r0.6 = 0x1c[$r0.1]  ## restore ## t107(I1)
;;								## 3
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t80
;;								## 4
	c0    cmpne $b0.0 = $r0.5, $r0.0   ## bblock 9, line 1475,  t118(I1),  t96,  0(SI32)
;;								## 5
	c0    mtb $b0.1 = $r0.6   ## t107(I1)
;;								## 6
	c0    brf $b0.0, L146?3   ## bblock 9, line 1475,  t118(I1)
;;								## 7
.return ret($r0.3:s32)
	c0    slct $r0.3 = $b0.1, $r0.2, 2147483647   ## bblock 11, line 1476,  t73,  t107(I1),  (~0x7fffffff)(I32),  2147483647(SI32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 11, line 1476,  t81,  ?2.30?2auto_size(I32),  t80
;;								## 8
.trace 7
L146?3:
.return ret($r0.3:s32)
	c0    slct $r0.3 = $b0.1, $r0.0, (~0x0)   ## bblock 10, line 1478,  t75,  t107(I1),  0(SI32),  (~0x0)(I32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 10, line 1478,  t81,  ?2.30?2auto_size(I32),  t80
;;								## 0
.trace 4
L142?3:
	c0    or $r0.2 = $r0.2, 1048576   ## bblock 14, line 1447,  t36,  t104,  1048576(I32)
	c0    sub $r0.3 = $r0.0, $r0.9   ## bblock 14, line 1453,  t33,  0(I32),  t105
	c0    cmpeq $b0.0 = $r0.9, $r0.0   ## bblock 14, line 1453,  t121(I1),  t105,  0(SI32)
;;								## 0
	c0    shl $r0.9 = $r0.4, $r0.9   ## bblock 14, line 1450,  t27,  t103,  t105
	c0    shl $r0.7 = $r0.2, $r0.9   ## bblock 14, line 1453,  t38,  t36,  t105
	c0    and $r0.3 = $r0.3, 31   ## bblock 14, line 1453,  t34,  t33,  31(I32)
;;								## 1
	c0    stw 0x14[$r0.1] = $r0.9   ## bblock 14, line 1450, t81, t27
	c0    shru $r0.4 = $r0.4, $r0.3   ## bblock 14, line 1453,  t35,  t103,  t34
;;								## 2
	c0    or $r0.7 = $r0.7, $r0.4   ## bblock 14, line 1453,  t39,  t38,  t35
	c0    ldw.d $r0.12 = 0x14[$r0.1]   ## [spec] bblock 4, line 1481, t76, t81
;;								## 3
	c0    slct $r0.2 = $b0.0, $r0.2, $r0.7   ## bblock 14, line 1453,  t40,  t121(I1),  t36,  t39
;;								## 4
	c0    stw 0x10[$r0.1] = $r0.2   ## bblock 14, line 1451, t81, t40
;;								## 5
	c0    ldw.d $r0.10 = ((_?1PACKET.3 + 0) + 0)[$r0.0]   ## [spec] bblock 6, line 1482, t77, 0(I32)
	      xnop 1
;;								## 7
	c0    cmpne $b0.0 = $r0.12, $r0.0   ## [spec] bblock 4, line 1481,  t117(I1),  t76,  0(SI32)
	c0    goto L143?3 ## goto
;;								## 8
.trace 2
L141?3:
	c0    cmplt $b0.0 = $r0.7, 1022   ## bblock 1, line 1458,  t113(I1),  t106,  1022(SI32)
	c0    or $r0.3 = $r0.7, $r0.2   ## [spec] bblock 12, line 1459,  t119,  t106,  t104
;;								## 0
	c0    or $r0.3 = $r0.3, $r0.4   ## [spec] bblock 12, line 1459,  t46,  t119,  t103
;;								## 1
	c0    brf $b0.0, L147?3   ## bblock 1, line 1458,  t113(I1)
;;								## 2
	c0    stw 0x14[$r0.1] = $r0.3   ## bblock 12, line 1459, t81, t46
;;								## 3
	c0    ldw.d $r0.12 = 0x14[$r0.1]   ## [spec] bblock 4, line 1481, t76, t81
;;								## 4
	c0    stw 0x10[$r0.1] = $r0.0   ## bblock 12, line 1460, t81, 0(SI32)
	      xnop 1
;;								## 6
	c0    cmpne $b0.0 = $r0.12, $r0.0   ## [spec] bblock 4, line 1481,  t117(I1),  t76,  0(SI32)
	c0    goto L143?3 ## goto
;;								## 7
.trace 5
L147?3:
	c0    or $r0.2 = $r0.2, 1048576   ## bblock 2, line 1463,  t55,  t104,  1048576(I32)
	c0    sub $r0.9 = $r0.0, $r0.9   ## bblock 2, line 1465,  t57,  0(I32),  t105
	c0    and $r0.3 = $r0.9, 31   ## bblock 2, line 1464,  t52,  t105,  31(I32)
;;								## 0
	c0    shru $r0.2 = $r0.2, $r0.9   ## bblock 2, line 1465,  t58,  t55,  t57
	c0    shl $r0.3 = $r0.2, $r0.3   ## bblock 2, line 1464,  t53,  t55,  t52
;;								## 1
	c0    or $r0.3 = $r0.3, $r0.4   ## bblock 2, line 1464,  t54,  t53,  t103
	c0    stw 0x10[$r0.1] = $r0.2   ## bblock 2, line 1465, t81, t58
;;								## 2
	c0    stw 0x14[$r0.1] = $r0.3   ## bblock 2, line 1464, t81, t54
;;								## 3
	c0    ldw.d $r0.12 = 0x14[$r0.1]   ## [spec] bblock 4, line 1481, t76, t81
	      xnop 2
;;								## 6
	c0    cmpne $b0.0 = $r0.12, $r0.0   ## [spec] bblock 4, line 1481,  t117(I1),  t76,  0(SI32)
	c0    goto L143?3 ## goto
;;								## 7
.endp
.section .bss
.section .data
.equ ?2.30?2scratch.0, 0x0
.equ _?1PACKET.274, 0x10
.equ _?1PACKET.275, 0x14
.equ ?2.30?2ras_p, 0x18
.equ ?2.30?2spill_p, 0x1c
.section .data
.section .text
.equ ?2.30?2auto_size, 0x40
 ## End float64_to_int32_round_to_zero
 ## Begin _r_d
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32)
_r_d::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    and $r0.2 = $r0.3, 1048575   ## bblock 0, line 1494,  t117,  t100,  1048575(I32)
;;								## 0
	c0    shru $r0.6 = $r0.3, 20   ## bblock 0, line 1495,  t4(I12),  t100,  20(SI32)
	c0    shru $r0.5 = $r0.3, 31   ## bblock 0, line 1496,  t119(I1),  t100,  31(SI32)
	c0    or $r0.7 = $r0.4, $r0.2   ## [spec] bblock 15, line 1498,  t150,  t101,  t117
	c0    stw 0x18[$r0.1] = $l0.0  ## spill ## t87
;;								## 1
	c0    and $r0.6 = $r0.6, 2047   ## bblock 0, line 1495,  t118,  t4(I12),  2047(I32)
	c0    cmpne $b0.0 = $r0.7, $r0.0   ## [spec] bblock 15, line 1498,  t151,  t150,  0(I32)
	c0    stw 0x1c[$r0.1] = $r0.4  ## spill ## t101
;;								## 2
	c0    cmpeq $b0.1 = $r0.6, 2047   ## bblock 0, line 1497,  t147(I1),  t118,  2047(SI32)
	c0    stw 0x20[$r0.1] = $r0.3  ## spill ## t100
	      xnop 1
;;								## 4
	c0    brf $b0.1, L148?3   ## bblock 0, line 1497,  t147(I1)
;;								## 5
	c0    brf $b0.0, L149?3   ## bblock 15, line 1498,  t151
;;								## 6
.call float64ToCommonNaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32,$r0.4:u32,$r0.5:u32)
	c0    call $l0.0 = float64ToCommonNaN   ## bblock 17, line 1500,  raddr(float64ToCommonNaN)(P32),  t100,  t101
;;								## 7
	c0    shru $r0.2 = $r0.4, 9   ## bblock 18, line 1501,  t17(I23),  t12,  9(SI32)
	c0    ldw $r0.4 = 0x1c[$r0.1]  ## restore ## t101
;;								## 8
	c0    stw 0x24[$r0.1] = $r0.2  ## spill ## t17(I23)
;;								## 9
	c0    ldw $r0.3 = 0x20[$r0.1]  ## restore ## t100
	      xnop 1
;;								## 11
.call float64ToCommonNaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32,$r0.4:u32,$r0.5:u32)
	c0    call $l0.0 = float64ToCommonNaN   ## bblock 18, line 1499,  raddr(float64ToCommonNaN)(P32),  t100,  t101
;;								## 12
	c0    shl $r0.3 = $r0.3, 31   ## bblock 19, line 1500,  t24,  t18,  31(SI32)
	c0    ldw $r0.2 = 0x24[$r0.1]  ## restore ## t17(I23)
;;								## 13
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t87
	      xnop 1
;;								## 15
	c0    or $r0.2 = $r0.2, 2143289344   ## bblock 19, line 1501,  t152,  t17(I23),  2143289344(I32)
;;								## 16
	c0    or $r0.3 = $r0.2, $r0.3   ## bblock 19, line 1501,  t25,  t152,  t24
;;								## 17
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 19, line 1501,  t88,  ?2.31?2auto_size(I32),  t87
;;								## 18
.trace 3
L149?3:
	c0    shl $r0.5 = $r0.5, 31   ## bblock 16, line 1503,  t27,  t119(I1),  31(SI32)
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t87
;;								## 0
	c0    add $r0.3 = $r0.5, 2139095040   ## bblock 16, line 1503,  t28,  t27,  2139095040(I32)
	      xnop 2
;;								## 3
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 16, line 1503,  t88,  ?2.31?2auto_size(I32),  t87
;;								## 4
.trace 2
L148?3:
	c0    shl $r0.7 = $r0.4, 10   ## bblock 1, line 1519,  t130,  t101,  10(I32)
	c0    shru $r0.9 = $r0.4, 22   ## bblock 1, line 1519,  t132(I10),  t101,  22(SI32)
	c0    shl $r0.8 = $r0.2, 10   ## bblock 1, line 1519,  t137,  t117,  10(I32)
	c0    shru $r0.10 = $r0.2, 22   ## bblock 1, line 1520,  t106(I10),  t117,  22(SI32)
;;								## 0
	c0    cmpne $r0.7 = $r0.7, $r0.0   ## bblock 1, line 1519,  t131,  t130,  0(I32)
	c0    cmpne $b0.0 = $r0.6, $r0.0   ## bblock 1, line 1537,  t149(I1),  t118,  0(SI32)
	c0    add $r0.4 = $r0.6, -897   ## [spec] bblock 8, line 1539,  t85,  t118,  -897(SI32)
;;								## 1
	c0    or $r0.7 = $r0.7, $r0.8   ## bblock 1, line 1519,  t148,  t131,  t137
	c0    stw 0x10[$r0.1] = $r0.10   ## bblock 1, line 1535, t88, t106(I10)
	c0    mov $r0.3 = $r0.5   ## t119(I1)
;;								## 2
	c0    or $r0.7 = $r0.7, $r0.9   ## bblock 1, line 1519,  t105,  t148,  t132(I10)
;;								## 3
	c0    stw 0x14[$r0.1] = $r0.7   ## bblock 1, line 1534, t88, t105
	c0    or $r0.2 = $r0.7, 1073741824   ## [spec] bblock 10, line 1538,  t81,  t105,  1073741824(I32)
	c0    brf $b0.0, L150?3   ## bblock 1, line 1537,  t149(I1)
;;								## 4
	c0    stw 0x14[$r0.1] = $r0.2   ## bblock 10, line 1538, t88, t81
;;								## 5
L151?3:
	c0    ldw $r0.5 = 0x14[$r0.1]   ## bblock 8, line 1539, t86, t88
	      xnop 1
;;								## 7
.call roundAndPackFloat32, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32), ret($r0.3:u32)
	c0    call $l0.0 = roundAndPackFloat32   ## bblock 8, line 1539,  raddr(roundAndPackFloat32)(P32),  t119(I1),  t85,  t86
;;								## 8
	c0    ldw $l0.0 = 0x18[$r0.1]  ## restore ## t87
	      xnop 3
;;								## 12
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 9, line 1539,  t88,  ?2.31?2auto_size(I32),  t87
;;								## 13
.trace 4
L150?3:
	c0    mov $r0.3 = $r0.5   ## t119(I1)
	c0    goto L151?3 ## goto
;;								## 0
.endp
.section .bss
.section .data
.equ ?2.31?2scratch.0, 0x0
.equ _?1PACKET.288, 0x10
.equ _?1PACKET.287, 0x14
.equ ?2.31?2ras_p, 0x18
.equ ?2.31?2spill_p, 0x1c
.section .data
.section .text
.equ ?2.31?2auto_size, 0x40
 ## End _r_d
 ## Begin addFloat64Sigs
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32)
addFloat64Sigs:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    and $r0.2 = $r0.3, 1048575   ## bblock 0, line 1549,  t2,  t309,  1048575(I32)
;;								## 0
	c0    and $r0.8 = $r0.5, 1048575   ## bblock 0, line 1552,  t8,  t311,  1048575(I32)
	c0    shru $r0.9 = $r0.3, 20   ## bblock 0, line 1550,  t4(I12),  t309,  20(SI32)
	c0    stw 0x2c[$r0.1] = $l0.0  ## spill ## t293
;;								## 1
	c0    shru $r0.10 = $r0.5, 20   ## bblock 0, line 1553,  t10(I12),  t311,  20(SI32)
	c0    and $r0.9 = $r0.9, 2047   ## bblock 0, line 1550,  t364,  t4(I12),  2047(I32)
	c0    or $r0.11 = $r0.4, $r0.2   ## [spec] bblock 64, line 1557,  t481,  t310,  t2
;;								## 2
	c0    and $r0.10 = $r0.10, 2047   ## bblock 0, line 1553,  t363,  t10(I12),  2047(I32)
	c0    cmpeq $b0.0 = $r0.9, 2047   ## [spec] bblock 48, line 1556,  t476(I1),  t364,  2047(SI32)
;;								## 3
	c0    stw 0x1c[$r0.1] = $r0.4   ## bblock 0, line 1548, t294, t310
	c0    sub $r0.12 = $r0.9, $r0.10   ## bblock 0, line 1554,  t361,  t364,  t363
	c0    cmpne $b0.1 = $r0.11, $r0.0   ## [spec] bblock 64, line 1557,  t482,  t481,  0(I32)
;;								## 4
	c0    stw 0x18[$r0.1] = $r0.2   ## bblock 0, line 1549, t294, t2
	c0    cmpgt $b0.2 = $r0.12, $r0.0   ## bblock 0, line 1555,  t459(I1),  t361,  0(SI32)
;;								## 5
	c0    stw 0x14[$r0.1] = $r0.6   ## bblock 0, line 1551, t294, t312
;;								## 6
	c0    stw 0x10[$r0.1] = $r0.8   ## bblock 0, line 1552, t294, t8
	c0    brf $b0.2, L152?3   ## bblock 0, line 1555,  t459(I1)
;;								## 7
	c0    brf $b0.0, L153?3   ## bblock 48, line 1556,  t476(I1)
;;								## 8
	c0    brf $b0.1, L154?3   ## bblock 64, line 1557,  t482
;;								## 9
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = propagateFloat64NaN   ## bblock 66, line 1558,  raddr(propagateFloat64NaN)(P32),  t309,  t310,  t311,  t312
;;								## 10
	c0    ldw $l0.0 = 0x2c[$r0.1]  ## restore ## t293
	      xnop 3
;;								## 14
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 67, line 1558,  t294,  ?2.32?2auto_size(I32),  t293
;;								## 15
.trace 10
L154?3:
	c0    ldw $l0.0 = 0x2c[$r0.1]  ## restore ## t293
	      xnop 3
;;								## 3
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 65, line 1559,  t294,  ?2.32?2auto_size(I32),  t293
;;								## 4
.trace 3
L153?3:
	c0    cmpeq $b0.0 = $r0.10, $r0.0   ## bblock 49, line 1561,  t477(I1),  t363,  0(SI32)
	c0    ldw.d $r0.2 = 0x10[$r0.1]   ## [spec] bblock 51, line 1568, t360, t294
	c0    add $r0.8 = $r0.1, 0x10   ## [spec] bblock 51, line 1574,  t352,  t294,  offset(bSig0?1.239)=0x10(P32)
	c0    add $r0.11 = $r0.1, 0x14   ## [spec] bblock 51, line 1575,  t351,  t294,  offset(bSig1?1.239)=0x14(P32)
;;								## 0
	c0    ldw.d $r0.13 = 0x14[$r0.1]   ## [spec] bblock 51, line 1569, t359, t294
	c0    mov $r0.14 = $r0.0   ## [spec] bblock 51, line 1570,  t358,  0(SI32)
	c0    add $r0.15 = $r0.1, 0x20   ## [spec] bblock 51, line 1576,  t350,  t294,  offset(zSig2?1.239)=0x20(P32)
	c0    mov $r0.16 = $r0.0   ## [spec] bblock 62, line 1570,  t353,  0(SI32)
;;								## 1
	c0    mov $r0.17 = $r0.9   ## [spec] bblock 58, line 1612,  t362,  t364
	c0    ldw.d $r0.10 = 0x1c[$r0.1]   ## [spec] bblock 36, line 1703, t219, t294
	c0    mov $r0.3 = $r0.7   ## t313
	c0    brf $b0.0, L155?3   ## bblock 49, line 1561,  t477(I1)
;;								## 2
	c0    add $r0.12 = $r0.12, -1   ## bblock 63, line 1562,  t361,  t361,  -1(SI32)
	c0    mov $r0.19 = $r0.2   ## [spec] bblock 62, line 1568,  t355,  t360
	c0    ldw.d $r0.18 = 0x18[$r0.1]   ## [spec] bblock 36, line 1698, t205, t294
	c0    add $r0.20 = $r0.17, -1   ## [spec] bblock 36, line 1710,  t368,  t362,  -1(SI32)
;;								## 3
L156?3:
	c0    sub $r0.21 = $r0.0, $r0.12   ## bblock 51, line 1577,  t36,  0(I32),  t361
	c0    cmpeq $b0.0 = $r0.12, $r0.0   ## bblock 51, line 1577,  t478(I1),  t361,  0(SI32)
	c0    mov $r0.22 = $r0.13   ## [spec] bblock 62, line 1569,  t354,  t359
;;								## 4
	c0    and $r0.21 = $r0.21, 31   ## bblock 51, line 1572,  t356,  t36,  31(I32)
;;								## 5
	c0    or $r0.18 = $r0.18, 1048576   ## [spec] bblock 36, line 1698,  t222,  t205,  1048576(I32)
	c0    brf $b0.0, L157?3   ## bblock 51, line 1577,  t478(I1)
;;								## 6
L158?3:
	c0    stw 0[$r0.11] = $r0.22   ## bblock 58, line 1609, t351, t354
;;								## 7
	c0    ldw $r0.2 = 0x14[$r0.1]   ## bblock 36, line 1705, t213, t294
;;								## 8
	c0    stw 0[$r0.8] = $r0.19   ## bblock 58, line 1610, t352, t355
;;								## 9
	c0    ldw $r0.8 = 0x10[$r0.1]   ## bblock 36, line 1704, t221, t294
;;								## 10
	c0    stw 0[$r0.15] = $r0.16   ## bblock 58, line 1608, t350, t353
	c0    add $r0.2 = $r0.10, $r0.2   ## bblock 36, line 1706,  t218,  t219,  t213
;;								## 11
L159?3:
	c0    cmpltu $r0.10 = $r0.2, $r0.10   ## bblock 36, line 1708,  t220,  t218,  t219
	c0    ldw.d $r0.11 = 0x20[$r0.1]   ## [spec] bblock 5, line 1718, t322, t294
;;								## 12
	c0    add $r0.10 = $r0.18, $r0.10   ## bblock 36, line 1708,  t472,  t222,  t220
	c0    stw 0x24[$r0.1] = $r0.2   ## bblock 36, line 1707, t294, t218
;;								## 13
	c0    add $r0.10 = $r0.10, $r0.8   ## bblock 36, line 1708,  t227,  t472,  t221
	c0    ldw.d $r0.2 = 0x24[$r0.1]   ## [spec] bblock 5, line 1717, t323, t294
;;								## 14
	c0    stw 0x28[$r0.1] = $r0.10   ## bblock 36, line 1708, t294, t227
	c0    cmpltu $b0.0 = $r0.10, 2097152   ## bblock 36, line 1711,  t473(I1),  t227,  2097152(SI32)
	c0    cmpne $r0.11 = $r0.11, $r0.0   ## [spec] bblock 5, line 1754,  t278,  t322,  0(I32)
;;								## 15
	c0    ldw.d $r0.8 = 0x28[$r0.1]   ## [spec] bblock 5, line 1716, t324, t294
;;								## 16
	c0    stw 0x18[$r0.1] = $r0.18   ## bblock 36, line 1698, t294, t222
	c0    shl $r0.13 = $r0.2, 31   ## [spec] bblock 5, line 1732,  t317,  t323,  31(I32)
	c0    shru $r0.10 = $r0.2, 1   ## [spec] bblock 5, line 1733,  t393(I31),  t323,  1(SI32)
	c0    br $b0.0, L160?3   ## bblock 36, line 1711,  t473(I1)
;;								## 17
	c0    mov $r0.4 = $r0.17   ## bblock 37, line 1713,  t368,  t362
	c0    or $r0.13 = $r0.13, $r0.11   ## bblock 5, line 1754,  t369,  t317,  t278
;;								## 18
L161?3:
	c0    stw 0x20[$r0.1] = $r0.13   ## bblock 5, line 1756, t294, t369
	c0    shl $r0.11 = $r0.8, 31   ## bblock 5, line 1733,  t405,  t324,  31(I32)
	c0    shru $r0.2 = $r0.8, 1   ## bblock 5, line 1734,  t319(I31),  t324,  1(SI32)
;;								## 19
	c0    or $r0.11 = $r0.11, $r0.10   ## bblock 5, line 1733,  t318,  t405,  t393(I31)
	c0    ldw $r0.7 = 0x20[$r0.1]   ## bblock 13, line 1761, t292, t294
;;								## 20
	c0    stw 0x28[$r0.1] = $r0.2   ## bblock 5, line 1758, t294, t319(I31)
;;								## 21
	c0    ldw $r0.5 = 0x28[$r0.1]   ## bblock 13, line 1761, t290, t294
;;								## 22
	c0    stw 0x24[$r0.1] = $r0.11   ## bblock 5, line 1757, t294, t318
;;								## 23
L162?3:
	c0    ldw $r0.6 = 0x24[$r0.1]   ## bblock 13, line 1761, t291, t294
	      xnop 1
;;								## 25
.call roundAndPackFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = roundAndPackFloat64   ## bblock 13, line 1761,  raddr(roundAndPackFloat64)(P32),  t313,  t368,  t290,  t291,  t292
;;								## 26
	c0    ldw $l0.0 = 0x2c[$r0.1]  ## restore ## t293
	      xnop 3
;;								## 30
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 14, line 1761,  t294,  ?2.32?2auto_size(I32),  t293
;;								## 31
.trace 5
L160?3:
	c0    ldw $r0.2 = 0x20[$r0.1]   ## bblock 13, line 1761, t292, t294
	c0    mov $r0.3 = $r0.7   ## t313
	c0    mov $r0.4 = $r0.20   ## t368
	      xnop 2
;;								## 2
	c0    mov $r0.7 = $r0.2   ## t292
	c0    ldw $r0.5 = 0x28[$r0.1]   ## bblock 13, line 1761, t290, t294
;;								## 3
	c0    goto L162?3 ## goto
;;								## 4
.trace 6
L157?3:
	c0    cmplt $b0.0 = $r0.12, 32   ## bblock 52, line 1583,  t479(I1),  t361,  32(SI32)
	c0    shl $r0.4 = $r0.13, $r0.21   ## [spec] bblock 61, line 1584,  t366,  t359,  t356
	c0    shru $r0.5 = $r0.13, $r0.12   ## [spec] bblock 61, line 1585,  t51,  t359,  t361
	c0    cmpne $r0.14 = $r0.14, $r0.0   ## [spec] bblock 57, line 1606,  t80,  t358,  0(I32)
;;								## 0
	c0    shl $r0.6 = $r0.2, $r0.21   ## [spec] bblock 61, line 1585,  t54,  t360,  t356
	c0    shru $r0.19 = $r0.2, $r0.12   ## [spec] bblock 61, line 1586,  t355,  t360,  t361
	c0    or $r0.16 = $r0.14, $r0.4   ## [spec] bblock 57, line 1606,  t353,  t80,  t366
	c0    mov $r0.3 = $r0.7   ## t313
;;								## 1
	c0    or $r0.22 = $r0.5, $r0.6   ## [spec] bblock 61, line 1585,  t354,  t51,  t54
	c0    brf $b0.0, L163?3   ## bblock 52, line 1583,  t479(I1)
	      ## goto
;;
	c0    goto L158?3 ## goto
;;								## 2
.trace 13
L163?3:
	c0    cmpge $b0.1 = $r0.12, 64   ## bblock 53, line 1595,  t425(I1),  t361,  64(SI32)
	c0    cmpne $r0.4 = $r0.2, $r0.0   ## bblock 53, line 1600,  t429,  t360,  0(I32)
	c0    cmpeq $b0.0 = $r0.12, 64   ## bblock 53, line 1600,  t480(I1),  t361,  64(SI32)
	c0    shl $r0.21 = $r0.2, $r0.21   ## bblock 53, line 1596,  t426,  t360,  t356
;;								## 0
	c0    cmpeq $b0.0 = $r0.12, 32   ## bblock 53, line 1589,  t421(I1),  t361,  32(SI32)
	c0    slct $r0.4 = $b0.0, $r0.2, $r0.4   ## bblock 53, line 1600,  t431,  t480(I1),  t360,  t429
	c0    and $r0.12 = $r0.12, 31   ## bblock 53, line 1597,  t427,  t361,  31(I32)
	c0    mov $r0.19 = $r0.0   ## bblock 53, line 1601,  t355,  0(SI32)
;;								## 1
	c0    shru $r0.12 = $r0.2, $r0.12   ## bblock 53, line 1597,  t428,  t360,  t427
	c0    slct $r0.4 = $b0.1, $r0.4, $r0.21   ## bblock 53, line 1596,  t432,  t425(I1),  t431,  t426
	c0    slctf $r0.14 = $b0.0, $r0.13, $r0.0   ## bblock 53, line 1594,  t358,  t421(I1),  t359,  0(SI32)
	c0    mov $r0.3 = $r0.7   ## t313
;;								## 2
	c0    slctf $r0.12 = $b0.1, $r0.12, $r0.0   ## bblock 53, line 1597,  t433,  t425(I1),  t428,  0(SI32)
	c0    slct $r0.4 = $b0.0, $r0.13, $r0.4   ## bblock 53, line 1590,  t366,  t421(I1),  t359,  t432
	c0    cmpne $r0.14 = $r0.14, $r0.0   ## bblock 57, line 1606,  t80,  t358,  0(I32)
;;								## 3
	c0    slct $r0.22 = $b0.0, $r0.2, $r0.12   ## bblock 53, line 1591,  t354,  t421(I1),  t360,  t433
	c0    or $r0.16 = $r0.14, $r0.4   ## bblock 57, line 1606,  t353,  t80,  t366
	c0    goto L158?3 ## goto
;;								## 4
.trace 7
L155?3:
	c0    ldw $r0.4 = 0x10[$r0.1]   ## bblock 50, line 1565, t30, t294
	c0    add $r0.20 = $r0.17, -1   ## [spec] bblock 36, line 1710,  t368,  t362,  -1(SI32)
	c0    mov $r0.3 = $r0.7   ## t313
	      xnop 2
;;								## 2
	c0    or $r0.4 = $r0.4, 1048576   ## bblock 50, line 1565,  t31,  t30,  1048576(I32)
;;								## 3
	c0    stw 0x10[$r0.1] = $r0.4   ## bblock 50, line 1565, t294, t31
;;								## 4
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 51, line 1568, t360, t294
	      xnop 2
;;								## 7
	c0    mov $r0.19 = $r0.2   ## [spec] bblock 62, line 1568,  t355,  t360
	c0    ldw.d $r0.10 = 0x1c[$r0.1]   ## [spec] bblock 36, line 1703, t219, t294
;;								## 8
	c0    ldw.d $r0.18 = 0x18[$r0.1]   ## [spec] bblock 36, line 1698, t205, t294
	c0    goto L156?3 ## goto
;;								## 9
.trace 2
L152?3:
	c0    cmplt $b0.0 = $r0.12, $r0.0   ## bblock 1, line 1614,  t460(I1),  t361,  0(SI32)
	c0    cmpeq $b0.1 = $r0.10, 2047   ## [spec] bblock 25, line 1615,  t468(I1),  t363,  2047(SI32)
	c0    ldw.d $r0.2 = 0x14[$r0.1]   ## [spec] bblock 43, line 1616, t91, t294
;;								## 0
	c0    ldw.d $r0.8 = 0x10[$r0.1]   ## [spec] bblock 43, line 1616, t92, t294
;;								## 1
	c0    brf $b0.0, L164?3   ## bblock 1, line 1614,  t460(I1)
;;								## 2
	c0    brf $b0.1, L165?3   ## bblock 25, line 1615,  t468(I1)
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.8   ## bblock 43, line 1616,  t474,  t91,  t92
;;								## 4
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 43, line 1616,  t475,  t474,  0(I32)
	      xnop 1
;;								## 6
	c0    brf $b0.0, L166?3   ## bblock 43, line 1616,  t475
;;								## 7
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = propagateFloat64NaN   ## bblock 46, line 1617,  raddr(propagateFloat64NaN)(P32),  t309,  t310,  t311,  t312
;;								## 8
	c0    ldw $l0.0 = 0x2c[$r0.1]  ## restore ## t293
	      xnop 3
;;								## 12
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 47, line 1617,  t294,  ?2.32?2auto_size(I32),  t293
;;								## 13
.trace 14
L166?3:
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    mov $r0.3 = $r0.7   ## t313
;;								## 0
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 44, line 1618,  raddr(packFloat64)(P32),  t313,  2047(SI32),  0(I32),  0(I32)
	c0    mov $r0.4 = 2047   ## 2047(SI32)
;;								## 1
	c0    ldw $l0.0 = 0x2c[$r0.1]  ## restore ## t293
	      xnop 3
;;								## 5
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 45, line 1618,  t294,  ?2.32?2auto_size(I32),  t293
;;								## 6
.trace 8
L165?3:
	c0    cmpeq $b0.0 = $r0.9, $r0.0   ## bblock 26, line 1620,  t469(I1),  t364,  0(SI32)
	c0    ldw.d $r0.4 = 0x18[$r0.1]   ## [spec] bblock 28, line 1627, t349, t294
	c0    add $r0.5 = $r0.1, 0x18   ## [spec] bblock 28, line 1633,  t341,  t294,  offset(aSig0?1.239)=0x18(P32)
	c0    add $r0.6 = $r0.1, 0x1c   ## [spec] bblock 28, line 1634,  t340,  t294,  offset(aSig1?1.239)=0x1c(P32)
;;								## 0
	c0    ldw.d $r0.8 = 0x1c[$r0.1]   ## [spec] bblock 28, line 1628, t348, t294
	c0    add $r0.11 = $r0.1, 0x20   ## [spec] bblock 28, line 1635,  t339,  t294,  offset(zSig2?1.239)=0x20(P32)
	c0    mov $r0.13 = $r0.0   ## [spec] bblock 41, line 1629,  t342,  0(SI32)
	c0    mov $r0.17 = $r0.10   ## [spec] bblock 35, line 1671,  t362,  t363
;;								## 1
	c0    ldw.d $r0.9 = 0x14[$r0.1]   ## [spec] bblock 36, line 1705, t213, t294
	c0    add $r0.20 = $r0.17, -1   ## [spec] bblock 36, line 1710,  t368,  t362,  -1(SI32)
	c0    mov $r0.3 = $r0.7   ## t313
	c0    brf $b0.0, L167?3   ## bblock 26, line 1620,  t469(I1)
;;								## 2
	c0    add $r0.12 = $r0.12, 1   ## bblock 42, line 1621,  t361,  t361,  1(SI32)
	c0    mov $r0.14 = $r0.4   ## [spec] bblock 41, line 1627,  t344,  t349
;;								## 3
L168?3:
	c0    sub $r0.12 = $r0.0, $r0.12   ## bblock 28, line 1636,  t346,  0(I32),  t361
	c0    mov $r0.15 = $r0.8   ## [spec] bblock 41, line 1628,  t343,  t348
;;								## 4
	c0    sub $r0.16 = $r0.0, $r0.12   ## bblock 28, line 1636,  t112,  0(I32),  t346
	c0    cmpeq $b0.0 = $r0.12, $r0.0   ## bblock 28, line 1636,  t470(I1),  t346,  0(SI32)
;;								## 5
	c0    and $r0.16 = $r0.16, 31   ## bblock 28, line 1631,  t345,  t112,  31(I32)
;;								## 6
	c0    brf $b0.0, L169?3   ## bblock 28, line 1636,  t470(I1)
;;								## 7
L170?3:
	c0    stw 0[$r0.11] = $r0.13   ## bblock 35, line 1667, t339, t342
;;								## 8
	c0    stw 0[$r0.6] = $r0.15   ## bblock 35, line 1668, t340, t343
;;								## 9
	c0    ldw $r0.10 = 0x1c[$r0.1]   ## bblock 36, line 1703, t219, t294
;;								## 10
	c0    stw 0[$r0.5] = $r0.14   ## bblock 35, line 1669, t341, t344
;;								## 11
	c0    ldw $r0.4 = 0x18[$r0.1]   ## bblock 36, line 1698, t205, t294
;;								## 12
	c0    add $r0.2 = $r0.10, $r0.9   ## bblock 36, line 1706,  t218,  t219,  t213
	      xnop 1
;;								## 14
	c0    or $r0.18 = $r0.4, 1048576   ## bblock 36, line 1698,  t222,  t205,  1048576(I32)
	c0    ldw $r0.8 = 0x10[$r0.1]   ## bblock 36, line 1704, t221, t294
;;								## 15
	c0    goto L159?3 ## goto
;;								## 16
.trace 11
L169?3:
	c0    shl $r0.10 = $r0.4, $r0.16   ## bblock 29, line 1644,  t445,  t349,  t345
	c0    cmpne $r0.2 = $r0.4, $r0.0   ## bblock 29, line 1659,  t448,  t349,  0(I32)
	c0    cmpge $b0.1 = $r0.12, 64   ## bblock 29, line 1654,  t444(I1),  t346,  64(SI32)
	c0    cmpeq $b0.0 = $r0.12, 64   ## bblock 29, line 1659,  t471(I1),  t346,  64(SI32)
;;								## 0
	c0    cmpge $b0.2 = $r0.12, 32   ## bblock 29, line 1642,  t434(I1),  t346,  32(SI32)
	c0    cmpeq $b0.0 = $r0.12, 32   ## bblock 29, line 1648,  t440(I1),  t346,  32(SI32)
	c0    shl $r0.16 = $r0.8, $r0.16   ## bblock 29, line 1643,  t435,  t348,  t345
	c0    slct $r0.2 = $b0.0, $r0.4, $r0.2   ## bblock 29, line 1659,  t450,  t471(I1),  t349,  t448
;;								## 1
	c0    shru $r0.21 = $r0.8, $r0.12   ## bblock 29, line 1644,  t436,  t348,  t346
	c0    and $r0.19 = $r0.12, 31   ## bblock 29, line 1656,  t446,  t346,  31(I32)
	c0    slct $r0.2 = $b0.1, $r0.2, $r0.10   ## bblock 29, line 1655,  t451,  t444(I1),  t450,  t445
	c0    slctf $r0.18 = $b0.0, $r0.8, $r0.0   ## bblock 29, line 1653,  t455,  t440(I1),  t348,  0(SI32)
;;								## 2
	c0    or $r0.21 = $r0.21, $r0.10   ## bblock 29, line 1644,  t438,  t436,  t445
	c0    shru $r0.19 = $r0.4, $r0.19   ## bblock 29, line 1656,  t447,  t349,  t446
	c0    slct $r0.8 = $b0.0, $r0.8, $r0.2   ## bblock 29, line 1649,  t454,  t440(I1),  t348,  t451
	c0    slct $r0.18 = $b0.2, $r0.18, $r0.0   ## bblock 29, line 1653,  t347,  t434(I1),  t455,  0(SI32)
;;								## 3
	c0    shru $r0.12 = $r0.4, $r0.12   ## bblock 29, line 1645,  t439,  t349,  t346
	c0    slct $r0.8 = $b0.2, $r0.8, $r0.16   ## bblock 29, line 1643,  t367,  t434(I1),  t454,  t435
	c0    slctf $r0.19 = $b0.1, $r0.19, $r0.0   ## bblock 29, line 1656,  t452,  t444(I1),  t447,  0(SI32)
	c0    cmpne $r0.18 = $r0.18, $r0.0   ## bblock 29, line 1665,  t156,  t347,  0(I32)
;;								## 4
	c0    slct $r0.4 = $b0.0, $r0.4, $r0.19   ## bblock 29, line 1650,  t453,  t440(I1),  t349,  t452
	c0    slctf $r0.14 = $b0.2, $r0.12, $r0.0   ## bblock 29, line 1645,  t344,  t434(I1),  t439,  0(SI32)
	c0    or $r0.13 = $r0.8, $r0.18   ## bblock 29, line 1665,  t342,  t367,  t156
	c0    mov $r0.3 = $r0.7   ## t313
;;								## 5
	c0    slct $r0.15 = $b0.2, $r0.4, $r0.21   ## bblock 29, line 1644,  t343,  t434(I1),  t453,  t438
	c0    goto L170?3 ## goto
;;								## 6
.trace 15
L167?3:
	c0    ldw $r0.2 = 0x18[$r0.1]   ## bblock 27, line 1624, t105, t294
	c0    mov $r0.3 = $r0.7   ## t313
	      xnop 2
;;								## 2
	c0    or $r0.2 = $r0.2, 1048576   ## bblock 27, line 1624,  t106,  t105,  1048576(I32)
;;								## 3
	c0    stw 0x18[$r0.1] = $r0.2   ## bblock 27, line 1624, t294, t106
;;								## 4
	c0    ldw $r0.4 = 0x18[$r0.1]   ## bblock 28, line 1627, t349, t294
	      xnop 2
;;								## 7
	c0    mov $r0.14 = $r0.4   ## [spec] bblock 41, line 1627,  t344,  t349
	c0    ldw.d $r0.9 = 0x14[$r0.1]   ## [spec] bblock 36, line 1705, t213, t294
;;								## 8
	c0    goto L168?3 ## goto
;;								## 9
.trace 4
L164?3:
	c0    cmpeq $b0.0 = $r0.9, 2047   ## bblock 2, line 1674,  t461(I1),  t364,  2047(SI32)
	c0    ldw.d $r0.2 = 0x14[$r0.1]   ## [spec] bblock 21, line 1675, t166, t294
;;								## 0
	c0    ldw.d $r0.8 = 0x18[$r0.1]   ## [spec] bblock 21, line 1675, t169, t294
;;								## 1
	c0    ldw.d $r0.10 = 0x10[$r0.1]   ## [spec] bblock 21, line 1675, t167, t294
	c0    brf $b0.0, L171?3   ## bblock 2, line 1674,  t461(I1)
;;								## 2
	c0    ldw $r0.11 = 0x1c[$r0.1]   ## bblock 21, line 1675, t168, t294
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.8   ## bblock 21, line 1675,  t464,  t166,  t169
	      xnop 1
;;								## 5
	c0    or $r0.10 = $r0.10, $r0.11   ## bblock 21, line 1675,  t465,  t167,  t168
;;								## 6
	c0    or $r0.2 = $r0.2, $r0.10   ## bblock 21, line 1675,  t466,  t464,  t465
;;								## 7
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 21, line 1675,  t467,  t466,  0(I32)
	      xnop 1
;;								## 9
	c0    brf $b0.0, L172?3   ## bblock 21, line 1675,  t467
;;								## 10
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = propagateFloat64NaN   ## bblock 23, line 1676,  raddr(propagateFloat64NaN)(P32),  t309,  t310,  t311,  t312
;;								## 11
	c0    ldw $l0.0 = 0x2c[$r0.1]  ## restore ## t293
	      xnop 3
;;								## 15
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 24, line 1676,  t294,  ?2.32?2auto_size(I32),  t293
;;								## 16
.trace 12
L172?3:
	c0    ldw $l0.0 = 0x2c[$r0.1]  ## restore ## t293
	      xnop 3
;;								## 3
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 22, line 1678,  t294,  ?2.32?2auto_size(I32),  t293
;;								## 4
.trace 9
L171?3:
	c0    ldw $r0.2 = 0x1c[$r0.1]   ## bblock 3, line 1684, t190, t294
	c0    cmpeq $b0.0 = $r0.9, $r0.0   ## bblock 3, line 1691,  t463(I1),  t364,  0(SI32)
	c0    mov $r0.3 = $r0.7   ## t313
	c0    mov $r0.4 = $r0.0   ## 0(SI32)
;;								## 0
	c0    ldw $r0.8 = 0x14[$r0.1]   ## bblock 3, line 1686, t184, t294
;;								## 1
	c0    ldw $r0.10 = 0x18[$r0.1]   ## bblock 3, line 1683, t193, t294
;;								## 2
	c0    ldw $r0.11 = 0x10[$r0.1]   ## bblock 3, line 1685, t192, t294
;;								## 3
	c0    add $r0.6 = $r0.2, $r0.8   ## bblock 3, line 1687,  t189,  t190,  t184
;;								## 4
	c0    cmpltu $r0.2 = $r0.6, $r0.2   ## bblock 3, line 1689,  t191,  t189,  t190
	c0    stw 0x24[$r0.1] = $r0.6   ## bblock 3, line 1688, t294, t189
;;								## 5
	c0    add $r0.10 = $r0.10, $r0.2   ## bblock 3, line 1689,  t462,  t193,  t191
;;								## 6
	c0    add $r0.5 = $r0.10, $r0.11   ## bblock 3, line 1689,  t194,  t462,  t192
;;								## 7
	c0    stw 0x28[$r0.1] = $r0.5   ## bblock 3, line 1689, t294, t194
	c0    brf $b0.0, L173?3   ## bblock 3, line 1691,  t463(I1)
;;								## 8
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 19, line 1692,  raddr(packFloat64)(P32),  t313,  0(SI32),  t194,  t189
;;								## 9
	c0    ldw $l0.0 = 0x2c[$r0.1]  ## restore ## t293
	      xnop 3
;;								## 13
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 20, line 1692,  t294,  ?2.32?2auto_size(I32),  t293
;;								## 14
.trace 16
L173?3:
	c0    ldw $r0.2 = 0x28[$r0.1]   ## bblock 4, line 1694, t202, t294
	c0    mov $r0.4 = $r0.9   ## bblock 4, line 1695,  t368,  t364
	c0    mov $r0.3 = $r0.7   ## t313
;;								## 0
	c0    ldw $r0.5 = 0x24[$r0.1]   ## bblock 5, line 1717, t323, t294
;;								## 1
	c0    stw 0x20[$r0.1] = $r0.0   ## bblock 4, line 1693, t294, 0(SI32)
;;								## 2
	c0    or $r0.2 = $r0.2, 2097152   ## bblock 4, line 1694,  t203,  t202,  2097152(I32)
	c0    ldw $r0.11 = 0x20[$r0.1]   ## bblock 5, line 1718, t322, t294
;;								## 3
	c0    stw 0x28[$r0.1] = $r0.2   ## bblock 4, line 1694, t294, t203
	c0    shl $r0.6 = $r0.5, 31   ## bblock 5, line 1732,  t317,  t323,  31(I32)
	c0    shru $r0.10 = $r0.5, 1   ## bblock 5, line 1733,  t393(I31),  t323,  1(SI32)
;;								## 4
	c0    ldw $r0.8 = 0x28[$r0.1]   ## bblock 5, line 1716, t324, t294
;;								## 5
	c0    cmpne $r0.11 = $r0.11, $r0.0   ## bblock 5, line 1754,  t278,  t322,  0(I32)
;;								## 6
	c0    or $r0.13 = $r0.6, $r0.11   ## bblock 5, line 1754,  t369,  t317,  t278
	c0    goto L161?3 ## goto
;;								## 7
.endp
.section .bss
.section .data
.equ ?2.32?2scratch.0, 0x0
.equ _?1PACKET.302, 0x10
.equ _?1PACKET.303, 0x14
.equ _?1PACKET.300, 0x18
.equ _?1PACKET.301, 0x1c
.equ _?1PACKET.306, 0x20
.equ _?1PACKET.305, 0x24
.equ _?1PACKET.304, 0x28
.equ ?2.32?2ras_p, 0x2c
.section .data
.section .text
.equ ?2.32?2auto_size, 0x40
 ## End addFloat64Sigs
 ## Begin subFloat64Sigs
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32)
subFloat64Sigs:
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    and $r0.2 = $r0.3, 1048575   ## bblock 0, line 1772,  t30,  t289,  1048575(I32)
;;								## 0
	c0    shl $r0.2 = $r0.2, 10   ## bblock 0, line 1786,  t32,  t30,  10(SI32)
	c0    shru $r0.8 = $r0.4, 22   ## bblock 0, line 1786,  t29(I10),  t290,  22(I32)
	c0    shru $r0.9 = $r0.6, 22   ## bblock 0, line 1796,  t50(I10),  t292,  22(I32)
	c0    stw 0x28[$r0.1] = $l0.0  ## spill ## t273
;;								## 1
	c0    and $r0.8 = $r0.5, 1048575   ## bblock 0, line 1775,  t51,  t291,  1048575(I32)
	c0    shl $r0.10 = $r0.4, 10   ## bblock 0, line 1784,  t21,  t290,  10(SI32)
	c0    or $r0.2 = $r0.2, $r0.8   ## bblock 0, line 1786,  t34,  t32,  t29(I10)
;;								## 2
	c0    shru $r0.12 = $r0.3, 20   ## bblock 0, line 1773,  t4(I12),  t289,  20(SI32)
	c0    shru $r0.13 = $r0.5, 20   ## bblock 0, line 1776,  t10(I12),  t291,  20(SI32)
	c0    shl $r0.8 = $r0.8, 10   ## bblock 0, line 1796,  t53,  t51,  10(SI32)
	c0    shl $r0.11 = $r0.6, 10   ## bblock 0, line 1794,  t42,  t292,  10(SI32)
;;								## 3
	c0    and $r0.12 = $r0.12, 2047   ## bblock 0, line 1773,  t337,  t4(I12),  2047(I32)
	c0    or $r0.8 = $r0.8, $r0.9   ## bblock 0, line 1796,  t55,  t53,  t50(I10)
	c0    or $r0.9 = $r0.10, $r0.2   ## [spec] bblock 55, line 1888,  t475,  t21,  t34
;;								## 4
	c0    and $r0.13 = $r0.13, 2047   ## bblock 0, line 1776,  t336,  t10(I12),  2047(I32)
	c0    cmpeq $b0.0 = $r0.12, 2047   ## [spec] bblock 40, line 1887,  t471(I1),  t337,  2047(SI32)
;;								## 5
	c0    sub $r0.14 = $r0.12, $r0.13   ## bblock 0, line 1777,  t334,  t337,  t336
	c0    stw 0x14[$r0.1] = $r0.2   ## bblock 0, line 1785, t274, t34
	c0    cmpne $b0.1 = $r0.9, $r0.0   ## [spec] bblock 55, line 1888,  t476,  t475,  0(I32)
;;								## 6
	c0    stw 0x10[$r0.1] = $r0.8   ## bblock 0, line 1795, t274, t55
	c0    cmpgt $b0.2 = $r0.14, $r0.0   ## bblock 0, line 1798,  t450(I1),  t334,  0(SI32)
;;								## 7
	c0    stw 0x1c[$r0.1] = $r0.10   ## bblock 0, line 1784, t274, t21
;;								## 8
	c0    stw 0x18[$r0.1] = $r0.11   ## bblock 0, line 1794, t274, t42
	c0    brf $b0.2, L174?3   ## bblock 0, line 1798,  t450(I1)
;;								## 9
	c0    brf $b0.0, L175?3   ## bblock 40, line 1887,  t471(I1)
;;								## 10
	c0    brf $b0.1, L176?3   ## bblock 55, line 1888,  t476
;;								## 11
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = propagateFloat64NaN   ## bblock 57, line 1889,  raddr(propagateFloat64NaN)(P32),  t289,  t290,  t291,  t292
;;								## 12
	c0    ldw $l0.0 = 0x28[$r0.1]  ## restore ## t273
	      xnop 3
;;								## 16
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 58, line 1889,  t274,  ?2.33?2auto_size(I32),  t273
;;								## 17
.trace 8
L176?3:
	c0    ldw $l0.0 = 0x28[$r0.1]  ## restore ## t273
	      xnop 3
;;								## 3
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 56, line 1890,  t274,  ?2.33?2auto_size(I32),  t273
;;								## 4
.trace 2
L175?3:
	c0    cmpeq $b0.0 = $r0.13, $r0.0   ## bblock 41, line 1892,  t472(I1),  t336,  0(SI32)
	c0    ldw.d $r0.2 = 0x10[$r0.1]   ## [spec] bblock 43, line 1899, t307, t274
	c0    add $r0.8 = $r0.1, 0x10   ## [spec] bblock 43, line 1904,  t301,  t274,  offset(bSig0?1.281)=0x10(P32)
	c0    add $r0.9 = $r0.1, 0x18   ## [spec] bblock 43, line 1905,  t300,  t274,  offset(bSig1?1.281)=0x18(P32)
;;								## 0
	c0    ldw.d $r0.10 = 0x18[$r0.1]   ## [spec] bblock 43, line 1900, t306, t274
	c0    mov $r0.11 = $r0.12   ## [spec] bblock 13, line 1942,  t335,  t337
	c0    mov $r0.3 = $r0.7   ## t293
;;								## 1
	c0    ldw.d $r0.13 = 0x14[$r0.1]   ## [spec] bblock 49, line 1930, t244, t274
	c0    add $r0.4 = $r0.11, -11   ## [spec] bblock 11, line 1945,  t270,  t335,  -11(SI32)
	c0    brf $b0.0, L177?3   ## bblock 41, line 1892,  t472(I1)
;;								## 2
	c0    add $r0.14 = $r0.14, -1   ## bblock 54, line 1893,  t334,  t334,  -1(SI32)
	c0    mov $r0.11 = $r0.2   ## [spec] bblock 53, line 1899,  t304,  t307
	c0    ldw.d $r0.15 = 0x1c[$r0.1]   ## [spec] bblock 13, line 1936, t256, t274
;;								## 3
L178?3:
	c0    sub $r0.16 = $r0.0, $r0.14   ## bblock 43, line 1906,  t197,  0(I32),  t334
	c0    cmpeq $b0.0 = $r0.14, $r0.0   ## bblock 43, line 1906,  t473(I1),  t334,  0(SI32)
	c0    mov $r0.17 = $r0.10   ## [spec] bblock 53, line 1900,  t303,  t306
;;								## 4
	c0    and $r0.16 = $r0.16, 31   ## bblock 43, line 1903,  t302,  t197,  31(I32)
	c0    or $r0.13 = $r0.13, 1073741824   ## [spec] bblock 49, line 1930,  t245,  t244,  1073741824(I32)
;;								## 5
	c0    brf $b0.0, L179?3   ## bblock 43, line 1906,  t473(I1)
;;								## 6
L180?3:
	c0    stw 0x14[$r0.1] = $r0.13   ## bblock 49, line 1930, t274, t245
;;								## 7
	c0    ldw $r0.2 = 0x14[$r0.1]   ## bblock 13, line 1935, t260, t274
;;								## 8
	c0    stw 0[$r0.8] = $r0.11   ## bblock 49, line 1928, t301, t304
;;								## 9
	c0    ldw $r0.8 = 0x10[$r0.1]   ## bblock 13, line 1937, t259, t274
;;								## 10
	c0    stw 0[$r0.9] = $r0.17   ## bblock 49, line 1927, t300, t303
;;								## 11
L181?3:
	c0    ldw $r0.9 = 0x18[$r0.1]   ## bblock 13, line 1938, t257, t274
;;								## 12
	c0    sub $r0.2 = $r0.2, $r0.8   ## bblock 13, line 1940,  t460,  t260,  t259
	      xnop 1
;;								## 14
	c0    sub $r0.10 = $r0.15, $r0.9   ## bblock 13, line 1939,  t254,  t256,  t257
	c0    cmpltu $r0.8 = $r0.15, $r0.9   ## bblock 13, line 1940,  t258,  t256,  t257
;;								## 15
	c0    stw 0x24[$r0.1] = $r0.10   ## bblock 13, line 1939, t274, t254
	c0    sub $r0.2 = $r0.2, $r0.8   ## bblock 13, line 1940,  t261,  t460,  t258
;;								## 16
	c0    ldw $r0.6 = 0x24[$r0.1]   ## bblock 11, line 1945, t272, t274
;;								## 17
	c0    stw 0x20[$r0.1] = $r0.2   ## bblock 13, line 1940, t274, t261
;;								## 18
L182?3:
	c0    ldw $r0.5 = 0x20[$r0.1]   ## bblock 11, line 1945, t271, t274
	      xnop 1
;;								## 20
.call normalizeRoundAndPackFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = normalizeRoundAndPackFloat64   ## bblock 11, line 1945,  raddr(normalizeRoundAndPackFloat64)(P32),  t293,  t270,  t271,  t272
;;								## 21
	c0    ldw $l0.0 = 0x28[$r0.1]  ## restore ## t273
	      xnop 3
;;								## 25
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 12, line 1945,  t274,  ?2.33?2auto_size(I32),  t273
;;								## 26
.trace 7
L179?3:
	c0    shl $r0.5 = $r0.2, $r0.16   ## bblock 44, line 1912,  t425,  t307,  t302
	c0    or $r0.12 = $r0.10, $r0.2   ## bblock 44, line 1923,  t431,  t306,  t307
	c0    cmpge $b0.0 = $r0.14, 64   ## bblock 44, line 1919,  t424(I1),  t334,  64(SI32)
	c0    and $r0.6 = $r0.14, 31   ## bblock 44, line 1920,  t428,  t334,  31(I32)
;;								## 0
	c0    cmpne $r0.19 = $r0.10, $r0.0   ## bblock 44, line 1917,  t422,  t306,  0(I32)
	c0    or $r0.18 = $r0.10, $r0.5   ## bblock 44, line 1920,  t426,  t306,  t425
	c0    cmpne $r0.12 = $r0.12, $r0.0   ## bblock 44, line 1923,  t432,  t431,  0(I32)
	c0    shru $r0.6 = $r0.2, $r0.6   ## bblock 44, line 1920,  t429,  t307,  t428
;;								## 1
	c0    cmpeq $b0.1 = $r0.14, 32   ## bblock 44, line 1916,  t421(I1),  t334,  32(SI32)
	c0    shru $r0.20 = $r0.10, $r0.14   ## bblock 44, line 1912,  t417,  t306,  t334
	c0    cmpne $r0.18 = $r0.18, $r0.0   ## bblock 44, line 1920,  t427,  t426,  0(I32)
	c0    or $r0.19 = $r0.19, $r0.2   ## bblock 44, line 1917,  t423,  t422,  t307
;;								## 2
	c0    cmpge $b0.2 = $r0.14, 32   ## bblock 44, line 1910,  t414(I1),  t334,  32(SI32)
	c0    shl $r0.10 = $r0.10, $r0.16   ## bblock 44, line 1912,  t415,  t306,  t302
	c0    or $r0.20 = $r0.20, $r0.5   ## bblock 44, line 1912,  t474,  t417,  t425
	c0    or $r0.18 = $r0.18, $r0.6   ## bblock 44, line 1920,  t430,  t427,  t429
;;								## 3
	c0    cmpne $r0.10 = $r0.10, $r0.0   ## bblock 44, line 1912,  t416,  t415,  0(I32)
	c0    shru $r0.2 = $r0.2, $r0.14   ## bblock 44, line 1913,  t420,  t307,  t334
	c0    slct $r0.12 = $b0.0, $r0.12, $r0.18   ## bblock 44, line 1920,  t433,  t424(I1),  t432,  t430
	c0    mov $r0.3 = $r0.7   ## t293
;;								## 4
	c0    or $r0.20 = $r0.20, $r0.10   ## bblock 44, line 1912,  t419,  t474,  t416
	c0    slct $r0.19 = $b0.1, $r0.19, $r0.12   ## bblock 44, line 1917,  t434,  t421(I1),  t423,  t433
	c0    slctf $r0.11 = $b0.2, $r0.2, $r0.0   ## bblock 44, line 1913,  t304,  t414(I1),  t420,  0(SI32)
;;								## 5
	c0    slct $r0.17 = $b0.2, $r0.19, $r0.20   ## bblock 44, line 1912,  t303,  t414(I1),  t434,  t419
	c0    goto L180?3 ## goto
;;								## 6
.trace 4
L177?3:
	c0    ldw $r0.5 = 0x10[$r0.1]   ## bblock 42, line 1896, t191, t274
	c0    mov $r0.3 = $r0.7   ## t293
	      xnop 2
;;								## 2
	c0    or $r0.5 = $r0.5, 1073741824   ## bblock 42, line 1896,  t192,  t191,  1073741824(I32)
;;								## 3
	c0    stw 0x10[$r0.1] = $r0.5   ## bblock 42, line 1896, t274, t192
;;								## 4
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 43, line 1899, t307, t274
	      xnop 2
;;								## 7
	c0    mov $r0.11 = $r0.2   ## [spec] bblock 53, line 1899,  t304,  t307
	c0    ldw.d $r0.13 = 0x14[$r0.1]   ## [spec] bblock 49, line 1930, t244, t274
;;								## 8
	c0    ldw.d $r0.15 = 0x1c[$r0.1]   ## [spec] bblock 13, line 1936, t256, t274
	c0    goto L178?3 ## goto
;;								## 9
.trace 3
L174?3:
	c0    cmplt $b0.0 = $r0.14, $r0.0   ## bblock 1, line 1800,  t451(I1),  t334,  0(SI32)
	c0    cmpeq $b0.1 = $r0.13, 2047   ## [spec] bblock 20, line 1828,  t465(I1),  t336,  2047(SI32)
	c0    ldw.d $r0.2 = 0x18[$r0.1]   ## [spec] bblock 35, line 1829, t86, t274
;;								## 0
	c0    ldw.d $r0.8 = 0x10[$r0.1]   ## [spec] bblock 35, line 1829, t87, t274
;;								## 1
	c0    brf $b0.0, L183?3   ## bblock 1, line 1800,  t451(I1)
;;								## 2
	c0    brf $b0.1, L184?3   ## bblock 20, line 1828,  t465(I1)
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.8   ## bblock 35, line 1829,  t469,  t86,  t87
;;								## 4
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 35, line 1829,  t470,  t469,  0(I32)
	      xnop 1
;;								## 6
	c0    brf $b0.0, L185?3   ## bblock 35, line 1829,  t470
;;								## 7
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = propagateFloat64NaN   ## bblock 38, line 1830,  raddr(propagateFloat64NaN)(P32),  t289,  t290,  t291,  t292
;;								## 8
	c0    ldw $l0.0 = 0x28[$r0.1]  ## restore ## t273
	      xnop 3
;;								## 12
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 39, line 1830,  t274,  ?2.33?2auto_size(I32),  t273
;;								## 13
.trace 11
L185?3:
	c0    xor $r0.3 = $r0.7, 1   ## bblock 36, line 1831,  t97,  t293,  1(SI32)
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
;;								## 0
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 36, line 1831,  raddr(packFloat64)(P32),  t97,  2047(SI32),  0(I32),  0(I32)
	c0    mov $r0.4 = 2047   ## 2047(SI32)
;;								## 1
	c0    ldw $l0.0 = 0x28[$r0.1]  ## restore ## t273
	      xnop 3
;;								## 5
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 37, line 1831,  t274,  ?2.33?2auto_size(I32),  t273
;;								## 6
.trace 6
L184?3:
	c0    cmpeq $b0.0 = $r0.12, $r0.0   ## bblock 21, line 1833,  t466(I1),  t337,  0(SI32)
	c0    ldw.d $r0.2 = 0x14[$r0.1]   ## [spec] bblock 23, line 1840, t321, t274
	c0    add $r0.5 = $r0.1, 0x14   ## [spec] bblock 23, line 1845,  t315,  t274,  offset(aSig0?1.281)=0x14(P32)
	c0    add $r0.6 = $r0.1, 0x1c   ## [spec] bblock 23, line 1846,  t314,  t274,  offset(aSig1?1.281)=0x1c(P32)
;;								## 0
	c0    ldw.d $r0.8 = 0x1c[$r0.1]   ## [spec] bblock 23, line 1841, t320, t274
	c0    mov $r0.11 = $r0.13   ## [spec] bblock 10, line 1883,  t335,  t336
;;								## 1
	c0    ldw.d $r0.9 = 0x10[$r0.1]   ## [spec] bblock 29, line 1871, t155, t274
	c0    add $r0.4 = $r0.11, -11   ## [spec] bblock 11, line 1945,  t270,  t335,  -11(SI32)
	c0    brf $b0.0, L186?3   ## bblock 21, line 1833,  t466(I1)
;;								## 2
	c0    add $r0.14 = $r0.14, 1   ## bblock 34, line 1834,  t334,  t334,  1(SI32)
	c0    mov $r0.10 = $r0.2   ## [spec] bblock 33, line 1840,  t318,  t321
	c0    ldw.d $r0.11 = 0x18[$r0.1]   ## [spec] bblock 10, line 1877, t167, t274
;;								## 3
L187?3:
	c0    sub $r0.14 = $r0.0, $r0.14   ## bblock 23, line 1847,  t319,  0(I32),  t334
	c0    mov $r0.12 = $r0.8   ## [spec] bblock 33, line 1841,  t317,  t320
;;								## 4
	c0    sub $r0.15 = $r0.0, $r0.14   ## bblock 23, line 1847,  t108,  0(I32),  t319
	c0    cmpeq $b0.0 = $r0.14, $r0.0   ## bblock 23, line 1847,  t467(I1),  t319,  0(SI32)
	c0    or $r0.9 = $r0.9, 1073741824   ## [spec] bblock 29, line 1871,  t156,  t155,  1073741824(I32)
;;								## 5
	c0    and $r0.15 = $r0.15, 31   ## bblock 23, line 1844,  t316,  t108,  31(I32)
;;								## 6
	c0    brf $b0.0, L188?3   ## bblock 23, line 1847,  t467(I1)
;;								## 7
L189?3:
	c0    stw 0x10[$r0.1] = $r0.9   ## bblock 29, line 1871, t274, t156
	c0    xor $r0.3 = $r0.7, 1   ## bblock 10, line 1884,  t293,  t293,  1(SI32)
;;								## 8
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 10, line 1876, t171, t274
;;								## 9
	c0    stw 0[$r0.5] = $r0.10   ## bblock 29, line 1869, t315, t318
;;								## 10
	c0    ldw $r0.5 = 0x14[$r0.1]   ## bblock 10, line 1878, t170, t274
;;								## 11
	c0    stw 0[$r0.6] = $r0.12   ## bblock 29, line 1868, t314, t317
;;								## 12
L190?3:
	c0    ldw $r0.6 = 0x1c[$r0.1]   ## bblock 10, line 1879, t168, t274
;;								## 13
	c0    sub $r0.2 = $r0.2, $r0.5   ## bblock 10, line 1881,  t459,  t171,  t170
	      xnop 1
;;								## 15
	c0    sub $r0.8 = $r0.11, $r0.6   ## bblock 10, line 1880,  t165,  t167,  t168
	c0    cmpltu $r0.5 = $r0.11, $r0.6   ## bblock 10, line 1881,  t169,  t167,  t168
;;								## 16
	c0    stw 0x24[$r0.1] = $r0.8   ## bblock 10, line 1880, t274, t165
	c0    sub $r0.2 = $r0.2, $r0.5   ## bblock 10, line 1881,  t172,  t459,  t169
;;								## 17
	c0    stw 0x20[$r0.1] = $r0.2   ## bblock 10, line 1881, t274, t172
;;								## 18
	c0    ldw $r0.6 = 0x24[$r0.1]   ## bblock 11, line 1945, t272, t274
;;								## 19
	c0    goto L182?3 ## goto
;;								## 20
.trace 12
L188?3:
	c0    shl $r0.3 = $r0.2, $r0.15   ## bblock 24, line 1853,  t403,  t321,  t316
	c0    or $r0.16 = $r0.8, $r0.2   ## bblock 24, line 1864,  t409,  t320,  t321
	c0    cmpge $b0.0 = $r0.14, 64   ## bblock 24, line 1860,  t402(I1),  t319,  64(SI32)
	c0    and $r0.13 = $r0.14, 31   ## bblock 24, line 1861,  t406,  t319,  31(I32)
;;								## 0
	c0    cmpne $r0.18 = $r0.8, $r0.0   ## bblock 24, line 1858,  t400,  t320,  0(I32)
	c0    or $r0.17 = $r0.8, $r0.3   ## bblock 24, line 1861,  t404,  t320,  t403
	c0    cmpne $r0.16 = $r0.16, $r0.0   ## bblock 24, line 1864,  t410,  t409,  0(I32)
	c0    shru $r0.13 = $r0.2, $r0.13   ## bblock 24, line 1861,  t407,  t321,  t406
;;								## 1
	c0    cmpeq $b0.1 = $r0.14, 32   ## bblock 24, line 1857,  t399(I1),  t319,  32(SI32)
	c0    shru $r0.19 = $r0.8, $r0.14   ## bblock 24, line 1853,  t395,  t320,  t319
	c0    cmpne $r0.17 = $r0.17, $r0.0   ## bblock 24, line 1861,  t405,  t404,  0(I32)
	c0    or $r0.18 = $r0.18, $r0.2   ## bblock 24, line 1858,  t401,  t400,  t321
;;								## 2
	c0    cmpge $b0.2 = $r0.14, 32   ## bblock 24, line 1851,  t392(I1),  t319,  32(SI32)
	c0    shl $r0.8 = $r0.8, $r0.15   ## bblock 24, line 1853,  t393,  t320,  t316
	c0    or $r0.19 = $r0.19, $r0.3   ## bblock 24, line 1853,  t468,  t395,  t403
	c0    or $r0.17 = $r0.17, $r0.13   ## bblock 24, line 1861,  t408,  t405,  t407
;;								## 3
	c0    cmpne $r0.8 = $r0.8, $r0.0   ## bblock 24, line 1853,  t394,  t393,  0(I32)
	c0    shru $r0.2 = $r0.2, $r0.14   ## bblock 24, line 1854,  t398,  t321,  t319
	c0    slct $r0.16 = $b0.0, $r0.16, $r0.17   ## bblock 24, line 1861,  t411,  t402(I1),  t410,  t408
;;								## 4
	c0    or $r0.19 = $r0.19, $r0.8   ## bblock 24, line 1853,  t397,  t468,  t394
	c0    slct $r0.18 = $b0.1, $r0.18, $r0.16   ## bblock 24, line 1858,  t412,  t399(I1),  t401,  t411
	c0    slctf $r0.10 = $b0.2, $r0.2, $r0.0   ## bblock 24, line 1854,  t318,  t392(I1),  t398,  0(SI32)
;;								## 5
	c0    slct $r0.12 = $b0.2, $r0.18, $r0.19   ## bblock 24, line 1853,  t317,  t392(I1),  t412,  t397
	c0    goto L189?3 ## goto
;;								## 6
.trace 10
L186?3:
	c0    ldw $r0.3 = 0x14[$r0.1]   ## bblock 22, line 1837, t101, t274
	      xnop 2
;;								## 2
	c0    or $r0.3 = $r0.3, 1073741824   ## bblock 22, line 1837,  t102,  t101,  1073741824(I32)
;;								## 3
	c0    stw 0x14[$r0.1] = $r0.3   ## bblock 22, line 1837, t274, t102
;;								## 4
	c0    ldw $r0.2 = 0x14[$r0.1]   ## bblock 23, line 1840, t321, t274
	      xnop 2
;;								## 7
	c0    mov $r0.10 = $r0.2   ## [spec] bblock 33, line 1840,  t318,  t321
	c0    ldw.d $r0.9 = 0x10[$r0.1]   ## [spec] bblock 29, line 1871, t155, t274
;;								## 8
	c0    ldw.d $r0.11 = 0x18[$r0.1]   ## [spec] bblock 10, line 1877, t167, t274
	c0    goto L187?3 ## goto
;;								## 9
.trace 5
L183?3:
	c0    cmpeq $b0.0 = $r0.12, 2047   ## bblock 2, line 1805,  t452(I1),  t337,  2047(SI32)
	c0    cmpne $b0.1 = $r0.12, $r0.0   ## [spec] bblock 3, line 1815,  t453(I1),  t337,  0(I32)
	c0    cmpne $b0.2 = $r0.12, $r0.0   ## [spec] bblock 3, line 1815,  t454(I1),  t337,  0(I32)
;;								## 0
	c0    slct $r0.13 = $b0.1, $r0.13, 1   ## [spec] bblock 3, line 1815,  t336,  t453(I1),  t336,  1(SI32)
	c0    slct $r0.12 = $b0.2, $r0.12, 1   ## [spec] bblock 3, line 1815,  t337,  t454(I1),  t337,  1(SI32)
	c0    ldw.d $r0.8 = 0x10[$r0.1]   ## [spec] bblock 3, line 1818, t73, t274
	c0    mov $r0.9 = $r0.3   ## t289
;;								## 1
	c0    ldw.d $r0.10 = 0x14[$r0.1]   ## [spec] bblock 3, line 1818, t74, t274
	c0    mov $r0.11 = $r0.12   ## [spec] bblock 13, line 1942,  t335,  t337
	c0    mov $r0.3 = $r0.7   ## t293
	c0    br $b0.0, L191?3   ## bblock 2, line 1805,  t452(I1)
;;								## 2
	c0    ldw.d $r0.2 = 0x14[$r0.1]   ## [spec] bblock 13, line 1935, t260, t274
	c0    add $r0.4 = $r0.11, -11   ## [spec] bblock 11, line 1945,  t270,  t335,  -11(SI32)
;;								## 3
	c0    ldw.d $r0.15 = 0x1c[$r0.1]   ## [spec] bblock 13, line 1936, t256, t274
;;								## 4
	c0    cmpltu $b0.0 = $r0.8, $r0.10   ## bblock 3, line 1818,  t455(I1),  t73,  t74
	      xnop 1
;;								## 6
	c0    brf $b0.0, L192?3   ## bblock 3, line 1818,  t455(I1)
;;								## 7
	c0    ldw $r0.8 = 0x10[$r0.1]   ## bblock 13, line 1937, t259, t274
;;								## 8
	c0    goto L181?3 ## goto
;;								## 9
.trace 9
L192?3:
	c0    cmpltu $b0.0 = $r0.10, $r0.8   ## bblock 5, line 1820,  t456(I1),  t74,  t73
	c0    ldw.d $r0.2 = 0x10[$r0.1]   ## [spec] bblock 10, line 1876, t171, t274
	c0    mov $r0.5 = $r0.13   ## [spec] bblock 10, line 1883,  t335,  t336
;;								## 0
	c0    ldw.d $r0.11 = 0x18[$r0.1]   ## [spec] bblock 10, line 1877, t167, t274
	c0    add $r0.4 = $r0.5, -11   ## [spec] bblock 11, line 1945,  t270,  t335,  -11(SI32)
;;								## 1
	c0    brf $b0.0, L193?3   ## bblock 5, line 1820,  t456(I1)
;;								## 2
	c0    xor $r0.3 = $r0.3, 1   ## bblock 10, line 1884,  t293,  t293,  1(SI32)
	c0    ldw $r0.5 = 0x14[$r0.1]   ## bblock 10, line 1878, t170, t274
;;								## 3
	c0    goto L190?3 ## goto
;;								## 4
.trace 13
L193?3:
	c0    ldw $r0.5 = 0x18[$r0.1]   ## bblock 6, line 1822, t77, t274
	   ## [spec] bblock 13, line 1942,  t335,  t337## $r0.12(skipped)
;;								## 0
	c0    ldw $r0.6 = 0x1c[$r0.1]   ## bblock 6, line 1822, t78, t274
	c0    add $r0.4 = $r0.12, -11   ## [spec] bblock 11, line 1945,  t270,  t335,  -11(SI32)
;;								## 1
	c0    ldw.d $r0.2 = 0x14[$r0.1]   ## [spec] bblock 13, line 1935, t260, t274
;;								## 2
	c0    ldw.d $r0.15 = 0x1c[$r0.1]   ## [spec] bblock 13, line 1936, t256, t274
;;								## 3
	c0    cmpltu $b0.0 = $r0.5, $r0.6   ## bblock 6, line 1822,  t457(I1),  t77,  t78
	      xnop 1
;;								## 5
	c0    brf $b0.0, L194?3   ## bblock 6, line 1822,  t457(I1)
;;								## 6
	c0    ldw $r0.8 = 0x10[$r0.1]   ## bblock 13, line 1937, t259, t274
;;								## 7
	c0    goto L181?3 ## goto
;;								## 8
.trace 14
L194?3:
	c0    cmpltu $b0.0 = $r0.6, $r0.5   ## bblock 7, line 1824,  t458(I1),  t78,  t77
	c0    ldw.d $r0.2 = 0x10[$r0.1]   ## [spec] bblock 10, line 1876, t171, t274
	   ## [spec] bblock 10, line 1883,  t335,  t336## $r0.13(skipped)
	c0    xor $r0.3 = $r0.3, 1   ## [spec] bblock 10, line 1884,  t293,  t293,  1(SI32)
;;								## 0
	c0    ldw.d $r0.11 = 0x18[$r0.1]   ## [spec] bblock 10, line 1877, t167, t274
	c0    add $r0.4 = $r0.13, -11   ## [spec] bblock 11, line 1945,  t270,  t335,  -11(SI32)
;;								## 1
	c0    brf $b0.0, L195?3   ## bblock 7, line 1824,  t458(I1)
;;								## 2
	c0    ldw $r0.5 = 0x14[$r0.1]   ## bblock 10, line 1878, t170, t274
;;								## 3
	c0    goto L190?3 ## goto
;;								## 4
.trace 15
L195?3:
	c0    ldw $r0.2 = ((_?1PACKET.2 + 0) + 0)[$r0.0]   ## bblock 8, line 1826, t83, 0(I32)
	c0    mov $r0.4 = $r0.0   ## 0(SI32)
	c0    mov $r0.5 = $r0.0   ## 0(I32)
;;								## 0
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	      xnop 1
;;								## 2
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    cmpeq $r0.3 = $r0.2, 1   ## bblock 8, line 1826,  t84,  t83,  1(SI32)
	c0    call $l0.0 = packFloat64   ## bblock 8, line 1826,  raddr(packFloat64)(P32),  t84,  0(SI32),  0(I32),  0(I32)
;;								## 3
	c0    ldw $l0.0 = 0x28[$r0.1]  ## restore ## t273
	      xnop 3
;;								## 7
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 9, line 1826,  t274,  ?2.33?2auto_size(I32),  t273
;;								## 8
.trace 16
L191?3:
	c0    ldw $r0.2 = 0x18[$r0.1]   ## bblock 15, line 1806, t60, t274
	c0    mov $r0.3 = $r0.9   ## t289
;;								## 0
	c0    ldw $r0.7 = 0x14[$r0.1]   ## bblock 15, line 1806, t63, t274
;;								## 1
	c0    ldw $r0.8 = 0x10[$r0.1]   ## bblock 15, line 1806, t61, t274
;;								## 2
	c0    ldw $r0.9 = 0x1c[$r0.1]   ## bblock 15, line 1806, t62, t274
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.7   ## bblock 15, line 1806,  t461,  t60,  t63
	      xnop 1
;;								## 5
	c0    or $r0.8 = $r0.8, $r0.9   ## bblock 15, line 1806,  t462,  t61,  t62
;;								## 6
	c0    or $r0.2 = $r0.2, $r0.8   ## bblock 15, line 1806,  t463,  t461,  t462
;;								## 7
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 15, line 1806,  t464,  t463,  0(I32)
	      xnop 1
;;								## 9
	c0    brf $b0.0, L196?3   ## bblock 15, line 1806,  t464
;;								## 10
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = propagateFloat64NaN   ## bblock 18, line 1807,  raddr(propagateFloat64NaN)(P32),  t289,  t290,  t291,  t292
;;								## 11
	c0    ldw $l0.0 = 0x28[$r0.1]  ## restore ## t273
	      xnop 3
;;								## 15
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 19, line 1807,  t274,  ?2.33?2auto_size(I32),  t273
;;								## 16
.trace 17
L196?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 16, line 1809,  raddr(float_raise)(P32),  16(SI32)
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    mov $r0.4 = (~0x0)   ## (~0x0)(I32)
	c0    ldw $l0.0 = 0x28[$r0.1]  ## restore ## t273
	c0    mov $r0.3 = 2147483647   ## 2147483647(I32)
	      xnop 3
;;								## 4
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 17, line 1812,  t274,  ?2.33?2auto_size(I32),  t273
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.33?2scratch.0, 0x0
.equ _?1PACKET.360, 0x10
.equ _?1PACKET.358, 0x14
.equ _?1PACKET.361, 0x18
.equ _?1PACKET.359, 0x1c
.equ _?1PACKET.362, 0x20
.equ _?1PACKET.363, 0x24
.equ ?2.33?2ras_p, 0x28
.section .data
.section .text
.equ ?2.33?2auto_size, 0x40
 ## End subFloat64Sigs
 ## Begin _d_add
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
_d_add::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.7 = $r0.3, 31   ## bblock 0, line 1952,  t40(I1),  t35,  31(SI32)
	c0    shru $r0.2 = $r0.5, 31   ## bblock 0, line 1953,  t5(I1),  t37,  31(SI32)
;;								## 0
	c0    cmpeq $b0.0 = $r0.7, $r0.2   ## bblock 0, line 1954,  t41(I1),  t40(I1),  t5(I1)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t20
	      xnop 1
;;								## 2
	c0    brf $b0.0, L197?3   ## bblock 0, line 1954,  t41(I1)
;;								## 3
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = addFloat64Sigs   ## bblock 3, line 1954,  raddr(addFloat64Sigs)(P32),  t35,  t36,  t37,  t38,  t40(I1)
;;								## 4
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t20
	      xnop 3
;;								## 8
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 4, line 1954,  t21,  ?2.34?2auto_size(I32),  t20
;;								## 9
.trace 2
L197?3:
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = subFloat64Sigs   ## bblock 1, line 1954,  raddr(subFloat64Sigs)(P32),  t35,  t36,  t37,  t38,  t40(I1)
;;								## 0
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t20
	      xnop 3
;;								## 4
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 1954,  t21,  ?2.34?2auto_size(I32),  t20
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.34?2scratch.0, 0x0
.equ ?2.34?2ras_p, 0x10
.section .data
.section .text
.equ ?2.34?2auto_size, 0x20
 ## End _d_add
 ## Begin _d_sub
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
_d_sub::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.7 = $r0.3, 31   ## bblock 0, line 1961,  t40(I1),  t35,  31(SI32)
	c0    shru $r0.2 = $r0.5, 31   ## bblock 0, line 1962,  t5(I1),  t37,  31(SI32)
;;								## 0
	c0    cmpeq $b0.0 = $r0.7, $r0.2   ## bblock 0, line 1963,  t41(I1),  t40(I1),  t5(I1)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t20
	      xnop 1
;;								## 2
	c0    brf $b0.0, L198?3   ## bblock 0, line 1963,  t41(I1)
;;								## 3
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = subFloat64Sigs   ## bblock 3, line 1963,  raddr(subFloat64Sigs)(P32),  t35,  t36,  t37,  t38,  t40(I1)
;;								## 4
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t20
	      xnop 3
;;								## 8
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 4, line 1963,  t21,  ?2.35?2auto_size(I32),  t20
;;								## 9
.trace 2
L198?3:
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:s32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = addFloat64Sigs   ## bblock 1, line 1963,  raddr(addFloat64Sigs)(P32),  t35,  t36,  t37,  t38,  t40(I1)
;;								## 0
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t20
	      xnop 3
;;								## 4
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 1963,  t21,  ?2.35?2auto_size(I32),  t20
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.35?2scratch.0, 0x0
.equ ?2.35?2ras_p, 0x10
.section .data
.section .text
.equ ?2.35?2auto_size, 0x20
 ## End _d_sub
 ## Begin _d_mul
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
_d_mul::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x60)
	c0    shru $r0.2 = $r0.3, 20   ## bblock 0, line 1975,  t4(I12),  t501,  20(SI32)
	c0    shru $r0.8 = $r0.5, 20   ## bblock 0, line 1979,  t12(I12),  t503,  20(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, 2047   ## bblock 0, line 1975,  t19,  t4(I12),  2047(I32)
	c0    shru $r0.9 = $r0.3, 31   ## bblock 0, line 1976,  t17(I1),  t501,  31(SI32)
	c0    stw 0x50[$r0.1] = $l0.0  ## spill ## t486
;;								## 1
	c0    and $r0.10 = $r0.3, 1048575   ## bblock 0, line 1974,  t2,  t501,  1048575(I32)
	c0    and $r0.8 = $r0.8, 2047   ## bblock 0, line 1979,  t13,  t12(I12),  2047(I32)
;;								## 2
	c0    and $r0.12 = $r0.5, 1048575   ## bblock 0, line 1978,  t10,  t503,  1048575(I32)
	c0    shru $r0.11 = $r0.5, 31   ## bblock 0, line 1980,  t16(I1),  t503,  31(SI32)
	c0    cmpeq $b0.0 = $r0.2, $r0.0   ## [spec] bblock 2, line 2012,  t645(I1),  t19,  0(SI32)
;;								## 3
	c0    cmpeq $b0.1 = $r0.2, 2047   ## bblock 0, line 1985,  t643(I1),  t19,  2047(SI32)
	c0    cmpeq $b0.2 = $r0.8, 2047   ## [spec] bblock 1, line 1997,  t644(I1),  t13,  2047(SI32)
;;								## 4
	c0    stw 0x1c[$r0.1] = $r0.2   ## bblock 0, line 1975, t487, t19
	c0    mov $r0.13 = $r0.3   ## t501
;;								## 5
	c0    xor $r0.3 = $r0.9, $r0.11   ## bblock 0, line 1981,  t615,  t17(I1),  t16(I1)
	c0    ldw.d $r0.2 = 0x1c[$r0.1]   ## [spec] bblock 4, line 2025, t85, t487
;;								## 6
	c0    stw 0x10[$r0.1] = $r0.8   ## bblock 0, line 1979, t487, t13
;;								## 7
	c0    ldw.d $r0.8 = 0x10[$r0.1]   ## [spec] bblock 3, line 2020, t72, t487
;;								## 8
	c0    ldw.d $r0.9 = 0x10[$r0.1]   ## [spec] bblock 4, line 2025, t84, t487
;;								## 9
	c0    stw 0x24[$r0.1] = $r0.4   ## bblock 0, line 1973, t487, t502
;;								## 10
	c0    cmpeq $b0.3 = $r0.8, $r0.0   ## [spec] bblock 3, line 2020,  t646(I1),  t72,  0(SI32)
	c0    ldw.d $r0.11 = 0x24[$r0.1]   ## [spec] bblock 4, line 2043, t404, t487
;;								## 11
	c0    stw 0x20[$r0.1] = $r0.10   ## bblock 0, line 1974, t487, t2
	c0    add $r0.9 = $r0.9, -1024   ## [spec] bblock 4, line 2025,  t647,  t84,  -1024(SI32)
;;								## 12
	c0    add $r0.9 = $r0.9, $r0.2   ## [spec] bblock 4, line 2025,  t614,  t647,  t85
	c0    ldw.d $r0.8 = 0x20[$r0.1]   ## [spec] bblock 4, line 2026, t87, t487
;;								## 13
	c0    stw 0x18[$r0.1] = $r0.6   ## bblock 0, line 1977, t487, t504
;;								## 14
	c0    ldw.d $r0.2 = 0x18[$r0.1]   ## [spec] bblock 4, line 2031, t99, t487
;;								## 15
	c0    stw 0x14[$r0.1] = $r0.12   ## bblock 0, line 1978, t487, t10
	c0    or $r0.8 = $r0.8, 1048576   ## [spec] bblock 4, line 2026,  t412,  t87,  1048576(I32)
	c0    br $b0.1, L199?3   ## bblock 0, line 1985,  t643(I1)
;;								## 16
	c0    ldw.d $r0.12 = 0x14[$r0.1]   ## [spec] bblock 4, line 2030, t104, t487
	c0    br $b0.2, L200?3   ## bblock 1, line 1997,  t644(I1)
;;								## 17
	c0    shl $r0.13 = $r0.2, 12   ## [spec] bblock 4, line 2033,  t316,  t99,  12(SI32)
	c0    shru $r0.14 = $r0.2, 20   ## [spec] bblock 4, line 2035,  t103(I12),  t99,  20(I32)
	c0    br $b0.0, L201?3   ## bblock 2, line 2012,  t645(I1)
;;								## 18
L202?3:
	c0    mpylhu $r0.2 = $r0.13, $r0.11   ## [spec] bblock 4, line 2058,  t151,  t316,  t404
	c0    mpylhu $r0.10 = $r0.11, $r0.13   ## [spec] bblock 4, line 2057,  t144,  t404,  t316
	c0    br $b0.3, L203?3   ## bblock 3, line 2020,  t646(I1)
;;								## 19
L204?3:
	c0    stw 0x20[$r0.1] = $r0.8   ## bblock 4, line 2026, t487, t412
	c0    shl $r0.12 = $r0.12, 12   ## bblock 4, line 2035,  t106,  t104,  12(SI32)
	c0    mpyllu $r0.15 = $r0.11, $r0.13   ## bblock 4, line 2056,  t157,  t404,  t316
	c0    mpyhhu $r0.16 = $r0.11, $r0.13   ## bblock 4, line 2059,  t147,  t404,  t316
;;								## 20
	c0    or $r0.12 = $r0.12, $r0.14   ## bblock 4, line 2035,  t248,  t106,  t103(I12)
	c0    add $r0.10 = $r0.2, $r0.10   ## bblock 4, line 2060,  t155,  t151,  t144
	c0    mpylhu $r0.17 = $r0.8, $r0.13   ## bblock 4, line 2140,  t331,  t412,  t316
	c0    mpylhu $r0.18 = $r0.13, $r0.8   ## bblock 4, line 2141,  t338,  t316,  t412
;;								## 21
	c0    mpylhu $r0.20 = $r0.12, $r0.11   ## bblock 4, line 2079,  t202,  t248,  t404
	c0    shru $r0.19 = $r0.10, 16   ## bblock 4, line 2062,  t149(I16),  t155,  16(SI32)
	c0    cmpltu $r0.2 = $r0.10, $r0.2   ## bblock 4, line 2062,  t152,  t155,  t151
	c0    shl $r0.14 = $r0.10, 16   ## bblock 4, line 2063,  t162,  t155,  16(SI32)
;;								## 22
	c0    shl $r0.2 = $r0.2, 16   ## bblock 4, line 2062,  t153,  t152,  16(SI32)
	c0    add $r0.15 = $r0.15, $r0.14   ## bblock 4, line 2064,  t417,  t157,  t162
	c0    add $r0.19 = $r0.19, $r0.16   ## bblock 4, line 2065,  t648,  t149(I16),  t147
	c0    mpylhu $r0.10 = $r0.11, $r0.12   ## bblock 4, line 2078,  t195,  t404,  t248
;;								## 23
	c0    mpyllu $r0.16 = $r0.11, $r0.12   ## bblock 4, line 2077,  t208,  t404,  t248
	c0    cmpltu $r0.14 = $r0.15, $r0.14   ## bblock 4, line 2065,  t163,  t417,  t162
	c0    mpyhhu $r0.21 = $r0.11, $r0.12   ## bblock 4, line 2080,  t198,  t404,  t248
	c0    add $r0.17 = $r0.17, $r0.18   ## bblock 4, line 2143,  t342,  t331,  t338
;;								## 24
	c0    add $r0.2 = $r0.2, $r0.14   ## bblock 4, line 2065,  t649,  t153,  t163
	c0    add $r0.10 = $r0.20, $r0.10   ## bblock 4, line 2081,  t206,  t202,  t195
	c0    mpylhu $r0.22 = $r0.8, $r0.12   ## bblock 4, line 2109,  t263,  t412,  t248
	c0    mpylhu $r0.23 = $r0.12, $r0.8   ## bblock 4, line 2110,  t270,  t248,  t412
;;								## 25
	c0    add $r0.19 = $r0.19, $r0.2   ## bblock 4, line 2065,  t225,  t648,  t649
	c0    shru $r0.24 = $r0.10, 16   ## bblock 4, line 2083,  t200(I16),  t206,  16(SI32)
	c0    cmpltu $r0.20 = $r0.10, $r0.20   ## bblock 4, line 2083,  t203,  t206,  t202
	c0    shl $r0.14 = $r0.10, 16   ## bblock 4, line 2084,  t213,  t206,  16(SI32)
;;								## 26
	c0    shl $r0.20 = $r0.20, 16   ## bblock 4, line 2083,  t204,  t203,  16(SI32)
	c0    add $r0.16 = $r0.16, $r0.14   ## bblock 4, line 2085,  t231,  t208,  t213
	c0    add $r0.24 = $r0.24, $r0.21   ## bblock 4, line 2086,  t650,  t200(I16),  t198
	c0    add $r0.22 = $r0.22, $r0.23   ## bblock 4, line 2112,  t274,  t263,  t270
;;								## 27
	c0    mpyllu $r0.10 = $r0.12, $r0.8   ## bblock 4, line 2108,  t276,  t248,  t412
	c0    cmpltu $r0.14 = $r0.16, $r0.14   ## bblock 4, line 2086,  t214,  t231,  t213
	c0    add $r0.19 = $r0.19, $r0.16   ## bblock 4, line 2096,  t361,  t225,  t231
	c0    shl $r0.2 = $r0.22, 16   ## bblock 4, line 2115,  t281,  t274,  16(SI32)
;;								## 28
	c0    mpyllu $r0.25 = $r0.13, $r0.8   ## bblock 4, line 2139,  t344,  t316,  t412
	c0    cmpltu $r0.16 = $r0.19, $r0.16   ## bblock 4, line 2098,  t232,  t361,  t231
	c0    add $r0.20 = $r0.20, $r0.14   ## bblock 4, line 2086,  t651,  t204,  t214
	c0    shl $r0.21 = $r0.17, 16   ## bblock 4, line 2146,  t349,  t342,  16(SI32)
;;								## 29
	c0    add $r0.24 = $r0.24, $r0.20   ## bblock 4, line 2086,  t234,  t650,  t651
	c0    add $r0.10 = $r0.10, $r0.2   ## bblock 4, line 2116,  t299,  t276,  t281
	c0    shru $r0.14 = $r0.17, 16   ## bblock 4, line 2145,  t336(I16),  t342,  16(SI32)
	c0    cmpltu $r0.18 = $r0.17, $r0.18   ## bblock 4, line 2145,  t339,  t342,  t338
;;								## 30
	c0    add $r0.24 = $r0.24, $r0.16   ## bblock 4, line 2098,  t293,  t234,  t232
	c0    shl $r0.18 = $r0.18, 16   ## bblock 4, line 2145,  t340,  t339,  16(SI32)
	c0    add $r0.25 = $r0.25, $r0.21   ## bblock 4, line 2147,  t367,  t344,  t349
	c0    mpyhhu $r0.17 = $r0.13, $r0.8   ## bblock 4, line 2142,  t334,  t316,  t412
;;								## 31
	c0    cmpltu $r0.2 = $r0.10, $r0.2   ## bblock 4, line 2117,  t282,  t299,  t281
	c0    add $r0.24 = $r0.10, $r0.24   ## bblock 4, line 2127,  t384,  t299,  t293
	c0    cmpltu $r0.21 = $r0.25, $r0.21   ## bblock 4, line 2148,  t350,  t367,  t349
	c0    add $r0.19 = $r0.25, $r0.19   ## bblock 4, line 2158,  t416,  t367,  t361
;;								## 32
	c0    cmpltu $r0.10 = $r0.24, $r0.10   ## bblock 4, line 2129,  t300,  t384,  t299
	c0    cmpltu $r0.16 = $r0.19, $r0.25   ## bblock 4, line 2160,  t368,  t416,  t367
	c0    add $r0.14 = $r0.14, $r0.17   ## bblock 4, line 2148,  t654,  t336(I16),  t334
	c0    add $r0.18 = $r0.18, $r0.21   ## bblock 4, line 2148,  t655,  t340,  t350
;;								## 33
	c0    shru $r0.17 = $r0.22, 16   ## bblock 4, line 2114,  t268(I16),  t274,  16(SI32)
	c0    cmpltu $r0.23 = $r0.22, $r0.23   ## bblock 4, line 2114,  t271,  t274,  t270
	c0    mpyhhu $r0.20 = $r0.12, $r0.8   ## bblock 4, line 2111,  t266,  t248,  t412
	c0    add $r0.14 = $r0.14, $r0.18   ## bblock 4, line 2148,  t370,  t654,  t655
;;								## 34
	c0    cmpne $r0.18 = $r0.15, $r0.0   ## bblock 4, line 2188,  t418,  t417,  0(I32)
	c0    shl $r0.23 = $r0.23, 16   ## bblock 4, line 2114,  t272,  t271,  16(SI32)
	c0    stw 0x44[$r0.1] = $r0.19   ## bblock 4, line 2159, t487, t416
	c0    add $r0.14 = $r0.14, $r0.16   ## bblock 4, line 2160,  t378,  t370,  t368
;;								## 35
	c0    add $r0.17 = $r0.17, $r0.20   ## bblock 4, line 2117,  t652,  t268(I16),  t266
	c0    add $r0.23 = $r0.23, $r0.2   ## bblock 4, line 2117,  t653,  t272,  t282
	c0    or $r0.19 = $r0.19, $r0.18   ## bblock 4, line 2188,  t419,  t416,  t418
	c0    add $r0.16 = $r0.24, $r0.14   ## bblock 4, line 2168,  t410,  t384,  t378
;;								## 36
	c0    add $r0.17 = $r0.17, $r0.23   ## bblock 4, line 2117,  t302,  t652,  t653
	c0    cmpltu $r0.24 = $r0.16, $r0.24   ## bblock 4, line 2170,  t385,  t410,  t384
	c0    add $r0.11 = $r0.11, $r0.16   ## bblock 4, line 2184,  t409,  t404,  t410
	c0    cmpne $r0.2 = $r0.19, $r0.0   ## [spec] bblock 7, line 2229,  t469,  t419,  0(I32)
;;								## 37
	c0    add $r0.17 = $r0.17, $r0.10   ## bblock 4, line 2129,  t387,  t302,  t300
	c0    cmpltu $r0.18 = $r0.11, $r0.16   ## bblock 4, line 2186,  t411,  t409,  t410
	c0    shl $r0.21 = $r0.11, 31   ## [spec] bblock 7, line 2207,  t508,  t409,  31(I32)
	c0    shru $r0.20 = $r0.11, 1   ## [spec] bblock 7, line 2208,  t628(I31),  t409,  1(SI32)
;;								## 38
	c0    add $r0.17 = $r0.17, $r0.24   ## bblock 4, line 2170,  t413,  t387,  t385
	c0    stw 0x3c[$r0.1] = $r0.11   ## bblock 4, line 2185, t487, t409
	c0    add $r0.8 = $r0.8, $r0.18   ## bblock 4, line 2186,  t656,  t412,  t411
	c0    or $r0.21 = $r0.21, $r0.2   ## [spec] bblock 7, line 2229,  t618,  t508,  t469
;;								## 39
	c0    add $r0.8 = $r0.8, $r0.17   ## bblock 4, line 2186,  t420,  t656,  t413
	c0    stw 0x30[$r0.1] = $r0.17   ## bblock 4, line 2170, t487, t413
;;								## 40
	c0    cmpgeu $b0.0 = $r0.8, 2097152   ## bblock 4, line 2189,  t657(I1),  t420,  2097152(SI32)
	c0    shl $r0.10 = $r0.8, 31   ## [spec] bblock 7, line 2208,  t640,  t420,  31(I32)
	c0    shru $r0.2 = $r0.8, 1   ## [spec] bblock 7, line 2209,  t510(I31),  t420,  1(SI32)
;;								## 41
	c0    stw 0x28[$r0.1] = $r0.8   ## bblock 4, line 2186, t487, t420
	c0    or $r0.20 = $r0.20, $r0.10   ## [spec] bblock 7, line 2208,  t509,  t628(I31),  t640
;;								## 42
	c0    stw 0x38[$r0.1] = $r0.16   ## bblock 4, line 2169, t487, t410
;;								## 43
	c0    stw 0x2c[$r0.1] = $r0.14   ## bblock 4, line 2160, t487, t378
;;								## 44
	c0    stw 0x40[$r0.1] = $r0.19   ## bblock 4, line 2188, t487, t419
;;								## 45
	c0    stw 0x4c[$r0.1] = $r0.15   ## bblock 4, line 2066, t487, t417
;;								## 46
	c0    stw 0x48[$r0.1] = $r0.15   ## bblock 4, line 2172, t487, t417
;;								## 47
	c0    stw 0x34[$r0.1] = $r0.25   ## bblock 4, line 2149, t487, t367
;;								## 48
	c0    stw 0x18[$r0.1] = $r0.13   ## bblock 4, line 2033, t487, t316
;;								## 49
	c0    stw 0x14[$r0.1] = $r0.12   ## bblock 4, line 2034, t487, t248
	c0    brf $b0.0, L205?3   ## bblock 4, line 2189,  t657(I1)
;;								## 50
	c0    stw 0x28[$r0.1] = $r0.2   ## bblock 7, line 2233, t487, t510(I31)
	c0    add $r0.4 = $r0.9, 1   ## bblock 7, line 2235,  t614,  t614,  1(SI32)
;;								## 51
	c0    ldw $r0.5 = 0x28[$r0.1]   ## bblock 5, line 2237, t483, t487
;;								## 52
	c0    stw 0x3c[$r0.1] = $r0.20   ## bblock 7, line 2232, t487, t509
;;								## 53
	c0    ldw $r0.6 = 0x3c[$r0.1]   ## bblock 5, line 2237, t484, t487
;;								## 54
	c0    stw 0x40[$r0.1] = $r0.21   ## bblock 7, line 2231, t487, t618
;;								## 55
L206?3:
	c0    ldw $r0.7 = 0x40[$r0.1]   ## bblock 5, line 2237, t485, t487
	      xnop 1
;;								## 57
.call roundAndPackFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = roundAndPackFloat64   ## bblock 5, line 2237,  raddr(roundAndPackFloat64)(P32),  t615,  t614,  t483,  t484,  t485
;;								## 58
	c0    ldw $l0.0 = 0x50[$r0.1]  ## restore ## t486
	      xnop 3
;;								## 62
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 6, line 2237,  t487,  ?2.36?2auto_size(I32),  t486
;;								## 63
.trace 2
L205?3:
	c0    ldw $r0.5 = 0x28[$r0.1]   ## bblock 5, line 2237, t483, t487
	c0    mov $r0.4 = $r0.9   ## t614
;;								## 0
	c0    ldw $r0.6 = 0x3c[$r0.1]   ## bblock 5, line 2237, t484, t487
;;								## 1
	c0    goto L206?3 ## goto
;;								## 2
.trace 6
L203?3:
	c0    ldw $r0.7 = 0x18[$r0.1]   ## bblock 19, line 2021, t73, t487
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    mov $r0.4 = $r0.0   ## 0(SI32)
;;								## 0
	c0    ldw $r0.2 = 0x14[$r0.1]   ## bblock 19, line 2021, t74, t487
	      xnop 2
;;								## 3
	c0    or $r0.7 = $r0.7, $r0.2   ## bblock 19, line 2021,  t75,  t73,  t74
;;								## 4
	c0    cmpeq $b0.0 = $r0.7, $r0.0   ## bblock 19, line 2021,  t658(I1),  t75,  0(SI32)
	      xnop 1
;;								## 6
	c0    brf $b0.0, L207?3   ## bblock 19, line 2021,  t658(I1)
;;								## 7
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 21, line 2022,  raddr(packFloat64)(P32),  t615,  0(SI32),  0(I32),  0(I32)
;;								## 8
	c0    ldw $l0.0 = 0x50[$r0.1]  ## restore ## t486
	      xnop 3
;;								## 12
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 22, line 2022,  t487,  ?2.36?2auto_size(I32),  t486
;;								## 13
.trace 10
L207?3:
	c0    add $r0.6 = $r0.1, 0x14   ## bblock 20, line 2023,  t82,  t487,  offset(bSig0?1.314)=0x14(P32)
	c0    add $r0.7 = $r0.1, 0x18   ## bblock 20, line 2023,  t83,  t487,  offset(bSig1?1.314)=0x18(P32)
	c0    add $r0.5 = $r0.1, 0x10   ## bblock 20, line 2023,  t81,  t487,  offset(bExp?1.314)=0x10(P32)
	c0    stw 0x54[$r0.1] = $r0.3  ## spill ## t615
;;								## 0
	c0    ldw $r0.3 = 0x14[$r0.1]   ## bblock 20, line 2023, t79, t487
;;								## 1
	c0    ldw $r0.4 = 0x18[$r0.1]   ## bblock 20, line 2023, t80, t487
	      xnop 1
;;								## 3
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0    call $l0.0 = normalizeFloat64Subnormal   ## bblock 20, line 2023,  raddr(normalizeFloat64Subnormal)(P32),  t79,  t80,  t81,  t82,  t83
;;								## 4
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 4, line 2025, t84, t487
;;								## 5
	c0    ldw $r0.4 = 0x1c[$r0.1]   ## bblock 4, line 2025, t85, t487
;;								## 6
	c0    ldw $r0.5 = 0x20[$r0.1]   ## bblock 4, line 2026, t87, t487
;;								## 7
	c0    add $r0.2 = $r0.2, -1024   ## bblock 4, line 2025,  t647,  t84,  -1024(SI32)
	c0    ldw $r0.6 = 0x18[$r0.1]   ## bblock 4, line 2031, t99, t487
;;								## 8
	c0    add $r0.9 = $r0.2, $r0.4   ## bblock 4, line 2025,  t614,  t647,  t85
	c0    ldw $r0.12 = 0x14[$r0.1]   ## bblock 4, line 2030, t104, t487
;;								## 9
	c0    or $r0.8 = $r0.5, 1048576   ## bblock 4, line 2026,  t412,  t87,  1048576(I32)
	c0    ldw $r0.11 = 0x24[$r0.1]   ## bblock 4, line 2043, t404, t487
;;								## 10
	c0    shl $r0.13 = $r0.6, 12   ## bblock 4, line 2033,  t316,  t99,  12(SI32)
	c0    shru $r0.14 = $r0.6, 20   ## bblock 4, line 2035,  t103(I12),  t99,  20(I32)
	c0    ldw $r0.3 = 0x54[$r0.1]  ## restore ## t615
	      xnop 1
;;								## 12
	c0    mpylhu $r0.2 = $r0.13, $r0.11   ## [spec] bblock 4, line 2058,  t151,  t316,  t404
	c0    mpylhu $r0.10 = $r0.11, $r0.13   ## [spec] bblock 4, line 2057,  t144,  t404,  t316
	c0    goto L204?3 ## goto
;;								## 13
.trace 5
L201?3:
	c0    or $r0.4 = $r0.4, $r0.10   ## bblock 23, line 2013,  t63,  t502,  t2
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
;;								## 0
	c0    cmpeq $b0.0 = $r0.4, $r0.0   ## bblock 23, line 2013,  t659(I1),  t63,  0(SI32)
	c0    mov $r0.4 = $r0.0   ## 0(SI32)
	      xnop 1
;;								## 2
	c0    brf $b0.0, L208?3   ## bblock 23, line 2013,  t659(I1)
;;								## 3
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 25, line 2014,  raddr(packFloat64)(P32),  t615,  0(SI32),  0(I32),  0(I32)
;;								## 4
	c0    ldw $l0.0 = 0x50[$r0.1]  ## restore ## t486
	      xnop 3
;;								## 8
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 26, line 2014,  t487,  ?2.36?2auto_size(I32),  t486
;;								## 9
.trace 9
L208?3:
	c0    add $r0.6 = $r0.1, 0x20   ## bblock 24, line 2015,  t70,  t487,  offset(aSig0?1.314)=0x20(P32)
	c0    add $r0.7 = $r0.1, 0x24   ## bblock 24, line 2015,  t71,  t487,  offset(aSig1?1.314)=0x24(P32)
	c0    add $r0.5 = $r0.1, 0x1c   ## bblock 24, line 2015,  t69,  t487,  offset(aExp?1.314)=0x1c(P32)
	c0    stw 0x54[$r0.1] = $r0.3  ## spill ## t615
;;								## 0
	c0    ldw $r0.3 = 0x20[$r0.1]   ## bblock 24, line 2015, t67, t487
;;								## 1
	c0    ldw $r0.4 = 0x24[$r0.1]   ## bblock 24, line 2015, t68, t487
	      xnop 1
;;								## 3
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0    call $l0.0 = normalizeFloat64Subnormal   ## bblock 24, line 2015,  raddr(normalizeFloat64Subnormal)(P32),  t67,  t68,  t69,  t70,  t71
;;								## 4
	c0    ldw.d $r0.2 = 0x10[$r0.1]   ## [spec] bblock 4, line 2025, t84, t487
;;								## 5
	c0    ldw.d $r0.4 = 0x1c[$r0.1]   ## [spec] bblock 4, line 2025, t85, t487
;;								## 6
	c0    ldw $r0.5 = 0x10[$r0.1]   ## bblock 3, line 2020, t72, t487
;;								## 7
	c0    add $r0.2 = $r0.2, -1024   ## [spec] bblock 4, line 2025,  t647,  t84,  -1024(SI32)
	c0    ldw.d $r0.6 = 0x20[$r0.1]   ## [spec] bblock 4, line 2026, t87, t487
;;								## 8
	c0    add $r0.9 = $r0.2, $r0.4   ## [spec] bblock 4, line 2025,  t614,  t647,  t85
	c0    ldw.d $r0.2 = 0x18[$r0.1]   ## [spec] bblock 4, line 2031, t99, t487
;;								## 9
	c0    cmpeq $b0.3 = $r0.5, $r0.0   ## bblock 3, line 2020,  t646(I1),  t72,  0(SI32)
	c0    ldw.d $r0.11 = 0x24[$r0.1]   ## [spec] bblock 4, line 2043, t404, t487
;;								## 10
	c0    or $r0.8 = $r0.6, 1048576   ## [spec] bblock 4, line 2026,  t412,  t87,  1048576(I32)
	c0    ldw $r0.3 = 0x54[$r0.1]  ## restore ## t615
;;								## 11
	c0    shl $r0.13 = $r0.2, 12   ## [spec] bblock 4, line 2033,  t316,  t99,  12(SI32)
	c0    shru $r0.14 = $r0.2, 20   ## [spec] bblock 4, line 2035,  t103(I12),  t99,  20(I32)
	c0    ldw.d $r0.12 = 0x14[$r0.1]   ## [spec] bblock 4, line 2030, t104, t487
;;								## 12
	c0    goto L202?3 ## goto
;;								## 13
.trace 4
L200?3:
	c0    ldw $r0.2 = 0x18[$r0.1]   ## bblock 27, line 1998, t43, t487
	c0    mov $r0.3 = $r0.13   ## t501
	c0    mov $r0.7 = $r0.3   ## t615
;;								## 0
	c0    ldw $r0.8 = 0x14[$r0.1]   ## bblock 27, line 1998, t44, t487
	      xnop 2
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.8   ## bblock 27, line 1998,  t660,  t43,  t44
;;								## 4
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 27, line 1998,  t661,  t660,  0(I32)
	      xnop 1
;;								## 6
	c0    brf $b0.0, L209?3   ## bblock 27, line 1998,  t661
;;								## 7
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = propagateFloat64NaN   ## bblock 33, line 1999,  raddr(propagateFloat64NaN)(P32),  t501,  t502,  t503,  t504
;;								## 8
	c0    ldw $l0.0 = 0x50[$r0.1]  ## restore ## t486
	      xnop 3
;;								## 12
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 34, line 1999,  t487,  ?2.36?2auto_size(I32),  t486
;;								## 13
.trace 8
L209?3:
	c0    ldw $r0.2 = 0x24[$r0.1]   ## bblock 28, line 2000, t51, t487
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    ldw $r0.4 = 0x1c[$r0.1]   ## bblock 28, line 2000, t53, t487
;;								## 1
	c0    ldw $r0.5 = 0x20[$r0.1]   ## bblock 28, line 2000, t52, t487
	      xnop 1
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.4   ## bblock 28, line 2000,  t662,  t51,  t53
;;								## 4
	c0    or $r0.2 = $r0.2, $r0.5   ## bblock 28, line 2000,  t54,  t662,  t52
;;								## 5
	c0    cmpeq $b0.0 = $r0.2, $r0.0   ## bblock 28, line 2000,  t663(I1),  t54,  0(SI32)
	      xnop 1
;;								## 7
	c0    brf $b0.0, L211?3   ## bblock 28, line 2000,  t663(I1)
	      ## goto
;;
	c0    goto L210?3 ## goto
;;								## 8
.trace 12
L211?3:
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    mov $r0.3 = $r0.7   ## t615
;;								## 0
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 29, line 2007,  raddr(packFloat64)(P32),  t615,  2047(SI32),  0(I32),  0(I32)
	c0    mov $r0.4 = 2047   ## 2047(SI32)
;;								## 1
	c0    ldw $l0.0 = 0x50[$r0.1]  ## restore ## t486
	      xnop 3
;;								## 5
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 30, line 2007,  t487,  ?2.36?2auto_size(I32),  t486
;;								## 6
.trace 3
L199?3:
	c0    ldw $r0.7 = 0x10[$r0.1]   ## bblock 35, line 1987, t23, t487
	c0    mov $r0.3 = $r0.13   ## t501
	c0    mov $r0.8 = $r0.3   ## t615
;;								## 0
	c0    ldw $r0.2 = 0x18[$r0.1]   ## bblock 35, line 1987, t25, t487
;;								## 1
	c0    ldw $r0.9 = 0x14[$r0.1]   ## bblock 35, line 1987, t26, t487
;;								## 2
	c0    ldw $r0.10 = 0x24[$r0.1]   ## bblock 35, line 1986, t20, t487
	c0    cmpeq $r0.7 = $r0.7, 2047   ## bblock 35, line 1987,  t24,  t23,  2047(SI32)
;;								## 3
	c0    ldw $r0.11 = 0x20[$r0.1]   ## bblock 35, line 1986, t21, t487
;;								## 4
	c0    or $r0.2 = $r0.2, $r0.9   ## bblock 35, line 1987,  t27,  t25,  t26
;;								## 5
	c0    andl $r0.7 = $r0.7, $r0.2   ## bblock 35, line 1987,  t28,  t24,  t27
;;								## 6
	c0    or $r0.10 = $r0.10, $r0.11   ## bblock 35, line 1986,  t22,  t20,  t21
;;								## 7
	c0    orl $b0.0 = $r0.10, $r0.7   ## bblock 35, line 1987,  t665(I1),  t22,  t28
	      xnop 1
;;								## 9
	c0    brf $b0.0, L212?3   ## bblock 35, line 1987,  t665(I1)
;;								## 10
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = propagateFloat64NaN   ## bblock 39, line 1988,  raddr(propagateFloat64NaN)(P32),  t501,  t502,  t503,  t504
;;								## 11
	c0    ldw $l0.0 = 0x50[$r0.1]  ## restore ## t486
	      xnop 3
;;								## 15
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 40, line 1988,  t487,  ?2.36?2auto_size(I32),  t486
;;								## 16
.trace 7
L212?3:
	c0    ldw $r0.2 = 0x18[$r0.1]   ## bblock 36, line 1990, t35, t487
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    ldw $r0.5 = 0x10[$r0.1]   ## bblock 36, line 1990, t37, t487
;;								## 1
	c0    ldw $r0.6 = 0x14[$r0.1]   ## bblock 36, line 1990, t36, t487
	      xnop 1
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.5   ## bblock 36, line 1990,  t666,  t35,  t37
;;								## 4
	c0    or $r0.2 = $r0.2, $r0.6   ## bblock 36, line 1990,  t38,  t666,  t36
;;								## 5
	c0    cmpeq $b0.0 = $r0.2, $r0.0   ## bblock 36, line 1990,  t667(I1),  t38,  0(SI32)
	      xnop 1
;;								## 7
	c0    brf $b0.0, L213?3   ## bblock 36, line 1990,  t667(I1)
;;								## 8
L210?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 31, line 2002,  raddr(float_raise)(P32),  16(SI32)
;;								## 9
	c0    mov $r0.4 = (~0x0)   ## (~0x0)(I32)
	c0    ldw $l0.0 = 0x50[$r0.1]  ## restore ## t486
	c0    mov $r0.3 = 2147483647   ## 2147483647(I32)
	      xnop 3
;;								## 13
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 32, line 2005,  t487,  ?2.36?2auto_size(I32),  t486
;;								## 14
.trace 11
L213?3:
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    mov $r0.3 = $r0.8   ## t615
;;								## 0
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 37, line 1992,  raddr(packFloat64)(P32),  t615,  2047(SI32),  0(I32),  0(I32)
	c0    mov $r0.4 = 2047   ## 2047(SI32)
;;								## 1
	c0    ldw $l0.0 = 0x50[$r0.1]  ## restore ## t486
	      xnop 3
;;								## 5
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x60), $l0.0   ## bblock 38, line 1992,  t487,  ?2.36?2auto_size(I32),  t486
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.36?2scratch.0, 0x0
.equ _?1PACKET.412, 0x10
.equ _?1PACKET.416, 0x14
.equ _?1PACKET.417, 0x18
.equ _?1PACKET.411, 0x1c
.equ _?1PACKET.414, 0x20
.equ _?1PACKET.415, 0x24
.equ _?1PACKET.418, 0x28
.equ _?1PACKET.440, 0x2c
.equ _?1PACKET.436, 0x30
.equ _?1PACKET.441, 0x34
.equ _?1PACKET.437, 0x38
.equ _?1PACKET.419, 0x3c
.equ _?1PACKET.420, 0x40
.equ _?1PACKET.438, 0x44
.equ _?1PACKET.421, 0x48
.equ _?1PACKET.439, 0x4c
.equ ?2.36?2ras_p, 0x50
.equ ?2.36?2spill_p, 0x54
.section .data
.section .text
.equ ?2.36?2auto_size, 0x60
 ## End _d_mul
 ## Begin _d_div
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-128, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
_d_div::
.trace 5
	c0    add $r0.1 = $r0.1, (-0x80)
	c0    shru $r0.2 = $r0.3, 20   ## bblock 0, line 2250,  t4(I12),  t694,  20(SI32)
	c0    shru $r0.12 = $r0.5, 20   ## bblock 0, line 2254,  t12(I12),  t696,  20(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, 2047   ## bblock 0, line 2250,  t19,  t4(I12),  2047(I32)
	c0    shru $r0.13 = $r0.3, 31   ## bblock 0, line 2251,  t17(I1),  t694,  31(SI32)
	c0    stw 0x74[$r0.1] = $l0.0  ## spill ## t679
;;								## 1
	c0    and $r0.14 = $r0.3, 1048575   ## bblock 0, line 2249,  t2,  t694,  1048575(I32)
	c0    and $r0.12 = $r0.12, 2047   ## bblock 0, line 2254,  t13,  t12(I12),  2047(I32)
;;								## 2
	c0    and $r0.16 = $r0.5, 1048575   ## bblock 0, line 2253,  t10,  t696,  1048575(I32)
	c0    shru $r0.15 = $r0.5, 31   ## bblock 0, line 2255,  t16(I1),  t696,  31(SI32)
	c0    cmpeq $b0.0 = $r0.12, $r0.0   ## [spec] bblock 2, line 2281,  t1041(I1),  t13,  0(SI32)
;;								## 3
	c0    stw 0x18[$r0.1] = $r0.2   ## bblock 0, line 2250, t680, t19
	c0    xor $r0.18 = $r0.13, $r0.15   ## bblock 0, line 2256,  t860,  t17(I1),  t16(I1)
	c0    cmpeq $b0.1 = $r0.2, 2047   ## bblock 0, line 2260,  t1039(I1),  t19,  2047(SI32)
;;								## 4
	c0    cmpeq $b0.2 = $r0.12, 2047   ## [spec] bblock 1, line 2273,  t1040(I1),  t13,  2047(SI32)
	c0    stw 0x78[$r0.1] = $r0.18  ## spill ## t860
;;								## 5
	c0    ldw.d $r0.13 = 0x18[$r0.1]   ## [spec] bblock 3, line 2298, t70, t680
;;								## 6
	c0    ldw.d $r0.15 = 0x18[$r0.1]   ## [spec] bblock 4, line 2303, t83, t680
;;								## 7
	c0    stw 0x24[$r0.1] = $r0.12   ## bblock 0, line 2254, t680, t13
;;								## 8
	c0    cmpeq $b0.3 = $r0.13, $r0.0   ## [spec] bblock 3, line 2298,  t1042(I1),  t70,  0(SI32)
	c0    ldw.d $r0.12 = 0x24[$r0.1]   ## [spec] bblock 4, line 2303, t82, t680
;;								## 9
	c0    stw 0x10[$r0.1] = $r0.4   ## bblock 0, line 2248, t680, t695
	c0    add $r0.15 = $r0.15, 1021   ## [spec] bblock 4, line 2303,  t1043,  t83,  1021(SI32)
;;								## 10
	c0    ldw.d $r0.13 = 0x10[$r0.1]   ## [spec] bblock 4, line 2308, t96, t680
;;								## 11
	c0    stw 0x14[$r0.1] = $r0.14   ## bblock 0, line 2249, t680, t2
	c0    sub $r0.15 = $r0.15, $r0.12   ## [spec] bblock 4, line 2303,  t859,  t1043,  t82
;;								## 12
	c0    ldw.d $r0.12 = 0x14[$r0.1]   ## [spec] bblock 4, line 2307, t87, t680
;;								## 13
	c0    stw 0x20[$r0.1] = $r0.6   ## bblock 0, line 2252, t680, t697
	c0    shl $r0.18 = $r0.13, 11   ## [spec] bblock 4, line 2310,  t136,  t96,  11(SI32)
	c0    shru $r0.17 = $r0.13, 21   ## [spec] bblock 4, line 2312,  t100(I11),  t96,  21(I32)
;;								## 14
	c0    ldw.d $r0.13 = 0x20[$r0.1]   ## [spec] bblock 4, line 2318, t118, t680
	c0    shru $r0.19 = $r0.18, 1   ## [spec] bblock 29, line 2338,  t883(I31),  t136,  1(I32)
;;								## 15
	c0    stw 0x1c[$r0.1] = $r0.16   ## bblock 0, line 2253, t680, t10
	c0    or $r0.12 = $r0.12, 1048576   ## [spec] bblock 4, line 2307,  t101,  t87,  1048576(I32)
	c0    br $b0.1, L214?3   ## bblock 0, line 2260,  t1039(I1)
;;								## 16
	c0    shl $r0.12 = $r0.12, 11   ## [spec] bblock 4, line 2312,  t103,  t101,  11(SI32)
	c0    ldw.d $r0.20 = 0x1c[$r0.1]   ## [spec] bblock 4, line 2317, t109, t680
	c0    br $b0.2, L215?3   ## bblock 1, line 2273,  t1040(I1)
;;								## 17
	c0    or $r0.12 = $r0.12, $r0.17   ## [spec] bblock 4, line 2312,  t133,  t103,  t100(I11)
	c0    shl $r0.22 = $r0.13, 11   ## [spec] bblock 4, line 2320,  t135,  t118,  11(SI32)
	c0    shru $r0.21 = $r0.13, 21   ## [spec] bblock 4, line 2322,  t122(I11),  t118,  21(I32)
	c0    br $b0.0, L216?3   ## bblock 2, line 2281,  t1041(I1)
;;								## 18
L217?3:
	c0    cmpleu $r0.2 = $r0.22, $r0.18   ## [spec] bblock 4, line 2324,  t137,  t135,  t136
	c0    shru $r0.13 = $r0.12, 1   ## [spec] bblock 29, line 2339,  t843(I31),  t133,  1(I32)
	c0    shl $r0.14 = $r0.12, 31   ## [spec] bblock 29, line 2338,  t885,  t133,  31(I32)
	c0    br $b0.3, L218?3   ## bblock 3, line 2298,  t1042(I1)
;;								## 19
L219?3:
	c0    stw 0x14[$r0.1] = $r0.12   ## bblock 4, line 2311, t680, t133
	c0    or $r0.20 = $r0.20, 1048576   ## bblock 4, line 2317,  t123,  t109,  1048576(I32)
	c0    or $r0.19 = $r0.19, $r0.14   ## [spec] bblock 29, line 2338,  t842,  t883(I31),  t885
;;								## 20
	c0    stw 0x10[$r0.1] = $r0.18   ## bblock 4, line 2310, t680, t136
	c0    shl $r0.20 = $r0.20, 11   ## bblock 4, line 2322,  t125,  t123,  11(SI32)
;;								## 21
	c0    stw 0x20[$r0.1] = $r0.22   ## bblock 4, line 2320, t680, t135
	c0    or $r0.20 = $r0.20, $r0.21   ## bblock 4, line 2322,  t132,  t125,  t122(I11)
;;								## 22
	c0    stw 0x1c[$r0.1] = $r0.20   ## bblock 4, line 2321, t680, t132
	c0    cmpltu $r0.16 = $r0.20, $r0.12   ## bblock 4, line 2324,  t131,  t132,  t133
	c0    cmpeq $r0.14 = $r0.20, $r0.12   ## bblock 4, line 2324,  t134,  t132,  t133
;;								## 23
	c0    andl $r0.14 = $r0.14, $r0.2   ## bblock 4, line 2324,  t138,  t134,  t137
	c0    ldw.d $r0.5 = 0x1c[$r0.1]   ## [spec] bblock 5, line 2350, t175, t680
;;								## 24
	c0    orl $b0.0 = $r0.16, $r0.14   ## bblock 4, line 2324,  t1045(I1),  t131,  t138
	      xnop 1
;;								## 26
	c0    brf $b0.0, L220?3   ## bblock 4, line 2324,  t1045(I1)
;;								## 27
	c0    stw 0x10[$r0.1] = $r0.19   ## bblock 29, line 2345, t680, t842
;;								## 28
	c0    add $r0.19 = $r0.15, 1   ## bblock 29, line 2348,  t859,  t859,  1(SI32)
	c0    ldw $r0.4 = 0x10[$r0.1]   ## bblock 5, line 2350, t174, t680
;;								## 29
	c0    stw 0x7c[$r0.1] = $r0.19  ## spill ## t859
;;								## 30
	c0    stw 0x14[$r0.1] = $r0.13   ## bblock 29, line 2346, t680, t843(I31)
;;								## 31
L221?3:
	c0    ldw $r0.3 = 0x14[$r0.1]   ## bblock 5, line 2350, t173, t680
	      xnop 1
;;								## 33
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0    call $l0.0 = estimateDiv64To32   ## bblock 5, line 2350,  raddr(estimateDiv64To32)(P32),  t173,  t174,  t175
;;								## 34
	c0    ldw $r0.2 = 0x20[$r0.1]   ## bblock 6, line 2356, t358, t680
	c0    add $r0.5 = $r0.1, 0x28   ## bblock 6, line 2427,  t389,  t680,  offset(rem0?1.343)=0x28(P32)
	c0    add $r0.8 = $r0.3, (~0x0)   ## bblock 6, line 0,  t1020,  t172,  (~0x0)(I32)
	c0    mov $r0.10 = (~0x0)   ## bblock 6, line 0,  t1021,  (~0x0)(I32)
;;								## 35
	c0    ldw $r0.4 = 0x1c[$r0.1]   ## bblock 6, line 2355, t364, t680
	c0    add $r0.6 = $r0.1, 0x2c   ## bblock 6, line 2428,  t387,  t680,  offset(rem1?1.343)=0x2c(P32)
	c0    add $r0.7 = $r0.1, 0x30   ## bblock 6, line 2429,  t385,  t680,  offset(rem2?1.343)=0x30(P32)
	c0    mov $r0.11 = $r0.0   ## bblock 6, line 0,  t967,  0(I32)
;;								## 36
	c0    mov $r0.9 = $r0.3   ## bblock 6, line 2350,  t936,  t172
	c0    ldw $r0.12 = 0x10[$r0.1]   ## bblock 6, line 2417, t321, t680
	c0    mov $r0.20 = $r0.3   ## t172
;;								## 37
	c0    mpylhu $r0.13 = $r0.3, $r0.2   ## bblock 6, line 2369,  t215,  t172,  t358
	c0    mpylhu $r0.14 = $r0.2, $r0.3   ## bblock 6, line 2368,  t208,  t358,  t172
	c0    ldw $r0.15 = 0x14[$r0.1]   ## bblock 6, line 2416, t325, t680
;;								## 38
	c0    mpyllu $r0.16 = $r0.2, $r0.3   ## bblock 6, line 2367,  t221,  t358,  t172
	c0    mpyhhu $r0.17 = $r0.2, $r0.3   ## bblock 6, line 2370,  t211,  t358,  t172
	c0    ldw $r0.18 = 0x78[$r0.1]  ## restore ## t860
;;								## 39
	c0    stw 0x34[$r0.1] = $r0.3   ## bblock 6, line 2350, t680, t172
	c0    add $r0.14 = $r0.13, $r0.14   ## bblock 6, line 2371,  t219,  t215,  t208
	c0    mpylhu $r0.19 = $r0.4, $r0.3   ## bblock 6, line 2389,  t259,  t364,  t172
	c0    mpylhu $r0.21 = $r0.3, $r0.4   ## bblock 6, line 2390,  t266,  t172,  t364
;;								## 40
	c0    mpyllu $r0.24 = $r0.3, $r0.4   ## bblock 6, line 2388,  t272,  t172,  t364
	c0    shru $r0.23 = $r0.14, 16   ## bblock 6, line 2373,  t213(I16),  t219,  16(SI32)
	c0    cmpltu $r0.13 = $r0.14, $r0.13   ## bblock 6, line 2373,  t216,  t219,  t215
	c0    shl $r0.22 = $r0.14, 16   ## bblock 6, line 2374,  t226,  t219,  16(SI32)
;;								## 41
	c0    shl $r0.13 = $r0.13, 16   ## bblock 6, line 2373,  t217,  t216,  16(SI32)
	c0    add $r0.16 = $r0.16, $r0.22   ## bblock 6, line 2375,  t316,  t221,  t226
	c0    add $r0.23 = $r0.23, $r0.17   ## bblock 6, line 2376,  t1046,  t213(I16),  t211
	c0    add $r0.19 = $r0.19, $r0.21   ## bblock 6, line 2392,  t270,  t259,  t266
;;								## 42
	c0    cmpltu $r0.22 = $r0.16, $r0.22   ## bblock 6, line 2376,  t227,  t316,  t226
	c0    shru $r0.17 = $r0.19, 16   ## bblock 6, line 2394,  t264(I16),  t270,  16(SI32)
	c0    cmpltu $r0.21 = $r0.19, $r0.21   ## bblock 6, line 2394,  t267,  t270,  t266
	c0    shl $r0.14 = $r0.19, 16   ## bblock 6, line 2395,  t277,  t270,  16(SI32)
;;								## 43
	c0    add $r0.13 = $r0.13, $r0.22   ## bblock 6, line 2376,  t1047,  t217,  t227
	c0    shl $r0.21 = $r0.21, 16   ## bblock 6, line 2394,  t268,  t267,  16(SI32)
	c0    add $r0.24 = $r0.24, $r0.14   ## bblock 6, line 2396,  t295,  t272,  t277
	c0    mpyhhu $r0.3 = $r0.3, $r0.4   ## bblock 6, line 2391,  t262,  t172,  t364
;;								## 44
	c0    sub $r0.22 = $r0.0, $r0.16   ## bblock 6, line 2422,  t341,  0(I32),  t316
	c0    add $r0.23 = $r0.23, $r0.13   ## bblock 6, line 2376,  t289,  t1046,  t1047
	c0    cmpltu $r0.14 = $r0.24, $r0.14   ## bblock 6, line 2397,  t278,  t295,  t277
	c0    cmpgtu $r0.19 = $r0.16, $r0.0   ## bblock 6, line 2423,  t336,  t316,  0(SI32)
;;								## 45
	c0    add $r0.23 = $r0.23, $r0.24   ## bblock 6, line 2407,  t322,  t289,  t295
	c0    add $r0.17 = $r0.17, $r0.3   ## bblock 6, line 2397,  t1048,  t264(I16),  t262
	c0    add $r0.21 = $r0.21, $r0.14   ## bblock 6, line 2397,  t1049,  t268,  t278
	c0    stw 0x30[$r0.1] = $r0.22   ## bblock 6, line 2433, t680, t341
;;								## 46
	c0    cmpltu $r0.13 = $r0.23, $r0.24   ## bblock 6, line 2409,  t296,  t322,  t295
	c0    add $r0.17 = $r0.17, $r0.21   ## bblock 6, line 2397,  t298,  t1048,  t1049
	c0    sub $r0.14 = $r0.12, $r0.23   ## bblock 6, line 2424,  t335,  t321,  t322
	c0    cmpltu $r0.22 = $r0.12, $r0.23   ## bblock 6, line 2425,  t339,  t321,  t322
;;								## 47
	c0    add $r0.17 = $r0.17, $r0.13   ## bblock 6, line 2409,  t324,  t298,  t296
	c0    cmpltu $r0.12 = $r0.14, $r0.19   ## bblock 6, line 2430,  t333,  t335,  t336
	c0    sub $r0.21 = $r0.14, $r0.19   ## bblock 6, line 2431,  t343,  t335,  t336
	c0    sub $r0.15 = $r0.15, $r0.22   ## bblock 6, line 2432,  t1050,  t325,  t339
;;								## 48
	c0    stw 0x4c[$r0.1] = $r0.17   ## bblock 6, line 2413, t680, t324
	c0    add $r0.12 = $r0.17, $r0.12   ## bblock 6, line 2432,  t1051,  t324,  t333
	c0    mov $r0.3 = $r0.2   ## t358
;;								## 49
	c0    stw 0x50[$r0.1] = $r0.17   ## bblock 6, line 2409, t680, t324
	c0    sub $r0.15 = $r0.15, $r0.12   ## bblock 6, line 2432,  t345,  t1050,  t1051
;;								## 50
	c0    ldw $r0.17 = 0x74[$r0.1]  ## restore ## t679
;;								## 51
	c0    ldw $r0.19 = 0x7c[$r0.1]  ## restore ## t859
;;								## 52
	c0    stw 0x28[$r0.1] = $r0.15   ## bblock 6, line 2435, t680, t345
;;								## 53
	c0    stw 0x2c[$r0.1] = $r0.21   ## bblock 6, line 2434, t680, t343
;;								## 54
	c0    stw 0x40[$r0.1] = $r0.23   ## bblock 6, line 2408, t680, t322
;;								## 55
	c0    stw 0x44[$r0.1] = $r0.23   ## bblock 6, line 2412, t680, t322
;;								## 56
	c0    stw 0x38[$r0.1] = $r0.16   ## bblock 6, line 2377, t680, t316
;;								## 57
	c0    stw 0x3c[$r0.1] = $r0.16   ## bblock 6, line 2411, t680, t316
;;								## 58
	c0    stw 0x48[$r0.1] = $r0.24   ## bblock 6, line 2398, t680, t295
;;								## 59
.trace 1
L222?3:
	c0    ldw.d $r0.2 = 0x30[$r0.1]   ## [spec] bblock 27, line 2445, t959, t680
;;								## 0
	c0    ldw.d $r0.12 = 0x2c[$r0.1]   ## [spec] bblock 27, line 2444, t960, t680
;;								## 1
	c0    ldw $r0.13 = 0x28[$r0.1]   ## bblock 7, line 2437, t948, t680
;;								## 2
	c0    add $r0.14 = $r0.2, $r0.3   ## [spec] bblock 27, line 2449,  t956,  t959,  t358
;;								## 3
	c0    add $r0.15 = $r0.12, $r0.4   ## [spec] bblock 27, line 2451,  t958,  t960,  t364
	c0    cmpltu $r0.2 = $r0.14, $r0.2   ## [spec] bblock 27, line 2450,  t955,  t956,  t959
;;								## 4
	c0    cmplt $b0.0 = $r0.13, $r0.0   ## bblock 7, line 2437,  t1052(I1),  t948,  0(SI32)
	c0    cmpltu $r0.15 = $r0.15, $r0.12   ## [spec] bblock 27, line 2452,  t957,  t958,  t960
	c0    add $r0.16 = $r0.15, $r0.2   ## [spec] bblock 27, line 2454,  t954,  t958,  t955
;;								## 5
	c0    cmpltu $r0.2 = $r0.16, $r0.2   ## [spec] bblock 27, line 2455,  t953,  t954,  t955
;;								## 6
	c0    add $r0.13 = $r0.13, $r0.2   ## [spec] bblock 27, line 2456,  t1069,  t948,  t953
	c0    brf $b0.0, L223?3   ## bblock 7, line 2437,  t1052(I1)
;;								## 7
	c0    add $r0.13 = $r0.13, $r0.15   ## bblock 27, line 2456,  t951,  t1069,  t957
	c0    stw 0[$r0.6] = $r0.16   ## bblock 27, line 2458, t387, t954
	c0    add $r0.9 = $r0.9, -2   ## [spec] bblock 19, line 2438-2,  t936,  t936,  -2(SI32)
;;								## 8
	c0    ldw.d $r0.2 = 0x2c[$r0.1]   ## [spec] bblock 33, line 2444-1, t368, t680
;;								## 9
	c0    stw 0[$r0.5] = $r0.13   ## bblock 27, line 2459, t389, t951
;;								## 10
	c0    ldw $r0.12 = 0x28[$r0.1]   ## bblock 27, line 2437-1, t347, t680
;;								## 11
	c0    stw 0[$r0.7] = $r0.14   ## bblock 27, line 2457, t385, t956
	c0    add $r0.13 = $r0.4, $r0.2   ## [spec] bblock 33, line 2451-1,  t373,  t364,  t368
;;								## 12
	c0    ldw.d $r0.14 = 0x30[$r0.1]   ## [spec] bblock 33, line 2445-1, t362, t680
	c0    cmpltu $r0.2 = $r0.13, $r0.2   ## [spec] bblock 33, line 2452-1,  t382,  t373,  t368
;;								## 13
	c0    cmplt $b0.0 = $r0.12, $r0.0   ## bblock 27, line 2437-1,  t1070(I1),  t347,  0(SI32)
	      xnop 1
;;								## 15
	c0    add $r0.15 = $r0.3, $r0.14   ## [spec] bblock 33, line 2449-1,  t384,  t358,  t362
	c0    brf $b0.0, L224?3   ## bblock 27, line 2437-1,  t1070(I1)
;;								## 16
	c0    cmpltu $r0.14 = $r0.15, $r0.14   ## bblock 33, line 2450-1,  t378,  t384,  t362
	c0    stw 0[$r0.7] = $r0.15   ## bblock 33, line 2457-1, t385, t384
	c0    add $r0.11 = $r0.11, -2   ## [spec] bblock 30, line 2438-3,  t967,  t967,  -2(SI32)
;;								## 17
	c0    add $r0.13 = $r0.13, $r0.14   ## bblock 33, line 2454-1,  t386,  t373,  t378
	c0    ldw.d $r0.15 = 0x30[$r0.1]   ## [spec] bblock 19, line 2445-2, t938, t680
;;								## 18
	c0    cmpltu $r0.14 = $r0.13, $r0.14   ## bblock 33, line 2455-1,  t944,  t386,  t378
	c0    stw 0[$r0.6] = $r0.13   ## bblock 33, line 2458-1, t387, t386
;;								## 19
	c0    add $r0.12 = $r0.12, $r0.14   ## bblock 33, line 2456-1,  t1072,  t347,  t944
	c0    ldw.d $r0.13 = 0x2c[$r0.1]   ## [spec] bblock 19, line 2444-2, t940, t680
;;								## 20
	c0    add $r0.12 = $r0.12, $r0.2   ## bblock 33, line 2456-1,  t942,  t1072,  t382
	c0    add $r0.2 = $r0.3, $r0.15   ## [spec] bblock 19, line 2449-2,  t980,  t358,  t938
;;								## 21
	c0    stw 0[$r0.5] = $r0.12   ## bblock 33, line 2459-1, t389, t942
	c0    cmpltu $r0.15 = $r0.2, $r0.15   ## [spec] bblock 19, line 2450-2,  t977,  t980,  t938
;;								## 22
	c0    ldw $r0.12 = 0x28[$r0.1]   ## bblock 33, line 2437-2, t941, t680
	c0    add $r0.14 = $r0.4, $r0.13   ## [spec] bblock 19, line 2451-2,  t996,  t364,  t940
;;								## 23
	c0    cmpltu $r0.14 = $r0.14, $r0.13   ## [spec] bblock 19, line 2452-2,  t973,  t996,  t940
	c0    add $r0.16 = $r0.14, $r0.15   ## [spec] bblock 19, line 2454-2,  t937,  t996,  t977
;;								## 24
	c0    cmpltu $r0.15 = $r0.16, $r0.15   ## [spec] bblock 19, line 2455-2,  t379,  t937,  t977
;;								## 25
	c0    cmplt $b0.0 = $r0.12, $r0.0   ## bblock 33, line 2437-2,  t1073(I1),  t941,  0(SI32)
	c0    add $r0.12 = $r0.12, $r0.15   ## [spec] bblock 19, line 2456-2,  t1056,  t941,  t379
;;								## 26
	c0    add $r0.12 = $r0.12, $r0.14   ## [spec] bblock 19, line 2456-2,  t388,  t1056,  t973
;;								## 27
	c0    brf $b0.0, L225?3   ## bblock 33, line 2437-2,  t1073(I1)
;;								## 28
	c0    stw 0[$r0.7] = $r0.2   ## bblock 19, line 2457-2, t385, t980
	c0    add $r0.8 = $r0.8, (~0x1)   ## bblock 19, line 0,  t1020,  t1020,  (~0x1)(I32)
;;								## 29
	c0    ldw.d $r0.2 = 0x30[$r0.1]   ## [spec] bblock 30, line 2445-3, t1000, t680
;;								## 30
	c0    stw 0[$r0.6] = $r0.16   ## bblock 19, line 2458-2, t387, t937
;;								## 31
	c0    ldw.d $r0.13 = 0x2c[$r0.1]   ## [spec] bblock 30, line 2444-3, t950, t680
;;								## 32
	c0    stw 0[$r0.5] = $r0.12   ## bblock 19, line 2459-2, t389, t388
	c0    add $r0.14 = $r0.3, $r0.2   ## [spec] bblock 30, line 2449-3,  t946,  t358,  t1000
;;								## 33
	c0    ldw $r0.12 = 0x28[$r0.1]   ## bblock 19, line 2437-3, t961, t680
	c0    cmpltu $r0.2 = $r0.14, $r0.2   ## [spec] bblock 30, line 2450-3,  t994,  t946,  t1000
;;								## 34
	c0    add $r0.15 = $r0.4, $r0.13   ## [spec] bblock 30, line 2451-3,  t945,  t364,  t950
;;								## 35
	c0    cmpltu $r0.15 = $r0.15, $r0.13   ## [spec] bblock 30, line 2452-3,  t947,  t945,  t950
	c0    add $r0.16 = $r0.15, $r0.2   ## [spec] bblock 30, line 2454-3,  t993,  t945,  t994
;;								## 36
	c0    cmplt $b0.0 = $r0.12, $r0.0   ## bblock 19, line 2437-3,  t1057(I1),  t961,  0(SI32)
	c0    cmpltu $r0.2 = $r0.16, $r0.2   ## [spec] bblock 30, line 2455-3,  t984,  t993,  t994
;;								## 37
	c0    add $r0.12 = $r0.12, $r0.2   ## [spec] bblock 30, line 2456-3,  t1071,  t961,  t984
;;								## 38
	c0    add $r0.12 = $r0.12, $r0.15   ## [spec] bblock 30, line 2456-3,  t979,  t1071,  t947
	c0    brf $b0.0, L226?3   ## bblock 19, line 2437-3,  t1057(I1)
;;								## 39
	c0    stw 0[$r0.7] = $r0.14   ## bblock 30, line 2457-3, t385, t946
	c0    add $r0.10 = $r0.10, (~0x1)   ## bblock 30, line 0,  t1021,  t1021,  (~0x1)(I32)
;;								## 40
	c0    stw 0[$r0.6] = $r0.16   ## bblock 30, line 2458-3, t387, t993
;;								## 41
	c0    stw 0[$r0.5] = $r0.12   ## bblock 30, line 2459-3, t389, t979
	c0    goto L222?3 ## goto
;;								## 42
.trace 12
L226?3:
	c0    mov $r0.11 = $r0.10   ## bblock 32, line 0,  t934,  t1021
	   ## bblock 32, line 0,  t919,  t936## $r0.9(skipped)
	c0    stw 0x78[$r0.1] = $r0.18  ## spill ## t860
	c0    goto L227?3 ## goto
;;								## 0
.trace 3
L228?3:
	c0    ldw.d $r0.2 = 0x6c[$r0.1]   ## [spec] bblock 26, line 2560, t582, t680
;;								## 0
	c0    ldw.d $r0.12 = 0x30[$r0.1]   ## [spec] bblock 26, line 2559, t588, t680
;;								## 1
	c0    ldw $r0.13 = 0x2c[$r0.1]   ## bblock 24, line 2552, t567, t680
;;								## 2
	c0    add $r0.14 = $r0.2, $r0.3   ## [spec] bblock 26, line 2564,  t604,  t582,  t578
;;								## 3
	c0    add $r0.15 = $r0.12, $r0.4   ## [spec] bblock 26, line 2566,  t593,  t588,  t584
	c0    cmpltu $r0.2 = $r0.14, $r0.2   ## [spec] bblock 26, line 2565,  t598,  t604,  t582
;;								## 4
	c0    cmplt $b0.0 = $r0.13, $r0.0   ## bblock 24, line 2552,  t1065(I1),  t567,  0(SI32)
	c0    cmpltu $r0.15 = $r0.15, $r0.12   ## [spec] bblock 26, line 2567,  t602,  t593,  t588
	c0    add $r0.16 = $r0.15, $r0.2   ## [spec] bblock 26, line 2569,  t606,  t593,  t598
;;								## 5
	c0    cmpltu $r0.2 = $r0.16, $r0.2   ## [spec] bblock 26, line 2570,  t599,  t606,  t598
;;								## 6
	c0    add $r0.13 = $r0.13, $r0.2   ## [spec] bblock 26, line 2571,  t1067,  t567,  t599
	c0    brf $b0.0, L229?3   ## bblock 24, line 2552,  t1065(I1)
;;								## 7
	c0    add $r0.13 = $r0.13, $r0.15   ## bblock 26, line 2571,  t968,  t1067,  t602
	c0    stw 0[$r0.6] = $r0.16   ## bblock 26, line 2573, t607, t606
	c0    add $r0.9 = $r0.9, -2   ## [spec] bblock 62, line 2553-2,  t962,  t962,  -2(SI32)
;;								## 8
	c0    ldw.d $r0.2 = 0x30[$r0.1]   ## [spec] bblock 65, line 2559-1, t995, t680
;;								## 9
	c0    stw 0[$r0.5] = $r0.13   ## bblock 26, line 2574, t609, t968
;;								## 10
	c0    ldw $r0.12 = 0x2c[$r0.1]   ## bblock 26, line 2552-1, t1011, t680
;;								## 11
	c0    stw 0[$r0.7] = $r0.14   ## bblock 26, line 2572, t605, t604
	c0    add $r0.13 = $r0.4, $r0.2   ## [spec] bblock 65, line 2566-1,  t976,  t584,  t995
;;								## 12
	c0    ldw.d $r0.14 = 0x6c[$r0.1]   ## [spec] bblock 65, line 2560-1, t982, t680
	c0    cmpltu $r0.2 = $r0.13, $r0.2   ## [spec] bblock 65, line 2567-1,  t975,  t976,  t995
;;								## 13
	c0    cmplt $b0.0 = $r0.12, $r0.0   ## bblock 26, line 2552-1,  t1068(I1),  t1011,  0(SI32)
	      xnop 1
;;								## 15
	c0    add $r0.15 = $r0.3, $r0.14   ## [spec] bblock 65, line 2564-1,  t974,  t578,  t982
	c0    brf $b0.0, L230?3   ## bblock 26, line 2552-1,  t1068(I1)
;;								## 16
	c0    cmpltu $r0.14 = $r0.15, $r0.14   ## bblock 65, line 2565-1,  t972,  t974,  t982
	c0    stw 0[$r0.7] = $r0.15   ## bblock 65, line 2572-1, t605, t974
	c0    add $r0.11 = $r0.11, -2   ## [spec] bblock 12, line 2553-3,  t935,  t935,  -2(SI32)
;;								## 17
	c0    add $r0.13 = $r0.13, $r0.14   ## bblock 65, line 2569-1,  t971,  t976,  t972
	c0    ldw.d $r0.15 = 0x6c[$r0.1]   ## [spec] bblock 62, line 2560-2, t991, t680
;;								## 18
	c0    cmpltu $r0.14 = $r0.13, $r0.14   ## bblock 65, line 2570-1,  t969,  t971,  t972
	c0    stw 0[$r0.6] = $r0.13   ## bblock 65, line 2573-1, t607, t971
;;								## 19
	c0    add $r0.12 = $r0.12, $r0.14   ## bblock 65, line 2571-1,  t1087,  t1011,  t969
	c0    ldw.d $r0.13 = 0x30[$r0.1]   ## [spec] bblock 62, line 2559-2, t992, t680
;;								## 20
	c0    add $r0.12 = $r0.12, $r0.2   ## bblock 65, line 2571-1,  t608,  t1087,  t975
	c0    add $r0.2 = $r0.3, $r0.15   ## [spec] bblock 62, line 2564-2,  t988,  t578,  t991
;;								## 21
	c0    stw 0[$r0.5] = $r0.12   ## bblock 65, line 2574-1, t609, t608
	c0    cmpltu $r0.15 = $r0.2, $r0.15   ## [spec] bblock 62, line 2565-2,  t997,  t988,  t991
;;								## 22
	c0    ldw $r0.12 = 0x2c[$r0.1]   ## bblock 65, line 2552-2, t1009, t680
	c0    add $r0.14 = $r0.4, $r0.13   ## [spec] bblock 62, line 2566-2,  t990,  t584,  t992
;;								## 23
	c0    cmpltu $r0.14 = $r0.14, $r0.13   ## [spec] bblock 62, line 2567-2,  t989,  t990,  t992
	c0    add $r0.16 = $r0.14, $r0.15   ## [spec] bblock 62, line 2569-2,  t987,  t990,  t997
;;								## 24
	c0    cmpltu $r0.15 = $r0.16, $r0.15   ## [spec] bblock 62, line 2570-2,  t986,  t987,  t997
;;								## 25
	c0    cmplt $b0.0 = $r0.12, $r0.0   ## bblock 65, line 2552-2,  t1088(I1),  t1009,  0(SI32)
	c0    add $r0.12 = $r0.12, $r0.15   ## [spec] bblock 62, line 2571-2,  t1085,  t1009,  t986
;;								## 26
	c0    add $r0.12 = $r0.12, $r0.14   ## [spec] bblock 62, line 2571-2,  t983,  t1085,  t989
;;								## 27
	c0    brf $b0.0, L231?3   ## bblock 65, line 2552-2,  t1088(I1)
;;								## 28
	c0    stw 0[$r0.7] = $r0.2   ## bblock 62, line 2572-2, t605, t988
	c0    add $r0.8 = $r0.8, (~0x1)   ## bblock 62, line 0,  t1013,  t1013,  (~0x1)(I32)
;;								## 29
	c0    ldw.d $r0.2 = 0x6c[$r0.1]   ## [spec] bblock 12, line 2560-3, t1005, t680
;;								## 30
	c0    stw 0[$r0.6] = $r0.16   ## bblock 62, line 2573-2, t607, t987
;;								## 31
	c0    ldw.d $r0.13 = 0x30[$r0.1]   ## [spec] bblock 12, line 2559-3, t1006, t680
;;								## 32
	c0    stw 0[$r0.5] = $r0.12   ## bblock 62, line 2574-2, t609, t983
	c0    add $r0.14 = $r0.3, $r0.2   ## [spec] bblock 12, line 2564-3,  t1003,  t578,  t1005
;;								## 33
	c0    ldw $r0.12 = 0x2c[$r0.1]   ## bblock 62, line 2552-3, t1007, t680
	c0    cmpltu $r0.2 = $r0.14, $r0.2   ## [spec] bblock 12, line 2565-3,  t1002,  t1003,  t1005
;;								## 34
	c0    add $r0.15 = $r0.4, $r0.13   ## [spec] bblock 12, line 2566-3,  t1004,  t584,  t1006
;;								## 35
	c0    cmpltu $r0.15 = $r0.15, $r0.13   ## [spec] bblock 12, line 2567-3,  t1010,  t1004,  t1006
	c0    add $r0.16 = $r0.15, $r0.2   ## [spec] bblock 12, line 2569-3,  t1001,  t1004,  t1002
;;								## 36
	c0    cmplt $b0.0 = $r0.12, $r0.0   ## bblock 62, line 2552-3,  t1086(I1),  t1007,  0(SI32)
	c0    cmpltu $r0.2 = $r0.16, $r0.2   ## [spec] bblock 12, line 2570-3,  t981,  t1001,  t1002
;;								## 37
	c0    add $r0.12 = $r0.12, $r0.2   ## [spec] bblock 12, line 2571-3,  t1054,  t1007,  t981
;;								## 38
	c0    add $r0.12 = $r0.12, $r0.15   ## [spec] bblock 12, line 2571-3,  t998,  t1054,  t1010
	c0    brf $b0.0, L232?3   ## bblock 62, line 2552-3,  t1086(I1)
;;								## 39
	c0    stw 0[$r0.7] = $r0.14   ## bblock 12, line 2572-3, t605, t1003
	c0    add $r0.10 = $r0.10, (~0x1)   ## bblock 12, line 0,  t1012,  t1012,  (~0x1)(I32)
;;								## 40
	c0    stw 0[$r0.6] = $r0.16   ## bblock 12, line 2573-3, t607, t1001
;;								## 41
	c0    stw 0[$r0.5] = $r0.12   ## bblock 12, line 2574-3, t609, t998
	c0    goto L228?3 ## goto
;;								## 42
.trace 15
L232?3:
	c0    mov $r0.11 = $r0.10   ## bblock 60, line 0,  t963,  t1012
	   ## bblock 60, line 0,  t965,  t962## $r0.9(skipped)
	c0    stw 0x7c[$r0.1] = $r0.19  ## spill ## t859
	c0    goto L233?3 ## goto
;;								## 0
.trace 7
L234?3:
	c0    ldw $r0.2 = 0x34[$r0.1]   ## bblock 10, line 2580, t708, t680
	c0    mov $r0.3 = $r0.18   ## t860
;;								## 0
	c0    ldw $r0.8 = 0x54[$r0.1]   ## bblock 10, line 2581, t897, t680
;;								## 1
	c0    ldw $r0.4 = 0x7c[$r0.1]  ## restore ## t859
;;								## 2
	c0    shl $r0.9 = $r0.2, 21   ## bblock 10, line 2597,  t905,  t708,  21(I32)
	c0    shru $r0.5 = $r0.2, 11   ## bblock 10, line 2598,  t676,  t708,  11(SI32)
;;								## 3
	c0    shl $r0.7 = $r0.8, 21   ## bblock 10, line 2596,  t678,  t897,  21(I32)
	c0    shru $r0.2 = $r0.8, 11   ## bblock 10, line 2597,  t893(I21),  t897,  11(SI32)
	c0    stw 0x34[$r0.1] = $r0.5   ## bblock 10, line 2622, t680, t676
;;								## 4
	c0    stw 0x70[$r0.1] = $r0.7   ## bblock 10, line 2620, t680, t678
	c0    or $r0.6 = $r0.9, $r0.2   ## bblock 10, line 2597,  t677,  t905,  t893(I21)
;;								## 5
.call roundAndPackFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0    stw 0x54[$r0.1] = $r0.6   ## bblock 10, line 2621, t680, t677
	c0    call $l0.0 = roundAndPackFloat64   ## bblock 10, line 2624,  raddr(roundAndPackFloat64)(P32),  t860,  t859,  t676,  t677,  t678
;;								## 6
	c0    ldw $l0.0 = 0x74[$r0.1]  ## restore ## t679
	      xnop 3
;;								## 10
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x80), $l0.0   ## bblock 18, line 2624,  t680,  ?2.37?2auto_size(I32),  t679
;;								## 11
.trace 17
L236?3:
	      xnop 1
;;								## 1
	c0    ldw.d $r0.4 = 0x30[$r0.1]   ## [spec] bblock 25, line 2577, t612, t680
;;								## 2
	c0    goto L235?3 ## goto
;;								## 3
.trace 14
L231?3:
	c0    mov $r0.11 = $r0.10   ## bblock 63, line 0,  t963,  t1012
	c0    mov $r0.9 = $r0.8   ## bblock 63, line 0,  t965,  t1013
	c0    stw 0x7c[$r0.1] = $r0.19  ## spill ## t859
	c0    goto L233?3 ## goto
;;								## 0
.trace 13
L230?3:
	   ## bblock 66, line 0,  t963,  t935## $r0.11(skipped)
	c0    mov $r0.9 = $r0.8   ## bblock 66, line 0,  t965,  t1013
	c0    stw 0x7c[$r0.1] = $r0.19  ## spill ## t859
	c0    goto L233?3 ## goto
;;								## 0
.trace 9
L229?3:
	   ## bblock 67, line 0,  t963,  t935## $r0.11(skipped)
	   ## bblock 67, line 0,  t965,  t962## $r0.9(skipped)
	c0    stw 0x7c[$r0.1] = $r0.19  ## spill ## t859
;;								## 0
L233?3:
	c0    add $r0.9 = $r0.9, $r0.11   ## bblock 21, line 0,  t921,  t965,  t963
	c0    stw 0x74[$r0.1] = $r0.17  ## spill ## t679
;;								## 1
	c0    cmpne $b0.0 = $r0.9, $r0.20   ## bblock 21, line 0,  t1058(I1),  t921,  t390
	c0    ldw.d $r0.2 = 0x6c[$r0.1]   ## [spec] bblock 25, line 2577, t611, t680
;;								## 2
	c0    ldw.d $r0.3 = 0x2c[$r0.1]   ## [spec] bblock 25, line 2577, t613, t680
;;								## 3
	c0    ldw.d $r0.4 = 0x30[$r0.1]   ## [spec] bblock 25, line 2577, t612, t680
	c0    brf $b0.0, L236?3   ## bblock 21, line 0,  t1058(I1)
;;								## 4
	c0    stw 0x54[$r0.1] = $r0.9   ## bblock 31, line 0, t680, t921
;;								## 5
L235?3:
	c0    ldw $r0.5 = 0x54[$r0.1]   ## bblock 25, line 2577, t610, t680
	c0    or $r0.2 = $r0.2, $r0.3   ## bblock 25, line 2577,  t1066,  t611,  t613
;;								## 6
	c0    or $r0.2 = $r0.2, $r0.4   ## bblock 25, line 2577,  t614,  t1066,  t612
;;								## 7
	c0    cmpne $r0.2 = $r0.2, $r0.0   ## bblock 25, line 2577,  t615,  t614,  0(I32)
;;								## 8
	c0    or $r0.5 = $r0.5, $r0.2   ## bblock 25, line 2577,  t616,  t610,  t615
;;								## 9
	c0    stw 0x54[$r0.1] = $r0.5   ## bblock 25, line 2577, t680, t616
	c0    goto L234?3 ## goto
;;								## 10
.trace 16
L238?3:
	c0    ldw $r0.5 = 0x1c[$r0.1]   ## bblock 8, line 2462, t393, t680
;;								## 0
	c0    goto L237?3 ## goto
;;								## 1
.trace 11
L225?3:
	c0    mov $r0.11 = $r0.10   ## bblock 17, line 0,  t934,  t1021
	c0    mov $r0.9 = $r0.8   ## bblock 17, line 0,  t919,  t1020
	c0    stw 0x78[$r0.1] = $r0.18  ## spill ## t860
	c0    goto L227?3 ## goto
;;								## 0
.trace 10
L224?3:
	   ## bblock 22, line 0,  t934,  t967## $r0.11(skipped)
	c0    mov $r0.9 = $r0.8   ## bblock 22, line 0,  t919,  t1020
	c0    stw 0x78[$r0.1] = $r0.18  ## spill ## t860
	c0    goto L227?3 ## goto
;;								## 0
.trace 6
L223?3:
	   ## bblock 20, line 0,  t934,  t967## $r0.11(skipped)
	   ## bblock 20, line 0,  t919,  t936## $r0.9(skipped)
	c0    stw 0x78[$r0.1] = $r0.18  ## spill ## t860
;;								## 0
L227?3:
	c0    add $r0.9 = $r0.9, $r0.11   ## bblock 16, line 0,  t1008,  t919,  t934
	c0    stw 0x7c[$r0.1] = $r0.19  ## spill ## t859
;;								## 1
	c0    cmpne $b0.0 = $r0.9, $r0.20   ## bblock 16, line 0,  t1055(I1),  t1008,  t172
	c0    stw 0x74[$r0.1] = $r0.17  ## spill ## t679
;;								## 2
	c0    ldw.d $r0.3 = 0x2c[$r0.1]   ## [spec] bblock 8, line 2462, t391, t680
;;								## 3
	c0    ldw.d $r0.4 = 0x30[$r0.1]   ## [spec] bblock 8, line 2462, t392, t680
	c0    brf $b0.0, L238?3   ## bblock 16, line 0,  t1055(I1)
;;								## 4
	c0    ldw $r0.5 = 0x1c[$r0.1]   ## bblock 8, line 2462, t393, t680
;;								## 5
	c0    stw 0x34[$r0.1] = $r0.9   ## bblock 13, line 0, t680, t1008
;;								## 6
L237?3:
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0    call $l0.0 = estimateDiv64To32   ## bblock 8, line 2462,  raddr(estimateDiv64To32)(P32),  t391,  t392,  t393
;;								## 7
	c0    and $r0.12 = $r0.3, 1023   ## bblock 9, line 2463,  t395,  t390,  1023(I32)
	c0    ldw.d $r0.2 = 0x20[$r0.1]   ## [spec] bblock 23, line 2469, t578, t680
	c0    mov $r0.10 = (~0x0)   ## [spec] bblock 23, line 0,  t1012,  (~0x0)(I32)
;;								## 8
	c0    cmpleu $b0.0 = $r0.12, 4   ## bblock 9, line 2463,  t1053(I1),  t395,  4(SI32)
	c0    ldw.d $r0.4 = 0x1c[$r0.1]   ## [spec] bblock 23, line 2468, t584, t680
	c0    add $r0.5 = $r0.1, 0x2c   ## [spec] bblock 23, line 2542,  t609,  t680,  offset(rem1?1.343)=0x2c(P32)
	c0    add $r0.8 = $r0.3, (~0x0)   ## [spec] bblock 23, line 0,  t1013,  t390,  (~0x0)(I32)
;;								## 9
	c0    mov $r0.9 = $r0.3   ## [spec] bblock 23, line 2462,  t962,  t390
	c0    ldw.d $r0.13 = 0x30[$r0.1]   ## [spec] bblock 23, line 2532, t541, t680
	c0    add $r0.6 = $r0.1, 0x30   ## [spec] bblock 23, line 2543,  t607,  t680,  offset(rem2?1.343)=0x30(P32)
	c0    add $r0.7 = $r0.1, 0x6c   ## [spec] bblock 23, line 2544,  t605,  t680,  offset(rem3?1.343)=0x6c(P32)
;;								## 10
	c0    mpylhu $r0.12 = $r0.3, $r0.2   ## [spec] bblock 23, line 2482,  t435,  t390,  t578
	c0    mpylhu $r0.14 = $r0.2, $r0.3   ## [spec] bblock 23, line 2481,  t428,  t578,  t390
	c0    ldw.d $r0.16 = 0x2c[$r0.1]   ## [spec] bblock 23, line 2531, t545, t680
	c0    mov $r0.11 = $r0.0   ## [spec] bblock 23, line 0,  t935,  0(I32)
;;								## 11
	c0    mpyllu $r0.19 = $r0.2, $r0.3   ## [spec] bblock 23, line 2480,  t441,  t578,  t390
	c0    mpyhhu $r0.20 = $r0.2, $r0.3   ## [spec] bblock 23, line 2483,  t431,  t578,  t390
	c0    ldw $r0.18 = 0x78[$r0.1]  ## restore ## t860
;;								## 12
	c0    add $r0.14 = $r0.12, $r0.14   ## [spec] bblock 23, line 2484,  t439,  t435,  t428
	c0    mpylhu $r0.21 = $r0.4, $r0.3   ## [spec] bblock 23, line 2503,  t479,  t584,  t390
	c0    mpylhu $r0.22 = $r0.3, $r0.4   ## [spec] bblock 23, line 2504,  t486,  t390,  t584
	c0    ldw $r0.17 = 0x74[$r0.1]  ## restore ## t679
;;								## 13
	c0    mpyllu $r0.25 = $r0.4, $r0.3   ## [spec] bblock 23, line 2502,  t492,  t584,  t390
	c0    shru $r0.24 = $r0.14, 16   ## [spec] bblock 23, line 2487,  t433(I16),  t439,  16(SI32)
	c0    cmpltu $r0.12 = $r0.14, $r0.12   ## [spec] bblock 23, line 2486,  t436,  t439,  t435
	c0    shl $r0.23 = $r0.14, 16   ## [spec] bblock 23, line 2488,  t446,  t439,  16(SI32)
;;								## 14
	c0    shl $r0.12 = $r0.12, 16   ## [spec] bblock 23, line 2486,  t437,  t436,  16(SI32)
	c0    add $r0.19 = $r0.19, $r0.23   ## [spec] bblock 23, line 2489,  t536,  t441,  t446
	c0    add $r0.24 = $r0.24, $r0.20   ## [spec] bblock 23, line 2490,  t1059,  t433(I16),  t431
	c0    add $r0.21 = $r0.21, $r0.22   ## [spec] bblock 23, line 2506,  t490,  t479,  t486
;;								## 15
	c0    cmpltu $r0.23 = $r0.19, $r0.23   ## [spec] bblock 23, line 2490,  t447,  t536,  t446
	c0    shru $r0.20 = $r0.21, 16   ## [spec] bblock 23, line 2509,  t484(I16),  t490,  16(SI32)
	c0    cmpltu $r0.22 = $r0.21, $r0.22   ## [spec] bblock 23, line 2508,  t487,  t490,  t486
	c0    shl $r0.14 = $r0.21, 16   ## [spec] bblock 23, line 2510,  t497,  t490,  16(SI32)
;;								## 16
	c0    add $r0.12 = $r0.12, $r0.23   ## [spec] bblock 23, line 2490,  t1060,  t437,  t447
	c0    shl $r0.22 = $r0.22, 16   ## [spec] bblock 23, line 2508,  t488,  t487,  16(SI32)
	c0    add $r0.25 = $r0.25, $r0.14   ## [spec] bblock 23, line 2511,  t515,  t492,  t497
	c0    mpyhhu $r0.21 = $r0.3, $r0.4   ## [spec] bblock 23, line 2505,  t482,  t390,  t584
;;								## 17
	c0    sub $r0.26 = $r0.0, $r0.19   ## [spec] bblock 23, line 2537,  t561,  0(I32),  t536
	c0    add $r0.24 = $r0.24, $r0.12   ## [spec] bblock 23, line 2490,  t509,  t1059,  t1060
	c0    cmpltu $r0.14 = $r0.25, $r0.14   ## [spec] bblock 23, line 2512,  t498,  t515,  t497
	c0    cmpgtu $r0.23 = $r0.19, $r0.0   ## [spec] bblock 23, line 2538,  t556,  t536,  0(SI32)
;;								## 18
	c0    stw 0x54[$r0.1] = $r0.3   ## bblock 9, line 2462, t680, t390
	c0    add $r0.24 = $r0.24, $r0.25   ## [spec] bblock 23, line 2522,  t542,  t509,  t515
	c0    add $r0.20 = $r0.20, $r0.21   ## [spec] bblock 23, line 2512,  t1061,  t484(I16),  t482
	c0    add $r0.22 = $r0.22, $r0.14   ## [spec] bblock 23, line 2512,  t1062,  t488,  t498
;;								## 19
	c0    cmpltu $r0.12 = $r0.24, $r0.25   ## [spec] bblock 23, line 2524,  t516,  t542,  t515
	c0    add $r0.20 = $r0.20, $r0.22   ## [spec] bblock 23, line 2512,  t518,  t1061,  t1062
	c0    sub $r0.14 = $r0.13, $r0.24   ## [spec] bblock 23, line 2539,  t555,  t541,  t542
	c0    cmpltu $r0.21 = $r0.13, $r0.24   ## [spec] bblock 23, line 2540,  t559,  t541,  t542
;;								## 20
	c0    add $r0.20 = $r0.20, $r0.12   ## [spec] bblock 23, line 2524,  t544,  t518,  t516
	c0    cmpltu $r0.13 = $r0.14, $r0.23   ## [spec] bblock 23, line 2545,  t553,  t555,  t556
	c0    sub $r0.16 = $r0.16, $r0.21   ## [spec] bblock 23, line 2547,  t1063,  t545,  t559
	c0    brf $b0.0, L234?3   ## bblock 9, line 2463,  t1053(I1)
;;								## 21
	c0    stw 0x58[$r0.1] = $r0.19   ## bblock 23, line 2491, t680, t536
	c0    sub $r0.14 = $r0.14, $r0.23   ## bblock 23, line 2546,  t563,  t555,  t556
	c0    add $r0.13 = $r0.20, $r0.13   ## bblock 23, line 2547,  t1064,  t544,  t553
;;								## 22
	c0    stw 0x44[$r0.1] = $r0.20   ## bblock 23, line 2528, t680, t544
	c0    sub $r0.16 = $r0.16, $r0.13   ## bblock 23, line 2547,  t565,  t1063,  t1064
;;								## 23
	c0    stw 0x68[$r0.1] = $r0.20   ## bblock 23, line 2524, t680, t544
;;								## 24
	c0    stw 0x5c[$r0.1] = $r0.19   ## bblock 23, line 2526, t680, t536
	c0    mov $r0.20 = $r0.3   ## t390
;;								## 25
	c0    ldw $r0.19 = 0x7c[$r0.1]  ## restore ## t859
	c0    mov $r0.3 = $r0.2   ## [spec] t578
;;								## 26
	c0    stw 0x2c[$r0.1] = $r0.16   ## bblock 23, line 2550, t680, t565
;;								## 27
	c0    stw 0x30[$r0.1] = $r0.14   ## bblock 23, line 2549, t680, t563
;;								## 28
	c0    stw 0x60[$r0.1] = $r0.24   ## bblock 23, line 2523, t680, t542
;;								## 29
	c0    stw 0x3c[$r0.1] = $r0.24   ## bblock 23, line 2527, t680, t542
;;								## 30
	c0    stw 0x6c[$r0.1] = $r0.26   ## bblock 23, line 2548, t680, t561
;;								## 31
	c0    stw 0x64[$r0.1] = $r0.25   ## bblock 23, line 2513, t680, t515
	c0    goto L228?3 ## goto
;;								## 32
.trace 8
L220?3:
	c0    stw 0x7c[$r0.1] = $r0.15  ## spill ## t859
;;								## 0
	c0    ldw $r0.4 = 0x10[$r0.1]   ## bblock 5, line 2350, t174, t680
	      xnop 1
;;								## 2
	c0    goto L221?3 ## goto
;;								## 3
.trace 21
L218?3:
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 34, line 2299, t71, t680
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    mov $r0.4 = $r0.0   ## 0(SI32)
;;								## 0
	c0    ldw $r0.7 = 0x14[$r0.1]   ## bblock 34, line 2299, t72, t680
;;								## 1
	c0    ldw $r0.3 = 0x78[$r0.1]  ## restore ## t860
	      xnop 1
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.7   ## bblock 34, line 2299,  t73,  t71,  t72
;;								## 4
	c0    cmpeq $b0.0 = $r0.2, $r0.0   ## bblock 34, line 2299,  t1074(I1),  t73,  0(SI32)
	      xnop 1
;;								## 6
	c0    brf $b0.0, L239?3   ## bblock 34, line 2299,  t1074(I1)
;;								## 7
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 36, line 2300,  raddr(packFloat64)(P32),  t860,  0(SI32),  0(I32),  0(I32)
;;								## 8
	c0    ldw $l0.0 = 0x74[$r0.1]  ## restore ## t679
	      xnop 3
;;								## 12
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x80), $l0.0   ## bblock 37, line 2300,  t680,  ?2.37?2auto_size(I32),  t679
;;								## 13
.trace 25
L239?3:
	c0    ldw $r0.3 = 0x14[$r0.1]   ## bblock 35, line 2301, t77, t680
	c0    add $r0.6 = $r0.1, 0x14   ## bblock 35, line 2301,  t80,  t680,  offset(aSig0?1.343)=0x14(P32)
	c0    add $r0.7 = $r0.1, 0x10   ## bblock 35, line 2301,  t81,  t680,  offset(aSig1?1.343)=0x10(P32)
	c0    add $r0.5 = $r0.1, 0x18   ## bblock 35, line 2301,  t79,  t680,  offset(aExp?1.343)=0x18(P32)
;;								## 0
	c0    ldw $r0.4 = 0x10[$r0.1]   ## bblock 35, line 2301, t78, t680
	      xnop 1
;;								## 2
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0    call $l0.0 = normalizeFloat64Subnormal   ## bblock 35, line 2301,  raddr(normalizeFloat64Subnormal)(P32),  t77,  t78,  t79,  t80,  t81
;;								## 3
	c0    ldw $r0.3 = 0x14[$r0.1]   ## bblock 4, line 2307, t87, t680
;;								## 4
	c0    ldw $r0.4 = 0x10[$r0.1]   ## bblock 4, line 2308, t96, t680
;;								## 5
	c0    ldw $r0.5 = 0x18[$r0.1]   ## bblock 4, line 2303, t83, t680
;;								## 6
	c0    ldw $r0.6 = 0x24[$r0.1]   ## bblock 4, line 2303, t82, t680
	c0    or $r0.3 = $r0.3, 1048576   ## bblock 4, line 2307,  t101,  t87,  1048576(I32)
;;								## 7
	c0    shl $r0.18 = $r0.4, 11   ## bblock 4, line 2310,  t136,  t96,  11(SI32)
	c0    shl $r0.3 = $r0.3, 11   ## bblock 4, line 2312,  t103,  t101,  11(SI32)
	c0    shru $r0.17 = $r0.4, 21   ## bblock 4, line 2312,  t100(I11),  t96,  21(I32)
	c0    ldw $r0.7 = 0x20[$r0.1]   ## bblock 4, line 2318, t118, t680
;;								## 8
	c0    add $r0.5 = $r0.5, 1021   ## bblock 4, line 2303,  t1043,  t83,  1021(SI32)
	c0    or $r0.12 = $r0.3, $r0.17   ## bblock 4, line 2312,  t133,  t103,  t100(I11)
	c0    shru $r0.19 = $r0.18, 1   ## [spec] bblock 29, line 2338,  t883(I31),  t136,  1(I32)
;;								## 9
	c0    sub $r0.15 = $r0.5, $r0.6   ## bblock 4, line 2303,  t859,  t1043,  t82
	c0    ldw $r0.20 = 0x1c[$r0.1]   ## bblock 4, line 2317, t109, t680
	c0    shru $r0.13 = $r0.12, 1   ## [spec] bblock 29, line 2339,  t843(I31),  t133,  1(I32)
	c0    shl $r0.14 = $r0.12, 31   ## [spec] bblock 29, line 2338,  t885,  t133,  31(I32)
;;								## 10
	c0    shl $r0.22 = $r0.7, 11   ## bblock 4, line 2320,  t135,  t118,  11(SI32)
	c0    shru $r0.21 = $r0.7, 21   ## bblock 4, line 2322,  t122(I11),  t118,  21(I32)
;;								## 11
	c0    cmpleu $r0.2 = $r0.22, $r0.18   ## bblock 4, line 2324,  t137,  t135,  t136
	c0    goto L219?3 ## goto
;;								## 12
.trace 20
L216?3:
	c0    or $r0.6 = $r0.6, $r0.16   ## bblock 38, line 2282,  t55,  t697,  t10
	c0    or $r0.4 = $r0.4, $r0.2   ## [spec] bblock 40, line 2283,  t1076,  t695,  t19
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    cmpeq $b0.0 = $r0.6, $r0.0   ## bblock 38, line 2282,  t1075(I1),  t55,  0(SI32)
	c0    or $r0.4 = $r0.4, $r0.14   ## [spec] bblock 40, line 2283,  t59,  t1076,  t2
;;								## 1
	c0    cmpeq $b0.1 = $r0.4, $r0.0   ## [spec] bblock 40, line 2283,  t1077(I1),  t59,  0(SI32)
;;								## 2
	c0    brf $b0.0, L240?3   ## bblock 38, line 2282,  t1075(I1)
;;								## 3
	c0    brf $b0.1, L241?3   ## bblock 40, line 2283,  t1077(I1)
;;								## 4
L242?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 44, line 2285,  raddr(float_raise)(P32),  16(SI32)
;;								## 5
	c0    mov $r0.4 = (~0x0)   ## (~0x0)(I32)
	c0    ldw $l0.0 = 0x74[$r0.1]  ## restore ## t679
	c0    mov $r0.3 = 2147483647   ## 2147483647(I32)
	      xnop 3
;;								## 9
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x80), $l0.0   ## bblock 45, line 2288,  t680,  ?2.37?2auto_size(I32),  t679
;;								## 10
.trace 27
L241?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 41, line 2290,  raddr(float_raise)(P32),  128(SI32)
	c0    mov $r0.3 = 128   ## 128(SI32)
;;								## 0
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    ldw $r0.3 = 0x78[$r0.1]  ## restore ## t860
;;								## 1
	c0    mov $r0.4 = 2047   ## 2047(SI32)
;;								## 2
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 42, line 2291,  raddr(packFloat64)(P32),  t860,  2047(SI32),  0(I32),  0(I32)
;;								## 3
	c0    ldw $l0.0 = 0x74[$r0.1]  ## restore ## t679
	      xnop 3
;;								## 7
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x80), $l0.0   ## bblock 43, line 2291,  t680,  ?2.37?2auto_size(I32),  t679
;;								## 8
.trace 24
L240?3:
	c0    ldw $r0.3 = 0x1c[$r0.1]   ## bblock 39, line 2293, t65, t680
	c0    add $r0.6 = $r0.1, 0x1c   ## bblock 39, line 2293,  t68,  t680,  offset(bSig0?1.343)=0x1c(P32)
	c0    add $r0.7 = $r0.1, 0x20   ## bblock 39, line 2293,  t69,  t680,  offset(bSig1?1.343)=0x20(P32)
	c0    add $r0.5 = $r0.1, 0x24   ## bblock 39, line 2293,  t67,  t680,  offset(bExp?1.343)=0x24(P32)
;;								## 0
	c0    ldw $r0.4 = 0x20[$r0.1]   ## bblock 39, line 2293, t66, t680
	      xnop 1
;;								## 2
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0    call $l0.0 = normalizeFloat64Subnormal   ## bblock 39, line 2293,  raddr(normalizeFloat64Subnormal)(P32),  t65,  t66,  t67,  t68,  t69
;;								## 3
	c0    ldw.d $r0.2 = 0x14[$r0.1]   ## [spec] bblock 4, line 2307, t87, t680
;;								## 4
	c0    ldw.d $r0.13 = 0x10[$r0.1]   ## [spec] bblock 4, line 2308, t96, t680
;;								## 5
	c0    ldw.d $r0.3 = 0x18[$r0.1]   ## [spec] bblock 4, line 2303, t83, t680
;;								## 6
	c0    ldw.d $r0.4 = 0x24[$r0.1]   ## [spec] bblock 4, line 2303, t82, t680
	c0    or $r0.2 = $r0.2, 1048576   ## [spec] bblock 4, line 2307,  t101,  t87,  1048576(I32)
;;								## 7
	c0    ldw $r0.13 = 0x18[$r0.1]   ## bblock 3, line 2298, t70, t680
	c0    shl $r0.18 = $r0.13, 11   ## [spec] bblock 4, line 2310,  t136,  t96,  11(SI32)
	c0    shl $r0.2 = $r0.2, 11   ## [spec] bblock 4, line 2312,  t103,  t101,  11(SI32)
	c0    shru $r0.17 = $r0.13, 21   ## [spec] bblock 4, line 2312,  t100(I11),  t96,  21(I32)
;;								## 8
	c0    add $r0.3 = $r0.3, 1021   ## [spec] bblock 4, line 2303,  t1043,  t83,  1021(SI32)
	c0    or $r0.12 = $r0.2, $r0.17   ## [spec] bblock 4, line 2312,  t133,  t103,  t100(I11)
	c0    shru $r0.19 = $r0.18, 1   ## [spec] bblock 29, line 2338,  t883(I31),  t136,  1(I32)
;;								## 9
	c0    sub $r0.15 = $r0.3, $r0.4   ## [spec] bblock 4, line 2303,  t859,  t1043,  t82
	c0    ldw.d $r0.2 = 0x20[$r0.1]   ## [spec] bblock 4, line 2318, t118, t680
;;								## 10
	c0    cmpeq $b0.3 = $r0.13, $r0.0   ## bblock 3, line 2298,  t1042(I1),  t70,  0(SI32)
	      xnop 1
;;								## 12
	c0    shl $r0.22 = $r0.2, 11   ## [spec] bblock 4, line 2320,  t135,  t118,  11(SI32)
	c0    shru $r0.21 = $r0.2, 21   ## [spec] bblock 4, line 2322,  t122(I11),  t118,  21(I32)
	c0    ldw.d $r0.20 = 0x1c[$r0.1]   ## [spec] bblock 4, line 2317, t109, t680
;;								## 13
	c0    goto L217?3 ## goto
;;								## 14
.trace 19
L215?3:
	c0    ldw $r0.2 = 0x20[$r0.1]   ## bblock 46, line 2274, t41, t680
;;								## 0
	c0    ldw $r0.7 = 0x1c[$r0.1]   ## bblock 46, line 2274, t42, t680
	      xnop 2
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.7   ## bblock 46, line 2274,  t1078,  t41,  t42
;;								## 4
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 46, line 2274,  t1079,  t1078,  0(I32)
	      xnop 1
;;								## 6
	c0    brf $b0.0, L243?3   ## bblock 46, line 2274,  t1079
;;								## 7
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = propagateFloat64NaN   ## bblock 49, line 2275,  raddr(propagateFloat64NaN)(P32),  t694,  t695,  t696,  t697
;;								## 8
	c0    ldw $l0.0 = 0x74[$r0.1]  ## restore ## t679
	      xnop 3
;;								## 12
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x80), $l0.0   ## bblock 50, line 2275,  t680,  ?2.37?2auto_size(I32),  t679
;;								## 13
.trace 23
L243?3:
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    mov $r0.4 = $r0.0   ## 0(SI32)
	c0    ldw $r0.3 = 0x78[$r0.1]  ## restore ## t860
	      xnop 1
;;								## 1
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 47, line 2276,  raddr(packFloat64)(P32),  t860,  0(SI32),  0(I32),  0(I32)
;;								## 2
	c0    ldw $l0.0 = 0x74[$r0.1]  ## restore ## t679
	      xnop 3
;;								## 6
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x80), $l0.0   ## bblock 48, line 2276,  t680,  ?2.37?2auto_size(I32),  t679
;;								## 7
.trace 18
L214?3:
	c0    ldw $r0.2 = 0x10[$r0.1]   ## bblock 51, line 2261, t20, t680
;;								## 0
	c0    ldw $r0.7 = 0x14[$r0.1]   ## bblock 51, line 2261, t21, t680
	      xnop 2
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.7   ## bblock 51, line 2261,  t1080,  t20,  t21
;;								## 4
	c0    cmpne $b0.0 = $r0.2, $r0.0   ## bblock 51, line 2261,  t1081,  t1080,  0(I32)
	      xnop 1
;;								## 6
	c0    brf $b0.0, L244?3   ## bblock 51, line 2261,  t1081
;;								## 7
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = propagateFloat64NaN   ## bblock 58, line 2262,  raddr(propagateFloat64NaN)(P32),  t694,  t695,  t696,  t697
;;								## 8
	c0    ldw $l0.0 = 0x74[$r0.1]  ## restore ## t679
	      xnop 3
;;								## 12
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x80), $l0.0   ## bblock 59, line 2262,  t680,  ?2.37?2auto_size(I32),  t679
;;								## 13
.trace 22
L244?3:
	c0    ldw $r0.2 = 0x24[$r0.1]   ## bblock 52, line 2263, t28, t680
;;								## 0
	c0    ldw.d $r0.7 = 0x20[$r0.1]   ## [spec] bblock 55, line 2264, t29, t680
;;								## 1
	c0    ldw.d $r0.8 = 0x1c[$r0.1]   ## [spec] bblock 55, line 2264, t30, t680
;;								## 2
	c0    cmpeq $b0.0 = $r0.2, 2047   ## bblock 52, line 2263,  t1082(I1),  t28,  2047(SI32)
	      xnop 1
;;								## 4
	c0    or $r0.7 = $r0.7, $r0.8   ## [spec] bblock 55, line 2264,  t1083,  t29,  t30
	c0    brf $b0.0, L245?3   ## bblock 52, line 2263,  t1082(I1)
;;								## 5
	c0    cmpne $b0.0 = $r0.7, $r0.0   ## bblock 55, line 2264,  t1084,  t1083,  0(I32)
	      xnop 1
;;								## 7
	c0    brf $b0.0, L246?3   ## bblock 55, line 2264,  t1084
;;								## 8
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = propagateFloat64NaN   ## bblock 56, line 2265,  raddr(propagateFloat64NaN)(P32),  t694,  t695,  t696,  t697
;;								## 9
	c0    ldw $l0.0 = 0x74[$r0.1]  ## restore ## t679
	      xnop 3
;;								## 13
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x80), $l0.0   ## bblock 57, line 2265,  t680,  ?2.37?2auto_size(I32),  t679
;;								## 14
.trace 28
L246?3:
	c0    mov $r0.3 = 16   ## 16(SI32)
	c0    goto L242?3 ## goto
;;								## 0
.trace 26
L245?3:
	c0    mov $r0.5 = $r0.0   ## 0(I32)
	c0    mov $r0.6 = $r0.0   ## 0(I32)
	c0    ldw $r0.3 = 0x78[$r0.1]  ## restore ## t860
;;								## 0
	c0    mov $r0.4 = 2047   ## 2047(SI32)
;;								## 1
.call packFloat64, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = packFloat64   ## bblock 53, line 2268,  raddr(packFloat64)(P32),  t860,  2047(SI32),  0(I32),  0(I32)
;;								## 2
	c0    ldw $l0.0 = 0x74[$r0.1]  ## restore ## t679
	      xnop 3
;;								## 6
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x80), $l0.0   ## bblock 54, line 2268,  t680,  ?2.37?2auto_size(I32),  t679
;;								## 7
.endp
.section .bss
.section .data
.equ ?2.37?2scratch.0, 0x0
.equ _?1PACKET.543, 0x10
.equ _?1PACKET.542, 0x14
.equ _?1PACKET.539, 0x18
.equ _?1PACKET.544, 0x1c
.equ _?1PACKET.545, 0x20
.equ _?1PACKET.540, 0x24
.equ _?1PACKET.549, 0x28
.equ _?1PACKET.550, 0x2c
.equ _?1PACKET.551, 0x30
.equ _?1PACKET.546, 0x34
.equ _?1PACKET.584, 0x38
.equ _?1PACKET.555, 0x3c
.equ _?1PACKET.583, 0x40
.equ _?1PACKET.554, 0x44
.equ _?1PACKET.585, 0x48
.equ _?1PACKET.553, 0x4c
.equ _?1PACKET.582, 0x50
.equ _?1PACKET.547, 0x54
.equ _?1PACKET.653, 0x58
.equ _?1PACKET.556, 0x5c
.equ _?1PACKET.652, 0x60
.equ _?1PACKET.654, 0x64
.equ _?1PACKET.651, 0x68
.equ _?1PACKET.552, 0x6c
.equ _?1PACKET.548, 0x70
.equ ?2.37?2ras_p, 0x74
.equ ?2.37?2spill_p, 0x78
.section .data
.section .text
.equ ?2.37?2auto_size, 0x80
 ## End _d_div
 ## Begin _d_eq
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
_d_eq::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.2 = $r0.3, 20   ## bblock 0, line 2632,  t1(I12),  t67,  20(SI32)
	c0    shru $r0.7 = $r0.5, 20   ## bblock 0, line 2634,  t10(I12),  t69,  20(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, 2047   ## bblock 0, line 2632,  t2,  t1(I12),  2047(I32)
	c0    or $r0.8 = $r0.3, $r0.5   ## [spec] bblock 1, line 2648,  t46,  t67,  t69
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t52
;;								## 1
	c0    cmpeq $r0.2 = $r0.2, 2047   ## bblock 0, line 2632,  t3,  t2,  2047(SI32)
	c0    and $r0.9 = $r0.3, 1048575   ## bblock 0, line 2633,  t6,  t67,  1048575(I32)
;;								## 2
	c0    and $r0.7 = $r0.7, 2047   ## bblock 0, line 2634,  t11,  t10(I12),  2047(I32)
	c0    or $r0.9 = $r0.4, $r0.9   ## bblock 0, line 2633,  t7,  t68,  t6
	c0    shl $r0.8 = $r0.8, 1   ## [spec] bblock 1, line 2648,  t47,  t46,  1(SI32)
;;								## 3
	c0    cmpeq $r0.7 = $r0.7, 2047   ## bblock 0, line 2634,  t12,  t11,  2047(SI32)
	c0    andl $r0.2 = $r0.2, $r0.9   ## bblock 0, line 2633,  t8,  t3,  t7
	c0    norl $r0.8 = $r0.4, $r0.8   ## [spec] bblock 1, line 2648,  t49,  t68,  t47
;;								## 4
	c0    and $r0.9 = $r0.5, 1048575   ## bblock 0, line 2635,  t15,  t69,  1048575(I32)
	c0    cmpeq $r0.11 = $r0.4, $r0.6   ## [spec] bblock 1, line 2645,  t38,  t68,  t70
	c0    cmpeq $r0.10 = $r0.3, $r0.5   ## [spec] bblock 1, line 2646,  t41,  t67,  t69
;;								## 5
	c0    or $r0.9 = $r0.6, $r0.9   ## bblock 0, line 2635,  t16,  t70,  t15
	c0    orl $r0.10 = $r0.10, $r0.8   ## [spec] bblock 1, line 2649,  t50,  t41,  t49
;;								## 6
	c0    andl $r0.7 = $r0.7, $r0.9   ## bblock 0, line 2635,  t17,  t12,  t16
	c0    andl $r0.3 = $r0.11, $r0.10   ## [spec] bblock 1, line 2649,  t51,  t38,  t50
	c0    mov $r0.8 = $r0.3   ## t67
;;								## 7
	c0    orl $b0.0 = $r0.2, $r0.7   ## bblock 0, line 2636,  t73(I1),  t8,  t17
	      xnop 1
;;								## 9
	c0    br $b0.0, L247?3   ## bblock 0, line 2636,  t73(I1)
;;								## 10
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2649,  t53,  ?2.38?2auto_size(I32),  t52
;;								## 11
.trace 2
L247?3:
	c0    shru $r0.2 = $r0.8, 19   ## bblock 2, line 2637,  t19(I13),  t67,  19(SI32)
	c0    and $r0.7 = $r0.8, 524287   ## bblock 2, line 2638,  t24,  t67,  524287(I32)
	c0    shru $r0.9 = $r0.5, 19   ## bblock 2, line 2639,  t28(I13),  t69,  19(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, 4095   ## bblock 2, line 2637,  t20,  t19(I13),  4095(I32)
	c0    orl $r0.7 = $r0.7, $r0.4   ## bblock 2, line 2638,  t25,  t24,  t68
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 1
	c0    cmpeq $r0.2 = $r0.2, 4094   ## bblock 2, line 2637,  t21,  t20,  4094(SI32)
	c0    and $r0.9 = $r0.9, 4095   ## bblock 2, line 2639,  t29,  t28(I13),  4095(I32)
;;								## 2
	c0    andl $r0.2 = $r0.2, $r0.7   ## bblock 2, line 2638,  t26,  t21,  t25
	c0    cmpeq $r0.9 = $r0.9, 4094   ## bblock 2, line 2639,  t30,  t29,  4094(SI32)
;;								## 3
	c0    and $r0.5 = $r0.5, 524287   ## bblock 2, line 2640,  t33,  t69,  524287(I32)
;;								## 4
	c0    orl $r0.5 = $r0.5, $r0.6   ## bblock 2, line 2640,  t34,  t33,  t70
;;								## 5
	c0    andl $r0.9 = $r0.9, $r0.5   ## bblock 2, line 2640,  t35,  t30,  t34
;;								## 6
	c0    orl $b0.0 = $r0.2, $r0.9   ## bblock 2, line 2640,  t81(I1),  t26,  t35
	      xnop 1
;;								## 8
	c0    brf $b0.0, L248?3   ## bblock 2, line 2640,  t81(I1)
;;								## 9
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 4, line 2641,  raddr(float_raise)(P32),  16(SI32)
;;								## 10
L248?3:
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t52
	      xnop 3
;;								## 14
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 3, line 2643,  t53,  ?2.38?2auto_size(I32),  t52
;;								## 15
.endp
.section .bss
.section .data
.equ ?2.38?2scratch.0, 0x0
.equ ?2.38?2ras_p, 0x10
.section .data
.section .text
.equ ?2.38?2auto_size, 0x20
 ## End _d_eq
 ## Begin _d_le
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
_d_le::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.2 = $r0.3, 20   ## bblock 0, line 2658,  t1(I12),  t73,  20(SI32)
	c0    shru $r0.7 = $r0.5, 20   ## bblock 0, line 2660,  t10(I12),  t75,  20(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, 2047   ## bblock 0, line 2658,  t2,  t1(I12),  2047(I32)
	c0    shru $r0.8 = $r0.3, 31   ## [spec] bblock 1, line 2666,  t78(I1),  t73,  31(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t58
;;								## 1
	c0    cmpeq $r0.2 = $r0.2, 2047   ## bblock 0, line 2658,  t3,  t2,  2047(SI32)
	c0    and $r0.9 = $r0.3, 1048575   ## bblock 0, line 2659,  t6,  t73,  1048575(I32)
;;								## 2
	c0    and $r0.7 = $r0.7, 2047   ## bblock 0, line 2660,  t11,  t10(I12),  2047(I32)
	c0    or $r0.9 = $r0.4, $r0.9   ## bblock 0, line 2659,  t7,  t74,  t6
	c0    shru $r0.10 = $r0.5, 31   ## [spec] bblock 1, line 2667,  t23(I1),  t75,  31(SI32)
;;								## 3
	c0    cmpeq $r0.7 = $r0.7, 2047   ## bblock 0, line 2660,  t12,  t11,  2047(SI32)
	c0    andl $r0.2 = $r0.2, $r0.9   ## bblock 0, line 2659,  t8,  t3,  t7
	c0    cmpne $b0.0 = $r0.8, $r0.10   ## [spec] bblock 1, line 2668,  t82(I1),  t78(I1),  t23(I1)
;;								## 4
	c0    and $r0.9 = $r0.5, 1048575   ## bblock 0, line 2661,  t15,  t75,  1048575(I32)
	c0    or $r0.10 = $r0.3, $r0.5   ## [spec] bblock 3, line 2669,  t29,  t73,  t75
;;								## 5
	c0    or $r0.9 = $r0.6, $r0.9   ## bblock 0, line 2661,  t16,  t76,  t15
	c0    shl $r0.10 = $r0.10, 1   ## [spec] bblock 3, line 2669,  t30,  t29,  1(SI32)
;;								## 6
	c0    andl $r0.7 = $r0.7, $r0.9   ## bblock 0, line 2661,  t17,  t12,  t16
	c0    or $r0.10 = $r0.4, $r0.10   ## [spec] bblock 3, line 2669,  t87,  t74,  t30
;;								## 7
	c0    orl $b0.1 = $r0.2, $r0.7   ## bblock 0, line 2662,  t81(I1),  t8,  t17
	c0    or $r0.10 = $r0.10, $r0.6   ## [spec] bblock 3, line 2669,  t31,  t87,  t76
;;								## 8
	c0    cmpeq $r0.10 = $r0.10, $r0.0   ## [spec] bblock 3, line 2670,  t89,  t31,  0(I32)
;;								## 9
	c0    orl $r0.3 = $r0.8, $r0.10   ## [spec] bblock 3, line 2670,  t33,  t78(I1),  t89
	c0    mov $r0.2 = $r0.3   ## t73
	c0    br $b0.1, L249?3   ## bblock 0, line 2662,  t81(I1)
;;								## 10
	c0    brf $b0.0, L250?3   ## bblock 1, line 2668,  t82(I1)
;;								## 11
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 3, line 2670,  t59,  ?2.39?2auto_size(I32),  t58
;;								## 12
.trace 2
L250?3:
	c0    cmpltu $r0.10 = $r0.5, $r0.2   ## bblock 2, line 2673,  t37,  t75,  t73
	c0    cmpeq $r0.7 = $r0.5, $r0.2   ## bblock 2, line 2674,  t40,  t75,  t73
	c0    cmpeq $r0.11 = $r0.2, $r0.5   ## bblock 2, line 2676,  t51,  t73,  t75
	c0    cmpleu $r0.9 = $r0.6, $r0.4   ## bblock 2, line 2674,  t43,  t76,  t74
;;								## 0
	c0    cmpltu $r0.2 = $r0.2, $r0.5   ## bblock 2, line 2675,  t48,  t73,  t75
	c0    andl $r0.7 = $r0.7, $r0.9   ## bblock 2, line 2674,  t44,  t40,  t43
	c0    cmpleu $r0.4 = $r0.4, $r0.6   ## bblock 2, line 2676,  t54,  t74,  t76
	c0    mtb $b0.0 = $r0.8   ## t78(I1)
;;								## 1
	c0    orl $r0.10 = $r0.10, $r0.7   ## bblock 2, line 2674,  t45,  t37,  t44
	c0    andl $r0.11 = $r0.11, $r0.4   ## bblock 2, line 2676,  t55,  t51,  t54
;;								## 2
	c0    orl $r0.2 = $r0.2, $r0.11   ## bblock 2, line 2676,  t56,  t48,  t55
;;								## 3
.return ret($r0.3:s32)
	c0    slct $r0.3 = $b0.0, $r0.10, $r0.2   ## bblock 2, line 2676,  t57,  t78(I1),  t45,  t56
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 2676,  t59,  ?2.39?2auto_size(I32),  t58
;;								## 4
.trace 3
L249?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 4, line 2663,  raddr(float_raise)(P32),  16(SI32)
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t58
	      xnop 3
;;								## 4
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 5, line 2664,  t59,  ?2.39?2auto_size(I32),  t58
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.39?2scratch.0, 0x0
.equ ?2.39?2ras_p, 0x10
.section .data
.section .text
.equ ?2.39?2auto_size, 0x20
 ## End _d_le
 ## Begin _d_lt
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
_d_lt::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    shru $r0.2 = $r0.3, 20   ## bblock 0, line 2685,  t1(I12),  t73,  20(SI32)
	c0    shru $r0.7 = $r0.5, 20   ## bblock 0, line 2687,  t10(I12),  t75,  20(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, 2047   ## bblock 0, line 2685,  t2,  t1(I12),  2047(I32)
	c0    shru $r0.8 = $r0.3, 31   ## [spec] bblock 1, line 2693,  t78(I1),  t73,  31(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t58
;;								## 1
	c0    cmpeq $r0.2 = $r0.2, 2047   ## bblock 0, line 2685,  t3,  t2,  2047(SI32)
	c0    and $r0.9 = $r0.3, 1048575   ## bblock 0, line 2686,  t6,  t73,  1048575(I32)
;;								## 2
	c0    and $r0.7 = $r0.7, 2047   ## bblock 0, line 2687,  t11,  t10(I12),  2047(I32)
	c0    or $r0.9 = $r0.4, $r0.9   ## bblock 0, line 2686,  t7,  t74,  t6
	c0    shru $r0.10 = $r0.5, 31   ## [spec] bblock 1, line 2694,  t23(I1),  t75,  31(SI32)
;;								## 3
	c0    cmpeq $r0.7 = $r0.7, 2047   ## bblock 0, line 2687,  t12,  t11,  2047(SI32)
	c0    andl $r0.2 = $r0.2, $r0.9   ## bblock 0, line 2686,  t8,  t3,  t7
	c0    cmpne $b0.0 = $r0.8, $r0.10   ## [spec] bblock 1, line 2695,  t82(I1),  t78(I1),  t23(I1)
;;								## 4
	c0    and $r0.9 = $r0.5, 1048575   ## bblock 0, line 2688,  t15,  t75,  1048575(I32)
	c0    or $r0.10 = $r0.3, $r0.5   ## [spec] bblock 3, line 2696,  t29,  t73,  t75
;;								## 5
	c0    or $r0.9 = $r0.6, $r0.9   ## bblock 0, line 2688,  t16,  t76,  t15
	c0    shl $r0.10 = $r0.10, 1   ## [spec] bblock 3, line 2696,  t30,  t29,  1(SI32)
;;								## 6
	c0    andl $r0.7 = $r0.7, $r0.9   ## bblock 0, line 2688,  t17,  t12,  t16
	c0    or $r0.10 = $r0.4, $r0.10   ## [spec] bblock 3, line 2696,  t87,  t74,  t30
;;								## 7
	c0    orl $b0.1 = $r0.2, $r0.7   ## bblock 0, line 2689,  t81(I1),  t8,  t17
	c0    or $r0.10 = $r0.10, $r0.6   ## [spec] bblock 3, line 2696,  t31,  t87,  t76
;;								## 8
	c0    andl $r0.3 = $r0.8, $r0.10   ## [spec] bblock 3, line 2697,  t33,  t78(I1),  t31
	c0    mov $r0.2 = $r0.3   ## t73
;;								## 9
	c0    br $b0.1, L251?3   ## bblock 0, line 2689,  t81(I1)
;;								## 10
	c0    brf $b0.0, L252?3   ## bblock 1, line 2695,  t82(I1)
;;								## 11
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 3, line 2697,  t59,  ?2.40?2auto_size(I32),  t58
;;								## 12
.trace 2
L252?3:
	c0    cmpltu $r0.10 = $r0.5, $r0.2   ## bblock 2, line 2700,  t37,  t75,  t73
	c0    cmpeq $r0.7 = $r0.5, $r0.2   ## bblock 2, line 2701,  t40,  t75,  t73
	c0    cmpeq $r0.11 = $r0.2, $r0.5   ## bblock 2, line 2703,  t51,  t73,  t75
	c0    cmpltu $r0.9 = $r0.6, $r0.4   ## bblock 2, line 2701,  t43,  t76,  t74
;;								## 0
	c0    cmpltu $r0.2 = $r0.2, $r0.5   ## bblock 2, line 2702,  t48,  t73,  t75
	c0    andl $r0.7 = $r0.7, $r0.9   ## bblock 2, line 2701,  t44,  t40,  t43
	c0    cmpltu $r0.4 = $r0.4, $r0.6   ## bblock 2, line 2703,  t54,  t74,  t76
	c0    mtb $b0.0 = $r0.8   ## t78(I1)
;;								## 1
	c0    orl $r0.10 = $r0.10, $r0.7   ## bblock 2, line 2701,  t45,  t37,  t44
	c0    andl $r0.11 = $r0.11, $r0.4   ## bblock 2, line 2703,  t55,  t51,  t54
;;								## 2
	c0    orl $r0.2 = $r0.2, $r0.11   ## bblock 2, line 2703,  t56,  t48,  t55
;;								## 3
.return ret($r0.3:s32)
	c0    slct $r0.3 = $b0.0, $r0.10, $r0.2   ## bblock 2, line 2703,  t57,  t78(I1),  t45,  t56
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 2703,  t59,  ?2.40?2auto_size(I32),  t58
;;								## 4
.trace 3
L251?3:
.call float_raise, caller, arg($r0.3:s32), ret()
	c0    call $l0.0 = float_raise   ## bblock 4, line 2690,  raddr(float_raise)(P32),  16(SI32)
	c0    mov $r0.3 = 16   ## 16(SI32)
;;								## 0
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t58
	      xnop 3
;;								## 4
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 5, line 2691,  t59,  ?2.40?2auto_size(I32),  t58
;;								## 5
.endp
.section .bss
.section .data
.equ ?2.40?2scratch.0, 0x0
.equ ?2.40?2ras_p, 0x10
.section .data
.section .text
.equ ?2.40?2auto_size, 0x20
 ## End _d_lt
 ## Begin _r_neg
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32)
_r_neg::
.trace 1
	      ## auto_size == 0
	c0    xor $r0.3 = $r0.3, (~0x7fffffff)   ## bblock 0, line 2708,  t1,  t0,  (~0x7fffffff)(I32)
;;								## 0
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 2708,  t3,  ?2.41?2auto_size(I32),  t2
;;								## 1
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.41?2auto_size, 0x0
 ## End _r_neg
 ## Begin _r_recip
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
_r_recip::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.4 = $r0.3   ## t2
;;								## 0
.call _r_div, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = _r_div   ## bblock 0, line 2715,  raddr(_r_div)(P32),  1.000000e+00=0x3f800000(F32),  t2
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t3
	c0    mov $r0.3 = 0x3f800000   ## 1.000000e+00=0x3f800000(F32)
;;								## 1
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t3
	      xnop 3
;;								## 5
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2715,  t4,  ?2.42?2auto_size(I32),  t3
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.42?2scratch.0, 0x0
.equ ?2.42?2ras_p, 0x10
.section .data
.section .text
.equ ?2.42?2auto_size, 0x20
 ## End _r_recip
 ## Begin _r_ne
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
_r_ne::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
;;								## 0
.call _r_eq, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
	c0    call $l0.0 = _r_eq   ## bblock 0, line 2720,  raddr(_r_eq)(P32),  t1,  t2
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t4
;;								## 1
	c0    cmpeq $r0.3 = $r0.3, $r0.0   ## bblock 1, line 2720,  t3,  t0,  0(I32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t4
	      xnop 3
;;								## 5
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2720,  t5,  ?2.43?2auto_size(I32),  t4
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.43?2scratch.0, 0x0
.equ ?2.43?2ras_p, 0x10
.section .data
.section .text
.equ ?2.43?2auto_size, 0x20
 ## End _r_ne
 ## Begin _r_gt
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
_r_gt::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.3 = $r0.4   ## t1
	c0    mov $r0.2 = $r0.3   ## t2
;;								## 0
.call _r_lt, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
	c0    call $l0.0 = _r_lt   ## bblock 0, line 2725,  raddr(_r_lt)(P32),  t1,  t2
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t3
	c0    mov $r0.4 = $r0.2   ## t2
;;								## 1
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t3
	      xnop 3
;;								## 5
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2725,  t4,  ?2.44?2auto_size(I32),  t3
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.44?2scratch.0, 0x0
.equ ?2.44?2ras_p, 0x10
.section .data
.section .text
.equ ?2.44?2auto_size, 0x20
 ## End _r_gt
 ## Begin _r_ge
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
_r_ge::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.3 = $r0.4   ## t1
	c0    mov $r0.2 = $r0.3   ## t2
;;								## 0
.call _r_le, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:s32)
	c0    call $l0.0 = _r_le   ## bblock 0, line 2730,  raddr(_r_le)(P32),  t1,  t2
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t3
	c0    mov $r0.4 = $r0.2   ## t2
;;								## 1
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t3
	      xnop 3
;;								## 5
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2730,  t4,  ?2.45?2auto_size(I32),  t3
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.45?2scratch.0, 0x0
.equ ?2.45?2ras_p, 0x10
.section .data
.section .text
.equ ?2.45?2auto_size, 0x20
 ## End _r_ge
 ## Begin _d_neg
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:u32,$r0.4:u32)
_d_neg::
.trace 1
	      ## auto_size == 0
	c0    xor $r0.3 = $r0.3, (~0x7fffffff)   ## bblock 0, line 2735,  t2,  t0,  (~0x7fffffff)(I32)
;;								## 0
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 2736,  t5,  ?2.46?2auto_size(I32),  t4
;;								## 1
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.46?2auto_size, 0x0
 ## End _d_neg
 ## Begin _d_recip
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
_d_recip::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.6 = $r0.4   ## t5
	c0    mov $r0.5 = $r0.3   ## t4
;;								## 0
	c0    mov $r0.4 = $r0.0   ## 0(I32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t6
	c0    mov $r0.3 = 1072693248   ## 1072693248(I32)
;;								## 1
.call _d_div, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0    call $l0.0 = _d_div   ## bblock 0, line 2743,  raddr(_d_div)(P32),  1072693248(I32),  0(I32),  t4,  t5
;;								## 2
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t6
	      xnop 3
;;								## 6
.return ret($r0.3:u32,$r0.4:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2743,  t7,  ?2.47?2auto_size(I32),  t6
;;								## 7
.endp
.section .bss
.section .data
.equ ?2.47?2scratch.0, 0x0
.equ ?2.47?2ras_p, 0x10
.section .data
.section .text
.equ ?2.47?2auto_size, 0x20
 ## End _d_recip
 ## Begin _d_ne
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
_d_ne::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
;;								## 0
.call _d_eq, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
	c0    call $l0.0 = _d_eq   ## bblock 0, line 2748,  raddr(_d_eq)(P32),  t1,  t2,  t3,  t4
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t6
;;								## 1
	c0    cmpeq $r0.3 = $r0.3, $r0.0   ## bblock 1, line 2748,  t5,  t0,  0(I32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t6
	      xnop 3
;;								## 5
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2748,  t7,  ?2.48?2auto_size(I32),  t6
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.48?2scratch.0, 0x0
.equ ?2.48?2ras_p, 0x10
.section .data
.section .text
.equ ?2.48?2auto_size, 0x20
 ## End _d_ne
 ## Begin _d_gt
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
_d_gt::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.4 = $r0.6   ## t2
	c0    mov $r0.2 = $r0.4   ## t4
;;								## 0
	c0    mov $r0.3 = $r0.5   ## t1
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t5
	c0    mov $r0.7 = $r0.3   ## t3
	c0    mov $r0.6 = $r0.2   ## t4
;;								## 1
.call _d_lt, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
	c0    call $l0.0 = _d_lt   ## bblock 0, line 2753,  raddr(_d_lt)(P32),  t1,  t2,  t3,  t4
	c0    mov $r0.5 = $r0.7   ## t3
;;								## 2
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t5
	      xnop 3
;;								## 6
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2753,  t6,  ?2.49?2auto_size(I32),  t5
;;								## 7
.endp
.section .bss
.section .data
.equ ?2.49?2scratch.0, 0x0
.equ ?2.49?2ras_p, 0x10
.section .data
.section .text
.equ ?2.49?2auto_size, 0x20
 ## End _d_gt
 ## Begin _d_ge
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32)
_d_ge::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.4 = $r0.6   ## t2
	c0    mov $r0.2 = $r0.4   ## t4
;;								## 0
	c0    mov $r0.3 = $r0.5   ## t1
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t5
	c0    mov $r0.7 = $r0.3   ## t3
	c0    mov $r0.6 = $r0.2   ## t4
;;								## 1
.call _d_le, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
	c0    call $l0.0 = _d_le   ## bblock 0, line 2758,  raddr(_d_le)(P32),  t1,  t2,  t3,  t4
	c0    mov $r0.5 = $r0.7   ## t3
;;								## 2
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t5
	      xnop 3
;;								## 6
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2758,  t6,  ?2.50?2auto_size(I32),  t5
;;								## 7
.endp
.section .bss
.section .data
.equ ?2.50?2scratch.0, 0x0
.equ ?2.50?2ras_p, 0x10
.section .data
.section .text
.equ ?2.50?2auto_size, 0x20
 ## End _d_ge
 ## Begin _r_fix
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
_r_fix::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.4 = 1   ## 1(SI32)
;;								## 0
.call float32_to_int32_round_to_zero, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:s32)
	c0    call $l0.0 = float32_to_int32_round_to_zero   ## bblock 0, line 2763,  raddr(float32_to_int32_round_to_zero)(P32),  t1,  1(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t2
;;								## 1
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t2
	      xnop 3
;;								## 5
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2763,  t3,  ?2.51?2auto_size(I32),  t2
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.51?2scratch.0, 0x0
.equ ?2.51?2ras_p, 0x10
.section .data
.section .text
.equ ?2.51?2auto_size, 0x20
 ## End _r_fix
 ## Begin _r_ufix
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32)
_r_ufix::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.4 = $r0.0   ## 0(SI32)
;;								## 0
.call float32_to_int32_round_to_zero, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:s32)
	c0    call $l0.0 = float32_to_int32_round_to_zero   ## bblock 0, line 2768,  raddr(float32_to_int32_round_to_zero)(P32),  t1,  0(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t2
;;								## 1
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t2
	      xnop 3
;;								## 5
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2768,  t3,  ?2.52?2auto_size(I32),  t2
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.52?2scratch.0, 0x0
.equ ?2.52?2ras_p, 0x10
.section .data
.section .text
.equ ?2.52?2auto_size, 0x20
 ## End _r_ufix
 ## Begin _d_fix
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
_d_fix::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.5 = 1   ## 1(SI32)
;;								## 0
.call float64_to_int32_round_to_zero, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:s32)
	c0    call $l0.0 = float64_to_int32_round_to_zero   ## bblock 0, line 2773,  raddr(float64_to_int32_round_to_zero)(P32),  t1,  t2,  1(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t3
;;								## 1
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t3
	      xnop 3
;;								## 5
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2773,  t4,  ?2.53?2auto_size(I32),  t3
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.53?2scratch.0, 0x0
.equ ?2.53?2ras_p, 0x10
.section .data
.section .text
.equ ?2.53?2auto_size, 0x20
 ## End _d_fix
 ## Begin _d_ufix
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32,$r0.4:u32)
_d_ufix::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.5 = $r0.0   ## 0(SI32)
;;								## 0
.call float64_to_int32_round_to_zero, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret($r0.3:s32)
	c0    call $l0.0 = float64_to_int32_round_to_zero   ## bblock 0, line 2778,  raddr(float64_to_int32_round_to_zero)(P32),  t1,  t2,  0(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t3
;;								## 1
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t3
	      xnop 3
;;								## 5
.return ret($r0.3:u32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 2778,  t4,  ?2.54?2auto_size(I32),  t3
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.54?2scratch.0, 0x0
.equ ?2.54?2ras_p, 0x10
.section .data
.section .text
.equ ?2.54?2auto_size, 0x20
 ## End _d_ufix
 ## Begin fpgetround
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg()
fpgetround::
.trace 1
	      ## auto_size == 0
	c0    ldw $r0.3 = ((_?1PACKET.2 + 0) + 0)[$r0.0]   ## bblock 0, line 2781, t0, 0(I32)
	      xnop 1
;;								## 1
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 2783,  t2,  ?2.55?2auto_size(I32),  t1
;;								## 2
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.55?2auto_size, 0x0
 ## End fpgetround
 ## Begin fpsetround
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32)
fpsetround::
.trace 1
	      ## auto_size == 0
	c0    stw ((_?1PACKET.2 + 0) + 0)[$r0.0] = $r0.3   ## bblock 0, line 2789, 0(I32), t1
;;								## 0
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 2789,  t3,  ?2.56?2auto_size(I32),  t2
;;								## 1
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.56?2auto_size, 0x0
 ## End fpsetround
 ## Begin fpgetmask
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg()
fpgetmask::
.trace 1
	      ## auto_size == 0
	c0    ldw $r0.3 = ((_?1PACKET.4 + 0) + 0)[$r0.0]   ## bblock 0, line 2792, t0, 0(I32)
	      xnop 1
;;								## 1
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 2794,  t2,  ?2.57?2auto_size(I32),  t1
;;								## 2
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.57?2auto_size, 0x0
 ## End fpgetmask
 ## Begin fpsetmask
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32)
fpsetmask::
.trace 1
	      ## auto_size == 0
	c0    stw ((_?1PACKET.4 + 0) + 0)[$r0.0] = $r0.3   ## bblock 0, line 2800, 0(I32), t1
;;								## 0
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 2800,  t3,  ?2.58?2auto_size(I32),  t2
;;								## 1
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.58?2auto_size, 0x0
 ## End fpsetmask
 ## Begin fpgetsticky
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg()
fpgetsticky::
.trace 1
	      ## auto_size == 0
	c0    ldw $r0.3 = ((_?1PACKET.3 + 0) + 0)[$r0.0]   ## bblock 0, line 2803, t0, 0(I32)
	      xnop 1
;;								## 1
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 2805,  t2,  ?2.59?2auto_size(I32),  t1
;;								## 2
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.59?2auto_size, 0x0
 ## End fpgetsticky
 ## Begin fpsetsticky
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32)
fpsetsticky::
.trace 1
	      ## auto_size == 0
	c0    stw ((_?1PACKET.3 + 0) + 0)[$r0.0] = $r0.3   ## bblock 0, line 2811, 0(I32), t1
;;								## 0
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 2811,  t3,  ?2.60?2auto_size(I32),  t2
;;								## 1
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.60?2auto_size, 0x0
 ## End fpsetsticky
.section .bss
.section .data
_?1PACKET.3:
    .data4 0
_?1PACKET.1:
    .data4 0
_?1PACKET.2:
    .data4 0
_?1PACKET.4:
    .data4 0
.section .data
.section .text
.import _d_lt
.type _d_lt,@function
.import _d_le
.type _d_le,@function
.import _d_eq
.type _d_eq,@function
.import _d_div
.type _d_div,@function
.import _r_lt
.type _r_lt,@function
.import _r_le
.type _r_le,@function
.import _r_eq
.type _r_eq,@function
.import _r_div
.type _r_div,@function
