 ## Target: VEX 1 cluster (big endian)
.comment ""
.comment "Copyright (C) 1990-2007 Hewlett-Packard Company"
.comment "VEX C compiler version 3.41 (20070125 release)"
.comment ""
.comment "-dir /home/elds2/vex-3.41 -S"
.sversion 3.41
.rta 2
.section .bss
.align 32
.section .data
.align 32
 ## Begin main
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg()
main::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.3 = 648   ## addr(_?1STRINGVAR.1)(P32)
;;								## 0
	c0    add $r0.6 = $r0.3, 0xff
	c0    add $r0.7 = $r0.3, 0xff
	c0    add $r0.8 = $r0.3, 0xff
	c0    add $r0.9 = $r0.3, 0xff
;;
	c0    add $r0.6 = $r0.3, 0xff
	c0    add $r0.7 = $r0.3, 0xff
	c0    add $r0.8 = $r0.3, 0xff
	c0    add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    add $r0.6 = $r0.3, 0xff
	c0    add $r0.7 = $r0.3, 0xff
	c0    add $r0.8 = $r0.3, 0xdeadbef7
	c0    add $r0.9 = $r0.3, 0xff
;;
	c0    add $r0.6 = $r0.3, 0xff
	c0    add $r0.7 = $r0.3, 0xff
	c0    add $r0.8 = $r0.3, 0xdeadbef7
	c0    add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    add $r0.6 = $r0.3, 0xff
	c0    add $r0.7 = $r0.3, 0xdeadbef6
	c0    add $r0.8 = $r0.3, 0xff
	c0    add $r0.9 = $r0.3, 0xff
;;
	c0    add $r0.6 = $r0.3, 0xff
	c0    add $r0.7 = $r0.3, 0xdeadbef6
	c0    add $r0.8 = $r0.3, 0xff
	c0    add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    add $r0.6 = $r0.3, 0xff
	c0    add $r0.7 = $r0.3, 0xdeadbef6
	c0    add $r0.8 = $r0.3, 0xdeadbef7
	c0    add $r0.9 = $r0.3, 0xff
;;
	c0    add $r0.6 = $r0.3, 0xff
	c0    add $r0.7 = $r0.3, 0xdeadbef6
	c0    add $r0.8 = $r0.3, 0xdeadbef7
	c0    add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    add $r0.6 = $r0.3, 0xdeadbef5
	c0    add $r0.7 = $r0.3, 0xff
	c0    add $r0.8 = $r0.3, 0xff
	c0    add $r0.9 = $r0.3, 0xff
;;
	c0    add $r0.6 = $r0.3, 0xdeadbef5
	c0    add $r0.7 = $r0.3, 0xff
	c0    add $r0.8 = $r0.3, 0xff
	c0    add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    add $r0.6 = $r0.3, 0xdeadbef5
	c0    add $r0.7 = $r0.3, 0xff
	c0    add $r0.8 = $r0.3, 0xdeadbef7
	c0    add $r0.9 = $r0.3, 0xff
;;
	c0    add $r0.6 = $r0.3, 0xdeadbef5
	c0    add $r0.7 = $r0.3, 0xff
	c0    add $r0.8 = $r0.3, 0xdeadbef7
	c0    add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    add $r0.6 = $r0.3, 0xdeadbef5
	c0    add $r0.7 = $r0.3, 0xdeadbef6
	c0    add $r0.8 = $r0.3, 0xff
	c0    add $r0.9 = $r0.3, 0xff
;;
	c0    add $r0.6 = $r0.3, 0xdeadbef5
	c0    add $r0.7 = $r0.3, 0xdeadbef6
	c0    add $r0.8 = $r0.3, 0xff
	c0    add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    add $r0.6 = $r0.3, 0xdeadbef5
	c0    add $r0.7 = $r0.3, 0xdeadbef6
	c0    add $r0.8 = $r0.3, 0xdeadbef7
	c0    add $r0.9 = $r0.3, 0xff
;;
	c0    add $r0.6 = $r0.3, 0xdeadbef5
	c0    add $r0.7 = $r0.3, 0xdeadbef6
	c0    add $r0.8 = $r0.3, 0xdeadbef7
	c0    add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    and $r0.6 = $r0.3, 0xff
	c0    and $r0.7 = $r0.3, 0xff
	c0    and $r0.8 = $r0.3, 0xff
	c0    and $r0.9 = $r0.3, 0xff
;;
	c0    and $r0.6 = $r0.3, 0xff
	c0    and $r0.7 = $r0.3, 0xff
	c0    and $r0.8 = $r0.3, 0xff
	c0    and $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    and $r0.6 = $r0.3, 0xff
	c0    and $r0.7 = $r0.3, 0xff
	c0    and $r0.8 = $r0.3, 0xdeadbef7
	c0    and $r0.9 = $r0.3, 0xff
;;
	c0    and $r0.6 = $r0.3, 0xff
	c0    and $r0.7 = $r0.3, 0xff
	c0    and $r0.8 = $r0.3, 0xdeadbef7
	c0    and $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    and $r0.6 = $r0.3, 0xff
	c0    and $r0.7 = $r0.3, 0xdeadbef6
	c0    and $r0.8 = $r0.3, 0xff
	c0    and $r0.9 = $r0.3, 0xff
;;
	c0    and $r0.6 = $r0.3, 0xff
	c0    and $r0.7 = $r0.3, 0xdeadbef6
	c0    and $r0.8 = $r0.3, 0xff
	c0    and $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    and $r0.6 = $r0.3, 0xff
	c0    and $r0.7 = $r0.3, 0xdeadbef6
	c0    and $r0.8 = $r0.3, 0xdeadbef7
	c0    and $r0.9 = $r0.3, 0xff
;;
	c0    and $r0.6 = $r0.3, 0xff
	c0    and $r0.7 = $r0.3, 0xdeadbef6
	c0    and $r0.8 = $r0.3, 0xdeadbef7
	c0    and $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    and $r0.6 = $r0.3, 0xdeadbef5
	c0    and $r0.7 = $r0.3, 0xff
	c0    and $r0.8 = $r0.3, 0xff
	c0    and $r0.9 = $r0.3, 0xff
;;
	c0    and $r0.6 = $r0.3, 0xdeadbef5
	c0    and $r0.7 = $r0.3, 0xff
	c0    and $r0.8 = $r0.3, 0xff
	c0    and $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    and $r0.6 = $r0.3, 0xdeadbef5
	c0    and $r0.7 = $r0.3, 0xff
	c0    and $r0.8 = $r0.3, 0xdeadbef7
	c0    and $r0.9 = $r0.3, 0xff
;;
	c0    and $r0.6 = $r0.3, 0xdeadbef5
	c0    and $r0.7 = $r0.3, 0xff
	c0    and $r0.8 = $r0.3, 0xdeadbef7
	c0    and $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    and $r0.6 = $r0.3, 0xdeadbef5
	c0    and $r0.7 = $r0.3, 0xdeadbef6
	c0    and $r0.8 = $r0.3, 0xff
	c0    and $r0.9 = $r0.3, 0xff
;;
	c0    and $r0.6 = $r0.3, 0xdeadbef5
	c0    and $r0.7 = $r0.3, 0xdeadbef6
	c0    and $r0.8 = $r0.3, 0xff
	c0    and $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    and $r0.6 = $r0.3, 0xdeadbef5
	c0    and $r0.7 = $r0.3, 0xdeadbef6
	c0    and $r0.8 = $r0.3, 0xdeadbef7
	c0    and $r0.9 = $r0.3, 0xff
;;
	c0    and $r0.6 = $r0.3, 0xdeadbef5
	c0    and $r0.7 = $r0.3, 0xdeadbef6
	c0    and $r0.8 = $r0.3, 0xdeadbef7
	c0    and $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andc $r0.6 = $r0.3, 0xff
	c0    andc $r0.7 = $r0.3, 0xff
	c0    andc $r0.8 = $r0.3, 0xff
	c0    andc $r0.9 = $r0.3, 0xff
;;
	c0    andc $r0.6 = $r0.3, 0xff
	c0    andc $r0.7 = $r0.3, 0xff
	c0    andc $r0.8 = $r0.3, 0xff
	c0    andc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andc $r0.6 = $r0.3, 0xff
	c0    andc $r0.7 = $r0.3, 0xff
	c0    andc $r0.8 = $r0.3, 0xdeadbef7
	c0    andc $r0.9 = $r0.3, 0xff
;;
	c0    andc $r0.6 = $r0.3, 0xff
	c0    andc $r0.7 = $r0.3, 0xff
	c0    andc $r0.8 = $r0.3, 0xdeadbef7
	c0    andc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andc $r0.6 = $r0.3, 0xff
	c0    andc $r0.7 = $r0.3, 0xdeadbef6
	c0    andc $r0.8 = $r0.3, 0xff
	c0    andc $r0.9 = $r0.3, 0xff
;;
	c0    andc $r0.6 = $r0.3, 0xff
	c0    andc $r0.7 = $r0.3, 0xdeadbef6
	c0    andc $r0.8 = $r0.3, 0xff
	c0    andc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andc $r0.6 = $r0.3, 0xff
	c0    andc $r0.7 = $r0.3, 0xdeadbef6
	c0    andc $r0.8 = $r0.3, 0xdeadbef7
	c0    andc $r0.9 = $r0.3, 0xff
;;
	c0    andc $r0.6 = $r0.3, 0xff
	c0    andc $r0.7 = $r0.3, 0xdeadbef6
	c0    andc $r0.8 = $r0.3, 0xdeadbef7
	c0    andc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andc $r0.6 = $r0.3, 0xdeadbef5
	c0    andc $r0.7 = $r0.3, 0xff
	c0    andc $r0.8 = $r0.3, 0xff
	c0    andc $r0.9 = $r0.3, 0xff
;;
	c0    andc $r0.6 = $r0.3, 0xdeadbef5
	c0    andc $r0.7 = $r0.3, 0xff
	c0    andc $r0.8 = $r0.3, 0xff
	c0    andc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andc $r0.6 = $r0.3, 0xdeadbef5
	c0    andc $r0.7 = $r0.3, 0xff
	c0    andc $r0.8 = $r0.3, 0xdeadbef7
	c0    andc $r0.9 = $r0.3, 0xff
;;
	c0    andc $r0.6 = $r0.3, 0xdeadbef5
	c0    andc $r0.7 = $r0.3, 0xff
	c0    andc $r0.8 = $r0.3, 0xdeadbef7
	c0    andc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andc $r0.6 = $r0.3, 0xdeadbef5
	c0    andc $r0.7 = $r0.3, 0xdeadbef6
	c0    andc $r0.8 = $r0.3, 0xff
	c0    andc $r0.9 = $r0.3, 0xff
;;
	c0    andc $r0.6 = $r0.3, 0xdeadbef5
	c0    andc $r0.7 = $r0.3, 0xdeadbef6
	c0    andc $r0.8 = $r0.3, 0xff
	c0    andc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andc $r0.6 = $r0.3, 0xdeadbef5
	c0    andc $r0.7 = $r0.3, 0xdeadbef6
	c0    andc $r0.8 = $r0.3, 0xdeadbef7
	c0    andc $r0.9 = $r0.3, 0xff
;;
	c0    andc $r0.6 = $r0.3, 0xdeadbef5
	c0    andc $r0.7 = $r0.3, 0xdeadbef6
	c0    andc $r0.8 = $r0.3, 0xdeadbef7
	c0    andc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    max $r0.6 = $r0.3, 0xff
	c0    max $r0.7 = $r0.3, 0xff
	c0    max $r0.8 = $r0.3, 0xff
	c0    max $r0.9 = $r0.3, 0xff
;;
	c0    max $r0.6 = $r0.3, 0xff
	c0    max $r0.7 = $r0.3, 0xff
	c0    max $r0.8 = $r0.3, 0xff
	c0    max $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    max $r0.6 = $r0.3, 0xff
	c0    max $r0.7 = $r0.3, 0xff
	c0    max $r0.8 = $r0.3, 0xdeadbef7
	c0    max $r0.9 = $r0.3, 0xff
;;
	c0    max $r0.6 = $r0.3, 0xff
	c0    max $r0.7 = $r0.3, 0xff
	c0    max $r0.8 = $r0.3, 0xdeadbef7
	c0    max $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    max $r0.6 = $r0.3, 0xff
	c0    max $r0.7 = $r0.3, 0xdeadbef6
	c0    max $r0.8 = $r0.3, 0xff
	c0    max $r0.9 = $r0.3, 0xff
;;
	c0    max $r0.6 = $r0.3, 0xff
	c0    max $r0.7 = $r0.3, 0xdeadbef6
	c0    max $r0.8 = $r0.3, 0xff
	c0    max $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    max $r0.6 = $r0.3, 0xff
	c0    max $r0.7 = $r0.3, 0xdeadbef6
	c0    max $r0.8 = $r0.3, 0xdeadbef7
	c0    max $r0.9 = $r0.3, 0xff
;;
	c0    max $r0.6 = $r0.3, 0xff
	c0    max $r0.7 = $r0.3, 0xdeadbef6
	c0    max $r0.8 = $r0.3, 0xdeadbef7
	c0    max $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    max $r0.6 = $r0.3, 0xdeadbef5
	c0    max $r0.7 = $r0.3, 0xff
	c0    max $r0.8 = $r0.3, 0xff
	c0    max $r0.9 = $r0.3, 0xff
;;
	c0    max $r0.6 = $r0.3, 0xdeadbef5
	c0    max $r0.7 = $r0.3, 0xff
	c0    max $r0.8 = $r0.3, 0xff
	c0    max $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    max $r0.6 = $r0.3, 0xdeadbef5
	c0    max $r0.7 = $r0.3, 0xff
	c0    max $r0.8 = $r0.3, 0xdeadbef7
	c0    max $r0.9 = $r0.3, 0xff
;;
	c0    max $r0.6 = $r0.3, 0xdeadbef5
	c0    max $r0.7 = $r0.3, 0xff
	c0    max $r0.8 = $r0.3, 0xdeadbef7
	c0    max $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    max $r0.6 = $r0.3, 0xdeadbef5
	c0    max $r0.7 = $r0.3, 0xdeadbef6
	c0    max $r0.8 = $r0.3, 0xff
	c0    max $r0.9 = $r0.3, 0xff
;;
	c0    max $r0.6 = $r0.3, 0xdeadbef5
	c0    max $r0.7 = $r0.3, 0xdeadbef6
	c0    max $r0.8 = $r0.3, 0xff
	c0    max $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    max $r0.6 = $r0.3, 0xdeadbef5
	c0    max $r0.7 = $r0.3, 0xdeadbef6
	c0    max $r0.8 = $r0.3, 0xdeadbef7
	c0    max $r0.9 = $r0.3, 0xff
;;
	c0    max $r0.6 = $r0.3, 0xdeadbef5
	c0    max $r0.7 = $r0.3, 0xdeadbef6
	c0    max $r0.8 = $r0.3, 0xdeadbef7
	c0    max $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    maxu $r0.6 = $r0.3, 0xff
	c0    maxu $r0.7 = $r0.3, 0xff
	c0    maxu $r0.8 = $r0.3, 0xff
	c0    maxu $r0.9 = $r0.3, 0xff
;;
	c0    maxu $r0.6 = $r0.3, 0xff
	c0    maxu $r0.7 = $r0.3, 0xff
	c0    maxu $r0.8 = $r0.3, 0xff
	c0    maxu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    maxu $r0.6 = $r0.3, 0xff
	c0    maxu $r0.7 = $r0.3, 0xff
	c0    maxu $r0.8 = $r0.3, 0xdeadbef7
	c0    maxu $r0.9 = $r0.3, 0xff
;;
	c0    maxu $r0.6 = $r0.3, 0xff
	c0    maxu $r0.7 = $r0.3, 0xff
	c0    maxu $r0.8 = $r0.3, 0xdeadbef7
	c0    maxu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    maxu $r0.6 = $r0.3, 0xff
	c0    maxu $r0.7 = $r0.3, 0xdeadbef6
	c0    maxu $r0.8 = $r0.3, 0xff
	c0    maxu $r0.9 = $r0.3, 0xff
;;
	c0    maxu $r0.6 = $r0.3, 0xff
	c0    maxu $r0.7 = $r0.3, 0xdeadbef6
	c0    maxu $r0.8 = $r0.3, 0xff
	c0    maxu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    maxu $r0.6 = $r0.3, 0xff
	c0    maxu $r0.7 = $r0.3, 0xdeadbef6
	c0    maxu $r0.8 = $r0.3, 0xdeadbef7
	c0    maxu $r0.9 = $r0.3, 0xff
;;
	c0    maxu $r0.6 = $r0.3, 0xff
	c0    maxu $r0.7 = $r0.3, 0xdeadbef6
	c0    maxu $r0.8 = $r0.3, 0xdeadbef7
	c0    maxu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    maxu $r0.6 = $r0.3, 0xdeadbef5
	c0    maxu $r0.7 = $r0.3, 0xff
	c0    maxu $r0.8 = $r0.3, 0xff
	c0    maxu $r0.9 = $r0.3, 0xff
;;
	c0    maxu $r0.6 = $r0.3, 0xdeadbef5
	c0    maxu $r0.7 = $r0.3, 0xff
	c0    maxu $r0.8 = $r0.3, 0xff
	c0    maxu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    maxu $r0.6 = $r0.3, 0xdeadbef5
	c0    maxu $r0.7 = $r0.3, 0xff
	c0    maxu $r0.8 = $r0.3, 0xdeadbef7
	c0    maxu $r0.9 = $r0.3, 0xff
;;
	c0    maxu $r0.6 = $r0.3, 0xdeadbef5
	c0    maxu $r0.7 = $r0.3, 0xff
	c0    maxu $r0.8 = $r0.3, 0xdeadbef7
	c0    maxu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    maxu $r0.6 = $r0.3, 0xdeadbef5
	c0    maxu $r0.7 = $r0.3, 0xdeadbef6
	c0    maxu $r0.8 = $r0.3, 0xff
	c0    maxu $r0.9 = $r0.3, 0xff
;;
	c0    maxu $r0.6 = $r0.3, 0xdeadbef5
	c0    maxu $r0.7 = $r0.3, 0xdeadbef6
	c0    maxu $r0.8 = $r0.3, 0xff
	c0    maxu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    maxu $r0.6 = $r0.3, 0xdeadbef5
	c0    maxu $r0.7 = $r0.3, 0xdeadbef6
	c0    maxu $r0.8 = $r0.3, 0xdeadbef7
	c0    maxu $r0.9 = $r0.3, 0xff
;;
	c0    maxu $r0.6 = $r0.3, 0xdeadbef5
	c0    maxu $r0.7 = $r0.3, 0xdeadbef6
	c0    maxu $r0.8 = $r0.3, 0xdeadbef7
	c0    maxu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    min $r0.6 = $r0.3, 0xff
	c0    min $r0.7 = $r0.3, 0xff
	c0    min $r0.8 = $r0.3, 0xff
	c0    min $r0.9 = $r0.3, 0xff
;;
	c0    min $r0.6 = $r0.3, 0xff
	c0    min $r0.7 = $r0.3, 0xff
	c0    min $r0.8 = $r0.3, 0xff
	c0    min $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    min $r0.6 = $r0.3, 0xff
	c0    min $r0.7 = $r0.3, 0xff
	c0    min $r0.8 = $r0.3, 0xdeadbef7
	c0    min $r0.9 = $r0.3, 0xff
;;
	c0    min $r0.6 = $r0.3, 0xff
	c0    min $r0.7 = $r0.3, 0xff
	c0    min $r0.8 = $r0.3, 0xdeadbef7
	c0    min $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    min $r0.6 = $r0.3, 0xff
	c0    min $r0.7 = $r0.3, 0xdeadbef6
	c0    min $r0.8 = $r0.3, 0xff
	c0    min $r0.9 = $r0.3, 0xff
;;
	c0    min $r0.6 = $r0.3, 0xff
	c0    min $r0.7 = $r0.3, 0xdeadbef6
	c0    min $r0.8 = $r0.3, 0xff
	c0    min $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    min $r0.6 = $r0.3, 0xff
	c0    min $r0.7 = $r0.3, 0xdeadbef6
	c0    min $r0.8 = $r0.3, 0xdeadbef7
	c0    min $r0.9 = $r0.3, 0xff
;;
	c0    min $r0.6 = $r0.3, 0xff
	c0    min $r0.7 = $r0.3, 0xdeadbef6
	c0    min $r0.8 = $r0.3, 0xdeadbef7
	c0    min $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    min $r0.6 = $r0.3, 0xdeadbef5
	c0    min $r0.7 = $r0.3, 0xff
	c0    min $r0.8 = $r0.3, 0xff
	c0    min $r0.9 = $r0.3, 0xff
;;
	c0    min $r0.6 = $r0.3, 0xdeadbef5
	c0    min $r0.7 = $r0.3, 0xff
	c0    min $r0.8 = $r0.3, 0xff
	c0    min $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    min $r0.6 = $r0.3, 0xdeadbef5
	c0    min $r0.7 = $r0.3, 0xff
	c0    min $r0.8 = $r0.3, 0xdeadbef7
	c0    min $r0.9 = $r0.3, 0xff
;;
	c0    min $r0.6 = $r0.3, 0xdeadbef5
	c0    min $r0.7 = $r0.3, 0xff
	c0    min $r0.8 = $r0.3, 0xdeadbef7
	c0    min $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    min $r0.6 = $r0.3, 0xdeadbef5
	c0    min $r0.7 = $r0.3, 0xdeadbef6
	c0    min $r0.8 = $r0.3, 0xff
	c0    min $r0.9 = $r0.3, 0xff
;;
	c0    min $r0.6 = $r0.3, 0xdeadbef5
	c0    min $r0.7 = $r0.3, 0xdeadbef6
	c0    min $r0.8 = $r0.3, 0xff
	c0    min $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    min $r0.6 = $r0.3, 0xdeadbef5
	c0    min $r0.7 = $r0.3, 0xdeadbef6
	c0    min $r0.8 = $r0.3, 0xdeadbef7
	c0    min $r0.9 = $r0.3, 0xff
;;
	c0    min $r0.6 = $r0.3, 0xdeadbef5
	c0    min $r0.7 = $r0.3, 0xdeadbef6
	c0    min $r0.8 = $r0.3, 0xdeadbef7
	c0    min $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    minu $r0.6 = $r0.3, 0xff
	c0    minu $r0.7 = $r0.3, 0xff
	c0    minu $r0.8 = $r0.3, 0xff
	c0    minu $r0.9 = $r0.3, 0xff
;;
	c0    minu $r0.6 = $r0.3, 0xff
	c0    minu $r0.7 = $r0.3, 0xff
	c0    minu $r0.8 = $r0.3, 0xff
	c0    minu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    minu $r0.6 = $r0.3, 0xff
	c0    minu $r0.7 = $r0.3, 0xff
	c0    minu $r0.8 = $r0.3, 0xdeadbef7
	c0    minu $r0.9 = $r0.3, 0xff
;;
	c0    minu $r0.6 = $r0.3, 0xff
	c0    minu $r0.7 = $r0.3, 0xff
	c0    minu $r0.8 = $r0.3, 0xdeadbef7
	c0    minu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    minu $r0.6 = $r0.3, 0xff
	c0    minu $r0.7 = $r0.3, 0xdeadbef6
	c0    minu $r0.8 = $r0.3, 0xff
	c0    minu $r0.9 = $r0.3, 0xff
;;
	c0    minu $r0.6 = $r0.3, 0xff
	c0    minu $r0.7 = $r0.3, 0xdeadbef6
	c0    minu $r0.8 = $r0.3, 0xff
	c0    minu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    minu $r0.6 = $r0.3, 0xff
	c0    minu $r0.7 = $r0.3, 0xdeadbef6
	c0    minu $r0.8 = $r0.3, 0xdeadbef7
	c0    minu $r0.9 = $r0.3, 0xff
;;
	c0    minu $r0.6 = $r0.3, 0xff
	c0    minu $r0.7 = $r0.3, 0xdeadbef6
	c0    minu $r0.8 = $r0.3, 0xdeadbef7
	c0    minu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    minu $r0.6 = $r0.3, 0xdeadbef5
	c0    minu $r0.7 = $r0.3, 0xff
	c0    minu $r0.8 = $r0.3, 0xff
	c0    minu $r0.9 = $r0.3, 0xff
;;
	c0    minu $r0.6 = $r0.3, 0xdeadbef5
	c0    minu $r0.7 = $r0.3, 0xff
	c0    minu $r0.8 = $r0.3, 0xff
	c0    minu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    minu $r0.6 = $r0.3, 0xdeadbef5
	c0    minu $r0.7 = $r0.3, 0xff
	c0    minu $r0.8 = $r0.3, 0xdeadbef7
	c0    minu $r0.9 = $r0.3, 0xff
;;
	c0    minu $r0.6 = $r0.3, 0xdeadbef5
	c0    minu $r0.7 = $r0.3, 0xff
	c0    minu $r0.8 = $r0.3, 0xdeadbef7
	c0    minu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    minu $r0.6 = $r0.3, 0xdeadbef5
	c0    minu $r0.7 = $r0.3, 0xdeadbef6
	c0    minu $r0.8 = $r0.3, 0xff
	c0    minu $r0.9 = $r0.3, 0xff
;;
	c0    minu $r0.6 = $r0.3, 0xdeadbef5
	c0    minu $r0.7 = $r0.3, 0xdeadbef6
	c0    minu $r0.8 = $r0.3, 0xff
	c0    minu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    minu $r0.6 = $r0.3, 0xdeadbef5
	c0    minu $r0.7 = $r0.3, 0xdeadbef6
	c0    minu $r0.8 = $r0.3, 0xdeadbef7
	c0    minu $r0.9 = $r0.3, 0xff
;;
	c0    minu $r0.6 = $r0.3, 0xdeadbef5
	c0    minu $r0.7 = $r0.3, 0xdeadbef6
	c0    minu $r0.8 = $r0.3, 0xdeadbef7
	c0    minu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    or $r0.6 = $r0.3, 0xff
	c0    or $r0.7 = $r0.3, 0xff
	c0    or $r0.8 = $r0.3, 0xff
	c0    or $r0.9 = $r0.3, 0xff
;;
	c0    or $r0.6 = $r0.3, 0xff
	c0    or $r0.7 = $r0.3, 0xff
	c0    or $r0.8 = $r0.3, 0xff
	c0    or $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    or $r0.6 = $r0.3, 0xff
	c0    or $r0.7 = $r0.3, 0xff
	c0    or $r0.8 = $r0.3, 0xdeadbef7
	c0    or $r0.9 = $r0.3, 0xff
;;
	c0    or $r0.6 = $r0.3, 0xff
	c0    or $r0.7 = $r0.3, 0xff
	c0    or $r0.8 = $r0.3, 0xdeadbef7
	c0    or $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    or $r0.6 = $r0.3, 0xff
	c0    or $r0.7 = $r0.3, 0xdeadbef6
	c0    or $r0.8 = $r0.3, 0xff
	c0    or $r0.9 = $r0.3, 0xff
;;
	c0    or $r0.6 = $r0.3, 0xff
	c0    or $r0.7 = $r0.3, 0xdeadbef6
	c0    or $r0.8 = $r0.3, 0xff
	c0    or $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    or $r0.6 = $r0.3, 0xff
	c0    or $r0.7 = $r0.3, 0xdeadbef6
	c0    or $r0.8 = $r0.3, 0xdeadbef7
	c0    or $r0.9 = $r0.3, 0xff
;;
	c0    or $r0.6 = $r0.3, 0xff
	c0    or $r0.7 = $r0.3, 0xdeadbef6
	c0    or $r0.8 = $r0.3, 0xdeadbef7
	c0    or $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    or $r0.6 = $r0.3, 0xdeadbef5
	c0    or $r0.7 = $r0.3, 0xff
	c0    or $r0.8 = $r0.3, 0xff
	c0    or $r0.9 = $r0.3, 0xff
;;
	c0    or $r0.6 = $r0.3, 0xdeadbef5
	c0    or $r0.7 = $r0.3, 0xff
	c0    or $r0.8 = $r0.3, 0xff
	c0    or $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    or $r0.6 = $r0.3, 0xdeadbef5
	c0    or $r0.7 = $r0.3, 0xff
	c0    or $r0.8 = $r0.3, 0xdeadbef7
	c0    or $r0.9 = $r0.3, 0xff
;;
	c0    or $r0.6 = $r0.3, 0xdeadbef5
	c0    or $r0.7 = $r0.3, 0xff
	c0    or $r0.8 = $r0.3, 0xdeadbef7
	c0    or $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    or $r0.6 = $r0.3, 0xdeadbef5
	c0    or $r0.7 = $r0.3, 0xdeadbef6
	c0    or $r0.8 = $r0.3, 0xff
	c0    or $r0.9 = $r0.3, 0xff
;;
	c0    or $r0.6 = $r0.3, 0xdeadbef5
	c0    or $r0.7 = $r0.3, 0xdeadbef6
	c0    or $r0.8 = $r0.3, 0xff
	c0    or $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    or $r0.6 = $r0.3, 0xdeadbef5
	c0    or $r0.7 = $r0.3, 0xdeadbef6
	c0    or $r0.8 = $r0.3, 0xdeadbef7
	c0    or $r0.9 = $r0.3, 0xff
;;
	c0    or $r0.6 = $r0.3, 0xdeadbef5
	c0    or $r0.7 = $r0.3, 0xdeadbef6
	c0    or $r0.8 = $r0.3, 0xdeadbef7
	c0    or $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orc $r0.6 = $r0.3, 0xff
	c0    orc $r0.7 = $r0.3, 0xff
	c0    orc $r0.8 = $r0.3, 0xff
	c0    orc $r0.9 = $r0.3, 0xff
;;
	c0    orc $r0.6 = $r0.3, 0xff
	c0    orc $r0.7 = $r0.3, 0xff
	c0    orc $r0.8 = $r0.3, 0xff
	c0    orc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orc $r0.6 = $r0.3, 0xff
	c0    orc $r0.7 = $r0.3, 0xff
	c0    orc $r0.8 = $r0.3, 0xdeadbef7
	c0    orc $r0.9 = $r0.3, 0xff
;;
	c0    orc $r0.6 = $r0.3, 0xff
	c0    orc $r0.7 = $r0.3, 0xff
	c0    orc $r0.8 = $r0.3, 0xdeadbef7
	c0    orc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orc $r0.6 = $r0.3, 0xff
	c0    orc $r0.7 = $r0.3, 0xdeadbef6
	c0    orc $r0.8 = $r0.3, 0xff
	c0    orc $r0.9 = $r0.3, 0xff
;;
	c0    orc $r0.6 = $r0.3, 0xff
	c0    orc $r0.7 = $r0.3, 0xdeadbef6
	c0    orc $r0.8 = $r0.3, 0xff
	c0    orc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orc $r0.6 = $r0.3, 0xff
	c0    orc $r0.7 = $r0.3, 0xdeadbef6
	c0    orc $r0.8 = $r0.3, 0xdeadbef7
	c0    orc $r0.9 = $r0.3, 0xff
;;
	c0    orc $r0.6 = $r0.3, 0xff
	c0    orc $r0.7 = $r0.3, 0xdeadbef6
	c0    orc $r0.8 = $r0.3, 0xdeadbef7
	c0    orc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orc $r0.6 = $r0.3, 0xdeadbef5
	c0    orc $r0.7 = $r0.3, 0xff
	c0    orc $r0.8 = $r0.3, 0xff
	c0    orc $r0.9 = $r0.3, 0xff
;;
	c0    orc $r0.6 = $r0.3, 0xdeadbef5
	c0    orc $r0.7 = $r0.3, 0xff
	c0    orc $r0.8 = $r0.3, 0xff
	c0    orc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orc $r0.6 = $r0.3, 0xdeadbef5
	c0    orc $r0.7 = $r0.3, 0xff
	c0    orc $r0.8 = $r0.3, 0xdeadbef7
	c0    orc $r0.9 = $r0.3, 0xff
;;
	c0    orc $r0.6 = $r0.3, 0xdeadbef5
	c0    orc $r0.7 = $r0.3, 0xff
	c0    orc $r0.8 = $r0.3, 0xdeadbef7
	c0    orc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orc $r0.6 = $r0.3, 0xdeadbef5
	c0    orc $r0.7 = $r0.3, 0xdeadbef6
	c0    orc $r0.8 = $r0.3, 0xff
	c0    orc $r0.9 = $r0.3, 0xff
;;
	c0    orc $r0.6 = $r0.3, 0xdeadbef5
	c0    orc $r0.7 = $r0.3, 0xdeadbef6
	c0    orc $r0.8 = $r0.3, 0xff
	c0    orc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orc $r0.6 = $r0.3, 0xdeadbef5
	c0    orc $r0.7 = $r0.3, 0xdeadbef6
	c0    orc $r0.8 = $r0.3, 0xdeadbef7
	c0    orc $r0.9 = $r0.3, 0xff
;;
	c0    orc $r0.6 = $r0.3, 0xdeadbef5
	c0    orc $r0.7 = $r0.3, 0xdeadbef6
	c0    orc $r0.8 = $r0.3, 0xdeadbef7
	c0    orc $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh1add $r0.6 = $r0.3, 0xff
	c0    sh1add $r0.7 = $r0.3, 0xff
	c0    sh1add $r0.8 = $r0.3, 0xff
	c0    sh1add $r0.9 = $r0.3, 0xff
;;
	c0    sh1add $r0.6 = $r0.3, 0xff
	c0    sh1add $r0.7 = $r0.3, 0xff
	c0    sh1add $r0.8 = $r0.3, 0xff
	c0    sh1add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh1add $r0.6 = $r0.3, 0xff
	c0    sh1add $r0.7 = $r0.3, 0xff
	c0    sh1add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh1add $r0.9 = $r0.3, 0xff
;;
	c0    sh1add $r0.6 = $r0.3, 0xff
	c0    sh1add $r0.7 = $r0.3, 0xff
	c0    sh1add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh1add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh1add $r0.6 = $r0.3, 0xff
	c0    sh1add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh1add $r0.8 = $r0.3, 0xff
	c0    sh1add $r0.9 = $r0.3, 0xff
;;
	c0    sh1add $r0.6 = $r0.3, 0xff
	c0    sh1add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh1add $r0.8 = $r0.3, 0xff
	c0    sh1add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh1add $r0.6 = $r0.3, 0xff
	c0    sh1add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh1add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh1add $r0.9 = $r0.3, 0xff
;;
	c0    sh1add $r0.6 = $r0.3, 0xff
	c0    sh1add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh1add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh1add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh1add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh1add $r0.7 = $r0.3, 0xff
	c0    sh1add $r0.8 = $r0.3, 0xff
	c0    sh1add $r0.9 = $r0.3, 0xff
;;
	c0    sh1add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh1add $r0.7 = $r0.3, 0xff
	c0    sh1add $r0.8 = $r0.3, 0xff
	c0    sh1add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh1add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh1add $r0.7 = $r0.3, 0xff
	c0    sh1add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh1add $r0.9 = $r0.3, 0xff
;;
	c0    sh1add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh1add $r0.7 = $r0.3, 0xff
	c0    sh1add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh1add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh1add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh1add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh1add $r0.8 = $r0.3, 0xff
	c0    sh1add $r0.9 = $r0.3, 0xff
;;
	c0    sh1add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh1add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh1add $r0.8 = $r0.3, 0xff
	c0    sh1add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh1add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh1add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh1add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh1add $r0.9 = $r0.3, 0xff
;;
	c0    sh1add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh1add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh1add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh1add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh2add $r0.6 = $r0.3, 0xff
	c0    sh2add $r0.7 = $r0.3, 0xff
	c0    sh2add $r0.8 = $r0.3, 0xff
	c0    sh2add $r0.9 = $r0.3, 0xff
;;
	c0    sh2add $r0.6 = $r0.3, 0xff
	c0    sh2add $r0.7 = $r0.3, 0xff
	c0    sh2add $r0.8 = $r0.3, 0xff
	c0    sh2add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh2add $r0.6 = $r0.3, 0xff
	c0    sh2add $r0.7 = $r0.3, 0xff
	c0    sh2add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh2add $r0.9 = $r0.3, 0xff
;;
	c0    sh2add $r0.6 = $r0.3, 0xff
	c0    sh2add $r0.7 = $r0.3, 0xff
	c0    sh2add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh2add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh2add $r0.6 = $r0.3, 0xff
	c0    sh2add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh2add $r0.8 = $r0.3, 0xff
	c0    sh2add $r0.9 = $r0.3, 0xff
;;
	c0    sh2add $r0.6 = $r0.3, 0xff
	c0    sh2add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh2add $r0.8 = $r0.3, 0xff
	c0    sh2add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh2add $r0.6 = $r0.3, 0xff
	c0    sh2add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh2add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh2add $r0.9 = $r0.3, 0xff
;;
	c0    sh2add $r0.6 = $r0.3, 0xff
	c0    sh2add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh2add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh2add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh2add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh2add $r0.7 = $r0.3, 0xff
	c0    sh2add $r0.8 = $r0.3, 0xff
	c0    sh2add $r0.9 = $r0.3, 0xff
;;
	c0    sh2add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh2add $r0.7 = $r0.3, 0xff
	c0    sh2add $r0.8 = $r0.3, 0xff
	c0    sh2add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh2add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh2add $r0.7 = $r0.3, 0xff
	c0    sh2add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh2add $r0.9 = $r0.3, 0xff
;;
	c0    sh2add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh2add $r0.7 = $r0.3, 0xff
	c0    sh2add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh2add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh2add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh2add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh2add $r0.8 = $r0.3, 0xff
	c0    sh2add $r0.9 = $r0.3, 0xff
;;
	c0    sh2add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh2add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh2add $r0.8 = $r0.3, 0xff
	c0    sh2add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh2add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh2add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh2add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh2add $r0.9 = $r0.3, 0xff
;;
	c0    sh2add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh2add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh2add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh2add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh3add $r0.6 = $r0.3, 0xff
	c0    sh3add $r0.7 = $r0.3, 0xff
	c0    sh3add $r0.8 = $r0.3, 0xff
	c0    sh3add $r0.9 = $r0.3, 0xff
;;
	c0    sh3add $r0.6 = $r0.3, 0xff
	c0    sh3add $r0.7 = $r0.3, 0xff
	c0    sh3add $r0.8 = $r0.3, 0xff
	c0    sh3add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh3add $r0.6 = $r0.3, 0xff
	c0    sh3add $r0.7 = $r0.3, 0xff
	c0    sh3add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh3add $r0.9 = $r0.3, 0xff
;;
	c0    sh3add $r0.6 = $r0.3, 0xff
	c0    sh3add $r0.7 = $r0.3, 0xff
	c0    sh3add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh3add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh3add $r0.6 = $r0.3, 0xff
	c0    sh3add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh3add $r0.8 = $r0.3, 0xff
	c0    sh3add $r0.9 = $r0.3, 0xff
;;
	c0    sh3add $r0.6 = $r0.3, 0xff
	c0    sh3add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh3add $r0.8 = $r0.3, 0xff
	c0    sh3add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh3add $r0.6 = $r0.3, 0xff
	c0    sh3add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh3add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh3add $r0.9 = $r0.3, 0xff
;;
	c0    sh3add $r0.6 = $r0.3, 0xff
	c0    sh3add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh3add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh3add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh3add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh3add $r0.7 = $r0.3, 0xff
	c0    sh3add $r0.8 = $r0.3, 0xff
	c0    sh3add $r0.9 = $r0.3, 0xff
;;
	c0    sh3add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh3add $r0.7 = $r0.3, 0xff
	c0    sh3add $r0.8 = $r0.3, 0xff
	c0    sh3add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh3add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh3add $r0.7 = $r0.3, 0xff
	c0    sh3add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh3add $r0.9 = $r0.3, 0xff
;;
	c0    sh3add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh3add $r0.7 = $r0.3, 0xff
	c0    sh3add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh3add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh3add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh3add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh3add $r0.8 = $r0.3, 0xff
	c0    sh3add $r0.9 = $r0.3, 0xff
;;
	c0    sh3add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh3add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh3add $r0.8 = $r0.3, 0xff
	c0    sh3add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh3add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh3add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh3add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh3add $r0.9 = $r0.3, 0xff
;;
	c0    sh3add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh3add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh3add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh3add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh4add $r0.6 = $r0.3, 0xff
	c0    sh4add $r0.7 = $r0.3, 0xff
	c0    sh4add $r0.8 = $r0.3, 0xff
	c0    sh4add $r0.9 = $r0.3, 0xff
;;
	c0    sh4add $r0.6 = $r0.3, 0xff
	c0    sh4add $r0.7 = $r0.3, 0xff
	c0    sh4add $r0.8 = $r0.3, 0xff
	c0    sh4add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh4add $r0.6 = $r0.3, 0xff
	c0    sh4add $r0.7 = $r0.3, 0xff
	c0    sh4add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh4add $r0.9 = $r0.3, 0xff
;;
	c0    sh4add $r0.6 = $r0.3, 0xff
	c0    sh4add $r0.7 = $r0.3, 0xff
	c0    sh4add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh4add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh4add $r0.6 = $r0.3, 0xff
	c0    sh4add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh4add $r0.8 = $r0.3, 0xff
	c0    sh4add $r0.9 = $r0.3, 0xff
;;
	c0    sh4add $r0.6 = $r0.3, 0xff
	c0    sh4add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh4add $r0.8 = $r0.3, 0xff
	c0    sh4add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh4add $r0.6 = $r0.3, 0xff
	c0    sh4add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh4add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh4add $r0.9 = $r0.3, 0xff
;;
	c0    sh4add $r0.6 = $r0.3, 0xff
	c0    sh4add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh4add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh4add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh4add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh4add $r0.7 = $r0.3, 0xff
	c0    sh4add $r0.8 = $r0.3, 0xff
	c0    sh4add $r0.9 = $r0.3, 0xff
;;
	c0    sh4add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh4add $r0.7 = $r0.3, 0xff
	c0    sh4add $r0.8 = $r0.3, 0xff
	c0    sh4add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh4add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh4add $r0.7 = $r0.3, 0xff
	c0    sh4add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh4add $r0.9 = $r0.3, 0xff
;;
	c0    sh4add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh4add $r0.7 = $r0.3, 0xff
	c0    sh4add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh4add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh4add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh4add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh4add $r0.8 = $r0.3, 0xff
	c0    sh4add $r0.9 = $r0.3, 0xff
;;
	c0    sh4add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh4add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh4add $r0.8 = $r0.3, 0xff
	c0    sh4add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sh4add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh4add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh4add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh4add $r0.9 = $r0.3, 0xff
;;
	c0    sh4add $r0.6 = $r0.3, 0xdeadbef5
	c0    sh4add $r0.7 = $r0.3, 0xdeadbef6
	c0    sh4add $r0.8 = $r0.3, 0xdeadbef7
	c0    sh4add $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shl $r0.6 = $r0.3, 0xff
	c0    shl $r0.7 = $r0.3, 0xff
	c0    shl $r0.8 = $r0.3, 0xff
	c0    shl $r0.9 = $r0.3, 0xff
;;
	c0    shl $r0.6 = $r0.3, 0xff
	c0    shl $r0.7 = $r0.3, 0xff
	c0    shl $r0.8 = $r0.3, 0xff
	c0    shl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shl $r0.6 = $r0.3, 0xff
	c0    shl $r0.7 = $r0.3, 0xff
	c0    shl $r0.8 = $r0.3, 0xdeadbef7
	c0    shl $r0.9 = $r0.3, 0xff
;;
	c0    shl $r0.6 = $r0.3, 0xff
	c0    shl $r0.7 = $r0.3, 0xff
	c0    shl $r0.8 = $r0.3, 0xdeadbef7
	c0    shl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shl $r0.6 = $r0.3, 0xff
	c0    shl $r0.7 = $r0.3, 0xdeadbef6
	c0    shl $r0.8 = $r0.3, 0xff
	c0    shl $r0.9 = $r0.3, 0xff
;;
	c0    shl $r0.6 = $r0.3, 0xff
	c0    shl $r0.7 = $r0.3, 0xdeadbef6
	c0    shl $r0.8 = $r0.3, 0xff
	c0    shl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shl $r0.6 = $r0.3, 0xff
	c0    shl $r0.7 = $r0.3, 0xdeadbef6
	c0    shl $r0.8 = $r0.3, 0xdeadbef7
	c0    shl $r0.9 = $r0.3, 0xff
;;
	c0    shl $r0.6 = $r0.3, 0xff
	c0    shl $r0.7 = $r0.3, 0xdeadbef6
	c0    shl $r0.8 = $r0.3, 0xdeadbef7
	c0    shl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shl $r0.6 = $r0.3, 0xdeadbef5
	c0    shl $r0.7 = $r0.3, 0xff
	c0    shl $r0.8 = $r0.3, 0xff
	c0    shl $r0.9 = $r0.3, 0xff
;;
	c0    shl $r0.6 = $r0.3, 0xdeadbef5
	c0    shl $r0.7 = $r0.3, 0xff
	c0    shl $r0.8 = $r0.3, 0xff
	c0    shl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shl $r0.6 = $r0.3, 0xdeadbef5
	c0    shl $r0.7 = $r0.3, 0xff
	c0    shl $r0.8 = $r0.3, 0xdeadbef7
	c0    shl $r0.9 = $r0.3, 0xff
;;
	c0    shl $r0.6 = $r0.3, 0xdeadbef5
	c0    shl $r0.7 = $r0.3, 0xff
	c0    shl $r0.8 = $r0.3, 0xdeadbef7
	c0    shl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shl $r0.6 = $r0.3, 0xdeadbef5
	c0    shl $r0.7 = $r0.3, 0xdeadbef6
	c0    shl $r0.8 = $r0.3, 0xff
	c0    shl $r0.9 = $r0.3, 0xff
;;
	c0    shl $r0.6 = $r0.3, 0xdeadbef5
	c0    shl $r0.7 = $r0.3, 0xdeadbef6
	c0    shl $r0.8 = $r0.3, 0xff
	c0    shl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shl $r0.6 = $r0.3, 0xdeadbef5
	c0    shl $r0.7 = $r0.3, 0xdeadbef6
	c0    shl $r0.8 = $r0.3, 0xdeadbef7
	c0    shl $r0.9 = $r0.3, 0xff
;;
	c0    shl $r0.6 = $r0.3, 0xdeadbef5
	c0    shl $r0.7 = $r0.3, 0xdeadbef6
	c0    shl $r0.8 = $r0.3, 0xdeadbef7
	c0    shl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shr $r0.6 = $r0.3, 0xff
	c0    shr $r0.7 = $r0.3, 0xff
	c0    shr $r0.8 = $r0.3, 0xff
	c0    shr $r0.9 = $r0.3, 0xff
;;
	c0    shr $r0.6 = $r0.3, 0xff
	c0    shr $r0.7 = $r0.3, 0xff
	c0    shr $r0.8 = $r0.3, 0xff
	c0    shr $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shr $r0.6 = $r0.3, 0xff
	c0    shr $r0.7 = $r0.3, 0xff
	c0    shr $r0.8 = $r0.3, 0xdeadbef7
	c0    shr $r0.9 = $r0.3, 0xff
;;
	c0    shr $r0.6 = $r0.3, 0xff
	c0    shr $r0.7 = $r0.3, 0xff
	c0    shr $r0.8 = $r0.3, 0xdeadbef7
	c0    shr $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shr $r0.6 = $r0.3, 0xff
	c0    shr $r0.7 = $r0.3, 0xdeadbef6
	c0    shr $r0.8 = $r0.3, 0xff
	c0    shr $r0.9 = $r0.3, 0xff
;;
	c0    shr $r0.6 = $r0.3, 0xff
	c0    shr $r0.7 = $r0.3, 0xdeadbef6
	c0    shr $r0.8 = $r0.3, 0xff
	c0    shr $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shr $r0.6 = $r0.3, 0xff
	c0    shr $r0.7 = $r0.3, 0xdeadbef6
	c0    shr $r0.8 = $r0.3, 0xdeadbef7
	c0    shr $r0.9 = $r0.3, 0xff
;;
	c0    shr $r0.6 = $r0.3, 0xff
	c0    shr $r0.7 = $r0.3, 0xdeadbef6
	c0    shr $r0.8 = $r0.3, 0xdeadbef7
	c0    shr $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shr $r0.6 = $r0.3, 0xdeadbef5
	c0    shr $r0.7 = $r0.3, 0xff
	c0    shr $r0.8 = $r0.3, 0xff
	c0    shr $r0.9 = $r0.3, 0xff
;;
	c0    shr $r0.6 = $r0.3, 0xdeadbef5
	c0    shr $r0.7 = $r0.3, 0xff
	c0    shr $r0.8 = $r0.3, 0xff
	c0    shr $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shr $r0.6 = $r0.3, 0xdeadbef5
	c0    shr $r0.7 = $r0.3, 0xff
	c0    shr $r0.8 = $r0.3, 0xdeadbef7
	c0    shr $r0.9 = $r0.3, 0xff
;;
	c0    shr $r0.6 = $r0.3, 0xdeadbef5
	c0    shr $r0.7 = $r0.3, 0xff
	c0    shr $r0.8 = $r0.3, 0xdeadbef7
	c0    shr $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shr $r0.6 = $r0.3, 0xdeadbef5
	c0    shr $r0.7 = $r0.3, 0xdeadbef6
	c0    shr $r0.8 = $r0.3, 0xff
	c0    shr $r0.9 = $r0.3, 0xff
;;
	c0    shr $r0.6 = $r0.3, 0xdeadbef5
	c0    shr $r0.7 = $r0.3, 0xdeadbef6
	c0    shr $r0.8 = $r0.3, 0xff
	c0    shr $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shr $r0.6 = $r0.3, 0xdeadbef5
	c0    shr $r0.7 = $r0.3, 0xdeadbef6
	c0    shr $r0.8 = $r0.3, 0xdeadbef7
	c0    shr $r0.9 = $r0.3, 0xff
;;
	c0    shr $r0.6 = $r0.3, 0xdeadbef5
	c0    shr $r0.7 = $r0.3, 0xdeadbef6
	c0    shr $r0.8 = $r0.3, 0xdeadbef7
	c0    shr $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shru $r0.6 = $r0.3, 0xff
	c0    shru $r0.7 = $r0.3, 0xff
	c0    shru $r0.8 = $r0.3, 0xff
	c0    shru $r0.9 = $r0.3, 0xff
;;
	c0    shru $r0.6 = $r0.3, 0xff
	c0    shru $r0.7 = $r0.3, 0xff
	c0    shru $r0.8 = $r0.3, 0xff
	c0    shru $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shru $r0.6 = $r0.3, 0xff
	c0    shru $r0.7 = $r0.3, 0xff
	c0    shru $r0.8 = $r0.3, 0xdeadbef7
	c0    shru $r0.9 = $r0.3, 0xff
;;
	c0    shru $r0.6 = $r0.3, 0xff
	c0    shru $r0.7 = $r0.3, 0xff
	c0    shru $r0.8 = $r0.3, 0xdeadbef7
	c0    shru $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shru $r0.6 = $r0.3, 0xff
	c0    shru $r0.7 = $r0.3, 0xdeadbef6
	c0    shru $r0.8 = $r0.3, 0xff
	c0    shru $r0.9 = $r0.3, 0xff
;;
	c0    shru $r0.6 = $r0.3, 0xff
	c0    shru $r0.7 = $r0.3, 0xdeadbef6
	c0    shru $r0.8 = $r0.3, 0xff
	c0    shru $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shru $r0.6 = $r0.3, 0xff
	c0    shru $r0.7 = $r0.3, 0xdeadbef6
	c0    shru $r0.8 = $r0.3, 0xdeadbef7
	c0    shru $r0.9 = $r0.3, 0xff
;;
	c0    shru $r0.6 = $r0.3, 0xff
	c0    shru $r0.7 = $r0.3, 0xdeadbef6
	c0    shru $r0.8 = $r0.3, 0xdeadbef7
	c0    shru $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shru $r0.6 = $r0.3, 0xdeadbef5
	c0    shru $r0.7 = $r0.3, 0xff
	c0    shru $r0.8 = $r0.3, 0xff
	c0    shru $r0.9 = $r0.3, 0xff
;;
	c0    shru $r0.6 = $r0.3, 0xdeadbef5
	c0    shru $r0.7 = $r0.3, 0xff
	c0    shru $r0.8 = $r0.3, 0xff
	c0    shru $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shru $r0.6 = $r0.3, 0xdeadbef5
	c0    shru $r0.7 = $r0.3, 0xff
	c0    shru $r0.8 = $r0.3, 0xdeadbef7
	c0    shru $r0.9 = $r0.3, 0xff
;;
	c0    shru $r0.6 = $r0.3, 0xdeadbef5
	c0    shru $r0.7 = $r0.3, 0xff
	c0    shru $r0.8 = $r0.3, 0xdeadbef7
	c0    shru $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shru $r0.6 = $r0.3, 0xdeadbef5
	c0    shru $r0.7 = $r0.3, 0xdeadbef6
	c0    shru $r0.8 = $r0.3, 0xff
	c0    shru $r0.9 = $r0.3, 0xff
;;
	c0    shru $r0.6 = $r0.3, 0xdeadbef5
	c0    shru $r0.7 = $r0.3, 0xdeadbef6
	c0    shru $r0.8 = $r0.3, 0xff
	c0    shru $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    shru $r0.6 = $r0.3, 0xdeadbef5
	c0    shru $r0.7 = $r0.3, 0xdeadbef6
	c0    shru $r0.8 = $r0.3, 0xdeadbef7
	c0    shru $r0.9 = $r0.3, 0xff
;;
	c0    shru $r0.6 = $r0.3, 0xdeadbef5
	c0    shru $r0.7 = $r0.3, 0xdeadbef6
	c0    shru $r0.8 = $r0.3, 0xdeadbef7
	c0    shru $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sub $r0.6 = $r0.3, 0xff
	c0    sub $r0.7 = $r0.3, 0xff
	c0    sub $r0.8 = $r0.3, 0xff
	c0    sub $r0.9 = $r0.3, 0xff
;;
	c0    sub $r0.6 = $r0.3, 0xff
	c0    sub $r0.7 = $r0.3, 0xff
	c0    sub $r0.8 = $r0.3, 0xff
	c0    sub $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sub $r0.6 = $r0.3, 0xff
	c0    sub $r0.7 = $r0.3, 0xff
	c0    sub $r0.8 = $r0.3, 0xdeadbef7
	c0    sub $r0.9 = $r0.3, 0xff
;;
	c0    sub $r0.6 = $r0.3, 0xff
	c0    sub $r0.7 = $r0.3, 0xff
	c0    sub $r0.8 = $r0.3, 0xdeadbef7
	c0    sub $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sub $r0.6 = $r0.3, 0xff
	c0    sub $r0.7 = $r0.3, 0xdeadbef6
	c0    sub $r0.8 = $r0.3, 0xff
	c0    sub $r0.9 = $r0.3, 0xff
;;
	c0    sub $r0.6 = $r0.3, 0xff
	c0    sub $r0.7 = $r0.3, 0xdeadbef6
	c0    sub $r0.8 = $r0.3, 0xff
	c0    sub $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sub $r0.6 = $r0.3, 0xff
	c0    sub $r0.7 = $r0.3, 0xdeadbef6
	c0    sub $r0.8 = $r0.3, 0xdeadbef7
	c0    sub $r0.9 = $r0.3, 0xff
;;
	c0    sub $r0.6 = $r0.3, 0xff
	c0    sub $r0.7 = $r0.3, 0xdeadbef6
	c0    sub $r0.8 = $r0.3, 0xdeadbef7
	c0    sub $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sub $r0.6 = $r0.3, 0xdeadbef5
	c0    sub $r0.7 = $r0.3, 0xff
	c0    sub $r0.8 = $r0.3, 0xff
	c0    sub $r0.9 = $r0.3, 0xff
;;
	c0    sub $r0.6 = $r0.3, 0xdeadbef5
	c0    sub $r0.7 = $r0.3, 0xff
	c0    sub $r0.8 = $r0.3, 0xff
	c0    sub $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sub $r0.6 = $r0.3, 0xdeadbef5
	c0    sub $r0.7 = $r0.3, 0xff
	c0    sub $r0.8 = $r0.3, 0xdeadbef7
	c0    sub $r0.9 = $r0.3, 0xff
;;
	c0    sub $r0.6 = $r0.3, 0xdeadbef5
	c0    sub $r0.7 = $r0.3, 0xff
	c0    sub $r0.8 = $r0.3, 0xdeadbef7
	c0    sub $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sub $r0.6 = $r0.3, 0xdeadbef5
	c0    sub $r0.7 = $r0.3, 0xdeadbef6
	c0    sub $r0.8 = $r0.3, 0xff
	c0    sub $r0.9 = $r0.3, 0xff
;;
	c0    sub $r0.6 = $r0.3, 0xdeadbef5
	c0    sub $r0.7 = $r0.3, 0xdeadbef6
	c0    sub $r0.8 = $r0.3, 0xff
	c0    sub $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    sub $r0.6 = $r0.3, 0xdeadbef5
	c0    sub $r0.7 = $r0.3, 0xdeadbef6
	c0    sub $r0.8 = $r0.3, 0xdeadbef7
	c0    sub $r0.9 = $r0.3, 0xff
;;
	c0    sub $r0.6 = $r0.3, 0xdeadbef5
	c0    sub $r0.7 = $r0.3, 0xdeadbef6
	c0    sub $r0.8 = $r0.3, 0xdeadbef7
	c0    sub $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    xor $r0.6 = $r0.3, 0xff
	c0    xor $r0.7 = $r0.3, 0xff
	c0    xor $r0.8 = $r0.3, 0xff
	c0    xor $r0.9 = $r0.3, 0xff
;;
	c0    xor $r0.6 = $r0.3, 0xff
	c0    xor $r0.7 = $r0.3, 0xff
	c0    xor $r0.8 = $r0.3, 0xff
	c0    xor $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    xor $r0.6 = $r0.3, 0xff
	c0    xor $r0.7 = $r0.3, 0xff
	c0    xor $r0.8 = $r0.3, 0xdeadbef7
	c0    xor $r0.9 = $r0.3, 0xff
;;
	c0    xor $r0.6 = $r0.3, 0xff
	c0    xor $r0.7 = $r0.3, 0xff
	c0    xor $r0.8 = $r0.3, 0xdeadbef7
	c0    xor $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    xor $r0.6 = $r0.3, 0xff
	c0    xor $r0.7 = $r0.3, 0xdeadbef6
	c0    xor $r0.8 = $r0.3, 0xff
	c0    xor $r0.9 = $r0.3, 0xff
;;
	c0    xor $r0.6 = $r0.3, 0xff
	c0    xor $r0.7 = $r0.3, 0xdeadbef6
	c0    xor $r0.8 = $r0.3, 0xff
	c0    xor $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    xor $r0.6 = $r0.3, 0xff
	c0    xor $r0.7 = $r0.3, 0xdeadbef6
	c0    xor $r0.8 = $r0.3, 0xdeadbef7
	c0    xor $r0.9 = $r0.3, 0xff
;;
	c0    xor $r0.6 = $r0.3, 0xff
	c0    xor $r0.7 = $r0.3, 0xdeadbef6
	c0    xor $r0.8 = $r0.3, 0xdeadbef7
	c0    xor $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    xor $r0.6 = $r0.3, 0xdeadbef5
	c0    xor $r0.7 = $r0.3, 0xff
	c0    xor $r0.8 = $r0.3, 0xff
	c0    xor $r0.9 = $r0.3, 0xff
;;
	c0    xor $r0.6 = $r0.3, 0xdeadbef5
	c0    xor $r0.7 = $r0.3, 0xff
	c0    xor $r0.8 = $r0.3, 0xff
	c0    xor $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    xor $r0.6 = $r0.3, 0xdeadbef5
	c0    xor $r0.7 = $r0.3, 0xff
	c0    xor $r0.8 = $r0.3, 0xdeadbef7
	c0    xor $r0.9 = $r0.3, 0xff
;;
	c0    xor $r0.6 = $r0.3, 0xdeadbef5
	c0    xor $r0.7 = $r0.3, 0xff
	c0    xor $r0.8 = $r0.3, 0xdeadbef7
	c0    xor $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    xor $r0.6 = $r0.3, 0xdeadbef5
	c0    xor $r0.7 = $r0.3, 0xdeadbef6
	c0    xor $r0.8 = $r0.3, 0xff
	c0    xor $r0.9 = $r0.3, 0xff
;;
	c0    xor $r0.6 = $r0.3, 0xdeadbef5
	c0    xor $r0.7 = $r0.3, 0xdeadbef6
	c0    xor $r0.8 = $r0.3, 0xff
	c0    xor $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    xor $r0.6 = $r0.3, 0xdeadbef5
	c0    xor $r0.7 = $r0.3, 0xdeadbef6
	c0    xor $r0.8 = $r0.3, 0xdeadbef7
	c0    xor $r0.9 = $r0.3, 0xff
;;
	c0    xor $r0.6 = $r0.3, 0xdeadbef5
	c0    xor $r0.7 = $r0.3, 0xdeadbef6
	c0    xor $r0.8 = $r0.3, 0xdeadbef7
	c0    xor $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyll $r0.6 = $r0.3, 0xff
	c0    mpyll $r0.7 = $r0.3, 0xff
	c0    mpyll $r0.8 = $r0.3, 0xff
	c0    mpyll $r0.9 = $r0.3, 0xff
;;
	c0    mpyll $r0.6 = $r0.3, 0xff
	c0    mpyll $r0.7 = $r0.3, 0xff
	c0    mpyll $r0.8 = $r0.3, 0xff
	c0    mpyll $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyll $r0.6 = $r0.3, 0xff
	c0    mpyll $r0.7 = $r0.3, 0xff
	c0    mpyll $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyll $r0.9 = $r0.3, 0xff
;;
	c0    mpyll $r0.6 = $r0.3, 0xff
	c0    mpyll $r0.7 = $r0.3, 0xff
	c0    mpyll $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyll $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyll $r0.6 = $r0.3, 0xff
	c0    mpyll $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyll $r0.8 = $r0.3, 0xff
	c0    mpyll $r0.9 = $r0.3, 0xff
;;
	c0    mpyll $r0.6 = $r0.3, 0xff
	c0    mpyll $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyll $r0.8 = $r0.3, 0xff
	c0    mpyll $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyll $r0.6 = $r0.3, 0xff
	c0    mpyll $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyll $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyll $r0.9 = $r0.3, 0xff
;;
	c0    mpyll $r0.6 = $r0.3, 0xff
	c0    mpyll $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyll $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyll $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyll $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyll $r0.7 = $r0.3, 0xff
	c0    mpyll $r0.8 = $r0.3, 0xff
	c0    mpyll $r0.9 = $r0.3, 0xff
;;
	c0    mpyll $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyll $r0.7 = $r0.3, 0xff
	c0    mpyll $r0.8 = $r0.3, 0xff
	c0    mpyll $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyll $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyll $r0.7 = $r0.3, 0xff
	c0    mpyll $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyll $r0.9 = $r0.3, 0xff
;;
	c0    mpyll $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyll $r0.7 = $r0.3, 0xff
	c0    mpyll $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyll $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyll $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyll $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyll $r0.8 = $r0.3, 0xff
	c0    mpyll $r0.9 = $r0.3, 0xff
;;
	c0    mpyll $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyll $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyll $r0.8 = $r0.3, 0xff
	c0    mpyll $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyll $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyll $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyll $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyll $r0.9 = $r0.3, 0xff
;;
	c0    mpyll $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyll $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyll $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyll $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyllu $r0.6 = $r0.3, 0xff
	c0    mpyllu $r0.7 = $r0.3, 0xff
	c0    mpyllu $r0.8 = $r0.3, 0xff
	c0    mpyllu $r0.9 = $r0.3, 0xff
;;
	c0    mpyllu $r0.6 = $r0.3, 0xff
	c0    mpyllu $r0.7 = $r0.3, 0xff
	c0    mpyllu $r0.8 = $r0.3, 0xff
	c0    mpyllu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyllu $r0.6 = $r0.3, 0xff
	c0    mpyllu $r0.7 = $r0.3, 0xff
	c0    mpyllu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyllu $r0.9 = $r0.3, 0xff
;;
	c0    mpyllu $r0.6 = $r0.3, 0xff
	c0    mpyllu $r0.7 = $r0.3, 0xff
	c0    mpyllu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyllu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyllu $r0.6 = $r0.3, 0xff
	c0    mpyllu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyllu $r0.8 = $r0.3, 0xff
	c0    mpyllu $r0.9 = $r0.3, 0xff
;;
	c0    mpyllu $r0.6 = $r0.3, 0xff
	c0    mpyllu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyllu $r0.8 = $r0.3, 0xff
	c0    mpyllu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyllu $r0.6 = $r0.3, 0xff
	c0    mpyllu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyllu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyllu $r0.9 = $r0.3, 0xff
;;
	c0    mpyllu $r0.6 = $r0.3, 0xff
	c0    mpyllu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyllu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyllu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyllu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyllu $r0.7 = $r0.3, 0xff
	c0    mpyllu $r0.8 = $r0.3, 0xff
	c0    mpyllu $r0.9 = $r0.3, 0xff
;;
	c0    mpyllu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyllu $r0.7 = $r0.3, 0xff
	c0    mpyllu $r0.8 = $r0.3, 0xff
	c0    mpyllu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyllu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyllu $r0.7 = $r0.3, 0xff
	c0    mpyllu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyllu $r0.9 = $r0.3, 0xff
;;
	c0    mpyllu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyllu $r0.7 = $r0.3, 0xff
	c0    mpyllu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyllu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyllu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyllu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyllu $r0.8 = $r0.3, 0xff
	c0    mpyllu $r0.9 = $r0.3, 0xff
;;
	c0    mpyllu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyllu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyllu $r0.8 = $r0.3, 0xff
	c0    mpyllu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyllu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyllu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyllu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyllu $r0.9 = $r0.3, 0xff
;;
	c0    mpyllu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyllu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyllu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyllu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylh $r0.6 = $r0.3, 0xff
	c0    mpylh $r0.7 = $r0.3, 0xff
	c0    mpylh $r0.8 = $r0.3, 0xff
	c0    mpylh $r0.9 = $r0.3, 0xff
;;
	c0    mpylh $r0.6 = $r0.3, 0xff
	c0    mpylh $r0.7 = $r0.3, 0xff
	c0    mpylh $r0.8 = $r0.3, 0xff
	c0    mpylh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylh $r0.6 = $r0.3, 0xff
	c0    mpylh $r0.7 = $r0.3, 0xff
	c0    mpylh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylh $r0.9 = $r0.3, 0xff
;;
	c0    mpylh $r0.6 = $r0.3, 0xff
	c0    mpylh $r0.7 = $r0.3, 0xff
	c0    mpylh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylh $r0.6 = $r0.3, 0xff
	c0    mpylh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylh $r0.8 = $r0.3, 0xff
	c0    mpylh $r0.9 = $r0.3, 0xff
;;
	c0    mpylh $r0.6 = $r0.3, 0xff
	c0    mpylh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylh $r0.8 = $r0.3, 0xff
	c0    mpylh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylh $r0.6 = $r0.3, 0xff
	c0    mpylh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylh $r0.9 = $r0.3, 0xff
;;
	c0    mpylh $r0.6 = $r0.3, 0xff
	c0    mpylh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylh $r0.7 = $r0.3, 0xff
	c0    mpylh $r0.8 = $r0.3, 0xff
	c0    mpylh $r0.9 = $r0.3, 0xff
;;
	c0    mpylh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylh $r0.7 = $r0.3, 0xff
	c0    mpylh $r0.8 = $r0.3, 0xff
	c0    mpylh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylh $r0.7 = $r0.3, 0xff
	c0    mpylh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylh $r0.9 = $r0.3, 0xff
;;
	c0    mpylh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylh $r0.7 = $r0.3, 0xff
	c0    mpylh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylh $r0.8 = $r0.3, 0xff
	c0    mpylh $r0.9 = $r0.3, 0xff
;;
	c0    mpylh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylh $r0.8 = $r0.3, 0xff
	c0    mpylh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylh $r0.9 = $r0.3, 0xff
;;
	c0    mpylh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylhu $r0.6 = $r0.3, 0xff
	c0    mpylhu $r0.7 = $r0.3, 0xff
	c0    mpylhu $r0.8 = $r0.3, 0xff
	c0    mpylhu $r0.9 = $r0.3, 0xff
;;
	c0    mpylhu $r0.6 = $r0.3, 0xff
	c0    mpylhu $r0.7 = $r0.3, 0xff
	c0    mpylhu $r0.8 = $r0.3, 0xff
	c0    mpylhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylhu $r0.6 = $r0.3, 0xff
	c0    mpylhu $r0.7 = $r0.3, 0xff
	c0    mpylhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylhu $r0.9 = $r0.3, 0xff
;;
	c0    mpylhu $r0.6 = $r0.3, 0xff
	c0    mpylhu $r0.7 = $r0.3, 0xff
	c0    mpylhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylhu $r0.6 = $r0.3, 0xff
	c0    mpylhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylhu $r0.8 = $r0.3, 0xff
	c0    mpylhu $r0.9 = $r0.3, 0xff
;;
	c0    mpylhu $r0.6 = $r0.3, 0xff
	c0    mpylhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylhu $r0.8 = $r0.3, 0xff
	c0    mpylhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylhu $r0.6 = $r0.3, 0xff
	c0    mpylhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylhu $r0.9 = $r0.3, 0xff
;;
	c0    mpylhu $r0.6 = $r0.3, 0xff
	c0    mpylhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylhu $r0.7 = $r0.3, 0xff
	c0    mpylhu $r0.8 = $r0.3, 0xff
	c0    mpylhu $r0.9 = $r0.3, 0xff
;;
	c0    mpylhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylhu $r0.7 = $r0.3, 0xff
	c0    mpylhu $r0.8 = $r0.3, 0xff
	c0    mpylhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylhu $r0.7 = $r0.3, 0xff
	c0    mpylhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylhu $r0.9 = $r0.3, 0xff
;;
	c0    mpylhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylhu $r0.7 = $r0.3, 0xff
	c0    mpylhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylhu $r0.8 = $r0.3, 0xff
	c0    mpylhu $r0.9 = $r0.3, 0xff
;;
	c0    mpylhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylhu $r0.8 = $r0.3, 0xff
	c0    mpylhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylhu $r0.9 = $r0.3, 0xff
;;
	c0    mpylhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhh $r0.6 = $r0.3, 0xff
	c0    mpyhh $r0.7 = $r0.3, 0xff
	c0    mpyhh $r0.8 = $r0.3, 0xff
	c0    mpyhh $r0.9 = $r0.3, 0xff
;;
	c0    mpyhh $r0.6 = $r0.3, 0xff
	c0    mpyhh $r0.7 = $r0.3, 0xff
	c0    mpyhh $r0.8 = $r0.3, 0xff
	c0    mpyhh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhh $r0.6 = $r0.3, 0xff
	c0    mpyhh $r0.7 = $r0.3, 0xff
	c0    mpyhh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhh $r0.9 = $r0.3, 0xff
;;
	c0    mpyhh $r0.6 = $r0.3, 0xff
	c0    mpyhh $r0.7 = $r0.3, 0xff
	c0    mpyhh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhh $r0.6 = $r0.3, 0xff
	c0    mpyhh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhh $r0.8 = $r0.3, 0xff
	c0    mpyhh $r0.9 = $r0.3, 0xff
;;
	c0    mpyhh $r0.6 = $r0.3, 0xff
	c0    mpyhh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhh $r0.8 = $r0.3, 0xff
	c0    mpyhh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhh $r0.6 = $r0.3, 0xff
	c0    mpyhh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhh $r0.9 = $r0.3, 0xff
;;
	c0    mpyhh $r0.6 = $r0.3, 0xff
	c0    mpyhh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhh $r0.7 = $r0.3, 0xff
	c0    mpyhh $r0.8 = $r0.3, 0xff
	c0    mpyhh $r0.9 = $r0.3, 0xff
;;
	c0    mpyhh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhh $r0.7 = $r0.3, 0xff
	c0    mpyhh $r0.8 = $r0.3, 0xff
	c0    mpyhh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhh $r0.7 = $r0.3, 0xff
	c0    mpyhh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhh $r0.9 = $r0.3, 0xff
;;
	c0    mpyhh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhh $r0.7 = $r0.3, 0xff
	c0    mpyhh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhh $r0.8 = $r0.3, 0xff
	c0    mpyhh $r0.9 = $r0.3, 0xff
;;
	c0    mpyhh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhh $r0.8 = $r0.3, 0xff
	c0    mpyhh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhh $r0.9 = $r0.3, 0xff
;;
	c0    mpyhh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xff
	c0    mpyhhu $r0.7 = $r0.3, 0xff
	c0    mpyhhu $r0.8 = $r0.3, 0xff
	c0    mpyhhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xff
	c0    mpyhhu $r0.7 = $r0.3, 0xff
	c0    mpyhhu $r0.8 = $r0.3, 0xff
	c0    mpyhhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xff
	c0    mpyhhu $r0.7 = $r0.3, 0xff
	c0    mpyhhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xff
	c0    mpyhhu $r0.7 = $r0.3, 0xff
	c0    mpyhhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xff
	c0    mpyhhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhhu $r0.8 = $r0.3, 0xff
	c0    mpyhhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xff
	c0    mpyhhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhhu $r0.8 = $r0.3, 0xff
	c0    mpyhhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xff
	c0    mpyhhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xff
	c0    mpyhhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhhu $r0.7 = $r0.3, 0xff
	c0    mpyhhu $r0.8 = $r0.3, 0xff
	c0    mpyhhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhhu $r0.7 = $r0.3, 0xff
	c0    mpyhhu $r0.8 = $r0.3, 0xff
	c0    mpyhhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhhu $r0.7 = $r0.3, 0xff
	c0    mpyhhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhhu $r0.7 = $r0.3, 0xff
	c0    mpyhhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhhu $r0.8 = $r0.3, 0xff
	c0    mpyhhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhhu $r0.8 = $r0.3, 0xff
	c0    mpyhhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyl $r0.6 = $r0.3, 0xff
	c0    mpyl $r0.7 = $r0.3, 0xff
	c0    mpyl $r0.8 = $r0.3, 0xff
	c0    mpyl $r0.9 = $r0.3, 0xff
;;
	c0    mpyl $r0.6 = $r0.3, 0xff
	c0    mpyl $r0.7 = $r0.3, 0xff
	c0    mpyl $r0.8 = $r0.3, 0xff
	c0    mpyl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyl $r0.6 = $r0.3, 0xff
	c0    mpyl $r0.7 = $r0.3, 0xff
	c0    mpyl $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyl $r0.9 = $r0.3, 0xff
;;
	c0    mpyl $r0.6 = $r0.3, 0xff
	c0    mpyl $r0.7 = $r0.3, 0xff
	c0    mpyl $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyl $r0.6 = $r0.3, 0xff
	c0    mpyl $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyl $r0.8 = $r0.3, 0xff
	c0    mpyl $r0.9 = $r0.3, 0xff
;;
	c0    mpyl $r0.6 = $r0.3, 0xff
	c0    mpyl $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyl $r0.8 = $r0.3, 0xff
	c0    mpyl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyl $r0.6 = $r0.3, 0xff
	c0    mpyl $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyl $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyl $r0.9 = $r0.3, 0xff
;;
	c0    mpyl $r0.6 = $r0.3, 0xff
	c0    mpyl $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyl $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyl $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyl $r0.7 = $r0.3, 0xff
	c0    mpyl $r0.8 = $r0.3, 0xff
	c0    mpyl $r0.9 = $r0.3, 0xff
;;
	c0    mpyl $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyl $r0.7 = $r0.3, 0xff
	c0    mpyl $r0.8 = $r0.3, 0xff
	c0    mpyl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyl $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyl $r0.7 = $r0.3, 0xff
	c0    mpyl $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyl $r0.9 = $r0.3, 0xff
;;
	c0    mpyl $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyl $r0.7 = $r0.3, 0xff
	c0    mpyl $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyl $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyl $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyl $r0.8 = $r0.3, 0xff
	c0    mpyl $r0.9 = $r0.3, 0xff
;;
	c0    mpyl $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyl $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyl $r0.8 = $r0.3, 0xff
	c0    mpyl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyl $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyl $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyl $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyl $r0.9 = $r0.3, 0xff
;;
	c0    mpyl $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyl $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyl $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylu $r0.6 = $r0.3, 0xff
	c0    mpylu $r0.7 = $r0.3, 0xff
	c0    mpylu $r0.8 = $r0.3, 0xff
	c0    mpylu $r0.9 = $r0.3, 0xff
;;
	c0    mpylu $r0.6 = $r0.3, 0xff
	c0    mpylu $r0.7 = $r0.3, 0xff
	c0    mpylu $r0.8 = $r0.3, 0xff
	c0    mpylu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylu $r0.6 = $r0.3, 0xff
	c0    mpylu $r0.7 = $r0.3, 0xff
	c0    mpylu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylu $r0.9 = $r0.3, 0xff
;;
	c0    mpylu $r0.6 = $r0.3, 0xff
	c0    mpylu $r0.7 = $r0.3, 0xff
	c0    mpylu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylu $r0.6 = $r0.3, 0xff
	c0    mpylu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylu $r0.8 = $r0.3, 0xff
	c0    mpylu $r0.9 = $r0.3, 0xff
;;
	c0    mpylu $r0.6 = $r0.3, 0xff
	c0    mpylu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylu $r0.8 = $r0.3, 0xff
	c0    mpylu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylu $r0.6 = $r0.3, 0xff
	c0    mpylu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylu $r0.9 = $r0.3, 0xff
;;
	c0    mpylu $r0.6 = $r0.3, 0xff
	c0    mpylu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylu $r0.7 = $r0.3, 0xff
	c0    mpylu $r0.8 = $r0.3, 0xff
	c0    mpylu $r0.9 = $r0.3, 0xff
;;
	c0    mpylu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylu $r0.7 = $r0.3, 0xff
	c0    mpylu $r0.8 = $r0.3, 0xff
	c0    mpylu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylu $r0.7 = $r0.3, 0xff
	c0    mpylu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylu $r0.9 = $r0.3, 0xff
;;
	c0    mpylu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylu $r0.7 = $r0.3, 0xff
	c0    mpylu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylu $r0.8 = $r0.3, 0xff
	c0    mpylu $r0.9 = $r0.3, 0xff
;;
	c0    mpylu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylu $r0.8 = $r0.3, 0xff
	c0    mpylu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpylu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylu $r0.9 = $r0.3, 0xff
;;
	c0    mpylu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpylu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpylu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpylu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyh $r0.6 = $r0.3, 0xff
	c0    mpyh $r0.7 = $r0.3, 0xff
	c0    mpyh $r0.8 = $r0.3, 0xff
	c0    mpyh $r0.9 = $r0.3, 0xff
;;
	c0    mpyh $r0.6 = $r0.3, 0xff
	c0    mpyh $r0.7 = $r0.3, 0xff
	c0    mpyh $r0.8 = $r0.3, 0xff
	c0    mpyh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyh $r0.6 = $r0.3, 0xff
	c0    mpyh $r0.7 = $r0.3, 0xff
	c0    mpyh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyh $r0.9 = $r0.3, 0xff
;;
	c0    mpyh $r0.6 = $r0.3, 0xff
	c0    mpyh $r0.7 = $r0.3, 0xff
	c0    mpyh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyh $r0.6 = $r0.3, 0xff
	c0    mpyh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyh $r0.8 = $r0.3, 0xff
	c0    mpyh $r0.9 = $r0.3, 0xff
;;
	c0    mpyh $r0.6 = $r0.3, 0xff
	c0    mpyh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyh $r0.8 = $r0.3, 0xff
	c0    mpyh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyh $r0.6 = $r0.3, 0xff
	c0    mpyh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyh $r0.9 = $r0.3, 0xff
;;
	c0    mpyh $r0.6 = $r0.3, 0xff
	c0    mpyh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyh $r0.7 = $r0.3, 0xff
	c0    mpyh $r0.8 = $r0.3, 0xff
	c0    mpyh $r0.9 = $r0.3, 0xff
;;
	c0    mpyh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyh $r0.7 = $r0.3, 0xff
	c0    mpyh $r0.8 = $r0.3, 0xff
	c0    mpyh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyh $r0.7 = $r0.3, 0xff
	c0    mpyh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyh $r0.9 = $r0.3, 0xff
;;
	c0    mpyh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyh $r0.7 = $r0.3, 0xff
	c0    mpyh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyh $r0.8 = $r0.3, 0xff
	c0    mpyh $r0.9 = $r0.3, 0xff
;;
	c0    mpyh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyh $r0.8 = $r0.3, 0xff
	c0    mpyh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyh $r0.9 = $r0.3, 0xff
;;
	c0    mpyh $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyh $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyh $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyh $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhu $r0.6 = $r0.3, 0xff
	c0    mpyhu $r0.7 = $r0.3, 0xff
	c0    mpyhu $r0.8 = $r0.3, 0xff
	c0    mpyhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhu $r0.6 = $r0.3, 0xff
	c0    mpyhu $r0.7 = $r0.3, 0xff
	c0    mpyhu $r0.8 = $r0.3, 0xff
	c0    mpyhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhu $r0.6 = $r0.3, 0xff
	c0    mpyhu $r0.7 = $r0.3, 0xff
	c0    mpyhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhu $r0.6 = $r0.3, 0xff
	c0    mpyhu $r0.7 = $r0.3, 0xff
	c0    mpyhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhu $r0.6 = $r0.3, 0xff
	c0    mpyhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhu $r0.8 = $r0.3, 0xff
	c0    mpyhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhu $r0.6 = $r0.3, 0xff
	c0    mpyhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhu $r0.8 = $r0.3, 0xff
	c0    mpyhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhu $r0.6 = $r0.3, 0xff
	c0    mpyhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhu $r0.6 = $r0.3, 0xff
	c0    mpyhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhu $r0.7 = $r0.3, 0xff
	c0    mpyhu $r0.8 = $r0.3, 0xff
	c0    mpyhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhu $r0.7 = $r0.3, 0xff
	c0    mpyhu $r0.8 = $r0.3, 0xff
	c0    mpyhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhu $r0.7 = $r0.3, 0xff
	c0    mpyhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhu $r0.7 = $r0.3, 0xff
	c0    mpyhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhu $r0.8 = $r0.3, 0xff
	c0    mpyhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhu $r0.8 = $r0.3, 0xff
	c0    mpyhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhu $r0.9 = $r0.3, 0xff
;;
	c0    mpyhu $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhu $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhu $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhs $r0.6 = $r0.3, 0xff
	c0    mpyhs $r0.7 = $r0.3, 0xff
	c0    mpyhs $r0.8 = $r0.3, 0xff
	c0    mpyhs $r0.9 = $r0.3, 0xff
;;
	c0    mpyhs $r0.6 = $r0.3, 0xff
	c0    mpyhs $r0.7 = $r0.3, 0xff
	c0    mpyhs $r0.8 = $r0.3, 0xff
	c0    mpyhs $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhs $r0.6 = $r0.3, 0xff
	c0    mpyhs $r0.7 = $r0.3, 0xff
	c0    mpyhs $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhs $r0.9 = $r0.3, 0xff
;;
	c0    mpyhs $r0.6 = $r0.3, 0xff
	c0    mpyhs $r0.7 = $r0.3, 0xff
	c0    mpyhs $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhs $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhs $r0.6 = $r0.3, 0xff
	c0    mpyhs $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhs $r0.8 = $r0.3, 0xff
	c0    mpyhs $r0.9 = $r0.3, 0xff
;;
	c0    mpyhs $r0.6 = $r0.3, 0xff
	c0    mpyhs $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhs $r0.8 = $r0.3, 0xff
	c0    mpyhs $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhs $r0.6 = $r0.3, 0xff
	c0    mpyhs $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhs $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhs $r0.9 = $r0.3, 0xff
;;
	c0    mpyhs $r0.6 = $r0.3, 0xff
	c0    mpyhs $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhs $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhs $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhs $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhs $r0.7 = $r0.3, 0xff
	c0    mpyhs $r0.8 = $r0.3, 0xff
	c0    mpyhs $r0.9 = $r0.3, 0xff
;;
	c0    mpyhs $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhs $r0.7 = $r0.3, 0xff
	c0    mpyhs $r0.8 = $r0.3, 0xff
	c0    mpyhs $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhs $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhs $r0.7 = $r0.3, 0xff
	c0    mpyhs $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhs $r0.9 = $r0.3, 0xff
;;
	c0    mpyhs $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhs $r0.7 = $r0.3, 0xff
	c0    mpyhs $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhs $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhs $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhs $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhs $r0.8 = $r0.3, 0xff
	c0    mpyhs $r0.9 = $r0.3, 0xff
;;
	c0    mpyhs $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhs $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhs $r0.8 = $r0.3, 0xff
	c0    mpyhs $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    mpyhs $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhs $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhs $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhs $r0.9 = $r0.3, 0xff
;;
	c0    mpyhs $r0.6 = $r0.3, 0xdeadbef5
	c0    mpyhs $r0.7 = $r0.3, 0xdeadbef6
	c0    mpyhs $r0.8 = $r0.3, 0xdeadbef7
	c0    mpyhs $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpeq $r0.6 = $r0.3, 0xff
	c0    cmpeq $r0.7 = $r0.3, 0xff
	c0    cmpeq $r0.8 = $r0.3, 0xff
	c0    cmpeq $r0.9 = $r0.3, 0xff
;;
	c0    cmpeq $r0.6 = $r0.3, 0xff
	c0    cmpeq $r0.7 = $r0.3, 0xff
	c0    cmpeq $r0.8 = $r0.3, 0xff
	c0    cmpeq $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpeq $r0.6 = $r0.3, 0xff
	c0    cmpeq $r0.7 = $r0.3, 0xff
	c0    cmpeq $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpeq $r0.9 = $r0.3, 0xff
;;
	c0    cmpeq $r0.6 = $r0.3, 0xff
	c0    cmpeq $r0.7 = $r0.3, 0xff
	c0    cmpeq $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpeq $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpeq $r0.6 = $r0.3, 0xff
	c0    cmpeq $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpeq $r0.8 = $r0.3, 0xff
	c0    cmpeq $r0.9 = $r0.3, 0xff
;;
	c0    cmpeq $r0.6 = $r0.3, 0xff
	c0    cmpeq $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpeq $r0.8 = $r0.3, 0xff
	c0    cmpeq $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpeq $r0.6 = $r0.3, 0xff
	c0    cmpeq $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpeq $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpeq $r0.9 = $r0.3, 0xff
;;
	c0    cmpeq $r0.6 = $r0.3, 0xff
	c0    cmpeq $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpeq $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpeq $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpeq $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpeq $r0.7 = $r0.3, 0xff
	c0    cmpeq $r0.8 = $r0.3, 0xff
	c0    cmpeq $r0.9 = $r0.3, 0xff
;;
	c0    cmpeq $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpeq $r0.7 = $r0.3, 0xff
	c0    cmpeq $r0.8 = $r0.3, 0xff
	c0    cmpeq $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpeq $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpeq $r0.7 = $r0.3, 0xff
	c0    cmpeq $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpeq $r0.9 = $r0.3, 0xff
;;
	c0    cmpeq $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpeq $r0.7 = $r0.3, 0xff
	c0    cmpeq $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpeq $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpeq $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpeq $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpeq $r0.8 = $r0.3, 0xff
	c0    cmpeq $r0.9 = $r0.3, 0xff
;;
	c0    cmpeq $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpeq $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpeq $r0.8 = $r0.3, 0xff
	c0    cmpeq $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpeq $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpeq $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpeq $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpeq $r0.9 = $r0.3, 0xff
;;
	c0    cmpeq $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpeq $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpeq $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpeq $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpge $r0.6 = $r0.3, 0xff
	c0    cmpge $r0.7 = $r0.3, 0xff
	c0    cmpge $r0.8 = $r0.3, 0xff
	c0    cmpge $r0.9 = $r0.3, 0xff
;;
	c0    cmpge $r0.6 = $r0.3, 0xff
	c0    cmpge $r0.7 = $r0.3, 0xff
	c0    cmpge $r0.8 = $r0.3, 0xff
	c0    cmpge $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpge $r0.6 = $r0.3, 0xff
	c0    cmpge $r0.7 = $r0.3, 0xff
	c0    cmpge $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpge $r0.9 = $r0.3, 0xff
;;
	c0    cmpge $r0.6 = $r0.3, 0xff
	c0    cmpge $r0.7 = $r0.3, 0xff
	c0    cmpge $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpge $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpge $r0.6 = $r0.3, 0xff
	c0    cmpge $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpge $r0.8 = $r0.3, 0xff
	c0    cmpge $r0.9 = $r0.3, 0xff
;;
	c0    cmpge $r0.6 = $r0.3, 0xff
	c0    cmpge $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpge $r0.8 = $r0.3, 0xff
	c0    cmpge $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpge $r0.6 = $r0.3, 0xff
	c0    cmpge $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpge $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpge $r0.9 = $r0.3, 0xff
;;
	c0    cmpge $r0.6 = $r0.3, 0xff
	c0    cmpge $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpge $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpge $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpge $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpge $r0.7 = $r0.3, 0xff
	c0    cmpge $r0.8 = $r0.3, 0xff
	c0    cmpge $r0.9 = $r0.3, 0xff
;;
	c0    cmpge $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpge $r0.7 = $r0.3, 0xff
	c0    cmpge $r0.8 = $r0.3, 0xff
	c0    cmpge $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpge $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpge $r0.7 = $r0.3, 0xff
	c0    cmpge $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpge $r0.9 = $r0.3, 0xff
;;
	c0    cmpge $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpge $r0.7 = $r0.3, 0xff
	c0    cmpge $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpge $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpge $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpge $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpge $r0.8 = $r0.3, 0xff
	c0    cmpge $r0.9 = $r0.3, 0xff
;;
	c0    cmpge $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpge $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpge $r0.8 = $r0.3, 0xff
	c0    cmpge $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpge $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpge $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpge $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpge $r0.9 = $r0.3, 0xff
;;
	c0    cmpge $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpge $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpge $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpge $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xff
	c0    cmpgeu $r0.7 = $r0.3, 0xff
	c0    cmpgeu $r0.8 = $r0.3, 0xff
	c0    cmpgeu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xff
	c0    cmpgeu $r0.7 = $r0.3, 0xff
	c0    cmpgeu $r0.8 = $r0.3, 0xff
	c0    cmpgeu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xff
	c0    cmpgeu $r0.7 = $r0.3, 0xff
	c0    cmpgeu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgeu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xff
	c0    cmpgeu $r0.7 = $r0.3, 0xff
	c0    cmpgeu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgeu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xff
	c0    cmpgeu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgeu $r0.8 = $r0.3, 0xff
	c0    cmpgeu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xff
	c0    cmpgeu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgeu $r0.8 = $r0.3, 0xff
	c0    cmpgeu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xff
	c0    cmpgeu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgeu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgeu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xff
	c0    cmpgeu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgeu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgeu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgeu $r0.7 = $r0.3, 0xff
	c0    cmpgeu $r0.8 = $r0.3, 0xff
	c0    cmpgeu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgeu $r0.7 = $r0.3, 0xff
	c0    cmpgeu $r0.8 = $r0.3, 0xff
	c0    cmpgeu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgeu $r0.7 = $r0.3, 0xff
	c0    cmpgeu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgeu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgeu $r0.7 = $r0.3, 0xff
	c0    cmpgeu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgeu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgeu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgeu $r0.8 = $r0.3, 0xff
	c0    cmpgeu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgeu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgeu $r0.8 = $r0.3, 0xff
	c0    cmpgeu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgeu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgeu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgeu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgeu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgeu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgeu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgeu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgt $r0.6 = $r0.3, 0xff
	c0    cmpgt $r0.7 = $r0.3, 0xff
	c0    cmpgt $r0.8 = $r0.3, 0xff
	c0    cmpgt $r0.9 = $r0.3, 0xff
;;
	c0    cmpgt $r0.6 = $r0.3, 0xff
	c0    cmpgt $r0.7 = $r0.3, 0xff
	c0    cmpgt $r0.8 = $r0.3, 0xff
	c0    cmpgt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgt $r0.6 = $r0.3, 0xff
	c0    cmpgt $r0.7 = $r0.3, 0xff
	c0    cmpgt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgt $r0.9 = $r0.3, 0xff
;;
	c0    cmpgt $r0.6 = $r0.3, 0xff
	c0    cmpgt $r0.7 = $r0.3, 0xff
	c0    cmpgt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgt $r0.6 = $r0.3, 0xff
	c0    cmpgt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgt $r0.8 = $r0.3, 0xff
	c0    cmpgt $r0.9 = $r0.3, 0xff
;;
	c0    cmpgt $r0.6 = $r0.3, 0xff
	c0    cmpgt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgt $r0.8 = $r0.3, 0xff
	c0    cmpgt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgt $r0.6 = $r0.3, 0xff
	c0    cmpgt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgt $r0.9 = $r0.3, 0xff
;;
	c0    cmpgt $r0.6 = $r0.3, 0xff
	c0    cmpgt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgt $r0.7 = $r0.3, 0xff
	c0    cmpgt $r0.8 = $r0.3, 0xff
	c0    cmpgt $r0.9 = $r0.3, 0xff
;;
	c0    cmpgt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgt $r0.7 = $r0.3, 0xff
	c0    cmpgt $r0.8 = $r0.3, 0xff
	c0    cmpgt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgt $r0.7 = $r0.3, 0xff
	c0    cmpgt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgt $r0.9 = $r0.3, 0xff
;;
	c0    cmpgt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgt $r0.7 = $r0.3, 0xff
	c0    cmpgt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgt $r0.8 = $r0.3, 0xff
	c0    cmpgt $r0.9 = $r0.3, 0xff
;;
	c0    cmpgt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgt $r0.8 = $r0.3, 0xff
	c0    cmpgt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgt $r0.9 = $r0.3, 0xff
;;
	c0    cmpgt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xff
	c0    cmpgtu $r0.7 = $r0.3, 0xff
	c0    cmpgtu $r0.8 = $r0.3, 0xff
	c0    cmpgtu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xff
	c0    cmpgtu $r0.7 = $r0.3, 0xff
	c0    cmpgtu $r0.8 = $r0.3, 0xff
	c0    cmpgtu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xff
	c0    cmpgtu $r0.7 = $r0.3, 0xff
	c0    cmpgtu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgtu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xff
	c0    cmpgtu $r0.7 = $r0.3, 0xff
	c0    cmpgtu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgtu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xff
	c0    cmpgtu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgtu $r0.8 = $r0.3, 0xff
	c0    cmpgtu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xff
	c0    cmpgtu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgtu $r0.8 = $r0.3, 0xff
	c0    cmpgtu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xff
	c0    cmpgtu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgtu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgtu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xff
	c0    cmpgtu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgtu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgtu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgtu $r0.7 = $r0.3, 0xff
	c0    cmpgtu $r0.8 = $r0.3, 0xff
	c0    cmpgtu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgtu $r0.7 = $r0.3, 0xff
	c0    cmpgtu $r0.8 = $r0.3, 0xff
	c0    cmpgtu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgtu $r0.7 = $r0.3, 0xff
	c0    cmpgtu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgtu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgtu $r0.7 = $r0.3, 0xff
	c0    cmpgtu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgtu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgtu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgtu $r0.8 = $r0.3, 0xff
	c0    cmpgtu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgtu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgtu $r0.8 = $r0.3, 0xff
	c0    cmpgtu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgtu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgtu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgtu $r0.9 = $r0.3, 0xff
;;
	c0    cmpgtu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpgtu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpgtu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpgtu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmple $r0.6 = $r0.3, 0xff
	c0    cmple $r0.7 = $r0.3, 0xff
	c0    cmple $r0.8 = $r0.3, 0xff
	c0    cmple $r0.9 = $r0.3, 0xff
;;
	c0    cmple $r0.6 = $r0.3, 0xff
	c0    cmple $r0.7 = $r0.3, 0xff
	c0    cmple $r0.8 = $r0.3, 0xff
	c0    cmple $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmple $r0.6 = $r0.3, 0xff
	c0    cmple $r0.7 = $r0.3, 0xff
	c0    cmple $r0.8 = $r0.3, 0xdeadbef7
	c0    cmple $r0.9 = $r0.3, 0xff
;;
	c0    cmple $r0.6 = $r0.3, 0xff
	c0    cmple $r0.7 = $r0.3, 0xff
	c0    cmple $r0.8 = $r0.3, 0xdeadbef7
	c0    cmple $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmple $r0.6 = $r0.3, 0xff
	c0    cmple $r0.7 = $r0.3, 0xdeadbef6
	c0    cmple $r0.8 = $r0.3, 0xff
	c0    cmple $r0.9 = $r0.3, 0xff
;;
	c0    cmple $r0.6 = $r0.3, 0xff
	c0    cmple $r0.7 = $r0.3, 0xdeadbef6
	c0    cmple $r0.8 = $r0.3, 0xff
	c0    cmple $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmple $r0.6 = $r0.3, 0xff
	c0    cmple $r0.7 = $r0.3, 0xdeadbef6
	c0    cmple $r0.8 = $r0.3, 0xdeadbef7
	c0    cmple $r0.9 = $r0.3, 0xff
;;
	c0    cmple $r0.6 = $r0.3, 0xff
	c0    cmple $r0.7 = $r0.3, 0xdeadbef6
	c0    cmple $r0.8 = $r0.3, 0xdeadbef7
	c0    cmple $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmple $r0.6 = $r0.3, 0xdeadbef5
	c0    cmple $r0.7 = $r0.3, 0xff
	c0    cmple $r0.8 = $r0.3, 0xff
	c0    cmple $r0.9 = $r0.3, 0xff
;;
	c0    cmple $r0.6 = $r0.3, 0xdeadbef5
	c0    cmple $r0.7 = $r0.3, 0xff
	c0    cmple $r0.8 = $r0.3, 0xff
	c0    cmple $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmple $r0.6 = $r0.3, 0xdeadbef5
	c0    cmple $r0.7 = $r0.3, 0xff
	c0    cmple $r0.8 = $r0.3, 0xdeadbef7
	c0    cmple $r0.9 = $r0.3, 0xff
;;
	c0    cmple $r0.6 = $r0.3, 0xdeadbef5
	c0    cmple $r0.7 = $r0.3, 0xff
	c0    cmple $r0.8 = $r0.3, 0xdeadbef7
	c0    cmple $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmple $r0.6 = $r0.3, 0xdeadbef5
	c0    cmple $r0.7 = $r0.3, 0xdeadbef6
	c0    cmple $r0.8 = $r0.3, 0xff
	c0    cmple $r0.9 = $r0.3, 0xff
;;
	c0    cmple $r0.6 = $r0.3, 0xdeadbef5
	c0    cmple $r0.7 = $r0.3, 0xdeadbef6
	c0    cmple $r0.8 = $r0.3, 0xff
	c0    cmple $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmple $r0.6 = $r0.3, 0xdeadbef5
	c0    cmple $r0.7 = $r0.3, 0xdeadbef6
	c0    cmple $r0.8 = $r0.3, 0xdeadbef7
	c0    cmple $r0.9 = $r0.3, 0xff
;;
	c0    cmple $r0.6 = $r0.3, 0xdeadbef5
	c0    cmple $r0.7 = $r0.3, 0xdeadbef6
	c0    cmple $r0.8 = $r0.3, 0xdeadbef7
	c0    cmple $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpleu $r0.6 = $r0.3, 0xff
	c0    cmpleu $r0.7 = $r0.3, 0xff
	c0    cmpleu $r0.8 = $r0.3, 0xff
	c0    cmpleu $r0.9 = $r0.3, 0xff
;;
	c0    cmpleu $r0.6 = $r0.3, 0xff
	c0    cmpleu $r0.7 = $r0.3, 0xff
	c0    cmpleu $r0.8 = $r0.3, 0xff
	c0    cmpleu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpleu $r0.6 = $r0.3, 0xff
	c0    cmpleu $r0.7 = $r0.3, 0xff
	c0    cmpleu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpleu $r0.9 = $r0.3, 0xff
;;
	c0    cmpleu $r0.6 = $r0.3, 0xff
	c0    cmpleu $r0.7 = $r0.3, 0xff
	c0    cmpleu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpleu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpleu $r0.6 = $r0.3, 0xff
	c0    cmpleu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpleu $r0.8 = $r0.3, 0xff
	c0    cmpleu $r0.9 = $r0.3, 0xff
;;
	c0    cmpleu $r0.6 = $r0.3, 0xff
	c0    cmpleu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpleu $r0.8 = $r0.3, 0xff
	c0    cmpleu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpleu $r0.6 = $r0.3, 0xff
	c0    cmpleu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpleu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpleu $r0.9 = $r0.3, 0xff
;;
	c0    cmpleu $r0.6 = $r0.3, 0xff
	c0    cmpleu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpleu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpleu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpleu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpleu $r0.7 = $r0.3, 0xff
	c0    cmpleu $r0.8 = $r0.3, 0xff
	c0    cmpleu $r0.9 = $r0.3, 0xff
;;
	c0    cmpleu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpleu $r0.7 = $r0.3, 0xff
	c0    cmpleu $r0.8 = $r0.3, 0xff
	c0    cmpleu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpleu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpleu $r0.7 = $r0.3, 0xff
	c0    cmpleu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpleu $r0.9 = $r0.3, 0xff
;;
	c0    cmpleu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpleu $r0.7 = $r0.3, 0xff
	c0    cmpleu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpleu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpleu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpleu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpleu $r0.8 = $r0.3, 0xff
	c0    cmpleu $r0.9 = $r0.3, 0xff
;;
	c0    cmpleu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpleu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpleu $r0.8 = $r0.3, 0xff
	c0    cmpleu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpleu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpleu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpleu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpleu $r0.9 = $r0.3, 0xff
;;
	c0    cmpleu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpleu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpleu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpleu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmplt $r0.6 = $r0.3, 0xff
	c0    cmplt $r0.7 = $r0.3, 0xff
	c0    cmplt $r0.8 = $r0.3, 0xff
	c0    cmplt $r0.9 = $r0.3, 0xff
;;
	c0    cmplt $r0.6 = $r0.3, 0xff
	c0    cmplt $r0.7 = $r0.3, 0xff
	c0    cmplt $r0.8 = $r0.3, 0xff
	c0    cmplt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmplt $r0.6 = $r0.3, 0xff
	c0    cmplt $r0.7 = $r0.3, 0xff
	c0    cmplt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmplt $r0.9 = $r0.3, 0xff
;;
	c0    cmplt $r0.6 = $r0.3, 0xff
	c0    cmplt $r0.7 = $r0.3, 0xff
	c0    cmplt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmplt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmplt $r0.6 = $r0.3, 0xff
	c0    cmplt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmplt $r0.8 = $r0.3, 0xff
	c0    cmplt $r0.9 = $r0.3, 0xff
;;
	c0    cmplt $r0.6 = $r0.3, 0xff
	c0    cmplt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmplt $r0.8 = $r0.3, 0xff
	c0    cmplt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmplt $r0.6 = $r0.3, 0xff
	c0    cmplt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmplt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmplt $r0.9 = $r0.3, 0xff
;;
	c0    cmplt $r0.6 = $r0.3, 0xff
	c0    cmplt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmplt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmplt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmplt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmplt $r0.7 = $r0.3, 0xff
	c0    cmplt $r0.8 = $r0.3, 0xff
	c0    cmplt $r0.9 = $r0.3, 0xff
;;
	c0    cmplt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmplt $r0.7 = $r0.3, 0xff
	c0    cmplt $r0.8 = $r0.3, 0xff
	c0    cmplt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmplt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmplt $r0.7 = $r0.3, 0xff
	c0    cmplt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmplt $r0.9 = $r0.3, 0xff
;;
	c0    cmplt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmplt $r0.7 = $r0.3, 0xff
	c0    cmplt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmplt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmplt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmplt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmplt $r0.8 = $r0.3, 0xff
	c0    cmplt $r0.9 = $r0.3, 0xff
;;
	c0    cmplt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmplt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmplt $r0.8 = $r0.3, 0xff
	c0    cmplt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmplt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmplt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmplt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmplt $r0.9 = $r0.3, 0xff
;;
	c0    cmplt $r0.6 = $r0.3, 0xdeadbef5
	c0    cmplt $r0.7 = $r0.3, 0xdeadbef6
	c0    cmplt $r0.8 = $r0.3, 0xdeadbef7
	c0    cmplt $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpltu $r0.6 = $r0.3, 0xff
	c0    cmpltu $r0.7 = $r0.3, 0xff
	c0    cmpltu $r0.8 = $r0.3, 0xff
	c0    cmpltu $r0.9 = $r0.3, 0xff
;;
	c0    cmpltu $r0.6 = $r0.3, 0xff
	c0    cmpltu $r0.7 = $r0.3, 0xff
	c0    cmpltu $r0.8 = $r0.3, 0xff
	c0    cmpltu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpltu $r0.6 = $r0.3, 0xff
	c0    cmpltu $r0.7 = $r0.3, 0xff
	c0    cmpltu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpltu $r0.9 = $r0.3, 0xff
;;
	c0    cmpltu $r0.6 = $r0.3, 0xff
	c0    cmpltu $r0.7 = $r0.3, 0xff
	c0    cmpltu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpltu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpltu $r0.6 = $r0.3, 0xff
	c0    cmpltu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpltu $r0.8 = $r0.3, 0xff
	c0    cmpltu $r0.9 = $r0.3, 0xff
;;
	c0    cmpltu $r0.6 = $r0.3, 0xff
	c0    cmpltu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpltu $r0.8 = $r0.3, 0xff
	c0    cmpltu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpltu $r0.6 = $r0.3, 0xff
	c0    cmpltu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpltu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpltu $r0.9 = $r0.3, 0xff
;;
	c0    cmpltu $r0.6 = $r0.3, 0xff
	c0    cmpltu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpltu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpltu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpltu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpltu $r0.7 = $r0.3, 0xff
	c0    cmpltu $r0.8 = $r0.3, 0xff
	c0    cmpltu $r0.9 = $r0.3, 0xff
;;
	c0    cmpltu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpltu $r0.7 = $r0.3, 0xff
	c0    cmpltu $r0.8 = $r0.3, 0xff
	c0    cmpltu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpltu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpltu $r0.7 = $r0.3, 0xff
	c0    cmpltu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpltu $r0.9 = $r0.3, 0xff
;;
	c0    cmpltu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpltu $r0.7 = $r0.3, 0xff
	c0    cmpltu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpltu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpltu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpltu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpltu $r0.8 = $r0.3, 0xff
	c0    cmpltu $r0.9 = $r0.3, 0xff
;;
	c0    cmpltu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpltu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpltu $r0.8 = $r0.3, 0xff
	c0    cmpltu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpltu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpltu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpltu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpltu $r0.9 = $r0.3, 0xff
;;
	c0    cmpltu $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpltu $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpltu $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpltu $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpne $r0.6 = $r0.3, 0xff
	c0    cmpne $r0.7 = $r0.3, 0xff
	c0    cmpne $r0.8 = $r0.3, 0xff
	c0    cmpne $r0.9 = $r0.3, 0xff
;;
	c0    cmpne $r0.6 = $r0.3, 0xff
	c0    cmpne $r0.7 = $r0.3, 0xff
	c0    cmpne $r0.8 = $r0.3, 0xff
	c0    cmpne $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpne $r0.6 = $r0.3, 0xff
	c0    cmpne $r0.7 = $r0.3, 0xff
	c0    cmpne $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpne $r0.9 = $r0.3, 0xff
;;
	c0    cmpne $r0.6 = $r0.3, 0xff
	c0    cmpne $r0.7 = $r0.3, 0xff
	c0    cmpne $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpne $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpne $r0.6 = $r0.3, 0xff
	c0    cmpne $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpne $r0.8 = $r0.3, 0xff
	c0    cmpne $r0.9 = $r0.3, 0xff
;;
	c0    cmpne $r0.6 = $r0.3, 0xff
	c0    cmpne $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpne $r0.8 = $r0.3, 0xff
	c0    cmpne $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpne $r0.6 = $r0.3, 0xff
	c0    cmpne $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpne $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpne $r0.9 = $r0.3, 0xff
;;
	c0    cmpne $r0.6 = $r0.3, 0xff
	c0    cmpne $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpne $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpne $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpne $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpne $r0.7 = $r0.3, 0xff
	c0    cmpne $r0.8 = $r0.3, 0xff
	c0    cmpne $r0.9 = $r0.3, 0xff
;;
	c0    cmpne $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpne $r0.7 = $r0.3, 0xff
	c0    cmpne $r0.8 = $r0.3, 0xff
	c0    cmpne $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpne $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpne $r0.7 = $r0.3, 0xff
	c0    cmpne $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpne $r0.9 = $r0.3, 0xff
;;
	c0    cmpne $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpne $r0.7 = $r0.3, 0xff
	c0    cmpne $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpne $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpne $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpne $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpne $r0.8 = $r0.3, 0xff
	c0    cmpne $r0.9 = $r0.3, 0xff
;;
	c0    cmpne $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpne $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpne $r0.8 = $r0.3, 0xff
	c0    cmpne $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    cmpne $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpne $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpne $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpne $r0.9 = $r0.3, 0xff
;;
	c0    cmpne $r0.6 = $r0.3, 0xdeadbef5
	c0    cmpne $r0.7 = $r0.3, 0xdeadbef6
	c0    cmpne $r0.8 = $r0.3, 0xdeadbef7
	c0    cmpne $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    nandl $r0.6 = $r0.3, 0xff
	c0    nandl $r0.7 = $r0.3, 0xff
	c0    nandl $r0.8 = $r0.3, 0xff
	c0    nandl $r0.9 = $r0.3, 0xff
;;
	c0    nandl $r0.6 = $r0.3, 0xff
	c0    nandl $r0.7 = $r0.3, 0xff
	c0    nandl $r0.8 = $r0.3, 0xff
	c0    nandl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    nandl $r0.6 = $r0.3, 0xff
	c0    nandl $r0.7 = $r0.3, 0xff
	c0    nandl $r0.8 = $r0.3, 0xdeadbef7
	c0    nandl $r0.9 = $r0.3, 0xff
;;
	c0    nandl $r0.6 = $r0.3, 0xff
	c0    nandl $r0.7 = $r0.3, 0xff
	c0    nandl $r0.8 = $r0.3, 0xdeadbef7
	c0    nandl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    nandl $r0.6 = $r0.3, 0xff
	c0    nandl $r0.7 = $r0.3, 0xdeadbef6
	c0    nandl $r0.8 = $r0.3, 0xff
	c0    nandl $r0.9 = $r0.3, 0xff
;;
	c0    nandl $r0.6 = $r0.3, 0xff
	c0    nandl $r0.7 = $r0.3, 0xdeadbef6
	c0    nandl $r0.8 = $r0.3, 0xff
	c0    nandl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    nandl $r0.6 = $r0.3, 0xff
	c0    nandl $r0.7 = $r0.3, 0xdeadbef6
	c0    nandl $r0.8 = $r0.3, 0xdeadbef7
	c0    nandl $r0.9 = $r0.3, 0xff
;;
	c0    nandl $r0.6 = $r0.3, 0xff
	c0    nandl $r0.7 = $r0.3, 0xdeadbef6
	c0    nandl $r0.8 = $r0.3, 0xdeadbef7
	c0    nandl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    nandl $r0.6 = $r0.3, 0xdeadbef5
	c0    nandl $r0.7 = $r0.3, 0xff
	c0    nandl $r0.8 = $r0.3, 0xff
	c0    nandl $r0.9 = $r0.3, 0xff
;;
	c0    nandl $r0.6 = $r0.3, 0xdeadbef5
	c0    nandl $r0.7 = $r0.3, 0xff
	c0    nandl $r0.8 = $r0.3, 0xff
	c0    nandl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    nandl $r0.6 = $r0.3, 0xdeadbef5
	c0    nandl $r0.7 = $r0.3, 0xff
	c0    nandl $r0.8 = $r0.3, 0xdeadbef7
	c0    nandl $r0.9 = $r0.3, 0xff
;;
	c0    nandl $r0.6 = $r0.3, 0xdeadbef5
	c0    nandl $r0.7 = $r0.3, 0xff
	c0    nandl $r0.8 = $r0.3, 0xdeadbef7
	c0    nandl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    nandl $r0.6 = $r0.3, 0xdeadbef5
	c0    nandl $r0.7 = $r0.3, 0xdeadbef6
	c0    nandl $r0.8 = $r0.3, 0xff
	c0    nandl $r0.9 = $r0.3, 0xff
;;
	c0    nandl $r0.6 = $r0.3, 0xdeadbef5
	c0    nandl $r0.7 = $r0.3, 0xdeadbef6
	c0    nandl $r0.8 = $r0.3, 0xff
	c0    nandl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    nandl $r0.6 = $r0.3, 0xdeadbef5
	c0    nandl $r0.7 = $r0.3, 0xdeadbef6
	c0    nandl $r0.8 = $r0.3, 0xdeadbef7
	c0    nandl $r0.9 = $r0.3, 0xff
;;
	c0    nandl $r0.6 = $r0.3, 0xdeadbef5
	c0    nandl $r0.7 = $r0.3, 0xdeadbef6
	c0    nandl $r0.8 = $r0.3, 0xdeadbef7
	c0    nandl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    norl $r0.6 = $r0.3, 0xff
	c0    norl $r0.7 = $r0.3, 0xff
	c0    norl $r0.8 = $r0.3, 0xff
	c0    norl $r0.9 = $r0.3, 0xff
;;
	c0    norl $r0.6 = $r0.3, 0xff
	c0    norl $r0.7 = $r0.3, 0xff
	c0    norl $r0.8 = $r0.3, 0xff
	c0    norl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    norl $r0.6 = $r0.3, 0xff
	c0    norl $r0.7 = $r0.3, 0xff
	c0    norl $r0.8 = $r0.3, 0xdeadbef7
	c0    norl $r0.9 = $r0.3, 0xff
;;
	c0    norl $r0.6 = $r0.3, 0xff
	c0    norl $r0.7 = $r0.3, 0xff
	c0    norl $r0.8 = $r0.3, 0xdeadbef7
	c0    norl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    norl $r0.6 = $r0.3, 0xff
	c0    norl $r0.7 = $r0.3, 0xdeadbef6
	c0    norl $r0.8 = $r0.3, 0xff
	c0    norl $r0.9 = $r0.3, 0xff
;;
	c0    norl $r0.6 = $r0.3, 0xff
	c0    norl $r0.7 = $r0.3, 0xdeadbef6
	c0    norl $r0.8 = $r0.3, 0xff
	c0    norl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    norl $r0.6 = $r0.3, 0xff
	c0    norl $r0.7 = $r0.3, 0xdeadbef6
	c0    norl $r0.8 = $r0.3, 0xdeadbef7
	c0    norl $r0.9 = $r0.3, 0xff
;;
	c0    norl $r0.6 = $r0.3, 0xff
	c0    norl $r0.7 = $r0.3, 0xdeadbef6
	c0    norl $r0.8 = $r0.3, 0xdeadbef7
	c0    norl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    norl $r0.6 = $r0.3, 0xdeadbef5
	c0    norl $r0.7 = $r0.3, 0xff
	c0    norl $r0.8 = $r0.3, 0xff
	c0    norl $r0.9 = $r0.3, 0xff
;;
	c0    norl $r0.6 = $r0.3, 0xdeadbef5
	c0    norl $r0.7 = $r0.3, 0xff
	c0    norl $r0.8 = $r0.3, 0xff
	c0    norl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    norl $r0.6 = $r0.3, 0xdeadbef5
	c0    norl $r0.7 = $r0.3, 0xff
	c0    norl $r0.8 = $r0.3, 0xdeadbef7
	c0    norl $r0.9 = $r0.3, 0xff
;;
	c0    norl $r0.6 = $r0.3, 0xdeadbef5
	c0    norl $r0.7 = $r0.3, 0xff
	c0    norl $r0.8 = $r0.3, 0xdeadbef7
	c0    norl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    norl $r0.6 = $r0.3, 0xdeadbef5
	c0    norl $r0.7 = $r0.3, 0xdeadbef6
	c0    norl $r0.8 = $r0.3, 0xff
	c0    norl $r0.9 = $r0.3, 0xff
;;
	c0    norl $r0.6 = $r0.3, 0xdeadbef5
	c0    norl $r0.7 = $r0.3, 0xdeadbef6
	c0    norl $r0.8 = $r0.3, 0xff
	c0    norl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    norl $r0.6 = $r0.3, 0xdeadbef5
	c0    norl $r0.7 = $r0.3, 0xdeadbef6
	c0    norl $r0.8 = $r0.3, 0xdeadbef7
	c0    norl $r0.9 = $r0.3, 0xff
;;
	c0    norl $r0.6 = $r0.3, 0xdeadbef5
	c0    norl $r0.7 = $r0.3, 0xdeadbef6
	c0    norl $r0.8 = $r0.3, 0xdeadbef7
	c0    norl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orl $r0.6 = $r0.3, 0xff
	c0    orl $r0.7 = $r0.3, 0xff
	c0    orl $r0.8 = $r0.3, 0xff
	c0    orl $r0.9 = $r0.3, 0xff
;;
	c0    orl $r0.6 = $r0.3, 0xff
	c0    orl $r0.7 = $r0.3, 0xff
	c0    orl $r0.8 = $r0.3, 0xff
	c0    orl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orl $r0.6 = $r0.3, 0xff
	c0    orl $r0.7 = $r0.3, 0xff
	c0    orl $r0.8 = $r0.3, 0xdeadbef7
	c0    orl $r0.9 = $r0.3, 0xff
;;
	c0    orl $r0.6 = $r0.3, 0xff
	c0    orl $r0.7 = $r0.3, 0xff
	c0    orl $r0.8 = $r0.3, 0xdeadbef7
	c0    orl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orl $r0.6 = $r0.3, 0xff
	c0    orl $r0.7 = $r0.3, 0xdeadbef6
	c0    orl $r0.8 = $r0.3, 0xff
	c0    orl $r0.9 = $r0.3, 0xff
;;
	c0    orl $r0.6 = $r0.3, 0xff
	c0    orl $r0.7 = $r0.3, 0xdeadbef6
	c0    orl $r0.8 = $r0.3, 0xff
	c0    orl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orl $r0.6 = $r0.3, 0xff
	c0    orl $r0.7 = $r0.3, 0xdeadbef6
	c0    orl $r0.8 = $r0.3, 0xdeadbef7
	c0    orl $r0.9 = $r0.3, 0xff
;;
	c0    orl $r0.6 = $r0.3, 0xff
	c0    orl $r0.7 = $r0.3, 0xdeadbef6
	c0    orl $r0.8 = $r0.3, 0xdeadbef7
	c0    orl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orl $r0.6 = $r0.3, 0xdeadbef5
	c0    orl $r0.7 = $r0.3, 0xff
	c0    orl $r0.8 = $r0.3, 0xff
	c0    orl $r0.9 = $r0.3, 0xff
;;
	c0    orl $r0.6 = $r0.3, 0xdeadbef5
	c0    orl $r0.7 = $r0.3, 0xff
	c0    orl $r0.8 = $r0.3, 0xff
	c0    orl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orl $r0.6 = $r0.3, 0xdeadbef5
	c0    orl $r0.7 = $r0.3, 0xff
	c0    orl $r0.8 = $r0.3, 0xdeadbef7
	c0    orl $r0.9 = $r0.3, 0xff
;;
	c0    orl $r0.6 = $r0.3, 0xdeadbef5
	c0    orl $r0.7 = $r0.3, 0xff
	c0    orl $r0.8 = $r0.3, 0xdeadbef7
	c0    orl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orl $r0.6 = $r0.3, 0xdeadbef5
	c0    orl $r0.7 = $r0.3, 0xdeadbef6
	c0    orl $r0.8 = $r0.3, 0xff
	c0    orl $r0.9 = $r0.3, 0xff
;;
	c0    orl $r0.6 = $r0.3, 0xdeadbef5
	c0    orl $r0.7 = $r0.3, 0xdeadbef6
	c0    orl $r0.8 = $r0.3, 0xff
	c0    orl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    orl $r0.6 = $r0.3, 0xdeadbef5
	c0    orl $r0.7 = $r0.3, 0xdeadbef6
	c0    orl $r0.8 = $r0.3, 0xdeadbef7
	c0    orl $r0.9 = $r0.3, 0xff
;;
	c0    orl $r0.6 = $r0.3, 0xdeadbef5
	c0    orl $r0.7 = $r0.3, 0xdeadbef6
	c0    orl $r0.8 = $r0.3, 0xdeadbef7
	c0    orl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andl $r0.6 = $r0.3, 0xff
	c0    andl $r0.7 = $r0.3, 0xff
	c0    andl $r0.8 = $r0.3, 0xff
	c0    andl $r0.9 = $r0.3, 0xff
;;
	c0    andl $r0.6 = $r0.3, 0xff
	c0    andl $r0.7 = $r0.3, 0xff
	c0    andl $r0.8 = $r0.3, 0xff
	c0    andl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andl $r0.6 = $r0.3, 0xff
	c0    andl $r0.7 = $r0.3, 0xff
	c0    andl $r0.8 = $r0.3, 0xdeadbef7
	c0    andl $r0.9 = $r0.3, 0xff
;;
	c0    andl $r0.6 = $r0.3, 0xff
	c0    andl $r0.7 = $r0.3, 0xff
	c0    andl $r0.8 = $r0.3, 0xdeadbef7
	c0    andl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andl $r0.6 = $r0.3, 0xff
	c0    andl $r0.7 = $r0.3, 0xdeadbef6
	c0    andl $r0.8 = $r0.3, 0xff
	c0    andl $r0.9 = $r0.3, 0xff
;;
	c0    andl $r0.6 = $r0.3, 0xff
	c0    andl $r0.7 = $r0.3, 0xdeadbef6
	c0    andl $r0.8 = $r0.3, 0xff
	c0    andl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andl $r0.6 = $r0.3, 0xff
	c0    andl $r0.7 = $r0.3, 0xdeadbef6
	c0    andl $r0.8 = $r0.3, 0xdeadbef7
	c0    andl $r0.9 = $r0.3, 0xff
;;
	c0    andl $r0.6 = $r0.3, 0xff
	c0    andl $r0.7 = $r0.3, 0xdeadbef6
	c0    andl $r0.8 = $r0.3, 0xdeadbef7
	c0    andl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andl $r0.6 = $r0.3, 0xdeadbef5
	c0    andl $r0.7 = $r0.3, 0xff
	c0    andl $r0.8 = $r0.3, 0xff
	c0    andl $r0.9 = $r0.3, 0xff
;;
	c0    andl $r0.6 = $r0.3, 0xdeadbef5
	c0    andl $r0.7 = $r0.3, 0xff
	c0    andl $r0.8 = $r0.3, 0xff
	c0    andl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andl $r0.6 = $r0.3, 0xdeadbef5
	c0    andl $r0.7 = $r0.3, 0xff
	c0    andl $r0.8 = $r0.3, 0xdeadbef7
	c0    andl $r0.9 = $r0.3, 0xff
;;
	c0    andl $r0.6 = $r0.3, 0xdeadbef5
	c0    andl $r0.7 = $r0.3, 0xff
	c0    andl $r0.8 = $r0.3, 0xdeadbef7
	c0    andl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andl $r0.6 = $r0.3, 0xdeadbef5
	c0    andl $r0.7 = $r0.3, 0xdeadbef6
	c0    andl $r0.8 = $r0.3, 0xff
	c0    andl $r0.9 = $r0.3, 0xff
;;
	c0    andl $r0.6 = $r0.3, 0xdeadbef5
	c0    andl $r0.7 = $r0.3, 0xdeadbef6
	c0    andl $r0.8 = $r0.3, 0xff
	c0    andl $r0.9 = $r0.3, 0xdeadbef8
;;
	c0    andl $r0.6 = $r0.3, 0xdeadbef5
	c0    andl $r0.7 = $r0.3, 0xdeadbef6
	c0    andl $r0.8 = $r0.3, 0xdeadbef7
	c0    andl $r0.9 = $r0.3, 0xff
;;
	c0    andl $r0.6 = $r0.3, 0xdeadbef5
	c0    andl $r0.7 = $r0.3, 0xdeadbef6
	c0    andl $r0.8 = $r0.3, 0xdeadbef7
	c0    andl $r0.9 = $r0.3, 0xdeadbef8
;;
;;								## 5
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 7,  t4,  ?2.1?2auto_size(I32),  t3
;;								## 6
.endp
.section .bss
.section .data
.equ ?2.1?2scratch.0, 0x0
.equ ?2.1?2ras_p, 0x10
.section .data
.section .text
.equ ?2.1?2auto_size, 0x20
 ## End main
.section .bss
.section .data
.section .data
.section .text

