#!/usr/bin/perl

# script to auto generate assembly code to test all alu ops.

@ops = ("cmpeq",
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
.trace 3
	      ## auto_size == 0
	c0    mov \$r0.7 = 2   ## bblock 0, line 0,  t50,  2(I32)
	c0    mov \$r0.8 = 3   ## bblock 0, line 0,  t49,  3(I32)
;;								## 0
	c0    mov \$r0.2 = \$r0.0   ## bblock 0, line 9,  t32,  0(SI32)
	c0    mov \$r0.4 = \$r0.0   ## bblock 0, line 9,  t23,  0(SI32)
	c0    mov \$r0.6 = 1   ## bblock 0, line 0,  t51,  1(I32)
;;								## 1
.trace 1
L0?3:
	c0    orc \$r0.3 = \$r0.2, \$r0.0   ## bblock 1, line 13,  t31,  t32,  0(I32)
	c0    cmple \$b0.0 = \$r0.4, 31   ## bblock 1, line 11-1,  t61(I1),  t23,  31(SI32)
	c0    mov \$r0.5 = 1   ## 1(SI32)
;;								## 0
TOP

    $bottom_section=<<BOTTOM;
	c0    shl \$r0.10 = \$r0.5, \$r0.4   ## bblock 1, line 16,  t9,  1(SI32),  t23
	c0    shl \$r0.11 = \$r0.5, \$r0.6   ## [spec] bblock 11, line 16-1,  t43,  1(SI32),  t51
;;								## 1
	c0    or \$r0.2 = \$r0.2, \$r0.10   ## bblock 1, line 16,  t25,  t32,  t9
	c0    shl \$r0.10 = \$r0.5, \$r0.7   ## [spec] bblock 11, line 16-2,  t38,  1(SI32),  t50
	c0    shl \$r0.12 = \$r0.5, \$r0.8   ## [spec] bblock 11, line 16-3,  t34,  1(SI32),  t49
	c0    brf \$b0.0, L1?3   ## bblock 1, line 11-1,  t61(I1)
;;								## 2
	c0    or \$r0.2 = \$r0.2, \$r0.11   ## bblock 11, line 16-1,  t44,  t25,  t43
	c0    add \$r0.8 = \$r0.8, 4   ## bblock 11, line 0,  t49,  t49,  4(I32)
	c0    add \$r0.7 = \$r0.7, 4   ## bblock 11, line 0,  t50,  t50,  4(I32)
	c0    add \$r0.4 = \$r0.4, 4   ## bblock 11, line 11-3,  t23,  t23,  4(SI32)
;;								## 3
	c0    or \$r0.2 = \$r0.2, \$r0.10   ## bblock 11, line 16-2,  t39,  t44,  t38
	c0    add \$r0.6 = \$r0.6, 4   ## bblock 11, line 0,  t51,  t51,  4(I32)
;;								## 4
	c0    or \$r0.2 = \$r0.2, \$r0.12   ## bblock 11, line 16-3,  t32,  t39,  t34
	c0    goto L0?3 ## goto
;;								## 5
.trace 4
L1?3:
	c0    cmpgt \$b0.0 = \$r0.0, 32   ## bblock 12, line 0,  t62(I1),  0(SI32),  32(SI32)
	c0    stw ((first_i + 0) + 0)[\$r0.0] = \$r0.3   ## bblock 12, line 19, 0(I32), t31
;;								## 0
	c0    slct \$r0.4 = \$b0.0, \$r0.0, 33   ## bblock 12, line 0,  t29,  t62(I1),  0(SI32),  33(I32)
	c0    stw ((third + 0) + 0)[\$r0.0] = \$r0.9   ## bblock 12, line 19, 0(I32), t28
	c0    mov \$r0.3 = \$r0.0   ## 0(SI32)
;;								## 1
	c0    stw ((i + 0) + 0)[\$r0.0] = \$r0.4   ## bblock 12, line 19, 0(I32), t29
;;								## 2
.return ret(\$r0.3:s32)
	c0    stw ((first + 0) + 0)[\$r0.0] = \$r0.2   ## bblock 12, line 19, 0(I32), t25
	c0    return \$r0.1 = \$r0.1, (0x0), \$l0.0   ## bblock 12, line 19,  t12,  ?2.1?2auto_size(I32),  t11
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

BOTTOM


open FILE, "> stress4.s" or die "Could not open file\n";

$max = 0xffffffffffffffff;
$max2 = 0xffffffff;

print FILE $top_section;
foreach $op (@ops)
{
    $first = 0;
    for($i=0;$i<=32;$i++)
    {
	$first_i = ~$first;
	$first_i &= 0xffffffff;
	printf(FILE "\tc0    $op \$b0.3 = \$r0.3, 0x%x\n\;\;\n", $first_i);
	print FILE "\tc0    $op \$b0.3 = \$r0.3, $first\n\;\;\n";
	$first |= 1 << $i;
    }
}
print FILE $bottom_section;

close FILE;

#system("/home/elds2/vex-3.41/lib/s2cs stress4.s stress4.cs.c -show_bundle_counts -trace_icache -trace_memory -runtime_icache_cfg -little_endian");

print "All Done :)\n";

exit(0);
