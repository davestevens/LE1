#!/usr/bin/perl

# script to auto generate assembly code to test all alu ops.

@ops = ("add",
	"and",
	"andc",
	"max",
	"maxu",
	"min",
	"minu",
	"or",
	"orc",
	"sh1add",
	"sh2add",
	"sh3add",
	"sh4add",
	"shl",
	"shr",
	"shru",
	"sub",
	"xor",
	"mpyll",
	"mpyllu",
	"mpylh",
	"mpylhu",
	"mpyhh",
	"mpyhhu",
	"mpyl",
	"mpylu",
	"mpyh",
	"mpyhu",
	"mpyhs",
	"cmpeq",
	"cmpge",
	"cmpgeu",
	"cmpgt",
	"cmpgtu",
	"cmple",
	"cmpleu",
	"cmplt",
	"cmpltu",
	"cmpne",
	"nandl",
	"norl",
	"orl",
	"andl"
	);


# need to alter the labels in top and bottom section to reflect correctly.


    $top_section=<<TOP;
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
.entry caller, sp=\$r0.1, rl=\$l0.0, asize=0, arg()
main::
.trace 5
	      ## auto_size == 0
	c0    ldw \$r0.7 = ((second_i + 0) + 0)[\$r0.0]   ## bblock 0, line 7, t51, 0(I32)
;;								## 0
	c0    ldw \$r0.11 = ((j + 0) + 0)[\$r0.0]   ## bblock 0, line 7, t49, 0(I32)
	c0    mov \$r0.6 = \$r0.0   ## bblock 0, line 9,  t38,  0(SI32)
	c0    mov \$r0.4 = \$r0.0   ## bblock 0, line 9,  t37,  0(SI32)
;;								## 1
	c0    ldw \$r0.12 = ((third + 0) + 0)[\$r0.0]   ## bblock 0, line 7, t36, 0(I32)
	c0    mov \$r0.3 = \$r0.0   ## bblock 0, line 9,  t35,  0(SI32)
;;								## 2
	c0    ldw \$r0.5 = ((first_i + 0) + 0)[\$r0.0]   ## bblock 0, line 7, t33, 0(I32)
;;								## 3
;;								## 4
;;								## 5
.trace 3
L0?3:
	c0    cmple \$b0.0 = \$r0.3, 32   ## bblock 1, line 12,  t71(I1),  t35,  32(SI32)
	c0    mov \$r0.8 = 1   ## [spec] bblock 3, line 0,  t61,  1(I32)
	c0    mov \$r0.9 = 2   ## [spec] bblock 3, line 0,  t60,  2(I32)
	c0    mov \$r0.10 = 3   ## [spec] bblock 3, line 0,  t59,  3(I32)
;;								## 0
	c0    mov \$r0.2 = \$r0.0   ## [spec] bblock 3, line 16,  t34,  0(SI32)
	c0    mov \$r0.15 = \$r0.3   ## t35
;;								## 1
	c0    brf \$b0.0, L1?3   ## bblock 1, line 12,  t71(I1)
;;								## 2
	c0    orc \$r0.16 = \$r0.6, \$r0.0   ## bblock 3, line 14,  t33,  t38,  0(I32)
;;								## 3
.trace 1
L2?3:
	c0    orc \$r0.5 = \$r0.4, \$r0.0   ## bblock 4, line 18,  t48,  t37,  0(I32)
;;
TOP

    $bottom_section=<<BOTTOM;
	c0    cmple \$b0.0 = \$r0.2, 31   ## bblock 4, line 16-1,  t72(I1),  t34,  31(SI32)
	c0    mov \$r0.3 = 1   ## 1(SI32)
;;								## 0
	c0    shl \$r0.11 = \$r0.3, \$r0.2   ## bblock 4, line 21,  t15,  1(SI32),  t34
	c0    shl \$r0.12 = \$r0.3, \$r0.8   ## [spec] bblock 14, line 21-1,  t56,  1(SI32),  t61
	c0    shl \$r0.13 = \$r0.3, \$r0.9   ## [spec] bblock 14, line 21-2,  t53,  1(SI32),  t60
	c0    shl \$r0.14 = \$r0.3, \$r0.10   ## [spec] bblock 14, line 21-3,  t43,  1(SI32),  t59
;;								## 1
	c0    or \$r0.4 = \$r0.4, \$r0.11   ## bblock 4, line 21,  t46,  t37,  t15
	c0    add \$r0.10 = \$r0.10, 4   ## [spec] bblock 14, line 0,  t59,  t59,  4(I32)
	c0    add \$r0.2 = \$r0.2, 4   ## [spec] bblock 14, line 16-3,  t34,  t34,  4(SI32)
	c0    brf \$b0.0, L3?3   ## bblock 4, line 16-1,  t72(I1)
;;								## 2
	c0    or \$r0.4 = \$r0.4, \$r0.12   ## bblock 14, line 21-1,  t57,  t46,  t56
	c0    add \$r0.9 = \$r0.9, 4   ## bblock 14, line 0,  t60,  t60,  4(I32)
	c0    add \$r0.8 = \$r0.8, 4   ## bblock 14, line 0,  t61,  t61,  4(I32)
;;								## 3
	c0    or \$r0.4 = \$r0.4, \$r0.13   ## bblock 14, line 21-2,  t50,  t57,  t53
;;								## 4
	c0    or \$r0.4 = \$r0.4, \$r0.14   ## bblock 14, line 21-3,  t37,  t50,  t43
	c0    goto L2?3 ## goto
;;								## 5
.trace 4
L3?3:
	c0    cmpgt \$b0.0 = \$r0.0, 32   ## bblock 15, line 0,  t73(I1),  0(SI32),  32(SI32)
	c0    mov \$r0.4 = \$r0.0   ## bblock 15, line 24,  t37,  0(SI32)
	c0    mov \$r0.2 = 1   ## 1(SI32)
	c0    mov \$r0.8 = \$r0.7   ## t41
;;								## 0
	c0    slct \$r0.11 = \$b0.0, \$r0.0, 33   ## bblock 15, line 0,  t49,  t73(I1),  0(SI32),  33(I32)
	c0    mov \$r0.12 = \$r0.8   ## bblock 15, line 0,  t36,  t41
	c0    mov \$r0.7 = \$r0.5   ## bblock 15, line 0,  t51,  t48
	c0    shl \$r0.2 = \$r0.2, \$r0.15   ## bblock 15, line 23,  t19,  1(SI32),  t35
;;								## 1
	c0    or \$r0.6 = \$r0.2, \$r0.6   ## bblock 15, line 23,  t38,  t19,  t38
	c0    add \$r0.3 = \$r0.15, 1   ## bblock 15, line 12,  t35,  t35,  1(SI32)
	c0    mov \$r0.5 = \$r0.16   ## t33
	c0    goto L0?3 ## goto
;;								## 2
.trace 6
L1?3:
	c0    stw ((second_i + 0) + 0)[\$r0.0] = \$r0.7   ## bblock 2, line 27, 0(I32), t51
	c0    mov \$r0.3 = \$r0.0   ## 0(SI32)
;;								## 0
	c0    stw ((first_i + 0) + 0)[\$r0.0] = \$r0.5   ## bblock 2, line 27, 0(I32), t33
;;								## 1
	c0    stw ((j + 0) + 0)[\$r0.0] = \$r0.11   ## bblock 2, line 27, 0(I32), t49
;;								## 2
	c0    stw ((i + 0) + 0)[\$r0.0] = \$r0.15   ## bblock 2, line 27, 0(I32), t35
;;								## 3
	c0    stw ((third + 0) + 0)[\$r0.0] = \$r0.12   ## bblock 2, line 27, 0(I32), t36
;;								## 4
	c0    stw ((second + 0) + 0)[\$r0.0] = \$r0.4   ## bblock 2, line 27, 0(I32), t37
;;								## 5
.return ret(\$r0.3:s32)
	c0    stw ((first + 0) + 0)[\$r0.0] = \$r0.6   ## bblock 2, line 27, 0(I32), t38
	c0    return \$r0.1 = \$r0.1, (0x0), \$l0.0   ## bblock 2, line 27,  t22,  ?2.1?2auto_size(I32),  t21
;;								## 6
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
.comm second_i, 0x4, 4
.comm first_i, 0x4, 4
.comm j, 0x4, 4
.comm i, 0x4, 4
.comm third, 0x4, 4
.comm second, 0x4, 4
.comm first, 0x4, 4
.section .text

BOTTOM


open FILE, "> stress1.s" or die "Could not open file\n";

print FILE $top_section;
foreach $op (@ops)
{
    print FILE "\tc0    $op \$r0.7 = \$r0.4, \$r0.6\n\;\;\n";
}
print FILE $bottom_section;

close FILE;

#system("/home/elds2/vex-3.41/lib/s2cs stress1.s stress1.cs.c -show_bundle_counts -trace_icache -trace_memory -runtime_icache_cfg -little_endian");

print "All Done :)\n";

exit(0);
