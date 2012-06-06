## Operations - 627
FILE: sha_driver
.entry arg() ret()
-- FUNC_main
add.0 r0.1, r0.1, -0x20
mov.0 r0.5, 0x8
;
add.0 r0.2, r0.1, 0x10
mov.0 r0.3, (sha_driver_?1PACKET.3+0)
stw.0 r0.1[0x18], l0.0
;
;
;
.call _bcopy arg(r0.3,r0.4,r0.5) ret()
stw.0 r0.1[0x1c], r0.2
mov.0 r0.4, r0.2
call.0 l0.0, FUNC__bcopy
;
mov.0 r0.3, 0x2
;
;
ldw.0 r0.4, r0.1[0x1c]
;
;
.call main_test arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_main_test
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
.call exit arg(r0.3) ret(r0.3)
call.0 l0.0, FUNC_exit
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_main_test
add.0 r0.1, r0.1, -0xa0
ldw_d.0 r0.2, r0.0[(_impure_ptr+0)]
;
cmplt.0 b0.0, r0.3, 0x2
add.0 r0.5, r0.1, 0x10
stw.0 r0.1[0x6c], l0.0
;
;
ldw_d.0 r0.2, r0.2[0x4]
;
stw.0 r0.1[0x74], r0.5
brf.0 b0.0, sha_driver_L0?3
;
mov.0 r0.3, r0.5
;
.call sha_stream arg(r0.3,r0.4) ret()
mov.0 r0.4, r0.2
call.0 l0.0, FUNC_sha_stream
;
ldw.0 r0.3, r0.1[0x74]
;
;
.call sha_print arg(r0.3) ret()
call.0 l0.0, FUNC_sha_print
;
-- sha_driver_L1?3
mov.0 r0.3, r0.0
ldw.0 l0.0, r0.1[0x6c]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0xa0, l0.0
;
-- sha_driver_L0?3
add.0 r0.5, r0.1, 0x10
stw.0 r0.1[0x80], r0.57
;
stw.0 r0.1[0x7c], r0.58
mov.0 r0.57, r0.4
;
mov.0 r0.58, r0.3
stw.0 r0.1[0x78], r0.59
;
mov.0 r0.59, r0.5
;
-- sha_driver_L2?3
add.0 r0.58, r0.58, -0x1
ldw_d.0 r0.3, r0.57[0x4]
add.0 r0.57, r0.57, 0x4
;
mov.0 r0.4, (sha_driver_?1STRINGPACKET.3+0)
;
;
cmpne.0 b0.0, r0.58, r0.0
;
;
;
brf.0 b0.0, sha_driver_L3?3
;
.call fopen arg(r0.3,r0.4) ret(r0.3)
syscall.0 1
;
cmpeq.0 b0.0, r0.3, r0.0
ldw_d.0 r0.4, r0.57[0x0]
mov.0 r0.2, r0.3
;
mov.0 r0.3, (sha_driver_?1STRINGPACKET.4+0)
;
;
brf.0 b0.0, sha_driver_L4?3
;
.call printf arg(r0.3,r0.4) ret(r0.3)
syscall.0 0
;
goto.0 sha_driver_L2?3
;
-- sha_driver_L4?3
.call sha_stream arg(r0.3,r0.4) ret()
mov.0 r0.4, r0.2
stw.0 r0.1[0x70], r0.2
mov.0 r0.3, r0.59
call.0 l0.0, FUNC_sha_stream
;
.call sha_print arg(r0.3) ret()
mov.0 r0.3, r0.59
call.0 l0.0, FUNC_sha_print
;
;
ldw.0 r0.3, r0.1[0x70]
;
;
.call fclose arg(r0.3) ret(r0.3)
syscall.0 2
;
goto.0 sha_driver_L2?3
;
-- sha_driver_L3?3
ldw.0 r0.59, r0.1[0x78]
;
ldw.0 r0.58, r0.1[0x7c]
;
ldw.0 r0.57, r0.1[0x80]
;
;
goto.0 sha_driver_L1?3
;
ENDOFFILE: sha_driver
FILE: _bcopy
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC__bcopy
mov.0 r0.9, 0x3
mov.0 r0.8, 0x2
;
mov.0 r0.6, r0.4
mov.0 r0.2, r0.3
mov.0 r0.4, r0.0
mov.0 r0.7, 0x1
;
-- _bcopy_L0?3
cmpltu.0 b0.0, r0.4, r0.5
ldb_d.0 r0.3, r0.2[0x0]
cmpltu.0 b0.1, r0.7, r0.5
cmpltu.0 b0.2, r0.8, r0.5
;
cmpltu.0 b0.3, r0.9, r0.5
add.0 r0.9, r0.9, 0x4
add.0 r0.8, r0.8, 0x4
add.0 r0.4, r0.4, 0x4
;
add.0 r0.7, r0.7, 0x4
;
brf.0 b0.0, _bcopy_L1?3
;
stb.0 r0.6[0x0], r0.3
brf.0 b0.1, _bcopy_L2?3
;
ldb.0 r0.3, r0.2[0x1]
;
;
;
stb.0 r0.6[0x1], r0.3
brf.0 b0.2, _bcopy_L3?3
;
ldb.0 r0.3, r0.2[0x2]
;
;
;
stb.0 r0.6[0x2], r0.3
brf.0 b0.3, _bcopy_L4?3
;
ldb.0 r0.3, r0.2[0x3]
add.0 r0.2, r0.2, 0x4
;
;
;
stb.0 r0.6[0x3], r0.3
add.0 r0.6, r0.6, 0x4
;
;
goto.0 _bcopy_L0?3
;
-- _bcopy_L4?3
.return arg(return) ret()
return.0 r0.1, r0.1, 0x0, l0.0
;
-- _bcopy_L3?3
.return arg(return) ret()
return.0 r0.1, r0.1, 0x0, l0.0
;
-- _bcopy_L2?3
.return arg(return) ret()
return.0 r0.1, r0.1, 0x0, l0.0
;
-- _bcopy_L1?3
.return arg(return) ret()
return.0 r0.1, r0.1, 0x0, l0.0
;
ENDOFFILE: _bcopy
FILE: memcpy
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC_memcpy
mov.0 r0.9, 0x3
mov.0 r0.8, 0x2
;
mov.0 r0.2, r0.4
mov.0 r0.6, r0.3
mov.0 r0.4, r0.0
mov.0 r0.7, 0x1
;
mov.0 r0.10, r0.3
;
-- memcpy_L0?3
cmpltu.0 b0.0, r0.4, r0.5
ldb_d.0 r0.3, r0.2[0x0]
cmpltu.0 b0.1, r0.7, r0.5
cmpltu.0 b0.2, r0.8, r0.5
;
cmpltu.0 b0.3, r0.9, r0.5
add.0 r0.9, r0.9, 0x4
add.0 r0.8, r0.8, 0x4
add.0 r0.4, r0.4, 0x4
;
add.0 r0.7, r0.7, 0x4
;
brf.0 b0.0, memcpy_L1?3
;
stb.0 r0.6[0x0], r0.3
brf.0 b0.1, memcpy_L2?3
;
ldb.0 r0.3, r0.2[0x1]
;
;
;
stb.0 r0.6[0x1], r0.3
brf.0 b0.2, memcpy_L3?3
;
ldb.0 r0.3, r0.2[0x2]
;
;
;
stb.0 r0.6[0x2], r0.3
brf.0 b0.3, memcpy_L4?3
;
ldb.0 r0.3, r0.2[0x3]
add.0 r0.2, r0.2, 0x4
;
;
;
stb.0 r0.6[0x3], r0.3
add.0 r0.6, r0.6, 0x4
;
;
goto.0 memcpy_L0?3
;
-- memcpy_L4?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.10
return.0 r0.1, r0.1, 0x0, l0.0
;
-- memcpy_L3?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.10
return.0 r0.1, r0.1, 0x0, l0.0
;
-- memcpy_L2?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.10
return.0 r0.1, r0.1, 0x0, l0.0
;
-- memcpy_L1?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.10
return.0 r0.1, r0.1, 0x0, l0.0
;
ENDOFFILE: memcpy
FILE: memset
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC_memset
mov.0 r0.8, 0x3
mov.0 r0.7, 0x2
;
mov.0 r0.2, r0.0
sxtb.0 r0.4, r0.4
mov.0 r0.6, 0x1
mov.0 r0.9, r0.5
;
mov.0 r0.5, r0.3
mov.0 r0.9, r0.3
mov.0 r0.10, r0.9
;
mov.0 r0.3, r0.10
;
-- memset_L0?3
cmpltu.0 b0.0, r0.2, r0.3
cmpltu.0 b0.1, r0.6, r0.3
cmpltu.0 b0.2, r0.7, r0.3
cmpltu.0 b0.3, r0.8, r0.3
;
add.0 r0.6, r0.6, 0x4
add.0 r0.8, r0.8, 0x4
add.0 r0.7, r0.7, 0x4
add.0 r0.2, r0.2, 0x4
;
;
brf.0 b0.0, memset_L1?3
;
stb.0 r0.5[0x0], r0.4
brf.0 b0.1, memset_L1?3
;
stb.0 r0.5[0x1], r0.4
brf.0 b0.2, memset_L1?3
;
stb.0 r0.5[0x2], r0.4
brf.0 b0.3, memset_L1?3
;
stb.0 r0.5[0x3], r0.4
add.0 r0.5, r0.5, 0x4
;
;
goto.0 memset_L0?3
;
-- memset_L1?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.9
return.0 r0.1, r0.1, 0x0, l0.0
;
ENDOFFILE: memset
FILE: sha
.entry arg(r0.3) ret()
-- FUNC_sha_27707.sha_transform
add.0 r0.1, r0.1, -0x140
add.0 r0.6, r0.3, 0x1c
mov.0 r0.4, ~0xf
;
mov.0 r0.9, r0.1
mov.0 r0.14, r0.3
;
mov.0 r0.5, r0.9
;
mov.0 r0.2, r0.6
;
-- sha_L0?3
cmplt.0 b0.0, r0.4, r0.0
ldw_d.0 r0.3, r0.2[0x0]
add.0 r0.4, r0.4, 0x4
;
ldw_d.0 r0.6, r0.2[0x4]
;
ldw_d.0 r0.7, r0.2[0x8]
;
ldw_d.0 r0.8, r0.2[0xc]
add.0 r0.2, r0.2, 0x10
brf.0 b0.0, sha_L1?3
;
stw.0 r0.5[0x0], r0.3
;
stw.0 r0.5[0x4], r0.6
;
stw.0 r0.5[0x8], r0.7
;
stw.0 r0.5[0xc], r0.8
add.0 r0.5, r0.5, 0x10
;
;
goto.0 sha_L0?3
;
-- sha_L1?3
mov.0 r0.4, ~0x3f
mov.0 r0.13, r0.9
;
;
mov.0 r0.2, r0.9
;
-- sha_L2?3
cmplt.0 b0.0, r0.4, r0.0
ldw_d.0 r0.3, r0.2[0x0]
add.0 r0.4, r0.4, 0x4
;
ldw_d.0 r0.5, r0.2[0x34]
;
ldw_d.0 r0.6, r0.2[0x8]
;
ldw_d.0 r0.7, r0.2[0x20]
brf.0 b0.0, sha_L3?3
;
xor.0 r0.3, r0.3, r0.5
ldw.0 r0.5, r0.2[0x2c]
;
ldw.0 r0.8, r0.2[0xc]
;
xor.0 r0.7, r0.6, r0.7
ldw.0 r0.9, r0.2[0x14]
;
ldw.0 r0.10, r0.2[0x4]
;
ldw.0 r0.11, r0.2[0x38]
;
xor.0 r0.3, r0.3, r0.7
ldw.0 r0.7, r0.2[0x24]
xor.0 r0.9, r0.8, r0.9
;
ldw.0 r0.12, r0.2[0x3c]
;
xor.0 r0.10, r0.10, r0.11
ldw.0 r0.11, r0.2[0x10]
;
xor.0 r0.8, r0.8, r0.7
ldw.0 r0.7, r0.2[0x28]
xor.0 r0.5, r0.3, r0.5
;
stw.0 r0.2[0x40], r0.3
xor.0 r0.6, r0.6, r0.12
;
;
xor.0 r0.10, r0.10, r0.8
xor.0 r0.11, r0.11, r0.7
xor.0 r0.5, r0.5, r0.9
;
;
;
xor.0 r0.6, r0.6, r0.11
stw.0 r0.2[0x4c], r0.5
;
stw.0 r0.2[0x44], r0.10
;
;
stw.0 r0.2[0x48], r0.6
add.0 r0.2, r0.2, 0x10
;
;
goto.0 sha_L2?3
;
-- sha_L3?3
ldw.0 r0.12, r0.14[0x10]
mov.0 r0.13, ~0x11
mov.0 r0.23, r0.14
mov.0 r0.22, r0.13
;
ldw.0 r0.5, r0.14[0x0]
mov.0 r0.2, r0.22
mov.0 r0.4, 0x5a827999
;
ldw.0 r0.11, r0.14[0x8]
;
ldw.0 r0.9, r0.14[0xc]
;
ldw.0 r0.8, r0.14[0x4]
;
;
;
-- sha_L4?3
ldw.0 r0.3, r0.2[0x0]
andc.0 r0.10, r0.8, r0.9
shru.0 r0.6, r0.5, 0x1b
shl.0 r0.7, r0.5, 0x5
;
and.0 r0.14, r0.8, r0.11
shru.0 r0.16, r0.8, 0x2
shl.0 r0.8, r0.8, 0x1e
ldw.0 r0.15, r0.2[0x4]
;
andc.0 r0.17, r0.5, r0.11
shru.0 r0.18, r0.5, 0x2
shl.0 r0.19, r0.5, 0x1e
add.0 r0.9, r0.9, r0.4
;
or.0 r0.6, r0.6, r0.7
add.0 r0.3, r0.3, r0.4
cmplt.0 b0.0, r0.13, r0.0
add.0 r0.7, r0.11, r0.4
;
or.0 r0.10, r0.10, r0.14
or.0 r0.16, r0.16, r0.8
ldw_d.0 r0.14, r0.2[0x8]
add.0 r0.2, r0.2, 0xc
;
or.0 r0.18, r0.18, r0.19
add.0 r0.13, r0.13, 0x3
;
add.0 r0.3, r0.3, r0.6
;
and.0 r0.5, r0.5, r0.16
add.0 r0.10, r0.10, r0.12
mov.0 r0.12, r0.16
;
;
;
or.0 r0.17, r0.17, r0.5
add.0 r0.3, r0.3, r0.10
;
;
;
shru.0 r0.6, r0.3, 0x1b
shl.0 r0.10, r0.3, 0x5
add.0 r0.9, r0.9, r0.17
shru.0 r0.17, r0.3, 0x2
;
andc.0 r0.20, r0.3, r0.16
and.0 r0.21, r0.3, r0.18
shl.0 r0.19, r0.3, 0x1e
;
;
or.0 r0.6, r0.6, r0.10
;
or.0 r0.20, r0.20, r0.21
;
;
add.0 r0.15, r0.15, r0.6
;
add.0 r0.7, r0.7, r0.20
;
;
add.0 r0.9, r0.9, r0.15
brf.0 b0.0, sha_L5?3
;
or.0 r0.11, r0.17, r0.19
;
;
mov.0 r0.9, r0.18
shru.0 r0.3, r0.9, 0x1b
shl.0 r0.6, r0.9, 0x5
mov.0 r0.10, r0.9
;
mov.0 r0.8, r0.10
;
;
or.0 r0.3, r0.3, r0.6
;
;
;
add.0 r0.14, r0.14, r0.3
;
;
;
add.0 r0.5, r0.7, r0.14
;
;
goto.0 sha_L4?3
;
-- sha_L5?3
mov.0 r0.11, r0.18
mov.0 r0.8, r0.16
mov.0 r0.12, r0.11
mov.0 r0.13, ~0x11
;
add.0 r0.2, r0.22, 0x50
mov.0 r0.4, 0x6ed9eba1
;
mov.0 r0.5, r0.9
mov.0 r0.9, r0.3
;
;
-- sha_L6?3
ldw.0 r0.3, r0.2[0x0]
xor.0 r0.10, r0.8, r0.9
shru.0 r0.6, r0.5, 0x1b
shl.0 r0.7, r0.5, 0x5
;
shru.0 r0.15, r0.9, 0x2
shl.0 r0.9, r0.9, 0x1e
ldw.0 r0.14, r0.2[0x4]
add.0 r0.8, r0.8, r0.4
;
shru.0 r0.16, r0.5, 0x2
shl.0 r0.17, r0.5, 0x1e
cmplt.0 b0.0, r0.13, r0.0
add.0 r0.18, r0.11, r0.4
;
xor.0 r0.10, r0.10, r0.11
or.0 r0.6, r0.6, r0.7
add.0 r0.3, r0.3, r0.4
ldw_d.0 r0.7, r0.2[0x8]
;
or.0 r0.15, r0.15, r0.9
add.0 r0.2, r0.2, 0xc
add.0 r0.13, r0.13, 0x3
;
or.0 r0.16, r0.16, r0.17
;
add.0 r0.10, r0.10, r0.12
add.0 r0.3, r0.3, r0.6
;
xor.0 r0.6, r0.11, r0.15
mov.0 r0.12, r0.15
;
;
add.0 r0.3, r0.3, r0.10
;
xor.0 r0.6, r0.6, r0.5
;
;
shru.0 r0.10, r0.3, 0x1b
shl.0 r0.17, r0.3, 0x5
shru.0 r0.19, r0.3, 0x2
shl.0 r0.20, r0.3, 0x1e
;
add.0 r0.8, r0.8, r0.6
xor.0 r0.6, r0.3, r0.16
;
;
or.0 r0.10, r0.10, r0.17
;
xor.0 r0.6, r0.6, r0.15
;
;
add.0 r0.14, r0.14, r0.10
;
add.0 r0.18, r0.18, r0.6
;
;
add.0 r0.8, r0.8, r0.14
brf.0 b0.0, sha_L7?3
;
or.0 r0.11, r0.19, r0.20
;
;
mov.0 r0.8, r0.16
mov.0 r0.9, r0.8
shru.0 r0.3, r0.8, 0x1b
shl.0 r0.6, r0.8, 0x5
;
;
;
or.0 r0.3, r0.3, r0.6
;
;
;
add.0 r0.7, r0.7, r0.3
;
;
;
add.0 r0.5, r0.18, r0.7
;
;
goto.0 sha_L6?3
;
-- sha_L7?3
mov.0 r0.11, r0.3
mov.0 r0.9, r0.16
mov.0 r0.12, r0.11
mov.0 r0.13, ~0x11
;
add.0 r0.2, r0.22, 0xa0
mov.0 r0.24, r0.22
mov.0 r0.4, -0x70e44324
;
mov.0 r0.5, r0.8
mov.0 r0.8, r0.15
;
;
-- sha_L8?3
ldw.0 r0.3, r0.2[0x0]
and.0 r0.10, r0.8, r0.9
shru.0 r0.6, r0.5, 0x1b
shl.0 r0.7, r0.5, 0x5
;
and.0 r0.15, r0.8, r0.11
and.0 r0.14, r0.9, r0.11
shru.0 r0.17, r0.11, 0x2
ldw.0 r0.16, r0.2[0x4]
;
and.0 r0.18, r0.9, r0.5
shru.0 r0.19, r0.5, 0x2
shl.0 r0.11, r0.11, 0x1e
add.0 r0.8, r0.8, r0.4
;
or.0 r0.6, r0.6, r0.7
shl.0 r0.7, r0.5, 0x1e
add.0 r0.3, r0.3, r0.4
cmplt.0 b0.0, r0.13, r0.0
;
or.0 r0.10, r0.10, r0.14
ldw_d.0 r0.20, r0.2[0x8]
add.0 r0.14, r0.9, r0.4
add.0 r0.2, r0.2, 0xc
;
or.0 r0.17, r0.17, r0.11
add.0 r0.13, r0.13, 0x3
;
or.0 r0.19, r0.19, r0.7
add.0 r0.3, r0.3, r0.6
;
or.0 r0.10, r0.10, r0.15
;
and.0 r0.6, r0.9, r0.17
and.0 r0.5, r0.5, r0.17
;
and.0 r0.7, r0.17, r0.19
;
add.0 r0.10, r0.10, r0.12
mov.0 r0.12, r0.17
;
or.0 r0.6, r0.6, r0.5
;
;
add.0 r0.3, r0.3, r0.10
;
or.0 r0.6, r0.6, r0.18
;
;
shru.0 r0.10, r0.3, 0x1b
shl.0 r0.15, r0.3, 0x5
shru.0 r0.18, r0.3, 0x2
shl.0 r0.21, r0.3, 0x1e
;
add.0 r0.8, r0.8, r0.6
and.0 r0.22, r0.3, r0.17
and.0 r0.6, r0.3, r0.19
;
;
or.0 r0.10, r0.10, r0.15
;
or.0 r0.7, r0.7, r0.6
;
;
add.0 r0.16, r0.16, r0.10
;
or.0 r0.7, r0.7, r0.22
;
;
add.0 r0.8, r0.8, r0.16
brf.0 b0.0, sha_L9?3
;
add.0 r0.14, r0.14, r0.7
or.0 r0.9, r0.18, r0.21
;
;
mov.0 r0.8, r0.19
shru.0 r0.3, r0.8, 0x1b
shl.0 r0.6, r0.8, 0x5
mov.0 r0.7, r0.8
;
mov.0 r0.11, r0.7
;
;
or.0 r0.3, r0.3, r0.6
;
;
;
add.0 r0.20, r0.20, r0.3
;
;
;
add.0 r0.5, r0.14, r0.20
;
;
goto.0 sha_L8?3
;
-- sha_L9?3
mov.0 r0.9, r0.3
mov.0 r0.11, r0.19
mov.0 r0.12, r0.9
mov.0 r0.13, ~0x11
;
add.0 r0.2, r0.24, 0xf0
mov.0 r0.4, -0x359d3e2a
;
mov.0 r0.5, r0.8
mov.0 r0.8, r0.17
;
;
-- sha_L10?3
ldw.0 r0.3, r0.2[0x0]
xor.0 r0.10, r0.8, r0.9
shru.0 r0.6, r0.5, 0x1b
shl.0 r0.7, r0.5, 0x5
;
shru.0 r0.15, r0.9, 0x2
shl.0 r0.9, r0.9, 0x1e
ldw.0 r0.14, r0.2[0x4]
add.0 r0.8, r0.8, r0.4
;
shru.0 r0.16, r0.5, 0x2
shl.0 r0.17, r0.5, 0x1e
cmplt.0 b0.0, r0.13, r0.0
add.0 r0.18, r0.11, r0.4
;
xor.0 r0.10, r0.10, r0.11
or.0 r0.6, r0.6, r0.7
add.0 r0.3, r0.3, r0.4
ldw_d.0 r0.7, r0.2[0x8]
;
or.0 r0.15, r0.15, r0.9
add.0 r0.2, r0.2, 0xc
add.0 r0.13, r0.13, 0x3
;
or.0 r0.16, r0.16, r0.17
;
add.0 r0.10, r0.10, r0.12
add.0 r0.3, r0.3, r0.6
;
xor.0 r0.6, r0.11, r0.15
mov.0 r0.12, r0.15
;
;
add.0 r0.3, r0.3, r0.10
;
xor.0 r0.6, r0.6, r0.5
;
;
shru.0 r0.10, r0.3, 0x1b
shl.0 r0.17, r0.3, 0x5
shru.0 r0.19, r0.3, 0x2
shl.0 r0.20, r0.3, 0x1e
;
add.0 r0.8, r0.8, r0.6
xor.0 r0.6, r0.3, r0.16
;
;
or.0 r0.10, r0.10, r0.17
;
xor.0 r0.6, r0.6, r0.15
;
;
add.0 r0.14, r0.14, r0.10
;
add.0 r0.18, r0.18, r0.6
;
;
add.0 r0.8, r0.8, r0.14
brf.0 b0.0, sha_L11?3
;
or.0 r0.11, r0.19, r0.20
;
;
mov.0 r0.8, r0.16
shru.0 r0.3, r0.8, 0x1b
shl.0 r0.6, r0.8, 0x5
mov.0 r0.10, r0.8
;
mov.0 r0.9, r0.10
;
;
or.0 r0.3, r0.3, r0.6
;
;
;
add.0 r0.7, r0.7, r0.3
;
;
;
add.0 r0.5, r0.18, r0.7
;
;
goto.0 sha_L10?3
;
-- sha_L11?3
ldw.0 r0.2, r0.23[0x0]
;
ldw.0 r0.4, r0.23[0x4]
;
ldw.0 r0.5, r0.23[0x8]
;
add.0 r0.8, r0.8, r0.2
ldw.0 r0.2, r0.23[0xc]
;
add.0 r0.3, r0.3, r0.4
ldw.0 r0.4, r0.23[0x10]
;
add.0 r0.16, r0.16, r0.5
;
stw.0 r0.23[0x0], r0.8
add.0 r0.15, r0.15, r0.2
;
stw.0 r0.23[0x4], r0.3
add.0 r0.11, r0.11, r0.4
;
stw.0 r0.23[0x8], r0.16
;
stw.0 r0.23[0xc], r0.15
;
.return arg(return) ret()
stw.0 r0.23[0x10], r0.11
return.0 r0.1, r0.1, 0x140, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_sha_init
mov.0 r0.2, 0x67452301
;
mov.0 r0.5, -0x67452302
mov.0 r0.4, -0x10325477
;
mov.0 r0.7, -0x3c2d1e10
mov.0 r0.6, 0x10325476
;
stw.0 r0.3[0x0], r0.2
;
stw.0 r0.3[0x4], r0.4
;
stw.0 r0.3[0x8], r0.5
;
stw.0 r0.3[0xc], r0.6
;
stw.0 r0.3[0x10], r0.7
;
stw.0 r0.3[0x14], r0.0
;
.return arg(return) ret()
stw.0 r0.3[0x18], r0.0
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC_sha_update
add.0 r0.1, r0.1, -0x40
ldw.0 r0.2, r0.3[0x14]
shru.0 r0.6, r0.5, 0x1d
;
add.0 r0.7, r0.3, 0x1c
stw.0 r0.1[0x10], l0.0
;
stw.0 r0.1[0x14], r0.60
;
sh3add.0 r0.8, r0.5, r0.2
stw.0 r0.1[0x18], r0.59
mov.0 r0.60, r0.3
;
mov.0 r0.59, r0.4
stw.0 r0.1[0x1c], r0.58
;
stw.0 r0.1[0x20], r0.57
mov.0 r0.58, r0.7
;
cmpltu.0 b0.0, r0.8, r0.2
ldw_d.0 r0.4, r0.3[0x14]
mov.0 r0.57, r0.5
;
ldw_d.0 r0.7, r0.3[0x18]
;
;
sh3add.0 r0.5, r0.5, r0.4
br.0 b0.0, sha_L12?3
;
-- sha_L13?3
add.0 r0.7, r0.7, r0.6
;
;
stw.0 r0.3[0x14], r0.5
;
stw.0 r0.3[0x18], r0.7
;
-- sha_L14?3
cmpge.0 b0.0, r0.57, 0x40
mov.0 r0.5, 0x40
mov.0 r0.3, r0.58
mov.0 r0.4, r0.59
;
;
;
brf.0 b0.0, sha_L15?3
;
.call memcpy arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_memcpy
;
.call sha_27707 arg(r0.3) ret()
mov.0 r0.3, r0.60
call.0 l0.0, FUNC_sha_27707.sha_transform
;
add.0 r0.57, r0.57, -0x40
add.0 r0.59, r0.59, 0x40
;
;
goto.0 sha_L14?3
;
-- sha_L15?3
add.0 r0.3, r0.60, 0x1c
mov.0 r0.5, r0.57
mov.0 r0.4, r0.59
;
;
.call memcpy arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_memcpy
;
ldw.0 l0.0, r0.1[0x10]
;
ldw.0 r0.60, r0.1[0x14]
;
ldw.0 r0.59, r0.1[0x18]
;
ldw.0 r0.58, r0.1[0x1c]
;
ldw.0 r0.57, r0.1[0x20]
;
;
.return arg(return) ret()
return.0 r0.1, r0.1, 0x40, l0.0
;
-- sha_L12?3
ldw.0 r0.2, r0.3[0x18]
mov.0 r0.60, r0.3
;
;
mov.0 r0.5, r0.57
;
add.0 r0.2, r0.2, 0x1
;
;
;
stw.0 r0.3[0x18], r0.2
;
ldw.0 r0.7, r0.3[0x18]
;
;
sh3add.0 r0.5, r0.5, r0.4
goto.0 sha_L13?3
;
.entry arg(r0.3) ret()
-- FUNC_sha_final
add.0 r0.1, r0.1, -0x40
ldw.0 r0.2, r0.3[0x14]
mov.0 r0.6, 0x80
;
add.0 r0.7, r0.3, 0x1c
mov.0 r0.4, r0.0
stw.0 r0.1[0x10], l0.0
;
stw.0 r0.1[0x14], r0.3
;
shru.0 r0.8, r0.2, 0x3
stw.0 r0.1[0x18], r0.2
;
stw.0 r0.1[0x1c], r0.7
;
ldw.0 r0.7, r0.3[0x18]
;
and.0 r0.8, r0.8, 0x3f
;
;
stw.0 r0.1[0x20], r0.7
;
add.0 r0.2, r0.8, 0x1
add.0 r0.3, r0.3, r0.8
rsub.0 r0.5, 0x3f, r0.8
;
;
;
stb.0 r0.3[0x1c], r0.6
cmpgt.0 b0.0, r0.2, 0x38
add.0 r0.7, r0.3, 0x1d
;
;
;
mov.0 r0.3, r0.7
brf.0 b0.0, sha_L16?3
;
.call memset arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_memset
;
ldw.0 r0.3, r0.1[0x14]
;
;
.call sha_27707 arg(r0.3) ret()
call.0 l0.0, FUNC_sha_27707.sha_transform
;
mov.0 r0.5, 0x38
mov.0 r0.4, r0.0
ldw.0 r0.3, r0.1[0x1c]
;
;
.call memset arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_memset
;
-- sha_L17?3
ldw.0 r0.3, r0.1[0x14]
;
ldw.0 r0.7, r0.1[0x20]
;
ldw.0 r0.2, r0.1[0x18]
;
add.0 r0.4, r0.3, 0x1c
;
;
;
stw.0 r0.4[0x38], r0.7
;
.call sha_27707 arg(r0.3) ret()
stw.0 r0.4[0x3c], r0.2
call.0 l0.0, FUNC_sha_27707.sha_transform
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret()
return.0 r0.1, r0.1, 0x40, l0.0
;
-- sha_L16?3
rsub.0 r0.5, 0x37, r0.8
mov.0 r0.4, r0.0
ldw.0 r0.2, r0.1[0x14]
;
;
;
add.0 r0.2, r0.2, 0x1d
;
;
;
add.0 r0.3, r0.2, r0.8
;
;
.call memset arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_memset
;
goto.0 sha_L17?3
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_sha_stream
add.0 r0.1, r0.1, -0x2040
;
add.0 r0.2, r0.1, 0x10
stw.0 r0.1[0x2010], l0.0
;
stw.0 r0.1[0x2020], r0.4
;
stw.0 r0.1[0x2014], r0.57
;
stw.0 r0.1[0x2018], r0.58
;
stw.0 r0.1[0x201c], r0.59
;
stw.0 r0.1[0x2024], r0.3
;
.call sha_init arg(r0.3) ret()
stw.0 r0.1[0x2028], r0.2
call.0 l0.0, FUNC_sha_init
;
ldw.0 r0.58, r0.1[0x2020]
;
ldw.0 r0.59, r0.1[0x2024]
;
ldw.0 r0.57, r0.1[0x2028]
;
;
;
-- sha_L18?3
mov.0 r0.4, 0x1
mov.0 r0.5, 0x2000
mov.0 r0.3, r0.57
;
.call fread arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.6, r0.58
syscall.0 4
;
cmpgt.0 b0.0, r0.3, r0.0
mov.0 r0.4, r0.57
mov.0 r0.3, r0.59
mov.0 r0.5, r0.3
;
;
;
brf.0 b0.0, sha_L19?3
;
.call sha_update arg(r0.3,r0.4,r0.5) ret()
call.0 l0.0, FUNC_sha_update
;
goto.0 sha_L18?3
;
-- sha_L19?3
.call sha_final arg(r0.3) ret()
mov.0 r0.3, r0.59
call.0 l0.0, FUNC_sha_final
;
ldw.0 l0.0, r0.1[0x2010]
;
ldw.0 r0.59, r0.1[0x201c]
;
ldw.0 r0.58, r0.1[0x2018]
;
ldw.0 r0.57, r0.1[0x2014]
;
;
.return arg(return) ret()
return.0 r0.1, r0.1, 0x2040, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_sha_print
add.0 r0.1, r0.1, -0x20
ldw.0 r0.4, r0.3[0x0]
;
stw.0 r0.1[0x10], l0.0
;
ldw.0 r0.5, r0.3[0x4]
;
ldw.0 r0.6, r0.3[0x8]
;
ldw.0 r0.7, r0.3[0xc]
;
ldw.0 r0.8, r0.3[0x10]
mov.0 r0.3, (sha_?1STRINGPACKET.1+0)
;
;
.call printf arg(r0.3,r0.4,r0.5,r0.6,r0.7,r0.8) ret(r0.3)
syscall.0 0
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret()
return.0 r0.1, r0.1, 0x20, l0.0
;
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
