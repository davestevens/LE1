## Operations - 7827
FILE: core_main
.entry arg() ret()
-- FUNC_main
add.0 r0.1, r0.1, -0x1100
mov.0 r0.33, r0.0
mov.0 r0.34, r0.0
;
add.0 r0.14, r0.1, 0xff8
stw.0 r0.1[0x1050], l0.0
;
add.0 r0.15, r0.1, 0x14
add.0 r0.4, r0.1, 0x10
stw.0 r0.1[0x1074], r0.33
;
add.0 r0.5, r0.1, 0x104c
stw.0 r0.1[0x1090], r0.34
;
add.0 r0.8, r0.1, 0xfb4
stw.0 r0.1[0x1094], r0.14
;
add.0 r0.9, r0.1, 0xfb6
stw.0 r0.1[0x1098], r0.15
;
add.0 r0.10, r0.1, 0xfb8
add.0 r0.6, r0.1, 0xfbc
;
add.0 r0.7, r0.1, 0xfcc
stw.0 r0.1[0x1058], r0.8
;
add.0 r0.15, r0.1, 0xfd0
stw.0 r0.1[0x1064], r0.9
;
add.0 r0.12, r0.1, 0xfd4
stw.0 r0.1[0x109c], r0.10
;
add.0 r0.37, r0.1, 0xfd8
stw.0 r0.1[0x105c], r0.6
;
add.0 r0.38, r0.1, 0xfdc
stw.0 r0.1[0x1060], r0.7
;
add.0 r0.39, r0.1, 0xfec
stw.0 r0.1[0x10a0], r0.15
;
add.0 r0.40, r0.1, 0xfee
stw.0 r0.1[0x1054], r0.12
;
add.0 r0.41, r0.1, 0xff0
stw.0 r0.1[0x10a4], r0.37
;
add.0 r0.42, r0.1, 0xff2
stw.0 r0.1[0x10a8], r0.38
;
add.0 r0.11, r0.1, 0xff4
stw.0 r0.1[0x10ac], r0.39
;
mov.0 r0.43, r0.0
mov.0 r0.44, -0x1
stw.0 r0.1[0x1068], r0.40
;
mov.0 r0.3, r0.14
stw.0 r0.1[0x106c], r0.41
;
stw.0 r0.1[0x1070], r0.42
;
stw.0 r0.1[0x107c], r0.11
;
stw.0 r0.1[0x10b0], r0.43
;
stw.0 r0.1[0x1078], r0.44
;
.call portable_init arg(r0.3,r0.4,r0.5) ret()
stw.0 r0.1[0x10], r0.0
call.0 l0.0, FUNC_portable_init
;
.call get_seed_32 arg(r0.3) ret(r0.3)
mov.0 r0.3, 0x1
call.0 l0.0, FUNC_get_seed_32
;
ldw.0 r0.8, r0.1[0x1058]
;
;
;
sth.0 r0.8[0x0], r0.3
;
.call get_seed_32 arg(r0.3) ret(r0.3)
mov.0 r0.3, 0x2
call.0 l0.0, FUNC_get_seed_32
;
ldw.0 r0.9, r0.1[0x1064]
;
;
;
sth.0 r0.9[0x0], r0.3
;
.call get_seed_32 arg(r0.3) ret(r0.3)
mov.0 r0.3, 0x3
call.0 l0.0, FUNC_get_seed_32
;
ldw.0 r0.10, r0.1[0x109c]
;
;
;
sth.0 r0.10[0x0], r0.3
;
.call get_seed_32 arg(r0.3) ret(r0.3)
mov.0 r0.3, 0x4
call.0 l0.0, FUNC_get_seed_32
;
ldw.0 r0.36, r0.1[0x10a0]
;
;
;
stw.0 r0.36[0x0], r0.3
;
.call get_seed_32 arg(r0.3) ret(r0.3)
mov.0 r0.3, 0x5
call.0 l0.0, FUNC_get_seed_32
;
cmpeq.0 b0.0, r0.3, r0.0
mov.0 r0.14, 0x7
ldw.0 r0.12, r0.1[0x1054]
;
mov.0 r0.2, r0.0
ldw.0 r0.8, r0.1[0x1058]
;
ldw.0 r0.10, r0.1[0x109c]
;
ldw.0 r0.9, r0.1[0x1064]
;
ldh_d.0 r0.15, r0.8[0x0]
;
ldh_d.0 r0.16, r0.10[0x0]
;
ldh_d.0 r0.17, r0.9[0x0]
;
ldh_d.0 r0.18, r0.8[0x0]
;
norl.0 r0.15, r0.15, r0.16
ldh_d.0 r0.19, r0.10[0x0]
;
cmpeq.0 r0.17, r0.17, r0.0
ldh_d.0 r0.20, r0.9[0x0]
;
cmpeq.0 r0.18, r0.18, 0x1
ldw.0 r0.6, r0.1[0x105c]
;
cmpeq.0 r0.19, r0.19, r0.0
ldw.0 r0.7, r0.1[0x1060]
;
andl.0 b0.1, r0.15, r0.17
cmpeq.0 r0.20, r0.20, r0.0
ldw.0 r0.11, r0.1[0x107c]
;
ldw.0 r0.4, r0.1[0x1098]
;
andl.0 r0.18, r0.18, r0.19
ldw.0 r0.32, r0.1[0x1050]
;
ldw.0 r0.33, r0.1[0x1074]
;
ldw.0 r0.34, r0.1[0x1090]
;
andl.0 b0.2, r0.18, r0.20
ldw.0 r0.35, r0.1[0x1094]
;
ldw.0 r0.36, r0.1[0x10a0]
;
ldw.0 r0.37, r0.1[0x10a4]
;
ldw.0 r0.38, r0.1[0x10a8]
;
ldw.0 r0.39, r0.1[0x10ac]
;
ldw.0 r0.40, r0.1[0x1068]
;
ldw.0 r0.41, r0.1[0x106c]
;
ldw.0 r0.42, r0.1[0x1070]
;
ldw.0 r0.43, r0.1[0x10b0]
;
ldw.0 r0.44, r0.1[0x1078]
;
stw.0 r0.12[0x0], r0.3
brf.0 b0.0, core_main_L4?3
;
stw.0 r0.12[0x0], r0.14
br.0 b0.1, core_main_L5?3
;
-- core_main_L6?3
br.0 b0.2, core_main_L7?3
;
-- core_main_L8?3
cmplt.0 b0.0, r0.2, 0x2
mpyl.0 r0.3, r0.2, 0x7d0
mpyl.0 r0.5, r0.2, 0x13
;
ldh_d.0 r0.14, r0.8[0x0]
mpyl.0 r0.15, r0.2, 0x26
mov.0 r0.13, 0x7d0
;
add.0 r0.2, r0.2, 0x1
ldh_d.0 r0.16, r0.9[0x0]
;
add.0 r0.3, r0.3, r0.4
sh2add.0 r0.17, r0.5, r0.6
sh2add.0 r0.18, r0.5, r0.7
brf.0 b0.0, core_main_L9?3
;
sh1add.0 r0.19, r0.15, r0.8
sh1add.0 r0.20, r0.15, r0.9
ldh.0 r0.21, r0.10[0x0]
sh1add.0 r0.22, r0.15, r0.10
;
sh1add.0 r0.15, r0.15, r0.11
ldw.0 r0.23, r0.12[0x0]
sh2add.0 r0.5, r0.5, r0.12
zxth.0 r0.2, r0.2
;
stw.0 r0.17[0x0], r0.3
;
stw.0 r0.18[0x0], r0.13
;
cmplt.0 b0.0, r0.2, 0x2
mpyl.0 r0.3, r0.2, 0x7d0
mpyl.0 r0.17, r0.2, 0x13
;
sth.0 r0.19[0x0], r0.14
add.0 r0.2, r0.2, 0x1
mpyl.0 r0.18, r0.2, 0x26
;
ldh_d.0 r0.14, r0.8[0x0]
;
add.0 r0.3, r0.4, r0.3
sh2add.0 r0.19, r0.17, r0.6
sh2add.0 r0.24, r0.17, r0.7
sh2add.0 r0.17, r0.17, r0.12
;
sh1add.0 r0.25, r0.18, r0.8
sh1add.0 r0.26, r0.18, r0.9
sh1add.0 r0.27, r0.18, r0.10
sh1add.0 r0.18, r0.18, r0.11
;
sth.0 r0.20[0x0], r0.16
zxth.0 r0.2, r0.2
;
ldh_d.0 r0.16, r0.9[0x0]
;
sth.0 r0.22[0x0], r0.21
;
ldh_d.0 r0.20, r0.10[0x0]
cmplt.0 b0.1, r0.2, 0x2
mpyl.0 r0.21, r0.2, 0x7d0
;
sth.0 r0.15[0x0], r0.0
mpyl.0 r0.22, r0.2, 0x13
add.0 r0.2, r0.2, 0x1
mpyl.0 r0.28, r0.2, 0x26
;
stw.0 r0.5[0x0], r0.23
brf.0 b0.0, core_main_L10?3
;
ldw.0 r0.5, r0.12[0x0]
add.0 r0.21, r0.4, r0.21
;
sh2add.0 r0.15, r0.22, r0.6
sh2add.0 r0.23, r0.22, r0.7
sh1add.0 r0.29, r0.28, r0.8
sh1add.0 r0.30, r0.28, r0.9
;
sh1add.0 r0.31, r0.28, r0.10
sh1add.0 r0.28, r0.28, r0.11
sh2add.0 r0.22, r0.22, r0.12
zxth.0 r0.2, r0.2
;
stw.0 r0.19[0x0], r0.3
;
stw.0 r0.24[0x0], r0.13
;
sth.0 r0.25[0x0], r0.14
;
ldh_d.0 r0.3, r0.8[0x0]
;
sth.0 r0.26[0x0], r0.16
;
ldh_d.0 r0.14, r0.9[0x0]
;
sth.0 r0.27[0x0], r0.20
;
ldh_d.0 r0.16, r0.10[0x0]
;
sth.0 r0.18[0x0], r0.0
;
stw.0 r0.17[0x0], r0.5
brf.0 b0.1, core_main_L11?3
;
ldw.0 r0.5, r0.12[0x0]
;
stw.0 r0.15[0x0], r0.21
;
stw.0 r0.23[0x0], r0.13
;
sth.0 r0.29[0x0], r0.3
;
sth.0 r0.30[0x0], r0.14
;
sth.0 r0.31[0x0], r0.16
;
sth.0 r0.28[0x0], r0.0
;
stw.0 r0.22[0x0], r0.5
goto.0 core_main_L8?3
;
-- core_main_L11?3
mov.0 r0.2, r0.0
mov.0 r0.5, r0.43
ldw_d.0 r0.4, r0.12[0x0]
;
goto.0 core_main_L12?3
;
-- core_main_L13?3
cmplt.0 b0.0, r0.2, 0x3
add.0 r0.14, r0.2, 0x1
add.0 r0.13, r0.5, 0x1
mov.0 r0.3, 0x1
;
shl.0 r0.2, r0.3, r0.2
;
;
zxth.0 r0.13, r0.13
zxth.0 r0.14, r0.14
brf.0 b0.0, core_main_L14?3
;
and.0 r0.2, r0.2, r0.4
;
;
cmplt.0 b0.0, r0.14, 0x3
shl.0 r0.15, r0.3, r0.14
add.0 r0.14, r0.14, 0x1
;
cmpne.0 b0.1, r0.2, r0.0
;
;
and.0 r0.15, r0.4, r0.15
zxth.0 r0.14, r0.14
;
slct.0 r0.13, b0.1, r0.13, r0.5
brf.0 b0.0, core_main_L15?3
;
;
cmpne.0 b0.0, r0.15, r0.0
cmplt.0 b0.1, r0.14, 0x3
shl.0 r0.15, r0.3, r0.14
add.0 r0.14, r0.14, 0x1
;
add.0 r0.16, r0.13, 0x1
;
;
and.0 r0.15, r0.4, r0.15
zxth.0 r0.14, r0.14
;
zxth.0 r0.16, r0.16
;
;
cmpne.0 b0.2, r0.15, r0.0
cmplt.0 b0.3, r0.14, 0x3
shl.0 r0.15, r0.3, r0.14
add.0 r0.14, r0.14, 0x1
;
slct.0 r0.16, b0.0, r0.16, r0.13
brf.0 b0.1, core_main_L16?3
;
;
and.0 r0.15, r0.4, r0.15
zxth.0 r0.2, r0.14
;
add.0 r0.3, r0.16, 0x1
;
;
cmpne.0 b0.0, r0.15, r0.0
;
zxth.0 r0.3, r0.3
;
;
;
slct.0 r0.3, b0.2, r0.3, r0.16
brf.0 b0.3, core_main_L17?3
;
;
;
add.0 r0.13, r0.3, 0x1
;
;
;
zxth.0 r0.13, r0.13
;
;
;
slct.0 r0.5, b0.0, r0.13, r0.3
;
;
goto.0 core_main_L13?3
;
-- core_main_L17?3
mov.0 r0.2, r0.0
;
;
mov.0 r0.4, r0.3
;
-- core_main_L18?3
cmplt.0 b0.1, r0.2, 0x2
mpyl.0 r0.3, r0.2, 0x13
cmplt.0 r0.5, r0.4, r0.0
mtb.0 b0.0, r0.0
;
add.0 r0.2, r0.2, 0x1
cmplt.0 r0.13, r0.4, r0.0
cmplt.0 r0.14, r0.4, r0.0
cmplt.0 r0.15, r0.4, r0.0
;
;
sh2add.0 r0.16, r0.3, r0.7
shru.0 r0.17, r0.4, r0.5
sh2add.0 r0.3, r0.3, r0.7
mtb.0 b0.2, r0.5
;
zxth.0 r0.2, r0.2
shru.0 r0.18, r0.4, r0.13
mtb.0 b0.1, r0.13
brf.0 b0.1, core_main_L19?3
;
shru.0 r0.19, r0.4, r0.14
shru.0 r0.20, r0.4, r0.15
mtb.0 b0.3, r0.14
mtb.0 b0.4, r0.15
;
ldw.0 r0.16, r0.16[0x0]
;
cmplt.0 b0.5, r0.2, 0x2
mpyl.0 r0.21, r0.2, 0x13
add.0 r0.2, r0.2, 0x1
;
;
shru.0 r0.5, r0.16, r0.5
cmpgeu.0 r0.16, r0.16, r0.4
;
sh2add.0 r0.22, r0.21, r0.7
sh2add.0 r0.21, r0.21, r0.7
zxth.0 r0.2, r0.2
;
;
addcg.0 r0.23, b0.6, r0.5, r0.5, b0.0
;
divs.0 r0.23, b0.6, r0.0, r0.17, b0.6
addcg.0 r0.5, b0.7, r0.23, r0.23, b0.0
mpyl.0 r0.24, r0.2, 0x13
add.0 r0.25, r0.2, 0x1
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.26, b0.6, r0.5, r0.5, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.5, b0.7, r0.26, r0.26, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.26, b0.6, r0.5, r0.5, b0.6
sh2add.0 r0.5, r0.24, r0.7
sh2add.0 r0.24, r0.24, r0.7
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.27, b0.7, r0.26, r0.26, b0.7
zxth.0 r0.25, r0.25
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.26, b0.6, r0.27, r0.27, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.27, b0.7, r0.26, r0.26, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.26, b0.6, r0.27, r0.27, b0.6
mpyl.0 r0.27, r0.25, 0x13
add.0 r0.28, r0.25, 0x1
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.26, r0.26, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.26, b0.6, r0.29, r0.29, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.26, r0.26, b0.7
sh2add.0 r0.26, r0.27, r0.7
sh2add.0 r0.27, r0.27, r0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.30, b0.6, r0.29, r0.29, b0.6
zxth.0 r0.28, r0.28
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.30, r0.30, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.30, b0.6, r0.29, r0.29, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.30, r0.30, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.30, b0.6, r0.29, r0.29, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.30, r0.30, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.30, b0.6, r0.29, r0.29, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.30, r0.30, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.30, b0.6, r0.29, r0.29, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.30, r0.30, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.30, b0.6, r0.29, r0.29, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.30, r0.30, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.30, b0.6, r0.29, r0.29, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.30, r0.30, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.30, b0.6, r0.29, r0.29, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.30, r0.30, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.30, b0.6, r0.29, r0.29, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.30, r0.30, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.30, b0.6, r0.29, r0.29, b0.6
;
divs.0 r0.23, b0.6, r0.23, r0.17, b0.6
addcg.0 r0.29, b0.7, r0.30, r0.30, b0.7
;
divs.0 r0.23, b0.7, r0.23, r0.17, b0.7
addcg.0 r0.30, b0.6, r0.29, r0.29, b0.6
;
addcg.0 r0.17, b0.7, r0.30, r0.30, b0.7
cmpge.0 r0.23, r0.23, r0.0
cmplt.0 b0.6, r0.2, 0x2
mov.0 r0.2, r0.28
;
orc.0 r0.17, r0.17, r0.0
cmplt.0 b0.7, r0.25, 0x2
;
;
;
sh1add.0 r0.17, r0.17, r0.23
;
;
;
slct.0 r0.16, b0.2, r0.16, r0.17
;
;
;
stw.0 r0.3[0x0], r0.16
brf.0 b0.5, core_main_L20?3
;
ldw.0 r0.22, r0.22[0x0]
;
;
;
shru.0 r0.13, r0.22, r0.13
cmpgeu.0 r0.22, r0.22, r0.4
;
;
;
addcg.0 r0.3, b0.2, r0.13, r0.13, b0.0
;
divs.0 r0.3, b0.2, r0.0, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.3, r0.3, b0.0
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.18, b0.2
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
;
divs.0 r0.3, b0.5, r0.3, r0.18, b0.5
addcg.0 r0.16, b0.2, r0.13, r0.13, b0.2
;
addcg.0 r0.13, b0.5, r0.16, r0.16, b0.5
cmpge.0 r0.3, r0.3, r0.0
;
orc.0 r0.13, r0.13, r0.0
;
;
;
sh1add.0 r0.13, r0.13, r0.3
;
;
;
slct.0 r0.22, b0.1, r0.22, r0.13
;
;
;
stw.0 r0.21[0x0], r0.22
brf.0 b0.6, core_main_L21?3
;
ldw.0 r0.5, r0.5[0x0]
;
;
;
shru.0 r0.14, r0.5, r0.14
cmpgeu.0 r0.5, r0.5, r0.4
;
;
;
addcg.0 r0.3, b0.1, r0.14, r0.14, b0.0
;
divs.0 r0.3, b0.1, r0.0, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.3, r0.3, b0.0
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.19, b0.1
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.19, b0.2
addcg.0 r0.13, b0.1, r0.14, r0.14, b0.1
;
addcg.0 r0.14, b0.2, r0.13, r0.13, b0.2
cmpge.0 r0.3, r0.3, r0.0
;
orc.0 r0.14, r0.14, r0.0
;
;
;
sh1add.0 r0.14, r0.14, r0.3
;
;
;
slct.0 r0.5, b0.3, r0.5, r0.14
;
;
;
stw.0 r0.24[0x0], r0.5
brf.0 b0.7, core_main_L22?3
;
ldw.0 r0.26, r0.26[0x0]
;
;
;
shru.0 r0.15, r0.26, r0.15
cmpgeu.0 r0.26, r0.26, r0.4
;
;
;
addcg.0 r0.3, b0.1, r0.15, r0.15, b0.0
;
divs.0 r0.3, b0.1, r0.0, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.3, r0.3, b0.0
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
divs.0 r0.3, b0.1, r0.3, r0.20, b0.1
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
;
divs.0 r0.3, b0.2, r0.3, r0.20, b0.2
addcg.0 r0.5, b0.1, r0.15, r0.15, b0.1
;
addcg.0 r0.15, b0.2, r0.5, r0.5, b0.2
cmpge.0 r0.3, r0.3, r0.0
;
orc.0 r0.15, r0.15, r0.0
;
;
;
sh1add.0 r0.15, r0.15, r0.3
;
;
;
slct.0 r0.26, b0.4, r0.26, r0.15
;
;
;
stw.0 r0.27[0x0], r0.26
goto.0 core_main_L18?3
;
-- core_main_L22?3
mov.0 r0.5, r0.34
ldw_d.0 r0.4, r0.7[0x0]
;
ldw_d.0 r0.15, r0.12[0x0]
goto.0 core_main_L23?3
;
-- core_main_L24?3
cmplt.0 b0.0, r0.2, 0x3
mpylu.0 r0.13, r0.4, r0.5
ldw_d.0 r0.3, r0.6[0x0]
mov.0 r0.14, 0x1
;
shl.0 r0.16, r0.14, r0.2
add.0 r0.17, r0.2, 0x1
ldw_d.0 r0.18, r0.6[0x4c]
add.0 r0.19, r0.2, 0x14
;
add.0 r0.20, r0.5, 0x1
add.0 r0.21, r0.2, 0x1
;
add.0 r0.3, r0.13, r0.3
brf.0 b0.0, core_main_L25?3
;
and.0 r0.16, r0.15, r0.16
sh2add.0 r0.17, r0.17, r0.6
add.0 r0.18, r0.13, r0.18
sh2add.0 r0.19, r0.19, r0.6
;
zxth.0 r0.21, r0.21
;
;
cmpne.0 b0.0, r0.16, r0.0
;
cmplt.0 b0.1, r0.21, 0x3
shl.0 r0.13, r0.14, r0.21
add.0 r0.22, r0.21, 0x1
add.0 r0.23, r0.21, 0x14
;
add.0 r0.24, r0.21, 0x1
;
brf.0 b0.0, core_main_L26?3
;
zxth.0 r0.5, r0.20
and.0 r0.13, r0.15, r0.13
sh2add.0 r0.22, r0.22, r0.6
sh2add.0 r0.23, r0.23, r0.6
;
stw.0 r0.17[0x0], r0.3
zxth.0 r0.24, r0.24
;
ldw_d.0 r0.3, r0.6[0x0]
;
stw.0 r0.19[0x0], r0.18
cmpne.0 b0.0, r0.13, r0.0
mpylu.0 r0.16, r0.4, r0.5
add.0 r0.17, r0.5, 0x1
;
-- core_main_L27?3
ldw_d.0 r0.18, r0.6[0x4c]
cmplt.0 b0.1, r0.24, 0x3
shl.0 r0.19, r0.14, r0.24
brf.0 b0.1, core_main_L28?3
;
add.0 r0.20, r0.24, 0x1
add.0 r0.25, r0.24, 0x14
add.0 r0.26, r0.24, 0x1
;
add.0 r0.3, r0.16, r0.3
brf.0 b0.0, core_main_L29?3
;
add.0 r0.18, r0.16, r0.18
zxth.0 r0.5, r0.17
and.0 r0.19, r0.15, r0.19
;
sh2add.0 r0.20, r0.20, r0.6
sh2add.0 r0.25, r0.25, r0.6
zxth.0 r0.2, r0.26
;
stw.0 r0.22[0x0], r0.3
;
cmpne.0 b0.0, r0.19, r0.0
mpylu.0 r0.13, r0.4, r0.5
add.0 r0.14, r0.5, 0x1
ldw_d.0 r0.3, r0.6[0x0]
;
stw.0 r0.23[0x0], r0.18
brf.0 b0.1, core_main_L30?3
;
-- core_main_L31?3
ldw_d.0 r0.16, r0.6[0x4c]
;
add.0 r0.3, r0.13, r0.3
brf.0 b0.0, core_main_L32?3
;
zxth.0 r0.5, r0.14
;
add.0 r0.16, r0.13, r0.16
;
stw.0 r0.20[0x0], r0.3
;
;
stw.0 r0.25[0x0], r0.16
goto.0 core_main_L24?3
;
-- core_main_L32?3
;
goto.0 core_main_L24?3
;
-- core_main_L30?3
stw.0 r0.1[0x1064], r0.9
;
-- core_main_L34?3
stw.0 r0.1[0x1058], r0.8
goto.0 core_main_L33?3
;
-- core_main_L35?3
cmplt.0 b0.0, r0.57, 0x2
mpyl.0 r0.58, r0.57, 0x13
ldw_d.0 r0.3, r0.7[0x0]
mpyl.0 r0.2, r0.57, 0x26
;
;
;
sh2add.0 r0.12, r0.58, r0.12
add.0 r0.13, r0.58, 0x1
sh1add.0 r0.2, r0.2, r0.8
brf.0 b0.0, core_main_L36?3
;
;
;
ldw.0 r0.12, r0.12[0x0]
sh2add.0 r0.13, r0.13, r0.6
;
ldh_d.0 r0.5, r0.2[0x0]
;
;
and.0 r0.12, r0.12, 0x1
ldw_d.0 r0.4, r0.13[0x0]
;
;
;
cmpne.0 b0.0, r0.12, r0.0
;
;
;
brf.0 b0.0, core_main_L37?3
;
.call core_list_init arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_core_list_init
;
sh2add.0 r0.58, r0.58, r0.59
mpyl.0 r0.2, r0.57, 0x13
ldw.0 r0.12, r0.1[0x1054]
;
mpyl.0 r0.13, r0.57, 0x26
mpyl.0 r0.14, r0.57, 0x4c
ldw.0 r0.9, r0.1[0x1064]
;
ldw.0 r0.8, r0.1[0x1058]
;
sh2add.0 r0.12, r0.2, r0.12
add.0 r0.15, r0.2, 0x2
ldw.0 r0.16, r0.1[0x105c]
;
sh1add.0 r0.9, r0.13, r0.9
add.0 r0.6, r0.14, r0.60
ldw.0 r0.7, r0.1[0x1060]
;
stw.0 r0.58[0x0], r0.3
sh1add.0 r0.8, r0.13, r0.8
;
-- core_main_L38?3
ldw.0 r0.12, r0.12[0x0]
sh2add.0 r0.15, r0.15, r0.16
;
ldh_d.0 r0.9, r0.9[0x0]
;
ldh_d.0 r0.8, r0.8[0x0]
;
and.0 r0.12, r0.12, 0x2
ldw_d.0 r0.4, r0.15[0x0]
;
ldw_d.0 r0.3, r0.7[0x0]
shl.0 r0.9, r0.9, 0x10
;
;
cmpne.0 b0.0, r0.12, r0.0
;
or.0 r0.5, r0.9, r0.8
;
;
brf.0 b0.0, core_main_L39?3
;
.call core_init_matrix arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
call.0 l0.0, FUNC_core_init_matrix
;
-- core_main_L39?3
mpyl.0 r0.2, r0.57, 0x13
mpyl.0 r0.13, r0.57, 0x26
ldw.0 r0.12, r0.1[0x1054]
;
ldw.0 r0.8, r0.1[0x1058]
;
ldw.0 r0.6, r0.1[0x105c]
;
sh2add.0 r0.12, r0.2, r0.12
add.0 r0.14, r0.2, 0x3
ldw.0 r0.7, r0.1[0x1060]
;
sh1add.0 r0.13, r0.13, r0.8
;
;
ldw.0 r0.12, r0.12[0x0]
sh2add.0 r0.14, r0.14, r0.6
;
ldh_d.0 r0.4, r0.13[0x0]
;
ldw_d.0 r0.3, r0.7[0x0]
;
and.0 r0.12, r0.12, 0x4
ldw_d.0 r0.5, r0.14[0x0]
;
;
;
cmpne.0 b0.0, r0.12, r0.0
;
;
;
brf.0 b0.0, core_main_L40?3
;
.call core_init_state arg(r0.3,r0.4,r0.5) ret()
call.0 l0.0, FUNC_core_init_state
;
-- core_main_L40?3
add.0 r0.57, r0.57, 0x1
ldw.0 r0.12, r0.1[0x1054]
;
ldw.0 r0.7, r0.1[0x1060]
;
ldw.0 r0.6, r0.1[0x105c]
;
zxth.0 r0.57, r0.57
ldw.0 r0.9, r0.1[0x1064]
;
ldw.0 r0.8, r0.1[0x1058]
;
;
goto.0 core_main_L35?3
;
-- core_main_L37?3
mpyl.0 r0.2, r0.57, 0x13
mpyl.0 r0.13, r0.57, 0x26
ldw.0 r0.3, r0.1[0x1054]
;
mpyl.0 r0.14, r0.57, 0x4c
ldw.0 r0.9, r0.1[0x1064]
;
ldw.0 r0.16, r0.1[0x105c]
;
sh2add.0 r0.12, r0.2, r0.3
add.0 r0.15, r0.2, 0x2
ldw.0 r0.8, r0.1[0x1058]
;
;
sh1add.0 r0.9, r0.13, r0.9
add.0 r0.6, r0.14, r0.60
ldw.0 r0.7, r0.1[0x1060]
;
sh1add.0 r0.8, r0.13, r0.8
goto.0 core_main_L38?3
;
-- core_main_L36?3
ldw.0 r0.3, r0.62[0x0]
mov.0 r0.57, r0.0
mov.0 r0.58, r0.0
mov.0 r0.4, 0x1
;
mov.0 r0.59, r0.62
;
;
cmpeq.0 b0.0, r0.3, r0.0
;
;
;
brf.0 b0.0, core_main_L41?3
;
stw.0 r0.62[0x0], r0.4
;
-- core_main_L42?3
mov.0 r0.6, r0.0
mov.0 r0.5, 0x3ff00000
mov.0 r0.3, r0.57
;
.call _d_lt arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.4, r0.58
call.0 l0.0, FUNC__d_lt
;
cmpne.0 b0.0, r0.3, r0.0
ldw_d.0 r0.2, r0.59[0x0]
;
;
;
mpyl.0 r0.2, r0.2, 0xa
brf.0 b0.0, core_main_L43?3
;
;
;
.call start_time arg() ret()
stw.0 r0.59[0x0], r0.2
call.0 l0.0, FUNC_start_time
;
ldw.0 r0.3, r0.1[0x1058]
;
;
.call iterate arg(r0.3) ret(r0.3)
call.0 l0.0, FUNC_iterate
;
.call stop_time arg() ret()
call.0 l0.0, FUNC_stop_time
;
.call get_time arg() ret(r0.3)
call.0 l0.0, FUNC_get_time
;
.call time_in_secs arg(r0.3) ret(r0.3,r0.4)
call.0 l0.0, FUNC_time_in_secs
;
mov.0 r0.58, r0.4
mov.0 r0.57, r0.3
ldw.0 r0.8, r0.1[0x1058]
;
;
goto.0 core_main_L42?3
;
-- core_main_L43?3
mov.0 r0.4, r0.58
mov.0 r0.3, r0.57
;
.call _d_ufix arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC__d_ufix
;
cmpne.0 b0.0, r0.3, r0.0
ldw.0 r0.4, r0.59[0x0]
mov.0 r0.2, 0xa
mtb.0 b0.1, r0.0
;
mov.0 r0.62, r0.59
;
;
slct.0 r0.3, b0.0, r0.3, 0x1
;
;
;
cmplt.0 r0.5, r0.3, r0.0
cmpgeu.0 r0.6, r0.2, r0.3
;
;
;
shru.0 r0.3, r0.3, r0.5
shru.0 r0.2, r0.2, r0.5
mtb.0 b0.0, r0.5
;
;
;
addcg.0 r0.5, b0.2, r0.2, r0.2, b0.1
;
divs.0 r0.5, b0.2, r0.0, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.5, r0.5, b0.1
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
divs.0 r0.5, b0.2, r0.5, r0.3, b0.2
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.3, b0.3
addcg.0 r0.7, b0.2, r0.2, r0.2, b0.2
;
addcg.0 r0.2, b0.3, r0.7, r0.7, b0.3
cmpge.0 r0.5, r0.5, r0.0
;
orc.0 r0.2, r0.2, r0.0
;
;
;
sh1add.0 r0.2, r0.2, r0.5
;
;
;
slct.0 r0.6, b0.0, r0.6, r0.2
;
;
;
add.0 r0.6, r0.6, 0x1
;
;
;
mpylu.0 r0.2, r0.4, r0.6
mpyhs.0 r0.4, r0.4, r0.6
;
;
;
add.0 r0.2, r0.2, r0.4
;
;
;
stw.0 r0.59[0x0], r0.2
;
-- core_main_L41?3
.call start_time arg() ret()
call.0 l0.0, FUNC_start_time
;
ldw.0 r0.2, r0.0[(default_num_contexts+0)]
mov.0 r0.57, r0.0
mov.0 r0.3, 0x2
;
mov.0 r0.58, r0.62
ldw.0 r0.8, r0.1[0x1058]
;
ldw.0 r0.12, r0.1[0x1054]
;
cmpgtu.0 b0.0, r0.2, 0x2
;
;
;
brf.0 b0.0, core_main_L44?3
;
stw.0 r0.0[(default_num_contexts+0)], r0.3
;
-- core_main_L44?3
ldw.0 r0.2, r0.0[(default_num_contexts+0)]
mpyl.0 r0.4, r0.57, 0x13
mpyl.0 r0.5, r0.57, 0x4c
;
ldw_d.0 r0.6, r0.58[0x0]
;
ldw_d.0 r0.13, r0.12[0x0]
;
cmpltu.0 b0.0, r0.57, r0.2
sh2add.0 r0.2, r0.4, r0.58
sh2add.0 r0.4, r0.4, r0.12
add.0 r0.3, r0.5, r0.8
;
;
;
brf.0 b0.0, core_main_L45?3
;
stw.0 r0.2[0x0], r0.6
;
.call core_start_parallel arg(r0.3) ret(r0.3)
stw.0 r0.4[0x0], r0.13
call.0 l0.0, FUNC_core_start_parallel
;
add.0 r0.57, r0.57, 0x1
ldw.0 r0.12, r0.1[0x1054]
;
ldw.0 r0.8, r0.1[0x1058]
;
;
zxth.0 r0.57, r0.57
;
;
goto.0 core_main_L44?3
;
-- core_main_L45?3
mov.0 r0.57, r0.0
ldw.0 r0.8, r0.1[0x1058]
;
;
;
-- core_main_L46?3
ldw.0 r0.2, r0.0[(default_num_contexts+0)]
mpyl.0 r0.4, r0.57, 0x4c
;
;
;
cmpltu.0 b0.0, r0.57, r0.2
add.0 r0.3, r0.4, r0.8
;
;
;
brf.0 b0.0, core_main_L47?3
;
.call core_stop_parallel arg(r0.3) ret(r0.3)
call.0 l0.0, FUNC_core_stop_parallel
;
add.0 r0.57, r0.57, 0x1
ldw.0 r0.8, r0.1[0x1058]
;
;
;
zxth.0 r0.57, r0.57
;
;
goto.0 core_main_L46?3
;
-- core_main_L47?3
.call stop_time arg() ret()
call.0 l0.0, FUNC_stop_time
;
.call get_time arg() ret(r0.3)
call.0 l0.0, FUNC_get_time
;
mov.0 r0.4, r0.0
stw.0 r0.1[0x10d0], r0.3
;
ldw.0 r0.8, r0.1[0x1058]
;
;
;
ldh.0 r0.3, r0.8[0x0]
;
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crc16
;
ldw.0 r0.9, r0.1[0x1064]
mov.0 r0.4, r0.3
;
;
;
ldh.0 r0.3, r0.9[0x0]
;
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crc16
;
ldh.0 r0.61, r0.61[0x0]
mov.0 r0.4, r0.3
;
;
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
mov.0 r0.3, r0.61
call.0 l0.0, FUNC_crc16
;
ldw.0 r0.7, r0.1[0x1060]
mov.0 r0.4, r0.3
;
;
;
ldw.0 r0.7, r0.7[0x0]
;
;
;
sxth.0 r0.3, r0.7
;
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crc16
;
cmpeq.0 b0.0, r0.3, 0x18f2
stw.0 r0.1[0x10d4], r0.3
;
;
;
mov.0 r0.3, (core_main_?1STRINGPACKET.9+0)
brf.0 b0.0, core_main_L48?3
;
mov.0 r0.8, 0x4
;
.call printf arg(r0.3) ret(r0.3)
stw.0 r0.1[0x1078], r0.8
syscall.0 0
;
-- core_main_L49?3
;
;
ldw.0 r0.60, r0.1[0x1078]
;
;
;
cmpge.0 b0.0, r0.60, r0.0
;
;
;
br.0 b0.0, core_main_L50?3
;
-- core_main_L51?3
.call check_data_types arg() ret(r0.3)
call.0 l0.0, FUNC_check_data_types
;
ldw.0 r0.7, r0.1[0x1060]
;
ldw.0 r0.13, r0.1[0x1074]
;
;
ldw.0 r0.4, r0.7[0x0]
;
add.0 r0.3, r0.3, r0.13
;
;
;
sxth.0 r0.61, r0.3
;
;
;
.call printf arg(r0.3,r0.4) ret(r0.3)
mov.0 r0.3, (core_main_?1STRINGPACKET.13+0)
syscall.0 0
;
mov.0 r0.3, (core_main_?1STRINGPACKET.14+0)
ldw.0 r0.4, r0.1[0x10d0]
;
;
.call printf arg(r0.3,r0.4) ret(r0.3)
syscall.0 0
;
ldw.0 r0.3, r0.1[0x10d0]
;
;
.call time_in_secs arg(r0.3) ret(r0.3,r0.4)
call.0 l0.0, FUNC_time_in_secs
;
mov.0 r0.5, r0.3
mov.0 r0.6, r0.4
;
.call printf arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.3, (core_main_?1STRINGPACKET.15+0)
mov.0 r0.4, r0.0
syscall.0 0
;
ldw.0 r0.3, r0.1[0x10d0]
;
;
.call time_in_secs arg(r0.3) ret(r0.3,r0.4)
call.0 l0.0, FUNC_time_in_secs
;
.call _d_gt arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
call.0 l0.0, FUNC__d_gt
;
cmpne.0 b0.0, r0.3, r0.0
;
;
;
ldw.0 r0.3, r0.1[0x10d0]
br.0 b0.0, core_main_L52?3
;
-- core_main_L53?3
;
.call time_in_secs arg(r0.3) ret(r0.3,r0.4)
call.0 l0.0, FUNC_time_in_secs
;
.call _d_lt arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.6, r0.0
mov.0 r0.5, 0x40240000
call.0 l0.0, FUNC__d_lt
;
cmpne.0 b0.0, r0.3, r0.0
ldw_d.0 r0.2, r0.58[0x0]
;
ldw_d.0 r0.5, r0.0[(default_num_contexts+0)]
;
;
mov.0 r0.3, (core_main_?1STRINGPACKET.18+0)
br.0 b0.0, core_main_L54?3
;
-- core_main_L55?3
mpylu.0 r0.15, r0.2, r0.5
mpyhs.0 r0.16, r0.2, r0.5
;
;
;
add.0 r0.4, r0.15, r0.16
;
;
.call printf arg(r0.3,r0.4) ret(r0.3)
syscall.0 0
;
mov.0 r0.4, (core_main_?1STRINGPACKET.20+0)
mov.0 r0.3, (core_main_?1STRINGPACKET.19+0)
;
.call printf arg(r0.3,r0.4) ret(r0.3)
syscall.0 0
;
mov.0 r0.4, (core_main_?1STRINGPACKET.22+0)
mov.0 r0.3, (core_main_?1STRINGPACKET.21+0)
;
.call printf arg(r0.3,r0.4) ret(r0.3)
syscall.0 0
;
ldw.0 r0.5, r0.0[(default_num_contexts+0)]
mov.0 r0.4, (core_main_?1STRINGPACKET.24+0)
;
mov.0 r0.3, (core_main_?1STRINGPACKET.23+0)
;
.call printf arg(r0.3,r0.4,r0.5) ret(r0.3)
syscall.0 0
;
mov.0 r0.4, (core_main_?1STRINGPACKET.26+0)
mov.0 r0.3, (core_main_?1STRINGPACKET.25+0)
;
.call printf arg(r0.3,r0.4) ret(r0.3)
syscall.0 0
;
mov.0 r0.3, (core_main_?1STRINGPACKET.27+0)
ldw.0 r0.4, r0.1[0x10d4]
;
;
.call printf arg(r0.3,r0.4) ret(r0.3)
syscall.0 0
;
mov.0 r0.57, r0.0
ldw.0 r0.12, r0.1[0x1054]
;
ldw.0 r0.6, r0.1[0x1068]
;
ldw.0 r0.59, r0.1[0x10d0]
;
ldw.0 r0.12, r0.12[0x0]
;
ldw.0 r0.60, r0.1[0x1078]
;
;
and.0 r0.12, r0.12, 0x1
;
;
;
cmpne.0 b0.0, r0.12, r0.0
;
;
;
brf.0 b0.0, core_main_L56?3
;
-- core_main_L57?3
ldw.0 r0.7, r0.0[(default_num_contexts+0)]
mpyl.0 r0.2, r0.57, 0x26
mov.0 r0.4, r0.57
;
mov.0 r0.3, (core_main_?1STRINGPACKET.28+0)
;
;
cmpltu.0 b0.0, r0.57, r0.7
sh1add.0 r0.2, r0.2, r0.6
;
;
;
ldhu_d.0 r0.5, r0.2[0x0]
brf.0 b0.0, core_main_L58?3
;
;
.call printf arg(r0.3,r0.4,r0.5) ret(r0.3)
syscall.0 0
;
add.0 r0.57, r0.57, 0x1
ldw.0 r0.6, r0.1[0x1068]
;
;
;
zxth.0 r0.57, r0.57
;
;
goto.0 core_main_L57?3
;
-- core_main_L58?3
;
;
-- core_main_L56?3
mov.0 r0.57, r0.0
ldw.0 r0.12, r0.1[0x1054]
;
ldw.0 r0.9, r0.1[0x106c]
;
;
ldw.0 r0.12, r0.12[0x0]
;
;
;
and.0 r0.12, r0.12, 0x2
;
;
;
cmpne.0 b0.0, r0.12, r0.0
;
;
;
brf.0 b0.0, core_main_L59?3
;
-- core_main_L60?3
ldw.0 r0.6, r0.0[(default_num_contexts+0)]
mpyl.0 r0.2, r0.57, 0x26
mov.0 r0.4, r0.57
;
mov.0 r0.3, (core_main_?1STRINGPACKET.29+0)
;
;
cmpltu.0 b0.0, r0.57, r0.6
sh1add.0 r0.2, r0.2, r0.9
;
;
;
ldhu_d.0 r0.5, r0.2[0x0]
brf.0 b0.0, core_main_L61?3
;
;
.call printf arg(r0.3,r0.4,r0.5) ret(r0.3)
syscall.0 0
;
add.0 r0.57, r0.57, 0x1
ldw.0 r0.9, r0.1[0x106c]
;
;
;
zxth.0 r0.57, r0.57
;
;
goto.0 core_main_L60?3
;
-- core_main_L61?3
;
;
-- core_main_L59?3
mov.0 r0.57, r0.0
mov.0 r0.62, r0.58
ldw.0 r0.12, r0.1[0x1054]
;
mov.0 r0.58, r0.63
;
;
ldw.0 r0.12, r0.12[0x0]
;
;
;
and.0 r0.12, r0.12, 0x4
;
;
;
cmpne.0 b0.0, r0.12, r0.0
;
;
;
br.0 b0.0, core_main_L62?3
;
-- core_main_L63?3
ldw.0 r0.6, r0.0[(default_num_contexts+0)]
mpyl.0 r0.2, r0.57, 0x26
mov.0 r0.4, r0.57
;
mov.0 r0.3, (core_main_?1STRINGPACKET.31+0)
;
;
cmpltu.0 b0.0, r0.57, r0.6
sh1add.0 r0.2, r0.2, r0.58
;
;
;
ldhu_d.0 r0.5, r0.2[0x0]
brf.0 b0.0, core_main_L64?3
;
;
.call printf arg(r0.3,r0.4,r0.5) ret(r0.3)
syscall.0 0
;
add.0 r0.57, r0.57, 0x1
;
;
;
zxth.0 r0.57, r0.57
;
;
goto.0 core_main_L63?3
;
-- core_main_L64?3
cmpeq.0 b0.0, r0.61, r0.0
mov.0 r0.3, (core_main_?1STRINGPACKET.32+0)
;
;
;
brf.0 b0.0, core_main_L65?3
;
.call printf arg(r0.3) ret(r0.3)
syscall.0 0
;
cmpeq.0 b0.0, r0.60, 0x3
mov.0 r0.3, r0.59
;
;
;
brf.0 b0.0, core_main_L65?3
;
.call time_in_secs arg(r0.3) ret(r0.3,r0.4)
call.0 l0.0, FUNC_time_in_secs
;
stw.0 r0.1[0x10d8], r0.3
;
stw.0 r0.1[0x10dc], r0.4
;
ldw.0 r0.62, r0.62[0x0]
;
ldw.0 r0.2, r0.0[(default_num_contexts+0)]
;
;
;
mpylu.0 r0.4, r0.62, r0.2
mpyhs.0 r0.62, r0.62, r0.2
;
;
;
add.0 r0.3, r0.4, r0.62
;
;
.call _d_ufloat arg(r0.3) ret(r0.3,r0.4)
call.0 l0.0, FUNC__d_ufloat
;
ldw.0 r0.5, r0.1[0x10d8]
;
ldw.0 r0.6, r0.1[0x10dc]
;
;
.call _d_div arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, FUNC__d_div
;
mov.0 r0.8, (core_main_?1STRINGPACKET.35+0)
mov.0 r0.7, (core_main_?1STRINGPACKET.34+0)
;
mov.0 r0.3, (core_main_?1STRINGPACKET.33+0)
mov.0 r0.5, r0.3
mov.0 r0.6, r0.4
;
.call printf arg(r0.3,r0.4,r0.5,r0.6,r0.7,r0.8) ret(r0.3)
mov.0 r0.4, r0.0
syscall.0 0
;
ldw.0 r0.4, r0.0[(mem_name+8)]
mov.0 r0.3, (core_main_?1STRINGPACKET.36+0)
;
;
.call printf arg(r0.3,r0.4) ret(r0.3)
syscall.0 0
;
ldw.0 r0.4, r0.0[(default_num_contexts+0)]
mov.0 r0.5, (core_main_?1STRINGPACKET.38+0)
;
mov.0 r0.3, (core_main_?1STRINGPACKET.37+0)
;
.call printf arg(r0.3,r0.4,r0.5) ret(r0.3)
syscall.0 0
;
.call printf arg(r0.3) ret(r0.3)
mov.0 r0.3, (core_main_?1STRINGPACKET.39+0)
syscall.0 0
;
;
-- core_main_L65?3
cmpgt.0 b0.0, r0.61, r0.0
mov.0 r0.3, (core_main_?1STRINGPACKET.40+0)
;
;
;
brf.0 b0.0, core_main_L66?3
;
.call printf arg(r0.3) ret(r0.3)
syscall.0 0
;
-- core_main_L66?3
cmplt.0 b0.0, r0.61, r0.0
mov.0 r0.3, (core_main_?1STRINGPACKET.41+0)
;
;
;
brf.0 b0.0, core_main_L67?3
;
.call printf arg(r0.3) ret(r0.3)
syscall.0 0
;
-- core_main_L67?3
ldw.0 r0.3, r0.1[0x1094]
;
;
.call portable_fini arg(r0.3) ret()
call.0 l0.0, FUNC_portable_fini
;
ldw.0 l0.0, r0.1[0x1050]
mov.0 r0.3, r0.0
;
ldw.0 r0.63, r0.1[0x10cc]
;
ldw.0 r0.62, r0.1[0x10c8]
;
ldw.0 r0.61, r0.1[0x10c4]
;
ldw.0 r0.60, r0.1[0x10c0]
;
ldw.0 r0.59, r0.1[0x10bc]
;
ldw.0 r0.58, r0.1[0x10b8]
;
ldw.0 r0.57, r0.1[0x10b4]
;
;
.return arg(return) ret(r0.3)
.call exit arg(r0.3) ret(r0.3)
call.0 l0.0, FUNC_exit
;
-- core_main_L62?3
mov.0 r0.57, r0.0
ldw.0 r0.10, r0.1[0x1070]
;
;
;
-- core_main_L68?3
ldw.0 r0.6, r0.0[(default_num_contexts+0)]
mpyl.0 r0.2, r0.57, 0x26
mov.0 r0.4, r0.57
;
mov.0 r0.3, (core_main_?1STRINGPACKET.30+0)
;
;
cmpltu.0 b0.0, r0.57, r0.6
sh1add.0 r0.2, r0.2, r0.10
;
;
;
ldhu_d.0 r0.5, r0.2[0x0]
brf.0 b0.0, core_main_L69?3
;
;
.call printf arg(r0.3,r0.4,r0.5) ret(r0.3)
syscall.0 0
;
add.0 r0.57, r0.57, 0x1
ldw.0 r0.10, r0.1[0x1070]
;
;
;
zxth.0 r0.57, r0.57
;
;
goto.0 core_main_L68?3
;
-- core_main_L69?3
mov.0 r0.57, r0.0
;
goto.0 core_main_L63?3
;
-- core_main_L54?3
.call printf arg(r0.3) ret(r0.3)
mov.0 r0.3, (core_main_?1STRINGPACKET.17+0)
syscall.0 0
;
add.0 r0.61, r0.61, 0x1
ldw.0 r0.2, r0.58[0x0]
mov.0 r0.3, (core_main_?1STRINGPACKET.18+0)
;
ldw.0 r0.5, r0.0[(default_num_contexts+0)]
;
;
sxth.0 r0.61, r0.61
;
;
goto.0 core_main_L55?3
;
-- core_main_L52?3
;
.call time_in_secs arg(r0.3) ret(r0.3,r0.4)
call.0 l0.0, FUNC_time_in_secs
;
stw.0 r0.1[0x10e0], r0.3
;
stw.0 r0.1[0x10e4], r0.4
;
ldw.0 r0.2, r0.58[0x0]
;
ldw.0 r0.4, r0.0[(default_num_contexts+0)]
;
;
;
mpylu.0 r0.5, r0.2, r0.4
mpyhs.0 r0.2, r0.2, r0.4
;
;
;
add.0 r0.3, r0.5, r0.2
;
;
.call _d_ufloat arg(r0.3) ret(r0.3,r0.4)
call.0 l0.0, FUNC__d_ufloat
;
ldw.0 r0.5, r0.1[0x10e0]
;
ldw.0 r0.6, r0.1[0x10e4]
;
;
.call _d_div arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, FUNC__d_div
;
mov.0 r0.3, (core_main_?1STRINGPACKET.16+0)
mov.0 r0.5, r0.3
mov.0 r0.6, r0.4
;
.call printf arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.4, r0.0
syscall.0 0
;
ldw.0 r0.3, r0.1[0x10d0]
goto.0 core_main_L53?3
;
-- core_main_L50?3
mov.0 r0.3, r0.0
ldw.0 r0.12, r0.1[0x1054]
;
ldw.0 r0.6, r0.1[0x1068]
;
ldw.0 r0.9, r0.1[0x106c]
;
ldw.0 r0.10, r0.1[0x1070]
;
ldw.0 r0.13, r0.1[0x1074]
;
ldw.0 r0.8, r0.1[0x1078]
;
ldw.0 r0.11, r0.1[0x107c]
;
;
;
-- core_main_L70?3
ldw.0 r0.2, r0.0[(default_num_contexts+0)]
mpyl.0 r0.4, r0.3, 0x26
mpyl.0 r0.5, r0.3, 0x13
;
sh1add.0 r0.14, r0.8, (core_main_9217.list_known_crc+0)
mpyl.0 r0.15, r0.3, 0x13
mpyl.0 r0.16, r0.3, 0x26
;
sh1add.0 r0.17, r0.8, (core_main_9217.matrix_known_crc+0)
mpyl.0 r0.18, r0.3, 0x13
mpyl.0 r0.19, r0.3, 0x26
;
cmpltu.0 b0.0, r0.3, r0.2
sh1add.0 r0.20, r0.4, r0.11
sh2add.0 r0.5, r0.5, r0.12
sh1add.0 r0.21, r0.4, r0.6
;
ldhu_d.0 r0.14, r0.14[0x0]
sh2add.0 r0.15, r0.15, r0.12
sh1add.0 r0.22, r0.16, r0.9
mpyl.0 r0.23, r0.3, 0x26
;
ldhu_d.0 r0.17, r0.17[0x0]
sh2add.0 r0.18, r0.18, r0.12
sh1add.0 r0.24, r0.19, r0.10
add.0 r0.25, r0.3, 0x1
;
ldw_d.0 r0.5, r0.5[0x0]
sh1add.0 r0.2, r0.8, (core_main_9217.state_known_crc+0)
brf.0 b0.0, core_main_L71?3
;
ldhu_d.0 r0.21, r0.21[0x0]
sh1add.0 r0.23, r0.23, r0.11
;
ldw_d.0 r0.15, r0.15[0x0]
;
and.0 r0.5, r0.5, 0x1
ldhu_d.0 r0.22, r0.22[0x0]
;
cmpne.0 r0.26, r0.21, r0.14
ldw_d.0 r0.18, r0.18[0x0]
;
and.0 r0.15, r0.15, 0x2
ldhu_d.0 r0.24, r0.24[0x0]
;
cmpne.0 r0.27, r0.22, r0.17
ldhu_d.0 r0.2, r0.2[0x0]
;
sth.0 r0.20[0x0], r0.0
andl.0 b0.0, r0.5, r0.26
and.0 r0.18, r0.18, 0x4
;
ldh_d.0 r0.23, r0.23[0x0]
;
andl.0 b0.1, r0.15, r0.27
cmpne.0 r0.20, r0.24, r0.2
;
br.0 b0.0, core_main_L72?3
;
-- core_main_L73?3
add.0 r0.23, r0.23, r0.13
;
andl.0 b0.0, r0.18, r0.20
br.0 b0.1, core_main_L74?3
;
-- core_main_L75?3
;
;
br.0 b0.0, core_main_L76?3
;
-- core_main_L77?3
sxth.0 r0.13, r0.23
zxth.0 r0.3, r0.25
;
;
goto.0 core_main_L70?3
;
-- core_main_L76?3
stw.0 r0.1[0x1054], r0.12
mov.0 r0.5, r0.24
mov.0 r0.4, r0.3
;
stw.0 r0.1[0x1068], r0.6
;
stw.0 r0.1[0x106c], r0.9
mov.0 r0.6, r0.2
;
stw.0 r0.1[0x1070], r0.10
;
stw.0 r0.1[0x1078], r0.8
;
stw.0 r0.1[0x1074], r0.13
;
stw.0 r0.1[0x107c], r0.11
;
stw.0 r0.1[0x108c], r0.19
;
stw.0 r0.1[0x1084], r0.3
;
.call printf arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.3, (core_main_?1STRINGPACKET.12+0)
syscall.0 0
;
ldw.0 r0.11, r0.1[0x107c]
;
ldw.0 r0.19, r0.1[0x108c]
;
ldw.0 r0.3, r0.1[0x1084]
;
ldw.0 r0.13, r0.1[0x1074]
;
sh1add.0 r0.2, r0.19, r0.11
sh1add.0 r0.19, r0.19, r0.11
ldw.0 r0.12, r0.1[0x1054]
;
mpyl.0 r0.4, r0.3, 0x26
add.0 r0.25, r0.3, 0x1
ldw.0 r0.6, r0.1[0x1068]
;
ldw.0 r0.9, r0.1[0x106c]
;
ldh.0 r0.2, r0.2[0x0]
;
sh1add.0 r0.4, r0.4, r0.11
ldw.0 r0.10, r0.1[0x1070]
;
ldw.0 r0.8, r0.1[0x1078]
;
add.0 r0.2, r0.2, 0x1
;
;
;
sth.0 r0.19[0x0], r0.2
;
ldh.0 r0.4, r0.4[0x0]
;
;
;
add.0 r0.23, r0.4, r0.13
;
;
goto.0 core_main_L77?3
;
-- core_main_L74?3
stw.0 r0.1[0x1068], r0.6
mov.0 r0.5, r0.22
mov.0 r0.4, r0.3
;
stw.0 r0.1[0x106c], r0.9
mov.0 r0.6, r0.17
;
stw.0 r0.1[0x1074], r0.13
;
stw.0 r0.1[0x1078], r0.8
;
stw.0 r0.1[0x1070], r0.10
;
stw.0 r0.1[0x1054], r0.12
;
stw.0 r0.1[0x107c], r0.11
;
stw.0 r0.1[0x1080], r0.16
;
stw.0 r0.1[0x1084], r0.3
;
.call printf arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.3, (core_main_?1STRINGPACKET.11+0)
syscall.0 0
;
ldw.0 r0.11, r0.1[0x107c]
;
ldw.0 r0.16, r0.1[0x1080]
;
ldw.0 r0.3, r0.1[0x1084]
;
ldw.0 r0.12, r0.1[0x1054]
;
sh1add.0 r0.4, r0.16, r0.11
sh1add.0 r0.16, r0.16, r0.11
ldw.0 r0.10, r0.1[0x1070]
;
mpyl.0 r0.7, r0.3, 0x13
mpyl.0 r0.5, r0.3, 0x26
ldw.0 r0.8, r0.1[0x1078]
;
mpyl.0 r0.19, r0.3, 0x26
add.0 r0.25, r0.3, 0x1
ldw.0 r0.6, r0.1[0x1068]
;
ldh.0 r0.4, r0.4[0x0]
;
sh2add.0 r0.7, r0.7, r0.12
sh1add.0 r0.14, r0.8, (core_main_9217.state_known_crc+0)
sh1add.0 r0.5, r0.5, r0.11
;
sh1add.0 r0.15, r0.19, r0.10
ldw.0 r0.9, r0.1[0x106c]
;
add.0 r0.4, r0.4, 0x1
ldw.0 r0.13, r0.1[0x1074]
;
ldw.0 r0.7, r0.7[0x0]
;
ldhu_d.0 r0.24, r0.15[0x0]
;
ldhu_d.0 r0.2, r0.14[0x0]
;
sth.0 r0.16[0x0], r0.4
and.0 r0.18, r0.7, 0x4
;
ldh_d.0 r0.23, r0.5[0x0]
;
cmpne.0 r0.20, r0.24, r0.2
;
;
add.0 r0.23, r0.23, r0.13
;
andl.0 b0.0, r0.18, r0.20
goto.0 core_main_L75?3
;
-- core_main_L72?3
stw.0 r0.1[0x1068], r0.6
mov.0 r0.5, r0.21
;
stw.0 r0.1[0x1074], r0.13
mov.0 r0.6, r0.14
;
stw.0 r0.1[0x1070], r0.10
;
stw.0 r0.1[0x1078], r0.8
;
stw.0 r0.1[0x106c], r0.9
;
stw.0 r0.1[0x1054], r0.12
;
stw.0 r0.1[0x107c], r0.11
;
stw.0 r0.1[0x1088], r0.4
;
mov.0 r0.4, r0.3
stw.0 r0.1[0x1084], r0.3
;
.call printf arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.3, (core_main_?1STRINGPACKET.10+0)
syscall.0 0
;
ldw.0 r0.11, r0.1[0x107c]
;
ldw.0 r0.4, r0.1[0x1088]
;
ldw.0 r0.3, r0.1[0x1084]
;
ldw.0 r0.12, r0.1[0x1054]
;
sh1add.0 r0.5, r0.4, r0.11
sh1add.0 r0.4, r0.4, r0.11
ldw.0 r0.9, r0.1[0x106c]
;
mpyl.0 r0.14, r0.3, 0x13
mpyl.0 r0.7, r0.3, 0x26
ldw.0 r0.8, r0.1[0x1078]
;
mpyl.0 r0.16, r0.3, 0x26
mpyl.0 r0.20, r0.3, 0x13
ldw.0 r0.10, r0.1[0x1070]
;
ldh.0 r0.5, r0.5[0x0]
mpyl.0 r0.19, r0.3, 0x26
add.0 r0.25, r0.3, 0x1
;
sh2add.0 r0.14, r0.14, r0.12
sh1add.0 r0.21, r0.8, (core_main_9217.matrix_known_crc+0)
sh1add.0 r0.7, r0.7, r0.11
;
sh1add.0 r0.26, r0.16, r0.9
sh2add.0 r0.20, r0.20, r0.12
sh1add.0 r0.28, r0.8, (core_main_9217.state_known_crc+0)
;
add.0 r0.5, r0.5, 0x1
sh1add.0 r0.29, r0.19, r0.10
ldw.0 r0.6, r0.1[0x1068]
;
ldw.0 r0.14, r0.14[0x0]
;
ldhu_d.0 r0.22, r0.26[0x0]
;
ldhu_d.0 r0.17, r0.21[0x0]
;
and.0 r0.15, r0.14, 0x2
ldw_d.0 r0.20, r0.20[0x0]
;
ldhu_d.0 r0.24, r0.29[0x0]
;
cmpne.0 r0.27, r0.22, r0.17
ldhu_d.0 r0.2, r0.28[0x0]
;
and.0 r0.18, r0.20, 0x4
ldw.0 r0.13, r0.1[0x1074]
;
sth.0 r0.4[0x0], r0.5
;
ldh_d.0 r0.23, r0.7[0x0]
;
andl.0 b0.1, r0.15, r0.27
cmpne.0 r0.20, r0.24, r0.2
;
goto.0 core_main_L73?3
;
-- core_main_L71?3
stw.0 r0.1[0x1078], r0.8
;
stw.0 r0.1[0x1054], r0.12
;
stw.0 r0.1[0x1068], r0.6
;
stw.0 r0.1[0x106c], r0.9
;
stw.0 r0.1[0x1070], r0.10
;
stw.0 r0.1[0x1074], r0.13
goto.0 core_main_L51?3
;
-- core_main_L48?3
mov.0 r0.3, (core_main_?1STRINGPACKET.7+0)
ldw.0 r0.2, r0.1[0x10d4]
;
;
;
cmpeq.0 b0.0, r0.2, 0x4eaf
;
;
;
brf.0 b0.0, core_main_L78?3
;
mov.0 r0.8, 0x2
;
.call printf arg(r0.3) ret(r0.3)
stw.0 r0.1[0x1078], r0.8
syscall.0 0
;
goto.0 core_main_L49?3
;
-- core_main_L78?3
mov.0 r0.3, (core_main_?1STRINGPACKET.6+0)
ldw.0 r0.2, r0.1[0x10d4]
;
;
;
cmpeq.0 b0.0, r0.2, 0x7b05
;
;
;
brf.0 b0.0, core_main_L79?3
;
mov.0 r0.8, 0x1
;
.call printf arg(r0.3) ret(r0.3)
stw.0 r0.1[0x1078], r0.8
syscall.0 0
;
goto.0 core_main_L49?3
;
-- core_main_L79?3
mov.0 r0.3, (core_main_?1STRINGPACKET.5+0)
ldw.0 r0.2, r0.1[0x10d4]
;
;
;
cmpeq.0 b0.0, r0.2, 0x8a02
;
;
;
brf.0 b0.0, core_main_L80?3
;
mov.0 r0.8, r0.0
;
.call printf arg(r0.3) ret(r0.3)
stw.0 r0.1[0x1078], r0.8
syscall.0 0
;
goto.0 core_main_L49?3
;
-- core_main_L80?3
mov.0 r0.3, (core_main_?1STRINGPACKET.8+0)
ldw.0 r0.2, r0.1[0x10d4]
;
;
;
cmpeq.0 b0.0, r0.2, 0xe9f5
;
;
;
brf.0 b0.0, core_main_L81?3
;
mov.0 r0.8, 0x3
;
.call printf arg(r0.3) ret(r0.3)
stw.0 r0.1[0x1078], r0.8
syscall.0 0
;
goto.0 core_main_L49?3
;
-- core_main_L81?3
mov.0 r0.13, -0x1
;
stw.0 r0.1[0x1074], r0.13
goto.0 core_main_L49?3
;
-- core_main_L29?3
and.0 r0.19, r0.15, r0.19
brf.0 b0.1, core_main_L82?3
;
sh2add.0 r0.20, r0.20, r0.6
sh2add.0 r0.25, r0.25, r0.6
zxth.0 r0.2, r0.26
;
;
cmpne.0 b0.0, r0.19, r0.0
mpylu.0 r0.13, r0.4, r0.5
add.0 r0.14, r0.5, 0x1
ldw_d.0 r0.3, r0.6[0x0]
;
goto.0 core_main_L31?3
;
-- core_main_L82?3
stw.0 r0.1[0x1064], r0.9
;
goto.0 core_main_L34?3
;
-- core_main_L28?3
stw.0 r0.1[0x1064], r0.9
;
stw.0 r0.1[0x1058], r0.8
goto.0 core_main_L33?3
;
-- core_main_L26?3
and.0 r0.13, r0.15, r0.13
sh2add.0 r0.22, r0.22, r0.6
sh2add.0 r0.23, r0.23, r0.6
mov.0 r0.14, 0x1
;
zxth.0 r0.24, r0.24
;
ldw_d.0 r0.3, r0.6[0x0]
;
cmpne.0 b0.0, r0.13, r0.0
mpylu.0 r0.16, r0.4, r0.5
add.0 r0.17, r0.5, 0x1
goto.0 core_main_L27?3
;
-- core_main_L25?3
stw.0 r0.1[0x1064], r0.9
;
stw.0 r0.1[0x1058], r0.8
;
-- core_main_L33?3
stw.0 r0.1[0x1060], r0.7
;
stw.0 r0.1[0x1054], r0.12
;
stw.0 r0.1[0x1068], r0.40
;
stw.0 r0.1[0x106c], r0.41
;
stw.0 r0.1[0x1070], r0.42
;
stw.0 r0.1[0x107c], r0.11
;
stw.0 r0.1[0x1094], r0.35
;
stw.0 r0.1[0x1050], r0.32
;
stw.0 r0.1[0x10b4], r0.57
;
mov.0 r0.57, r0.0
stw.0 r0.1[0x10b8], r0.58
;
stw.0 r0.1[0x10bc], r0.59
;
stw.0 r0.1[0x10c0], r0.60
mov.0 r0.59, r0.37
;
stw.0 r0.1[0x10c4], r0.61
mov.0 r0.60, r0.38
;
mov.0 r0.61, r0.10
stw.0 r0.1[0x10c8], r0.62
;
mov.0 r0.62, r0.36
stw.0 r0.1[0x10cc], r0.63
;
mov.0 r0.63, r0.39
stw.0 r0.1[0x1074], r0.33
;
stw.0 r0.1[0x1078], r0.44
;
stw.0 r0.1[0x105c], r0.6
goto.0 core_main_L35?3
;
-- core_main_L21?3
mov.0 r0.5, r0.34
ldw_d.0 r0.4, r0.7[0x0]
;
ldw_d.0 r0.15, r0.12[0x0]
goto.0 core_main_L23?3
;
-- core_main_L20?3
mov.0 r0.5, r0.34
ldw_d.0 r0.4, r0.7[0x0]
;
ldw_d.0 r0.15, r0.12[0x0]
goto.0 core_main_L23?3
;
-- core_main_L19?3
ldw_d.0 r0.4, r0.7[0x0]
mov.0 r0.5, r0.34
;
ldw_d.0 r0.15, r0.12[0x0]
;
-- core_main_L23?3
mov.0 r0.2, r0.0
;
goto.0 core_main_L24?3
;
-- core_main_L16?3
mov.0 r0.2, r0.0
;
;
mov.0 r0.4, r0.16
goto.0 core_main_L18?3
;
-- core_main_L15?3
mov.0 r0.2, r0.0
;
;
mov.0 r0.4, r0.13
goto.0 core_main_L18?3
;
-- core_main_L14?3
mov.0 r0.4, r0.5
mov.0 r0.2, r0.0
;
goto.0 core_main_L18?3
;
-- core_main_L10?3
mov.0 r0.5, r0.43
;
mov.0 r0.2, r0.0
ldw_d.0 r0.4, r0.12[0x0]
;
goto.0 core_main_L12?3
;
-- core_main_L9?3
ldw_d.0 r0.4, r0.12[0x0]
mov.0 r0.5, r0.43
;
mov.0 r0.2, r0.0
;
-- core_main_L12?3
goto.0 core_main_L13?3
;
-- core_main_L7?3
mov.0 r0.5, 0x66
mov.0 r0.3, 0x3415
;
sth.0 r0.8[0x0], r0.3
;
sth.0 r0.9[0x0], r0.3
;
sth.0 r0.10[0x0], r0.5
goto.0 core_main_L8?3
;
-- core_main_L5?3
sth.0 r0.8[0x0], r0.0
mov.0 r0.5, 0x66
;
ldh.0 r0.18, r0.8[0x0]
;
sth.0 r0.9[0x0], r0.0
;
ldh_d.0 r0.20, r0.9[0x0]
;
sth.0 r0.10[0x0], r0.5
cmpeq.0 r0.18, r0.18, 0x1
;
ldh_d.0 r0.19, r0.10[0x0]
;
cmpeq.0 r0.20, r0.20, r0.0
;
;
cmpeq.0 r0.19, r0.19, r0.0
;
;
;
andl.0 r0.18, r0.18, r0.19
;
;
;
andl.0 b0.2, r0.18, r0.20
;
;
goto.0 core_main_L6?3
;
-- core_main_L4?3
br.0 b0.1, core_main_L5?3
;
goto.0 core_main_L6?3
;
.entry arg(r0.3) ret()
-- FUNC_iterate
add.0 r0.1, r0.1, -0x20
ldw.0 r0.2, r0.3[0x1c]
;
stw.0 r0.1[0x10], l0.0
;
stw.0 r0.1[0x14], r0.57
;
mov.0 r0.57, r0.0
stw.0 r0.1[0x18], r0.58
;
stw.0 r0.1[0x1c], r0.59
mov.0 r0.58, r0.2
;
sth.0 r0.3[0x38], r0.0
mov.0 r0.59, r0.3
;
sth.0 r0.3[0x3a], r0.0
;
sth.0 r0.3[0x3c], r0.0
;
sth.0 r0.3[0x3e], r0.0
;
-- core_main_L0?3
cmpltu.0 b0.0, r0.57, r0.58
mov.0 r0.4, 0x1
mov.0 r0.3, r0.59
;
;
;
brf.0 b0.0, core_main_L1?3
;
.call core_bench_list arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_core_bench_list
;
ldhu.0 r0.4, r0.59[0x38]
;
;
.call crcu16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crcu16
;
sth.0 r0.59[0x38], r0.3
mov.0 r0.4, -0x1
;
.call core_bench_list arg(r0.3,r0.4) ret(r0.3)
mov.0 r0.3, r0.59
call.0 l0.0, FUNC_core_bench_list
;
ldhu.0 r0.4, r0.59[0x38]
;
;
.call crcu16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crcu16
;
sth.0 r0.59[0x38], r0.3
cmpeq.0 b0.0, r0.57, r0.0
;
;
;
brf.0 b0.0, core_main_L2?3
;
sth.0 r0.59[0x3a], r0.3
add.0 r0.57, r0.57, 0x1
;
-- core_main_L3?3
;
goto.0 core_main_L0?3
;
-- core_main_L2?3
add.0 r0.57, r0.57, 0x1
goto.0 core_main_L3?3
;
-- core_main_L1?3
mov.0 r0.3, r0.0
ldw.0 l0.0, r0.1[0x10]
;
ldw.0 r0.59, r0.1[0x1c]
;
ldw.0 r0.58, r0.1[0x18]
;
ldw.0 r0.57, r0.1[0x14]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
;
ENDOFFILE: core_main
FILE: core_list_join
.entry arg(r0.3,r0.4) ret()
-- FUNC_calc_func
add.0 r0.1, r0.1, -0x40
ldh.0 r0.2, r0.3[0x0]
;
stw.0 r0.1[0x10], l0.0
;
;
shr.0 r0.5, r0.2, 0x7
and.0 r0.6, r0.2, 0x7f
;
;
;
and.0 r0.5, r0.5, 0x1
sxth.0 r0.6, r0.6
;
;
;
zxtb.0 r0.5, r0.5
mov.0 r0.3, r0.6
mov.0 r0.7, r0.3
;
;
;
cmpne.0 b0.0, r0.5, r0.0
;
;
;
brf.0 b0.0, core_list_join_L0?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- core_list_join_L0?3
and.0 r0.10, r0.2, 0x7
shr.0 r0.9, r0.2, 0x3
add.0 r0.11, r0.4, 0x8
stw.0 r0.1[0x14], r0.4
;
stw.0 r0.1[0x18], r0.7
;
stw.0 r0.1[0x1c], r0.2
;
sxth.0 r0.10, r0.10
and.0 r0.9, r0.9, 0xf
ldw_d.0 r0.11, r0.11[0xc]
;
ldw_d.0 r0.3, r0.4[0x18]
;
ldh_d.0 r0.5, r0.4[0x0]
;
sxth.0 r0.12, r0.9
cmpeq.0 b0.0, r0.10, r0.0
ldh_d.0 r0.6, r0.4[0x2]
;
ldhu_d.0 r0.8, r0.4[0x38]
;
;
shl.0 r0.12, r0.12, 0x4
;
mov.0 r0.4, r0.11
;
;
or.0 r0.9, r0.9, r0.12
;
;
;
sxth.0 r0.9, r0.9
;
;
brf.0 b0.0, core_list_join_L1?3
;
max.0 r0.7, r0.9, 0x22
;
;
.call core_bench_state arg(r0.3,r0.4,r0.5,r0.6,r0.7,r0.8) ret(r0.3)
call.0 l0.0, FUNC_core_bench_state
;
sxth.0 r0.5, r0.3
ldw.0 r0.6, r0.1[0x14]
;
;
;
zxth.0 r0.3, r0.5
stw.0 r0.1[0x20], r0.5
;
ldhu.0 r0.7, r0.6[0x3e]
;
ldhu_d.0 r0.4, r0.6[0x38]
;
;
cmpeq.0 b0.0, r0.7, r0.0
;
;
;
brf.0 b0.0, core_list_join_L2?3
;
.call crcu16 arg(r0.3,r0.4) ret(r0.3)
sth.0 r0.6[0x3e], r0.5
call.0 l0.0, FUNC_crcu16
;
-- core_list_join_L3?3
ldw.0 r0.5, r0.1[0x20]
;
ldw.0 r0.2, r0.1[0x1c]
;
ldw.0 r0.4, r0.1[0x14]
;
and.0 r0.5, r0.5, 0x7f
ldw.0 r0.6, r0.1[0x18]
;
and.0 r0.2, r0.2, 0xff00
ldw.0 l0.0, r0.1[0x10]
;
sth.0 r0.4[0x38], r0.3
;
sxth.0 r0.3, r0.5
;
;
;
or.0 r0.5, r0.3, 0x80
;
;
;
or.0 r0.5, r0.5, r0.2
;
;
;
.return arg(return) ret(r0.3)
sth.0 r0.6[0x0], r0.5
return.0 r0.1, r0.1, 0x40, l0.0
;
-- core_list_join_L2?3
zxth.0 r0.3, r0.5
ldhu.0 r0.4, r0.6[0x38]
;
;
.call crcu16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crcu16
;
goto.0 core_list_join_L3?3
;
-- core_list_join_L1?3
cmpeq.0 b0.0, r0.10, 0x1
mov.0 r0.4, r0.9
ldw.0 r0.6, r0.1[0x14]
;
;
;
add.0 r0.3, r0.6, 0x28
ldhu_d.0 r0.5, r0.6[0x38]
brf.0 b0.0, core_list_join_L4?3
;
;
.call core_bench_matrix arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_core_bench_matrix
;
sxth.0 r0.5, r0.3
ldw.0 r0.6, r0.1[0x14]
;
;
;
zxth.0 r0.3, r0.5
stw.0 r0.1[0x20], r0.5
;
ldhu.0 r0.7, r0.6[0x3c]
;
ldhu_d.0 r0.4, r0.6[0x38]
;
;
cmpeq.0 b0.0, r0.7, r0.0
;
;
;
brf.0 b0.0, core_list_join_L5?3
;
.call crcu16 arg(r0.3,r0.4) ret(r0.3)
sth.0 r0.6[0x3c], r0.5
call.0 l0.0, FUNC_crcu16
;
goto.0 core_list_join_L3?3
;
-- core_list_join_L5?3
zxth.0 r0.3, r0.5
ldhu.0 r0.4, r0.6[0x38]
;
;
.call crcu16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crcu16
;
goto.0 core_list_join_L3?3
;
-- core_list_join_L4?3
ldw.0 r0.2, r0.1[0x14]
;
ldw.0 r0.6, r0.1[0x1c]
;
;
ldhu.0 r0.4, r0.2[0x38]
;
mov.0 r0.5, r0.6
;
zxth.0 r0.3, r0.5
stw.0 r0.1[0x20], r0.5
;
;
.call crcu16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crcu16
;
goto.0 core_list_join_L3?3
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC_cmp_complex
add.0 r0.1, r0.1, -0x20
;
stw.0 r0.1[0x10], l0.0
;
stw.0 r0.1[0x14], r0.4
;
.call calc_func arg(r0.3,r0.4) ret(r0.3)
mov.0 r0.4, r0.5
stw.0 r0.1[0x18], r0.5
call.0 l0.0, FUNC_calc_func
;
stw.0 r0.1[0x1c], r0.3
;
ldw.0 r0.3, r0.1[0x14]
;
ldw.0 r0.4, r0.1[0x18]
;
;
.call calc_func arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_calc_func
;
ldw.0 r0.2, r0.1[0x1c]
;
ldw.0 l0.0, r0.1[0x10]
;
;
sub.0 r0.3, r0.2, r0.3
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC_cmp_idx
cmpeq.0 b0.0, r0.5, r0.0
ldh_d.0 r0.2, r0.3[0x0]
;
;
;
shr.0 r0.5, r0.2, 0x8
and.0 r0.6, r0.2, 0xff00
brf.0 b0.0, core_list_join_L6?3
;
;
;
and.0 r0.5, r0.5, 0xff
;
;
;
or.0 r0.5, r0.5, r0.6
;
;
;
sth.0 r0.3[0x0], r0.5
;
ldh.0 r0.2, r0.4[0x0]
;
ldh.0 r0.5, r0.4[0x2]
;
;
shr.0 r0.6, r0.2, 0x8
and.0 r0.7, r0.2, 0xff00
;
;
;
and.0 r0.6, r0.6, 0xff
;
;
;
or.0 r0.6, r0.6, r0.7
;
;
;
sth.0 r0.4[0x0], r0.6
;
-- core_list_join_L7?3
ldh.0 r0.3, r0.3[0x2]
;
;
;
sub.0 r0.3, r0.3, r0.5
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_list_join_L6?3
ldh.0 r0.4, r0.4[0x2]
;
;
;
mov.0 r0.5, r0.4
goto.0 core_list_join_L7?3
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_copy_info
ldh.0 r0.2, r0.4[0x0]
;
;
;
sth.0 r0.3[0x0], r0.2
;
ldh.0 r0.4, r0.4[0x2]
;
;
;
.return arg(return) ret()
sth.0 r0.3[0x2], r0.4
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_core_bench_list
add.0 r0.1, r0.1, -0x60
sxth.0 r0.5, r0.4
ldw.0 r0.2, r0.3[0x24]
;
add.0 r0.6, r0.1, 0x10
stw.0 r0.1[0x14], l0.0
;
stw.0 r0.1[0x28], r0.57
;
mov.0 r0.57, r0.0
stw.0 r0.1[0x2c], r0.58
;
stw.0 r0.1[0x30], r0.59
;
stw.0 r0.1[0x34], r0.60
mov.0 r0.59, r0.2
;
stw.0 r0.1[0x38], r0.61
mov.0 r0.60, r0.6
;
mov.0 r0.61, r0.0
stw.0 r0.1[0x3c], r0.62
;
mov.0 r0.62, r0.0
stw.0 r0.1[0x40], r0.63
;
mov.0 r0.63, r0.0
stw.0 r0.1[0x20], r0.3
;
stw.0 r0.1[0x1c], r0.5
;
ldh.0 r0.58, r0.3[0x4]
;
sth.0 r0.1[0x12], r0.4
;
;
-- core_list_join_L8?3
cmplt.0 b0.0, r0.57, r0.58
and.0 r0.2, r0.57, 0xff
mov.0 r0.3, r0.59
mov.0 r0.4, r0.60
;
;
;
brf.0 b0.0, core_list_join_L9?3
;
.call core_list_find arg(r0.3,r0.4) ret(r0.3)
sth.0 r0.1[0x10], r0.2
call.0 l0.0, FUNC_core_list_find
;
stw.0 r0.1[0x18], r0.3
;
.call core_list_reverse arg(r0.3) ret(r0.3)
mov.0 r0.3, r0.59
call.0 l0.0, FUNC_core_list_reverse
;
mov.0 r0.59, r0.3
add.0 r0.4, r0.62, 0x1
ldw_d.0 r0.2, r0.3[0x0]
add.0 r0.5, r0.57, 0x1
;
ldw.0 r0.6, r0.1[0x18]
;
ldh_d.0 r0.7, r0.1[0x12]
;
ldw_d.0 r0.2, r0.2[0x4]
;
cmpeq.0 b0.0, r0.6, r0.0
;
cmpge.0 b0.1, r0.7, r0.0
add.0 r0.8, r0.7, 0x1
;
ldh_d.0 r0.2, r0.2[0x0]
;
brf.0 b0.0, core_list_join_L10?3
;
zxth.0 r0.62, r0.4
;
shr.0 r0.2, r0.2, 0x8
;
;
;
and.0 r0.2, r0.2, 0x1
;
;
;
add.0 r0.2, r0.2, r0.61
;
;
;
zxth.0 r0.61, r0.2
;
;
brf.0 b0.1, core_list_join_L11?3
;
-- core_list_join_L12?3
sth.0 r0.1[0x12], r0.8
sxth.0 r0.57, r0.5
;
-- core_list_join_L13?3
;
goto.0 core_list_join_L8?3
;
-- core_list_join_L11?3
sxth.0 r0.57, r0.5
goto.0 core_list_join_L13?3
;
-- core_list_join_L10?3
add.0 r0.63, r0.63, 0x1
ldw.0 r0.4, r0.1[0x18]
;
;
;
zxth.0 r0.63, r0.63
ldw.0 r0.2, r0.4[0x4]
;
ldw.0 r0.6, r0.4[0x0]
;
;
ldh.0 r0.2, r0.2[0x0]
;
cmpne.0 b0.0, r0.6, r0.0
ldw_d.0 r0.7, r0.6[0x0]
;
;
and.0 r0.2, r0.2, 0x1
shr.0 r0.9, r0.2, 0x9
;
;
;
and.0 r0.9, r0.9, 0x1
cmpne.0 b0.2, r0.2, r0.0
;
;
;
add.0 r0.9, r0.9, r0.61
;
;
;
zxth.0 r0.9, r0.9
;
;
;
slct.0 r0.61, b0.2, r0.9, r0.61
brf.0 b0.0, core_list_join_L14?3
;
stw.0 r0.4[0x0], r0.7
;
ldw.0 r0.2, r0.3[0x0]
;
;
;
stw.0 r0.6[0x0], r0.2
;
stw.0 r0.3[0x0], r0.6
;
ldh.0 r0.7, r0.1[0x12]
;
;
;
cmpge.0 b0.0, r0.7, r0.0
add.0 r0.8, r0.7, 0x1
;
;
;
brf.0 b0.0, core_list_join_L11?3
;
goto.0 core_list_join_L12?3
;
-- core_list_join_L14?3
brf.0 b0.1, core_list_join_L15?3
;
goto.0 core_list_join_L12?3
;
-- core_list_join_L15?3
goto.0 core_list_join_L11?3
;
-- core_list_join_L9?3
mov.0 r0.57, r0.59
shl.0 r0.63, r0.63, 0x2
sub.0 r0.61, r0.61, r0.62
ldw.0 r0.2, r0.1[0x1c]
;
mov.0 r0.4, cmp_complex
mov.0 r0.3, r0.59
ldw.0 r0.5, r0.1[0x20]
;
;
add.0 r0.61, r0.61, r0.63
cmpgt.0 b0.0, r0.2, r0.0
;
;
;
zxth.0 r0.59, r0.61
;
;
brf.0 b0.0, core_list_join_L16?3
;
.call core_list_mergesort arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_core_list_mergesort
;
mov.0 r0.57, r0.3
;
-- core_list_join_L16?3
ldw.0 r0.3, r0.57[0x0]
;
;
.call core_list_remove arg(r0.3) ret(r0.3)
call.0 l0.0, FUNC_core_list_remove
;
add.0 r0.4, r0.1, 0x10
stw.0 r0.1[0x24], r0.3
;
mov.0 r0.3, r0.57
;
.call core_list_find arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_core_list_find
;
ldw_d.0 r0.2, r0.57[0x0]
cmpeq.0 b0.0, r0.3, r0.0
;
ldw.0 r0.60, r0.1[0x24]
;
;
slct.0 r0.58, b0.0, r0.2, r0.3
;
;
;
-- core_list_join_L17?3
cmpne.0 b0.0, r0.58, r0.0
ldw_d.0 r0.2, r0.57[0x4]
mov.0 r0.4, r0.59
;
;
;
ldh_d.0 r0.3, r0.2[0x0]
brf.0 b0.0, core_list_join_L18?3
;
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crc16
;
ldw.0 r0.58, r0.58[0x0]
mov.0 r0.59, r0.3
;
;
goto.0 core_list_join_L17?3
;
-- core_list_join_L18?3
ldw.0 r0.4, r0.57[0x0]
;
;
.call core_list_undo_remove arg(r0.3,r0.4) ret(r0.3)
mov.0 r0.3, r0.60
call.0 l0.0, FUNC_core_list_undo_remove
;
mov.0 r0.5, r0.0
mov.0 r0.4, cmp_idx
mov.0 r0.3, r0.57
;
.call core_list_mergesort arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_core_list_mergesort
;
ldw.0 r0.58, r0.3[0x0]
mov.0 r0.57, r0.3
;
;
;
-- core_list_join_L19?3
cmpne.0 b0.0, r0.58, r0.0
ldw_d.0 r0.2, r0.57[0x4]
mov.0 r0.4, r0.59
;
;
;
ldh_d.0 r0.3, r0.2[0x0]
brf.0 b0.0, core_list_join_L20?3
;
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crc16
;
ldw.0 r0.58, r0.58[0x0]
mov.0 r0.59, r0.3
;
;
goto.0 core_list_join_L19?3
;
-- core_list_join_L20?3
ldw.0 l0.0, r0.1[0x14]
;
ldw.0 r0.63, r0.1[0x40]
;
mov.0 r0.3, r0.59
ldw.0 r0.62, r0.1[0x3c]
;
ldw.0 r0.61, r0.1[0x38]
;
ldw.0 r0.60, r0.1[0x34]
;
ldw.0 r0.59, r0.1[0x30]
;
ldw.0 r0.58, r0.1[0x2c]
;
ldw.0 r0.57, r0.1[0x28]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
.entry arg(entry) ret()
-- FUNC_core_list_init
add.0 r0.1, r0.1, -0x60
mtb.0 b0.0, r0.0
mov.0 r0.2, 0x14
;
cmplt.0 r0.9, r0.2, r0.0
cmpgeu.0 r0.11, r0.3, 0x14
mov.0 r0.12, -0x1
stw.0 r0.1[0x18], l0.0
;
add.0 r0.14, r0.1, 0x14
stw.0 r0.1[0x20], r0.57
mov.0 r0.13, -0x7f80
;
add.0 r0.57, r0.1, 0x10
stw.0 r0.1[0x24], r0.58
mov.0 r0.15, 0x7fff
;
shru.0 r0.2, r0.2, r0.9
shru.0 r0.16, r0.3, r0.9
stw.0 r0.1[0x28], r0.59
mtb.0 b0.1, r0.9
;
add.0 r0.58, r0.1, 0x58
stw.0 r0.1[0x2c], r0.60
;
stw.0 r0.1[0x30], r0.61
mov.0 r0.6, r0.57
;
addcg.0 r0.9, b0.2, r0.16, r0.16, b0.0
stw.0 r0.1[0x34], r0.62
;
divs.0 r0.9, b0.2, r0.0, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.9, r0.9, b0.0
stw.0 r0.1[0x38], r0.63
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
stw.0 r0.1[0x3c], r0.4
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
stw.0 r0.1[0x40], r0.14
;
stw.0 r0.1[0x54], r0.3
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
stw.0 r0.1[0x5c], r0.5
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
mov.0 r0.3, r0.4
mov.0 r0.5, r0.58
;
stw.0 r0.1[0x58], r0.4
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
divs.0 r0.9, b0.2, r0.9, r0.2, b0.2
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.9, b0.3, r0.9, r0.2, b0.3
addcg.0 r0.17, b0.2, r0.16, r0.16, b0.2
;
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
cmpge.0 r0.9, r0.9, r0.0
;
orc.0 r0.16, r0.16, r0.0
;
;
;
sh1add.0 r0.16, r0.16, r0.9
;
;
;
slct.0 r0.11, b0.1, r0.11, r0.16
;
;
;
add.0 r0.59, r0.11, -0x2
;
;
;
sh3add.0 r0.63, r0.59, r0.4
;
;
;
sh2add.0 r0.10, r0.59, r0.63
stw.0 r0.1[0x10], r0.63
mov.0 r0.7, r0.63
;
stw.0 r0.4[0x0], r0.0
;
ldw.0 r0.2, r0.1[0x10]
;
stw.0 r0.1[0x1c], r0.10
mov.0 r0.8, r0.10
;
;
stw.0 r0.4[0x4], r0.2
;
sth.0 r0.2[0x2], r0.0
;
ldw.0 r0.4, r0.4[0x4]
;
;
;
sth.0 r0.4[0x0], r0.13
;
ldw.0 r0.2, r0.1[0x58]
mov.0 r0.4, r0.14
;
ldw.0 r0.9, r0.1[0x10]
;
sth.0 r0.1[0x16], r0.15
;
add.0 r0.2, r0.2, 0x8
sth.0 r0.1[0x14], r0.12
;
add.0 r0.9, r0.9, 0x4
;
;
stw.0 r0.1[0x58], r0.2
;
.call core_list_insert_new arg(r0.3,r0.4,r0.5,r0.6,r0.7,r0.8) ret(r0.3)
stw.0 r0.1[0x10], r0.9
call.0 l0.0, FUNC_core_list_insert_new
;
mov.0 r0.57, r0.0
ldw.0 r0.60, r0.1[0x40]
mov.0 r0.61, r0.58
mov.0 r0.62, r0.57
;
ldw.0 r0.59, r0.1[0x3c]
mov.0 r0.58, r0.59
;
ldw.0 r0.10, r0.1[0x1c]
;
;
;
-- core_list_join_L21?3
cmpltu.0 b0.0, r0.57, r0.58
ldh_d.0 r0.2, r0.1[0x5e]
and.0 r0.9, r0.57, 0x7
;
mov.0 r0.3, r0.59
mov.0 r0.4, r0.60
mov.0 r0.5, r0.61
mov.0 r0.6, r0.62
;
mov.0 r0.7, r0.63
mov.0 r0.8, r0.10
;
xor.0 r0.2, r0.57, r0.2
brf.0 b0.0, core_list_join_L22?3
;
;
;
and.0 r0.2, r0.2, 0xf
;
;
;
zxth.0 r0.2, r0.2
;
;
;
shl.0 r0.2, r0.2, 0x3
;
;
;
or.0 r0.9, r0.9, r0.2
;
;
;
zxth.0 r0.2, r0.9
;
;
;
shl.0 r0.2, r0.2, 0x8
;
;
;
or.0 r0.9, r0.9, r0.2
;
;
;
.call core_list_insert_new arg(r0.3,r0.4,r0.5,r0.6,r0.7,r0.8) ret(r0.3)
sth.0 r0.1[0x14], r0.9
call.0 l0.0, FUNC_core_list_insert_new
;
add.0 r0.57, r0.57, 0x1
ldw.0 r0.10, r0.1[0x1c]
;
;
goto.0 core_list_join_L21?3
;
-- core_list_join_L22?3
ldw.0 r0.7, r0.59[0x0]
cmpgeu.0 r0.6, r0.58, 0x5
mov.0 r0.3, 0x5
mtb.0 b0.0, r0.0
;
mov.0 r0.4, 0x1
cmplt.0 r0.8, r0.3, r0.0
;
;
mov.0 r0.2, r0.7
;
shru.0 r0.3, r0.3, r0.8
shru.0 r0.58, r0.58, r0.8
mtb.0 b0.1, r0.8
;
;
;
addcg.0 r0.7, b0.2, r0.58, r0.58, b0.0
;
divs.0 r0.7, b0.2, r0.0, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.7, r0.7, b0.0
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
divs.0 r0.7, b0.2, r0.7, r0.3, b0.2
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
;
divs.0 r0.7, b0.3, r0.7, r0.3, b0.3
addcg.0 r0.8, b0.2, r0.58, r0.58, b0.2
;
addcg.0 r0.58, b0.3, r0.8, r0.8, b0.3
cmpge.0 r0.7, r0.7, r0.0
;
orc.0 r0.58, r0.58, r0.0
;
;
;
sh1add.0 r0.58, r0.58, r0.7
;
;
;
slct.0 r0.5, b0.1, r0.6, r0.58
;
;
;
-- core_list_join_L23?3
ldw.0 r0.3, r0.2[0x0]
cmpltu.0 b0.0, r0.4, r0.5
add.0 r0.6, r0.4, 0x1
;
ldw_d.0 r0.7, r0.2[0x4]
;
;
cmpne.0 b0.1, r0.3, r0.0
cmpltu.0 b0.2, r0.6, r0.5
add.0 r0.8, r0.6, 0x1
;
;
;
cmpltu.0 b0.1, r0.8, r0.5
brf.0 b0.1, core_list_join_L24?3
;
brf.0 b0.0, core_list_join_L25?3
;
sth.0 r0.7[0x2], r0.4
add.0 r0.3, r0.8, 0x1
;
-- core_list_join_L26?3
ldw.0 r0.2, r0.2[0x0]
;
;
mov.0 r0.4, r0.3
;
ldw.0 r0.3, r0.2[0x0]
;
ldw_d.0 r0.7, r0.2[0x4]
;
;
cmpne.0 b0.0, r0.3, r0.0
;
;
;
brf.0 b0.0, core_list_join_L27?3
;
brf.0 b0.2, core_list_join_L28?3
;
sth.0 r0.7[0x2], r0.6
;
-- core_list_join_L29?3
ldw.0 r0.2, r0.2[0x0]
;
;
;
ldw.0 r0.3, r0.2[0x0]
;
ldw_d.0 r0.6, r0.2[0x4]
;
;
cmpne.0 b0.0, r0.3, r0.0
;
;
;
brf.0 b0.0, core_list_join_L30?3
;
brf.0 b0.1, core_list_join_L31?3
;
sth.0 r0.6[0x2], r0.8
;
-- core_list_join_L32?3
ldw.0 r0.2, r0.2[0x0]
;
;
goto.0 core_list_join_L23?3
;
-- core_list_join_L31?3
ldh.0 r0.3, r0.1[0x5e]
add.0 r0.4, r0.8, 0x1
;
ldw.0 r0.6, r0.2[0x4]
;
;
xor.0 r0.3, r0.3, r0.8
and.0 r0.7, r0.4, 0x7
;
;
;
shl.0 r0.7, r0.7, 0x8
;
;
;
or.0 r0.3, r0.3, r0.7
;
;
;
and.0 r0.3, r0.3, 0x3fff
;
;
;
sth.0 r0.6[0x2], r0.3
goto.0 core_list_join_L32?3
;
-- core_list_join_L30?3
mov.0 r0.5, r0.0
mov.0 r0.4, cmp_idx
mov.0 r0.3, r0.59
;
.call core_list_mergesort arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_core_list_mergesort
;
goto.0 core_list_join_L33?3
;
-- core_list_join_L28?3
ldh.0 r0.3, r0.1[0x5e]
add.0 r0.8, r0.6, 0x1
;
ldw.0 r0.7, r0.2[0x4]
;
;
xor.0 r0.3, r0.3, r0.6
and.0 r0.6, r0.8, 0x7
cmpltu.0 b0.1, r0.8, r0.5
add.0 r0.4, r0.8, 0x1
;
;
;
shl.0 r0.6, r0.6, 0x8
;
;
;
or.0 r0.3, r0.3, r0.6
;
;
;
and.0 r0.3, r0.3, 0x3fff
;
;
;
sth.0 r0.7[0x2], r0.3
goto.0 core_list_join_L29?3
;
-- core_list_join_L27?3
mov.0 r0.5, r0.0
mov.0 r0.4, cmp_idx
mov.0 r0.3, r0.59
;
.call core_list_mergesort arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_core_list_mergesort
;
goto.0 core_list_join_L33?3
;
-- core_list_join_L25?3
ldh.0 r0.3, r0.1[0x5e]
add.0 r0.6, r0.4, 0x1
;
ldw.0 r0.7, r0.2[0x4]
;
;
xor.0 r0.3, r0.3, r0.4
and.0 r0.4, r0.6, 0x7
cmpltu.0 b0.2, r0.6, r0.5
add.0 r0.8, r0.6, 0x1
;
;
;
shl.0 r0.4, r0.4, 0x8
cmpltu.0 b0.1, r0.8, r0.5
;
;
;
or.0 r0.3, r0.3, r0.4
;
;
;
and.0 r0.3, r0.3, 0x3fff
;
;
;
sth.0 r0.7[0x2], r0.3
add.0 r0.3, r0.8, 0x1
goto.0 core_list_join_L26?3
;
-- core_list_join_L24?3
mov.0 r0.5, r0.0
mov.0 r0.4, cmp_idx
mov.0 r0.3, r0.59
;
.call core_list_mergesort arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_core_list_mergesort
;
-- core_list_join_L33?3
ldw.0 l0.0, r0.1[0x18]
;
ldw.0 r0.63, r0.1[0x38]
;
ldw.0 r0.62, r0.1[0x34]
;
ldw.0 r0.61, r0.1[0x30]
;
ldw.0 r0.60, r0.1[0x2c]
;
ldw.0 r0.59, r0.1[0x28]
;
ldw.0 r0.58, r0.1[0x24]
;
ldw.0 r0.57, r0.1[0x20]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6,r0.7,r0.8) ret()
-- FUNC_core_list_insert_new
add.0 r0.1, r0.1, -0x20
ldw.0 r0.2, r0.5[0x0]
mov.0 r0.9, r0.3
;
mov.0 r0.3, r0.0
stw.0 r0.1[0x10], l0.0
;
;
add.0 r0.2, r0.2, 0x8
;
;
;
cmpgeu.0 b0.0, r0.2, r0.7
;
;
;
brf.0 b0.0, core_list_join_L34?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- core_list_join_L34?3
ldw.0 r0.2, r0.6[0x0]
mov.0 r0.3, r0.0
;
;
;
add.0 r0.2, r0.2, 0x4
;
;
;
cmpgeu.0 b0.0, r0.2, r0.8
;
;
;
brf.0 b0.0, core_list_join_L35?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- core_list_join_L35?3
ldw.0 r0.2, r0.5[0x0]
;
;
;
add.0 r0.7, r0.2, 0x8
stw.0 r0.1[0x14], r0.2
;
;
;
stw.0 r0.5[0x0], r0.7
;
ldw.0 r0.5, r0.9[0x0]
;
;
;
stw.0 r0.2[0x0], r0.5
;
stw.0 r0.9[0x0], r0.2
;
ldw.0 r0.5, r0.6[0x0]
;
;
;
stw.0 r0.2[0x4], r0.5
;
ldw.0 r0.5, r0.6[0x0]
;
;
;
add.0 r0.5, r0.5, 0x4
;
;
;
stw.0 r0.6[0x0], r0.5
;
ldw.0 r0.3, r0.2[0x4]
;
;
.call copy_info arg(r0.3,r0.4) ret()
call.0 l0.0, FUNC_copy_info
;
ldw.0 l0.0, r0.1[0x10]
;
ldw.0 r0.3, r0.1[0x14]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_core_list_remove
ldw.0 r0.2, r0.3[0x0]
;
ldw.0 r0.4, r0.3[0x4]
;
;
ldw.0 r0.5, r0.2[0x4]
;
;
;
stw.0 r0.3[0x4], r0.5
;
stw.0 r0.2[0x4], r0.4
;
ldw.0 r0.4, r0.3[0x0]
;
;
;
ldw.0 r0.4, r0.4[0x0]
;
;
;
stw.0 r0.3[0x0], r0.4
mov.0 r0.3, r0.2
;
.return arg(return) ret(r0.3)
stw.0 r0.2[0x0], r0.0
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_core_list_undo_remove
ldw.0 r0.2, r0.4[0x4]
;
ldw.0 r0.5, r0.3[0x4]
;
;
stw.0 r0.3[0x4], r0.2
;
ldw.0 r0.2, r0.4[0x0]
;
stw.0 r0.4[0x4], r0.5
;
;
stw.0 r0.3[0x0], r0.2
;
.return arg(return) ret(r0.3)
stw.0 r0.4[0x0], r0.3
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_core_list_find
ldh.0 r0.5, r0.4[0x2]
mov.0 r0.2, r0.3
;
;
;
cmpge.0 b0.0, r0.5, r0.0
mov.0 r0.4, r0.5
mov.0 r0.3, r0.4
;
;
;
brf.0 b0.0, core_list_join_L36?3
;
-- core_list_join_L37?3
ldw_d.0 r0.3, r0.2[0x4]
;
ldw_d.0 r0.5, r0.2[0x0]
;
;
ldh_d.0 r0.3, r0.3[0x2]
;
ldw_d.0 r0.6, r0.5[0x4]
;
ldw_d.0 r0.7, r0.5[0x0]
;
cmpne.0 r0.3, r0.3, r0.4
;
ldh_d.0 r0.6, r0.6[0x2]
;
ldw_d.0 r0.8, r0.7[0x4]
;
andl.0 b0.0, r0.2, r0.3
ldw_d.0 r0.3, r0.7[0x0]
;
cmpne.0 r0.6, r0.6, r0.4
;
ldh_d.0 r0.8, r0.8[0x2]
;
ldw_d.0 r0.9, r0.3[0x4]
brf.0 b0.0, core_list_join_L38?3
;
andl.0 b0.0, r0.5, r0.6
ldw_d.0 r0.2, r0.3[0x0]
;
cmpne.0 r0.8, r0.8, r0.4
;
ldh_d.0 r0.9, r0.9[0x2]
;
brf.0 b0.0, core_list_join_L39?3
;
andl.0 b0.0, r0.7, r0.8
;
cmpne.0 r0.9, r0.9, r0.4
;
;
brf.0 b0.0, core_list_join_L40?3
;
andl.0 b0.0, r0.3, r0.9
;
;
;
brf.0 b0.0, core_list_join_L41?3
;
goto.0 core_list_join_L37?3
;
-- core_list_join_L41?3
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_list_join_L40?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.7
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_list_join_L39?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.5
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_list_join_L38?3
mov.0 r0.3, r0.2
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_list_join_L36?3
ldh_d.0 r0.4, r0.3[0x0]
;
;
;
-- core_list_join_L42?3
ldw_d.0 r0.3, r0.2[0x4]
;
ldw_d.0 r0.5, r0.2[0x0]
;
;
ldh_d.0 r0.3, r0.3[0x0]
;
ldw_d.0 r0.6, r0.5[0x4]
;
ldw_d.0 r0.7, r0.5[0x0]
;
and.0 r0.3, r0.3, 0xff
;
ldh_d.0 r0.6, r0.6[0x0]
;
ldw_d.0 r0.8, r0.7[0x4]
;
cmpne.0 r0.3, r0.3, r0.4
ldw_d.0 r0.9, r0.7[0x0]
;
and.0 r0.6, r0.6, 0xff
;
ldh_d.0 r0.8, r0.8[0x0]
;
andl.0 b0.0, r0.2, r0.3
ldw_d.0 r0.3, r0.9[0x4]
;
cmpne.0 r0.6, r0.6, r0.4
;
and.0 r0.8, r0.8, 0xff
;
ldh_d.0 r0.3, r0.3[0x0]
brf.0 b0.0, core_list_join_L43?3
;
andl.0 b0.0, r0.5, r0.6
ldw_d.0 r0.2, r0.9[0x0]
;
cmpne.0 r0.8, r0.8, r0.4
;
and.0 r0.3, r0.3, 0xff
;
brf.0 b0.0, core_list_join_L44?3
;
andl.0 b0.0, r0.7, r0.8
;
cmpne.0 r0.3, r0.3, r0.4
;
;
brf.0 b0.0, core_list_join_L45?3
;
andl.0 b0.0, r0.9, r0.3
;
;
;
brf.0 b0.0, core_list_join_L46?3
;
goto.0 core_list_join_L42?3
;
-- core_list_join_L46?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.9
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_list_join_L45?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.7
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_list_join_L44?3
;
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.5
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_list_join_L43?3
;
;
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.2
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_core_list_reverse
mov.0 r0.4, r0.0
mov.0 r0.2, r0.3
;
-- core_list_join_L47?3
cmpne.0 b0.0, r0.2, r0.0
ldw_d.0 r0.3, r0.2[0x0]
;
;
;
cmpne.0 b0.0, r0.3, r0.0
brf.0 b0.0, core_list_join_L48?3
;
stw.0 r0.2[0x0], r0.4
;
ldw_d.0 r0.5, r0.3[0x0]
;
brf.0 b0.0, core_list_join_L49?3
;
stw.0 r0.3[0x0], r0.2
;
cmpne.0 b0.0, r0.5, r0.0
ldw_d.0 r0.6, r0.5[0x0]
;
;
;
cmpne.0 b0.0, r0.6, r0.0
mov.0 r0.4, r0.6
brf.0 b0.0, core_list_join_L50?3
;
stw.0 r0.5[0x0], r0.3
;
ldw_d.0 r0.2, r0.6[0x0]
;
brf.0 b0.0, core_list_join_L51?3
;
stw.0 r0.6[0x0], r0.5
goto.0 core_list_join_L47?3
;
-- core_list_join_L51?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.5
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_list_join_L50?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_list_join_L49?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.2
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_list_join_L48?3
mov.0 r0.3, r0.4
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC_core_list_mergesort
add.0 r0.1, r0.1, -0x40
mov.0 r0.6, 0x1
mov.0 r0.13, r0.3
;
stw.0 r0.1[0x10], l0.0
;
stw.0 r0.1[0x2c], r0.60
;
stw.0 r0.1[0x30], r0.59
;
stw.0 r0.1[0x34], r0.58
;
mov.0 r0.58, r0.4
stw.0 r0.1[0x38], r0.57
;
mov.0 r0.57, r0.5
;
-- core_list_join_L52?3
mov.0 r0.4, r0.0
mov.0 r0.14, r0.0
mov.0 r0.10, r0.13
mov.0 r0.13, r0.0
;
-- core_list_join_L53?3
cmpne.0 b0.0, r0.10, r0.0
rsub.0 r0.11, 0x3, r0.6
mov.0 r0.3, 0x1
mov.0 r0.5, r0.10
;
mov.0 r0.7, r0.0
;
;
mov.0 r0.2, r0.11
mov.0 r0.11, r0.6
brf.0 b0.0, core_list_join_L54?3
;
add.0 r0.4, r0.4, 0x1
;
;
;
mov.0 r0.12, r0.4
;
-- core_list_join_L55?3
cmplt.0 b0.0, r0.2, 0x3
ldw_d.0 r0.6, r0.5[0x0]
mov.0 r0.4, r0.3
cmplt.0 b0.1, r0.2, 0x2
;
cmplt.0 b0.2, r0.2, 0x1
cmplt.0 b0.3, r0.2, r0.0
add.0 r0.3, r0.3, 0x4
add.0 r0.2, r0.2, 0x4
;
;
cmpeq.0 b0.0, r0.6, r0.0
ldw_d.0 r0.8, r0.6[0x0]
brf.0 b0.0, core_list_join_L56?3
;
;
;
cmpeq.0 b0.0, r0.8, r0.0
ldw_d.0 r0.9, r0.8[0x0]
br.0 b0.0, core_list_join_L57?3
;
brf.0 b0.1, core_list_join_L58?3
;
;
cmpeq.0 b0.0, r0.9, r0.0
ldw_d.0 r0.5, r0.9[0x0]
br.0 b0.0, core_list_join_L59?3
;
brf.0 b0.2, core_list_join_L60?3
;
;
cmpeq.0 b0.0, r0.5, r0.0
br.0 b0.0, core_list_join_L61?3
;
brf.0 b0.3, core_list_join_L62?3
;
add.0 r0.7, r0.7, 0x4
;
br.0 b0.0, core_list_join_L63?3
;
goto.0 core_list_join_L55?3
;
-- core_list_join_L63?3
mov.0 r0.4, r0.5
mov.0 r0.2, r0.11
mov.0 r0.59, r0.11
mov.0 r0.3, r0.4
;
add.0 r0.5, r0.3, 0x3
mov.0 r0.60, r0.12
mov.0 r0.9, r0.13
;
;
goto.0 core_list_join_L64?3
;
-- core_list_join_L65?3
cmpgt.0 r0.6, r0.5, r0.0
cmpgt.0 r0.3, r0.2, r0.0
cmpeq.0 b0.0, r0.5, r0.0
mov.0 r0.7, r0.4
;
cmpne.0 b0.1, r0.8, r0.0
;
;
andl.0 r0.3, r0.3, r0.4
;
;
;
orl.0 b0.2, r0.6, r0.3
;
;
;
brf.0 b0.2, core_list_join_L66?3
;
brf.0 b0.0, core_list_join_L67?3
;
ldw.0 r0.4, r0.4[0x0]
add.0 r0.2, r0.2, -0x1
;
;
brf.0 b0.1, core_list_join_L68?3
;
-- core_list_join_L69?3
stw.0 r0.8[0x0], r0.7
;
-- core_list_join_L70?3
mov.0 r0.8, r0.7
goto.0 core_list_join_L65?3
;
-- core_list_join_L68?3
mov.0 r0.9, r0.7
goto.0 core_list_join_L70?3
;
-- core_list_join_L67?3
nandl.0 b0.0, r0.2, r0.4
mov.0 r0.7, r0.10
;
;
;
brf.0 b0.0, core_list_join_L71?3
;
ldw.0 r0.10, r0.10[0x0]
add.0 r0.5, r0.5, -0x1
brf.0 b0.1, core_list_join_L72?3
;
;
goto.0 core_list_join_L69?3
;
-- core_list_join_L72?3
;
goto.0 core_list_join_L68?3
;
-- core_list_join_L71?3
stw.0 r0.1[0x14], r0.9
mov.0 l0.0, r0.58
;
stw.0 r0.1[0x18], r0.8
;
stw.0 r0.1[0x1c], r0.2
;
stw.0 r0.1[0x20], r0.5
;
stw.0 r0.1[0x24], r0.4
mov.0 r0.5, r0.57
;
stw.0 r0.1[0x28], r0.10
;
ldw.0 r0.3, r0.10[0x4]
;
ldw.0 r0.4, r0.4[0x4]
;
;
.call call arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, l0.0
;
cmpgt.0 b0.0, r0.3, r0.0
ldw.0 r0.10, r0.1[0x28]
;
ldw.0 r0.4, r0.1[0x24]
;
ldw.0 r0.5, r0.1[0x20]
;
ldw_d.0 r0.3, r0.10[0x0]
;
ldw_d.0 r0.6, r0.4[0x0]
slct.0 r0.7, b0.0, r0.4, r0.10
;
add.0 r0.11, r0.5, -0x1
ldw.0 r0.2, r0.1[0x1c]
;
slct.0 r0.10, b0.0, r0.10, r0.3
ldw.0 r0.8, r0.1[0x18]
;
slct.0 r0.4, b0.0, r0.6, r0.4
ldw.0 r0.9, r0.1[0x14]
;
slct.0 r0.5, b0.0, r0.5, r0.11
add.0 r0.3, r0.2, -0x1
;
cmpne.0 b0.1, r0.8, r0.0
;
;
slct.0 r0.2, b0.0, r0.3, r0.2
;
brf.0 b0.1, core_list_join_L73?3
;
goto.0 core_list_join_L69?3
;
-- core_list_join_L73?3
goto.0 core_list_join_L68?3
;
-- core_list_join_L66?3
mov.0 r0.10, r0.4
mov.0 r0.13, r0.9
mov.0 r0.14, r0.8
mov.0 r0.6, r0.59
;
mov.0 r0.4, r0.60
goto.0 core_list_join_L53?3
;
-- core_list_join_L62?3
add.0 r0.5, r0.7, 0x3
mov.0 r0.4, r0.9
mov.0 r0.2, r0.11
mov.0 r0.59, r0.11
;
mov.0 r0.60, r0.12
mov.0 r0.9, r0.13
;
goto.0 core_list_join_L64?3
;
-- core_list_join_L61?3
add.0 r0.5, r0.7, 0x3
mov.0 r0.4, r0.9
mov.0 r0.2, r0.11
mov.0 r0.59, r0.11
;
mov.0 r0.60, r0.12
mov.0 r0.9, r0.13
;
goto.0 core_list_join_L64?3
;
-- core_list_join_L60?3
add.0 r0.7, r0.7, 0x2
mov.0 r0.4, r0.8
mov.0 r0.2, r0.11
mov.0 r0.59, r0.11
;
mov.0 r0.60, r0.12
mov.0 r0.9, r0.13
;
;
mov.0 r0.5, r0.7
goto.0 core_list_join_L64?3
;
-- core_list_join_L59?3
add.0 r0.7, r0.7, 0x2
mov.0 r0.4, r0.8
mov.0 r0.2, r0.11
mov.0 r0.59, r0.11
;
mov.0 r0.60, r0.12
mov.0 r0.9, r0.13
;
;
mov.0 r0.5, r0.7
goto.0 core_list_join_L64?3
;
-- core_list_join_L58?3
add.0 r0.5, r0.7, 0x1
mov.0 r0.4, r0.6
mov.0 r0.2, r0.11
mov.0 r0.59, r0.11
;
mov.0 r0.60, r0.12
mov.0 r0.9, r0.13
;
goto.0 core_list_join_L64?3
;
-- core_list_join_L57?3
add.0 r0.5, r0.7, 0x1
mov.0 r0.4, r0.6
mov.0 r0.2, r0.11
mov.0 r0.59, r0.11
;
mov.0 r0.60, r0.12
;
mov.0 r0.9, r0.13
goto.0 core_list_join_L64?3
;
-- core_list_join_L56?3
mov.0 r0.4, r0.5
mov.0 r0.2, r0.11
mov.0 r0.9, r0.13
mov.0 r0.60, r0.12
;
mov.0 r0.5, r0.7
mov.0 r0.59, r0.11
;
-- core_list_join_L64?3
mov.0 r0.8, r0.14
goto.0 core_list_join_L65?3
;
-- core_list_join_L54?3
stw.0 r0.14[0x0], r0.0
cmple.0 b0.0, r0.4, 0x1
shl.0 r0.11, r0.11, 0x1
;
;
;
mov.0 r0.6, r0.11
br.0 b0.0, core_list_join_L74?3
;
goto.0 core_list_join_L52?3
;
-- core_list_join_L74?3
mov.0 r0.3, r0.13
ldw.0 l0.0, r0.1[0x10]
;
ldw.0 r0.60, r0.1[0x2c]
;
ldw.0 r0.59, r0.1[0x30]
;
ldw.0 r0.58, r0.1[0x34]
;
ldw.0 r0.57, r0.1[0x38]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
ENDOFFILE: core_list_join
FILE: core_matrix
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC_core_bench_matrix
add.0 r0.1, r0.1, -0x20
sxth.0 r0.7, r0.4
ldw.0 r0.2, r0.3[0x0]
;
zxth.0 r0.8, r0.5
stw.0 r0.1[0x10], l0.0
;
ldw.0 r0.4, r0.3[0xc]
;
ldw.0 r0.5, r0.3[0x4]
;
stw.0 r0.1[0x14], r0.8
;
ldw.0 r0.6, r0.3[0x8]
mov.0 r0.3, r0.2
;
;
.call matrix_test arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret(r0.3)
call.0 l0.0, FUNC_matrix_test
;
ldw.0 r0.4, r0.1[0x14]
;
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crc16
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret()
-- FUNC_matrix_test
add.0 r0.1, r0.1, -0x40
sxth.0 r0.2, r0.7
;
or.0 r0.7, r0.7, 0xf000
stw.0 r0.1[0x10], l0.0
;
stw.0 r0.1[0x14], r0.6
;
stw.0 r0.1[0x18], r0.4
;
sxth.0 r0.6, r0.7
mov.0 r0.4, r0.5
stw.0 r0.1[0x1c], r0.5
;
stw.0 r0.1[0x20], r0.3
mov.0 r0.5, r0.2
;
stw.0 r0.1[0x24], r0.2
;
.call matrix_add_const arg(r0.3,r0.4,r0.5) ret()
stw.0 r0.1[0x28], r0.6
call.0 l0.0, FUNC_matrix_add_const
;
ldw.0 r0.4, r0.1[0x18]
;
ldw.0 r0.5, r0.1[0x1c]
;
ldw.0 r0.3, r0.1[0x20]
;
ldw.0 r0.6, r0.1[0x24]
;
;
.call matrix_mul_const arg(r0.3,r0.4,r0.5,r0.6) ret()
call.0 l0.0, FUNC_matrix_mul_const
;
ldw.0 r0.4, r0.1[0x18]
;
ldw.0 r0.3, r0.1[0x20]
;
ldw.0 r0.5, r0.1[0x28]
;
;
.call matrix_sum arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_matrix_sum
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
mov.0 r0.4, r0.0
call.0 l0.0, FUNC_crc16
;
stw.0 r0.1[0x2c], r0.3
;
ldw.0 r0.6, r0.1[0x14]
;
ldw.0 r0.4, r0.1[0x18]
;
ldw.0 r0.5, r0.1[0x1c]
;
ldw.0 r0.3, r0.1[0x20]
;
;
.call matrix_mul_vect arg(r0.3,r0.4,r0.5,r0.6) ret()
call.0 l0.0, FUNC_matrix_mul_vect
;
ldw.0 r0.4, r0.1[0x18]
;
ldw.0 r0.3, r0.1[0x20]
;
ldw.0 r0.5, r0.1[0x28]
;
;
.call matrix_sum arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_matrix_sum
;
ldw.0 r0.4, r0.1[0x2c]
;
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crc16
;
stw.0 r0.1[0x30], r0.3
;
ldw.0 r0.6, r0.1[0x14]
;
ldw.0 r0.4, r0.1[0x18]
;
ldw.0 r0.5, r0.1[0x1c]
;
ldw.0 r0.3, r0.1[0x20]
;
;
.call matrix_mul_matrix arg(r0.3,r0.4,r0.5,r0.6) ret()
call.0 l0.0, FUNC_matrix_mul_matrix
;
ldw.0 r0.4, r0.1[0x18]
;
ldw.0 r0.3, r0.1[0x20]
;
ldw.0 r0.5, r0.1[0x28]
;
;
.call matrix_sum arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_matrix_sum
;
ldw.0 r0.4, r0.1[0x30]
;
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crc16
;
stw.0 r0.1[0x34], r0.3
;
ldw.0 r0.6, r0.1[0x14]
;
ldw.0 r0.4, r0.1[0x18]
;
ldw.0 r0.5, r0.1[0x1c]
;
ldw.0 r0.3, r0.1[0x20]
;
;
.call matrix_mul_matrix_bitextract arg(r0.3,r0.4,r0.5,r0.6) ret()
call.0 l0.0, FUNC_matrix_mul_matrix_bitextract
;
ldw.0 r0.4, r0.1[0x18]
;
ldw.0 r0.3, r0.1[0x20]
;
ldw.0 r0.5, r0.1[0x28]
;
;
.call matrix_sum arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, FUNC_matrix_sum
;
ldw.0 r0.4, r0.1[0x34]
;
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crc16
;
stw.0 r0.1[0x38], r0.3
;
ldw.0 r0.2, r0.1[0x24]
;
ldw.0 r0.4, r0.1[0x1c]
;
ldw.0 r0.3, r0.1[0x20]
;
sub.0 r0.2, r0.0, r0.2
;
;
;
sxth.0 r0.5, r0.2
;
;
.call matrix_add_const arg(r0.3,r0.4,r0.5) ret()
call.0 l0.0, FUNC_matrix_add_const
;
ldw.0 r0.2, r0.1[0x38]
;
ldw.0 l0.0, r0.1[0x10]
;
;
sxth.0 r0.3, r0.2
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC_core_init_matrix
cmpne.0 b0.0, r0.5, r0.0
mov.0 r0.13, 0x4
;
mov.0 r0.12, r0.0
mov.0 r0.18, 0x1
mov.0 r0.10, 0x3
mov.0 r0.8, 0x2
;
mov.0 r0.4, r0.0
mov.0 r0.6, 0x1
mov.0 r0.7, r0.6
mov.0 r0.2, r0.4
;
slct.0 r0.19, b0.0, r0.5, 0x1
mov.0 r0.5, r0.3
mov.0 r0.3, r0.7
;
;
;
-- core_matrix_L0?3
cmpltu.0 b0.0, r0.4, r0.5
shl.0 r0.7, r0.6, 0x3
shl.0 r0.9, r0.8, 0x3
shl.0 r0.11, r0.10, 0x3
;
shl.0 r0.14, r0.13, 0x3
;
;
mpylu.0 r0.15, r0.7, r0.6
mpyhs.0 r0.7, r0.7, r0.6
add.0 r0.6, r0.6, 0x4
brf.0 b0.0, core_matrix_L1?3
;
mpylu.0 r0.16, r0.9, r0.8
mpyhs.0 r0.9, r0.9, r0.8
add.0 r0.8, r0.8, 0x4
;
mpylu.0 r0.17, r0.11, r0.10
mpyhs.0 r0.11, r0.11, r0.10
add.0 r0.10, r0.10, 0x4
;
add.0 r0.15, r0.15, r0.7
mpylu.0 r0.7, r0.14, r0.13
mpyhs.0 r0.14, r0.14, r0.13
add.0 r0.13, r0.13, 0x4
;
add.0 r0.16, r0.16, r0.9
;
add.0 r0.17, r0.17, r0.11
;
cmpltu.0 b0.0, r0.15, r0.5
add.0 r0.4, r0.7, r0.14
;
cmpltu.0 b0.1, r0.16, r0.5
;
cmpltu.0 b0.2, r0.17, r0.5
;
brf.0 b0.0, core_matrix_L2?3
;
brf.0 b0.1, core_matrix_L3?3
;
brf.0 b0.2, core_matrix_L4?3
;
add.0 r0.12, r0.12, 0x4
;
;
goto.0 core_matrix_L0?3
;
-- core_matrix_L4?3
add.0 r0.12, r0.12, 0x3
mov.0 r0.4, r0.0
mov.0 r0.3, r0.19
mov.0 r0.23, r0.3
;
;
add.0 r0.2, r0.2, -0x1
;
add.0 r0.8, r0.12, -0x1
goto.0 core_matrix_L5?3
;
-- core_matrix_L6?3
cmpltu.0 b0.0, r0.4, r0.8
mov.0 r0.13, 0x2
add.0 r0.12, r0.2, 0x1
add.0 r0.14, r0.2, 0x2
;
mov.0 r0.9, r0.15
mov.0 r0.7, r0.0
mov.0 r0.10, r0.5
mov.0 r0.11, 0x1
;
mov.0 r0.6, 0xffff
mov.0 r0.18, r0.4
mov.0 r0.19, r0.5
;
mov.0 r0.20, r0.15
brf.0 b0.0, core_matrix_L7?3
;
-- core_matrix_L8?3
cmpltu.0 b0.0, r0.7, r0.8
mpylu.0 r0.4, r0.2, r0.3
mpyhs.0 r0.5, r0.2, r0.3
cmpltu.0 b0.1, r0.11, r0.8
;
cmpltu.0 b0.2, r0.13, r0.8
add.0 r0.11, r0.11, 0x3
add.0 r0.13, r0.13, 0x3
add.0 r0.7, r0.7, 0x3
;
;
add.0 r0.4, r0.4, r0.5
brf.0 b0.0, core_matrix_L9?3
;
;
;
cmplt.0 b0.0, r0.4, r0.0
add.0 r0.5, r0.4, r0.6
;
;
;
slct.0 r0.5, b0.0, r0.5, r0.4
;
;
;
shr.0 r0.5, r0.5, 0x10
;
;
;
shl.0 r0.5, r0.5, 0x10
;
;
;
sub.0 r0.4, r0.4, r0.5
;
;
;
add.0 r0.5, r0.2, r0.4
mpylu.0 r0.15, r0.12, r0.4
mpyhs.0 r0.16, r0.12, r0.4
;
;
;
add.0 r0.17, r0.2, r0.5
sth.0 r0.9[0x0], r0.5
add.0 r0.15, r0.15, r0.16
;
;
;
and.0 r0.17, r0.17, 0xff
cmplt.0 b0.0, r0.15, r0.0
add.0 r0.5, r0.15, r0.6
;
;
;
sth.0 r0.10[0x0], r0.17
slct.0 r0.5, b0.0, r0.5, r0.15
brf.0 b0.1, core_matrix_L10?3
;
;
;
shr.0 r0.5, r0.5, 0x10
;
;
;
shl.0 r0.5, r0.5, 0x10
;
;
;
sub.0 r0.15, r0.15, r0.5
;
;
;
add.0 r0.4, r0.12, r0.15
mpylu.0 r0.5, r0.14, r0.15
mpyhs.0 r0.16, r0.14, r0.15
;
;
;
add.0 r0.17, r0.12, r0.4
sth.0 r0.9[0x2], r0.4
add.0 r0.5, r0.5, r0.16
add.0 r0.12, r0.12, 0x3
;
;
;
and.0 r0.17, r0.17, 0xff
cmplt.0 b0.0, r0.5, r0.0
add.0 r0.4, r0.5, r0.6
;
;
;
sth.0 r0.10[0x2], r0.17
slct.0 r0.4, b0.0, r0.4, r0.5
brf.0 b0.2, core_matrix_L11?3
;
add.0 r0.2, r0.2, 0x3
;
;
shr.0 r0.4, r0.4, 0x10
;
;
;
shl.0 r0.4, r0.4, 0x10
;
;
;
sub.0 r0.3, r0.5, r0.4
;
;
;
add.0 r0.4, r0.14, r0.3
;
;
;
add.0 r0.5, r0.14, r0.4
sth.0 r0.9[0x4], r0.4
add.0 r0.9, r0.9, 0x6
add.0 r0.14, r0.14, 0x3
;
;
;
and.0 r0.5, r0.5, 0xff
;
;
;
sth.0 r0.10[0x4], r0.5
add.0 r0.10, r0.10, 0x6
;
;
goto.0 core_matrix_L8?3
;
-- core_matrix_L11?3
mov.0 r0.3, r0.15
add.0 r0.2, r0.2, 0x2
;
add.0 r0.19, r0.21, r0.19
add.0 r0.20, r0.21, r0.20
add.0 r0.18, r0.18, 0x1
;
goto.0 core_matrix_L12?3
;
-- core_matrix_L10?3
mov.0 r0.3, r0.4
add.0 r0.2, r0.2, 0x1
;
add.0 r0.19, r0.21, r0.19
add.0 r0.20, r0.21, r0.20
add.0 r0.18, r0.18, 0x1
;
goto.0 core_matrix_L12?3
;
-- core_matrix_L9?3
add.0 r0.19, r0.21, r0.19
add.0 r0.20, r0.21, r0.20
add.0 r0.18, r0.18, 0x1
;
;
-- core_matrix_L12?3
;
mov.0 r0.5, r0.19
mov.0 r0.15, r0.20
mov.0 r0.4, r0.18
goto.0 core_matrix_L6?3
;
-- core_matrix_L7?3
stw.0 r0.23[0x4], r0.24
shl.0 r0.2, r0.8, 0x1
add.0 r0.4, r0.22, -0x1
mov.0 r0.3, r0.8
;
stw.0 r0.23[0x8], r0.22
;
stw.0 r0.23[0x0], r0.8
;
mpylu.0 r0.5, r0.2, r0.8
mpyhs.0 r0.2, r0.2, r0.8
;
;
;
add.0 r0.5, r0.5, r0.2
;
;
;
add.0 r0.4, r0.4, r0.5
;
;
;
and.0 r0.4, r0.4, ~0x3
;
;
;
add.0 r0.4, r0.4, 0x4
;
;
;
.return arg(return) ret(r0.3)
stw.0 r0.23[0xc], r0.4
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_matrix_L3?3
add.0 r0.12, r0.12, 0x2
mov.0 r0.4, r0.0
mov.0 r0.3, r0.19
mov.0 r0.23, r0.3
;
;
add.0 r0.2, r0.2, -0x1
;
add.0 r0.8, r0.12, -0x1
goto.0 core_matrix_L5?3
;
-- core_matrix_L2?3
add.0 r0.12, r0.12, 0x1
mov.0 r0.4, r0.0
mov.0 r0.3, r0.19
mov.0 r0.23, r0.3
;
;
add.0 r0.2, r0.2, -0x1
;
add.0 r0.8, r0.12, -0x1
goto.0 core_matrix_L5?3
;
-- core_matrix_L1?3
add.0 r0.2, r0.2, -0x1
mov.0 r0.4, r0.0
mov.0 r0.23, r0.3
;
add.0 r0.8, r0.12, -0x1
mov.0 r0.3, r0.19
;
-- core_matrix_L5?3
;
and.0 r0.2, r0.2, ~0x3
;
shl.0 r0.6, r0.8, 0x1
shl.0 r0.21, r0.8, 0x1
;
;
add.0 r0.24, r0.2, 0x4
;
mpylu.0 r0.7, r0.6, r0.8
mpyhs.0 r0.9, r0.6, r0.8
;
;
mov.0 r0.5, r0.24
mov.0 r0.2, r0.18
;
add.0 r0.7, r0.7, r0.9
;
;
;
add.0 r0.22, r0.24, r0.7
;
;
;
mov.0 r0.15, r0.22
goto.0 core_matrix_L6?3
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC_matrix_sum
sxth.0 r0.7, r0.5
mov.0 r0.6, r0.0
;
shl.0 r0.23, r0.3, 0x2
mov.0 r0.4, r0.0
mov.0 r0.5, r0.0
mov.0 r0.2, r0.4
;
mov.0 r0.8, r0.2
mov.0 r0.3, r0.0
mov.0 r0.10, r0.3
;
;
-- core_matrix_L13?3
cmpltu.0 b0.0, r0.3, r0.10
mov.0 r0.11, 0x1
mov.0 r0.13, 0x3
mov.0 r0.12, 0x2
;
mov.0 r0.2, r0.8
mov.0 r0.9, r0.0
mov.0 r0.21, r0.3
mov.0 r0.22, r0.8
;
;
brf.0 b0.0, core_matrix_L14?3
;
-- core_matrix_L15?3
cmpltu.0 b0.0, r0.9, r0.10
ldw_d.0 r0.3, r0.2[0x0]
add.0 r0.8, r0.5, 0xa
cmpltu.0 b0.1, r0.11, r0.10
;
ldw_d.0 r0.14, r0.2[0x4]
cmpltu.0 b0.2, r0.12, r0.10
cmpltu.0 b0.3, r0.13, r0.10
add.0 r0.9, r0.9, 0x4
;
ldw_d.0 r0.15, r0.2[0x8]
add.0 r0.11, r0.11, 0x4
add.0 r0.13, r0.13, 0x4
add.0 r0.12, r0.12, 0x4
;
add.0 r0.16, r0.3, r0.6
sxth.0 r0.8, r0.8
cmple.0 b0.4, r0.3, r0.4
brf.0 b0.0, core_matrix_L16?3
;
cmple.0 b0.0, r0.14, r0.3
ldw_d.0 r0.4, r0.2[0xc]
add.0 r0.2, r0.2, 0x10
;
cmple.0 b0.5, r0.15, r0.14
;
cmpgt.0 b0.4, r0.16, r0.7
slct.0 r0.17, b0.4, r0.0, 0x1
;
slct.0 r0.18, b0.0, r0.0, 0x1
cmple.0 b0.0, r0.4, r0.15
;
slct.0 r0.19, b0.5, r0.0, 0x1
;
slctf.0 r0.16, b0.4, r0.16, r0.0
add.0 r0.5, r0.5, r0.17
;
slct.0 r0.17, b0.0, r0.0, 0x1
;
;
sxth.0 r0.5, r0.5
add.0 r0.20, r0.16, r0.14
;
;
;
slct.0 r0.8, b0.4, r0.8, r0.5
cmpgt.0 b0.0, r0.20, r0.7
brf.0 b0.1, core_matrix_L17?3
;
;
;
add.0 r0.8, r0.8, 0xa
slctf.0 r0.20, b0.0, r0.20, r0.0
add.0 r0.18, r0.8, r0.18
;
;
;
sxth.0 r0.8, r0.8
sxth.0 r0.18, r0.18
add.0 r0.3, r0.20, r0.15
;
;
;
slct.0 r0.8, b0.0, r0.8, r0.18
cmpgt.0 b0.0, r0.3, r0.7
brf.0 b0.2, core_matrix_L18?3
;
;
;
add.0 r0.8, r0.8, 0xa
slctf.0 r0.3, b0.0, r0.3, r0.0
add.0 r0.19, r0.8, r0.19
;
;
;
sxth.0 r0.8, r0.8
sxth.0 r0.19, r0.19
add.0 r0.14, r0.3, r0.4
;
;
;
slct.0 r0.8, b0.0, r0.8, r0.19
cmpgt.0 b0.0, r0.14, r0.7
brf.0 b0.3, core_matrix_L19?3
;
;
;
add.0 r0.8, r0.8, 0xa
slctf.0 r0.6, b0.0, r0.14, r0.0
add.0 r0.17, r0.8, r0.17
;
;
;
sxth.0 r0.8, r0.8
sxth.0 r0.17, r0.17
;
;
;
slct.0 r0.5, b0.0, r0.8, r0.17
;
;
goto.0 core_matrix_L15?3
;
-- core_matrix_L19?3
mov.0 r0.6, r0.3
mov.0 r0.4, r0.15
;
;
mov.0 r0.5, r0.8
add.0 r0.22, r0.23, r0.22
add.0 r0.21, r0.21, 0x1
;
goto.0 core_matrix_L20?3
;
-- core_matrix_L18?3
mov.0 r0.6, r0.20
mov.0 r0.4, r0.14
;
;
mov.0 r0.5, r0.8
add.0 r0.22, r0.23, r0.22
add.0 r0.21, r0.21, 0x1
;
goto.0 core_matrix_L20?3
;
-- core_matrix_L17?3
mov.0 r0.6, r0.16
mov.0 r0.4, r0.3
;
;
mov.0 r0.5, r0.8
add.0 r0.22, r0.23, r0.22
add.0 r0.21, r0.21, 0x1
;
goto.0 core_matrix_L20?3
;
-- core_matrix_L16?3
add.0 r0.22, r0.23, r0.22
add.0 r0.21, r0.21, 0x1
;
;
-- core_matrix_L20?3
;
mov.0 r0.8, r0.22
mov.0 r0.3, r0.21
goto.0 core_matrix_L13?3
;
-- core_matrix_L14?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.5
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC_matrix_mul_const
sxth.0 r0.6, r0.6
shl.0 r0.15, r0.3, 0x1
;
mov.0 r0.12, r0.5
mov.0 r0.11, r0.4
shl.0 r0.14, r0.3, 0x2
mov.0 r0.2, r0.3
;
mov.0 r0.3, r0.0
;
mov.0 r0.4, r0.6
mov.0 r0.6, r0.2
;
-- core_matrix_L21?3
cmpltu.0 b0.0, r0.3, r0.6
mov.0 r0.9, 0x2
mov.0 r0.8, 0x1
mov.0 r0.10, 0x3
;
mov.0 r0.2, r0.12
mov.0 r0.5, r0.0
mov.0 r0.7, r0.11
mov.0 r0.13, r0.12
;
mov.0 r0.11, r0.3
mov.0 r0.12, r0.11
;
brf.0 b0.0, core_matrix_L22?3
;
-- core_matrix_L23?3
cmpltu.0 b0.0, r0.5, r0.6
ldh_d.0 r0.3, r0.2[0x0]
cmpltu.0 b0.1, r0.8, r0.6
cmpltu.0 b0.2, r0.9, r0.6
;
cmpltu.0 b0.3, r0.10, r0.6
add.0 r0.10, r0.10, 0x4
add.0 r0.9, r0.9, 0x4
add.0 r0.5, r0.5, 0x4
;
add.0 r0.8, r0.8, 0x4
;
mpyl.0 r0.3, r0.3, r0.4
brf.0 b0.0, core_matrix_L24?3
;
;
;
stw.0 r0.7[0x0], r0.3
brf.0 b0.1, core_matrix_L25?3
;
ldh.0 r0.3, r0.2[0x2]
;
;
;
mpyl.0 r0.3, r0.4, r0.3
;
;
;
stw.0 r0.7[0x4], r0.3
brf.0 b0.2, core_matrix_L26?3
;
ldh.0 r0.3, r0.2[0x4]
;
;
;
mpyl.0 r0.3, r0.4, r0.3
;
;
;
stw.0 r0.7[0x8], r0.3
brf.0 b0.3, core_matrix_L27?3
;
ldh.0 r0.3, r0.2[0x6]
add.0 r0.2, r0.2, 0x8
;
;
;
mpyl.0 r0.3, r0.4, r0.3
;
;
;
stw.0 r0.7[0xc], r0.3
add.0 r0.7, r0.7, 0x10
;
;
goto.0 core_matrix_L23?3
;
-- core_matrix_L27?3
add.0 r0.12, r0.14, r0.12
add.0 r0.13, r0.15, r0.13
add.0 r0.11, r0.11, 0x1
;
goto.0 core_matrix_L28?3
;
-- core_matrix_L26?3
add.0 r0.12, r0.14, r0.12
add.0 r0.13, r0.15, r0.13
add.0 r0.11, r0.11, 0x1
;
goto.0 core_matrix_L28?3
;
-- core_matrix_L25?3
add.0 r0.12, r0.14, r0.12
add.0 r0.13, r0.15, r0.13
add.0 r0.11, r0.11, 0x1
;
goto.0 core_matrix_L28?3
;
-- core_matrix_L24?3
add.0 r0.12, r0.14, r0.12
add.0 r0.13, r0.15, r0.13
add.0 r0.11, r0.11, 0x1
;
;
-- core_matrix_L28?3
;
mov.0 r0.3, r0.11
;
mov.0 r0.11, r0.12
;
mov.0 r0.12, r0.13
goto.0 core_matrix_L21?3
;
-- core_matrix_L22?3
.return arg(return) ret()
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC_matrix_add_const
sxth.0 r0.5, r0.5
shl.0 r0.15, r0.3, 0x1
;
mov.0 r0.10, r0.4
mov.0 r0.3, r0.0
mov.0 r0.6, r0.3
;
;
mov.0 r0.4, r0.5
;
-- core_matrix_L29?3
cmpltu.0 b0.0, r0.3, r0.6
mov.0 r0.8, 0x2
mov.0 r0.7, 0x1
mov.0 r0.9, 0x3
;
mov.0 r0.2, r0.10
mov.0 r0.5, r0.0
mov.0 r0.13, r0.3
mov.0 r0.14, r0.10
;
;
brf.0 b0.0, core_matrix_L30?3
;
-- core_matrix_L31?3
cmpltu.0 b0.0, r0.5, r0.6
ldh_d.0 r0.3, r0.2[0x0]
cmpltu.0 b0.1, r0.7, r0.6
cmpltu.0 b0.2, r0.8, r0.6
;
ldh_d.0 r0.10, r0.2[0x2]
cmpltu.0 b0.3, r0.9, r0.6
add.0 r0.8, r0.8, 0x4
add.0 r0.5, r0.5, 0x4
;
ldh_d.0 r0.11, r0.2[0x4]
add.0 r0.7, r0.7, 0x4
add.0 r0.9, r0.9, 0x4
;
add.0 r0.3, r0.3, r0.4
ldh_d.0 r0.12, r0.2[0x6]
brf.0 b0.0, core_matrix_L32?3
;
add.0 r0.10, r0.4, r0.10
;
add.0 r0.11, r0.4, r0.11
;
sth.0 r0.2[0x0], r0.3
add.0 r0.12, r0.4, r0.12
brf.0 b0.1, core_matrix_L33?3
;
sth.0 r0.2[0x2], r0.10
brf.0 b0.2, core_matrix_L34?3
;
sth.0 r0.2[0x4], r0.11
brf.0 b0.3, core_matrix_L35?3
;
sth.0 r0.2[0x6], r0.12
add.0 r0.2, r0.2, 0x8
;
;
goto.0 core_matrix_L31?3
;
-- core_matrix_L35?3
add.0 r0.14, r0.15, r0.14
add.0 r0.13, r0.13, 0x1
;
goto.0 core_matrix_L36?3
;
-- core_matrix_L34?3
add.0 r0.14, r0.15, r0.14
add.0 r0.13, r0.13, 0x1
;
goto.0 core_matrix_L36?3
;
-- core_matrix_L33?3
add.0 r0.14, r0.15, r0.14
add.0 r0.13, r0.13, 0x1
;
goto.0 core_matrix_L36?3
;
-- core_matrix_L32?3
add.0 r0.14, r0.15, r0.14
add.0 r0.13, r0.13, 0x1
;
;
-- core_matrix_L36?3
;
mov.0 r0.10, r0.14
mov.0 r0.3, r0.13
goto.0 core_matrix_L29?3
;
-- core_matrix_L30?3
.return arg(return) ret()
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC_matrix_mul_vect
mov.0 r0.7, r0.5
shl.0 r0.20, r0.3, 0x1
;
mov.0 r0.5, r0.0
mov.0 r0.6, r0.4
mov.0 r0.10, r0.6
mov.0 r0.9, r0.3
;
;
-- core_matrix_L37?3
cmpltu.0 b0.0, r0.5, r0.9
sh2add.0 r0.3, r0.5, r0.6
mov.0 r0.12, 0x2
mov.0 r0.13, 0x3
;
mov.0 r0.8, r0.0
mov.0 r0.2, r0.10
mov.0 r0.4, r0.7
mov.0 r0.11, 0x1
;
mov.0 r0.18, r0.7
mov.0 r0.19, r0.10
;
brf.0 b0.0, core_matrix_L38?3
;
stw.0 r0.3[0x0], r0.0
;
-- core_matrix_L39?3
cmpltu.0 b0.0, r0.8, r0.9
sh2add.0 r0.7, r0.5, r0.6
ldh_d.0 r0.3, r0.2[0x0]
sh2add.0 r0.10, r0.5, r0.6
;
ldh_d.0 r0.14, r0.4[0x0]
cmpltu.0 b0.1, r0.11, r0.9
sh2add.0 r0.15, r0.5, r0.6
cmpltu.0 b0.2, r0.12, r0.9
;
sh2add.0 r0.16, r0.5, r0.6
cmpltu.0 b0.3, r0.13, r0.9
sh2add.0 r0.17, r0.5, r0.6
add.0 r0.8, r0.8, 0x4
;
ldw_d.0 r0.7, r0.7[0x0]
add.0 r0.13, r0.13, 0x4
add.0 r0.12, r0.12, 0x4
brf.0 b0.0, core_matrix_L40?3
;
mpyl.0 r0.3, r0.3, r0.14
add.0 r0.11, r0.11, 0x4
;
;
;
add.0 r0.7, r0.7, r0.3
;
;
;
stw.0 r0.10[0x0], r0.7
brf.0 b0.1, core_matrix_L41?3
;
ldh.0 r0.3, r0.2[0x2]
;
ldh.0 r0.10, r0.4[0x2]
;
;
;
mpyl.0 r0.3, r0.3, r0.10
;
;
;
add.0 r0.7, r0.7, r0.3
;
;
;
stw.0 r0.15[0x0], r0.7
brf.0 b0.2, core_matrix_L42?3
;
ldh.0 r0.3, r0.2[0x4]
;
ldh.0 r0.10, r0.4[0x4]
;
;
;
mpyl.0 r0.3, r0.3, r0.10
;
;
;
add.0 r0.7, r0.7, r0.3
;
;
;
stw.0 r0.16[0x0], r0.7
brf.0 b0.3, core_matrix_L43?3
;
ldh.0 r0.3, r0.2[0x6]
add.0 r0.2, r0.2, 0x8
;
ldh.0 r0.10, r0.4[0x6]
add.0 r0.4, r0.4, 0x8
;
;
;
mpyl.0 r0.3, r0.3, r0.10
;
;
;
add.0 r0.7, r0.7, r0.3
;
;
;
stw.0 r0.17[0x0], r0.7
goto.0 core_matrix_L39?3
;
-- core_matrix_L43?3
mov.0 r0.10, r0.19
add.0 r0.18, r0.20, r0.18
add.0 r0.5, r0.5, 0x1
;
goto.0 core_matrix_L44?3
;
-- core_matrix_L42?3
mov.0 r0.10, r0.19
add.0 r0.18, r0.20, r0.18
add.0 r0.5, r0.5, 0x1
;
goto.0 core_matrix_L44?3
;
-- core_matrix_L41?3
mov.0 r0.10, r0.19
add.0 r0.18, r0.20, r0.18
add.0 r0.5, r0.5, 0x1
;
goto.0 core_matrix_L44?3
;
-- core_matrix_L40?3
add.0 r0.18, r0.20, r0.18
add.0 r0.5, r0.5, 0x1
mov.0 r0.10, r0.19
;
;
-- core_matrix_L44?3
;
mov.0 r0.7, r0.18
goto.0 core_matrix_L37?3
;
-- core_matrix_L38?3
.return arg(return) ret()
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC_matrix_mul_matrix
mov.0 r0.21, r0.5
mov.0 r0.8, r0.4
;
mov.0 r0.2, r0.0
shl.0 r0.31, r0.3, 0x2
shl.0 r0.30, r0.3, 0x1
mov.0 r0.11, r0.3
;
mov.0 r0.19, r0.6
;
;
-- core_matrix_L45?3
cmpltu.0 b0.0, r0.2, r0.11
mov.0 r0.3, r0.19
mov.0 r0.9, r0.0
mov.0 r0.7, r0.0
;
mov.0 r0.29, r0.2
;
;
brf.0 b0.0, core_matrix_L46?3
;
-- core_matrix_L47?3
cmpltu.0 b0.0, r0.7, r0.11
sh2add.0 r0.4, r0.7, r0.8
add.0 r0.20, r0.9, r0.19
mpylu.0 r0.6, r0.11, 0x6
;
shl.0 r0.22, r0.11, 0x1
shl.0 r0.18, r0.11, 0x2
mov.0 r0.14, 0x2
mov.0 r0.16, 0x3
;
mov.0 r0.10, r0.0
mov.0 r0.12, 0x1
mov.0 r0.2, r0.0
mov.0 r0.5, r0.21
;
add.0 r0.17, r0.6, r0.20
mov.0 r0.26, r0.9
mov.0 r0.27, r0.19
brf.0 b0.0, core_matrix_L48?3
;
stw.0 r0.4[0x0], r0.0
add.0 r0.13, r0.22, r0.20
add.0 r0.15, r0.20, r0.18
mov.0 r0.28, r0.21
;
;
;
-- core_matrix_L49?3
cmpltu.0 b0.0, r0.10, r0.11
sh2add.0 r0.9, r0.7, r0.8
sh1add.0 r0.4, r0.2, r0.3
ldh_d.0 r0.6, r0.5[0x0]
;
sh2add.0 r0.19, r0.7, r0.8
cmpltu.0 b0.1, r0.12, r0.11
sh1add.0 r0.20, r0.2, r0.13
sh2add.0 r0.21, r0.7, r0.8
;
cmpltu.0 b0.2, r0.14, r0.11
sh1add.0 r0.22, r0.2, r0.15
sh2add.0 r0.23, r0.7, r0.8
cmpltu.0 b0.3, r0.16, r0.11
;
ldh_d.0 r0.4, r0.4[0x0]
sh1add.0 r0.24, r0.2, r0.17
sh2add.0 r0.25, r0.7, r0.8
brf.0 b0.0, core_matrix_L50?3
;
ldw.0 r0.9, r0.9[0x0]
add.0 r0.16, r0.16, 0x4
add.0 r0.14, r0.14, 0x4
add.0 r0.10, r0.10, 0x4
;
add.0 r0.2, r0.2, r0.18
add.0 r0.12, r0.12, 0x4
;
mpyl.0 r0.4, r0.4, r0.6
;
;
;
add.0 r0.9, r0.9, r0.4
;
;
;
stw.0 r0.19[0x0], r0.9
brf.0 b0.1, core_matrix_L51?3
;
ldh.0 r0.20, r0.20[0x0]
;
ldh.0 r0.4, r0.5[0x2]
;
;
;
mpyl.0 r0.20, r0.20, r0.4
;
;
;
add.0 r0.9, r0.9, r0.20
;
;
;
stw.0 r0.21[0x0], r0.9
brf.0 b0.2, core_matrix_L52?3
;
ldh.0 r0.22, r0.22[0x0]
;
ldh.0 r0.4, r0.5[0x4]
;
;
;
mpyl.0 r0.22, r0.22, r0.4
;
;
;
add.0 r0.9, r0.9, r0.22
;
;
;
stw.0 r0.23[0x0], r0.9
brf.0 b0.3, core_matrix_L53?3
;
ldh.0 r0.24, r0.24[0x0]
;
ldh.0 r0.4, r0.5[0x6]
add.0 r0.5, r0.5, 0x8
;
;
;
mpyl.0 r0.24, r0.24, r0.4
;
;
;
add.0 r0.9, r0.9, r0.24
;
;
;
stw.0 r0.25[0x0], r0.9
goto.0 core_matrix_L49?3
;
-- core_matrix_L53?3
mov.0 r0.21, r0.28
mov.0 r0.19, r0.27
;
add.0 r0.3, r0.3, 0x2
add.0 r0.26, r0.26, 0x2
add.0 r0.7, r0.7, 0x1
;
goto.0 core_matrix_L54?3
;
-- core_matrix_L52?3
mov.0 r0.21, r0.28
mov.0 r0.19, r0.27
;
add.0 r0.3, r0.3, 0x2
add.0 r0.26, r0.26, 0x2
add.0 r0.7, r0.7, 0x1
;
goto.0 core_matrix_L54?3
;
-- core_matrix_L51?3
mov.0 r0.21, r0.28
mov.0 r0.19, r0.27
;
add.0 r0.3, r0.3, 0x2
add.0 r0.26, r0.26, 0x2
add.0 r0.7, r0.7, 0x1
;
goto.0 core_matrix_L54?3
;
-- core_matrix_L50?3
add.0 r0.3, r0.3, 0x2
add.0 r0.26, r0.26, 0x2
add.0 r0.7, r0.7, 0x1
mov.0 r0.19, r0.27
;
mov.0 r0.21, r0.28
;
-- core_matrix_L54?3
;
mov.0 r0.9, r0.26
goto.0 core_matrix_L47?3
;
-- core_matrix_L48?3
add.0 r0.21, r0.30, r0.21
add.0 r0.8, r0.31, r0.8
add.0 r0.29, r0.29, 0x1
mov.0 r0.19, r0.27
;
;
;
mov.0 r0.2, r0.29
goto.0 core_matrix_L45?3
;
-- core_matrix_L46?3
.return arg(return) ret()
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC_matrix_mul_matrix_bitextract
mov.0 r0.19, r0.5
mov.0 r0.8, r0.4
;
mov.0 r0.2, r0.0
shl.0 r0.28, r0.3, 0x2
shl.0 r0.27, r0.3, 0x1
mov.0 r0.11, r0.3
;
mov.0 r0.17, r0.6
;
;
-- core_matrix_L55?3
cmpltu.0 b0.0, r0.2, r0.11
mov.0 r0.3, r0.17
mov.0 r0.9, r0.0
mov.0 r0.7, r0.0
;
mov.0 r0.26, r0.2
;
;
brf.0 b0.0, core_matrix_L56?3
;
-- core_matrix_L57?3
cmpltu.0 b0.0, r0.7, r0.11
sh2add.0 r0.4, r0.7, r0.8
add.0 r0.18, r0.9, r0.17
shl.0 r0.6, r0.11, 0x2
;
shl.0 r0.20, r0.11, 0x1
mov.0 r0.12, 0x1
mov.0 r0.14, 0x2
sh1add.0 r0.16, r0.11, r0.11
;
mov.0 r0.10, r0.0
mov.0 r0.2, r0.0
mov.0 r0.5, r0.19
mov.0 r0.23, r0.9
;
add.0 r0.15, r0.6, r0.18
mov.0 r0.24, r0.17
mov.0 r0.25, r0.19
brf.0 b0.0, core_matrix_L58?3
;
stw.0 r0.4[0x0], r0.0
add.0 r0.13, r0.20, r0.18
;
;
;
-- core_matrix_L59?3
cmpltu.0 b0.0, r0.10, r0.11
sh1add.0 r0.4, r0.2, r0.3
ldh_d.0 r0.6, r0.5[0x0]
sh2add.0 r0.9, r0.7, r0.8
;
sh2add.0 r0.17, r0.7, r0.8
cmpltu.0 b0.1, r0.12, r0.11
sh1add.0 r0.18, r0.2, r0.13
sh2add.0 r0.19, r0.7, r0.8
;
cmpltu.0 b0.2, r0.14, r0.11
sh1add.0 r0.20, r0.2, r0.15
sh2add.0 r0.21, r0.7, r0.8
add.0 r0.10, r0.10, 0x3
;
ldh_d.0 r0.4, r0.4[0x0]
add.0 r0.12, r0.12, 0x3
add.0 r0.14, r0.14, 0x3
brf.0 b0.0, core_matrix_L60?3
;
ldw.0 r0.9, r0.9[0x0]
add.0 r0.2, r0.2, r0.16
;
;
mpyl.0 r0.4, r0.4, r0.6
;
;
;
shr.0 r0.6, r0.4, 0x5
shr.0 r0.4, r0.4, 0x2
;
;
;
and.0 r0.6, r0.6, 0x7f
and.0 r0.4, r0.4, 0xf
;
;
;
mpylu.0 r0.22, r0.6, r0.4
mpyhs.0 r0.6, r0.6, r0.4
;
;
;
add.0 r0.22, r0.22, r0.6
;
;
;
add.0 r0.9, r0.9, r0.22
;
;
;
stw.0 r0.17[0x0], r0.9
brf.0 b0.1, core_matrix_L61?3
;
ldh.0 r0.18, r0.18[0x0]
;
ldh.0 r0.4, r0.5[0x2]
;
;
;
mpyl.0 r0.18, r0.18, r0.4
;
;
;
shr.0 r0.4, r0.18, 0x5
shr.0 r0.18, r0.18, 0x2
;
;
;
and.0 r0.4, r0.4, 0x7f
and.0 r0.18, r0.18, 0xf
;
;
;
mpylu.0 r0.6, r0.4, r0.18
mpyhs.0 r0.4, r0.4, r0.18
;
;
;
add.0 r0.6, r0.6, r0.4
;
;
;
add.0 r0.9, r0.9, r0.6
;
;
;
stw.0 r0.19[0x0], r0.9
brf.0 b0.2, core_matrix_L62?3
;
ldh.0 r0.20, r0.20[0x0]
;
ldh.0 r0.4, r0.5[0x4]
add.0 r0.5, r0.5, 0x6
;
;
;
mpyl.0 r0.20, r0.20, r0.4
;
;
;
shr.0 r0.4, r0.20, 0x5
shr.0 r0.20, r0.20, 0x2
;
;
;
and.0 r0.4, r0.4, 0x7f
and.0 r0.20, r0.20, 0xf
;
;
;
mpylu.0 r0.6, r0.4, r0.20
mpyhs.0 r0.4, r0.4, r0.20
;
;
;
add.0 r0.6, r0.6, r0.4
;
;
;
add.0 r0.9, r0.9, r0.6
;
;
;
stw.0 r0.21[0x0], r0.9
goto.0 core_matrix_L59?3
;
-- core_matrix_L62?3
mov.0 r0.19, r0.25
mov.0 r0.17, r0.24
;
add.0 r0.3, r0.3, 0x2
add.0 r0.23, r0.23, 0x2
add.0 r0.7, r0.7, 0x1
;
goto.0 core_matrix_L63?3
;
-- core_matrix_L61?3
mov.0 r0.19, r0.25
mov.0 r0.17, r0.24
;
add.0 r0.3, r0.3, 0x2
add.0 r0.23, r0.23, 0x2
add.0 r0.7, r0.7, 0x1
;
goto.0 core_matrix_L63?3
;
-- core_matrix_L60?3
add.0 r0.3, r0.3, 0x2
add.0 r0.23, r0.23, 0x2
add.0 r0.7, r0.7, 0x1
mov.0 r0.17, r0.24
;
mov.0 r0.19, r0.25
;
-- core_matrix_L63?3
;
mov.0 r0.9, r0.23
goto.0 core_matrix_L57?3
;
-- core_matrix_L58?3
add.0 r0.25, r0.27, r0.25
add.0 r0.8, r0.28, r0.8
add.0 r0.26, r0.26, 0x1
mov.0 r0.17, r0.24
;
;
;
mov.0 r0.19, r0.25
mov.0 r0.2, r0.26
goto.0 core_matrix_L55?3
;
-- core_matrix_L56?3
.return arg(return) ret()
return.0 r0.1, r0.1, 0x0, l0.0
;
ENDOFFILE: core_matrix
FILE: core_portme
.entry arg(r0.3) ret()
-- FUNC_portable_malloc
mov.0 r0.3, r0.0
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_portable_free
;
.return arg(return) ret()
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg() ret()
-- FUNC_start_time
add.0 r0.1, r0.1, -0x20
;
.call clock arg() ret(r0.3)
stw.0 r0.1[0x10], l0.0
syscall.0 9
;
stw.0 r0.0[(core_portme_9217.start_time_val+0)], r0.3
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret()
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg() ret()
-- FUNC_stop_time
add.0 r0.1, r0.1, -0x20
;
.call clock arg() ret(r0.3)
stw.0 r0.1[0x10], l0.0
syscall.0 9
;
stw.0 r0.0[(core_portme_9217.stop_time_val+0)], r0.3
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret()
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg() ret()
-- FUNC_get_time
ldw.0 r0.2, r0.0[(core_portme_9217.stop_time_val+0)]
;
ldw.0 r0.4, r0.0[(core_portme_9217.start_time_val+0)]
;
;
;
sub.0 r0.3, r0.2, r0.4
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_time_in_secs
add.0 r0.1, r0.1, -0x20
;
.call _d_ufloat arg(r0.3) ret(r0.3,r0.4)
stw.0 r0.1[0x10], l0.0
call.0 l0.0, FUNC__d_ufloat
;
.call _d_div arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
mov.0 r0.6, r0.0
mov.0 r0.5, 0x4177d784
call.0 l0.0, FUNC__d_div
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC_portable_init
mov.0 r0.2, 0x1
;
.return arg(return) ret()
stb.0 r0.3[0x4], r0.2
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_portable_fini
stb.0 r0.3[0x4], r0.0
;
.return arg(return) ret()
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_core_start_parallel
add.0 r0.1, r0.1, -0x20
add.0 r0.2, r0.3, 0x44
mov.0 r0.4, r0.0
;
mov.0 r0.5, iterate
mov.0 r0.6, r0.3
stw.0 r0.1[0x10], l0.0
;
;
.call vthread_create arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.3, r0.2
call.0 l0.0, FUNC_vthread_create
;
zxtb.0 r0.3, r0.3
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_core_stop_parallel
add.0 r0.1, r0.1, -0x20
ldw.0 r0.3, r0.3[0x44]
;
add.0 r0.4, r0.1, 0x10
stw.0 r0.1[0x14], l0.0
;
;
.call vthread_join arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_vthread_join
;
zxtb.0 r0.3, r0.3
ldw.0 l0.0, r0.1[0x14]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
ENDOFFILE: core_portme
FILE: core_state
.entry arg(r0.3,r0.4,r0.5,r0.6,r0.7,r0.8) ret()
-- FUNC_core_bench_state
add.0 r0.1, r0.1, -0x80
sxth.0 r0.9, r0.7
zxth.0 r0.8, r0.8
;
sxth.0 r0.12, r0.6
add.0 r0.7, r0.1, 0x10
add.0 r0.10, r0.1, 0x34
stw.0 r0.1[0x54], l0.0
;
sxth.0 r0.13, r0.5
mov.0 r0.2, r0.0
mov.0 r0.5, r0.3
mov.0 r0.6, r0.4
;
stw.0 r0.1[0x30], r0.4
;
mov.0 r0.4, r0.7
mov.0 r0.3, r0.10
mov.0 r0.10, r0.7
mov.0 r0.11, r0.10
;
mov.0 r0.7, l0.0
;
;
;
-- core_state_L0?3
cmpltu.0 b0.0, r0.2, 0x8
add.0 r0.2, r0.2, 0x4
;
;
;
brf.0 b0.0, core_state_L1?3
;
stw.0 r0.3[0x0], r0.0
;
stw.0 r0.4[0x0], r0.0
;
stw.0 r0.3[0x4], r0.0
;
stw.0 r0.4[0x4], r0.0
;
stw.0 r0.3[0x8], r0.0
;
stw.0 r0.4[0x8], r0.0
;
stw.0 r0.3[0xc], r0.0
add.0 r0.3, r0.3, 0x10
;
stw.0 r0.4[0xc], r0.0
add.0 r0.4, r0.4, 0x10
;
;
goto.0 core_state_L0?3
;
-- core_state_L1?3
add.0 r0.2, r0.1, 0x30
stw.0 r0.1[0x54], r0.7
;
stw.0 r0.1[0x58], r0.57
;
stw.0 r0.1[0x5c], r0.58
;
mov.0 r0.58, r0.11
stw.0 r0.1[0x60], r0.59
mov.0 r0.57, r0.2
;
mov.0 r0.59, r0.10
stw.0 r0.1[0x64], r0.13
;
stw.0 r0.1[0x68], r0.12
;
stw.0 r0.1[0x6c], r0.9
;
stw.0 r0.1[0x70], r0.8
;
stw.0 r0.1[0x74], r0.5
;
stw.0 r0.1[0x78], r0.6
;
-- core_state_L2?3
ldw.0 r0.2, r0.1[0x30]
mov.0 r0.3, r0.57
mov.0 r0.4, r0.58
;
;
;
ldbu.0 r0.2, r0.2[0x0]
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, core_state_L3?3
;
.call core_state_transition arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_core_state_transition
;
sh2add.0 r0.2, r0.3, r0.59
sh2add.0 r0.3, r0.3, r0.59
;
;
;
ldw.0 r0.2, r0.2[0x0]
;
;
;
add.0 r0.2, r0.2, 0x1
;
;
;
stw.0 r0.3[0x0], r0.2
goto.0 core_state_L2?3
;
-- core_state_L3?3
ldw.0 r0.2, r0.1[0x78]
;
ldw.0 r0.13, r0.1[0x64]
;
ldw.0 r0.6, r0.1[0x74]
;
ldw.0 r0.5, r0.1[0x6c]
;
stw.0 r0.1[0x30], r0.2
zxtb.0 r0.4, r0.13
;
add.0 r0.3, r0.2, r0.6
;
;
;
-- core_state_L4?3
ldw.0 r0.2, r0.1[0x30]
;
;
;
cmpltu.0 b0.0, r0.2, r0.3
ldbu_d.0 r0.6, r0.2[0x0]
;
;
;
cmpne.0 b0.0, r0.6, 0x2c
xor.0 r0.7, r0.6, r0.4
brf.0 b0.0, core_state_L5?3
;
;
;
brf.0 b0.0, core_state_L6?3
;
stb.0 r0.2[0x0], r0.7
;
-- core_state_L6?3
ldw.0 r0.2, r0.1[0x30]
;
;
;
add.0 r0.2, r0.2, r0.5
;
;
;
stw.0 r0.1[0x30], r0.2
cmpltu.0 b0.0, r0.2, r0.3
;
ldbu_d.0 r0.6, r0.2[0x0]
;
;
brf.0 b0.0, core_state_L7?3
;
cmpne.0 b0.0, r0.6, 0x2c
xor.0 r0.7, r0.6, r0.4
;
;
;
brf.0 b0.0, core_state_L8?3
;
stb.0 r0.2[0x0], r0.7
;
-- core_state_L8?3
ldw.0 r0.2, r0.1[0x30]
;
;
;
add.0 r0.2, r0.2, r0.5
;
;
;
stw.0 r0.1[0x30], r0.2
cmpltu.0 b0.0, r0.2, r0.3
;
ldbu_d.0 r0.6, r0.2[0x0]
;
;
brf.0 b0.0, core_state_L9?3
;
cmpne.0 b0.0, r0.6, 0x2c
xor.0 r0.7, r0.6, r0.4
;
;
;
brf.0 b0.0, core_state_L10?3
;
stb.0 r0.2[0x0], r0.7
;
-- core_state_L10?3
ldw.0 r0.2, r0.1[0x30]
;
;
;
add.0 r0.2, r0.2, r0.5
;
;
;
stw.0 r0.1[0x30], r0.2
cmpltu.0 b0.0, r0.2, r0.3
;
ldbu_d.0 r0.6, r0.2[0x0]
;
;
brf.0 b0.0, core_state_L11?3
;
cmpne.0 b0.0, r0.6, 0x2c
xor.0 r0.7, r0.6, r0.4
;
;
;
brf.0 b0.0, core_state_L12?3
;
stb.0 r0.2[0x0], r0.7
;
-- core_state_L12?3
ldw.0 r0.2, r0.1[0x30]
;
;
;
add.0 r0.2, r0.2, r0.5
;
;
;
stw.0 r0.1[0x30], r0.2
goto.0 core_state_L4?3
;
-- core_state_L11?3
stw.0 r0.1[0x6c], r0.5
add.0 r0.57, r0.1, 0x30
;
ldw.0 r0.4, r0.1[0x78]
goto.0 core_state_L13?3
;
-- core_state_L14?3
ldw.0 r0.2, r0.1[0x30]
mov.0 r0.3, r0.57
mov.0 r0.4, r0.58
;
;
;
ldbu.0 r0.2, r0.2[0x0]
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, core_state_L15?3
;
.call core_state_transition arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_core_state_transition
;
sh2add.0 r0.2, r0.3, r0.59
sh2add.0 r0.3, r0.3, r0.59
;
;
;
ldw.0 r0.2, r0.2[0x0]
;
;
;
add.0 r0.2, r0.2, 0x1
;
;
;
stw.0 r0.3[0x0], r0.2
goto.0 core_state_L14?3
;
-- core_state_L15?3
ldw.0 r0.2, r0.1[0x78]
;
ldw.0 r0.12, r0.1[0x68]
;
ldw.0 r0.6, r0.1[0x74]
;
ldw.0 r0.5, r0.1[0x6c]
;
stw.0 r0.1[0x30], r0.2
zxtb.0 r0.4, r0.12
;
add.0 r0.3, r0.2, r0.6
;
;
;
-- core_state_L16?3
ldw.0 r0.2, r0.1[0x30]
;
;
;
cmpltu.0 b0.0, r0.2, r0.3
ldbu_d.0 r0.6, r0.2[0x0]
;
;
;
cmpne.0 b0.0, r0.6, 0x2c
xor.0 r0.7, r0.6, r0.4
brf.0 b0.0, core_state_L17?3
;
;
;
brf.0 b0.0, core_state_L18?3
;
stb.0 r0.2[0x0], r0.7
;
-- core_state_L18?3
ldw.0 r0.2, r0.1[0x30]
;
;
;
add.0 r0.2, r0.2, r0.5
;
;
;
stw.0 r0.1[0x30], r0.2
cmpltu.0 b0.0, r0.2, r0.3
;
ldbu_d.0 r0.6, r0.2[0x0]
;
;
brf.0 b0.0, core_state_L19?3
;
cmpne.0 b0.0, r0.6, 0x2c
xor.0 r0.7, r0.6, r0.4
;
;
;
brf.0 b0.0, core_state_L20?3
;
stb.0 r0.2[0x0], r0.7
;
-- core_state_L20?3
ldw.0 r0.2, r0.1[0x30]
;
;
;
add.0 r0.2, r0.2, r0.5
;
;
;
stw.0 r0.1[0x30], r0.2
cmpltu.0 b0.0, r0.2, r0.3
;
ldbu_d.0 r0.6, r0.2[0x0]
;
;
brf.0 b0.0, core_state_L21?3
;
cmpne.0 b0.0, r0.6, 0x2c
xor.0 r0.7, r0.6, r0.4
;
;
;
brf.0 b0.0, core_state_L22?3
;
stb.0 r0.2[0x0], r0.7
;
-- core_state_L22?3
ldw.0 r0.2, r0.1[0x30]
;
;
;
add.0 r0.2, r0.2, r0.5
;
;
;
stw.0 r0.1[0x30], r0.2
cmpltu.0 b0.0, r0.2, r0.3
;
ldbu_d.0 r0.6, r0.2[0x0]
;
;
brf.0 b0.0, core_state_L23?3
;
cmpne.0 b0.0, r0.6, 0x2c
xor.0 r0.7, r0.6, r0.4
;
;
;
brf.0 b0.0, core_state_L24?3
;
stb.0 r0.2[0x0], r0.7
;
-- core_state_L24?3
ldw.0 r0.2, r0.1[0x30]
;
;
;
add.0 r0.2, r0.2, r0.5
;
;
;
stw.0 r0.1[0x30], r0.2
goto.0 core_state_L16?3
;
-- core_state_L23?3
mov.0 r0.57, r0.0
stw.0 r0.1[0x7c], r0.60
;
mov.0 r0.60, r0.58
goto.0 core_state_L25?3
;
-- core_state_L26?3
cmpltu.0 b0.0, r0.57, 0x8
sh2add.0 r0.2, r0.57, r0.59
mov.0 r0.4, r0.58
;
;
;
ldw_d.0 r0.3, r0.2[0x0]
brf.0 b0.0, core_state_L27?3
;
;
.call crcu32 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crcu32
;
sh2add.0 r0.2, r0.57, r0.60
mov.0 r0.4, r0.3
;
;
;
ldw.0 r0.3, r0.2[0x0]
;
;
.call crcu32 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crcu32
;
mov.0 r0.58, r0.3
add.0 r0.57, r0.57, 0x1
;
;
goto.0 core_state_L26?3
;
-- core_state_L27?3
ldw.0 l0.0, r0.1[0x54]
;
ldw.0 r0.60, r0.1[0x7c]
;
mov.0 r0.3, r0.58
ldw.0 r0.59, r0.1[0x60]
;
ldw.0 r0.58, r0.1[0x5c]
;
ldw.0 r0.57, r0.1[0x58]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x80, l0.0
;
-- core_state_L21?3
mov.0 r0.57, r0.0
stw.0 r0.1[0x7c], r0.60
;
mov.0 r0.60, r0.58
goto.0 core_state_L25?3
;
-- core_state_L19?3
mov.0 r0.57, r0.0
stw.0 r0.1[0x7c], r0.60
;
mov.0 r0.60, r0.58
goto.0 core_state_L25?3
;
-- core_state_L17?3
mov.0 r0.57, r0.0
stw.0 r0.1[0x7c], r0.60
;
mov.0 r0.60, r0.58
;
-- core_state_L25?3
ldw.0 r0.58, r0.1[0x70]
;
;
goto.0 core_state_L26?3
;
-- core_state_L9?3
stw.0 r0.1[0x6c], r0.5
add.0 r0.57, r0.1, 0x30
;
ldw.0 r0.4, r0.1[0x78]
goto.0 core_state_L13?3
;
-- core_state_L7?3
stw.0 r0.1[0x6c], r0.5
add.0 r0.57, r0.1, 0x30
;
ldw.0 r0.4, r0.1[0x78]
goto.0 core_state_L13?3
;
-- core_state_L5?3
add.0 r0.57, r0.1, 0x30
stw.0 r0.1[0x6c], r0.5
;
ldw.0 r0.4, r0.1[0x78]
;
-- core_state_L13?3
;
;
stw.0 r0.1[0x30], r0.4
goto.0 core_state_L14?3
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- FUNC_core_init_state
add.0 r0.1, r0.1, -0x20
sxth.0 r0.16, r0.4
mov.0 r0.15, r0.0
;
mov.0 r0.11, r0.0
add.0 r0.12, r0.3, -0x1
stw.0 r0.1[0x0], l0.0
mov.0 r0.13, r0.5
;
mov.0 r0.5, r0.0
mov.0 r0.17, r0.3
mov.0 r0.18, l0.0
;
;
;
-- core_state_L28?3
add.0 r0.10, r0.5, 0x1
cmpgtu.0 b0.0, r0.5, r0.0
mov.0 r0.9, 0x3
add.0 r0.14, r0.11, r0.13
;
mov.0 r0.7, 0x1
mov.0 r0.2, r0.15
mov.0 r0.4, r0.0
mov.0 r0.8, 0x2
;
;
add.0 r0.10, r0.10, r0.11
mov.0 r0.6, r0.14
;
;
;
cmpltu.0 b0.1, r0.10, r0.12
;
;
;
brf.0 b0.1, core_state_L29?3
;
brf.0 b0.0, core_state_L30?3
;
-- core_state_L31?3
cmpltu.0 b0.0, r0.4, r0.5
ldbu_d.0 r0.3, r0.2[0x0]
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
brf.0 b0.0, core_state_L32?3
;
stb.0 r0.6[0x0], r0.3
brf.0 b0.1, core_state_L33?3
;
ldbu.0 r0.3, r0.2[0x1]
;
;
;
stb.0 r0.6[0x1], r0.3
brf.0 b0.2, core_state_L34?3
;
ldbu.0 r0.3, r0.2[0x2]
;
;
;
stb.0 r0.6[0x2], r0.3
brf.0 b0.3, core_state_L35?3
;
ldbu.0 r0.3, r0.2[0x3]
add.0 r0.2, r0.2, 0x4
;
;
;
stb.0 r0.6[0x3], r0.3
add.0 r0.6, r0.6, 0x4
;
;
goto.0 core_state_L31?3
;
-- core_state_L35?3
mov.0 r0.3, 0x2c
maxu.0 r0.2, r0.5, r0.0
add.0 r0.4, r0.5, 0x1
goto.0 core_state_L36?3
;
-- core_state_L30?3
add.0 r0.16, r0.16, 0x1
;
;
;
sxth.0 r0.4, r0.16
and.0 r0.6, r0.16, 0x7
;
;
;
cmplt.0 r0.7, r0.6, r0.0
cmpgt.0 r0.8, r0.6, 0x7
sh2add.0 r0.9, r0.6, (core_state_?1.core_init_state.TAGPACKET.0+0)
;
shr.0 r0.10, r0.4, 0x3
mov.0 r0.16, r0.4
;
;
orl.0 b0.0, r0.7, r0.8
ldw_d.0 l0.0, r0.9[0x0]
;
and.0 r0.10, r0.10, 0x3
;
;
br.0 b0.0, core_state_L28?3
;
sh2add.0 r0.10, r0.10, (core_state_9217.intpat+0)
mov.0 r0.5, 0x4
;
goto.0 l0.0
;
-- core_state_L37?3
-- FUNC_core_state__?1.core_init_state.TAG.0.0
;
ldw.0 r0.15, r0.10[0x0]
;
;
goto.0 core_state_L28?3
;
-- FUNC_core_state__?1.core_init_state.TAG.0.7
shr.0 r0.2, r0.16, 0x3
mov.0 r0.5, 0x8
;
;
;
and.0 r0.2, r0.2, 0x3
;
;
;
sh2add.0 r0.2, r0.2, (core_state_9217.errpat+0)
;
;
;
ldw.0 r0.15, r0.2[0x0]
;
;
goto.0 core_state_L28?3
;
-- FUNC_core_state__?1.core_init_state.TAG.0.6
mov.0 r0.5, 0x8
shr.0 r0.2, r0.16, 0x3
goto.0 core_state_L38?3
;
-- FUNC_core_state__?1.core_init_state.TAG.0.5
shr.0 r0.2, r0.16, 0x3
mov.0 r0.5, 0x8
;
-- core_state_L38?3
;
;
and.0 r0.2, r0.2, 0x3
;
;
;
sh2add.0 r0.2, r0.2, (core_state_9217.scipat+0)
;
;
;
ldw.0 r0.15, r0.2[0x0]
;
;
goto.0 core_state_L28?3
;
-- FUNC_core_state__?1.core_init_state.TAG.0.4
mov.0 r0.5, 0x8
shr.0 r0.2, r0.16, 0x3
goto.0 core_state_L39?3
;
-- FUNC_core_state__?1.core_init_state.TAG.0.3
shr.0 r0.2, r0.16, 0x3
mov.0 r0.5, 0x8
;
-- core_state_L39?3
;
;
and.0 r0.2, r0.2, 0x3
;
;
;
sh2add.0 r0.2, r0.2, (core_state_9217.floatpat+0)
;
;
;
ldw.0 r0.15, r0.2[0x0]
;
;
goto.0 core_state_L28?3
;
-- FUNC_core_state__?1.core_init_state.TAG.0.2
shr.0 r0.2, r0.16, 0x3
;
;
;
and.0 r0.10, r0.2, 0x3
;
;
;
sh2add.0 r0.10, r0.10, (core_state_9217.intpat+0)
;
goto.0 core_state_L37?3
;
-- FUNC_core_state__?1.core_init_state.TAG.0.1
shr.0 r0.2, r0.16, 0x3
;
;
;
and.0 r0.10, r0.2, 0x3
;
;
;
sh2add.0 r0.10, r0.10, (core_state_9217.intpat+0)
;
goto.0 core_state_L37?3
;
-- core_state_L34?3
mov.0 r0.3, 0x2c
maxu.0 r0.2, r0.5, r0.0
add.0 r0.4, r0.5, 0x1
goto.0 core_state_L36?3
;
-- core_state_L33?3
mov.0 r0.3, 0x2c
maxu.0 r0.2, r0.5, r0.0
add.0 r0.4, r0.5, 0x1
goto.0 core_state_L36?3
;
-- core_state_L32?3
maxu.0 r0.2, r0.5, r0.0
add.0 r0.4, r0.5, 0x1
mov.0 r0.3, 0x2c
;
-- core_state_L36?3
;
;
add.0 r0.2, r0.2, r0.13
;
;
;
add.0 r0.2, r0.2, r0.11
;
;
;
stb.0 r0.2[0x0], r0.3
add.0 r0.11, r0.4, r0.11
;
;
goto.0 core_state_L30?3
;
-- core_state_L29?3
add.0 r0.4, r0.13, r0.11
add.0 r0.5, r0.11, 0x1
add.0 r0.7, r0.11, 0x3
add.0 r0.6, r0.11, 0x2
;
mov.0 r0.3, r0.17
mov.0 r0.2, r0.11
;
;
-- core_state_L40?3
cmpltu.0 b0.0, r0.2, r0.3
cmpltu.0 b0.1, r0.5, r0.3
cmpltu.0 b0.2, r0.6, r0.3
cmpltu.0 b0.3, r0.7, r0.3
;
add.0 r0.5, r0.5, 0x4
add.0 r0.7, r0.7, 0x4
add.0 r0.6, r0.6, 0x4
add.0 r0.2, r0.2, 0x4
;
;
brf.0 b0.0, core_state_L41?3
;
stb.0 r0.4[0x0], r0.0
brf.0 b0.1, core_state_L41?3
;
stb.0 r0.4[0x1], r0.0
brf.0 b0.2, core_state_L41?3
;
stb.0 r0.4[0x2], r0.0
brf.0 b0.3, core_state_L41?3
;
stb.0 r0.4[0x3], r0.0
add.0 r0.4, r0.4, 0x4
;
;
goto.0 core_state_L40?3
;
-- core_state_L41?3
mov.0 l0.0, r0.18
stw.0 r0.1[0x0], r0.18
;
;
;
.return arg(return) ret()
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_core_state_9217.ee_isdigit
zxtb.0 r0.3, r0.3
;
;
;
cmple.0 r0.2, r0.3, 0x39
cmpge.0 r0.3, r0.3, 0x30
;
;
;
and.0 r0.2, r0.2, r0.3
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
slctf.0 r0.2, b0.0, r0.0, 0x1
;
;
;
zxtb.0 r0.3, r0.2
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_core_state_transition
add.0 r0.1, r0.1, -0x40
ldw.0 r0.2, r0.3[0x0]
;
stw.0 r0.1[0x10], l0.0
;
stw.0 r0.1[0x18], r0.57
;
stw.0 r0.1[0x1c], r0.58
mov.0 r0.57, r0.2
;
mov.0 r0.58, r0.0
stw.0 r0.1[0x20], r0.59
;
mov.0 r0.59, r0.4
stw.0 r0.1[0x24], r0.3
;
-- core_state_L42?3
ldbu.0 r0.3, r0.57[0x0]
cmpne.0 r0.2, r0.58, 0x1
cmpeq.0 b0.0, r0.58, r0.0
;
;
;
andl.0 b0.1, r0.3, r0.2
cmpeq.0 b0.2, r0.3, 0x2c
stw.0 r0.1[0x14], r0.3
;
;
;
brf.0 b0.1, core_state_L43?3
;
br.0 b0.2, core_state_L44?3
;
brf.0 b0.0, core_state_L45?3
;
.call core_state_9217 arg(r0.3) ret(r0.3)
call.0 l0.0, FUNC_core_state_9217.ee_isdigit
;
cmpne.0 b0.0, r0.3, r0.0
mov.0 r0.58, 0x4
ldw_d.0 r0.2, r0.59[0x0]
;
;
;
add.0 r0.2, r0.2, 0x1
brf.0 b0.0, core_state_L46?3
;
-- core_state_L47?3
add.0 r0.57, r0.57, 0x1
;
;
stw.0 r0.59[0x0], r0.2
goto.0 core_state_L42?3
;
-- core_state_L46?3
mov.0 r0.58, 0x2
ldw.0 r0.3, r0.1[0x14]
;
ldw_d.0 r0.4, r0.59[0x0]
;
;
cmpeq.0 r0.5, r0.3, 0x2b
cmpeq.0 r0.3, r0.3, 0x2d
;
mov.0 r0.2, r0.4
;
;
orl.0 b0.0, r0.5, r0.3
;
;
;
brf.0 b0.0, core_state_L48?3
;
add.0 r0.2, r0.2, 0x1
goto.0 core_state_L47?3
;
-- core_state_L48?3
mov.0 r0.58, 0x5
ldw.0 r0.3, r0.1[0x14]
;
ldw_d.0 r0.2, r0.59[0x0]
;
;
cmpeq.0 b0.0, r0.3, 0x2e
;
;
;
brf.0 b0.0, core_state_L49?3
;
add.0 r0.2, r0.2, 0x1
goto.0 core_state_L47?3
;
-- core_state_L49?3
ldw.0 r0.3, r0.59[0x4]
mov.0 r0.58, 0x1
;
ldw.0 r0.2, r0.59[0x0]
;
;
add.0 r0.3, r0.3, 0x1
;
;
;
stw.0 r0.59[0x4], r0.3
add.0 r0.2, r0.2, 0x1
goto.0 core_state_L47?3
;
-- core_state_L45?3
cmpeq.0 b0.0, r0.58, 0x2
stw.0 r0.1[0x14], r0.3
;
;
;
brf.0 b0.0, core_state_L50?3
;
.call core_state_9217 arg(r0.3) ret(r0.3)
call.0 l0.0, FUNC_core_state_9217.ee_isdigit
;
cmpne.0 b0.0, r0.3, r0.0
ldw_d.0 r0.2, r0.59[0x8]
mov.0 r0.58, 0x4
;
;
;
add.0 r0.2, r0.2, 0x1
brf.0 b0.0, core_state_L51?3
;
add.0 r0.57, r0.57, 0x1
;
;
stw.0 r0.59[0x8], r0.2
goto.0 core_state_L42?3
;
-- core_state_L51?3
ldw_d.0 r0.3, r0.59[0x8]
mov.0 r0.58, 0x5
;
ldw.0 r0.4, r0.1[0x14]
;
;
add.0 r0.3, r0.3, 0x1
;
cmpeq.0 b0.0, r0.4, 0x2e
;
;
;
brf.0 b0.0, core_state_L52?3
;
stw.0 r0.59[0x8], r0.3
add.0 r0.57, r0.57, 0x1
;
;
goto.0 core_state_L42?3
;
-- core_state_L52?3
ldw.0 r0.2, r0.59[0x8]
mov.0 r0.58, 0x1
add.0 r0.57, r0.57, 0x1
;
;
;
add.0 r0.2, r0.2, 0x1
;
;
;
stw.0 r0.59[0x8], r0.2
goto.0 core_state_L42?3
;
-- core_state_L50?3
cmpeq.0 b0.0, r0.58, 0x3
cmpeq.0 r0.4, r0.3, 0x2b
cmpeq.0 r0.5, r0.3, 0x2d
ldw_d.0 r0.2, r0.59[0xc]
;
;
;
orl.0 b0.0, r0.4, r0.5
add.0 r0.2, r0.2, 0x1
brf.0 b0.0, core_state_L53?3
;
mov.0 r0.58, 0x6
;
;
brf.0 b0.0, core_state_L54?3
;
stw.0 r0.59[0xc], r0.2
add.0 r0.57, r0.57, 0x1
;
;
goto.0 core_state_L42?3
;
-- core_state_L54?3
ldw.0 r0.2, r0.59[0xc]
mov.0 r0.58, 0x1
add.0 r0.57, r0.57, 0x1
;
;
;
add.0 r0.2, r0.2, 0x1
;
;
;
stw.0 r0.59[0xc], r0.2
goto.0 core_state_L42?3
;
-- core_state_L53?3
cmpeq.0 b0.1, r0.58, 0x4
cmpeq.0 b0.2, r0.3, 0x2e
ldw_d.0 r0.4, r0.59[0x10]
;
;
;
add.0 r0.4, r0.4, 0x1
brf.0 b0.1, core_state_L55?3
;
brf.0 b0.2, core_state_L56?3
;
mov.0 r0.58, 0x5
add.0 r0.57, r0.57, 0x1
;
stw.0 r0.59[0x10], r0.4
;
goto.0 core_state_L42?3
;
-- core_state_L56?3
.call core_state_9217 arg(r0.3) ret(r0.3)
call.0 l0.0, FUNC_core_state_9217.ee_isdigit
;
cmpeq.0 b0.0, r0.3, r0.0
ldw_d.0 r0.2, r0.59[0x10]
;
;
;
add.0 r0.2, r0.2, 0x1
brf.0 b0.0, core_state_L57?3
;
mov.0 r0.58, 0x1
add.0 r0.57, r0.57, 0x1
;
;
stw.0 r0.59[0x10], r0.2
goto.0 core_state_L42?3
;
-- core_state_L57?3
add.0 r0.57, r0.57, 0x1
;
;
goto.0 core_state_L42?3
;
-- core_state_L55?3
cmpeq.0 b0.0, r0.58, 0x5
cmpeq.0 r0.5, r0.3, 0x45
cmpeq.0 r0.6, r0.3, 0x65
ldw_d.0 r0.2, r0.59[0x14]
;
;
;
orl.0 b0.0, r0.5, r0.6
add.0 r0.2, r0.2, 0x1
brf.0 b0.0, core_state_L58?3
;
;
;
brf.0 b0.0, core_state_L59?3
;
mov.0 r0.58, 0x3
stw.0 r0.59[0x14], r0.2
add.0 r0.57, r0.57, 0x1
;
;
goto.0 core_state_L42?3
;
-- core_state_L59?3
.call core_state_9217 arg(r0.3) ret(r0.3)
call.0 l0.0, FUNC_core_state_9217.ee_isdigit
;
cmpeq.0 b0.0, r0.3, r0.0
ldw_d.0 r0.2, r0.59[0x14]
;
;
;
add.0 r0.2, r0.2, 0x1
brf.0 b0.0, core_state_L60?3
;
mov.0 r0.58, 0x1
add.0 r0.57, r0.57, 0x1
;
;
stw.0 r0.59[0x14], r0.2
goto.0 core_state_L42?3
;
-- core_state_L60?3
add.0 r0.57, r0.57, 0x1
;
;
goto.0 core_state_L42?3
;
-- core_state_L58?3
cmpeq.0 b0.1, r0.58, 0x6
;
;
;
brf.0 b0.1, core_state_L61?3
;
.call core_state_9217 arg(r0.3) ret(r0.3)
call.0 l0.0, FUNC_core_state_9217.ee_isdigit
;
cmpne.0 b0.0, r0.3, r0.0
ldw_d.0 r0.2, r0.59[0x18]
mov.0 r0.58, 0x7
;
;
;
add.0 r0.2, r0.2, 0x1
brf.0 b0.0, core_state_L62?3
;
add.0 r0.57, r0.57, 0x1
;
;
stw.0 r0.59[0x18], r0.2
goto.0 core_state_L42?3
;
-- core_state_L62?3
ldw.0 r0.3, r0.59[0x18]
mov.0 r0.58, 0x1
add.0 r0.57, r0.57, 0x1
;
;
;
add.0 r0.3, r0.3, 0x1
;
;
;
stw.0 r0.59[0x18], r0.3
goto.0 core_state_L42?3
;
-- core_state_L61?3
cmpeq.0 b0.0, r0.58, 0x7
;
;
;
brf.0 b0.0, core_state_L63?3
;
.call core_state_9217 arg(r0.3) ret(r0.3)
call.0 l0.0, FUNC_core_state_9217.ee_isdigit
;
cmpeq.0 b0.0, r0.3, r0.0
ldw_d.0 r0.2, r0.59[0x4]
;
;
;
add.0 r0.2, r0.2, 0x1
brf.0 b0.0, core_state_L64?3
;
mov.0 r0.58, 0x1
add.0 r0.57, r0.57, 0x1
;
;
stw.0 r0.59[0x4], r0.2
goto.0 core_state_L42?3
;
-- core_state_L64?3
add.0 r0.57, r0.57, 0x1
;
;
goto.0 core_state_L42?3
;
-- core_state_L63?3
add.0 r0.57, r0.57, 0x1
;
;
goto.0 core_state_L42?3
;
-- core_state_L44?3
add.0 r0.57, r0.57, 0x1
mov.0 r0.3, r0.58
;
;
ldw.0 r0.2, r0.1[0x24]
goto.0 core_state_L65?3
;
-- core_state_L43?3
mov.0 r0.3, r0.58
ldw.0 r0.2, r0.1[0x24]
;
-- core_state_L65?3
ldw.0 l0.0, r0.1[0x10]
;
ldw.0 r0.59, r0.1[0x20]
;
ldw.0 r0.58, r0.1[0x1c]
;
stw.0 r0.2[0x0], r0.57
;
ldw.0 r0.57, r0.1[0x18]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
ENDOFFILE: core_state
FILE: core_util
.entry arg(r0.3) ret()
-- FUNC_get_seed_32
cmpeq.0 b0.0, r0.3, 0x1
;
;
;
brf.0 b0.0, core_util_L0?3
;
ldw.0 r0.3, r0.0[(seed1_volatile+0)]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_util_L0?3
cmpeq.0 b0.0, r0.3, 0x2
;
;
;
brf.0 b0.0, core_util_L1?3
;
ldw.0 r0.3, r0.0[(seed2_volatile+0)]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_util_L1?3
cmpeq.0 b0.0, r0.3, 0x3
;
;
;
brf.0 b0.0, core_util_L2?3
;
ldw.0 r0.3, r0.0[(seed3_volatile+0)]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_util_L2?3
cmpeq.0 b0.0, r0.3, 0x4
;
;
;
brf.0 b0.0, core_util_L3?3
;
ldw.0 r0.3, r0.0[(seed4_volatile+0)]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_util_L3?3
cmpeq.0 b0.0, r0.3, 0x5
;
;
;
brf.0 b0.0, core_util_L4?3
;
ldw.0 r0.3, r0.0[(seed5_volatile+0)]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_util_L4?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.0
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_crcu8
zxth.0 r0.2, r0.4
zxtb.0 r0.3, r0.3
;
mov.0 r0.7, r0.0
;
;
mov.0 r0.4, r0.3
;
-- core_util_L5?3
and.0 r0.3, r0.2, 0x1
and.0 r0.5, r0.4, 0x1
xor.0 r0.6, r0.2, 0x4002
;
cmplt.0 b0.0, r0.7, 0x8
shr.0 r0.4, r0.4, 0x1
add.0 r0.7, r0.7, 0x1
;
;
xor.0 r0.3, r0.3, r0.5
zxth.0 r0.6, r0.6
;
zxtb.0 r0.4, r0.4
zxtb.0 r0.7, r0.7
brf.0 b0.0, core_util_L6?3
;
;
zxtb.0 r0.3, r0.3
;
cmplt.0 b0.0, r0.7, 0x8
and.0 r0.5, r0.4, 0x1
shr.0 r0.4, r0.4, 0x1
add.0 r0.7, r0.7, 0x1
;
;
cmpeq.0 b0.1, r0.3, 0x1
;
zxtb.0 r0.4, r0.4
zxtb.0 r0.7, r0.7
;
;
slct.0 r0.6, b0.1, r0.6, r0.2
slctf.0 r0.3, b0.1, r0.0, 0x1
;
;
;
shr.0 r0.6, r0.6, 0x1
cmpne.0 b0.1, r0.3, r0.0
;
;
;
or.0 r0.3, r0.6, 0x8000
and.0 r0.6, r0.6, 0x7fff
;
;
;
zxth.0 r0.3, r0.3
zxth.0 r0.6, r0.6
;
;
;
slct.0 r0.3, b0.1, r0.3, r0.6
brf.0 b0.0, core_util_L7?3
;
;
;
and.0 r0.6, r0.3, 0x1
xor.0 r0.8, r0.3, 0x4002
;
;
;
xor.0 r0.6, r0.6, r0.5
zxth.0 r0.8, r0.8
;
;
;
zxtb.0 r0.6, r0.6
;
;
;
cmpeq.0 b0.0, r0.6, 0x1
;
;
;
slct.0 r0.8, b0.0, r0.8, r0.3
slctf.0 r0.3, b0.0, r0.0, 0x1
;
;
;
shr.0 r0.8, r0.8, 0x1
cmpne.0 b0.0, r0.3, r0.0
;
;
;
or.0 r0.3, r0.8, 0x8000
and.0 r0.8, r0.8, 0x7fff
;
;
;
zxth.0 r0.3, r0.3
zxth.0 r0.8, r0.8
;
;
;
slct.0 r0.2, b0.0, r0.3, r0.8
;
;
goto.0 core_util_L5?3
;
-- core_util_L7?3
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
-- core_util_L6?3
;
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.2
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_crcu16
add.0 r0.1, r0.1, -0x20
zxth.0 r0.4, r0.4
zxtb.0 r0.2, r0.3
;
zxth.0 r0.5, r0.3
stw.0 r0.1[0x10], l0.0
;
;
mov.0 r0.3, r0.2
;
.call crcu8 arg(r0.3,r0.4) ret(r0.3)
stw.0 r0.1[0x14], r0.5
call.0 l0.0, FUNC_crcu8
;
mov.0 r0.4, r0.3
;
;
ldw.0 r0.5, r0.1[0x14]
;
;
;
shr.0 r0.5, r0.5, 0x8
;
;
;
zxtb.0 r0.3, r0.5
;
;
.call crcu8 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crcu8
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_crcu32
add.0 r0.1, r0.1, -0x20
zxth.0 r0.4, r0.4
sxth.0 r0.2, r0.3
;
stw.0 r0.1[0x10], l0.0
;
stw.0 r0.1[0x14], r0.3
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
mov.0 r0.3, r0.2
call.0 l0.0, FUNC_crc16
;
mov.0 r0.4, r0.3
;
ldw.0 r0.2, r0.1[0x14]
;
;
;
shru.0 r0.2, r0.2, 0x10
;
;
;
sxth.0 r0.3, r0.2
;
;
.call crc16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crc16
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_crc16
add.0 r0.1, r0.1, -0x20
zxth.0 r0.3, r0.3
zxth.0 r0.4, r0.4
;
stw.0 r0.1[0x10], l0.0
;
.call crcu16 arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, FUNC_crcu16
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg() ret()
-- FUNC_check_data_types
add.0 r0.1, r0.1, -0x20
mov.0 r0.3, r0.0
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
ENDOFFILE: core_util
FILE: floatlib
.entry arg(r0.3,r0.4,r0.5) ret()
-- floatlib_FUNC_estimateDiv64To32
add.0 r0.1, r0.1, -0x20
cmpleu.0 b0.0, r0.5, r0.3
mov.0 r0.2, r0.3
;
mov.0 r0.3, ~0x0
;
;
brf.0 b0.0, floatlib_L0?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L0?3
shru.0 r0.11, r0.5, 0x10
mtb.0 b0.0, r0.0
mov.0 r0.12, ~0xffff
;
shl.0 r0.3, r0.5, 0x10
mov.0 r0.9, r0.12
add.0 r0.13, r0.1, 0x4
mov.0 r0.6, r0.1
;
mov.0 r0.10, r0.0
;
shl.0 r0.16, r0.11, 0x10
cmplt.0 r0.14, r0.11, r0.0
cmpgeu.0 r0.15, r0.2, r0.11
;
;
;
shru.0 r0.18, r0.11, r0.14
shru.0 r0.17, r0.2, r0.14
cmpgtu.0 b0.2, r0.16, r0.2
mtb.0 b0.1, r0.14
;
;
;
addcg.0 r0.14, b0.3, r0.17, r0.17, b0.0
;
divs.0 r0.14, b0.3, r0.0, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.14, r0.14, b0.0
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
divs.0 r0.14, b0.3, r0.14, r0.18, b0.3
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
;
divs.0 r0.14, b0.4, r0.14, r0.18, b0.4
addcg.0 r0.16, b0.3, r0.17, r0.17, b0.3
;
addcg.0 r0.17, b0.4, r0.16, r0.16, b0.4
cmpge.0 r0.14, r0.14, r0.0
;
orc.0 r0.17, r0.17, r0.0
;
;
;
sh1add.0 r0.17, r0.17, r0.14
;
;
;
slct.0 r0.15, b0.1, r0.15, r0.17
;
;
;
shl.0 r0.15, r0.15, 0x10
;
;
;
slct.0 r0.8, b0.2, r0.15, r0.12
;
;
;
add.0 r0.7, r0.8, r0.12
mpylhu.0 r0.15, r0.5, r0.8
mpylhu.0 r0.14, r0.8, r0.5
;
mpyhhu.0 r0.5, r0.5, r0.8
mpyllu.0 r0.12, r0.5, r0.8
;
;
add.0 r0.15, r0.14, r0.15
;
;
;
shru.0 r0.15, r0.15, 0x10
cmpltu.0 r0.14, r0.15, r0.14
shl.0 r0.16, r0.15, 0x10
;
;
;
shl.0 r0.14, r0.14, 0x10
add.0 r0.12, r0.12, r0.16
add.0 r0.15, r0.15, r0.5
mov.0 r0.5, r0.13
;
;
;
cmpltu.0 r0.16, r0.12, r0.16
stw.0 r0.1[0x8], r0.12
sub.0 r0.4, r0.4, r0.12
cmpltu.0 r0.13, r0.4, r0.12
;
;
;
add.0 r0.14, r0.14, r0.16
stw.0 r0.1[0x0], r0.4
;
mov.0 r0.4, r0.11
;
;
add.0 r0.15, r0.15, r0.14
;
;
;
stw.0 r0.1[0xc], r0.15
sub.0 r0.2, r0.2, r0.15
;
;
;
sub.0 r0.2, r0.2, r0.13
;
;
;
stw.0 r0.1[0x4], r0.2
;
-- floatlib_L1?3
ldw_d.0 r0.2, r0.1[0x0]
;
ldw.0 r0.11, r0.1[0x4]
;
;
add.0 r0.12, r0.2, r0.3
;
cmplt.0 b0.0, r0.11, r0.0
add.0 r0.13, r0.11, r0.4
;
;
cmpltu.0 r0.2, r0.12, r0.2
;
brf.0 b0.0, floatlib_L2?3
;
stw.0 r0.6[0x0], r0.12
add.0 r0.8, r0.8, -0x20000
;
add.0 r0.13, r0.13, r0.2
ldw_d.0 r0.2, r0.1[0x0]
;
;
;
stw.0 r0.5[0x0], r0.13
add.0 r0.11, r0.3, r0.2
;
ldw.0 r0.12, r0.1[0x4]
;
;
cmpltu.0 r0.2, r0.11, r0.2
;
cmplt.0 b0.0, r0.12, r0.0
;
;
add.0 r0.2, r0.4, r0.2
;
brf.0 b0.0, floatlib_L3?3
;
stw.0 r0.6[0x0], r0.11
add.0 r0.10, r0.10, -0x20000
;
add.0 r0.2, r0.2, r0.12
ldw_d.0 r0.11, r0.1[0x0]
;
;
;
stw.0 r0.5[0x0], r0.2
add.0 r0.12, r0.3, r0.11
;
ldw.0 r0.2, r0.1[0x4]
;
;
cmpltu.0 r0.11, r0.12, r0.11
;
cmplt.0 b0.0, r0.2, r0.0
;
;
add.0 r0.11, r0.4, r0.11
;
brf.0 b0.0, floatlib_L4?3
;
stw.0 r0.6[0x0], r0.12
add.0 r0.7, r0.7, ~0x1ffff
;
add.0 r0.11, r0.11, r0.2
ldw_d.0 r0.2, r0.1[0x0]
;
;
;
stw.0 r0.5[0x0], r0.11
add.0 r0.12, r0.3, r0.2
;
ldw.0 r0.11, r0.1[0x4]
;
;
cmpltu.0 r0.2, r0.12, r0.2
;
cmplt.0 b0.0, r0.11, r0.0
;
;
add.0 r0.2, r0.4, r0.2
;
brf.0 b0.0, floatlib_L5?3
;
stw.0 r0.6[0x0], r0.12
add.0 r0.9, r0.9, ~0x1ffff
;
add.0 r0.2, r0.2, r0.11
;
;
;
stw.0 r0.5[0x0], r0.2
goto.0 floatlib_L1?3
;
-- floatlib_L5?3
mov.0 r0.10, r0.9
ldw.0 r0.5, r0.1[0x0]
shl.0 r0.7, r0.4, 0x10
;
cmplt.0 r0.6, r0.4, r0.0
mtb.0 b0.0, r0.0
;
ldw.0 r0.2, r0.1[0x4]
;
add.0 r0.8, r0.8, r0.10
goto.0 floatlib_L6?3
;
-- floatlib_L4?3
mov.0 r0.10, r0.9
mov.0 r0.8, r0.7
ldw.0 r0.5, r0.1[0x0]
shl.0 r0.7, r0.4, 0x10
;
cmplt.0 r0.6, r0.4, r0.0
mtb.0 b0.0, r0.0
;
ldw.0 r0.2, r0.1[0x4]
;
add.0 r0.8, r0.8, r0.10
goto.0 floatlib_L6?3
;
-- floatlib_L3?3
mov.0 r0.8, r0.7
ldw.0 r0.5, r0.1[0x0]
shl.0 r0.7, r0.4, 0x10
;
cmplt.0 r0.6, r0.4, r0.0
mtb.0 b0.0, r0.0
;
ldw.0 r0.2, r0.1[0x4]
;
add.0 r0.8, r0.8, r0.10
goto.0 floatlib_L6?3
;
-- floatlib_L2?3
ldw.0 r0.5, r0.1[0x0]
shl.0 r0.7, r0.4, 0x10
cmplt.0 r0.6, r0.4, r0.0
mtb.0 b0.0, r0.0
;
ldw.0 r0.2, r0.1[0x4]
;
add.0 r0.8, r0.8, r0.10
;
-- floatlib_L6?3
shru.0 r0.5, r0.5, 0x10
shru.0 r0.9, r0.4, r0.6
mtb.0 b0.1, r0.6
;
shl.0 r0.2, r0.2, 0x10
;
;
;
or.0 r0.5, r0.5, r0.2
;
;
;
stw.0 r0.1[0x4], r0.5
shru.0 r0.6, r0.5, r0.6
cmpgeu.0 r0.4, r0.5, r0.4
cmpgtu.0 b0.2, r0.7, r0.5
;
;
;
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.0
;
divs.0 r0.5, b0.3, r0.0, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.0
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
divs.0 r0.5, b0.3, r0.5, r0.9, b0.3
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
;
divs.0 r0.5, b0.4, r0.5, r0.9, b0.4
addcg.0 r0.2, b0.3, r0.6, r0.6, b0.3
;
addcg.0 r0.6, b0.4, r0.2, r0.2, b0.4
cmpge.0 r0.5, r0.5, r0.0
;
orc.0 r0.6, r0.6, r0.0
;
;
;
sh1add.0 r0.6, r0.6, r0.5
;
;
;
slct.0 r0.4, b0.1, r0.4, r0.6
;
;
;
slct.0 r0.4, b0.2, r0.4, 0xffff
;
;
;
or.0 r0.3, r0.8, r0.4
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3) ret()
-- floatlib_FUNC_countLeadingZeros32
cmpgeu.0 b0.0, r0.3, 0x10000
;
shl.0 r0.2, r0.3, 0x10
;
;
slct.0 r0.4, b0.0, r0.0, 0x10
;
slct.0 r0.3, b0.0, r0.3, r0.2
;
;
add.0 r0.2, r0.4, 0x8
;
cmpgeu.0 b0.0, r0.3, 0x1000000
shl.0 r0.5, r0.3, 0x8
;
;
;
slct.0 r0.3, b0.0, r0.3, r0.5
slct.0 r0.4, b0.0, r0.4, r0.2
;
;
;
shru.0 r0.3, r0.3, 0x18
;
;
;
sh2add.0 r0.3, r0.3, (floatlib_?1PACKET.37+0)
;
;
;
ldw.0 r0.3, r0.3[0x0]
;
;
;
add.0 r0.3, r0.4, r0.3
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3) ret()
-- floatlib_FUNC_float_raise
ldw.0 r0.2, r0.0[(floatlib_?1PACKET.3+0)]
;
;
;
or.0 r0.3, r0.3, r0.2
;
;
;
.return arg(return) ret()
stw.0 r0.0[(floatlib_?1PACKET.3+0)], r0.3
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3) ret()
-- floatlib_FUNC_float32ToCommonNaN
add.0 r0.1, r0.1, -0x20
shru.0 r0.2, r0.3, 0x16
shru.0 r0.6, r0.3, 0x1f
;
and.0 r0.7, r0.3, 0x3fffff
shl.0 r0.4, r0.3, 0x9
stw.0 r0.1[0x10], l0.0
;
mov.0 r0.5, r0.0
;
and.0 r0.2, r0.2, 0x1ff
mov.0 r0.8, r0.3
;
mov.0 r0.3, r0.6
;
;
cmpeq.0 r0.2, r0.2, 0x1fe
;
;
;
andl.0 b0.0, r0.2, r0.7
;
;
;
br.0 b0.0, floatlib_L7?3
;
-- floatlib_L8?3
.return arg(return) ret(r0.3,r0.4,r0.5)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L7?3
.call float_raise arg(r0.3) ret()
stw.0 r0.1[0x14], r0.8
mov.0 r0.3, 0x10
call.0 l0.0, floatlib_FUNC_float_raise
;
mov.0 r0.5, r0.0
ldw.0 l0.0, r0.1[0x10]
;
;
ldw.0 r0.2, r0.1[0x14]
;
;
;
shru.0 r0.3, r0.2, 0x1f
shl.0 r0.4, r0.2, 0x9
;
;
goto.0 floatlib_L8?3
;
.entry arg(r0.3,r0.4) ret()
-- floatlib_FUNC_propagateFloat32NaN
add.0 r0.1, r0.1, -0x40
shl.0 r0.2, r0.4, 0x1
shru.0 r0.5, r0.4, 0x16
;
shru.0 r0.7, r0.3, 0x16
or.0 r0.6, r0.3, 0x400000
stw.0 r0.1[0x10], l0.0
;
and.0 r0.9, r0.4, 0x3fffff
or.0 r0.8, r0.4, 0x400000
;
cmpgtu.0 r0.2, r0.2, ~0xffffff
and.0 r0.5, r0.5, 0x1ff
;
and.0 r0.7, r0.7, 0x1ff
and.0 r0.3, r0.3, 0x3fffff
;
;
cmpeq.0 r0.5, r0.5, 0x1fe
cmpne.0 b0.0, r0.2, r0.0
;
cmpeq.0 r0.7, r0.7, 0x1fe
;
;
andl.0 r0.5, r0.5, r0.9
slct.0 r0.4, b0.0, r0.8, r0.6
;
andl.0 r0.7, r0.7, r0.3
;
;
cmpne.0 b0.0, r0.5, r0.0
;
or.0 r0.9, r0.5, r0.7
cmpne.0 b0.1, r0.7, r0.0
;
;
;
cmpne.0 b0.2, r0.9, r0.0
slct.0 r0.4, b0.1, r0.6, r0.4
;
;
;
slct.0 r0.3, b0.0, r0.8, r0.4
br.0 b0.2, floatlib_L9?3
;
-- floatlib_L10?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L9?3
stw.0 r0.1[0x14], r0.5
;
stw.0 r0.1[0x18], r0.7
;
stw.0 r0.1[0x1c], r0.6
mov.0 r0.3, 0x10
;
stw.0 r0.1[0x20], r0.8
;
.call float_raise arg(r0.3) ret()
stw.0 r0.1[0x24], r0.2
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw.0 r0.6, r0.1[0x1c]
;
ldw.0 r0.8, r0.1[0x20]
;
ldw.0 r0.2, r0.1[0x24]
;
ldw.0 r0.7, r0.1[0x18]
;
ldw.0 r0.5, r0.1[0x14]
;
cmpne.0 b0.1, r0.2, r0.0
ldw.0 l0.0, r0.1[0x10]
;
cmpne.0 b0.2, r0.7, r0.0
;
cmpne.0 b0.0, r0.5, r0.0
;
slct.0 r0.2, b0.1, r0.8, r0.6
;
;
;
slct.0 r0.4, b0.2, r0.6, r0.2
;
;
;
slct.0 r0.3, b0.0, r0.8, r0.4
goto.0 floatlib_L10?3
;
.entry arg(r0.3,r0.4) ret()
-- floatlib_FUNC_float64ToCommonNaN
add.0 r0.1, r0.1, -0x40
shru.0 r0.2, r0.3, 0x13
shru.0 r0.6, r0.3, 0x1f
;
and.0 r0.7, r0.3, 0x7ffff
shl.0 r0.5, r0.4, 0xc
stw.0 r0.1[0x1c], l0.0
;
shl.0 r0.8, r0.3, 0xc
shru.0 r0.9, r0.4, 0x14
;
and.0 r0.2, r0.2, 0xfff
mov.0 r0.10, r0.3
;
orl.0 r0.7, r0.4, r0.7
;
or.0 r0.8, r0.8, r0.9
mov.0 r0.3, r0.6
;
cmpeq.0 r0.2, r0.2, 0xffe
;
;
mov.0 r0.9, r0.4
;
andl.0 b0.0, r0.2, r0.7
mov.0 r0.4, r0.8
;
;
;
br.0 b0.0, floatlib_L11?3
;
-- floatlib_L12?3
stw.0 r0.1[0x10], r0.6
;
stw.0 r0.1[0x18], r0.5
;
.return arg(return) ret(r0.3,r0.4,r0.5)
stw.0 r0.1[0x14], r0.8
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L11?3
stw.0 r0.1[0x20], r0.9
mov.0 r0.3, 0x10
;
.call float_raise arg(r0.3) ret()
stw.0 r0.1[0x24], r0.10
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw.0 l0.0, r0.1[0x1c]
;
ldw.0 r0.2, r0.1[0x20]
;
ldw.0 r0.7, r0.1[0x24]
;
;
shl.0 r0.5, r0.2, 0xc
shru.0 r0.9, r0.2, 0x14
;
shru.0 r0.6, r0.7, 0x1f
shl.0 r0.2, r0.7, 0xc
;
;
;
or.0 r0.8, r0.2, r0.9
mov.0 r0.3, r0.6
;
;
;
mov.0 r0.4, r0.8
goto.0 floatlib_L12?3
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- floatlib_FUNC_commonNaNToFloat64
add.0 r0.1, r0.1, -0x20
shru.0 r0.2, r0.4, 0xc
shl.0 r0.3, r0.3, 0x1f
;
shru.0 r0.5, r0.5, 0xc
shl.0 r0.4, r0.4, 0x14
;
;
or.0 r0.2, r0.2, 0x7ff80000
;
or.0 r0.4, r0.5, r0.4
;
;
or.0 r0.3, r0.2, r0.3
;
stw.0 r0.1[0x4], r0.4
;
;
.return arg(return) ret(r0.3,r0.4)
stw.0 r0.1[0x0], r0.3
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- floatlib_FUNC_propagateFloat64NaN
add.0 r0.1, r0.1, -0x40
shl.0 r0.2, r0.5, 0x1
shru.0 r0.7, r0.5, 0x13
;
and.0 r0.8, r0.5, 0xfffff
shru.0 r0.9, r0.3, 0x13
stw.0 r0.1[0x10], l0.0
;
or.0 r0.10, r0.3, 0x80000
or.0 r0.11, r0.5, 0x80000
;
cmpgeu.0 r0.2, r0.2, ~0x1fffff
and.0 r0.7, r0.7, 0xfff
;
orl.0 r0.8, r0.6, r0.8
and.0 r0.12, r0.5, 0x7ffff
;
and.0 r0.9, r0.9, 0xfff
and.0 r0.3, r0.3, 0x7ffff
;
cmpeq.0 r0.7, r0.7, 0xffe
;
andl.0 r0.2, r0.2, r0.8
orl.0 r0.12, r0.6, r0.12
;
cmpeq.0 r0.9, r0.9, 0xffe
orl.0 r0.3, r0.4, r0.3
mov.0 r0.5, r0.4
;
;
andl.0 r0.7, r0.7, r0.12
;
andl.0 r0.9, r0.9, r0.3
mov.0 r0.4, r0.6
;
;
cmpne.0 b0.0, r0.7, r0.0
;
or.0 r0.6, r0.7, r0.9
mov.0 r0.3, r0.11
;
;
;
cmpne.0 b0.1, r0.6, r0.0
;
;
;
br.0 b0.1, floatlib_L13?3
;
-- floatlib_L14?3
brf.0 b0.0, floatlib_L15?3
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L15?3
cmpne.0 b0.0, r0.9, r0.0
mov.0 r0.4, r0.5
mov.0 r0.6, r0.4
mov.0 r0.11, r0.3
;
mov.0 r0.3, r0.10
;
;
brf.0 b0.0, floatlib_L16?3
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L16?3
cmpne.0 b0.0, r0.2, r0.0
mov.0 r0.4, r0.6
mov.0 r0.2, r0.4
mov.0 r0.10, r0.3
;
mov.0 r0.3, r0.11
;
;
brf.0 b0.0, floatlib_L17?3
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L17?3
.return arg(return) ret(r0.3,r0.4)
mov.0 r0.4, r0.2
mov.0 r0.3, r0.10
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L13?3
stw.0 r0.1[0x14], r0.5
;
stw.0 r0.1[0x18], r0.3
;
stw.0 r0.1[0x1c], r0.4
mov.0 r0.3, 0x10
;
stw.0 r0.1[0x20], r0.10
;
stw.0 r0.1[0x24], r0.9
;
stw.0 r0.1[0x28], r0.2
;
.call float_raise arg(r0.3) ret()
stw.0 r0.1[0x2c], r0.7
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw.0 l0.0, r0.1[0x10]
;
ldw.0 r0.5, r0.1[0x14]
;
ldw.0 r0.7, r0.1[0x2c]
;
ldw.0 r0.3, r0.1[0x18]
;
ldw.0 r0.4, r0.1[0x1c]
;
cmpne.0 b0.0, r0.7, r0.0
ldw.0 r0.10, r0.1[0x20]
;
ldw.0 r0.9, r0.1[0x24]
;
ldw.0 r0.2, r0.1[0x28]
;
;
goto.0 floatlib_L14?3
;
.entry arg(entry) ret()
-- floatlib_FUNC_roundAndPackFloat32
add.0 r0.1, r0.1, -0x40
ldw.0 r0.2, r0.0[(floatlib_?1PACKET.2+0)]
;
cmpne.0 b0.0, r0.3, r0.0
and.0 r0.6, r0.5, 0x7f
zxth.0 r0.7, r0.4
stw.0 r0.1[0x10], l0.0
;
ldw_d.0 r0.8, r0.0[(floatlib_?1PACKET.3+0)]
;
cmpeq.0 r0.9, r0.2, r0.0
cmpeq.0 b0.3, r0.2, 0x3
cmpeq.0 b0.1, r0.2, 0x2
cmpeq.0 b0.2, r0.2, 0x1
;
cmpge.0 b0.4, r0.7, 0xfd
cmpne.0 b0.5, r0.6, r0.0
xor.0 r0.10, r0.6, 0x40
;
stw.0 r0.1[0x34], r0.3
or.0 r0.8, r0.8, 0x1
;
slct.0 r0.2, b0.1, r0.0, 0x7f
slct.0 r0.11, b0.2, r0.0, 0x7f
cmpeq.0 b0.6, r0.9, r0.0
;
cmpeq.0 r0.10, r0.10, r0.0
ldw_d.0 r0.7, r0.1[0x34]
;
stw.0 r0.1[0x38], r0.4
;
stw.0 r0.1[0x3c], r0.5
slct.0 r0.2, b0.0, r0.2, r0.11
;
ldw_d.0 r0.12, r0.1[0x3c]
and.0 r0.10, r0.9, r0.10
shl.0 r0.7, r0.7, 0x1f
;
;
slctf.0 r0.2, b0.3, r0.2, r0.0
;
orc.0 r0.10, r0.10, r0.0
;
;
slct.0 r0.2, b0.6, r0.2, 0x40
;
;
br.0 b0.4, floatlib_L18?3
;
-- floatlib_L19?3
add.0 r0.12, r0.12, r0.2
brf.0 b0.5, floatlib_L20?3
;
stw.0 r0.0[(floatlib_?1PACKET.3+0)], r0.8
;
-- floatlib_L21?3
;
shru.0 r0.12, r0.12, 0x7
;
;
;
and.0 r0.12, r0.12, r0.10
;
;
;
stw.0 r0.1[0x3c], r0.12
cmpeq.0 b0.0, r0.12, r0.0
;
ldw_d.0 r0.2, r0.1[0x3c]
;
;
brf.0 b0.0, floatlib_L22?3
;
stw.0 r0.1[0x38], r0.0
add.0 r0.2, r0.2, r0.7
;
-- floatlib_L23?3
ldw.0 r0.4, r0.1[0x38]
;
;
;
shl.0 r0.4, r0.4, 0x17
;
;
;
add.0 r0.3, r0.2, r0.4
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L22?3
add.0 r0.2, r0.2, r0.7
goto.0 floatlib_L23?3
;
-- floatlib_L20?3
ldw.0 r0.3, r0.1[0x3c]
;
;
;
mov.0 r0.12, r0.3
;
add.0 r0.12, r0.12, r0.2
;
goto.0 floatlib_L21?3
;
-- floatlib_L18?3
cmpgt.0 r0.4, r0.4, 0xfd
cmpeq.0 r0.11, r0.4, 0xfd
add.0 r0.5, r0.5, r0.2
stw.0 r0.1[0x14], r0.2
;
mov.0 r0.3, 0x5
;
;
cmplt.0 r0.5, r0.5, r0.0
;
;
;
andl.0 r0.11, r0.11, r0.5
;
;
;
orl.0 b0.0, r0.4, r0.11
;
;
;
brf.0 b0.0, floatlib_L24?3
;
.call float_raise arg(r0.3) ret()
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw.0 r0.4, r0.1[0x34]
;
ldw.0 r0.2, r0.1[0x14]
;
ldw.0 l0.0, r0.1[0x10]
;
shl.0 r0.4, r0.4, 0x1f
;
cmpeq.0 r0.2, r0.2, r0.0
;
;
add.0 r0.4, r0.4, 0x7f800000
;
;
;
sub.0 r0.3, r0.4, r0.2
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L24?3
mov.0 r0.3, 0x2
stw.0 r0.1[0x18], r0.9
;
ldw_d.0 r0.4, r0.1[0x3c]
;
ldw.0 r0.5, r0.1[0x38]
;
ldw.0 r0.2, r0.1[0x14]
;
ldw_d.0 r0.13, r0.0[(floatlib_?1PACKET.1+0)]
cmpne.0 r0.11, r0.4, r0.0
;
cmplt.0 b0.0, r0.5, r0.0
sub.0 r0.14, r0.0, r0.5
cmplt.0 r0.5, r0.5, -0x1
;
add.0 r0.2, r0.4, r0.2
;
cmpeq.0 r0.13, r0.13, 0x1
;
sub.0 r0.15, r0.0, r0.14
shru.0 r0.16, r0.4, r0.14
cmpge.0 b0.1, r0.14, 0x20
cmpeq.0 b0.2, r0.14, r0.0
;
cmpltu.0 r0.2, r0.2, ~0x7fffffff
brf.0 b0.0, floatlib_L25?3
;
stw.0 r0.1[0x38], r0.0
;
and.0 r0.15, r0.15, 0x1f
;
orl.0 r0.13, r0.13, r0.2
;
;
shl.0 r0.15, r0.4, r0.15
;
orl.0 r0.13, r0.13, r0.5
;
;
cmpne.0 r0.15, r0.15, r0.0
;
;
;
or.0 r0.16, r0.16, r0.15
;
;
;
slct.0 r0.11, b0.1, r0.11, r0.16
;
;
;
slct.0 r0.4, b0.2, r0.4, r0.11
;
;
;
stw.0 r0.1[0x3c], r0.4
and.0 r0.6, r0.4, 0x7f
;
;
;
andl.0 b0.0, r0.13, r0.6
stw.0 r0.1[0x1c], r0.6
;
;
;
brf.0 b0.0, floatlib_L26?3
;
.call float_raise arg(r0.3) ret()
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw_d.0 r0.3, r0.0[(floatlib_?1PACKET.3+0)]
;
ldw.0 r0.6, r0.1[0x1c]
;
ldw.0 r0.9, r0.1[0x18]
;
or.0 r0.8, r0.3, 0x1
ldw_d.0 r0.3, r0.1[0x34]
;
cmpne.0 b0.5, r0.6, r0.0
ldw_d.0 r0.12, r0.1[0x3c]
xor.0 r0.4, r0.6, 0x40
;
ldw.0 l0.0, r0.1[0x10]
;
shl.0 r0.7, r0.3, 0x1f
ldw.0 r0.2, r0.1[0x14]
;
cmpeq.0 r0.4, r0.4, r0.0
;
;
;
and.0 r0.4, r0.9, r0.4
;
;
;
orc.0 r0.10, r0.4, r0.0
;
;
goto.0 floatlib_L19?3
;
-- floatlib_L26?3
ldw.0 r0.6, r0.1[0x1c]
;
ldw.0 r0.9, r0.1[0x18]
;
ldw_d.0 r0.12, r0.1[0x3c]
;
cmpne.0 b0.5, r0.6, r0.0
xor.0 r0.3, r0.6, 0x40
ldw.0 l0.0, r0.1[0x10]
;
ldw.0 r0.2, r0.1[0x14]
;
;
cmpeq.0 r0.3, r0.3, r0.0
;
;
;
and.0 r0.3, r0.9, r0.3
;
;
;
orc.0 r0.10, r0.3, r0.0
;
;
goto.0 floatlib_L19?3
;
-- floatlib_L25?3
ldw.0 l0.0, r0.1[0x10]
;
ldw.0 r0.9, r0.1[0x18]
;
ldw.0 r0.2, r0.1[0x14]
;
;
goto.0 floatlib_L19?3
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- floatlib_FUNC_normalizeRoundAndPackFloat32
add.0 r0.1, r0.1, -0x20
;
stw.0 r0.1[0x10], l0.0
;
stw.0 r0.1[0x14], r0.3
;
stw.0 r0.1[0x18], r0.4
mov.0 r0.3, r0.5
;
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
stw.0 r0.1[0x1c], r0.5
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
add.0 r0.2, r0.3, -0x1
;
ldw.0 r0.6, r0.1[0x18]
;
ldw.0 r0.7, r0.1[0x1c]
;
;
add.0 r0.6, r0.6, 0x1
;
shl.0 r0.5, r0.7, r0.2
;
;
sub.0 r0.4, r0.6, r0.3
ldw.0 r0.3, r0.1[0x14]
;
;
.call roundAndPackFloat32 arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_roundAndPackFloat32
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret()
-- floatlib_FUNC_normalizeFloat64Subnormal
add.0 r0.1, r0.1, -0x40
cmpeq.0 b0.0, r0.3, r0.0
mov.0 r0.2, r0.3
;
stw.0 r0.1[0x10], l0.0
;
stw.0 r0.1[0x14], r0.7
;
stw.0 r0.1[0x18], r0.6
mov.0 r0.3, r0.4
brf.0 b0.0, floatlib_L27?3
;
stw.0 r0.1[0x1c], r0.5
;
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
stw.0 r0.1[0x20], r0.4
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
add.0 r0.2, r0.3, -0xb
rsub.0 r0.4, -0x14, r0.3
ldw.0 r0.6, r0.1[0x18]
;
ldw.0 r0.7, r0.1[0x14]
;
ldw.0 r0.5, r0.1[0x20]
;
sub.0 r0.3, r0.0, r0.2
cmpge.0 b0.0, r0.2, r0.0
and.0 r0.8, r0.2, 0x1f
ldw.0 r0.9, r0.1[0x1c]
;
ldw.0 l0.0, r0.1[0x10]
;
shl.0 r0.10, r0.5, r0.2
;
shru.0 r0.3, r0.5, r0.3
shl.0 r0.8, r0.5, r0.8
;
;
;
slct.0 r0.10, b0.0, r0.10, r0.3
slctf.0 r0.8, b0.0, r0.8, r0.0
;
;
;
stw.0 r0.6[0x0], r0.10
;
stw.0 r0.7[0x0], r0.8
;
.return arg(return) ret()
stw.0 r0.9[0x0], r0.4
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L27?3
stw.0 r0.1[0x1c], r0.5
mov.0 r0.3, r0.2
;
stw.0 r0.1[0x20], r0.4
;
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
stw.0 r0.1[0x24], r0.2
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
add.0 r0.2, r0.3, -0xb
rsub.0 r0.3, 0xc, r0.3
ldw.0 r0.7, r0.1[0x14]
;
ldw.0 r0.4, r0.1[0x20]
;
ldw.0 r0.5, r0.1[0x24]
;
sub.0 r0.6, r0.0, r0.2
cmpeq.0 b0.0, r0.2, r0.0
ldw.0 r0.8, r0.1[0x18]
;
shl.0 r0.9, r0.4, r0.2
ldw.0 r0.10, r0.1[0x1c]
;
shl.0 r0.2, r0.5, r0.2
ldw.0 l0.0, r0.1[0x10]
;
and.0 r0.6, r0.6, 0x1f
;
stw.0 r0.7[0x0], r0.9
;
;
shru.0 r0.4, r0.4, r0.6
;
;
;
or.0 r0.2, r0.2, r0.4
;
;
;
slct.0 r0.5, b0.0, r0.5, r0.2
;
;
;
stw.0 r0.8[0x0], r0.5
;
.return arg(return) ret()
stw.0 r0.10[0x0], r0.3
return.0 r0.1, r0.1, 0x40, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- floatlib_FUNC_packFloat64
shl.0 r0.4, r0.4, 0x14
shl.0 r0.3, r0.3, 0x1f
;
;
;
add.0 r0.5, r0.5, r0.3
;
;
;
add.0 r0.3, r0.5, r0.4
mov.0 r0.4, r0.6
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(entry) ret()
-- floatlib_FUNC_roundAndPackFloat64
add.0 r0.1, r0.1, -0x40
cmplt.0 r0.2, r0.7, r0.0
;
stw.0 r0.1[0x10], l0.0
;
ldw.0 r0.8, r0.0[(floatlib_?1PACKET.2+0)]
;
stw.0 r0.1[0x30], r0.3
;
stw.0 r0.1[0x34], r0.4
;
stw.0 r0.1[0x38], r0.5
cmpeq.0 r0.3, r0.8, r0.0
cmpeq.0 b0.0, r0.8, 0x3
;
stw.0 r0.1[0x3c], r0.6
;
stw.0 r0.1[0x40], r0.7
;
cmpeq.0 b0.1, r0.3, r0.0
;
;
;
brf.0 b0.1, floatlib_L28?3
;
mov.0 r0.2, r0.0
brf.0 b0.0, floatlib_L29?3
;
-- floatlib_L28?3
ldw.0 r0.7, r0.1[0x34]
cmpne.0 b0.0, r0.2, r0.0
;
ldw_d.0 r0.9, r0.1[0x40]
;
ldw_d.0 r0.10, r0.0[(floatlib_?1PACKET.3+0)]
;
zxth.0 r0.11, r0.7
ldw_d.0 r0.12, r0.1[0x40]
;
cmpne.0 b0.1, r0.9, r0.0
ldw_d.0 r0.13, r0.1[0x3c]
;
or.0 r0.10, r0.10, 0x1
ldw_d.0 r0.14, r0.1[0x38]
;
cmpge.0 b0.2, r0.11, 0x7fd
add.0 r0.15, r0.12, r0.12
;
add.0 r0.9, r0.13, 0x1
ldw_d.0 r0.16, r0.1[0x30]
;
ldw_d.0 r0.4, r0.1[0x34]
;
cmpeq.0 r0.15, r0.15, r0.0
br.0 b0.2, floatlib_L30?3
;
-- floatlib_L31?3
cmpltu.0 r0.13, r0.9, r0.13
brf.0 b0.1, floatlib_L32?3
;
stw.0 r0.0[(floatlib_?1PACKET.3+0)], r0.10
brf.0 b0.0, floatlib_L33?3
;
-- floatlib_L34?3
and.0 r0.3, r0.3, r0.15
;
add.0 r0.14, r0.14, r0.13
;
;
orc.0 r0.3, r0.3, r0.0
;
stw.0 r0.1[0x38], r0.14
;
ldw.0 r0.5, r0.1[0x38]
;
and.0 r0.9, r0.9, r0.3
;
;
;
stw.0 r0.1[0x3c], r0.9
mov.0 r0.3, r0.16
;
-- floatlib_L35?3
ldw.0 r0.6, r0.1[0x3c]
;
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L33?3
ldw.0 r0.2, r0.1[0x3c]
mov.0 r0.3, r0.16
;
-- floatlib_L36?3
ldw.0 r0.6, r0.1[0x38]
;
ldw_d.0 r0.5, r0.1[0x38]
;
;
or.0 r0.2, r0.2, r0.6
;
;
;
cmpeq.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L37?3
;
stw.0 r0.1[0x34], r0.0
;
ldw.0 r0.4, r0.1[0x34]
;
;
goto.0 floatlib_L35?3
;
-- floatlib_L37?3
ldw.0 r0.5, r0.1[0x38]
;
;
goto.0 floatlib_L35?3
;
-- floatlib_L32?3
ldw_d.0 r0.2, r0.1[0x3c]
brf.0 b0.0, floatlib_L38?3
;
;
;
mov.0 r0.13, r0.2
;
cmpltu.0 r0.13, r0.9, r0.13
;
goto.0 floatlib_L34?3
;
-- floatlib_L38?3
mov.0 r0.3, r0.16
;
;
ldw.0 r0.2, r0.1[0x3c]
goto.0 floatlib_L36?3
;
-- floatlib_L30?3
cmpeq.0 r0.5, r0.7, 0x7fd
stw.0 r0.1[0x14], r0.8
mov.0 r0.6, r0.3
;
cmpgt.0 r0.7, r0.7, 0x7fd
ldw.0 r0.11, r0.1[0x38]
;
ldw.0 r0.15, r0.1[0x3c]
mov.0 r0.3, 0x5
;
andl.0 r0.5, r0.5, r0.2
;
cmpeq.0 r0.11, r0.11, 0x1fffff
;
cmpeq.0 r0.15, r0.15, ~0x0
;
;
;
andl.0 r0.11, r0.11, r0.15
;
;
;
andl.0 r0.5, r0.5, r0.11
;
;
;
orl.0 b0.2, r0.7, r0.5
;
;
;
brf.0 b0.2, floatlib_L39?3
;
.call float_raise arg(r0.3) ret()
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw.0 r0.3, r0.1[0x30]
mov.0 r0.6, ~0x0
;
mov.0 r0.4, 0x7fe
ldw.0 r0.8, r0.1[0x14]
;
mov.0 r0.5, 0xfffff
;
cmpeq.0 r0.7, r0.3, r0.0
;
cmpeq.0 r0.15, r0.8, 0x3
cmpeq.0 r0.8, r0.8, 0x2
cmpeq.0 r0.11, r0.8, 0x1
;
;
;
andl.0 r0.8, r0.3, r0.8
andl.0 r0.11, r0.11, r0.7
;
;
;
orl.0 r0.15, r0.15, r0.11
;
;
;
orl.0 b0.0, r0.15, r0.8
;
;
;
brf.0 b0.0, floatlib_L40?3
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L40?3
ldw.0 r0.3, r0.1[0x30]
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
;
mov.0 r0.4, 0x7ff
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L39?3
add.0 r0.5, r0.1, 0x38
cmpeq.0 r0.4, r0.2, r0.0
stw.0 r0.1[0x18], r0.6
;
ldw_d.0 r0.6, r0.0[(floatlib_?1PACKET.1+0)]
add.0 r0.7, r0.1, 0x3c
;
ldw_d.0 r0.11, r0.1[0x38]
add.0 r0.17, r0.1, 0x40
;
ldw_d.0 r0.18, r0.1[0x3c]
mov.0 r0.3, 0x2
;
ldw.0 r0.19, r0.1[0x34]
cmpeq.0 r0.6, r0.6, 0x1
;
cmpltu.0 r0.20, r0.11, 0x1fffff
cmpeq.0 r0.21, r0.11, 0x1fffff
;
cmpltu.0 r0.22, r0.18, ~0x0
ldw_d.0 r0.23, r0.1[0x40]
mov.0 r0.24, r0.18
;
cmplt.0 b0.2, r0.19, r0.0
sub.0 r0.26, r0.0, r0.19
cmplt.0 r0.25, r0.19, -0x1
orl.0 r0.6, r0.6, r0.4
;
mov.0 r0.27, r0.11
;
andl.0 r0.21, r0.21, r0.22
mov.0 r0.28, r0.23
;
sub.0 r0.4, r0.0, r0.26
orl.0 r0.6, r0.6, r0.20
cmpeq.0 b0.2, r0.26, r0.0
brf.0 b0.2, floatlib_L41?3
;
;
orl.0 r0.25, r0.25, r0.21
;
and.0 r0.4, r0.4, 0x1f
;
;
orl.0 r0.6, r0.6, r0.25
;
;
brf.0 b0.2, floatlib_L42?3
;
-- floatlib_L43?3
stw.0 r0.17[0x0], r0.28
;
ldw.0 r0.4, r0.1[0x40]
;
stw.0 r0.7[0x0], r0.24
;
stw.0 r0.5[0x0], r0.27
;
stw.0 r0.1[0x34], r0.0
andl.0 b0.2, r0.6, r0.4
;
;
;
brf.0 b0.2, floatlib_L44?3
;
.call float_raise arg(r0.3) ret()
call.0 l0.0, floatlib_FUNC_float_raise
;
-- floatlib_L44?3
ldw_d.0 r0.4, r0.1[0x30]
;
ldw_d.0 r0.5, r0.1[0x40]
;
ldw.0 r0.8, r0.1[0x14]
;
cmpne.0 b0.2, r0.4, r0.0
ldw.0 r0.3, r0.1[0x18]
;
cmplt.0 r0.6, r0.5, r0.0
ldw.0 r0.7, r0.1[0x40]
;
cmpeq.0 r0.11, r0.8, 0x1
cmpeq.0 r0.17, r0.8, 0x2
ldw_d.0 r0.18, r0.0[(floatlib_?1PACKET.3+0)]
;
cmpne.0 b0.3, r0.3, r0.0
ldw_d.0 r0.13, r0.1[0x3c]
;
cmpne.0 b0.1, r0.7, r0.0
ldw_d.0 r0.12, r0.1[0x40]
;
andl.0 r0.11, r0.5, r0.11
andl.0 r0.17, r0.5, r0.17
or.0 r0.10, r0.18, 0x1
;
ldw_d.0 r0.14, r0.1[0x38]
add.0 r0.9, r0.13, 0x1
;
add.0 r0.15, r0.12, r0.12
ldw_d.0 r0.16, r0.1[0x30]
;
slct.0 r0.11, b0.2, r0.11, r0.17
;
;
;
slct.0 r0.2, b0.3, r0.6, r0.11
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
ldw_d.0 r0.4, r0.1[0x34]
;
cmpeq.0 r0.15, r0.15, r0.0
goto.0 floatlib_L31?3
;
-- floatlib_L42?3
cmplt.0 b0.0, r0.26, 0x20
shl.0 r0.9, r0.18, r0.4
shru.0 r0.10, r0.18, r0.26
cmpne.0 r0.2, r0.23, r0.0
;
shl.0 r0.12, r0.11, r0.4
shru.0 r0.27, r0.11, r0.26
mov.0 r0.3, 0x2
;
;
or.0 r0.28, r0.2, r0.9
brf.0 b0.0, floatlib_L45?3
;
or.0 r0.24, r0.10, r0.12
;
;
goto.0 floatlib_L43?3
;
-- floatlib_L45?3
cmpge.0 b0.1, r0.26, 0x40
cmpne.0 r0.2, r0.11, r0.0
cmpeq.0 b0.0, r0.26, 0x40
shl.0 r0.4, r0.11, r0.4
;
cmpeq.0 b0.2, r0.26, 0x20
or.0 r0.8, r0.18, r0.23
and.0 r0.26, r0.26, 0x1f
mov.0 r0.27, r0.0
;
mov.0 r0.3, 0x2
;
slct.0 r0.2, b0.0, r0.11, r0.2
;
shru.0 r0.26, r0.11, r0.26
slct.0 r0.23, b0.2, r0.23, r0.8
;
;
slct.0 r0.2, b0.1, r0.2, r0.4
;
slctf.0 r0.26, b0.1, r0.26, r0.0
cmpne.0 r0.23, r0.23, r0.0
;
;
slct.0 r0.9, b0.2, r0.18, r0.2
;
slct.0 r0.24, b0.2, r0.11, r0.26
;
;
or.0 r0.28, r0.23, r0.9
;
;
goto.0 floatlib_L43?3
;
-- floatlib_L41?3
add.0 r0.15, r0.12, r0.12
ldw.0 r0.3, r0.1[0x18]
;
;
ldw_d.0 r0.4, r0.1[0x34]
;
cmpeq.0 r0.15, r0.15, r0.0
goto.0 floatlib_L31?3
;
-- floatlib_L29?3
ldw.0 r0.4, r0.1[0x30]
cmpeq.0 r0.5, r0.8, 0x1
cmpeq.0 r0.6, r0.8, 0x2
;
ldw_d.0 r0.7, r0.1[0x40]
;
;
cmpne.0 b0.0, r0.4, r0.0
;
andl.0 r0.5, r0.5, r0.7
andl.0 r0.7, r0.7, r0.6
;
;
;
slct.0 r0.2, b0.0, r0.5, r0.7
;
;
goto.0 floatlib_L28?3
;
.entry arg(entry) ret()
-- floatlib_FUNC_normalizeRoundAndPackFloat64
add.0 r0.1, r0.1, -0x40
cmpeq.0 b0.0, r0.5, r0.0
add.0 r0.2, r0.4, -0x20
;
stw.0 r0.1[0x14], l0.0
;
stw.0 r0.1[0x30], r0.3
;
stw.0 r0.1[0x34], r0.4
;
stw.0 r0.1[0x38], r0.5
;
stw.0 r0.1[0x3c], r0.6
brf.0 b0.0, floatlib_L46?3
;
stw.0 r0.1[0x38], r0.6
;
ldw.0 r0.3, r0.1[0x38]
;
stw.0 r0.1[0x3c], r0.0
;
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
stw.0 r0.1[0x34], r0.2
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
-- floatlib_L47?3
add.0 r0.3, r0.3, -0xb
ldw_d.0 r0.2, r0.1[0x38]
;
ldw_d.0 r0.8, r0.1[0x3c]
;
ldw_d.0 r0.9, r0.1[0x34]
;
cmpge.0 b0.0, r0.3, r0.0
sub.0 r0.11, r0.0, r0.3
shl.0 r0.10, r0.2, r0.3
cmpeq.0 b0.1, r0.3, r0.0
;
shl.0 r0.12, r0.8, r0.3
ldw_d.0 r0.13, r0.1[0x30]
;
sub.0 r0.4, r0.9, r0.3
;
and.0 r0.11, r0.11, 0x1f
brf.0 b0.0, floatlib_L48?3
;
stw.0 r0.1[0x10], r0.0
;
stw.0 r0.1[0x3c], r0.12
mov.0 r0.3, r0.13
;
shru.0 r0.8, r0.8, r0.11
ldw.0 r0.6, r0.1[0x3c]
;
stw.0 r0.1[0x34], r0.4
;
;
or.0 r0.10, r0.10, r0.8
;
;
;
slct.0 r0.2, b0.1, r0.2, r0.10
;
;
;
stw.0 r0.1[0x38], r0.2
;
-- floatlib_L49?3
ldw.0 r0.5, r0.1[0x38]
;
ldw.0 r0.7, r0.1[0x10]
;
;
.call roundAndPackFloat64 arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_roundAndPackFloat64
;
ldw.0 l0.0, r0.1[0x14]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L48?3
ldw.0 r0.2, r0.1[0x38]
sub.0 r0.3, r0.0, r0.3
;
ldw.0 r0.5, r0.1[0x3c]
;
stw.0 r0.1[0x34], r0.4
;
cmpne.0 r0.7, r0.2, r0.0
sub.0 r0.8, r0.0, r0.3
cmpge.0 b0.1, r0.3, 0x40
cmpeq.0 b0.0, r0.3, 0x40
;
shru.0 r0.9, r0.2, r0.3
cmpge.0 b0.3, r0.3, 0x20
cmpeq.0 b0.2, r0.3, 0x20
cmpne.0 b0.4, r0.3, r0.0
;
shru.0 r0.11, r0.5, r0.3
and.0 r0.10, r0.3, 0x1f
cmpeq.0 b0.6, r0.3, r0.0
cmpeq.0 b0.5, r0.3, r0.0
;
and.0 r0.8, r0.8, 0x1f
slct.0 r0.7, b0.0, r0.2, r0.7
;
slctf.0 r0.12, b0.2, r0.5, r0.0
slctf.0 r0.9, b0.3, r0.9, r0.0
;
shru.0 r0.10, r0.2, r0.10
;
shl.0 r0.8, r0.5, r0.8
shl.0 r0.13, r0.2, r0.8
;
slct.0 r0.12, b0.3, r0.12, r0.0
slct.0 r0.9, b0.5, r0.2, r0.9
;
slctf.0 r0.10, b0.1, r0.10, r0.0
;
or.0 r0.11, r0.11, r0.13
slct.0 r0.7, b0.1, r0.7, r0.13
;
cmpne.0 r0.12, r0.12, r0.0
;
slct.0 r0.2, b0.2, r0.2, r0.10
;
slct.0 r0.7, b0.2, r0.5, r0.7
;
;
slct.0 r0.2, b0.3, r0.2, r0.11
;
slct.0 r0.7, b0.3, r0.7, r0.8
;
;
slct.0 r0.5, b0.6, r0.5, r0.2
;
or.0 r0.7, r0.7, r0.12
;
;
stw.0 r0.1[0x3c], r0.5
;
slct.0 r0.7, b0.4, r0.7, r0.0
ldw.0 r0.6, r0.1[0x3c]
;
;
;
stw.0 r0.1[0x10], r0.7
;
ldw.0 r0.3, r0.1[0x30]
;
stw.0 r0.1[0x38], r0.9
;
goto.0 floatlib_L49?3
;
-- floatlib_L46?3
ldw.0 r0.3, r0.1[0x38]
;
;
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
goto.0 floatlib_L47?3
;
.entry arg(r0.3) ret()
-- FUNC__r_ilfloat
add.0 r0.1, r0.1, -0x20
cmpeq.0 r0.2, r0.3, r0.0
cmpeq.0 b0.0, r0.3, r0.0
;
cmpeq.0 r0.4, r0.3, ~0x7fffffff
stw.0 r0.1[0x10], l0.0
;
;
slct.0 r0.5, b0.0, r0.0, ~0x30ffffff
;
orl.0 b0.0, r0.2, r0.4
;
;
mov.0 r0.3, r0.5
mov.0 r0.2, r0.3
;
brf.0 b0.0, floatlib_L50?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L50?3
sub.0 r0.6, r0.0, r0.2
cmplt.0 r0.3, r0.2, r0.0
cmplt.0 b0.0, r0.2, r0.0
mov.0 r0.4, 0x9c
;
;
;
slct.0 r0.5, b0.0, r0.6, r0.2
;
;
.call normalizeRoundAndPackFloat32 arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_normalizeRoundAndPackFloat32
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3) ret()
-- FUNC__r_ufloat
add.0 r0.1, r0.1, -0x20
cmpeq.0 b0.0, r0.3, r0.0
mov.0 r0.2, r0.3
;
mov.0 r0.3, r0.0
stw.0 r0.1[0x10], l0.0
;
;
brf.0 b0.0, floatlib_L51?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L51?3
.call normalizeRoundAndPackFloat32 arg(r0.3,r0.4,r0.5) ret(r0.3)
mov.0 r0.5, r0.2
mov.0 r0.4, 0x9c
mov.0 r0.3, r0.0
call.0 l0.0, floatlib_FUNC_normalizeRoundAndPackFloat32
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3) ret()
-- FUNC__d_ilfloat
add.0 r0.1, r0.1, -0x40
cmpeq.0 b0.0, r0.3, r0.0
mov.0 r0.5, r0.0
;
mov.0 r0.6, r0.0
mov.0 r0.4, r0.0
stw.0 r0.1[0x18], l0.0
mov.0 r0.2, r0.3
;
mov.0 r0.3, r0.0
;
brf.0 b0.0, floatlib_L52?3
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L52?3
sub.0 r0.6, r0.0, r0.2
cmplt.0 r0.5, r0.2, r0.0
;
;
;
stw.0 r0.1[0x1c], r0.5
mtb.0 b0.0, r0.5
;
;
;
slct.0 r0.5, b0.0, r0.6, r0.2
;
;
;
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
stw.0 r0.1[0x20], r0.5
mov.0 r0.3, r0.5
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
add.0 r0.2, r0.3, -0xb
rsub.0 r0.4, 0x41d, r0.3
mov.0 r0.7, r0.3
;
;
ldw.0 r0.8, r0.1[0x20]
;
cmpge.0 b0.0, r0.2, r0.0
ldw.0 r0.3, r0.1[0x1c]
;
;
shl.0 r0.8, r0.8, r0.2
;
brf.0 b0.0, floatlib_L53?3
;
stw.0 r0.1[0x10], r0.0
;
ldw.0 r0.6, r0.1[0x10]
;
stw.0 r0.1[0x14], r0.8
;
-- floatlib_L54?3
ldw.0 r0.5, r0.1[0x14]
;
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L53?3
sub.0 r0.2, r0.0, r0.2
ldw.0 r0.5, r0.1[0x20]
;
;
;
zxth.0 r0.7, r0.2
sub.0 r0.6, r0.0, r0.2
and.0 r0.2, r0.2, 0x1f
;
;
;
and.0 r0.6, r0.6, 0x1f
shru.0 r0.2, r0.5, r0.2
shru.0 r0.8, r0.0, r0.7
cmplt.0 b0.0, r0.7, 0x40
;
shru.0 r0.9, r0.5, r0.7
cmpge.0 b0.1, r0.7, 0x20
cmpeq.0 b0.3, r0.7, r0.0
cmpne.0 b0.2, r0.7, r0.0
;
;
shl.0 r0.6, r0.5, r0.6
slct.0 r0.2, b0.0, r0.2, r0.0
;
slctf.0 r0.9, b0.1, r0.9, r0.0
;
;
or.0 r0.6, r0.6, r0.8
;
slct.0 r0.5, b0.3, r0.5, r0.9
;
;
slct.0 r0.2, b0.1, r0.2, r0.6
;
stw.0 r0.1[0x14], r0.5
;
;
slct.0 r0.2, b0.2, r0.2, r0.0
;
;
;
stw.0 r0.1[0x10], r0.2
;
ldw.0 r0.6, r0.1[0x10]
;
goto.0 floatlib_L54?3
;
.entry arg(r0.3) ret()
-- FUNC__d_ufloat
add.0 r0.1, r0.1, -0x20
cmpeq.0 b0.0, r0.3, r0.0
mov.0 r0.5, r0.0
;
mov.0 r0.6, r0.0
mov.0 r0.4, r0.0
stw.0 r0.1[0x18], l0.0
mov.0 r0.2, r0.3
;
mov.0 r0.3, r0.0
;
brf.0 b0.0, floatlib_L55?3
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L55?3
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
mov.0 r0.3, r0.2
stw.0 r0.1[0x1c], r0.2
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
add.0 r0.2, r0.3, -0xb
rsub.0 r0.4, 0x41d, r0.3
mov.0 r0.7, r0.3
;
;
ldw.0 r0.8, r0.1[0x1c]
;
cmpge.0 b0.0, r0.2, r0.0
mov.0 r0.3, r0.0
;
;
shl.0 r0.8, r0.8, r0.2
;
brf.0 b0.0, floatlib_L56?3
;
stw.0 r0.1[0x10], r0.0
;
ldw.0 r0.6, r0.1[0x10]
;
stw.0 r0.1[0x14], r0.8
;
-- floatlib_L57?3
ldw.0 r0.5, r0.1[0x14]
;
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L56?3
sub.0 r0.2, r0.0, r0.2
mov.0 r0.3, r0.0
ldw.0 r0.5, r0.1[0x1c]
;
;
;
zxth.0 r0.7, r0.2
sub.0 r0.6, r0.0, r0.2
and.0 r0.2, r0.2, 0x1f
;
;
;
and.0 r0.6, r0.6, 0x1f
shru.0 r0.2, r0.5, r0.2
shru.0 r0.8, r0.0, r0.7
cmplt.0 b0.0, r0.7, 0x40
;
shru.0 r0.9, r0.5, r0.7
cmpge.0 b0.1, r0.7, 0x20
cmpeq.0 b0.3, r0.7, r0.0
cmpne.0 b0.2, r0.7, r0.0
;
;
shl.0 r0.6, r0.5, r0.6
slct.0 r0.2, b0.0, r0.2, r0.0
;
slctf.0 r0.9, b0.1, r0.9, r0.0
;
;
or.0 r0.6, r0.6, r0.8
;
slct.0 r0.5, b0.3, r0.5, r0.9
;
;
slct.0 r0.2, b0.1, r0.2, r0.6
;
stw.0 r0.1[0x14], r0.5
;
;
slct.0 r0.2, b0.2, r0.2, r0.0
;
;
;
stw.0 r0.1[0x10], r0.2
;
ldw.0 r0.6, r0.1[0x10]
;
goto.0 floatlib_L57?3
;
.entry arg(r0.3,r0.4) ret()
-- floatlib_FUNC_float32_to_int32_round_to_zero
add.0 r0.1, r0.1, -0x40
and.0 r0.2, r0.3, 0x7fffff
;
shru.0 r0.6, r0.3, 0x17
shru.0 r0.5, r0.3, 0x1f
stw.0 r0.1[0x10], l0.0
mov.0 r0.7, r0.3
;
ldw_d.0 r0.8, r0.0[(floatlib_?1PACKET.3+0)]
;
;
and.0 r0.6, r0.6, 0xff
mov.0 r0.3, r0.0
;
or.0 r0.8, r0.8, 0x1
;
;
add.0 r0.9, r0.6, -0x9e
cmple.0 b0.0, r0.6, 0x7e
or.0 r0.10, r0.2, r0.6
;
;
;
cmpge.0 b0.1, r0.9, r0.0
cmpne.0 b0.2, r0.10, r0.0
;
;
;
br.0 b0.1, floatlib_L58?3
;
brf.0 b0.0, floatlib_L59?3
;
brf.0 b0.2, floatlib_L60?3
;
.return arg(return) ret(r0.3)
stw.0 r0.0[(floatlib_?1PACKET.3+0)], r0.8
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L60?3
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.0
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L59?3
or.0 r0.2, r0.2, 0x800000
sub.0 r0.4, r0.0, r0.9
and.0 r0.6, r0.9, 0x1f
;
ldw_d.0 r0.7, r0.0[(floatlib_?1PACKET.3+0)]
mtb.0 b0.0, r0.5
;
;
shl.0 r0.2, r0.2, 0x8
;
or.0 r0.7, r0.7, 0x1
;
;
shru.0 r0.4, r0.2, r0.4
shl.0 r0.6, r0.2, r0.6
;
;
;
cmpne.0 b0.1, r0.6, r0.0
sub.0 r0.2, r0.0, r0.4
;
;
;
slct.0 r0.3, b0.0, r0.2, r0.4
brf.0 b0.1, floatlib_L61?3
;
stw.0 r0.0[(floatlib_?1PACKET.3+0)], r0.7
;
-- floatlib_L62?3
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L61?3
mtb.0 b0.0, r0.5
;
;
;
slct.0 r0.3, b0.0, r0.2, r0.4
;
goto.0 floatlib_L62?3
;
-- floatlib_L58?3
cmpeq.0 b0.0, r0.7, ~0x30ffffff
cmpeq.0 b0.1, r0.4, r0.0
;
;
;
slct.0 r0.3, b0.1, r0.0, ~0x7fffffff
brf.0 b0.0, floatlib_L63?3
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L63?3
stw.0 r0.1[0x14], r0.4
;
stw.0 r0.1[0x18], r0.5
;
stw.0 r0.1[0x1c], r0.2
mov.0 r0.3, 0x10
;
.call float_raise arg(r0.3) ret()
stw.0 r0.1[0x20], r0.6
call.0 l0.0, floatlib_FUNC_float_raise
;
mov.0 r0.2, 0x7fffffff
ldw.0 r0.5, r0.1[0x18]
;
ldw.0 r0.6, r0.1[0x1c]
;
ldw.0 r0.7, r0.1[0x20]
;
cmpeq.0 r0.5, r0.5, r0.0
ldw.0 r0.4, r0.1[0x14]
;
ldw.0 l0.0, r0.1[0x10]
;
cmpeq.0 r0.7, r0.7, 0xff
;
cmpne.0 b0.0, r0.4, r0.0
;
;
andl.0 r0.7, r0.7, r0.6
;
slct.0 r0.3, b0.0, r0.2, ~0x0
;
;
orl.0 b0.0, r0.5, r0.7
;
;
;
brf.0 b0.0, floatlib_L64?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L64?3
ldw.0 r0.4, r0.1[0x14]
;
;
;
cmpeq.0 b0.0, r0.4, r0.0
;
;
;
slct.0 r0.3, b0.0, r0.0, ~0x7fffffff
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
.entry arg(r0.3) ret()
-- FUNC__d_r
add.0 r0.1, r0.1, -0x40
and.0 r0.2, r0.3, 0x7fffff
;
shru.0 r0.8, r0.3, 0x17
shru.0 r0.7, r0.3, 0x1f
stw.0 r0.1[0x18], l0.0
;
;
shru.0 r0.5, r0.2, 0x3
shl.0 r0.6, r0.2, 0x1d
;
and.0 r0.8, r0.8, 0xff
mov.0 r0.9, r0.3
;
mov.0 r0.3, r0.7
;
;
cmpeq.0 b0.0, r0.8, 0xff
cmpeq.0 b0.1, r0.8, r0.0
add.0 r0.4, r0.8, 0x380
;
;
;
br.0 b0.0, floatlib_L65?3
;
br.0 b0.1, floatlib_L66?3
;
-- floatlib_L67?3
stw.0 r0.1[0x14], r0.5
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
stw.0 r0.1[0x10], r0.6
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L66?3
cmpeq.0 b0.0, r0.2, r0.0
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
mov.0 r0.3, r0.7
;
mov.0 r0.4, r0.0
;
;
brf.0 b0.0, floatlib_L68?3
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L68?3
stw.0 r0.1[0x1c], r0.7
mov.0 r0.3, r0.2
;
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
stw.0 r0.1[0x20], r0.2
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
add.0 r0.2, r0.3, -0x8
rsub.0 r0.8, 0x8, r0.3
;
ldw.0 r0.3, r0.1[0x1c]
;
ldw.0 r0.7, r0.1[0x20]
;
add.0 r0.4, r0.8, 0x380
;
;
shl.0 r0.7, r0.7, r0.2
;
;
;
shru.0 r0.5, r0.7, 0x3
shl.0 r0.6, r0.7, 0x1d
;
;
goto.0 floatlib_L67?3
;
-- floatlib_L65?3
cmpne.0 b0.0, r0.2, r0.0
mov.0 r0.3, r0.9
;
;
;
brf.0 b0.0, floatlib_L69?3
;
.call float32ToCommonNaN arg(r0.3) ret(r0.3,r0.4,r0.5)
call.0 l0.0, floatlib_FUNC_float32ToCommonNaN
;
.call commonNaNToFloat64 arg(r0.3,r0.4,r0.5) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_commonNaNToFloat64
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L69?3
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
mov.0 r0.3, r0.7
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
mov.0 r0.4, 0x7ff
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- floatlib_FUNC_addFloat32Sigs
add.0 r0.1, r0.1, -0x20
and.0 r0.2, r0.3, 0x7fffff
;
and.0 r0.6, r0.4, 0x7fffff
shru.0 r0.7, r0.3, 0x17
stw.0 r0.1[0x18], l0.0
;
shru.0 r0.8, r0.4, 0x17
mov.0 r0.9, r0.3
;
shl.0 r0.2, r0.2, 0x6
;
and.0 r0.7, r0.7, 0xff
shl.0 r0.6, r0.6, 0x6
mov.0 r0.3, r0.5
;
and.0 r0.8, r0.8, 0xff
;
stw.0 r0.1[0x14], r0.2
;
cmpeq.0 b0.0, r0.7, 0xff
mov.0 r0.10, r0.7
ldw_d.0 r0.2, r0.1[0x14]
;
sub.0 r0.11, r0.7, r0.8
stw.0 r0.1[0x10], r0.6
cmpeq.0 b0.1, r0.8, r0.0
add.0 r0.12, r0.10, -0x1
;
ldw_d.0 r0.6, r0.1[0x10]
;
or.0 r0.2, r0.2, 0x20000000
;
cmpgt.0 b0.2, r0.11, r0.0
;
cmpne.0 r0.13, r0.6, r0.0
;
;
brf.0 b0.2, floatlib_L70?3
;
br.0 b0.0, floatlib_L71?3
;
brf.0 b0.1, floatlib_L72?3
;
add.0 r0.11, r0.11, -0x1
stw.0 r0.1[0x14], r0.2
;
;
;
-- floatlib_L73?3
sub.0 r0.7, r0.0, r0.11
shru.0 r0.8, r0.6, r0.11
cmpge.0 b0.0, r0.11, 0x20
cmpeq.0 b0.1, r0.11, r0.0
;
;
;
and.0 r0.7, r0.7, 0x1f
;
;
;
shl.0 r0.7, r0.6, r0.7
;
;
;
cmpne.0 r0.7, r0.7, r0.0
;
;
;
or.0 r0.8, r0.8, r0.7
;
;
;
slct.0 r0.13, b0.0, r0.13, r0.8
;
;
;
slct.0 r0.6, b0.1, r0.6, r0.13
;
;
;
stw.0 r0.1[0x10], r0.6
;
-- floatlib_L74?3
ldw.0 r0.6, r0.1[0x10]
;
;
;
add.0 r0.2, r0.2, r0.6
;
;
;
shl.0 r0.6, r0.2, 0x1
;
;
;
cmpge.0 b0.0, r0.6, r0.0
;
;
;
slct.0 r0.5, b0.0, r0.6, r0.2
slct.0 r0.4, b0.0, r0.12, r0.10
;
;
.call roundAndPackFloat32 arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_roundAndPackFloat32
;
-- floatlib_L75?3
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L72?3
ldw.0 r0.4, r0.1[0x10]
mov.0 r0.3, r0.5
;
stw.0 r0.1[0x14], r0.2
;
;
or.0 r0.4, r0.4, 0x20000000
;
;
;
stw.0 r0.1[0x10], r0.4
;
ldw.0 r0.6, r0.1[0x10]
;
;
;
cmpne.0 r0.13, r0.6, r0.0
;
;
goto.0 floatlib_L73?3
;
-- floatlib_L71?3
ldw.0 r0.2, r0.1[0x14]
mov.0 r0.3, r0.9
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L76?3
;
.call propagateFloat32NaN arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, floatlib_FUNC_propagateFloat32NaN
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L76?3
mov.0 r0.3, r0.9
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L70?3
cmplt.0 b0.0, r0.11, r0.0
cmpeq.0 b0.1, r0.8, 0xff
cmpeq.0 b0.2, r0.7, r0.0
ldw_d.0 r0.6, r0.1[0x14]
;
mov.0 r0.10, r0.8
mov.0 r0.3, r0.5
;
add.0 r0.12, r0.10, -0x1
;
cmpne.0 r0.13, r0.6, r0.0
brf.0 b0.0, floatlib_L77?3
;
br.0 b0.1, floatlib_L78?3
;
brf.0 b0.2, floatlib_L79?3
;
add.0 r0.11, r0.11, 0x1
;
;
;
-- floatlib_L80?3
sub.0 r0.11, r0.0, r0.11
;
;
;
sub.0 r0.9, r0.0, r0.11
shru.0 r0.14, r0.6, r0.11
cmpge.0 b0.0, r0.11, 0x20
cmpeq.0 b0.1, r0.11, r0.0
;
;
;
and.0 r0.9, r0.9, 0x1f
;
;
;
shl.0 r0.9, r0.6, r0.9
;
;
;
cmpne.0 r0.9, r0.9, r0.0
;
;
;
or.0 r0.14, r0.14, r0.9
;
;
;
slct.0 r0.13, b0.0, r0.13, r0.14
;
;
;
slct.0 r0.6, b0.1, r0.6, r0.13
;
;
;
stw.0 r0.1[0x14], r0.6
;
ldw.0 r0.6, r0.1[0x14]
;
;
;
or.0 r0.2, r0.6, 0x20000000
;
;
;
stw.0 r0.1[0x14], r0.2
goto.0 floatlib_L74?3
;
-- floatlib_L79?3
ldw.0 r0.2, r0.1[0x14]
;
;
;
or.0 r0.2, r0.2, 0x20000000
;
;
;
stw.0 r0.1[0x14], r0.2
;
ldw.0 r0.6, r0.1[0x14]
;
;
;
cmpne.0 r0.13, r0.6, r0.0
;
;
goto.0 floatlib_L80?3
;
-- floatlib_L78?3
ldw.0 r0.2, r0.1[0x10]
mov.0 r0.3, r0.9
mov.0 r0.5, r0.3
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L81?3
;
.call propagateFloat32NaN arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, floatlib_FUNC_propagateFloat32NaN
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L81?3
shl.0 r0.5, r0.5, 0x1f
ldw.0 l0.0, r0.1[0x18]
;
;
;
add.0 r0.3, r0.5, 0x7f800000
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L77?3
cmpeq.0 b0.0, r0.7, 0xff
cmpeq.0 b0.1, r0.7, r0.0
ldw_d.0 r0.2, r0.1[0x10]
shl.0 r0.6, r0.3, 0x1f
;
ldw_d.0 r0.8, r0.1[0x14]
;
ldw.0 l0.0, r0.1[0x18]
;
br.0 b0.0, floatlib_L82?3
;
add.0 r0.2, r0.2, r0.8
brf.0 b0.1, floatlib_L83?3
;
;
;
shru.0 r0.2, r0.2, 0x6
;
;
;
add.0 r0.3, r0.2, r0.6
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L83?3
ldw.0 r0.6, r0.1[0x10]
mov.0 r0.4, r0.7
;
ldw.0 r0.7, r0.1[0x14]
;
;
add.0 r0.6, r0.6, 0x40000000
;
;
;
add.0 r0.5, r0.6, r0.7
;
;
.call roundAndPackFloat32 arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_roundAndPackFloat32
;
goto.0 floatlib_L75?3
;
-- floatlib_L82?3
ldw.0 r0.2, r0.1[0x10]
mov.0 r0.3, r0.9
;
ldw.0 r0.5, r0.1[0x14]
;
;
;
or.0 r0.2, r0.2, r0.5
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L84?3
;
.call propagateFloat32NaN arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, floatlib_FUNC_propagateFloat32NaN
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L84?3
mov.0 r0.3, r0.9
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- floatlib_FUNC_subFloat32Sigs
add.0 r0.1, r0.1, -0x20
and.0 r0.2, r0.3, 0x7fffff
;
and.0 r0.6, r0.4, 0x7fffff
shru.0 r0.7, r0.3, 0x17
stw.0 r0.1[0x18], l0.0
;
shru.0 r0.8, r0.4, 0x17
mov.0 r0.9, r0.3
;
shl.0 r0.2, r0.2, 0x7
;
and.0 r0.7, r0.7, 0xff
shl.0 r0.6, r0.6, 0x7
mov.0 r0.3, r0.5
;
and.0 r0.8, r0.8, 0xff
;
stw.0 r0.1[0x14], r0.2
;
cmpeq.0 b0.0, r0.7, 0xff
ldw_d.0 r0.2, r0.1[0x14]
mov.0 r0.10, r0.7
;
sub.0 r0.11, r0.7, r0.8
stw.0 r0.1[0x10], r0.6
cmpeq.0 b0.1, r0.8, r0.0
add.0 r0.10, r0.10, -0x1
;
ldw_d.0 r0.6, r0.1[0x10]
;
or.0 r0.2, r0.2, 0x40000000
;
cmpgt.0 b0.2, r0.11, r0.0
mov.0 r0.12, r0.4
;
cmpne.0 r0.13, r0.6, r0.0
mov.0 r0.4, r0.10
;
;
brf.0 b0.2, floatlib_L85?3
;
br.0 b0.0, floatlib_L86?3
;
brf.0 b0.1, floatlib_L87?3
;
add.0 r0.11, r0.11, -0x1
stw.0 r0.1[0x14], r0.2
;
ldw.0 r0.2, r0.1[0x14]
;
;
-- floatlib_L88?3
sub.0 r0.7, r0.0, r0.11
shru.0 r0.8, r0.6, r0.11
cmpge.0 b0.0, r0.11, 0x20
cmpeq.0 b0.1, r0.11, r0.0
;
;
;
and.0 r0.7, r0.7, 0x1f
;
;
;
shl.0 r0.7, r0.6, r0.7
;
;
;
cmpne.0 r0.7, r0.7, r0.0
;
;
;
or.0 r0.8, r0.8, r0.7
;
;
;
slct.0 r0.13, b0.0, r0.13, r0.8
;
;
;
slct.0 r0.6, b0.1, r0.6, r0.13
;
;
;
stw.0 r0.1[0x10], r0.6
;
-- floatlib_L89?3
ldw.0 r0.6, r0.1[0x10]
;
;
;
sub.0 r0.5, r0.2, r0.6
;
;
.call normalizeRoundAndPackFloat32 arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_normalizeRoundAndPackFloat32
;
-- floatlib_L90?3
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L87?3
ldw.0 r0.7, r0.1[0x10]
mov.0 r0.3, r0.5
;
stw.0 r0.1[0x14], r0.2
;
;
or.0 r0.7, r0.7, 0x40000000
;
;
;
stw.0 r0.1[0x10], r0.7
;
ldw.0 r0.6, r0.1[0x10]
;
;
;
cmpne.0 r0.13, r0.6, r0.0
;
ldw.0 r0.2, r0.1[0x14]
;
goto.0 floatlib_L88?3
;
-- floatlib_L86?3
ldw.0 r0.2, r0.1[0x14]
mov.0 r0.4, r0.12
mov.0 r0.3, r0.9
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L91?3
;
.call propagateFloat32NaN arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, floatlib_FUNC_propagateFloat32NaN
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L91?3
mov.0 r0.3, r0.9
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L85?3
cmplt.0 b0.0, r0.11, r0.0
cmpeq.0 b0.1, r0.8, 0xff
cmpeq.0 b0.2, r0.7, r0.0
ldw_d.0 r0.2, r0.1[0x14]
;
ldw_d.0 r0.6, r0.1[0x10]
mov.0 r0.10, r0.8
;
add.0 r0.4, r0.10, -0x1
;
cmpne.0 r0.13, r0.2, r0.0
brf.0 b0.0, floatlib_L92?3
;
or.0 r0.6, r0.6, 0x40000000
br.0 b0.1, floatlib_L93?3
;
brf.0 b0.2, floatlib_L94?3
;
add.0 r0.11, r0.11, 0x1
xor.0 r0.3, r0.5, 0x1
;
stw.0 r0.1[0x10], r0.6
;
ldw.0 r0.6, r0.1[0x10]
;
-- floatlib_L95?3
sub.0 r0.11, r0.0, r0.11
;
;
;
sub.0 r0.9, r0.0, r0.11
shru.0 r0.10, r0.2, r0.11
cmpge.0 b0.0, r0.11, 0x20
cmpeq.0 b0.1, r0.11, r0.0
;
;
;
and.0 r0.9, r0.9, 0x1f
;
;
;
shl.0 r0.9, r0.2, r0.9
;
;
;
cmpne.0 r0.9, r0.9, r0.0
;
;
;
or.0 r0.10, r0.10, r0.9
;
;
;
slct.0 r0.13, b0.0, r0.13, r0.10
;
;
;
slct.0 r0.2, b0.1, r0.2, r0.13
;
;
;
stw.0 r0.1[0x14], r0.2
;
-- floatlib_L96?3
ldw.0 r0.2, r0.1[0x14]
;
;
;
sub.0 r0.5, r0.6, r0.2
;
;
.call normalizeRoundAndPackFloat32 arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_normalizeRoundAndPackFloat32
;
goto.0 floatlib_L90?3
;
-- floatlib_L94?3
ldw.0 r0.7, r0.1[0x14]
xor.0 r0.5, r0.5, 0x1
;
stw.0 r0.1[0x10], r0.6
;
;
or.0 r0.7, r0.7, 0x40000000
mov.0 r0.3, r0.5
;
;
;
stw.0 r0.1[0x14], r0.7
;
ldw.0 r0.2, r0.1[0x14]
;
;
;
cmpne.0 r0.13, r0.2, r0.0
;
;
ldw.0 r0.6, r0.1[0x10]
goto.0 floatlib_L95?3
;
-- floatlib_L93?3
ldw.0 r0.2, r0.1[0x10]
mov.0 r0.4, r0.12
mov.0 r0.3, r0.9
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L97?3
;
.call propagateFloat32NaN arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, floatlib_FUNC_propagateFloat32NaN
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L97?3
xor.0 r0.5, r0.5, 0x1
ldw.0 l0.0, r0.1[0x18]
;
;
;
shl.0 r0.5, r0.5, 0x1f
;
;
;
add.0 r0.3, r0.5, 0x7f800000
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L92?3
cmpeq.0 b0.0, r0.7, 0xff
cmpne.0 b0.1, r0.7, r0.0
cmpne.0 b0.2, r0.7, r0.0
ldw_d.0 r0.6, r0.1[0x10]
;
ldw_d.0 r0.10, r0.1[0x14]
mov.0 r0.3, r0.5
;
ldw_d.0 r0.2, r0.1[0x14]
;
slct.0 r0.8, b0.1, r0.8, 0x1
slct.0 r0.7, b0.2, r0.7, 0x1
br.0 b0.0, floatlib_L98?3
;
cmpltu.0 b0.0, r0.6, r0.10
;
;
;
add.0 r0.4, r0.7, -0x1
brf.0 b0.0, floatlib_L99?3
;
;
goto.0 floatlib_L89?3
;
-- floatlib_L99?3
cmpltu.0 b0.0, r0.10, r0.6
ldw_d.0 r0.6, r0.1[0x10]
mov.0 r0.10, r0.8
xor.0 r0.3, r0.3, 0x1
;
add.0 r0.10, r0.10, -0x1
;
;
brf.0 b0.0, floatlib_L100?3
;
mov.0 r0.4, r0.10
goto.0 floatlib_L96?3
;
-- floatlib_L100?3
ldw.0 r0.2, r0.0[(floatlib_?1PACKET.2+0)]
;
ldw.0 l0.0, r0.1[0x18]
;
;
cmpeq.0 r0.2, r0.2, 0x1
;
;
;
shl.0 r0.3, r0.2, 0x1f
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L98?3
ldw.0 r0.5, r0.1[0x10]
mov.0 r0.4, r0.12
mov.0 r0.3, r0.9
;
ldw.0 r0.2, r0.1[0x14]
;
;
;
or.0 r0.5, r0.5, r0.2
;
;
;
cmpne.0 b0.0, r0.5, r0.0
;
;
;
brf.0 b0.0, floatlib_L101?3
;
.call propagateFloat32NaN arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, floatlib_FUNC_propagateFloat32NaN
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L101?3
.call float_raise arg(r0.3) ret()
mov.0 r0.3, 0x10
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw.0 l0.0, r0.1[0x18]
mov.0 r0.3, 0x7fffffff
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__r_add
add.0 r0.1, r0.1, -0x20
shru.0 r0.5, r0.3, 0x1f
shru.0 r0.2, r0.4, 0x1f
;
stw.0 r0.1[0x10], l0.0
;
;
cmpeq.0 b0.0, r0.5, r0.2
;
;
;
brf.0 b0.0, floatlib_L102?3
;
.call addFloat32Sigs arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_addFloat32Sigs
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L102?3
.call subFloat32Sigs arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_subFloat32Sigs
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__r_sub
add.0 r0.1, r0.1, -0x20
shru.0 r0.5, r0.3, 0x1f
shru.0 r0.2, r0.4, 0x1f
;
stw.0 r0.1[0x10], l0.0
;
;
cmpeq.0 b0.0, r0.5, r0.2
;
;
;
brf.0 b0.0, floatlib_L103?3
;
.call subFloat32Sigs arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_subFloat32Sigs
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L103?3
.call addFloat32Sigs arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_addFloat32Sigs
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__r_mul
add.0 r0.1, r0.1, -0x40
shru.0 r0.2, r0.4, 0x17
shru.0 r0.6, r0.3, 0x1f
;
and.0 r0.8, r0.3, 0x7fffff
shru.0 r0.7, r0.4, 0x1f
stw.0 r0.1[0x18], l0.0
;
and.0 r0.9, r0.4, 0x7fffff
shru.0 r0.10, r0.3, 0x17
;
and.0 r0.2, r0.2, 0xff
;
xor.0 r0.6, r0.6, r0.7
or.0 r0.11, r0.8, 0x800000
;
and.0 r0.10, r0.10, 0xff
or.0 r0.12, r0.9, 0x800000
;
cmpeq.0 b0.0, r0.2, 0xff
cmpeq.0 b0.1, r0.2, r0.0
;
shl.0 r0.11, r0.11, 0x7
mov.0 r0.7, r0.3
;
cmpeq.0 b0.2, r0.10, 0xff
cmpeq.0 b0.3, r0.10, r0.0
add.0 r0.13, r0.2, r0.10
shl.0 r0.12, r0.12, 0x8
;
mov.0 r0.3, r0.6
;
;
add.0 r0.16, r0.13, -0x7f
mpylhu.0 r0.14, r0.12, r0.11
mpylhu.0 r0.15, r0.11, r0.12
br.0 b0.2, floatlib_L104?3
;
mpyllu.0 r0.17, r0.11, r0.12
mpyhhu.0 r0.18, r0.11, r0.12
add.0 r0.19, r0.13, -0x80
br.0 b0.0, floatlib_L105?3
;
br.0 b0.3, floatlib_L106?3
;
-- floatlib_L107?3
add.0 r0.15, r0.14, r0.15
br.0 b0.1, floatlib_L108?3
;
-- floatlib_L109?3
;
;
shru.0 r0.6, r0.15, 0x10
cmpltu.0 r0.14, r0.15, r0.14
shl.0 r0.2, r0.15, 0x10
;
;
;
shl.0 r0.14, r0.14, 0x10
add.0 r0.17, r0.17, r0.2
add.0 r0.6, r0.6, r0.18
;
;
;
cmpltu.0 r0.2, r0.17, r0.2
stw.0 r0.1[0x14], r0.17
cmpne.0 r0.7, r0.17, r0.0
;
;
;
add.0 r0.14, r0.14, r0.2
;
;
;
add.0 r0.6, r0.6, r0.14
;
;
;
stw.0 r0.1[0x10], r0.6
or.0 r0.7, r0.6, r0.7
;
;
;
shl.0 r0.2, r0.7, 0x1
;
;
;
cmplt.0 b0.0, r0.2, r0.0
;
;
;
slct.0 r0.5, b0.0, r0.7, r0.2
slct.0 r0.4, b0.0, r0.16, r0.19
;
;
.call roundAndPackFloat32 arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_roundAndPackFloat32
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L108?3
cmpeq.0 b0.0, r0.9, r0.0
shl.0 r0.3, r0.6, 0x1f
ldw.0 l0.0, r0.1[0x18]
;
;
;
brf.0 b0.0, floatlib_L110?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L110?3
stw.0 r0.1[0x1c], r0.6
mov.0 r0.3, r0.9
;
stw.0 r0.1[0x28], r0.8
;
stw.0 r0.1[0x2c], r0.10
;
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
stw.0 r0.1[0x20], r0.9
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
add.0 r0.2, r0.3, -0x8
rsub.0 r0.3, 0x9, r0.3
ldw.0 r0.8, r0.1[0x28]
;
ldw.0 r0.10, r0.1[0x2c]
;
ldw.0 r0.9, r0.1[0x20]
;
or.0 r0.11, r0.8, 0x800000
;
add.0 r0.13, r0.3, r0.10
ldw.0 r0.3, r0.1[0x1c]
;
shl.0 r0.9, r0.9, r0.2
;
shl.0 r0.11, r0.11, 0x7
;
add.0 r0.16, r0.13, -0x7f
add.0 r0.19, r0.13, -0x80
;
or.0 r0.12, r0.9, 0x800000
;
;
;
shl.0 r0.12, r0.12, 0x8
;
;
;
mpyllu.0 r0.17, r0.11, r0.12
mpylhu.0 r0.14, r0.12, r0.11
;
mpylhu.0 r0.15, r0.11, r0.12
mpyhhu.0 r0.18, r0.11, r0.12
;
;
;
add.0 r0.15, r0.14, r0.15
goto.0 floatlib_L109?3
;
-- floatlib_L106?3
cmpeq.0 b0.0, r0.8, r0.0
shl.0 r0.3, r0.6, 0x1f
ldw.0 l0.0, r0.1[0x18]
;
;
;
brf.0 b0.0, floatlib_L111?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L111?3
stw.0 r0.1[0x1c], r0.6
mov.0 r0.3, r0.8
;
stw.0 r0.1[0x20], r0.9
;
stw.0 r0.1[0x24], r0.2
;
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
stw.0 r0.1[0x28], r0.8
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
add.0 r0.2, r0.3, -0x8
rsub.0 r0.10, 0x9, r0.3
ldw.0 r0.9, r0.1[0x20]
;
ldw.0 r0.4, r0.1[0x24]
;
ldw.0 r0.8, r0.1[0x28]
;
or.0 r0.5, r0.9, 0x800000
ldw.0 r0.3, r0.1[0x1c]
;
cmpeq.0 b0.1, r0.4, r0.0
add.0 r0.13, r0.4, r0.10
;
shl.0 r0.8, r0.8, r0.2
;
shl.0 r0.12, r0.5, 0x8
mov.0 r0.6, r0.3
;
add.0 r0.16, r0.13, -0x7f
;
or.0 r0.2, r0.8, 0x800000
;
;
;
shl.0 r0.11, r0.2, 0x7
;
;
;
mpylhu.0 r0.14, r0.12, r0.11
mpylhu.0 r0.15, r0.11, r0.12
;
mpyllu.0 r0.17, r0.11, r0.12
mpyhhu.0 r0.18, r0.11, r0.12
add.0 r0.19, r0.13, -0x80
;
goto.0 floatlib_L107?3
;
-- floatlib_L105?3
cmpne.0 b0.0, r0.9, r0.0
mov.0 r0.3, r0.7
;
;
;
brf.0 b0.0, floatlib_L112?3
;
.call propagateFloat32NaN arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, floatlib_FUNC_propagateFloat32NaN
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L112?3
or.0 r0.8, r0.8, r0.10
mov.0 r0.3, 0x10
;
;
;
cmpeq.0 b0.0, r0.8, r0.0
;
;
;
brf.0 b0.0, floatlib_L113?3
;
.call float_raise arg(r0.3) ret()
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw.0 l0.0, r0.1[0x18]
mov.0 r0.3, 0x7fffffff
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L113?3
shl.0 r0.6, r0.6, 0x1f
ldw.0 l0.0, r0.1[0x18]
;
;
;
add.0 r0.3, r0.6, 0x7f800000
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L104?3
cmpeq.0 r0.5, r0.2, 0xff
mov.0 r0.3, r0.7
;
;
;
andl.0 r0.5, r0.5, r0.9
;
;
;
orl.0 b0.0, r0.8, r0.5
;
;
;
brf.0 b0.0, floatlib_L114?3
;
.call propagateFloat32NaN arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, floatlib_FUNC_propagateFloat32NaN
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L114?3
or.0 r0.9, r0.9, r0.2
mov.0 r0.3, 0x10
;
;
;
cmpeq.0 b0.0, r0.9, r0.0
;
;
;
brf.0 b0.0, floatlib_L115?3
;
.call float_raise arg(r0.3) ret()
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw.0 l0.0, r0.1[0x18]
mov.0 r0.3, 0x7fffffff
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L115?3
shl.0 r0.6, r0.6, 0x1f
ldw.0 l0.0, r0.1[0x18]
;
;
;
add.0 r0.3, r0.6, 0x7f800000
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__r_div
add.0 r0.1, r0.1, -0x60
shru.0 r0.2, r0.4, 0x17
shru.0 r0.10, r0.3, 0x1f
;
and.0 r0.12, r0.3, 0x7fffff
shru.0 r0.11, r0.4, 0x1f
stw.0 r0.1[0x20], l0.0
;
and.0 r0.13, r0.4, 0x7fffff
shru.0 r0.14, r0.3, 0x17
mov.0 r0.15, r0.4
;
and.0 r0.2, r0.2, 0xff
;
xor.0 r0.16, r0.10, r0.11
or.0 r0.17, r0.12, 0x800000
;
and.0 r0.14, r0.14, 0xff
or.0 r0.18, r0.13, 0x800000
mov.0 r0.4, r0.0
;
cmpeq.0 b0.0, r0.2, 0xff
cmpeq.0 b0.1, r0.2, r0.0
;
shl.0 r0.17, r0.17, 0x7
stw.0 r0.1[0x24], r0.16
;
cmpeq.0 b0.2, r0.14, 0xff
cmpeq.0 b0.3, r0.14, r0.0
sub.0 r0.11, r0.14, r0.2
shl.0 r0.10, r0.18, 0x8
;
;
add.0 r0.16, r0.17, r0.17
shru.0 r0.19, r0.17, 0x1
;
add.0 r0.18, r0.11, 0x7d
add.0 r0.20, r0.11, 0x7e
stw.0 r0.1[0x28], r0.10
br.0 b0.2, floatlib_L116?3
;
mov.0 r0.5, r0.10
br.0 b0.0, floatlib_L117?3
;
cmpgtu.0 b0.0, r0.10, r0.16
br.0 b0.1, floatlib_L118?3
;
-- floatlib_L119?3
br.0 b0.3, floatlib_L120?3
;
-- floatlib_L121?3
;
slct.0 r0.2, b0.0, r0.17, r0.19
slct.0 r0.14, b0.0, r0.18, r0.20
;
;
;
stw.0 r0.1[0x2c], r0.2
mov.0 r0.3, r0.2
;
.call estimateDiv64To32 arg(r0.3,r0.4,r0.5) ret(r0.3)
stw.0 r0.1[0x30], r0.14
call.0 l0.0, floatlib_FUNC_estimateDiv64To32
;
and.0 r0.10, r0.3, 0x3f
mov.0 r0.7, r0.3
mov.0 r0.8, ~0x0
ldw.0 r0.2, r0.1[0x28]
;
add.0 r0.4, r0.1, 0x14
add.0 r0.5, r0.1, 0x10
add.0 r0.6, r0.3, ~0x0
ldw.0 r0.11, r0.1[0x2c]
;
mov.0 r0.9, r0.0
ldw.0 r0.12, r0.1[0x20]
;
cmpleu.0 b0.0, r0.10, 0x2
mpylhu.0 r0.13, r0.3, r0.2
mpylhu.0 r0.14, r0.2, r0.3
;
mpyllu.0 r0.15, r0.2, r0.3
mpyhhu.0 r0.16, r0.2, r0.3
;
;
add.0 r0.14, r0.13, r0.14
brf.0 b0.0, floatlib_L122?3
;
mov.0 r0.3, r0.2
;
;
shru.0 r0.10, r0.14, 0x10
cmpltu.0 r0.13, r0.14, r0.13
shl.0 r0.2, r0.14, 0x10
;
;
;
shl.0 r0.13, r0.13, 0x10
add.0 r0.15, r0.15, r0.2
add.0 r0.10, r0.10, r0.16
ldw.0 r0.14, r0.1[0x30]
;
;
;
cmpltu.0 r0.2, r0.15, r0.2
stw.0 r0.1[0x1c], r0.15
sub.0 r0.17, r0.0, r0.15
cmpgtu.0 r0.16, r0.15, r0.0
;
;
;
add.0 r0.13, r0.13, r0.2
stw.0 r0.1[0x10], r0.17
;
;
;
add.0 r0.10, r0.10, r0.13
;
;
;
sub.0 r0.11, r0.11, r0.10
ldw.0 r0.13, r0.1[0x24]
;
stw.0 r0.1[0x18], r0.10
;
;
sub.0 r0.11, r0.11, r0.16
;
;
;
stw.0 r0.1[0x14], r0.11
;
-- floatlib_L123?3
ldw_d.0 r0.2, r0.1[0x10]
;
ldw.0 r0.10, r0.1[0x14]
;
;
add.0 r0.11, r0.2, r0.3
;
cmplt.0 b0.0, r0.10, r0.0
;
;
cmpltu.0 r0.2, r0.11, r0.2
;
brf.0 b0.0, floatlib_L124?3
;
stw.0 r0.5[0x0], r0.11
add.0 r0.7, r0.7, -0x2
;
add.0 r0.10, r0.10, r0.2
ldw_d.0 r0.2, r0.1[0x10]
;
;
;
stw.0 r0.4[0x0], r0.10
add.0 r0.11, r0.3, r0.2
;
ldw.0 r0.10, r0.1[0x14]
;
;
cmpltu.0 r0.2, r0.11, r0.2
;
cmplt.0 b0.0, r0.10, r0.0
;
;
add.0 r0.10, r0.10, r0.2
;
brf.0 b0.0, floatlib_L125?3
;
stw.0 r0.5[0x0], r0.11
add.0 r0.9, r0.9, -0x2
;
ldw_d.0 r0.2, r0.1[0x10]
;
stw.0 r0.4[0x0], r0.10
;
ldw.0 r0.10, r0.1[0x14]
;
add.0 r0.11, r0.3, r0.2
;
;
cmplt.0 b0.0, r0.10, r0.0
;
cmpltu.0 r0.2, r0.11, r0.2
;
;
brf.0 b0.0, floatlib_L126?3
;
add.0 r0.10, r0.10, r0.2
stw.0 r0.5[0x0], r0.11
add.0 r0.6, r0.6, ~0x1
;
ldw_d.0 r0.2, r0.1[0x10]
;
;
stw.0 r0.4[0x0], r0.10
;
ldw.0 r0.10, r0.1[0x14]
add.0 r0.11, r0.3, r0.2
;
;
;
cmplt.0 b0.0, r0.10, r0.0
cmpltu.0 r0.2, r0.11, r0.2
;
;
;
add.0 r0.10, r0.10, r0.2
brf.0 b0.0, floatlib_L127?3
;
stw.0 r0.5[0x0], r0.11
add.0 r0.8, r0.8, ~0x1
;
;
stw.0 r0.4[0x0], r0.10
goto.0 floatlib_L123?3
;
-- floatlib_L127?3
mov.0 r0.9, r0.8
stw.0 r0.1[0x24], r0.13
;
goto.0 floatlib_L128?3
;
-- floatlib_L126?3
mov.0 r0.9, r0.8
mov.0 r0.7, r0.6
stw.0 r0.1[0x24], r0.13
goto.0 floatlib_L128?3
;
-- floatlib_L125?3
mov.0 r0.7, r0.6
stw.0 r0.1[0x24], r0.13
goto.0 floatlib_L128?3
;
-- floatlib_L124?3
stw.0 r0.1[0x24], r0.13
;
-- floatlib_L128?3
add.0 r0.7, r0.7, r0.9
stw.0 r0.1[0x30], r0.14
;
stw.0 r0.1[0x20], r0.12
;
ldw.0 r0.2, r0.1[0x10]
;
;
;
cmpne.0 r0.2, r0.2, r0.0
;
;
;
or.0 r0.5, r0.7, r0.2
;
ldw.0 r0.4, r0.1[0x30]
;
ldw.0 r0.3, r0.1[0x24]
goto.0 floatlib_L129?3
;
-- floatlib_L122?3
mov.0 r0.5, r0.7
ldw.0 r0.4, r0.1[0x30]
;
ldw.0 r0.3, r0.1[0x24]
;
-- floatlib_L129?3
;
.call roundAndPackFloat32 arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_roundAndPackFloat32
;
ldw.0 l0.0, r0.1[0x20]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L120?3
cmpeq.0 b0.1, r0.12, r0.0
ldw.0 r0.16, r0.1[0x24]
;
ldw.0 l0.0, r0.1[0x20]
;
;
shl.0 r0.3, r0.16, 0x1f
brf.0 b0.1, floatlib_L130?3
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L130?3
stw.0 r0.1[0x3c], r0.13
;
stw.0 r0.1[0x40], r0.2
;
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
mov.0 r0.3, r0.12
stw.0 r0.1[0x34], r0.12
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
add.0 r0.2, r0.3, -0x8
rsub.0 r0.14, 0x9, r0.3
mov.0 r0.4, r0.0
ldw.0 r0.13, r0.1[0x3c]
;
ldw.0 r0.3, r0.1[0x40]
;
ldw.0 r0.12, r0.1[0x34]
;
or.0 r0.13, r0.13, 0x800000
;
sub.0 r0.11, r0.14, r0.3
;
shl.0 r0.12, r0.12, r0.2
;
shl.0 r0.10, r0.13, 0x8
;
add.0 r0.18, r0.11, 0x7d
add.0 r0.20, r0.11, 0x7e
;
or.0 r0.12, r0.12, 0x800000
;
stw.0 r0.1[0x28], r0.10
mov.0 r0.5, r0.10
;
;
shl.0 r0.17, r0.12, 0x7
;
;
;
add.0 r0.16, r0.17, r0.17
shru.0 r0.19, r0.17, 0x1
;
;
;
cmpgtu.0 b0.0, r0.10, r0.16
;
goto.0 floatlib_L121?3
;
-- floatlib_L118?3
cmpeq.0 b0.1, r0.13, r0.0
or.0 r0.2, r0.12, r0.14
mov.0 r0.3, 0x10
;
;
;
cmpeq.0 b0.0, r0.2, r0.0
brf.0 b0.1, floatlib_L131?3
;
;
;
brf.0 b0.0, floatlib_L132?3
;
.call float_raise arg(r0.3) ret()
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw.0 l0.0, r0.1[0x20]
mov.0 r0.3, 0x7fffffff
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L132?3
.call float_raise arg(r0.3) ret()
mov.0 r0.3, 0x80
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw.0 r0.16, r0.1[0x24]
;
ldw.0 l0.0, r0.1[0x20]
;
;
shl.0 r0.16, r0.16, 0x1f
;
;
;
add.0 r0.3, r0.16, 0x7f800000
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L131?3
stw.0 r0.1[0x34], r0.12
mov.0 r0.3, r0.13
;
stw.0 r0.1[0x38], r0.14
;
.call countLeadingZeros32 arg(r0.3) ret(r0.3)
stw.0 r0.1[0x3c], r0.13
call.0 l0.0, floatlib_FUNC_countLeadingZeros32
;
add.0 r0.6, r0.3, -0x8
rsub.0 r0.2, 0x9, r0.3
mov.0 r0.4, r0.0
ldw.0 r0.12, r0.1[0x34]
;
ldw.0 r0.14, r0.1[0x38]
;
ldw.0 r0.13, r0.1[0x3c]
;
or.0 r0.3, r0.12, 0x800000
;
cmpeq.0 b0.3, r0.14, r0.0
sub.0 r0.11, r0.14, r0.2
;
shl.0 r0.13, r0.13, r0.6
;
shl.0 r0.17, r0.3, 0x7
;
add.0 r0.18, r0.11, 0x7d
add.0 r0.20, r0.11, 0x7e
;
or.0 r0.3, r0.13, 0x800000
;
add.0 r0.16, r0.17, r0.17
shru.0 r0.19, r0.17, 0x1
;
;
shl.0 r0.10, r0.3, 0x8
;
;
;
stw.0 r0.1[0x28], r0.10
mov.0 r0.5, r0.10
;
cmpgtu.0 b0.0, r0.10, r0.16
goto.0 floatlib_L119?3
;
-- floatlib_L117?3
cmpne.0 b0.0, r0.13, r0.0
mov.0 r0.4, r0.15
;
;
;
brf.0 b0.0, floatlib_L133?3
;
.call propagateFloat32NaN arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, floatlib_FUNC_propagateFloat32NaN
;
ldw.0 l0.0, r0.1[0x20]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L133?3
ldw.0 r0.16, r0.1[0x24]
;
ldw.0 l0.0, r0.1[0x20]
;
;
shl.0 r0.3, r0.16, 0x1f
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L116?3
cmpne.0 b0.0, r0.12, r0.0
mov.0 r0.4, r0.15
;
;
;
brf.0 b0.0, floatlib_L134?3
;
.call propagateFloat32NaN arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, floatlib_FUNC_propagateFloat32NaN
;
ldw.0 l0.0, r0.1[0x20]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L134?3
cmpeq.0 b0.0, r0.2, 0xff
cmpne.0 b0.1, r0.13, r0.0
mov.0 r0.4, r0.15
;
;
;
brf.0 b0.0, floatlib_L135?3
;
brf.0 b0.1, floatlib_L136?3
;
.call propagateFloat32NaN arg(r0.3,r0.4) ret(r0.3)
call.0 l0.0, floatlib_FUNC_propagateFloat32NaN
;
ldw.0 l0.0, r0.1[0x20]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L136?3
.call float_raise arg(r0.3) ret()
mov.0 r0.3, 0x10
call.0 l0.0, floatlib_FUNC_float_raise
;
ldw.0 l0.0, r0.1[0x20]
mov.0 r0.3, 0x7fffffff
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L135?3
ldw.0 r0.16, r0.1[0x24]
;
ldw.0 l0.0, r0.1[0x20]
;
;
shl.0 r0.16, r0.16, 0x1f
;
;
;
add.0 r0.3, r0.16, 0x7f800000
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x60, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__r_eq
add.0 r0.1, r0.1, -0x20
shru.0 r0.2, r0.3, 0x17
shru.0 r0.5, r0.4, 0x17
;
and.0 r0.6, r0.3, 0x7fffff
or.0 r0.7, r0.3, r0.4
stw.0 r0.1[0x10], l0.0
;
and.0 r0.8, r0.4, 0x7fffff
cmpeq.0 r0.9, r0.3, r0.4
;
and.0 r0.2, r0.2, 0xff
and.0 r0.5, r0.5, 0xff
;
shl.0 r0.7, r0.7, 0x1
;
;
cmpeq.0 r0.2, r0.2, 0xff
cmpeq.0 r0.5, r0.5, 0xff
;
cmpeq.0 r0.7, r0.7, r0.0
;
;
andl.0 r0.2, r0.2, r0.6
andl.0 r0.5, r0.5, r0.8
;
orl.0 r0.9, r0.9, r0.7
;
;
orl.0 b0.0, r0.2, r0.5
;
mov.0 r0.3, r0.9
mov.0 r0.2, r0.3
;
;
br.0 b0.0, floatlib_L137?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L137?3
shru.0 r0.5, r0.2, 0x16
and.0 r0.6, r0.2, 0x3fffff
shru.0 r0.7, r0.4, 0x16
;
and.0 r0.8, r0.4, 0x3fffff
mov.0 r0.3, 0x10
;
;
and.0 r0.5, r0.5, 0x1ff
and.0 r0.7, r0.7, 0x1ff
;
;
;
cmpeq.0 r0.5, r0.5, 0x1fe
cmpeq.0 r0.7, r0.7, 0x1fe
;
;
;
andl.0 r0.5, r0.5, r0.6
andl.0 r0.7, r0.7, r0.8
;
;
;
orl.0 b0.0, r0.5, r0.7
;
;
;
brf.0 b0.0, floatlib_L138?3
;
.call float_raise arg(r0.3) ret()
call.0 l0.0, floatlib_FUNC_float_raise
;
-- floatlib_L138?3
mov.0 r0.3, r0.0
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__r_le
add.0 r0.1, r0.1, -0x20
shru.0 r0.2, r0.3, 0x17
shru.0 r0.5, r0.4, 0x17
;
and.0 r0.6, r0.3, 0x7fffff
shru.0 r0.7, r0.3, 0x1f
stw.0 r0.1[0x10], l0.0
;
and.0 r0.8, r0.4, 0x7fffff
shru.0 r0.9, r0.4, 0x1f
or.0 r0.10, r0.3, r0.4
;
and.0 r0.2, r0.2, 0xff
and.0 r0.5, r0.5, 0xff
;
;
cmpne.0 b0.0, r0.7, r0.9
shl.0 r0.10, r0.10, 0x1
;
cmpeq.0 r0.2, r0.2, 0xff
cmpeq.0 r0.5, r0.5, 0xff
;
;
cmpeq.0 r0.10, r0.10, r0.0
;
andl.0 r0.2, r0.2, r0.6
andl.0 r0.5, r0.5, r0.8
;
;
orl.0 r0.10, r0.7, r0.10
;
orl.0 b0.1, r0.2, r0.5
;
;
mov.0 r0.3, r0.10
mov.0 r0.2, r0.3
;
br.0 b0.1, floatlib_L139?3
;
brf.0 b0.0, floatlib_L140?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L140?3
cmpeq.0 r0.2, r0.2, r0.4
cmpltu.0 r0.5, r0.2, r0.4
;
;
;
xor.0 r0.5, r0.5, r0.7
;
;
;
orl.0 r0.3, r0.2, r0.5
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L139?3
.call float_raise arg(r0.3) ret()
mov.0 r0.3, 0x10
call.0 l0.0, floatlib_FUNC_float_raise
;
mov.0 r0.3, r0.0
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__r_lt
add.0 r0.1, r0.1, -0x20
shru.0 r0.2, r0.3, 0x17
shru.0 r0.5, r0.4, 0x17
;
and.0 r0.6, r0.3, 0x7fffff
shru.0 r0.7, r0.3, 0x1f
stw.0 r0.1[0x10], l0.0
;
and.0 r0.8, r0.4, 0x7fffff
shru.0 r0.9, r0.4, 0x1f
or.0 r0.10, r0.3, r0.4
;
and.0 r0.2, r0.2, 0xff
and.0 r0.5, r0.5, 0xff
;
;
cmpne.0 b0.0, r0.7, r0.9
shl.0 r0.10, r0.10, 0x1
;
cmpeq.0 r0.2, r0.2, 0xff
cmpeq.0 r0.5, r0.5, 0xff
;
;
andl.0 r0.10, r0.7, r0.10
;
andl.0 r0.2, r0.2, r0.6
andl.0 r0.5, r0.5, r0.8
;
;
mov.0 r0.3, r0.10
mov.0 r0.6, r0.3
;
orl.0 b0.1, r0.2, r0.5
;
;
;
br.0 b0.1, floatlib_L141?3
;
brf.0 b0.0, floatlib_L142?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L142?3
cmpne.0 r0.6, r0.6, r0.4
cmpltu.0 r0.2, r0.6, r0.4
;
;
;
xor.0 r0.2, r0.2, r0.7
;
;
;
andl.0 r0.3, r0.6, r0.2
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L141?3
.call float_raise arg(r0.3) ret()
mov.0 r0.3, 0x10
call.0 l0.0, floatlib_FUNC_float_raise
;
mov.0 r0.3, r0.0
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5) ret()
-- floatlib_FUNC_float64_to_int32_round_to_zero
add.0 r0.1, r0.1, -0x40
and.0 r0.2, r0.3, 0xfffff
;
shru.0 r0.7, r0.3, 0x14
shru.0 r0.6, r0.3, 0x1f
cmpne.0 b0.0, r0.5, r0.0
stw.0 r0.1[0x18], l0.0
;
ldw_d.0 r0.9, r0.1[0x14]
mov.0 r0.8, ~0x3fffffff
;
or.0 r0.10, r0.4, r0.2
ldw_d.0 r0.11, r0.0[(floatlib_?1PACKET.3+0)]
;
and.0 r0.7, r0.7, 0x7ff
slct.0 r0.8, b0.0, r0.8, ~0x0
;
cmpne.0 b0.1, r0.9, r0.0
;
or.0 r0.11, r0.11, 0x1
;
add.0 r0.12, r0.7, -0x413
cmpeq.0 r0.13, r0.7, 0x7ff
;
;
;
cmpge.0 b0.0, r0.12, r0.0
cmpgt.0 b0.2, r0.12, 0xb
andl.0 b0.3, r0.13, r0.10
;
;
;
brf.0 b0.0, floatlib_L143?3
;
brf.0 b0.2, floatlib_L144?3
;
slctf.0 r0.6, b0.3, r0.6, r0.0
stw.0 r0.1[0x10], r0.8
;
ldw.0 r0.2, r0.1[0x10]
;
;
-- floatlib_L145?3
orl.0 r0.4, r0.6, r0.5
mtb.0 b0.0, r0.6
;
sub.0 r0.7, r0.0, r0.2
;
;
;
slct.0 r0.3, b0.0, r0.7, r0.2
;
;
;
cmplt.0 r0.2, r0.3, r0.0
andl.0 r0.4, r0.3, r0.4
;
;
;
xor.0 r0.2, r0.6, r0.2
;
;
;
andl.0 b0.0, r0.4, r0.2
;
;
;
br.0 b0.0, floatlib_L146?3
;
brf.0 b0.1, floatlib_L147?3
;
.return arg(return) ret(r0.3)
stw.0 r0.0[(floatlib_?1PACKET.3+0)], r0.11
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L147?3
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L146?3
stw.0 r0.1[0x1c], r0.6
mov.0 r0.3, 0x10
;
.call float_raise arg(r0.3) ret()
stw.0 r0.1[0x20], r0.5
call.0 l0.0, floatlib_FUNC_float_raise
;
mov.0 r0.2, ~0x7fffffff
ldw.0 l0.0, r0.1[0x18]
;
ldw.0 r0.6, r0.1[0x1c]
;
ldw.0 r0.5, r0.1[0x20]
;
;
mtb.0 b0.0, r0.6
;
cmpne.0 b0.1, r0.5, r0.0
;
;
slct.0 r0.3, b0.0, r0.2, 0x7fffffff
;
brf.0 b0.1, floatlib_L148?3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L148?3
ldw.0 r0.6, r0.1[0x1c]
;
;
;
mtb.0 b0.0, r0.6
;
;
;
slct.0 r0.3, b0.0, r0.0, ~0x0
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L144?3
or.0 r0.2, r0.2, 0x100000
sub.0 r0.3, r0.0, r0.12
cmpeq.0 b0.0, r0.12, r0.0
;
shl.0 r0.7, r0.4, r0.12
;
;
shl.0 r0.12, r0.2, r0.12
and.0 r0.3, r0.3, 0x1f
;
stw.0 r0.1[0x14], r0.7
;
ldw_d.0 r0.9, r0.1[0x14]
;
shru.0 r0.4, r0.4, r0.3
;
;
cmpne.0 b0.1, r0.9, r0.0
;
or.0 r0.12, r0.12, r0.4
;
;
;
slct.0 r0.2, b0.0, r0.2, r0.12
;
;
;
stw.0 r0.1[0x10], r0.2
;
ldw_d.0 r0.2, r0.0[(floatlib_?1PACKET.3+0)]
;
;
;
or.0 r0.11, r0.2, 0x1
;
ldw.0 r0.2, r0.1[0x10]
;
goto.0 floatlib_L145?3
;
-- floatlib_L143?3
cmplt.0 b0.0, r0.7, 0x3fe
or.0 r0.3, r0.7, r0.2
;
;
;
or.0 r0.3, r0.3, r0.4
brf.0 b0.0, floatlib_L149?3
;
stw.0 r0.1[0x10], r0.0
;
;
stw.0 r0.1[0x14], r0.3
;
ldw_d.0 r0.9, r0.1[0x14]
;
;
;
cmpne.0 b0.1, r0.9, r0.0
;
ldw.0 r0.2, r0.1[0x10]
;
goto.0 floatlib_L145?3
;
-- floatlib_L149?3
or.0 r0.2, r0.2, 0x100000
sub.0 r0.12, r0.0, r0.12
and.0 r0.7, r0.12, 0x1f
;
;
;
shru.0 r0.2, r0.2, r0.12
shl.0 r0.7, r0.2, r0.7
;
;
;
or.0 r0.7, r0.7, r0.4
stw.0 r0.1[0x10], r0.2
;
;
;
stw.0 r0.1[0x14], r0.7
;
ldw_d.0 r0.9, r0.1[0x14]
;
;
;
cmpne.0 b0.1, r0.9, r0.0
;
ldw.0 r0.2, r0.1[0x10]
;
goto.0 floatlib_L145?3
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__r_d
add.0 r0.1, r0.1, -0x40
and.0 r0.2, r0.3, 0xfffff
;
shru.0 r0.6, r0.3, 0x14
shru.0 r0.5, r0.3, 0x1f
stw.0 r0.1[0x18], l0.0
;
stw.0 r0.1[0x1c], r0.4
;
or.0 r0.7, r0.4, r0.2
stw.0 r0.1[0x20], r0.3
;
and.0 r0.6, r0.6, 0x7ff
;
;
cmpne.0 b0.0, r0.7, r0.0
;
cmpeq.0 b0.1, r0.6, 0x7ff
;
;
;
brf.0 b0.1, floatlib_L150?3
;
brf.0 b0.0, floatlib_L151?3
;
.call float64ToCommonNaN arg(r0.3,r0.4) ret(r0.3,r0.4,r0.5)
call.0 l0.0, floatlib_FUNC_float64ToCommonNaN
;
shru.0 r0.2, r0.4, 0x9
ldw.0 r0.4, r0.1[0x1c]
;
ldw.0 r0.3, r0.1[0x20]
;
;
.call float64ToCommonNaN arg(r0.3,r0.4) ret(r0.3,r0.4,r0.5)
stw.0 r0.1[0x24], r0.2
call.0 l0.0, floatlib_FUNC_float64ToCommonNaN
;
shl.0 r0.3, r0.3, 0x1f
ldw.0 l0.0, r0.1[0x18]
;
;
ldw.0 r0.2, r0.1[0x24]
;
;
;
or.0 r0.2, r0.2, 0x7fc00000
;
;
;
or.0 r0.3, r0.2, r0.3
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L151?3
shl.0 r0.5, r0.5, 0x1f
ldw.0 l0.0, r0.1[0x18]
;
;
;
add.0 r0.3, r0.5, 0x7f800000
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L150?3
shl.0 r0.7, r0.4, 0xa
shru.0 r0.9, r0.4, 0x16
shl.0 r0.8, r0.2, 0xa
shru.0 r0.10, r0.2, 0x16
;
cmpne.0 b0.0, r0.6, r0.0
add.0 r0.11, r0.6, -0x381
mov.0 r0.3, r0.5
;
;
cmpne.0 r0.7, r0.7, r0.0
stw.0 r0.1[0x10], r0.10
;
mov.0 r0.4, r0.11
;
;
or.0 r0.7, r0.7, r0.8
;
;
;
or.0 r0.7, r0.7, r0.9
;
;
;
stw.0 r0.1[0x14], r0.7
or.0 r0.2, r0.7, 0x40000000
brf.0 b0.0, floatlib_L152?3
;
;
;
stw.0 r0.1[0x14], r0.2
;
-- floatlib_L153?3
ldw.0 r0.5, r0.1[0x14]
;
;
.call roundAndPackFloat32 arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_roundAndPackFloat32
;
ldw.0 l0.0, r0.1[0x18]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L152?3
mov.0 r0.3, r0.5
;
goto.0 floatlib_L153?3
;
.entry arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret()
-- floatlib_FUNC_addFloat64Sigs
add.0 r0.1, r0.1, -0x40
and.0 r0.2, r0.3, 0xfffff
;
and.0 r0.8, r0.5, 0xfffff
shru.0 r0.9, r0.3, 0x14
stw.0 r0.1[0x2c], l0.0
;
stw.0 r0.1[0x1c], r0.4
shru.0 r0.10, r0.5, 0x14
;
stw.0 r0.1[0x18], r0.2
or.0 r0.11, r0.4, r0.2
;
and.0 r0.9, r0.9, 0x7ff
stw.0 r0.1[0x14], r0.6
;
and.0 r0.10, r0.10, 0x7ff
stw.0 r0.1[0x10], r0.8
;
cmpne.0 b0.0, r0.11, r0.0
;
cmpeq.0 b0.1, r0.9, 0x7ff
;
sub.0 r0.2, r0.9, r0.10
;
;
;
cmpgt.0 b0.2, r0.2, r0.0
;
;
;
brf.0 b0.2, floatlib_L154?3
;
brf.0 b0.1, floatlib_L155?3
;
brf.0 b0.0, floatlib_L156?3
;
.call propagateFloat64NaN arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_propagateFloat64NaN
;
ldw.0 l0.0, r0.1[0x2c]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L156?3
ldw.0 l0.0, r0.1[0x2c]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L155?3
cmpeq.0 b0.0, r0.10, r0.0
ldw_d.0 r0.8, r0.1[0x10]
add.0 r0.11, r0.1, 0x10
add.0 r0.12, r0.1, 0x14
;
ldw_d.0 r0.13, r0.1[0x14]
mov.0 r0.14, r0.0
add.0 r0.15, r0.1, 0x20
mov.0 r0.16, r0.0
;
mov.0 r0.18, r0.9
ldw_d.0 r0.17, r0.1[0x1c]
mov.0 r0.3, r0.7
;
mov.0 r0.19, r0.8
ldw_d.0 r0.10, r0.1[0x18]
add.0 r0.20, r0.18, -0x1
brf.0 b0.0, floatlib_L157?3
;
add.0 r0.2, r0.2, -0x1
mov.0 r0.21, r0.13
;
;
or.0 r0.10, r0.10, 0x100000
;
-- floatlib_L158?3
sub.0 r0.22, r0.0, r0.2
cmpeq.0 b0.0, r0.2, r0.0
;
;
;
and.0 r0.22, r0.22, 0x1f
;
;
brf.0 b0.0, floatlib_L159?3
;
-- floatlib_L160?3
stw.0 r0.12[0x0], r0.21
;
ldw.0 r0.8, r0.1[0x14]
;
stw.0 r0.11[0x0], r0.19
;
ldw.0 r0.11, r0.1[0x10]
;
stw.0 r0.15[0x0], r0.16
add.0 r0.8, r0.17, r0.8
;
-- floatlib_L161?3
ldw_d.0 r0.12, r0.1[0x20]
;
stw.0 r0.1[0x18], r0.10
;
cmpltu.0 r0.17, r0.8, r0.17
stw.0 r0.1[0x24], r0.8
;
ldw_d.0 r0.13, r0.1[0x24]
cmpne.0 r0.12, r0.12, r0.0
;
;
add.0 r0.10, r0.10, r0.17
;
shl.0 r0.14, r0.13, 0x1f
shru.0 r0.8, r0.13, 0x1
;
;
add.0 r0.10, r0.10, r0.11
;
or.0 r0.14, r0.14, r0.12
;
;
stw.0 r0.1[0x28], r0.10
cmpltu.0 b0.0, r0.10, 0x200000
;
ldw_d.0 r0.11, r0.1[0x28]
;
;
br.0 b0.0, floatlib_L162?3
;
mov.0 r0.4, r0.18
stw.0 r0.1[0x20], r0.14
shl.0 r0.12, r0.11, 0x1f
shru.0 r0.10, r0.11, 0x1
;
-- floatlib_L163?3
ldw.0 r0.7, r0.1[0x20]
;
;
or.0 r0.12, r0.12, r0.8
stw.0 r0.1[0x28], r0.10
;
ldw.0 r0.5, r0.1[0x28]
;
;
stw.0 r0.1[0x24], r0.12
;
-- floatlib_L164?3
ldw.0 r0.6, r0.1[0x24]
;
;
.call roundAndPackFloat64 arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_roundAndPackFloat64
;
ldw.0 l0.0, r0.1[0x2c]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L162?3
ldw.0 r0.5, r0.1[0x28]
mov.0 r0.3, r0.7
mov.0 r0.4, r0.20
;
ldw.0 r0.7, r0.1[0x20]
;
;
goto.0 floatlib_L164?3
;
-- floatlib_L159?3
cmplt.0 b0.0, r0.2, 0x20
shl.0 r0.4, r0.13, r0.22
shru.0 r0.5, r0.13, r0.2
cmpne.0 r0.14, r0.14, r0.0
;
shl.0 r0.6, r0.8, r0.22
shru.0 r0.19, r0.8, r0.2
mov.0 r0.3, r0.7
;
;
or.0 r0.16, r0.14, r0.4
brf.0 b0.0, floatlib_L165?3
;
or.0 r0.21, r0.5, r0.6
;
;
goto.0 floatlib_L160?3
;
-- floatlib_L165?3
cmpge.0 b0.1, r0.2, 0x40
cmpne.0 r0.4, r0.8, r0.0
cmpeq.0 b0.0, r0.2, 0x40
shl.0 r0.22, r0.8, r0.22
;
cmpeq.0 b0.2, r0.2, 0x20
and.0 r0.2, r0.2, 0x1f
mov.0 r0.19, r0.0
mov.0 r0.3, r0.7
;
;
slct.0 r0.4, b0.0, r0.8, r0.4
;
shru.0 r0.2, r0.8, r0.2
slctf.0 r0.14, b0.2, r0.13, r0.0
;
;
slct.0 r0.4, b0.1, r0.4, r0.22
;
slctf.0 r0.2, b0.1, r0.2, r0.0
cmpne.0 r0.14, r0.14, r0.0
;
;
slct.0 r0.4, b0.2, r0.13, r0.4
;
slct.0 r0.21, b0.2, r0.8, r0.2
;
;
or.0 r0.16, r0.14, r0.4
;
;
goto.0 floatlib_L160?3
;
-- floatlib_L157?3
ldw.0 r0.4, r0.1[0x10]
mov.0 r0.21, r0.13
mov.0 r0.3, r0.7
;
;
;
or.0 r0.4, r0.4, 0x100000
;
;
;
stw.0 r0.1[0x10], r0.4
;
ldw.0 r0.8, r0.1[0x10]
;
;
;
mov.0 r0.19, r0.8
or.0 r0.10, r0.10, 0x100000
goto.0 floatlib_L158?3
;
-- floatlib_L154?3
cmplt.0 b0.0, r0.2, r0.0
cmpeq.0 b0.1, r0.10, 0x7ff
ldw_d.0 r0.8, r0.1[0x14]
;
ldw_d.0 r0.11, r0.1[0x10]
;
;
brf.0 b0.0, floatlib_L166?3
;
or.0 r0.8, r0.8, r0.11
brf.0 b0.1, floatlib_L167?3
;
;
;
cmpne.0 b0.0, r0.8, r0.0
;
;
;
brf.0 b0.0, floatlib_L168?3
;
.call propagateFloat64NaN arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_propagateFloat64NaN
;
ldw.0 l0.0, r0.1[0x2c]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L168?3
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
mov.0 r0.3, r0.7
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
mov.0 r0.4, 0x7ff
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x2c]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L167?3
cmpeq.0 b0.0, r0.9, r0.0
ldw_d.0 r0.4, r0.1[0x18]
add.0 r0.5, r0.1, 0x18
add.0 r0.6, r0.1, 0x1c
;
ldw_d.0 r0.11, r0.1[0x1c]
add.0 r0.12, r0.1, 0x20
mov.0 r0.13, r0.0
mov.0 r0.18, r0.10
;
ldw_d.0 r0.8, r0.1[0x14]
add.0 r0.20, r0.18, -0x1
mov.0 r0.3, r0.7
;
mov.0 r0.9, r0.4
brf.0 b0.0, floatlib_L169?3
;
add.0 r0.2, r0.2, 0x1
mov.0 r0.14, r0.11
;
;
;
-- floatlib_L170?3
sub.0 r0.2, r0.0, r0.2
;
;
;
sub.0 r0.15, r0.0, r0.2
cmpeq.0 b0.0, r0.2, r0.0
;
;
;
and.0 r0.15, r0.15, 0x1f
;
;
brf.0 b0.0, floatlib_L171?3
;
-- floatlib_L172?3
stw.0 r0.12[0x0], r0.13
;
stw.0 r0.6[0x0], r0.14
;
ldw.0 r0.17, r0.1[0x1c]
;
stw.0 r0.5[0x0], r0.9
;
ldw.0 r0.4, r0.1[0x18]
;
;
;
or.0 r0.10, r0.4, 0x100000
;
ldw.0 r0.11, r0.1[0x10]
;
add.0 r0.8, r0.17, r0.8
goto.0 floatlib_L161?3
;
-- floatlib_L171?3
shl.0 r0.16, r0.4, r0.15
cmpne.0 r0.10, r0.4, r0.0
cmpge.0 b0.1, r0.2, 0x40
cmpeq.0 b0.0, r0.2, 0x40
;
cmpge.0 b0.3, r0.2, 0x20
cmpeq.0 b0.2, r0.2, 0x20
shl.0 r0.15, r0.11, r0.15
and.0 r0.17, r0.2, 0x1f
;
shru.0 r0.19, r0.11, r0.2
shru.0 r0.2, r0.4, r0.2
mov.0 r0.3, r0.7
;
slct.0 r0.10, b0.0, r0.4, r0.10
;
shru.0 r0.17, r0.4, r0.17
slctf.0 r0.21, b0.2, r0.11, r0.0
;
or.0 r0.19, r0.19, r0.16
slctf.0 r0.9, b0.3, r0.2, r0.0
;
slct.0 r0.10, b0.1, r0.10, r0.16
;
slctf.0 r0.17, b0.1, r0.17, r0.0
slct.0 r0.21, b0.3, r0.21, r0.0
;
;
slct.0 r0.11, b0.2, r0.11, r0.10
;
slct.0 r0.4, b0.2, r0.4, r0.17
cmpne.0 r0.21, r0.21, r0.0
;
;
slct.0 r0.11, b0.3, r0.11, r0.15
;
slct.0 r0.14, b0.3, r0.4, r0.19
;
;
or.0 r0.13, r0.11, r0.21
;
;
goto.0 floatlib_L172?3
;
-- floatlib_L169?3
ldw.0 r0.15, r0.1[0x18]
mov.0 r0.14, r0.11
mov.0 r0.3, r0.7
;
;
;
or.0 r0.15, r0.15, 0x100000
;
;
;
stw.0 r0.1[0x18], r0.15
;
ldw.0 r0.4, r0.1[0x18]
;
;
;
mov.0 r0.9, r0.4
goto.0 floatlib_L170?3
;
-- floatlib_L166?3
cmpeq.0 b0.0, r0.9, 0x7ff
ldw_d.0 r0.2, r0.1[0x14]
;
ldw_d.0 r0.8, r0.1[0x18]
;
ldw_d.0 r0.10, r0.1[0x10]
;
ldw_d.0 r0.11, r0.1[0x1c]
brf.0 b0.0, floatlib_L173?3
;
or.0 r0.2, r0.2, r0.8
;
;
or.0 r0.10, r0.10, r0.11
;
;
;
or.0 r0.2, r0.2, r0.10
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L174?3
;
.call propagateFloat64NaN arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_propagateFloat64NaN
;
ldw.0 l0.0, r0.1[0x2c]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L174?3
ldw.0 l0.0, r0.1[0x2c]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L173?3
ldw.0 r0.2, r0.1[0x1c]
cmpeq.0 b0.0, r0.9, r0.0
mov.0 r0.3, r0.7
mov.0 r0.4, r0.0
;
ldw.0 r0.8, r0.1[0x14]
;
ldw.0 r0.10, r0.1[0x18]
;
ldw.0 r0.11, r0.1[0x10]
;
add.0 r0.6, r0.2, r0.8
;
;
;
cmpltu.0 r0.2, r0.6, r0.2
stw.0 r0.1[0x24], r0.6
;
;
;
add.0 r0.10, r0.10, r0.2
;
;
;
add.0 r0.5, r0.10, r0.11
;
;
;
stw.0 r0.1[0x28], r0.5
brf.0 b0.0, floatlib_L175?3
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x2c]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L175?3
mov.0 r0.4, r0.9
ldw.0 r0.13, r0.1[0x24]
mov.0 r0.3, r0.7
;
ldw.0 r0.2, r0.1[0x28]
;
stw.0 r0.1[0x20], r0.0
;
ldw.0 r0.12, r0.1[0x20]
shl.0 r0.14, r0.13, 0x1f
shru.0 r0.8, r0.13, 0x1
;
or.0 r0.2, r0.2, 0x200000
;
;
cmpne.0 r0.12, r0.12, r0.0
;
stw.0 r0.1[0x28], r0.2
;
ldw.0 r0.11, r0.1[0x28]
;
or.0 r0.14, r0.14, r0.12
;
;
;
stw.0 r0.1[0x20], r0.14
shl.0 r0.12, r0.11, 0x1f
shru.0 r0.10, r0.11, 0x1
goto.0 floatlib_L163?3
;
.entry arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret()
-- floatlib_FUNC_subFloat64Sigs
add.0 r0.1, r0.1, -0x40
and.0 r0.2, r0.3, 0xfffff
;
and.0 r0.9, r0.5, 0xfffff
shru.0 r0.8, r0.4, 0x16
stw.0 r0.1[0x28], l0.0
;
shru.0 r0.13, r0.3, 0x14
shl.0 r0.11, r0.4, 0xa
shl.0 r0.12, r0.6, 0xa
shru.0 r0.10, r0.6, 0x16
;
shru.0 r0.14, r0.5, 0x14
shl.0 r0.2, r0.2, 0xa
;
shl.0 r0.9, r0.9, 0xa
;
and.0 r0.13, r0.13, 0x7ff
stw.0 r0.1[0x1c], r0.11
;
and.0 r0.14, r0.14, 0x7ff
stw.0 r0.1[0x18], r0.12
or.0 r0.2, r0.2, r0.8
;
or.0 r0.9, r0.9, r0.10
;
cmpeq.0 b0.0, r0.13, 0x7ff
;
sub.0 r0.8, r0.13, r0.14
stw.0 r0.1[0x14], r0.2
or.0 r0.11, r0.11, r0.2
;
stw.0 r0.1[0x10], r0.9
;
;
cmpgt.0 b0.1, r0.8, r0.0
cmpne.0 b0.2, r0.11, r0.0
;
;
;
brf.0 b0.1, floatlib_L176?3
;
brf.0 b0.0, floatlib_L177?3
;
brf.0 b0.2, floatlib_L178?3
;
.call propagateFloat64NaN arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_propagateFloat64NaN
;
ldw.0 l0.0, r0.1[0x28]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L178?3
ldw.0 l0.0, r0.1[0x28]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L177?3
cmpeq.0 b0.0, r0.14, r0.0
ldw_d.0 r0.2, r0.1[0x10]
add.0 r0.9, r0.1, 0x10
add.0 r0.10, r0.1, 0x18
;
ldw_d.0 r0.11, r0.1[0x18]
mov.0 r0.12, r0.13
mov.0 r0.3, r0.7
;
ldw_d.0 r0.15, r0.1[0x14]
add.0 r0.4, r0.12, -0xb
;
mov.0 r0.14, r0.2
ldw_d.0 r0.16, r0.1[0x1c]
brf.0 b0.0, floatlib_L179?3
;
add.0 r0.8, r0.8, -0x1
mov.0 r0.17, r0.11
;
or.0 r0.15, r0.15, 0x40000000
;
;
-- floatlib_L180?3
sub.0 r0.12, r0.0, r0.8
cmpeq.0 b0.0, r0.8, r0.0
;
;
;
and.0 r0.12, r0.12, 0x1f
;
;
brf.0 b0.0, floatlib_L181?3
;
-- floatlib_L182?3
stw.0 r0.1[0x14], r0.15
;
ldw.0 r0.2, r0.1[0x14]
;
stw.0 r0.9[0x0], r0.14
;
ldw.0 r0.9, r0.1[0x10]
;
stw.0 r0.10[0x0], r0.17
;
-- floatlib_L183?3
ldw.0 r0.10, r0.1[0x18]
;
sub.0 r0.2, r0.2, r0.9
;
;
sub.0 r0.12, r0.16, r0.10
cmpltu.0 r0.11, r0.16, r0.10
;
;
;
stw.0 r0.1[0x24], r0.12
sub.0 r0.2, r0.2, r0.11
;
ldw.0 r0.6, r0.1[0x24]
;
;
stw.0 r0.1[0x20], r0.2
;
-- floatlib_L184?3
ldw.0 r0.5, r0.1[0x20]
;
;
.call normalizeRoundAndPackFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_normalizeRoundAndPackFloat64
;
ldw.0 l0.0, r0.1[0x28]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L181?3
shl.0 r0.5, r0.2, r0.12
or.0 r0.13, r0.11, r0.2
cmpge.0 b0.0, r0.8, 0x40
and.0 r0.6, r0.8, 0x1f
;
cmpeq.0 b0.1, r0.8, 0x20
shru.0 r0.19, r0.11, r0.8
cmpne.0 r0.18, r0.11, r0.0
shl.0 r0.12, r0.11, r0.12
;
cmpge.0 b0.2, r0.8, 0x20
shru.0 r0.8, r0.2, r0.8
mov.0 r0.3, r0.7
;
or.0 r0.11, r0.11, r0.5
cmpne.0 r0.13, r0.13, r0.0
shru.0 r0.6, r0.2, r0.6
;
cmpne.0 r0.12, r0.12, r0.0
or.0 r0.19, r0.19, r0.5
or.0 r0.18, r0.18, r0.2
;
slctf.0 r0.14, b0.2, r0.8, r0.0
;
cmpne.0 r0.11, r0.11, r0.0
;
or.0 r0.19, r0.19, r0.12
;
;
or.0 r0.11, r0.11, r0.6
;
;
;
slct.0 r0.13, b0.0, r0.13, r0.11
;
;
;
slct.0 r0.18, b0.1, r0.18, r0.13
;
;
;
slct.0 r0.17, b0.2, r0.18, r0.19
;
;
goto.0 floatlib_L182?3
;
-- floatlib_L179?3
ldw.0 r0.5, r0.1[0x10]
mov.0 r0.17, r0.11
mov.0 r0.3, r0.7
;
;
;
or.0 r0.5, r0.5, 0x40000000
;
;
;
stw.0 r0.1[0x10], r0.5
;
ldw.0 r0.2, r0.1[0x10]
;
;
;
mov.0 r0.14, r0.2
or.0 r0.15, r0.15, 0x40000000
;
goto.0 floatlib_L180?3
;
-- floatlib_L176?3
cmplt.0 b0.0, r0.8, r0.0
cmpeq.0 b0.1, r0.14, 0x7ff
ldw_d.0 r0.2, r0.1[0x18]
;
ldw_d.0 r0.9, r0.1[0x10]
;
;
brf.0 b0.0, floatlib_L185?3
;
or.0 r0.2, r0.2, r0.9
brf.0 b0.1, floatlib_L186?3
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L187?3
;
.call propagateFloat64NaN arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_propagateFloat64NaN
;
ldw.0 l0.0, r0.1[0x28]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L187?3
xor.0 r0.3, r0.7, 0x1
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
;
mov.0 r0.4, 0x7ff
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x28]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L186?3
cmpeq.0 b0.0, r0.13, r0.0
ldw_d.0 r0.5, r0.1[0x14]
add.0 r0.9, r0.1, 0x14
add.0 r0.10, r0.1, 0x1c
;
ldw_d.0 r0.11, r0.1[0x1c]
mov.0 r0.12, r0.14
;
ldw_d.0 r0.2, r0.1[0x10]
add.0 r0.4, r0.12, -0xb
;
mov.0 r0.13, r0.5
ldw_d.0 r0.15, r0.1[0x18]
brf.0 b0.0, floatlib_L188?3
;
add.0 r0.8, r0.8, 0x1
mov.0 r0.16, r0.11
;
or.0 r0.2, r0.2, 0x40000000
;
;
-- floatlib_L189?3
sub.0 r0.8, r0.0, r0.8
;
;
;
sub.0 r0.12, r0.0, r0.8
cmpeq.0 b0.0, r0.8, r0.0
;
;
;
and.0 r0.12, r0.12, 0x1f
;
;
brf.0 b0.0, floatlib_L190?3
;
-- floatlib_L191?3
stw.0 r0.1[0x10], r0.2
xor.0 r0.7, r0.7, 0x1
;
ldw.0 r0.2, r0.1[0x10]
;
stw.0 r0.9[0x0], r0.13
;
ldw.0 r0.5, r0.1[0x14]
mov.0 r0.3, r0.7
;
stw.0 r0.10[0x0], r0.16
;
-- floatlib_L192?3
ldw.0 r0.9, r0.1[0x1c]
;
sub.0 r0.2, r0.2, r0.5
;
;
sub.0 r0.11, r0.15, r0.9
cmpltu.0 r0.10, r0.15, r0.9
;
;
;
stw.0 r0.1[0x24], r0.11
sub.0 r0.2, r0.2, r0.10
;
ldw.0 r0.6, r0.1[0x24]
;
;
stw.0 r0.1[0x20], r0.2
goto.0 floatlib_L184?3
;
-- floatlib_L190?3
shl.0 r0.3, r0.5, r0.12
or.0 r0.14, r0.11, r0.5
cmpge.0 b0.0, r0.8, 0x40
and.0 r0.6, r0.8, 0x1f
;
cmpeq.0 b0.1, r0.8, 0x20
shru.0 r0.18, r0.11, r0.8
cmpne.0 r0.17, r0.11, r0.0
shl.0 r0.12, r0.11, r0.12
;
cmpge.0 b0.2, r0.8, 0x20
shru.0 r0.8, r0.5, r0.8
;
or.0 r0.11, r0.11, r0.3
cmpne.0 r0.14, r0.14, r0.0
shru.0 r0.6, r0.5, r0.6
;
cmpne.0 r0.12, r0.12, r0.0
or.0 r0.18, r0.18, r0.3
or.0 r0.17, r0.17, r0.5
;
slctf.0 r0.13, b0.2, r0.8, r0.0
;
cmpne.0 r0.11, r0.11, r0.0
;
or.0 r0.18, r0.18, r0.12
;
;
or.0 r0.11, r0.11, r0.6
;
;
;
slct.0 r0.14, b0.0, r0.14, r0.11
;
;
;
slct.0 r0.17, b0.1, r0.17, r0.14
;
;
;
slct.0 r0.16, b0.2, r0.17, r0.18
;
;
goto.0 floatlib_L191?3
;
-- floatlib_L188?3
ldw.0 r0.3, r0.1[0x14]
mov.0 r0.16, r0.11
;
;
;
or.0 r0.3, r0.3, 0x40000000
;
;
;
stw.0 r0.1[0x14], r0.3
;
ldw.0 r0.5, r0.1[0x14]
;
;
;
mov.0 r0.13, r0.5
or.0 r0.2, r0.2, 0x40000000
;
goto.0 floatlib_L189?3
;
-- floatlib_L185?3
cmpeq.0 b0.0, r0.13, 0x7ff
cmpne.0 b0.1, r0.13, r0.0
cmpne.0 b0.2, r0.13, r0.0
;
ldw_d.0 r0.8, r0.1[0x10]
mov.0 r0.3, r0.7
mov.0 r0.9, r0.3
;
ldw_d.0 r0.10, r0.1[0x14]
;
slct.0 r0.14, b0.1, r0.14, 0x1
slct.0 r0.13, b0.2, r0.13, 0x1
ldw_d.0 r0.2, r0.1[0x14]
br.0 b0.0, floatlib_L193?3
;
ldw_d.0 r0.16, r0.1[0x1c]
;
cmpltu.0 b0.0, r0.8, r0.10
;
mov.0 r0.12, r0.13
;
add.0 r0.4, r0.12, -0xb
;
brf.0 b0.0, floatlib_L194?3
;
ldw.0 r0.9, r0.1[0x10]
;
goto.0 floatlib_L183?3
;
-- floatlib_L194?3
cmpltu.0 b0.0, r0.10, r0.8
ldw_d.0 r0.2, r0.1[0x10]
mov.0 r0.12, r0.14
;
ldw_d.0 r0.15, r0.1[0x18]
add.0 r0.4, r0.12, -0xb
;
;
brf.0 b0.0, floatlib_L195?3
;
xor.0 r0.3, r0.3, 0x1
;
ldw.0 r0.5, r0.1[0x14]
;
goto.0 floatlib_L192?3
;
-- floatlib_L195?3
ldw.0 r0.5, r0.1[0x18]
mov.0 r0.12, r0.13
;
ldw.0 r0.6, r0.1[0x1c]
add.0 r0.4, r0.12, -0xb
;
ldw_d.0 r0.2, r0.1[0x14]
;
ldw_d.0 r0.16, r0.1[0x1c]
;
cmpltu.0 b0.0, r0.5, r0.6
;
;
;
brf.0 b0.0, floatlib_L196?3
;
ldw.0 r0.9, r0.1[0x10]
;
goto.0 floatlib_L183?3
;
-- floatlib_L196?3
cmpltu.0 b0.0, r0.6, r0.5
ldw_d.0 r0.2, r0.1[0x10]
mov.0 r0.12, r0.14
xor.0 r0.3, r0.3, 0x1
;
ldw_d.0 r0.15, r0.1[0x18]
add.0 r0.4, r0.12, -0xb
;
;
brf.0 b0.0, floatlib_L197?3
;
ldw.0 r0.5, r0.1[0x14]
;
goto.0 floatlib_L192?3
;
-- floatlib_L197?3
ldw.0 r0.2, r0.0[(floatlib_?1PACKET.2+0)]
mov.0 r0.4, r0.0
mov.0 r0.5, r0.0
;
mov.0 r0.6, r0.0
;
;
cmpeq.0 r0.3, r0.2, 0x1
;
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x28]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L193?3
ldw.0 r0.7, r0.1[0x18]
mov.0 r0.3, r0.9
;
ldw.0 r0.8, r0.1[0x14]
;
ldw.0 r0.2, r0.1[0x10]
;
ldw.0 r0.9, r0.1[0x1c]
;
or.0 r0.7, r0.7, r0.8
;
;
or.0 r0.2, r0.2, r0.9
;
;
;
or.0 r0.7, r0.7, r0.2
;
;
;
cmpne.0 b0.0, r0.7, r0.0
;
;
;
brf.0 b0.0, floatlib_L198?3
;
.call propagateFloat64NaN arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_propagateFloat64NaN
;
ldw.0 l0.0, r0.1[0x28]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
-- floatlib_L198?3
.call float_raise arg(r0.3) ret()
mov.0 r0.3, 0x10
call.0 l0.0, floatlib_FUNC_float_raise
;
mov.0 r0.4, ~0x0
ldw.0 l0.0, r0.1[0x28]
mov.0 r0.3, 0x7fffffff
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x40, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC__d_add
add.0 r0.1, r0.1, -0x20
shru.0 r0.7, r0.3, 0x1f
shru.0 r0.2, r0.5, 0x1f
;
stw.0 r0.1[0x10], l0.0
;
;
cmpeq.0 b0.0, r0.7, r0.2
;
;
;
brf.0 b0.0, floatlib_L199?3
;
.call addFloat64Sigs arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_addFloat64Sigs
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L199?3
.call subFloat64Sigs arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_subFloat64Sigs
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC__d_sub
add.0 r0.1, r0.1, -0x20
shru.0 r0.7, r0.3, 0x1f
shru.0 r0.2, r0.5, 0x1f
;
stw.0 r0.1[0x10], l0.0
;
;
cmpeq.0 b0.0, r0.7, r0.2
;
;
;
brf.0 b0.0, floatlib_L200?3
;
.call subFloat64Sigs arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_subFloat64Sigs
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L200?3
.call addFloat64Sigs arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_addFloat64Sigs
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC__d_mul
add.0 r0.1, r0.1, -0x60
shru.0 r0.2, r0.3, 0x14
shru.0 r0.8, r0.5, 0x14
;
and.0 r0.9, r0.3, 0xfffff
shru.0 r0.10, r0.3, 0x1f
stw.0 r0.1[0x50], l0.0
;
stw.0 r0.1[0x24], r0.4
and.0 r0.12, r0.5, 0xfffff
shru.0 r0.11, r0.5, 0x1f
;
and.0 r0.2, r0.2, 0x7ff
and.0 r0.8, r0.8, 0x7ff
;
ldw_d.0 r0.13, r0.1[0x24]
;
stw.0 r0.1[0x20], r0.9
xor.0 r0.10, r0.10, r0.11
;
cmpeq.0 b0.0, r0.2, 0x7ff
cmpeq.0 b0.1, r0.8, 0x7ff
;
cmpeq.0 b0.2, r0.2, r0.0
ldw_d.0 r0.14, r0.1[0x20]
;
stw.0 r0.1[0x1c], r0.2
mov.0 r0.11, r0.3
;
ldw_d.0 r0.15, r0.1[0x1c]
mov.0 r0.3, r0.10
;
stw.0 r0.1[0x10], r0.8
or.0 r0.14, r0.14, 0x100000
;
ldw_d.0 r0.2, r0.1[0x10]
;
ldw_d.0 r0.8, r0.1[0x10]
;
stw.0 r0.1[0x18], r0.6
;
cmpeq.0 b0.3, r0.2, r0.0
ldw_d.0 r0.16, r0.1[0x18]
;
stw.0 r0.1[0x14], r0.12
add.0 r0.8, r0.8, -0x400
br.0 b0.0, floatlib_L201?3
;
ldw_d.0 r0.12, r0.1[0x14]
br.0 b0.1, floatlib_L202?3
;
shl.0 r0.2, r0.16, 0xc
shru.0 r0.11, r0.16, 0x14
br.0 b0.2, floatlib_L203?3
;
-- floatlib_L204?3
add.0 r0.8, r0.8, r0.15
br.0 b0.3, floatlib_L205?3
;
-- floatlib_L206?3
stw.0 r0.1[0x20], r0.14
shl.0 r0.12, r0.12, 0xc
;
stw.0 r0.1[0x18], r0.2
mpylhu.0 r0.9, r0.2, r0.13
mpylhu.0 r0.16, r0.13, r0.2
;
mpyllu.0 r0.15, r0.13, r0.2
mpyhhu.0 r0.17, r0.13, r0.2
;
or.0 r0.12, r0.12, r0.11
mpylhu.0 r0.18, r0.14, r0.2
mpylhu.0 r0.19, r0.2, r0.14
;
mpyllu.0 r0.20, r0.2, r0.14
add.0 r0.16, r0.9, r0.16
mpyhhu.0 r0.21, r0.2, r0.14
;
;
stw.0 r0.1[0x14], r0.12
mpylhu.0 r0.11, r0.12, r0.13
mpylhu.0 r0.22, r0.13, r0.12
add.0 r0.18, r0.18, r0.19
;
mpyllu.0 r0.24, r0.13, r0.12
shru.0 r0.23, r0.16, 0x10
cmpltu.0 r0.9, r0.16, r0.9
shl.0 r0.2, r0.16, 0x10
;
mpyhhu.0 r0.25, r0.13, r0.12
mpylhu.0 r0.26, r0.14, r0.12
;
mpyllu.0 r0.28, r0.12, r0.14
add.0 r0.22, r0.11, r0.22
mpylhu.0 r0.27, r0.12, r0.14
shl.0 r0.29, r0.18, 0x10
;
shl.0 r0.9, r0.9, 0x10
add.0 r0.15, r0.15, r0.2
add.0 r0.23, r0.23, r0.17
cmpltu.0 r0.19, r0.18, r0.19
;
mpyhhu.0 r0.30, r0.12, r0.14
shru.0 r0.16, r0.18, 0x10
;
shru.0 r0.32, r0.22, 0x10
cmpltu.0 r0.11, r0.22, r0.11
shl.0 r0.31, r0.22, 0x10
add.0 r0.26, r0.26, r0.27
;
cmpltu.0 r0.2, r0.15, r0.2
cmpne.0 r0.17, r0.15, r0.0
shl.0 r0.19, r0.19, 0x10
add.0 r0.20, r0.20, r0.29
;
stw.0 r0.1[0x4c], r0.15
add.0 r0.16, r0.16, r0.21
;
shl.0 r0.11, r0.11, 0x10
add.0 r0.24, r0.24, r0.31
add.0 r0.32, r0.32, r0.25
shl.0 r0.12, r0.26, 0x10
;
add.0 r0.9, r0.9, r0.2
shru.0 r0.18, r0.26, 0x10
cmpltu.0 r0.27, r0.26, r0.27
cmpltu.0 r0.29, r0.20, r0.29
;
stw.0 r0.1[0x48], r0.15
;
cmpltu.0 r0.31, r0.24, r0.31
add.0 r0.28, r0.28, r0.12
stw.0 r0.1[0x34], r0.20
;
add.0 r0.23, r0.23, r0.9
shl.0 r0.27, r0.27, 0x10
add.0 r0.18, r0.18, r0.30
add.0 r0.19, r0.19, r0.29
;
;
add.0 r0.11, r0.11, r0.31
cmpltu.0 r0.12, r0.28, r0.12
;
add.0 r0.23, r0.23, r0.24
add.0 r0.16, r0.16, r0.19
;
;
add.0 r0.32, r0.32, r0.11
add.0 r0.27, r0.27, r0.12
;
cmpltu.0 r0.24, r0.23, r0.24
add.0 r0.2, r0.20, r0.23
;
;
add.0 r0.18, r0.18, r0.27
;
add.0 r0.32, r0.32, r0.24
stw.0 r0.1[0x44], r0.2
cmpltu.0 r0.20, r0.2, r0.20
or.0 r0.17, r0.2, r0.17
;
;
;
add.0 r0.32, r0.28, r0.32
stw.0 r0.1[0x40], r0.17
add.0 r0.16, r0.16, r0.20
cmpne.0 r0.2, r0.17, r0.0
;
;
;
cmpltu.0 r0.28, r0.32, r0.28
add.0 r0.9, r0.32, r0.16
stw.0 r0.1[0x2c], r0.16
;
;
;
add.0 r0.18, r0.18, r0.28
cmpltu.0 r0.32, r0.9, r0.32
add.0 r0.13, r0.13, r0.9
stw.0 r0.1[0x38], r0.9
;
;
;
add.0 r0.18, r0.18, r0.32
cmpltu.0 r0.9, r0.13, r0.9
shl.0 r0.12, r0.13, 0x1f
shru.0 r0.11, r0.13, 0x1
;
stw.0 r0.1[0x3c], r0.13
;
;
add.0 r0.14, r0.14, r0.9
stw.0 r0.1[0x30], r0.18
or.0 r0.12, r0.12, r0.2
;
;
;
add.0 r0.14, r0.14, r0.18
;
;
;
cmpgeu.0 b0.0, r0.14, 0x200000
shl.0 r0.9, r0.14, 0x1f
shru.0 r0.2, r0.14, 0x1
;
stw.0 r0.1[0x28], r0.14
;
;
or.0 r0.11, r0.11, r0.9
brf.0 b0.0, floatlib_L207?3
;
stw.0 r0.1[0x28], r0.2
add.0 r0.4, r0.8, 0x1
;
ldw.0 r0.5, r0.1[0x28]
;
stw.0 r0.1[0x3c], r0.11
;
ldw.0 r0.6, r0.1[0x3c]
;
stw.0 r0.1[0x40], r0.12
;
-- floatlib_L208?3
ldw.0 r0.7, r0.1[0x40]
;
;
.call roundAndPackFloat64 arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_roundAndPackFloat64
;
ldw.0 l0.0, r0.1[0x50]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L207?3
ldw.0 r0.5, r0.1[0x28]
mov.0 r0.3, r0.10
mov.0 r0.4, r0.8
;
ldw.0 r0.6, r0.1[0x3c]
;
goto.0 floatlib_L208?3
;
-- floatlib_L205?3
ldw.0 r0.7, r0.1[0x18]
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
mov.0 r0.3, r0.10
;
ldw.0 r0.2, r0.1[0x14]
mov.0 r0.4, r0.0
;
;
;
or.0 r0.7, r0.7, r0.2
;
;
;
cmpeq.0 b0.0, r0.7, r0.0
;
;
;
brf.0 b0.0, floatlib_L209?3
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x50]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L209?3
add.0 r0.6, r0.1, 0x14
add.0 r0.7, r0.1, 0x18
add.0 r0.5, r0.1, 0x10
stw.0 r0.1[0x54], r0.10
;
ldw.0 r0.3, r0.1[0x14]
;
ldw.0 r0.4, r0.1[0x18]
;
;
.call normalizeFloat64Subnormal arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret()
call.0 l0.0, floatlib_FUNC_normalizeFloat64Subnormal
;
ldw.0 r0.2, r0.1[0x10]
;
ldw.0 r0.4, r0.1[0x20]
;
ldw.0 r0.15, r0.1[0x1c]
;
add.0 r0.8, r0.2, -0x400
ldw.0 r0.12, r0.1[0x14]
;
or.0 r0.14, r0.4, 0x100000
ldw.0 r0.16, r0.1[0x18]
;
ldw.0 r0.13, r0.1[0x24]
;
ldw.0 r0.3, r0.1[0x54]
;
;
;
mov.0 r0.10, r0.3
shl.0 r0.2, r0.16, 0xc
shru.0 r0.11, r0.16, 0x14
;
add.0 r0.8, r0.8, r0.15
goto.0 floatlib_L206?3
;
-- floatlib_L203?3
or.0 r0.4, r0.4, r0.9
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
mov.0 r0.3, r0.10
;
;
;
cmpeq.0 b0.0, r0.4, r0.0
mov.0 r0.4, r0.0
;
;
;
brf.0 b0.0, floatlib_L210?3
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x50]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L210?3
add.0 r0.6, r0.1, 0x20
add.0 r0.7, r0.1, 0x24
add.0 r0.5, r0.1, 0x1c
stw.0 r0.1[0x54], r0.10
;
ldw.0 r0.3, r0.1[0x20]
;
ldw.0 r0.4, r0.1[0x24]
;
;
.call normalizeFloat64Subnormal arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret()
call.0 l0.0, floatlib_FUNC_normalizeFloat64Subnormal
;
ldw.0 r0.2, r0.1[0x10]
;
ldw_d.0 r0.4, r0.1[0x10]
;
ldw_d.0 r0.5, r0.1[0x20]
;
cmpeq.0 b0.3, r0.2, r0.0
ldw_d.0 r0.15, r0.1[0x1c]
;
add.0 r0.8, r0.4, -0x400
ldw_d.0 r0.16, r0.1[0x18]
;
or.0 r0.14, r0.5, 0x100000
ldw_d.0 r0.13, r0.1[0x24]
;
ldw.0 r0.3, r0.1[0x54]
;
;
;
mov.0 r0.10, r0.3
ldw_d.0 r0.12, r0.1[0x14]
;
shl.0 r0.2, r0.16, 0xc
shru.0 r0.11, r0.16, 0x14
goto.0 floatlib_L204?3
;
-- floatlib_L202?3
ldw.0 r0.2, r0.1[0x18]
mov.0 r0.3, r0.11
;
ldw.0 r0.7, r0.1[0x14]
;
;
;
or.0 r0.2, r0.2, r0.7
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L211?3
;
.call propagateFloat64NaN arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_propagateFloat64NaN
;
ldw.0 l0.0, r0.1[0x50]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L211?3
ldw.0 r0.2, r0.1[0x24]
mov.0 r0.3, 0x10
;
ldw.0 r0.4, r0.1[0x1c]
;
ldw.0 r0.5, r0.1[0x20]
;
;
or.0 r0.2, r0.2, r0.4
;
;
;
or.0 r0.2, r0.2, r0.5
;
;
;
cmpeq.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L213?3
;
goto.0 floatlib_L212?3
;
-- floatlib_L213?3
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
mov.0 r0.3, r0.10
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
mov.0 r0.4, 0x7ff
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x50]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L201?3
ldw.0 r0.2, r0.1[0x10]
mov.0 r0.3, r0.11
;
ldw.0 r0.7, r0.1[0x18]
;
ldw.0 r0.8, r0.1[0x14]
;
ldw.0 r0.9, r0.1[0x24]
cmpeq.0 r0.2, r0.2, 0x7ff
;
ldw.0 r0.11, r0.1[0x20]
;
or.0 r0.7, r0.7, r0.8
;
;
or.0 r0.9, r0.9, r0.11
;
andl.0 r0.2, r0.2, r0.7
;
;
;
orl.0 b0.0, r0.9, r0.2
;
;
;
brf.0 b0.0, floatlib_L214?3
;
.call propagateFloat64NaN arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_propagateFloat64NaN
;
ldw.0 l0.0, r0.1[0x50]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L214?3
ldw.0 r0.2, r0.1[0x18]
mov.0 r0.3, 0x10
;
ldw.0 r0.5, r0.1[0x10]
;
ldw.0 r0.6, r0.1[0x14]
;
;
or.0 r0.2, r0.2, r0.5
;
;
;
or.0 r0.2, r0.2, r0.6
;
;
;
cmpeq.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L215?3
;
-- floatlib_L212?3
.call float_raise arg(r0.3) ret()
call.0 l0.0, floatlib_FUNC_float_raise
;
mov.0 r0.4, ~0x0
ldw.0 l0.0, r0.1[0x50]
mov.0 r0.3, 0x7fffffff
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x60, l0.0
;
-- floatlib_L215?3
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
mov.0 r0.3, r0.10
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
mov.0 r0.4, 0x7ff
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x50]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x60, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC__d_div
add.0 r0.1, r0.1, -0x80
shru.0 r0.2, r0.3, 0x14
shru.0 r0.12, r0.5, 0x14
;
and.0 r0.13, r0.3, 0xfffff
shru.0 r0.14, r0.3, 0x1f
stw.0 r0.1[0x74], l0.0
;
stw.0 r0.1[0x10], r0.4
and.0 r0.16, r0.5, 0xfffff
shru.0 r0.15, r0.5, 0x1f
;
and.0 r0.2, r0.2, 0x7ff
and.0 r0.12, r0.12, 0x7ff
;
ldw_d.0 r0.17, r0.1[0x10]
;
stw.0 r0.1[0x14], r0.13
xor.0 r0.18, r0.14, r0.15
;
cmpeq.0 b0.0, r0.2, 0x7ff
cmpeq.0 b0.1, r0.12, 0x7ff
;
cmpeq.0 b0.2, r0.12, r0.0
ldw_d.0 r0.19, r0.1[0x14]
shl.0 r0.21, r0.17, 0xb
shru.0 r0.20, r0.17, 0x15
;
stw.0 r0.1[0x78], r0.18
;
stw.0 r0.1[0x18], r0.2
;
ldw_d.0 r0.14, r0.1[0x18]
or.0 r0.19, r0.19, 0x100000
shru.0 r0.15, r0.21, 0x1
;
ldw_d.0 r0.17, r0.1[0x18]
;
stw.0 r0.1[0x24], r0.12
;
cmpeq.0 b0.3, r0.14, r0.0
ldw_d.0 r0.12, r0.1[0x24]
shl.0 r0.19, r0.19, 0xb
;
stw.0 r0.1[0x20], r0.6
add.0 r0.17, r0.17, 0x3fd
;
ldw_d.0 r0.18, r0.1[0x20]
;
stw.0 r0.1[0x1c], r0.16
or.0 r0.19, r0.19, r0.20
br.0 b0.0, floatlib_L216?3
;
sub.0 r0.17, r0.17, r0.12
ldw_d.0 r0.14, r0.1[0x1c]
br.0 b0.1, floatlib_L217?3
;
shl.0 r0.23, r0.18, 0xb
shru.0 r0.22, r0.18, 0x15
br.0 b0.2, floatlib_L218?3
;
-- floatlib_L219?3
shru.0 r0.2, r0.19, 0x1
shl.0 r0.13, r0.19, 0x1f
br.0 b0.3, floatlib_L220?3
;
-- floatlib_L221?3
stw.0 r0.1[0x14], r0.19
or.0 r0.14, r0.14, 0x100000
;
stw.0 r0.1[0x10], r0.21
cmpleu.0 r0.12, r0.23, r0.21
;
stw.0 r0.1[0x20], r0.23
or.0 r0.15, r0.15, r0.13
;
shl.0 r0.14, r0.14, 0xb
;
;
;
or.0 r0.14, r0.14, r0.22
;
;
;
stw.0 r0.1[0x1c], r0.14
cmpltu.0 r0.16, r0.14, r0.19
cmpeq.0 r0.13, r0.14, r0.19
;
ldw_d.0 r0.5, r0.1[0x1c]
;
;
andl.0 r0.13, r0.13, r0.12
;
;
;
orl.0 b0.0, r0.16, r0.13
;
;
;
brf.0 b0.0, floatlib_L222?3
;
stw.0 r0.1[0x14], r0.2
add.0 r0.19, r0.17, 0x1
;
ldw.0 r0.3, r0.1[0x14]
;
stw.0 r0.1[0x10], r0.15
;
-- floatlib_L223?3
stw.0 r0.1[0x7c], r0.19
;
ldw.0 r0.4, r0.1[0x10]
;
;
.call estimateDiv64To32 arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_estimateDiv64To32
;
ldw.0 r0.2, r0.1[0x20]
add.0 r0.5, r0.1, 0x28
add.0 r0.8, r0.3, ~0x0
mov.0 r0.10, ~0x0
;
ldw.0 r0.4, r0.1[0x1c]
add.0 r0.6, r0.1, 0x2c
add.0 r0.7, r0.1, 0x30
mov.0 r0.11, r0.0
;
mov.0 r0.9, r0.3
ldw.0 r0.12, r0.1[0x10]
mov.0 r0.20, r0.3
;
mpylhu.0 r0.13, r0.3, r0.2
mpylhu.0 r0.14, r0.2, r0.3
ldw.0 r0.15, r0.1[0x14]
;
mpyllu.0 r0.16, r0.2, r0.3
mpyhhu.0 r0.17, r0.2, r0.3
ldw.0 r0.18, r0.1[0x78]
;
stw.0 r0.1[0x34], r0.3
mpylhu.0 r0.19, r0.4, r0.3
mpylhu.0 r0.21, r0.3, r0.4
;
mpyllu.0 r0.22, r0.3, r0.4
add.0 r0.14, r0.13, r0.14
mpyhhu.0 r0.23, r0.3, r0.4
;
;
add.0 r0.19, r0.19, r0.21
;
shru.0 r0.25, r0.14, 0x10
cmpltu.0 r0.13, r0.14, r0.13
shl.0 r0.24, r0.14, 0x10
mov.0 r0.3, r0.2
;
;
shru.0 r0.26, r0.19, 0x10
cmpltu.0 r0.21, r0.19, r0.21
shl.0 r0.2, r0.19, 0x10
;
shl.0 r0.13, r0.13, 0x10
add.0 r0.16, r0.16, r0.24
add.0 r0.25, r0.25, r0.17
;
;
shl.0 r0.21, r0.21, 0x10
add.0 r0.22, r0.22, r0.2
add.0 r0.26, r0.26, r0.23
ldw.0 r0.19, r0.1[0x7c]
;
cmpltu.0 r0.24, r0.16, r0.24
stw.0 r0.1[0x38], r0.16
sub.0 r0.17, r0.0, r0.16
cmpgtu.0 r0.14, r0.16, r0.0
;
stw.0 r0.1[0x3c], r0.16
;
cmpltu.0 r0.2, r0.22, r0.2
stw.0 r0.1[0x48], r0.22
;
add.0 r0.13, r0.13, r0.24
stw.0 r0.1[0x30], r0.17
;
ldw.0 r0.17, r0.1[0x74]
;
add.0 r0.21, r0.21, r0.2
;
add.0 r0.25, r0.25, r0.13
;
;
add.0 r0.26, r0.26, r0.21
;
add.0 r0.25, r0.25, r0.22
;
;
;
stw.0 r0.1[0x40], r0.25
cmpltu.0 r0.22, r0.25, r0.22
sub.0 r0.2, r0.12, r0.25
cmpltu.0 r0.13, r0.12, r0.25
;
stw.0 r0.1[0x44], r0.25
;
;
add.0 r0.26, r0.26, r0.22
cmpltu.0 r0.12, r0.2, r0.14
sub.0 r0.16, r0.2, r0.14
sub.0 r0.15, r0.15, r0.13
;
;
;
stw.0 r0.1[0x4c], r0.26
add.0 r0.12, r0.26, r0.12
;
stw.0 r0.1[0x50], r0.26
;
stw.0 r0.1[0x2c], r0.16
;
sub.0 r0.15, r0.15, r0.12
;
;
;
stw.0 r0.1[0x28], r0.15
;
-- floatlib_L224?3
ldw_d.0 r0.2, r0.1[0x30]
;
ldw_d.0 r0.12, r0.1[0x2c]
;
ldw.0 r0.13, r0.1[0x28]
;
add.0 r0.14, r0.2, r0.3
;
add.0 r0.15, r0.12, r0.4
;
cmplt.0 b0.0, r0.13, r0.0
;
cmpltu.0 r0.2, r0.14, r0.2
;
cmpltu.0 r0.12, r0.15, r0.12
;
brf.0 b0.0, floatlib_L225?3
;
add.0 r0.15, r0.15, r0.2
stw.0 r0.7[0x0], r0.14
add.0 r0.9, r0.9, -0x2
;
ldw_d.0 r0.14, r0.1[0x30]
;
;
cmpltu.0 r0.2, r0.15, r0.2
stw.0 r0.6[0x0], r0.15
;
ldw_d.0 r0.16, r0.1[0x2c]
add.0 r0.15, r0.3, r0.14
;
;
add.0 r0.13, r0.13, r0.2
;
add.0 r0.2, r0.4, r0.16
cmpltu.0 r0.14, r0.15, r0.14
;
;
add.0 r0.13, r0.13, r0.12
;
cmpltu.0 r0.2, r0.2, r0.16
add.0 r0.12, r0.2, r0.14
;
;
stw.0 r0.5[0x0], r0.13
;
ldw.0 r0.13, r0.1[0x28]
cmpltu.0 r0.14, r0.12, r0.14
;
;
;
cmplt.0 b0.0, r0.13, r0.0
add.0 r0.13, r0.13, r0.14
;
;
;
add.0 r0.13, r0.13, r0.2
brf.0 b0.0, floatlib_L226?3
;
stw.0 r0.7[0x0], r0.15
add.0 r0.11, r0.11, -0x2
;
ldw_d.0 r0.2, r0.1[0x30]
;
stw.0 r0.6[0x0], r0.12
;
ldw_d.0 r0.12, r0.1[0x2c]
;
stw.0 r0.5[0x0], r0.13
add.0 r0.14, r0.3, r0.2
;
ldw.0 r0.13, r0.1[0x28]
;
add.0 r0.15, r0.4, r0.12
;
cmpltu.0 r0.2, r0.14, r0.2
;
cmplt.0 b0.0, r0.13, r0.0
;
cmpltu.0 r0.12, r0.15, r0.12
;
add.0 r0.15, r0.15, r0.2
;
brf.0 b0.0, floatlib_L227?3
;
stw.0 r0.7[0x0], r0.14
add.0 r0.8, r0.8, ~0x1
;
cmpltu.0 r0.2, r0.15, r0.2
ldw_d.0 r0.14, r0.1[0x30]
;
stw.0 r0.6[0x0], r0.15
;
ldw_d.0 r0.15, r0.1[0x2c]
;
add.0 r0.13, r0.13, r0.2
add.0 r0.2, r0.3, r0.14
;
;
add.0 r0.16, r0.4, r0.15
;
add.0 r0.13, r0.13, r0.12
cmpltu.0 r0.14, r0.2, r0.14
;
;
cmpltu.0 r0.15, r0.16, r0.15
;
stw.0 r0.5[0x0], r0.13
add.0 r0.16, r0.16, r0.14
;
ldw.0 r0.12, r0.1[0x28]
;
;
cmpltu.0 r0.14, r0.16, r0.14
;
cmplt.0 b0.0, r0.12, r0.0
;
;
add.0 r0.12, r0.12, r0.14
;
brf.0 b0.0, floatlib_L228?3
;
stw.0 r0.7[0x0], r0.2
add.0 r0.10, r0.10, ~0x1
;
add.0 r0.12, r0.12, r0.15
stw.0 r0.6[0x0], r0.16
;
;
;
stw.0 r0.5[0x0], r0.12
goto.0 floatlib_L224?3
;
-- floatlib_L228?3
mov.0 r0.11, r0.10
stw.0 r0.1[0x78], r0.18
goto.0 floatlib_L229?3
;
-- floatlib_L230?3
ldw_d.0 r0.2, r0.1[0x6c]
;
ldw_d.0 r0.12, r0.1[0x30]
;
ldw.0 r0.13, r0.1[0x2c]
;
add.0 r0.14, r0.2, r0.3
;
add.0 r0.15, r0.12, r0.4
;
cmplt.0 b0.0, r0.13, r0.0
;
cmpltu.0 r0.2, r0.14, r0.2
;
cmpltu.0 r0.12, r0.15, r0.12
;
brf.0 b0.0, floatlib_L231?3
;
add.0 r0.15, r0.15, r0.2
stw.0 r0.7[0x0], r0.14
add.0 r0.9, r0.9, -0x2
;
ldw_d.0 r0.14, r0.1[0x6c]
;
;
cmpltu.0 r0.2, r0.15, r0.2
stw.0 r0.6[0x0], r0.15
;
ldw_d.0 r0.16, r0.1[0x30]
add.0 r0.15, r0.3, r0.14
;
;
add.0 r0.13, r0.13, r0.2
;
add.0 r0.2, r0.4, r0.16
cmpltu.0 r0.14, r0.15, r0.14
;
;
add.0 r0.13, r0.13, r0.12
;
cmpltu.0 r0.2, r0.2, r0.16
add.0 r0.12, r0.2, r0.14
;
;
stw.0 r0.5[0x0], r0.13
;
ldw.0 r0.13, r0.1[0x2c]
cmpltu.0 r0.14, r0.12, r0.14
;
;
;
cmplt.0 b0.0, r0.13, r0.0
add.0 r0.13, r0.13, r0.14
;
;
;
add.0 r0.13, r0.13, r0.2
brf.0 b0.0, floatlib_L232?3
;
stw.0 r0.7[0x0], r0.15
add.0 r0.11, r0.11, -0x2
;
ldw_d.0 r0.2, r0.1[0x6c]
;
stw.0 r0.6[0x0], r0.12
;
ldw_d.0 r0.12, r0.1[0x30]
;
stw.0 r0.5[0x0], r0.13
add.0 r0.14, r0.3, r0.2
;
ldw.0 r0.13, r0.1[0x2c]
;
add.0 r0.15, r0.4, r0.12
;
cmpltu.0 r0.2, r0.14, r0.2
;
cmplt.0 b0.0, r0.13, r0.0
;
cmpltu.0 r0.12, r0.15, r0.12
;
add.0 r0.15, r0.15, r0.2
;
brf.0 b0.0, floatlib_L233?3
;
stw.0 r0.7[0x0], r0.14
add.0 r0.8, r0.8, ~0x1
;
cmpltu.0 r0.2, r0.15, r0.2
ldw_d.0 r0.14, r0.1[0x6c]
;
stw.0 r0.6[0x0], r0.15
;
ldw_d.0 r0.15, r0.1[0x30]
;
add.0 r0.13, r0.13, r0.2
add.0 r0.2, r0.3, r0.14
;
;
add.0 r0.16, r0.4, r0.15
;
add.0 r0.13, r0.13, r0.12
cmpltu.0 r0.14, r0.2, r0.14
;
;
cmpltu.0 r0.15, r0.16, r0.15
;
stw.0 r0.5[0x0], r0.13
add.0 r0.16, r0.16, r0.14
;
ldw.0 r0.12, r0.1[0x2c]
;
;
cmpltu.0 r0.14, r0.16, r0.14
;
cmplt.0 b0.0, r0.12, r0.0
;
;
add.0 r0.12, r0.12, r0.14
;
brf.0 b0.0, floatlib_L234?3
;
stw.0 r0.7[0x0], r0.2
add.0 r0.10, r0.10, ~0x1
;
add.0 r0.12, r0.12, r0.15
stw.0 r0.6[0x0], r0.16
;
;
;
stw.0 r0.5[0x0], r0.12
goto.0 floatlib_L230?3
;
-- floatlib_L234?3
mov.0 r0.11, r0.10
stw.0 r0.1[0x7c], r0.19
mov.0 r0.3, r0.18
;
goto.0 floatlib_L235?3
;
-- floatlib_L237?3
goto.0 floatlib_L236?3
;
-- floatlib_L233?3
mov.0 r0.11, r0.10
mov.0 r0.9, r0.8
stw.0 r0.1[0x7c], r0.19
mov.0 r0.3, r0.18
;
goto.0 floatlib_L235?3
;
-- floatlib_L232?3
mov.0 r0.9, r0.8
stw.0 r0.1[0x7c], r0.19
mov.0 r0.3, r0.18
;
goto.0 floatlib_L235?3
;
-- floatlib_L231?3
mov.0 r0.3, r0.18
stw.0 r0.1[0x7c], r0.19
;
-- floatlib_L235?3
add.0 r0.9, r0.9, r0.11
stw.0 r0.1[0x74], r0.17
;
ldw_d.0 r0.2, r0.1[0x6c]
;
ldw_d.0 r0.4, r0.1[0x2c]
;
cmpne.0 b0.0, r0.9, r0.20
ldw_d.0 r0.5, r0.1[0x30]
;
;
or.0 r0.2, r0.2, r0.4
;
brf.0 b0.0, floatlib_L237?3
;
stw.0 r0.1[0x54], r0.9
;
-- floatlib_L236?3
ldw.0 r0.4, r0.1[0x54]
or.0 r0.2, r0.2, r0.5
;
;
;
cmpne.0 r0.2, r0.2, r0.0
;
;
;
or.0 r0.4, r0.4, r0.2
;
;
;
stw.0 r0.1[0x54], r0.4
;
ldw.0 r0.2, r0.1[0x34]
goto.0 floatlib_L238?3
;
-- floatlib_L239?3
ldw.0 r0.2, r0.1[0x34]
mov.0 r0.3, r0.18
;
-- floatlib_L238?3
ldw.0 r0.8, r0.1[0x54]
;
ldw.0 r0.4, r0.1[0x7c]
;
shl.0 r0.9, r0.2, 0x15
shru.0 r0.5, r0.2, 0xb
;
shl.0 r0.7, r0.8, 0x15
shru.0 r0.10, r0.8, 0xb
;
;
stw.0 r0.1[0x34], r0.5
;
stw.0 r0.1[0x70], r0.7
or.0 r0.6, r0.9, r0.10
;
;
;
.call roundAndPackFloat64 arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret(r0.3,r0.4)
stw.0 r0.1[0x54], r0.6
call.0 l0.0, floatlib_FUNC_roundAndPackFloat64
;
ldw.0 l0.0, r0.1[0x74]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x80, l0.0
;
-- floatlib_L241?3
.call estimateDiv64To32 arg(r0.3,r0.4,r0.5) ret(r0.3)
call.0 l0.0, floatlib_FUNC_estimateDiv64To32
;
goto.0 floatlib_L240?3
;
-- floatlib_L227?3
mov.0 r0.11, r0.10
mov.0 r0.9, r0.8
stw.0 r0.1[0x78], r0.18
goto.0 floatlib_L229?3
;
-- floatlib_L226?3
mov.0 r0.9, r0.8
stw.0 r0.1[0x78], r0.18
;
goto.0 floatlib_L229?3
;
-- floatlib_L225?3
stw.0 r0.1[0x78], r0.18
;
-- floatlib_L229?3
add.0 r0.9, r0.9, r0.11
stw.0 r0.1[0x7c], r0.19
;
stw.0 r0.1[0x74], r0.17
;
ldw_d.0 r0.3, r0.1[0x2c]
;
cmpne.0 b0.0, r0.9, r0.20
ldw_d.0 r0.4, r0.1[0x30]
;
ldw_d.0 r0.5, r0.1[0x1c]
;
;
brf.0 b0.0, floatlib_L241?3
;
.call estimateDiv64To32 arg(r0.3,r0.4,r0.5) ret(r0.3)
stw.0 r0.1[0x34], r0.9
call.0 l0.0, floatlib_FUNC_estimateDiv64To32
;
-- floatlib_L240?3
and.0 r0.12, r0.3, 0x3ff
ldw_d.0 r0.2, r0.1[0x20]
mov.0 r0.10, ~0x0
;
ldw_d.0 r0.4, r0.1[0x1c]
add.0 r0.5, r0.1, 0x2c
add.0 r0.6, r0.1, 0x30
add.0 r0.8, r0.3, ~0x0
;
mov.0 r0.9, r0.3
ldw_d.0 r0.13, r0.1[0x30]
add.0 r0.7, r0.1, 0x6c
mov.0 r0.11, r0.0
;
cmpleu.0 b0.0, r0.12, 0x4
mpylhu.0 r0.14, r0.3, r0.2
mpylhu.0 r0.15, r0.2, r0.3
ldw_d.0 r0.16, r0.1[0x2c]
;
mpyllu.0 r0.19, r0.2, r0.3
mpyhhu.0 r0.20, r0.2, r0.3
ldw.0 r0.18, r0.1[0x78]
;
mpylhu.0 r0.21, r0.4, r0.3
mpylhu.0 r0.22, r0.3, r0.4
ldw.0 r0.17, r0.1[0x74]
;
stw.0 r0.1[0x54], r0.3
mpyllu.0 r0.12, r0.4, r0.3
add.0 r0.15, r0.14, r0.15
mpyhhu.0 r0.23, r0.3, r0.4
;
brf.0 b0.0, floatlib_L239?3
;
add.0 r0.21, r0.21, r0.22
;
shru.0 r0.25, r0.15, 0x10
cmpltu.0 r0.14, r0.15, r0.14
shl.0 r0.24, r0.15, 0x10
;
;
shru.0 r0.27, r0.21, 0x10
cmpltu.0 r0.22, r0.21, r0.22
shl.0 r0.26, r0.21, 0x10
;
shl.0 r0.14, r0.14, 0x10
add.0 r0.19, r0.19, r0.24
add.0 r0.25, r0.25, r0.20
;
;
shl.0 r0.22, r0.22, 0x10
add.0 r0.12, r0.12, r0.26
add.0 r0.27, r0.27, r0.23
;
cmpltu.0 r0.24, r0.19, r0.24
stw.0 r0.1[0x58], r0.19
sub.0 r0.20, r0.0, r0.19
cmpgtu.0 r0.15, r0.19, r0.0
;
stw.0 r0.1[0x5c], r0.19
;
cmpltu.0 r0.26, r0.12, r0.26
stw.0 r0.1[0x64], r0.12
;
add.0 r0.14, r0.14, r0.24
stw.0 r0.1[0x6c], r0.20
;
ldw.0 r0.19, r0.1[0x7c]
mov.0 r0.20, r0.3
;
add.0 r0.22, r0.22, r0.26
mov.0 r0.3, r0.2
;
add.0 r0.25, r0.25, r0.14
;
;
add.0 r0.27, r0.27, r0.22
;
add.0 r0.25, r0.25, r0.12
;
;
;
stw.0 r0.1[0x60], r0.25
cmpltu.0 r0.12, r0.25, r0.12
sub.0 r0.2, r0.13, r0.25
cmpltu.0 r0.14, r0.13, r0.25
;
stw.0 r0.1[0x3c], r0.25
;
;
add.0 r0.27, r0.27, r0.12
cmpltu.0 r0.13, r0.2, r0.15
sub.0 r0.21, r0.2, r0.15
sub.0 r0.16, r0.16, r0.14
;
;
;
stw.0 r0.1[0x44], r0.27
add.0 r0.13, r0.27, r0.13
;
stw.0 r0.1[0x68], r0.27
;
stw.0 r0.1[0x30], r0.21
;
sub.0 r0.16, r0.16, r0.13
;
;
;
stw.0 r0.1[0x2c], r0.16
goto.0 floatlib_L230?3
;
-- floatlib_L222?3
mov.0 r0.19, r0.17
ldw.0 r0.3, r0.1[0x14]
;
goto.0 floatlib_L223?3
;
-- floatlib_L220?3
ldw.0 r0.7, r0.1[0x10]
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
mov.0 r0.4, r0.0
;
ldw.0 r0.8, r0.1[0x14]
;
ldw.0 r0.3, r0.1[0x78]
;
;
or.0 r0.7, r0.7, r0.8
;
;
;
cmpeq.0 b0.0, r0.7, r0.0
;
;
;
brf.0 b0.0, floatlib_L242?3
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x74]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x80, l0.0
;
-- floatlib_L242?3
ldw.0 r0.3, r0.1[0x14]
add.0 r0.6, r0.1, 0x14
add.0 r0.7, r0.1, 0x10
add.0 r0.5, r0.1, 0x18
;
ldw.0 r0.4, r0.1[0x10]
;
;
.call normalizeFloat64Subnormal arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret()
call.0 l0.0, floatlib_FUNC_normalizeFloat64Subnormal
;
ldw.0 r0.2, r0.1[0x14]
;
ldw.0 r0.3, r0.1[0x10]
;
ldw.0 r0.4, r0.1[0x18]
;
ldw.0 r0.12, r0.1[0x24]
or.0 r0.2, r0.2, 0x100000
;
shl.0 r0.21, r0.3, 0xb
shru.0 r0.20, r0.3, 0x15
ldw.0 r0.14, r0.1[0x1c]
;
add.0 r0.4, r0.4, 0x3fd
ldw.0 r0.18, r0.1[0x20]
;
shl.0 r0.2, r0.2, 0xb
;
shru.0 r0.15, r0.21, 0x1
;
sub.0 r0.17, r0.4, r0.12
;
or.0 r0.19, r0.2, r0.20
;
;
shl.0 r0.23, r0.18, 0xb
shru.0 r0.22, r0.18, 0x15
;
shru.0 r0.2, r0.19, 0x1
shl.0 r0.13, r0.19, 0x1f
goto.0 floatlib_L221?3
;
-- floatlib_L218?3
or.0 r0.6, r0.6, r0.16
or.0 r0.4, r0.4, r0.2
mov.0 r0.3, 0x10
;
;
;
cmpeq.0 b0.0, r0.6, r0.0
or.0 r0.4, r0.4, r0.13
;
;
;
cmpeq.0 b0.0, r0.4, r0.0
brf.0 b0.0, floatlib_L243?3
;
;
;
brf.0 b0.0, floatlib_L244?3
;
-- floatlib_L245?3
.call float_raise arg(r0.3) ret()
call.0 l0.0, floatlib_FUNC_float_raise
;
mov.0 r0.4, ~0x0
ldw.0 l0.0, r0.1[0x74]
mov.0 r0.3, 0x7fffffff
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x80, l0.0
;
-- floatlib_L244?3
.call float_raise arg(r0.3) ret()
mov.0 r0.3, 0x80
call.0 l0.0, floatlib_FUNC_float_raise
;
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
ldw.0 r0.3, r0.1[0x78]
;
mov.0 r0.4, 0x7ff
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x74]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x80, l0.0
;
-- floatlib_L243?3
ldw.0 r0.3, r0.1[0x1c]
add.0 r0.6, r0.1, 0x1c
add.0 r0.7, r0.1, 0x20
add.0 r0.5, r0.1, 0x24
;
ldw.0 r0.4, r0.1[0x20]
;
;
.call normalizeFloat64Subnormal arg(r0.3,r0.4,r0.5,r0.6,r0.7) ret()
call.0 l0.0, floatlib_FUNC_normalizeFloat64Subnormal
;
ldw_d.0 r0.2, r0.1[0x14]
;
ldw_d.0 r0.3, r0.1[0x10]
;
ldw.0 r0.14, r0.1[0x18]
;
ldw_d.0 r0.4, r0.1[0x18]
or.0 r0.2, r0.2, 0x100000
;
ldw_d.0 r0.12, r0.1[0x24]
shl.0 r0.21, r0.3, 0xb
shru.0 r0.20, r0.3, 0x15
;
cmpeq.0 b0.3, r0.14, r0.0
ldw_d.0 r0.18, r0.1[0x20]
;
add.0 r0.17, r0.4, 0x3fd
shl.0 r0.2, r0.2, 0xb
;
shru.0 r0.15, r0.21, 0x1
;
;
or.0 r0.19, r0.2, r0.20
;
sub.0 r0.17, r0.17, r0.12
ldw_d.0 r0.14, r0.1[0x1c]
;
shl.0 r0.23, r0.18, 0xb
shru.0 r0.22, r0.18, 0x15
goto.0 floatlib_L219?3
;
-- floatlib_L217?3
ldw.0 r0.2, r0.1[0x20]
;
ldw.0 r0.7, r0.1[0x1c]
;
;
;
or.0 r0.2, r0.2, r0.7
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L246?3
;
.call propagateFloat64NaN arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_propagateFloat64NaN
;
ldw.0 l0.0, r0.1[0x74]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x80, l0.0
;
-- floatlib_L246?3
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
mov.0 r0.4, r0.0
ldw.0 r0.3, r0.1[0x78]
;
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x74]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x80, l0.0
;
-- floatlib_L216?3
ldw.0 r0.2, r0.1[0x10]
;
ldw.0 r0.7, r0.1[0x14]
;
;
;
or.0 r0.2, r0.2, r0.7
;
;
;
cmpne.0 b0.0, r0.2, r0.0
;
;
;
brf.0 b0.0, floatlib_L247?3
;
.call propagateFloat64NaN arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_propagateFloat64NaN
;
ldw.0 l0.0, r0.1[0x74]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x80, l0.0
;
-- floatlib_L247?3
ldw.0 r0.2, r0.1[0x24]
;
ldw_d.0 r0.7, r0.1[0x20]
;
ldw_d.0 r0.8, r0.1[0x1c]
;
cmpeq.0 b0.0, r0.2, 0x7ff
;
;
or.0 r0.7, r0.7, r0.8
;
brf.0 b0.0, floatlib_L248?3
;
;
cmpne.0 b0.0, r0.7, r0.0
;
;
;
brf.0 b0.0, floatlib_L249?3
;
.call propagateFloat64NaN arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_propagateFloat64NaN
;
ldw.0 l0.0, r0.1[0x74]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x80, l0.0
;
-- floatlib_L249?3
mov.0 r0.3, 0x10
goto.0 floatlib_L245?3
;
-- floatlib_L248?3
mov.0 r0.5, r0.0
mov.0 r0.6, r0.0
ldw.0 r0.3, r0.1[0x78]
;
mov.0 r0.4, 0x7ff
;
.call packFloat64 arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, floatlib_FUNC_packFloat64
;
ldw.0 l0.0, r0.1[0x74]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x80, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC__d_eq
add.0 r0.1, r0.1, -0x20
shru.0 r0.2, r0.3, 0x14
shru.0 r0.7, r0.5, 0x14
;
and.0 r0.8, r0.3, 0xfffff
or.0 r0.9, r0.3, r0.5
stw.0 r0.1[0x10], l0.0
;
and.0 r0.10, r0.5, 0xfffff
cmpeq.0 r0.12, r0.4, r0.6
cmpeq.0 r0.11, r0.3, r0.5
;
and.0 r0.2, r0.2, 0x7ff
and.0 r0.7, r0.7, 0x7ff
;
or.0 r0.8, r0.4, r0.8
shl.0 r0.9, r0.9, 0x1
;
or.0 r0.10, r0.6, r0.10
;
cmpeq.0 r0.2, r0.2, 0x7ff
cmpeq.0 r0.7, r0.7, 0x7ff
;
norl.0 r0.9, r0.4, r0.9
;
;
andl.0 r0.2, r0.2, r0.8
andl.0 r0.7, r0.7, r0.10
;
orl.0 r0.11, r0.11, r0.9
;
;
orl.0 b0.0, r0.2, r0.7
;
andl.0 r0.12, r0.12, r0.11
;
;
br.0 b0.0, floatlib_L250?3
;
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.12
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L250?3
shru.0 r0.2, r0.3, 0x13
and.0 r0.7, r0.3, 0x7ffff
shru.0 r0.8, r0.5, 0x13
;
and.0 r0.9, r0.5, 0x7ffff
;
;
and.0 r0.2, r0.2, 0xfff
orl.0 r0.7, r0.7, r0.4
mov.0 r0.3, 0x10
;
and.0 r0.8, r0.8, 0xfff
orl.0 r0.9, r0.9, r0.6
;
;
cmpeq.0 r0.2, r0.2, 0xffe
;
cmpeq.0 r0.8, r0.8, 0xffe
;
;
andl.0 r0.2, r0.2, r0.7
;
andl.0 r0.8, r0.8, r0.9
;
;
;
orl.0 b0.0, r0.2, r0.8
;
;
;
brf.0 b0.0, floatlib_L251?3
;
.call float_raise arg(r0.3) ret()
call.0 l0.0, floatlib_FUNC_float_raise
;
-- floatlib_L251?3
mov.0 r0.3, r0.0
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC__d_le
add.0 r0.1, r0.1, -0x20
shru.0 r0.2, r0.3, 0x14
shru.0 r0.7, r0.5, 0x14
;
and.0 r0.8, r0.3, 0xfffff
shru.0 r0.9, r0.3, 0x1f
stw.0 r0.1[0x10], l0.0
;
and.0 r0.10, r0.5, 0xfffff
shru.0 r0.11, r0.5, 0x1f
or.0 r0.12, r0.3, r0.5
;
and.0 r0.2, r0.2, 0x7ff
and.0 r0.7, r0.7, 0x7ff
;
or.0 r0.8, r0.4, r0.8
;
or.0 r0.10, r0.6, r0.10
cmpne.0 b0.0, r0.9, r0.11
shl.0 r0.12, r0.12, 0x1
;
cmpeq.0 r0.2, r0.2, 0x7ff
cmpeq.0 r0.7, r0.7, 0x7ff
;
;
or.0 r0.12, r0.4, r0.12
;
andl.0 r0.2, r0.2, r0.8
andl.0 r0.7, r0.7, r0.10
;
;
or.0 r0.12, r0.12, r0.6
;
orl.0 b0.1, r0.2, r0.7
;
;
cmpeq.0 r0.12, r0.12, r0.0
;
br.0 b0.1, floatlib_L252?3
;
brf.0 b0.0, floatlib_L253?3
;
orl.0 r0.3, r0.9, r0.12
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L253?3
cmpltu.0 r0.8, r0.5, r0.3
cmpeq.0 r0.2, r0.5, r0.3
cmpeq.0 r0.10, r0.3, r0.5
cmpleu.0 r0.7, r0.6, r0.4
;
cmpltu.0 r0.3, r0.3, r0.5
cmpleu.0 r0.4, r0.4, r0.6
mtb.0 b0.0, r0.9
;
;
andl.0 r0.2, r0.2, r0.7
;
andl.0 r0.10, r0.10, r0.4
;
;
orl.0 r0.8, r0.8, r0.2
;
orl.0 r0.3, r0.3, r0.10
;
;
;
slct.0 r0.3, b0.0, r0.8, r0.3
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L252?3
.call float_raise arg(r0.3) ret()
mov.0 r0.3, 0x10
call.0 l0.0, floatlib_FUNC_float_raise
;
mov.0 r0.3, r0.0
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC__d_lt
add.0 r0.1, r0.1, -0x20
shru.0 r0.2, r0.3, 0x14
shru.0 r0.7, r0.5, 0x14
;
and.0 r0.8, r0.3, 0xfffff
shru.0 r0.9, r0.3, 0x1f
stw.0 r0.1[0x10], l0.0
;
and.0 r0.10, r0.5, 0xfffff
shru.0 r0.11, r0.5, 0x1f
or.0 r0.12, r0.3, r0.5
;
and.0 r0.2, r0.2, 0x7ff
and.0 r0.7, r0.7, 0x7ff
;
or.0 r0.8, r0.4, r0.8
;
or.0 r0.10, r0.6, r0.10
cmpne.0 b0.0, r0.9, r0.11
shl.0 r0.12, r0.12, 0x1
;
cmpeq.0 r0.2, r0.2, 0x7ff
cmpeq.0 r0.7, r0.7, 0x7ff
;
;
or.0 r0.12, r0.4, r0.12
;
andl.0 r0.2, r0.2, r0.8
andl.0 r0.7, r0.7, r0.10
;
;
or.0 r0.12, r0.12, r0.6
;
orl.0 b0.1, r0.2, r0.7
;
;
andl.0 r0.12, r0.9, r0.12
;
br.0 b0.1, floatlib_L254?3
;
brf.0 b0.0, floatlib_L255?3
;
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.12
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L255?3
cmpltu.0 r0.8, r0.5, r0.3
cmpeq.0 r0.2, r0.5, r0.3
cmpeq.0 r0.10, r0.3, r0.5
cmpltu.0 r0.7, r0.6, r0.4
;
cmpltu.0 r0.3, r0.3, r0.5
cmpltu.0 r0.4, r0.4, r0.6
mtb.0 b0.0, r0.9
;
;
andl.0 r0.2, r0.2, r0.7
;
andl.0 r0.10, r0.10, r0.4
;
;
orl.0 r0.8, r0.8, r0.2
;
orl.0 r0.3, r0.3, r0.10
;
;
;
slct.0 r0.3, b0.0, r0.8, r0.3
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
-- floatlib_L254?3
.call float_raise arg(r0.3) ret()
mov.0 r0.3, 0x10
call.0 l0.0, floatlib_FUNC_float_raise
;
mov.0 r0.3, r0.0
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3) ret()
-- FUNC__r_neg
xor.0 r0.3, r0.3, ~0x7fffffff
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3) ret()
-- FUNC__r_recip
add.0 r0.1, r0.1, -0x20
mov.0 r0.4, r0.3
;
.call _r_div arg(r0.3,r0.4) ret(r0.3)
stw.0 r0.1[0x10], l0.0
mov.0 r0.3, 0x3f800000
call.0 l0.0, FUNC__r_div
;
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__r_ne
add.0 r0.1, r0.1, -0x20
;
.call _r_eq arg(r0.3,r0.4) ret(r0.3)
stw.0 r0.1[0x10], l0.0
call.0 l0.0, FUNC__r_eq
;
cmpeq.0 r0.3, r0.3, r0.0
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__r_gt
add.0 r0.1, r0.1, -0x20
mov.0 r0.3, r0.4
mov.0 r0.2, r0.3
;
.call _r_lt arg(r0.3,r0.4) ret(r0.3)
stw.0 r0.1[0x10], l0.0
mov.0 r0.4, r0.2
call.0 l0.0, FUNC__r_lt
;
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__r_ge
add.0 r0.1, r0.1, -0x20
mov.0 r0.3, r0.4
mov.0 r0.2, r0.3
;
.call _r_le arg(r0.3,r0.4) ret(r0.3)
stw.0 r0.1[0x10], l0.0
mov.0 r0.4, r0.2
call.0 l0.0, FUNC__r_le
;
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__d_neg
xor.0 r0.3, r0.3, ~0x7fffffff
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__d_recip
add.0 r0.1, r0.1, -0x20
mov.0 r0.6, r0.4
mov.0 r0.5, r0.3
;
mov.0 r0.4, r0.0
stw.0 r0.1[0x10], l0.0
mov.0 r0.3, 0x3ff00000
;
.call _d_div arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3,r0.4)
call.0 l0.0, FUNC__d_div
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3,r0.4)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC__d_ne
add.0 r0.1, r0.1, -0x20
;
.call _d_eq arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
stw.0 r0.1[0x10], l0.0
call.0 l0.0, FUNC__d_eq
;
cmpeq.0 r0.3, r0.3, r0.0
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC__d_gt
add.0 r0.1, r0.1, -0x20
mov.0 r0.4, r0.6
mov.0 r0.2, r0.4
;
mov.0 r0.3, r0.5
stw.0 r0.1[0x10], l0.0
mov.0 r0.7, r0.3
mov.0 r0.6, r0.2
;
.call _d_lt arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.5, r0.7
call.0 l0.0, FUNC__d_lt
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC__d_ge
add.0 r0.1, r0.1, -0x20
mov.0 r0.4, r0.6
mov.0 r0.2, r0.4
;
mov.0 r0.3, r0.5
stw.0 r0.1[0x10], l0.0
mov.0 r0.7, r0.3
mov.0 r0.6, r0.2
;
.call _d_le arg(r0.3,r0.4,r0.5,r0.6) ret(r0.3)
mov.0 r0.5, r0.7
call.0 l0.0, FUNC__d_le
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3) ret()
-- FUNC__r_fix
add.0 r0.1, r0.1, -0x20
mov.0 r0.4, 0x1
;
.call float32_to_int32_round_to_zero arg(r0.3,r0.4) ret(r0.3)
stw.0 r0.1[0x10], l0.0
call.0 l0.0, floatlib_FUNC_float32_to_int32_round_to_zero
;
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3) ret()
-- FUNC__r_ufix
add.0 r0.1, r0.1, -0x20
mov.0 r0.4, r0.0
;
.call float32_to_int32_round_to_zero arg(r0.3,r0.4) ret(r0.3)
stw.0 r0.1[0x10], l0.0
call.0 l0.0, floatlib_FUNC_float32_to_int32_round_to_zero
;
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__d_fix
add.0 r0.1, r0.1, -0x20
mov.0 r0.5, 0x1
;
.call float64_to_int32_round_to_zero arg(r0.3,r0.4,r0.5) ret(r0.3)
stw.0 r0.1[0x10], l0.0
call.0 l0.0, floatlib_FUNC_float64_to_int32_round_to_zero
;
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC__d_ufix
add.0 r0.1, r0.1, -0x20
mov.0 r0.5, r0.0
;
.call float64_to_int32_round_to_zero arg(r0.3,r0.4,r0.5) ret(r0.3)
stw.0 r0.1[0x10], l0.0
call.0 l0.0, floatlib_FUNC_float64_to_int32_round_to_zero
;
;
;
ldw.0 l0.0, r0.1[0x10]
;
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x20, l0.0
;
.entry arg() ret()
-- FUNC_fpgetround
ldw.0 r0.3, r0.0[(floatlib_?1PACKET.2+0)]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_fpsetround
stw.0 r0.0[(floatlib_?1PACKET.2+0)], r0.3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg() ret()
-- FUNC_fpgetmask
ldw.0 r0.3, r0.0[(floatlib_?1PACKET.4+0)]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_fpsetmask
stw.0 r0.0[(floatlib_?1PACKET.4+0)], r0.3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg() ret()
-- FUNC_fpgetsticky
ldw.0 r0.3, r0.0[(floatlib_?1PACKET.3+0)]
;
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3) ret()
-- FUNC_fpsetsticky
stw.0 r0.0[(floatlib_?1PACKET.3+0)], r0.3
;
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
ENDOFFILE: floatlib
FILE: pthread
.entry arg(r0.3,r0.4,r0.5,r0.6) ret()
-- FUNC_vthread_create
asm.0 0x1 2X3 r0.2, r0.7, r0.4, r0.5, r0.6
;
;
;
stw.0 r0.3[0x0], r0.7
;
.return arg(return) ret(r0.3)
mov.0 r0.3, r0.2
return.0 r0.1, r0.1, 0x0, l0.0
;
.entry arg(r0.3,r0.4) ret()
-- FUNC_vthread_join
asm.0 0x2 2X1 r0.2, r0.5, r0.3
;
cmpne.0 b0.0, r0.4, r0.0
;
;
mov.0 r0.3, r0.2
;
brf.0 b0.0, pthread_L0?3
;
.return arg(return) ret(r0.3)
stw.0 r0.4[0x0], r0.5
return.0 r0.1, r0.1, 0x0, l0.0
;
-- pthread_L0?3
.return arg(return) ret(r0.3)
return.0 r0.1, r0.1, 0x0, l0.0
;
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
