 ## Target: VEX 1 cluster (big endian)
.comment ""
.comment "Copyright (C) 1990-2007 Hewlett-Packard Company"
.comment "VEX C compiler version 3.41 (20070125 release)"
.comment ""
.comment "-dir /home/elds2/vex-3.41 -S -fexpand-div -fno-xnop"
.sversion 3.41
.rta 2
.section .bss
.align 32
.section .data
.align 32
 ## Begin main
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg()
main::
.trace 3
	      ## auto_size == 0
	c0    mov $r0.7 = 2   ## bblock 0, line 0,  t50,  2(I32)
	c0    mov $r0.8 = 3   ## bblock 0, line 0,  t49,  3(I32)
;;								## 0
	c0    mov $r0.2 = $r0.0   ## bblock 0, line 9,  t32,  0(SI32)
	c0    mov $r0.4 = $r0.0   ## bblock 0, line 9,  t23,  0(SI32)
	c0    mov $r0.6 = 1   ## bblock 0, line 0,  t51,  1(I32)
;;								## 1
.trace 1
L0?3:
	c0    orc $r0.3 = $r0.2, $r0.0   ## bblock 1, line 13,  t31,  t32,  0(I32)
	c0    cmple $b0.0 = $r0.4, 31   ## bblock 1, line 11-1,  t61(I1),  t23,  31(SI32)
	c0    mov $r0.5 = 1   ## 1(SI32)
;;								## 0
	c0    cmpeq $b0.3 = $r0.3, 0xffffffff
;;
	c0    cmpeq $b0.3 = $r0.3, 0
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfffffffe
;;
	c0    cmpeq $b0.3 = $r0.3, 1
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfffffffc
;;
	c0    cmpeq $b0.3 = $r0.3, 3
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfffffff8
;;
	c0    cmpeq $b0.3 = $r0.3, 7
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfffffff0
;;
	c0    cmpeq $b0.3 = $r0.3, 15
;;
	c0    cmpeq $b0.3 = $r0.3, 0xffffffe0
;;
	c0    cmpeq $b0.3 = $r0.3, 31
;;
	c0    cmpeq $b0.3 = $r0.3, 0xffffffc0
;;
	c0    cmpeq $b0.3 = $r0.3, 63
;;
	c0    cmpeq $b0.3 = $r0.3, 0xffffff80
;;
	c0    cmpeq $b0.3 = $r0.3, 127
;;
	c0    cmpeq $b0.3 = $r0.3, 0xffffff00
;;
	c0    cmpeq $b0.3 = $r0.3, 255
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfffffe00
;;
	c0    cmpeq $b0.3 = $r0.3, 511
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfffffc00
;;
	c0    cmpeq $b0.3 = $r0.3, 1023
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfffff800
;;
	c0    cmpeq $b0.3 = $r0.3, 2047
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfffff000
;;
	c0    cmpeq $b0.3 = $r0.3, 4095
;;
	c0    cmpeq $b0.3 = $r0.3, 0xffffe000
;;
	c0    cmpeq $b0.3 = $r0.3, 8191
;;
	c0    cmpeq $b0.3 = $r0.3, 0xffffc000
;;
	c0    cmpeq $b0.3 = $r0.3, 16383
;;
	c0    cmpeq $b0.3 = $r0.3, 0xffff8000
;;
	c0    cmpeq $b0.3 = $r0.3, 32767
;;
	c0    cmpeq $b0.3 = $r0.3, 0xffff0000
;;
	c0    cmpeq $b0.3 = $r0.3, 65535
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfffe0000
;;
	c0    cmpeq $b0.3 = $r0.3, 131071
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfffc0000
;;
	c0    cmpeq $b0.3 = $r0.3, 262143
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfff80000
;;
	c0    cmpeq $b0.3 = $r0.3, 524287
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfff00000
;;
	c0    cmpeq $b0.3 = $r0.3, 1048575
;;
	c0    cmpeq $b0.3 = $r0.3, 0xffe00000
;;
	c0    cmpeq $b0.3 = $r0.3, 2097151
;;
	c0    cmpeq $b0.3 = $r0.3, 0xffc00000
;;
	c0    cmpeq $b0.3 = $r0.3, 4194303
;;
	c0    cmpeq $b0.3 = $r0.3, 0xff800000
;;
	c0    cmpeq $b0.3 = $r0.3, 8388607
;;
	c0    cmpeq $b0.3 = $r0.3, 0xff000000
;;
	c0    cmpeq $b0.3 = $r0.3, 16777215
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfe000000
;;
	c0    cmpeq $b0.3 = $r0.3, 33554431
;;
	c0    cmpeq $b0.3 = $r0.3, 0xfc000000
;;
	c0    cmpeq $b0.3 = $r0.3, 67108863
;;
	c0    cmpeq $b0.3 = $r0.3, 0xf8000000
;;
	c0    cmpeq $b0.3 = $r0.3, 134217727
;;
	c0    cmpeq $b0.3 = $r0.3, 0xf0000000
;;
	c0    cmpeq $b0.3 = $r0.3, 268435455
;;
	c0    cmpeq $b0.3 = $r0.3, 0xe0000000
;;
	c0    cmpeq $b0.3 = $r0.3, 536870911
;;
	c0    cmpeq $b0.3 = $r0.3, 0xc0000000
;;
	c0    cmpeq $b0.3 = $r0.3, 1073741823
;;
	c0    cmpeq $b0.3 = $r0.3, 0x80000000
;;
	c0    cmpeq $b0.3 = $r0.3, 2147483647
;;
	c0    cmpeq $b0.3 = $r0.3, 0x0
;;
	c0    cmpeq $b0.3 = $r0.3, 4294967295
;;
	c0    cmpge $b0.3 = $r0.3, 0xffffffff
;;
	c0    cmpge $b0.3 = $r0.3, 0
;;
	c0    cmpge $b0.3 = $r0.3, 0xfffffffe
;;
	c0    cmpge $b0.3 = $r0.3, 1
;;
	c0    cmpge $b0.3 = $r0.3, 0xfffffffc
;;
	c0    cmpge $b0.3 = $r0.3, 3
;;
	c0    cmpge $b0.3 = $r0.3, 0xfffffff8
;;
	c0    cmpge $b0.3 = $r0.3, 7
;;
	c0    cmpge $b0.3 = $r0.3, 0xfffffff0
;;
	c0    cmpge $b0.3 = $r0.3, 15
;;
	c0    cmpge $b0.3 = $r0.3, 0xffffffe0
;;
	c0    cmpge $b0.3 = $r0.3, 31
;;
	c0    cmpge $b0.3 = $r0.3, 0xffffffc0
;;
	c0    cmpge $b0.3 = $r0.3, 63
;;
	c0    cmpge $b0.3 = $r0.3, 0xffffff80
;;
	c0    cmpge $b0.3 = $r0.3, 127
;;
	c0    cmpge $b0.3 = $r0.3, 0xffffff00
;;
	c0    cmpge $b0.3 = $r0.3, 255
;;
	c0    cmpge $b0.3 = $r0.3, 0xfffffe00
;;
	c0    cmpge $b0.3 = $r0.3, 511
;;
	c0    cmpge $b0.3 = $r0.3, 0xfffffc00
;;
	c0    cmpge $b0.3 = $r0.3, 1023
;;
	c0    cmpge $b0.3 = $r0.3, 0xfffff800
;;
	c0    cmpge $b0.3 = $r0.3, 2047
;;
	c0    cmpge $b0.3 = $r0.3, 0xfffff000
;;
	c0    cmpge $b0.3 = $r0.3, 4095
;;
	c0    cmpge $b0.3 = $r0.3, 0xffffe000
;;
	c0    cmpge $b0.3 = $r0.3, 8191
;;
	c0    cmpge $b0.3 = $r0.3, 0xffffc000
;;
	c0    cmpge $b0.3 = $r0.3, 16383
;;
	c0    cmpge $b0.3 = $r0.3, 0xffff8000
;;
	c0    cmpge $b0.3 = $r0.3, 32767
;;
	c0    cmpge $b0.3 = $r0.3, 0xffff0000
;;
	c0    cmpge $b0.3 = $r0.3, 65535
;;
	c0    cmpge $b0.3 = $r0.3, 0xfffe0000
;;
	c0    cmpge $b0.3 = $r0.3, 131071
;;
	c0    cmpge $b0.3 = $r0.3, 0xfffc0000
;;
	c0    cmpge $b0.3 = $r0.3, 262143
;;
	c0    cmpge $b0.3 = $r0.3, 0xfff80000
;;
	c0    cmpge $b0.3 = $r0.3, 524287
;;
	c0    cmpge $b0.3 = $r0.3, 0xfff00000
;;
	c0    cmpge $b0.3 = $r0.3, 1048575
;;
	c0    cmpge $b0.3 = $r0.3, 0xffe00000
;;
	c0    cmpge $b0.3 = $r0.3, 2097151
;;
	c0    cmpge $b0.3 = $r0.3, 0xffc00000
;;
	c0    cmpge $b0.3 = $r0.3, 4194303
;;
	c0    cmpge $b0.3 = $r0.3, 0xff800000
;;
	c0    cmpge $b0.3 = $r0.3, 8388607
;;
	c0    cmpge $b0.3 = $r0.3, 0xff000000
;;
	c0    cmpge $b0.3 = $r0.3, 16777215
;;
	c0    cmpge $b0.3 = $r0.3, 0xfe000000
;;
	c0    cmpge $b0.3 = $r0.3, 33554431
;;
	c0    cmpge $b0.3 = $r0.3, 0xfc000000
;;
	c0    cmpge $b0.3 = $r0.3, 67108863
;;
	c0    cmpge $b0.3 = $r0.3, 0xf8000000
;;
	c0    cmpge $b0.3 = $r0.3, 134217727
;;
	c0    cmpge $b0.3 = $r0.3, 0xf0000000
;;
	c0    cmpge $b0.3 = $r0.3, 268435455
;;
	c0    cmpge $b0.3 = $r0.3, 0xe0000000
;;
	c0    cmpge $b0.3 = $r0.3, 536870911
;;
	c0    cmpge $b0.3 = $r0.3, 0xc0000000
;;
	c0    cmpge $b0.3 = $r0.3, 1073741823
;;
	c0    cmpge $b0.3 = $r0.3, 0x80000000
;;
	c0    cmpge $b0.3 = $r0.3, 2147483647
;;
	c0    cmpge $b0.3 = $r0.3, 0x0
;;
	c0    cmpge $b0.3 = $r0.3, 4294967295
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xffffffff
;;
	c0    cmpgeu $b0.3 = $r0.3, 0
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfffffffe
;;
	c0    cmpgeu $b0.3 = $r0.3, 1
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfffffffc
;;
	c0    cmpgeu $b0.3 = $r0.3, 3
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfffffff8
;;
	c0    cmpgeu $b0.3 = $r0.3, 7
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfffffff0
;;
	c0    cmpgeu $b0.3 = $r0.3, 15
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xffffffe0
;;
	c0    cmpgeu $b0.3 = $r0.3, 31
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xffffffc0
;;
	c0    cmpgeu $b0.3 = $r0.3, 63
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xffffff80
;;
	c0    cmpgeu $b0.3 = $r0.3, 127
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xffffff00
;;
	c0    cmpgeu $b0.3 = $r0.3, 255
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfffffe00
;;
	c0    cmpgeu $b0.3 = $r0.3, 511
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfffffc00
;;
	c0    cmpgeu $b0.3 = $r0.3, 1023
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfffff800
;;
	c0    cmpgeu $b0.3 = $r0.3, 2047
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfffff000
;;
	c0    cmpgeu $b0.3 = $r0.3, 4095
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xffffe000
;;
	c0    cmpgeu $b0.3 = $r0.3, 8191
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xffffc000
;;
	c0    cmpgeu $b0.3 = $r0.3, 16383
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xffff8000
;;
	c0    cmpgeu $b0.3 = $r0.3, 32767
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xffff0000
;;
	c0    cmpgeu $b0.3 = $r0.3, 65535
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfffe0000
;;
	c0    cmpgeu $b0.3 = $r0.3, 131071
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfffc0000
;;
	c0    cmpgeu $b0.3 = $r0.3, 262143
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfff80000
;;
	c0    cmpgeu $b0.3 = $r0.3, 524287
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfff00000
;;
	c0    cmpgeu $b0.3 = $r0.3, 1048575
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xffe00000
;;
	c0    cmpgeu $b0.3 = $r0.3, 2097151
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xffc00000
;;
	c0    cmpgeu $b0.3 = $r0.3, 4194303
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xff800000
;;
	c0    cmpgeu $b0.3 = $r0.3, 8388607
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xff000000
;;
	c0    cmpgeu $b0.3 = $r0.3, 16777215
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfe000000
;;
	c0    cmpgeu $b0.3 = $r0.3, 33554431
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xfc000000
;;
	c0    cmpgeu $b0.3 = $r0.3, 67108863
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xf8000000
;;
	c0    cmpgeu $b0.3 = $r0.3, 134217727
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xf0000000
;;
	c0    cmpgeu $b0.3 = $r0.3, 268435455
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xe0000000
;;
	c0    cmpgeu $b0.3 = $r0.3, 536870911
;;
	c0    cmpgeu $b0.3 = $r0.3, 0xc0000000
;;
	c0    cmpgeu $b0.3 = $r0.3, 1073741823
;;
	c0    cmpgeu $b0.3 = $r0.3, 0x80000000
;;
	c0    cmpgeu $b0.3 = $r0.3, 2147483647
;;
	c0    cmpgeu $b0.3 = $r0.3, 0x0
;;
	c0    cmpgeu $b0.3 = $r0.3, 4294967295
;;
	c0    cmpgt $b0.3 = $r0.3, 0xffffffff
;;
	c0    cmpgt $b0.3 = $r0.3, 0
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfffffffe
;;
	c0    cmpgt $b0.3 = $r0.3, 1
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfffffffc
;;
	c0    cmpgt $b0.3 = $r0.3, 3
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfffffff8
;;
	c0    cmpgt $b0.3 = $r0.3, 7
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfffffff0
;;
	c0    cmpgt $b0.3 = $r0.3, 15
;;
	c0    cmpgt $b0.3 = $r0.3, 0xffffffe0
;;
	c0    cmpgt $b0.3 = $r0.3, 31
;;
	c0    cmpgt $b0.3 = $r0.3, 0xffffffc0
;;
	c0    cmpgt $b0.3 = $r0.3, 63
;;
	c0    cmpgt $b0.3 = $r0.3, 0xffffff80
;;
	c0    cmpgt $b0.3 = $r0.3, 127
;;
	c0    cmpgt $b0.3 = $r0.3, 0xffffff00
;;
	c0    cmpgt $b0.3 = $r0.3, 255
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfffffe00
;;
	c0    cmpgt $b0.3 = $r0.3, 511
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfffffc00
;;
	c0    cmpgt $b0.3 = $r0.3, 1023
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfffff800
;;
	c0    cmpgt $b0.3 = $r0.3, 2047
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfffff000
;;
	c0    cmpgt $b0.3 = $r0.3, 4095
;;
	c0    cmpgt $b0.3 = $r0.3, 0xffffe000
;;
	c0    cmpgt $b0.3 = $r0.3, 8191
;;
	c0    cmpgt $b0.3 = $r0.3, 0xffffc000
;;
	c0    cmpgt $b0.3 = $r0.3, 16383
;;
	c0    cmpgt $b0.3 = $r0.3, 0xffff8000
;;
	c0    cmpgt $b0.3 = $r0.3, 32767
;;
	c0    cmpgt $b0.3 = $r0.3, 0xffff0000
;;
	c0    cmpgt $b0.3 = $r0.3, 65535
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfffe0000
;;
	c0    cmpgt $b0.3 = $r0.3, 131071
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfffc0000
;;
	c0    cmpgt $b0.3 = $r0.3, 262143
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfff80000
;;
	c0    cmpgt $b0.3 = $r0.3, 524287
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfff00000
;;
	c0    cmpgt $b0.3 = $r0.3, 1048575
;;
	c0    cmpgt $b0.3 = $r0.3, 0xffe00000
;;
	c0    cmpgt $b0.3 = $r0.3, 2097151
;;
	c0    cmpgt $b0.3 = $r0.3, 0xffc00000
;;
	c0    cmpgt $b0.3 = $r0.3, 4194303
;;
	c0    cmpgt $b0.3 = $r0.3, 0xff800000
;;
	c0    cmpgt $b0.3 = $r0.3, 8388607
;;
	c0    cmpgt $b0.3 = $r0.3, 0xff000000
;;
	c0    cmpgt $b0.3 = $r0.3, 16777215
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfe000000
;;
	c0    cmpgt $b0.3 = $r0.3, 33554431
;;
	c0    cmpgt $b0.3 = $r0.3, 0xfc000000
;;
	c0    cmpgt $b0.3 = $r0.3, 67108863
;;
	c0    cmpgt $b0.3 = $r0.3, 0xf8000000
;;
	c0    cmpgt $b0.3 = $r0.3, 134217727
;;
	c0    cmpgt $b0.3 = $r0.3, 0xf0000000
;;
	c0    cmpgt $b0.3 = $r0.3, 268435455
;;
	c0    cmpgt $b0.3 = $r0.3, 0xe0000000
;;
	c0    cmpgt $b0.3 = $r0.3, 536870911
;;
	c0    cmpgt $b0.3 = $r0.3, 0xc0000000
;;
	c0    cmpgt $b0.3 = $r0.3, 1073741823
;;
	c0    cmpgt $b0.3 = $r0.3, 0x80000000
;;
	c0    cmpgt $b0.3 = $r0.3, 2147483647
;;
	c0    cmpgt $b0.3 = $r0.3, 0x0
;;
	c0    cmpgt $b0.3 = $r0.3, 4294967295
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xffffffff
;;
	c0    cmpgtu $b0.3 = $r0.3, 0
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfffffffe
;;
	c0    cmpgtu $b0.3 = $r0.3, 1
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfffffffc
;;
	c0    cmpgtu $b0.3 = $r0.3, 3
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfffffff8
;;
	c0    cmpgtu $b0.3 = $r0.3, 7
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfffffff0
;;
	c0    cmpgtu $b0.3 = $r0.3, 15
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xffffffe0
;;
	c0    cmpgtu $b0.3 = $r0.3, 31
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xffffffc0
;;
	c0    cmpgtu $b0.3 = $r0.3, 63
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xffffff80
;;
	c0    cmpgtu $b0.3 = $r0.3, 127
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xffffff00
;;
	c0    cmpgtu $b0.3 = $r0.3, 255
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfffffe00
;;
	c0    cmpgtu $b0.3 = $r0.3, 511
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfffffc00
;;
	c0    cmpgtu $b0.3 = $r0.3, 1023
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfffff800
;;
	c0    cmpgtu $b0.3 = $r0.3, 2047
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfffff000
;;
	c0    cmpgtu $b0.3 = $r0.3, 4095
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xffffe000
;;
	c0    cmpgtu $b0.3 = $r0.3, 8191
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xffffc000
;;
	c0    cmpgtu $b0.3 = $r0.3, 16383
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xffff8000
;;
	c0    cmpgtu $b0.3 = $r0.3, 32767
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xffff0000
;;
	c0    cmpgtu $b0.3 = $r0.3, 65535
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfffe0000
;;
	c0    cmpgtu $b0.3 = $r0.3, 131071
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfffc0000
;;
	c0    cmpgtu $b0.3 = $r0.3, 262143
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfff80000
;;
	c0    cmpgtu $b0.3 = $r0.3, 524287
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfff00000
;;
	c0    cmpgtu $b0.3 = $r0.3, 1048575
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xffe00000
;;
	c0    cmpgtu $b0.3 = $r0.3, 2097151
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xffc00000
;;
	c0    cmpgtu $b0.3 = $r0.3, 4194303
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xff800000
;;
	c0    cmpgtu $b0.3 = $r0.3, 8388607
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xff000000
;;
	c0    cmpgtu $b0.3 = $r0.3, 16777215
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfe000000
;;
	c0    cmpgtu $b0.3 = $r0.3, 33554431
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xfc000000
;;
	c0    cmpgtu $b0.3 = $r0.3, 67108863
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xf8000000
;;
	c0    cmpgtu $b0.3 = $r0.3, 134217727
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xf0000000
;;
	c0    cmpgtu $b0.3 = $r0.3, 268435455
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xe0000000
;;
	c0    cmpgtu $b0.3 = $r0.3, 536870911
;;
	c0    cmpgtu $b0.3 = $r0.3, 0xc0000000
;;
	c0    cmpgtu $b0.3 = $r0.3, 1073741823
;;
	c0    cmpgtu $b0.3 = $r0.3, 0x80000000
;;
	c0    cmpgtu $b0.3 = $r0.3, 2147483647
;;
	c0    cmpgtu $b0.3 = $r0.3, 0x0
;;
	c0    cmpgtu $b0.3 = $r0.3, 4294967295
;;
	c0    cmple $b0.3 = $r0.3, 0xffffffff
;;
	c0    cmple $b0.3 = $r0.3, 0
;;
	c0    cmple $b0.3 = $r0.3, 0xfffffffe
;;
	c0    cmple $b0.3 = $r0.3, 1
;;
	c0    cmple $b0.3 = $r0.3, 0xfffffffc
;;
	c0    cmple $b0.3 = $r0.3, 3
;;
	c0    cmple $b0.3 = $r0.3, 0xfffffff8
;;
	c0    cmple $b0.3 = $r0.3, 7
;;
	c0    cmple $b0.3 = $r0.3, 0xfffffff0
;;
	c0    cmple $b0.3 = $r0.3, 15
;;
	c0    cmple $b0.3 = $r0.3, 0xffffffe0
;;
	c0    cmple $b0.3 = $r0.3, 31
;;
	c0    cmple $b0.3 = $r0.3, 0xffffffc0
;;
	c0    cmple $b0.3 = $r0.3, 63
;;
	c0    cmple $b0.3 = $r0.3, 0xffffff80
;;
	c0    cmple $b0.3 = $r0.3, 127
;;
	c0    cmple $b0.3 = $r0.3, 0xffffff00
;;
	c0    cmple $b0.3 = $r0.3, 255
;;
	c0    cmple $b0.3 = $r0.3, 0xfffffe00
;;
	c0    cmple $b0.3 = $r0.3, 511
;;
	c0    cmple $b0.3 = $r0.3, 0xfffffc00
;;
	c0    cmple $b0.3 = $r0.3, 1023
;;
	c0    cmple $b0.3 = $r0.3, 0xfffff800
;;
	c0    cmple $b0.3 = $r0.3, 2047
;;
	c0    cmple $b0.3 = $r0.3, 0xfffff000
;;
	c0    cmple $b0.3 = $r0.3, 4095
;;
	c0    cmple $b0.3 = $r0.3, 0xffffe000
;;
	c0    cmple $b0.3 = $r0.3, 8191
;;
	c0    cmple $b0.3 = $r0.3, 0xffffc000
;;
	c0    cmple $b0.3 = $r0.3, 16383
;;
	c0    cmple $b0.3 = $r0.3, 0xffff8000
;;
	c0    cmple $b0.3 = $r0.3, 32767
;;
	c0    cmple $b0.3 = $r0.3, 0xffff0000
;;
	c0    cmple $b0.3 = $r0.3, 65535
;;
	c0    cmple $b0.3 = $r0.3, 0xfffe0000
;;
	c0    cmple $b0.3 = $r0.3, 131071
;;
	c0    cmple $b0.3 = $r0.3, 0xfffc0000
;;
	c0    cmple $b0.3 = $r0.3, 262143
;;
	c0    cmple $b0.3 = $r0.3, 0xfff80000
;;
	c0    cmple $b0.3 = $r0.3, 524287
;;
	c0    cmple $b0.3 = $r0.3, 0xfff00000
;;
	c0    cmple $b0.3 = $r0.3, 1048575
;;
	c0    cmple $b0.3 = $r0.3, 0xffe00000
;;
	c0    cmple $b0.3 = $r0.3, 2097151
;;
	c0    cmple $b0.3 = $r0.3, 0xffc00000
;;
	c0    cmple $b0.3 = $r0.3, 4194303
;;
	c0    cmple $b0.3 = $r0.3, 0xff800000
;;
	c0    cmple $b0.3 = $r0.3, 8388607
;;
	c0    cmple $b0.3 = $r0.3, 0xff000000
;;
	c0    cmple $b0.3 = $r0.3, 16777215
;;
	c0    cmple $b0.3 = $r0.3, 0xfe000000
;;
	c0    cmple $b0.3 = $r0.3, 33554431
;;
	c0    cmple $b0.3 = $r0.3, 0xfc000000
;;
	c0    cmple $b0.3 = $r0.3, 67108863
;;
	c0    cmple $b0.3 = $r0.3, 0xf8000000
;;
	c0    cmple $b0.3 = $r0.3, 134217727
;;
	c0    cmple $b0.3 = $r0.3, 0xf0000000
;;
	c0    cmple $b0.3 = $r0.3, 268435455
;;
	c0    cmple $b0.3 = $r0.3, 0xe0000000
;;
	c0    cmple $b0.3 = $r0.3, 536870911
;;
	c0    cmple $b0.3 = $r0.3, 0xc0000000
;;
	c0    cmple $b0.3 = $r0.3, 1073741823
;;
	c0    cmple $b0.3 = $r0.3, 0x80000000
;;
	c0    cmple $b0.3 = $r0.3, 2147483647
;;
	c0    cmple $b0.3 = $r0.3, 0x0
;;
	c0    cmple $b0.3 = $r0.3, 4294967295
;;
	c0    cmpleu $b0.3 = $r0.3, 0xffffffff
;;
	c0    cmpleu $b0.3 = $r0.3, 0
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfffffffe
;;
	c0    cmpleu $b0.3 = $r0.3, 1
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfffffffc
;;
	c0    cmpleu $b0.3 = $r0.3, 3
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfffffff8
;;
	c0    cmpleu $b0.3 = $r0.3, 7
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfffffff0
;;
	c0    cmpleu $b0.3 = $r0.3, 15
;;
	c0    cmpleu $b0.3 = $r0.3, 0xffffffe0
;;
	c0    cmpleu $b0.3 = $r0.3, 31
;;
	c0    cmpleu $b0.3 = $r0.3, 0xffffffc0
;;
	c0    cmpleu $b0.3 = $r0.3, 63
;;
	c0    cmpleu $b0.3 = $r0.3, 0xffffff80
;;
	c0    cmpleu $b0.3 = $r0.3, 127
;;
	c0    cmpleu $b0.3 = $r0.3, 0xffffff00
;;
	c0    cmpleu $b0.3 = $r0.3, 255
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfffffe00
;;
	c0    cmpleu $b0.3 = $r0.3, 511
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfffffc00
;;
	c0    cmpleu $b0.3 = $r0.3, 1023
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfffff800
;;
	c0    cmpleu $b0.3 = $r0.3, 2047
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfffff000
;;
	c0    cmpleu $b0.3 = $r0.3, 4095
;;
	c0    cmpleu $b0.3 = $r0.3, 0xffffe000
;;
	c0    cmpleu $b0.3 = $r0.3, 8191
;;
	c0    cmpleu $b0.3 = $r0.3, 0xffffc000
;;
	c0    cmpleu $b0.3 = $r0.3, 16383
;;
	c0    cmpleu $b0.3 = $r0.3, 0xffff8000
;;
	c0    cmpleu $b0.3 = $r0.3, 32767
;;
	c0    cmpleu $b0.3 = $r0.3, 0xffff0000
;;
	c0    cmpleu $b0.3 = $r0.3, 65535
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfffe0000
;;
	c0    cmpleu $b0.3 = $r0.3, 131071
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfffc0000
;;
	c0    cmpleu $b0.3 = $r0.3, 262143
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfff80000
;;
	c0    cmpleu $b0.3 = $r0.3, 524287
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfff00000
;;
	c0    cmpleu $b0.3 = $r0.3, 1048575
;;
	c0    cmpleu $b0.3 = $r0.3, 0xffe00000
;;
	c0    cmpleu $b0.3 = $r0.3, 2097151
;;
	c0    cmpleu $b0.3 = $r0.3, 0xffc00000
;;
	c0    cmpleu $b0.3 = $r0.3, 4194303
;;
	c0    cmpleu $b0.3 = $r0.3, 0xff800000
;;
	c0    cmpleu $b0.3 = $r0.3, 8388607
;;
	c0    cmpleu $b0.3 = $r0.3, 0xff000000
;;
	c0    cmpleu $b0.3 = $r0.3, 16777215
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfe000000
;;
	c0    cmpleu $b0.3 = $r0.3, 33554431
;;
	c0    cmpleu $b0.3 = $r0.3, 0xfc000000
;;
	c0    cmpleu $b0.3 = $r0.3, 67108863
;;
	c0    cmpleu $b0.3 = $r0.3, 0xf8000000
;;
	c0    cmpleu $b0.3 = $r0.3, 134217727
;;
	c0    cmpleu $b0.3 = $r0.3, 0xf0000000
;;
	c0    cmpleu $b0.3 = $r0.3, 268435455
;;
	c0    cmpleu $b0.3 = $r0.3, 0xe0000000
;;
	c0    cmpleu $b0.3 = $r0.3, 536870911
;;
	c0    cmpleu $b0.3 = $r0.3, 0xc0000000
;;
	c0    cmpleu $b0.3 = $r0.3, 1073741823
;;
	c0    cmpleu $b0.3 = $r0.3, 0x80000000
;;
	c0    cmpleu $b0.3 = $r0.3, 2147483647
;;
	c0    cmpleu $b0.3 = $r0.3, 0x0
;;
	c0    cmpleu $b0.3 = $r0.3, 4294967295
;;
	c0    cmplt $b0.3 = $r0.3, 0xffffffff
;;
	c0    cmplt $b0.3 = $r0.3, 0
;;
	c0    cmplt $b0.3 = $r0.3, 0xfffffffe
;;
	c0    cmplt $b0.3 = $r0.3, 1
;;
	c0    cmplt $b0.3 = $r0.3, 0xfffffffc
;;
	c0    cmplt $b0.3 = $r0.3, 3
;;
	c0    cmplt $b0.3 = $r0.3, 0xfffffff8
;;
	c0    cmplt $b0.3 = $r0.3, 7
;;
	c0    cmplt $b0.3 = $r0.3, 0xfffffff0
;;
	c0    cmplt $b0.3 = $r0.3, 15
;;
	c0    cmplt $b0.3 = $r0.3, 0xffffffe0
;;
	c0    cmplt $b0.3 = $r0.3, 31
;;
	c0    cmplt $b0.3 = $r0.3, 0xffffffc0
;;
	c0    cmplt $b0.3 = $r0.3, 63
;;
	c0    cmplt $b0.3 = $r0.3, 0xffffff80
;;
	c0    cmplt $b0.3 = $r0.3, 127
;;
	c0    cmplt $b0.3 = $r0.3, 0xffffff00
;;
	c0    cmplt $b0.3 = $r0.3, 255
;;
	c0    cmplt $b0.3 = $r0.3, 0xfffffe00
;;
	c0    cmplt $b0.3 = $r0.3, 511
;;
	c0    cmplt $b0.3 = $r0.3, 0xfffffc00
;;
	c0    cmplt $b0.3 = $r0.3, 1023
;;
	c0    cmplt $b0.3 = $r0.3, 0xfffff800
;;
	c0    cmplt $b0.3 = $r0.3, 2047
;;
	c0    cmplt $b0.3 = $r0.3, 0xfffff000
;;
	c0    cmplt $b0.3 = $r0.3, 4095
;;
	c0    cmplt $b0.3 = $r0.3, 0xffffe000
;;
	c0    cmplt $b0.3 = $r0.3, 8191
;;
	c0    cmplt $b0.3 = $r0.3, 0xffffc000
;;
	c0    cmplt $b0.3 = $r0.3, 16383
;;
	c0    cmplt $b0.3 = $r0.3, 0xffff8000
;;
	c0    cmplt $b0.3 = $r0.3, 32767
;;
	c0    cmplt $b0.3 = $r0.3, 0xffff0000
;;
	c0    cmplt $b0.3 = $r0.3, 65535
;;
	c0    cmplt $b0.3 = $r0.3, 0xfffe0000
;;
	c0    cmplt $b0.3 = $r0.3, 131071
;;
	c0    cmplt $b0.3 = $r0.3, 0xfffc0000
;;
	c0    cmplt $b0.3 = $r0.3, 262143
;;
	c0    cmplt $b0.3 = $r0.3, 0xfff80000
;;
	c0    cmplt $b0.3 = $r0.3, 524287
;;
	c0    cmplt $b0.3 = $r0.3, 0xfff00000
;;
	c0    cmplt $b0.3 = $r0.3, 1048575
;;
	c0    cmplt $b0.3 = $r0.3, 0xffe00000
;;
	c0    cmplt $b0.3 = $r0.3, 2097151
;;
	c0    cmplt $b0.3 = $r0.3, 0xffc00000
;;
	c0    cmplt $b0.3 = $r0.3, 4194303
;;
	c0    cmplt $b0.3 = $r0.3, 0xff800000
;;
	c0    cmplt $b0.3 = $r0.3, 8388607
;;
	c0    cmplt $b0.3 = $r0.3, 0xff000000
;;
	c0    cmplt $b0.3 = $r0.3, 16777215
;;
	c0    cmplt $b0.3 = $r0.3, 0xfe000000
;;
	c0    cmplt $b0.3 = $r0.3, 33554431
;;
	c0    cmplt $b0.3 = $r0.3, 0xfc000000
;;
	c0    cmplt $b0.3 = $r0.3, 67108863
;;
	c0    cmplt $b0.3 = $r0.3, 0xf8000000
;;
	c0    cmplt $b0.3 = $r0.3, 134217727
;;
	c0    cmplt $b0.3 = $r0.3, 0xf0000000
;;
	c0    cmplt $b0.3 = $r0.3, 268435455
;;
	c0    cmplt $b0.3 = $r0.3, 0xe0000000
;;
	c0    cmplt $b0.3 = $r0.3, 536870911
;;
	c0    cmplt $b0.3 = $r0.3, 0xc0000000
;;
	c0    cmplt $b0.3 = $r0.3, 1073741823
;;
	c0    cmplt $b0.3 = $r0.3, 0x80000000
;;
	c0    cmplt $b0.3 = $r0.3, 2147483647
;;
	c0    cmplt $b0.3 = $r0.3, 0x0
;;
	c0    cmplt $b0.3 = $r0.3, 4294967295
;;
	c0    cmpltu $b0.3 = $r0.3, 0xffffffff
;;
	c0    cmpltu $b0.3 = $r0.3, 0
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfffffffe
;;
	c0    cmpltu $b0.3 = $r0.3, 1
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfffffffc
;;
	c0    cmpltu $b0.3 = $r0.3, 3
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfffffff8
;;
	c0    cmpltu $b0.3 = $r0.3, 7
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfffffff0
;;
	c0    cmpltu $b0.3 = $r0.3, 15
;;
	c0    cmpltu $b0.3 = $r0.3, 0xffffffe0
;;
	c0    cmpltu $b0.3 = $r0.3, 31
;;
	c0    cmpltu $b0.3 = $r0.3, 0xffffffc0
;;
	c0    cmpltu $b0.3 = $r0.3, 63
;;
	c0    cmpltu $b0.3 = $r0.3, 0xffffff80
;;
	c0    cmpltu $b0.3 = $r0.3, 127
;;
	c0    cmpltu $b0.3 = $r0.3, 0xffffff00
;;
	c0    cmpltu $b0.3 = $r0.3, 255
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfffffe00
;;
	c0    cmpltu $b0.3 = $r0.3, 511
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfffffc00
;;
	c0    cmpltu $b0.3 = $r0.3, 1023
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfffff800
;;
	c0    cmpltu $b0.3 = $r0.3, 2047
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfffff000
;;
	c0    cmpltu $b0.3 = $r0.3, 4095
;;
	c0    cmpltu $b0.3 = $r0.3, 0xffffe000
;;
	c0    cmpltu $b0.3 = $r0.3, 8191
;;
	c0    cmpltu $b0.3 = $r0.3, 0xffffc000
;;
	c0    cmpltu $b0.3 = $r0.3, 16383
;;
	c0    cmpltu $b0.3 = $r0.3, 0xffff8000
;;
	c0    cmpltu $b0.3 = $r0.3, 32767
;;
	c0    cmpltu $b0.3 = $r0.3, 0xffff0000
;;
	c0    cmpltu $b0.3 = $r0.3, 65535
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfffe0000
;;
	c0    cmpltu $b0.3 = $r0.3, 131071
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfffc0000
;;
	c0    cmpltu $b0.3 = $r0.3, 262143
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfff80000
;;
	c0    cmpltu $b0.3 = $r0.3, 524287
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfff00000
;;
	c0    cmpltu $b0.3 = $r0.3, 1048575
;;
	c0    cmpltu $b0.3 = $r0.3, 0xffe00000
;;
	c0    cmpltu $b0.3 = $r0.3, 2097151
;;
	c0    cmpltu $b0.3 = $r0.3, 0xffc00000
;;
	c0    cmpltu $b0.3 = $r0.3, 4194303
;;
	c0    cmpltu $b0.3 = $r0.3, 0xff800000
;;
	c0    cmpltu $b0.3 = $r0.3, 8388607
;;
	c0    cmpltu $b0.3 = $r0.3, 0xff000000
;;
	c0    cmpltu $b0.3 = $r0.3, 16777215
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfe000000
;;
	c0    cmpltu $b0.3 = $r0.3, 33554431
;;
	c0    cmpltu $b0.3 = $r0.3, 0xfc000000
;;
	c0    cmpltu $b0.3 = $r0.3, 67108863
;;
	c0    cmpltu $b0.3 = $r0.3, 0xf8000000
;;
	c0    cmpltu $b0.3 = $r0.3, 134217727
;;
	c0    cmpltu $b0.3 = $r0.3, 0xf0000000
;;
	c0    cmpltu $b0.3 = $r0.3, 268435455
;;
	c0    cmpltu $b0.3 = $r0.3, 0xe0000000
;;
	c0    cmpltu $b0.3 = $r0.3, 536870911
;;
	c0    cmpltu $b0.3 = $r0.3, 0xc0000000
;;
	c0    cmpltu $b0.3 = $r0.3, 1073741823
;;
	c0    cmpltu $b0.3 = $r0.3, 0x80000000
;;
	c0    cmpltu $b0.3 = $r0.3, 2147483647
;;
	c0    cmpltu $b0.3 = $r0.3, 0x0
;;
	c0    cmpltu $b0.3 = $r0.3, 4294967295
;;
	c0    cmpne $b0.3 = $r0.3, 0xffffffff
;;
	c0    cmpne $b0.3 = $r0.3, 0
;;
	c0    cmpne $b0.3 = $r0.3, 0xfffffffe
;;
	c0    cmpne $b0.3 = $r0.3, 1
;;
	c0    cmpne $b0.3 = $r0.3, 0xfffffffc
;;
	c0    cmpne $b0.3 = $r0.3, 3
;;
	c0    cmpne $b0.3 = $r0.3, 0xfffffff8
;;
	c0    cmpne $b0.3 = $r0.3, 7
;;
	c0    cmpne $b0.3 = $r0.3, 0xfffffff0
;;
	c0    cmpne $b0.3 = $r0.3, 15
;;
	c0    cmpne $b0.3 = $r0.3, 0xffffffe0
;;
	c0    cmpne $b0.3 = $r0.3, 31
;;
	c0    cmpne $b0.3 = $r0.3, 0xffffffc0
;;
	c0    cmpne $b0.3 = $r0.3, 63
;;
	c0    cmpne $b0.3 = $r0.3, 0xffffff80
;;
	c0    cmpne $b0.3 = $r0.3, 127
;;
	c0    cmpne $b0.3 = $r0.3, 0xffffff00
;;
	c0    cmpne $b0.3 = $r0.3, 255
;;
	c0    cmpne $b0.3 = $r0.3, 0xfffffe00
;;
	c0    cmpne $b0.3 = $r0.3, 511
;;
	c0    cmpne $b0.3 = $r0.3, 0xfffffc00
;;
	c0    cmpne $b0.3 = $r0.3, 1023
;;
	c0    cmpne $b0.3 = $r0.3, 0xfffff800
;;
	c0    cmpne $b0.3 = $r0.3, 2047
;;
	c0    cmpne $b0.3 = $r0.3, 0xfffff000
;;
	c0    cmpne $b0.3 = $r0.3, 4095
;;
	c0    cmpne $b0.3 = $r0.3, 0xffffe000
;;
	c0    cmpne $b0.3 = $r0.3, 8191
;;
	c0    cmpne $b0.3 = $r0.3, 0xffffc000
;;
	c0    cmpne $b0.3 = $r0.3, 16383
;;
	c0    cmpne $b0.3 = $r0.3, 0xffff8000
;;
	c0    cmpne $b0.3 = $r0.3, 32767
;;
	c0    cmpne $b0.3 = $r0.3, 0xffff0000
;;
	c0    cmpne $b0.3 = $r0.3, 65535
;;
	c0    cmpne $b0.3 = $r0.3, 0xfffe0000
;;
	c0    cmpne $b0.3 = $r0.3, 131071
;;
	c0    cmpne $b0.3 = $r0.3, 0xfffc0000
;;
	c0    cmpne $b0.3 = $r0.3, 262143
;;
	c0    cmpne $b0.3 = $r0.3, 0xfff80000
;;
	c0    cmpne $b0.3 = $r0.3, 524287
;;
	c0    cmpne $b0.3 = $r0.3, 0xfff00000
;;
	c0    cmpne $b0.3 = $r0.3, 1048575
;;
	c0    cmpne $b0.3 = $r0.3, 0xffe00000
;;
	c0    cmpne $b0.3 = $r0.3, 2097151
;;
	c0    cmpne $b0.3 = $r0.3, 0xffc00000
;;
	c0    cmpne $b0.3 = $r0.3, 4194303
;;
	c0    cmpne $b0.3 = $r0.3, 0xff800000
;;
	c0    cmpne $b0.3 = $r0.3, 8388607
;;
	c0    cmpne $b0.3 = $r0.3, 0xff000000
;;
	c0    cmpne $b0.3 = $r0.3, 16777215
;;
	c0    cmpne $b0.3 = $r0.3, 0xfe000000
;;
	c0    cmpne $b0.3 = $r0.3, 33554431
;;
	c0    cmpne $b0.3 = $r0.3, 0xfc000000
;;
	c0    cmpne $b0.3 = $r0.3, 67108863
;;
	c0    cmpne $b0.3 = $r0.3, 0xf8000000
;;
	c0    cmpne $b0.3 = $r0.3, 134217727
;;
	c0    cmpne $b0.3 = $r0.3, 0xf0000000
;;
	c0    cmpne $b0.3 = $r0.3, 268435455
;;
	c0    cmpne $b0.3 = $r0.3, 0xe0000000
;;
	c0    cmpne $b0.3 = $r0.3, 536870911
;;
	c0    cmpne $b0.3 = $r0.3, 0xc0000000
;;
	c0    cmpne $b0.3 = $r0.3, 1073741823
;;
	c0    cmpne $b0.3 = $r0.3, 0x80000000
;;
	c0    cmpne $b0.3 = $r0.3, 2147483647
;;
	c0    cmpne $b0.3 = $r0.3, 0x0
;;
	c0    cmpne $b0.3 = $r0.3, 4294967295
;;
	c0    nandl $b0.3 = $r0.3, 0xffffffff
;;
	c0    nandl $b0.3 = $r0.3, 0
;;
	c0    nandl $b0.3 = $r0.3, 0xfffffffe
;;
	c0    nandl $b0.3 = $r0.3, 1
;;
	c0    nandl $b0.3 = $r0.3, 0xfffffffc
;;
	c0    nandl $b0.3 = $r0.3, 3
;;
	c0    nandl $b0.3 = $r0.3, 0xfffffff8
;;
	c0    nandl $b0.3 = $r0.3, 7
;;
	c0    nandl $b0.3 = $r0.3, 0xfffffff0
;;
	c0    nandl $b0.3 = $r0.3, 15
;;
	c0    nandl $b0.3 = $r0.3, 0xffffffe0
;;
	c0    nandl $b0.3 = $r0.3, 31
;;
	c0    nandl $b0.3 = $r0.3, 0xffffffc0
;;
	c0    nandl $b0.3 = $r0.3, 63
;;
	c0    nandl $b0.3 = $r0.3, 0xffffff80
;;
	c0    nandl $b0.3 = $r0.3, 127
;;
	c0    nandl $b0.3 = $r0.3, 0xffffff00
;;
	c0    nandl $b0.3 = $r0.3, 255
;;
	c0    nandl $b0.3 = $r0.3, 0xfffffe00
;;
	c0    nandl $b0.3 = $r0.3, 511
;;
	c0    nandl $b0.3 = $r0.3, 0xfffffc00
;;
	c0    nandl $b0.3 = $r0.3, 1023
;;
	c0    nandl $b0.3 = $r0.3, 0xfffff800
;;
	c0    nandl $b0.3 = $r0.3, 2047
;;
	c0    nandl $b0.3 = $r0.3, 0xfffff000
;;
	c0    nandl $b0.3 = $r0.3, 4095
;;
	c0    nandl $b0.3 = $r0.3, 0xffffe000
;;
	c0    nandl $b0.3 = $r0.3, 8191
;;
	c0    nandl $b0.3 = $r0.3, 0xffffc000
;;
	c0    nandl $b0.3 = $r0.3, 16383
;;
	c0    nandl $b0.3 = $r0.3, 0xffff8000
;;
	c0    nandl $b0.3 = $r0.3, 32767
;;
	c0    nandl $b0.3 = $r0.3, 0xffff0000
;;
	c0    nandl $b0.3 = $r0.3, 65535
;;
	c0    nandl $b0.3 = $r0.3, 0xfffe0000
;;
	c0    nandl $b0.3 = $r0.3, 131071
;;
	c0    nandl $b0.3 = $r0.3, 0xfffc0000
;;
	c0    nandl $b0.3 = $r0.3, 262143
;;
	c0    nandl $b0.3 = $r0.3, 0xfff80000
;;
	c0    nandl $b0.3 = $r0.3, 524287
;;
	c0    nandl $b0.3 = $r0.3, 0xfff00000
;;
	c0    nandl $b0.3 = $r0.3, 1048575
;;
	c0    nandl $b0.3 = $r0.3, 0xffe00000
;;
	c0    nandl $b0.3 = $r0.3, 2097151
;;
	c0    nandl $b0.3 = $r0.3, 0xffc00000
;;
	c0    nandl $b0.3 = $r0.3, 4194303
;;
	c0    nandl $b0.3 = $r0.3, 0xff800000
;;
	c0    nandl $b0.3 = $r0.3, 8388607
;;
	c0    nandl $b0.3 = $r0.3, 0xff000000
;;
	c0    nandl $b0.3 = $r0.3, 16777215
;;
	c0    nandl $b0.3 = $r0.3, 0xfe000000
;;
	c0    nandl $b0.3 = $r0.3, 33554431
;;
	c0    nandl $b0.3 = $r0.3, 0xfc000000
;;
	c0    nandl $b0.3 = $r0.3, 67108863
;;
	c0    nandl $b0.3 = $r0.3, 0xf8000000
;;
	c0    nandl $b0.3 = $r0.3, 134217727
;;
	c0    nandl $b0.3 = $r0.3, 0xf0000000
;;
	c0    nandl $b0.3 = $r0.3, 268435455
;;
	c0    nandl $b0.3 = $r0.3, 0xe0000000
;;
	c0    nandl $b0.3 = $r0.3, 536870911
;;
	c0    nandl $b0.3 = $r0.3, 0xc0000000
;;
	c0    nandl $b0.3 = $r0.3, 1073741823
;;
	c0    nandl $b0.3 = $r0.3, 0x80000000
;;
	c0    nandl $b0.3 = $r0.3, 2147483647
;;
	c0    nandl $b0.3 = $r0.3, 0x0
;;
	c0    nandl $b0.3 = $r0.3, 4294967295
;;
	c0    norl $b0.3 = $r0.3, 0xffffffff
;;
	c0    norl $b0.3 = $r0.3, 0
;;
	c0    norl $b0.3 = $r0.3, 0xfffffffe
;;
	c0    norl $b0.3 = $r0.3, 1
;;
	c0    norl $b0.3 = $r0.3, 0xfffffffc
;;
	c0    norl $b0.3 = $r0.3, 3
;;
	c0    norl $b0.3 = $r0.3, 0xfffffff8
;;
	c0    norl $b0.3 = $r0.3, 7
;;
	c0    norl $b0.3 = $r0.3, 0xfffffff0
;;
	c0    norl $b0.3 = $r0.3, 15
;;
	c0    norl $b0.3 = $r0.3, 0xffffffe0
;;
	c0    norl $b0.3 = $r0.3, 31
;;
	c0    norl $b0.3 = $r0.3, 0xffffffc0
;;
	c0    norl $b0.3 = $r0.3, 63
;;
	c0    norl $b0.3 = $r0.3, 0xffffff80
;;
	c0    norl $b0.3 = $r0.3, 127
;;
	c0    norl $b0.3 = $r0.3, 0xffffff00
;;
	c0    norl $b0.3 = $r0.3, 255
;;
	c0    norl $b0.3 = $r0.3, 0xfffffe00
;;
	c0    norl $b0.3 = $r0.3, 511
;;
	c0    norl $b0.3 = $r0.3, 0xfffffc00
;;
	c0    norl $b0.3 = $r0.3, 1023
;;
	c0    norl $b0.3 = $r0.3, 0xfffff800
;;
	c0    norl $b0.3 = $r0.3, 2047
;;
	c0    norl $b0.3 = $r0.3, 0xfffff000
;;
	c0    norl $b0.3 = $r0.3, 4095
;;
	c0    norl $b0.3 = $r0.3, 0xffffe000
;;
	c0    norl $b0.3 = $r0.3, 8191
;;
	c0    norl $b0.3 = $r0.3, 0xffffc000
;;
	c0    norl $b0.3 = $r0.3, 16383
;;
	c0    norl $b0.3 = $r0.3, 0xffff8000
;;
	c0    norl $b0.3 = $r0.3, 32767
;;
	c0    norl $b0.3 = $r0.3, 0xffff0000
;;
	c0    norl $b0.3 = $r0.3, 65535
;;
	c0    norl $b0.3 = $r0.3, 0xfffe0000
;;
	c0    norl $b0.3 = $r0.3, 131071
;;
	c0    norl $b0.3 = $r0.3, 0xfffc0000
;;
	c0    norl $b0.3 = $r0.3, 262143
;;
	c0    norl $b0.3 = $r0.3, 0xfff80000
;;
	c0    norl $b0.3 = $r0.3, 524287
;;
	c0    norl $b0.3 = $r0.3, 0xfff00000
;;
	c0    norl $b0.3 = $r0.3, 1048575
;;
	c0    norl $b0.3 = $r0.3, 0xffe00000
;;
	c0    norl $b0.3 = $r0.3, 2097151
;;
	c0    norl $b0.3 = $r0.3, 0xffc00000
;;
	c0    norl $b0.3 = $r0.3, 4194303
;;
	c0    norl $b0.3 = $r0.3, 0xff800000
;;
	c0    norl $b0.3 = $r0.3, 8388607
;;
	c0    norl $b0.3 = $r0.3, 0xff000000
;;
	c0    norl $b0.3 = $r0.3, 16777215
;;
	c0    norl $b0.3 = $r0.3, 0xfe000000
;;
	c0    norl $b0.3 = $r0.3, 33554431
;;
	c0    norl $b0.3 = $r0.3, 0xfc000000
;;
	c0    norl $b0.3 = $r0.3, 67108863
;;
	c0    norl $b0.3 = $r0.3, 0xf8000000
;;
	c0    norl $b0.3 = $r0.3, 134217727
;;
	c0    norl $b0.3 = $r0.3, 0xf0000000
;;
	c0    norl $b0.3 = $r0.3, 268435455
;;
	c0    norl $b0.3 = $r0.3, 0xe0000000
;;
	c0    norl $b0.3 = $r0.3, 536870911
;;
	c0    norl $b0.3 = $r0.3, 0xc0000000
;;
	c0    norl $b0.3 = $r0.3, 1073741823
;;
	c0    norl $b0.3 = $r0.3, 0x80000000
;;
	c0    norl $b0.3 = $r0.3, 2147483647
;;
	c0    norl $b0.3 = $r0.3, 0x0
;;
	c0    norl $b0.3 = $r0.3, 4294967295
;;
	c0    orl $b0.3 = $r0.3, 0xffffffff
;;
	c0    orl $b0.3 = $r0.3, 0
;;
	c0    orl $b0.3 = $r0.3, 0xfffffffe
;;
	c0    orl $b0.3 = $r0.3, 1
;;
	c0    orl $b0.3 = $r0.3, 0xfffffffc
;;
	c0    orl $b0.3 = $r0.3, 3
;;
	c0    orl $b0.3 = $r0.3, 0xfffffff8
;;
	c0    orl $b0.3 = $r0.3, 7
;;
	c0    orl $b0.3 = $r0.3, 0xfffffff0
;;
	c0    orl $b0.3 = $r0.3, 15
;;
	c0    orl $b0.3 = $r0.3, 0xffffffe0
;;
	c0    orl $b0.3 = $r0.3, 31
;;
	c0    orl $b0.3 = $r0.3, 0xffffffc0
;;
	c0    orl $b0.3 = $r0.3, 63
;;
	c0    orl $b0.3 = $r0.3, 0xffffff80
;;
	c0    orl $b0.3 = $r0.3, 127
;;
	c0    orl $b0.3 = $r0.3, 0xffffff00
;;
	c0    orl $b0.3 = $r0.3, 255
;;
	c0    orl $b0.3 = $r0.3, 0xfffffe00
;;
	c0    orl $b0.3 = $r0.3, 511
;;
	c0    orl $b0.3 = $r0.3, 0xfffffc00
;;
	c0    orl $b0.3 = $r0.3, 1023
;;
	c0    orl $b0.3 = $r0.3, 0xfffff800
;;
	c0    orl $b0.3 = $r0.3, 2047
;;
	c0    orl $b0.3 = $r0.3, 0xfffff000
;;
	c0    orl $b0.3 = $r0.3, 4095
;;
	c0    orl $b0.3 = $r0.3, 0xffffe000
;;
	c0    orl $b0.3 = $r0.3, 8191
;;
	c0    orl $b0.3 = $r0.3, 0xffffc000
;;
	c0    orl $b0.3 = $r0.3, 16383
;;
	c0    orl $b0.3 = $r0.3, 0xffff8000
;;
	c0    orl $b0.3 = $r0.3, 32767
;;
	c0    orl $b0.3 = $r0.3, 0xffff0000
;;
	c0    orl $b0.3 = $r0.3, 65535
;;
	c0    orl $b0.3 = $r0.3, 0xfffe0000
;;
	c0    orl $b0.3 = $r0.3, 131071
;;
	c0    orl $b0.3 = $r0.3, 0xfffc0000
;;
	c0    orl $b0.3 = $r0.3, 262143
;;
	c0    orl $b0.3 = $r0.3, 0xfff80000
;;
	c0    orl $b0.3 = $r0.3, 524287
;;
	c0    orl $b0.3 = $r0.3, 0xfff00000
;;
	c0    orl $b0.3 = $r0.3, 1048575
;;
	c0    orl $b0.3 = $r0.3, 0xffe00000
;;
	c0    orl $b0.3 = $r0.3, 2097151
;;
	c0    orl $b0.3 = $r0.3, 0xffc00000
;;
	c0    orl $b0.3 = $r0.3, 4194303
;;
	c0    orl $b0.3 = $r0.3, 0xff800000
;;
	c0    orl $b0.3 = $r0.3, 8388607
;;
	c0    orl $b0.3 = $r0.3, 0xff000000
;;
	c0    orl $b0.3 = $r0.3, 16777215
;;
	c0    orl $b0.3 = $r0.3, 0xfe000000
;;
	c0    orl $b0.3 = $r0.3, 33554431
;;
	c0    orl $b0.3 = $r0.3, 0xfc000000
;;
	c0    orl $b0.3 = $r0.3, 67108863
;;
	c0    orl $b0.3 = $r0.3, 0xf8000000
;;
	c0    orl $b0.3 = $r0.3, 134217727
;;
	c0    orl $b0.3 = $r0.3, 0xf0000000
;;
	c0    orl $b0.3 = $r0.3, 268435455
;;
	c0    orl $b0.3 = $r0.3, 0xe0000000
;;
	c0    orl $b0.3 = $r0.3, 536870911
;;
	c0    orl $b0.3 = $r0.3, 0xc0000000
;;
	c0    orl $b0.3 = $r0.3, 1073741823
;;
	c0    orl $b0.3 = $r0.3, 0x80000000
;;
	c0    orl $b0.3 = $r0.3, 2147483647
;;
	c0    orl $b0.3 = $r0.3, 0x0
;;
	c0    orl $b0.3 = $r0.3, 4294967295
;;
	c0    andl $b0.3 = $r0.3, 0xffffffff
;;
	c0    andl $b0.3 = $r0.3, 0
;;
	c0    andl $b0.3 = $r0.3, 0xfffffffe
;;
	c0    andl $b0.3 = $r0.3, 1
;;
	c0    andl $b0.3 = $r0.3, 0xfffffffc
;;
	c0    andl $b0.3 = $r0.3, 3
;;
	c0    andl $b0.3 = $r0.3, 0xfffffff8
;;
	c0    andl $b0.3 = $r0.3, 7
;;
	c0    andl $b0.3 = $r0.3, 0xfffffff0
;;
	c0    andl $b0.3 = $r0.3, 15
;;
	c0    andl $b0.3 = $r0.3, 0xffffffe0
;;
	c0    andl $b0.3 = $r0.3, 31
;;
	c0    andl $b0.3 = $r0.3, 0xffffffc0
;;
	c0    andl $b0.3 = $r0.3, 63
;;
	c0    andl $b0.3 = $r0.3, 0xffffff80
;;
	c0    andl $b0.3 = $r0.3, 127
;;
	c0    andl $b0.3 = $r0.3, 0xffffff00
;;
	c0    andl $b0.3 = $r0.3, 255
;;
	c0    andl $b0.3 = $r0.3, 0xfffffe00
;;
	c0    andl $b0.3 = $r0.3, 511
;;
	c0    andl $b0.3 = $r0.3, 0xfffffc00
;;
	c0    andl $b0.3 = $r0.3, 1023
;;
	c0    andl $b0.3 = $r0.3, 0xfffff800
;;
	c0    andl $b0.3 = $r0.3, 2047
;;
	c0    andl $b0.3 = $r0.3, 0xfffff000
;;
	c0    andl $b0.3 = $r0.3, 4095
;;
	c0    andl $b0.3 = $r0.3, 0xffffe000
;;
	c0    andl $b0.3 = $r0.3, 8191
;;
	c0    andl $b0.3 = $r0.3, 0xffffc000
;;
	c0    andl $b0.3 = $r0.3, 16383
;;
	c0    andl $b0.3 = $r0.3, 0xffff8000
;;
	c0    andl $b0.3 = $r0.3, 32767
;;
	c0    andl $b0.3 = $r0.3, 0xffff0000
;;
	c0    andl $b0.3 = $r0.3, 65535
;;
	c0    andl $b0.3 = $r0.3, 0xfffe0000
;;
	c0    andl $b0.3 = $r0.3, 131071
;;
	c0    andl $b0.3 = $r0.3, 0xfffc0000
;;
	c0    andl $b0.3 = $r0.3, 262143
;;
	c0    andl $b0.3 = $r0.3, 0xfff80000
;;
	c0    andl $b0.3 = $r0.3, 524287
;;
	c0    andl $b0.3 = $r0.3, 0xfff00000
;;
	c0    andl $b0.3 = $r0.3, 1048575
;;
	c0    andl $b0.3 = $r0.3, 0xffe00000
;;
	c0    andl $b0.3 = $r0.3, 2097151
;;
	c0    andl $b0.3 = $r0.3, 0xffc00000
;;
	c0    andl $b0.3 = $r0.3, 4194303
;;
	c0    andl $b0.3 = $r0.3, 0xff800000
;;
	c0    andl $b0.3 = $r0.3, 8388607
;;
	c0    andl $b0.3 = $r0.3, 0xff000000
;;
	c0    andl $b0.3 = $r0.3, 16777215
;;
	c0    andl $b0.3 = $r0.3, 0xfe000000
;;
	c0    andl $b0.3 = $r0.3, 33554431
;;
	c0    andl $b0.3 = $r0.3, 0xfc000000
;;
	c0    andl $b0.3 = $r0.3, 67108863
;;
	c0    andl $b0.3 = $r0.3, 0xf8000000
;;
	c0    andl $b0.3 = $r0.3, 134217727
;;
	c0    andl $b0.3 = $r0.3, 0xf0000000
;;
	c0    andl $b0.3 = $r0.3, 268435455
;;
	c0    andl $b0.3 = $r0.3, 0xe0000000
;;
	c0    andl $b0.3 = $r0.3, 536870911
;;
	c0    andl $b0.3 = $r0.3, 0xc0000000
;;
	c0    andl $b0.3 = $r0.3, 1073741823
;;
	c0    andl $b0.3 = $r0.3, 0x80000000
;;
	c0    andl $b0.3 = $r0.3, 2147483647
;;
	c0    andl $b0.3 = $r0.3, 0x0
;;
	c0    andl $b0.3 = $r0.3, 4294967295
;;
	c0    shl $r0.10 = $r0.5, $r0.4   ## bblock 1, line 16,  t9,  1(SI32),  t23
	c0    shl $r0.11 = $r0.5, $r0.6   ## [spec] bblock 11, line 16-1,  t43,  1(SI32),  t51
;;								## 1
	c0    or $r0.2 = $r0.2, $r0.10   ## bblock 1, line 16,  t25,  t32,  t9
	c0    shl $r0.10 = $r0.5, $r0.7   ## [spec] bblock 11, line 16-2,  t38,  1(SI32),  t50
	c0    shl $r0.12 = $r0.5, $r0.8   ## [spec] bblock 11, line 16-3,  t34,  1(SI32),  t49
	c0    brf $b0.0, L1?3   ## bblock 1, line 11-1,  t61(I1)
;;								## 2
	c0    or $r0.2 = $r0.2, $r0.11   ## bblock 11, line 16-1,  t44,  t25,  t43
	c0    add $r0.8 = $r0.8, 4   ## bblock 11, line 0,  t49,  t49,  4(I32)
	c0    add $r0.7 = $r0.7, 4   ## bblock 11, line 0,  t50,  t50,  4(I32)
	c0    add $r0.4 = $r0.4, 4   ## bblock 11, line 11-3,  t23,  t23,  4(SI32)
;;								## 3
	c0    or $r0.2 = $r0.2, $r0.10   ## bblock 11, line 16-2,  t39,  t44,  t38
	c0    add $r0.6 = $r0.6, 4   ## bblock 11, line 0,  t51,  t51,  4(I32)
;;								## 4
	c0    or $r0.2 = $r0.2, $r0.12   ## bblock 11, line 16-3,  t32,  t39,  t34
	c0    goto L0?3 ## goto
;;								## 5
.trace 4
L1?3:
	c0    cmpgt $b0.0 = $r0.0, 32   ## bblock 12, line 0,  t62(I1),  0(SI32),  32(SI32)
	c0    stw ((first_i + 0) + 0)[$r0.0] = $r0.3   ## bblock 12, line 19, 0(I32), t31
;;								## 0
	c0    slct $r0.4 = $b0.0, $r0.0, 33   ## bblock 12, line 0,  t29,  t62(I1),  0(SI32),  33(I32)
	c0    stw ((third + 0) + 0)[$r0.0] = $r0.9   ## bblock 12, line 19, 0(I32), t28
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
;;								## 1
	c0    stw ((i + 0) + 0)[$r0.0] = $r0.4   ## bblock 12, line 19, 0(I32), t29
;;								## 2
.return ret($r0.3:s32)
	c0    stw ((first + 0) + 0)[$r0.0] = $r0.2   ## bblock 12, line 19, 0(I32), t25
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 12, line 19,  t12,  ?2.1?2auto_size(I32),  t11
;;								## 3
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.1?2auto_size, 0x0
 ## End main
.section .bss
.section .data
.section .data
.comm first_i, 0x4, 4
.comm j, 0x4, 4
.comm i, 0x4, 4
.comm third, 0x4, 4
.comm first, 0x4, 4
.section .text

