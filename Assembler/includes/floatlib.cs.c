/* "" */
/* "Copyright (C) 1990-2007 Hewlett-Packard Company" */
/* "VEX C compiler version 3.41 (20070125 release)" */
/* "" */
/* "-dir /home/elds2/vex-3.41 -c -ms -mas_g -fexpand-div" */

/********************************************/
/*         SYSTEM HEADER                    */
/********************************************/

extern int sim_mem_probe(volatile unsigned int);
extern unsigned int sim_mem_access32(volatile unsigned int);
extern unsigned short sim_mem_access16(volatile unsigned int);
extern unsigned char sim_mem_access8(volatile unsigned int);
extern unsigned long long sim_cycle_counter;
extern unsigned long long sim_stall_counter;
extern unsigned long long sim_branch_stall;
extern unsigned long long sim_bundle_index[];
extern unsigned long long sim_oper_counter;
extern unsigned long long sim_bnt_counter;
extern unsigned long long sim_btc_counter;
extern unsigned long long sim_btu_counter;
extern unsigned long long sim_nop_counter;
extern unsigned int mem_trace_ld(unsigned int, unsigned int, unsigned int);
extern unsigned int mem_trace_st(unsigned int, unsigned int, unsigned int);
extern unsigned int mem_trace_pf(unsigned int, unsigned int, unsigned int);
extern unsigned int mem_trace_lds(unsigned int, unsigned int, unsigned int);
extern unsigned int mem_trace_sts(unsigned int, unsigned int, unsigned int);
extern unsigned int mem_trace_pfs(unsigned int, unsigned int, unsigned int);
extern void sim_ta_init(int);
/*         TRACING HANDLES                */
#define GOTO(x) /**/
#define CALL(x) /**/
#define ENTRY(x) /**/
#define RETURN(x) /**/
#define BRANCH(x) /**/
#define BRANCHF(x) /**/
#define LABEL(x) /**/
#define INC_STALL_CNT() sim_stall_counter += sim_branch_stall
#define INC_BNT_CNT() sim_bnt_counter++
#define INC_BTC_CNT() sim_btc_counter++
#define INC_BTU_CNT() sim_btu_counter++
#define INC_NOP_CNT(n) sim_nop_counter += (n)
#define INC_BUNDLE_CNT(index) sim_bundle_index[index]++
#define ADD_CYCLES(cycles)  sim_cycle_counter += (cycles)

typedef struct
{
  char *name;
  int length;
  int init;
  int offset;
  int linesize;
  int rta;
} sim_fileinfo_t;

extern int sim_init_fileinfo(sim_fileinfo_t *);
extern void sim_icache_fetch(int, int);
extern void sim_gprof_enter(int *, char *f);
extern void sim_gprof_start(int *);
extern void sim_gprof_stop(int *);
extern void sim_gprof_exit(int *);
/***********************************************/
/*         MACHINE MODEL HEADER                */
/***********************************************/

#define UINT8(s)  ((s) & 0xff)
#define INT8(s)   (((int) ((s) << 24)) >> 24)
#define UINT16(s) ((s) & 0xffff)
#define INT16(s)  (((int) ((s) << 16)) >> 16)
#define UINT32(s) ((unsigned int) (s))
#define INT32(s)  ((int) (s))


 		 /*  MEMORY MACROS */

#define ADDR8(a)  ((a) ^ 0x3)
#define ADDR16(a) ((a) ^ 0x2)
#define ADDR32(a) (a)
#define MEM8(a) (*((volatile unsigned char  *)(ADDR8(a))))
#define MEM16(a) (*((volatile unsigned short *)(ADDR16(a))))
#define MEM32(a) (*((volatile unsigned int *)(ADDR32(a))))
#define MEMSPEC8(a) sim_mem_access8(ADDR8(a))
#define MEMSPEC16(a) sim_mem_access16(ADDR16(a))
#define MEMSPEC32(a) sim_mem_access32(ADDR32(a))
#define LDBs(t,s1) t = INT8(MEMSPEC8(s1))
#define LDB(t,s1) t = INT8(MEM8(s1))
#define LDBUs(t,s1) t = UINT8(MEMSPEC8(s1))
#define LDBU(t,s1) t = UINT8(MEM8(s1))
#define LDHs(t,s1) t = INT16(MEMSPEC16(s1))
#define LDH(t,s1) t = INT16(MEM16(s1))
#define LDHUs(t,s1) t = UINT16(MEMSPEC16(s1))
#define LDHU(t,s1) t = UINT16(MEM16(s1))
#define LDWs(t,s1) t = INT32(MEMSPEC32(s1))
#define LDW(t,s1) t = INT32(MEM32(s1))
#define STB(t,s1) MEM8(t) = UINT8(s1)
#define STH(t,s1) MEM16(t) = UINT16(s1)
#define STW(t,s1) MEM32(t) = UINT32(s1)


 		 /*  INSTRUCTION MACROS */

#define MULL(t,s1,s2) t = (s1) * INT16(s2)
#define MULLU(t,s1,s2) t = (s1) * UINT16(s2)
#define MULH(t,s1,s2) t = (s1) * INT16((s2) >> 16)
#define MULHU(t,s1,s2) t = (s1) * UINT16((s2) >> 16)
#define MULHS(t,s1,s2) t = ((s1) * UINT16((s2) >> 16)) << 16
#define MULLL(t,s1,s2)  t = INT16(s1) * INT16(s2)
#define MULLLU(t,s1,s2) t = UINT16(s1) * UINT16(s2)
#define MULLH(t,s1,s2)  t = INT16(s1) * INT16((s2) >> 16)
#define MULLHU(t,s1,s2) t = UINT16(s1) * UINT16((s2) >> 16)
#define MULHH(t,s1,s2)  t = INT16((s1) >> 16) * INT16((s2) >> 16)
#define MULHHU(t,s1,s2) t = UINT16((s1) >> 16) * UINT16((s2) >> 16)
#define ADD(t,s1,s2) t = (s1) + (s2)
#define AND(t,s1,s2) t = (s1) & (s2)
#define ANDC(t,s1,s2) t = ~(s1) & (s2)
#define ANDL(t,s1,s2) t = ((((s1) == 0) | ((s2) == 0)) ? 0 : 1)
#define CMPEQ(t,s1,s2) t = ((s1) == (s2))
#define CMPGE(t,s1,s2) t = ((int) (s1) >= (int) (s2))
#define CMPGEU(t,s1,s2) t = ((unsigned int) (s1) >= (unsigned int) (s2))
#define CMPGT(t,s1,s2) t = ((int) (s1) > (int) (s2))
#define CMPGTU(t,s1,s2) t = ((unsigned int) (s1) > (unsigned int) (s2))
#define CMPLE(t,s1,s2) t = ((int) (s1) <= (int) (s2))
#define CMPLEU(t,s1,s2) t = ((unsigned int) (s1) <= (unsigned int) (s2))
#define CMPLT(t,s1,s2) t = ((int) (s1) < (int) (s2))
#define CMPLTU(t,s1,s2) t = ((unsigned int) (s1) < (unsigned int) (s2))
#define CMPNE(t,s1,s2) t = ( (s1) !=  (s2))
#define MAX(t,s1,s2) t = ((int) (s1) > (int) (s2)) ? (s1) : (s2)
#define MAXU(t,s1,s2) t = ((unsigned int) (s1) > (unsigned int) (s2)) ? (s1) : (s2)
#define MIN(t,s1,s2) t = ((int) (s1) < (int) (s2)) ? (s1) : (s2)
#define MINU(t,s1,s2) t = ((unsigned int) (s1) < (unsigned int) (s2)) ? (s1) : (s2)
#define MFB(t,s1) t = s1
#define MFL(t,s1) t = s1
#define MOV(t,s1) t = s1
#define MTL(t,s1) t = s1
#define MTB(t,s1) t = ((s1) == 0) ? 0 : 1
#define MTBINV(t,s1) t = ((s1) == 0) ? 1 : 0
#define MUL(t,s1,s2) t = (s1) * (s2)
#define NANDL(t,s1,s2) t = (((s1) == 0) | ((s2) == 0)) ? 1 : 0
#define NOP()
#define NORL(t,s1,s2) t = (((s1) == 0) & ((s2) == 0)) ? 1 : 0
#define ORL(t,s1,s2) t = (((s1) == 0) & ((s2) == 0)) ? 0 : 1
#define OR(t,s1,s2) t = (s1) | (s2)
#define ORC(t,s1,s2) t = (~(s1)) | (s2)
#define PFT(s1) (s1)
#define SBIT(t,s1,s2) t = (s1) | ((unsigned int) 1 << (s2))
#define SBITF(t,s1,s2) t = (s1) & ~((unsigned int) 1 << (s2))
#define SH1ADD(t,s1,s2) t = ((s1) << 1) + (s2)
#define SH2ADD(t,s1,s2) t = ((s1) << 2) + (s2)
#define SH3ADD(t,s1,s2) t = ((s1) << 3) + (s2)
#define SH4ADD(t,s1,s2) t = ((s1) << 4) + (s2)
#define SHL(t,s1,s2) t = ((int) (s1)) << (s2)
#define SHR(t,s1,s2) t = ((int) (s1)) >> (s2)
#define SHRU(t,s1,s2) t = ((unsigned int) (s1)) >> (s2)
#define SLCT(t,s1,s2,s3) t = (unsigned int) (((s1) != 0) ? (s2) : (s3))
#define SLCTF(t,s1,s2,s3) t = (unsigned int) (((s1) == 0) ? (s2) : (s3))
#define SUB(t,s1,s2) t = (s1) - (s2)
#define SXTB(t,s1) t = (unsigned int) (((signed int) ((s1) << 24)) >> 24)
#define SXTH(t,s1) t = (unsigned int) (((signed int) ((s1) << 16)) >> 16)
#define TBIT(t,s1,s2) t = ((s1) & ((unsigned int) 1 << (s2))) ? 1 : 0
#define TBITF(t,s1,s2) t = ((s1) & ((unsigned int) 1 << (s2))) ? 0 : 1
#define XNOP(s1)
#define XOR(t,s1,s2) t = (s1) ^ (s2)
#define ZXTB(t,s1) t = ((s1) & 0xff)
#define ZXTH(t,s1) t = ((s1) & 0xffff)
#define ADDCG(t,cout,s1,s2,cin) {\
    t = (s1) + (s2) + ((cin) & 0x1);\
    cout =   ((cin) & 0x1)\
           ? ((unsigned int) t <= (unsigned int) (s1))\
           : ((unsigned int) t <  (unsigned int) (s1));\
}
#define DIVS(t,cout,s1,s2,cin) {\
    unsigned int tmp = ((s1) << 1) | (cin);\
    cout = (unsigned int) (s1) >> 31;\
    t = cout ? tmp + (s2) : tmp - (s2);\
}
static sim_fileinfo_t t_thisfile;
extern void sim_asm_op0(int, ...);
extern unsigned int sim_asm_op1(int, ...);
typedef struct { unsigned int n0,n1; } sim_asm2_t;
extern sim_asm2_t sim_asm_op2(int, ...);
typedef struct { unsigned int n0,n1,n2; } sim_asm3_t;
extern sim_asm3_t sim_asm_op3(int, ...);
typedef struct { unsigned int n0,n1,n2,n3; } sim_asm4_t;
extern sim_asm4_t sim_asm_op4(int, ...);

/*********************************
            BSS SYMBOLS
*********************************/


/*********************************
            ENTRY SYMBOLS
*********************************/

typedef struct {
	unsigned int alias0;
	unsigned int alias1;
	unsigned int alias2;
} sim_result_0_t;
typedef struct {
	unsigned int alias0;
	unsigned int alias1;
} sim_result_1_t;
static unsigned int estimateDiv64To32( unsigned int, unsigned int, unsigned int );
static unsigned int countLeadingZeros32( unsigned int );
static  float_raise( unsigned int );
static sim_result_0_t  float32ToCommonNaN( unsigned int );
static unsigned int propagateFloat32NaN( unsigned int, unsigned int );
static sim_result_0_t  float64ToCommonNaN( unsigned int, unsigned int );
static sim_result_1_t  commonNaNToFloat64( unsigned int, unsigned int, unsigned int );
static sim_result_1_t  propagateFloat64NaN( unsigned int, unsigned int, unsigned int, unsigned int );
static unsigned int roundAndPackFloat32( unsigned int, unsigned int, unsigned int );
static unsigned int normalizeRoundAndPackFloat32( unsigned int, unsigned int, unsigned int );
static  normalizeFloat64Subnormal( unsigned int, unsigned int, unsigned int, unsigned int, unsigned int );
static sim_result_1_t  packFloat64( unsigned int, unsigned int, unsigned int, unsigned int );
static sim_result_1_t  roundAndPackFloat64( unsigned int, unsigned int, unsigned int, unsigned int, unsigned int );
static sim_result_1_t  normalizeRoundAndPackFloat64( unsigned int, unsigned int, unsigned int, unsigned int );
extern unsigned int _r_ilfloat( unsigned int );
extern unsigned int _r_ufloat( unsigned int );
extern sim_result_1_t  _d_ilfloat( unsigned int );
extern sim_result_1_t  _d_ufloat( unsigned int );
static unsigned int float32_to_int32_round_to_zero( unsigned int, unsigned int );
extern sim_result_1_t  _d_r( unsigned int );
static unsigned int addFloat32Sigs( unsigned int, unsigned int, unsigned int );
static unsigned int subFloat32Sigs( unsigned int, unsigned int, unsigned int );
extern unsigned int _r_add( unsigned int, unsigned int );
extern unsigned int _r_sub( unsigned int, unsigned int );
extern unsigned int _r_mul( unsigned int, unsigned int );
extern unsigned int _r_div( unsigned int, unsigned int );
extern unsigned int _r_eq( unsigned int, unsigned int );
extern unsigned int _r_le( unsigned int, unsigned int );
extern unsigned int _r_lt( unsigned int, unsigned int );
static unsigned int float64_to_int32_round_to_zero( unsigned int, unsigned int, unsigned int );
extern unsigned int _r_d( unsigned int, unsigned int );
static sim_result_1_t  addFloat64Sigs( unsigned int, unsigned int, unsigned int, unsigned int, unsigned int );
static sim_result_1_t  subFloat64Sigs( unsigned int, unsigned int, unsigned int, unsigned int, unsigned int );
extern sim_result_1_t  _d_add( unsigned int, unsigned int, unsigned int, unsigned int );
extern sim_result_1_t  _d_sub( unsigned int, unsigned int, unsigned int, unsigned int );
extern sim_result_1_t  _d_mul( unsigned int, unsigned int, unsigned int, unsigned int );
extern sim_result_1_t  _d_div( unsigned int, unsigned int, unsigned int, unsigned int );
extern unsigned int _d_eq( unsigned int, unsigned int, unsigned int, unsigned int );
extern unsigned int _d_le( unsigned int, unsigned int, unsigned int, unsigned int );
extern unsigned int _d_lt( unsigned int, unsigned int, unsigned int, unsigned int );
extern unsigned int _r_neg( unsigned int );
extern unsigned int _r_recip( unsigned int );
extern unsigned int _r_ne( unsigned int, unsigned int );
extern unsigned int _r_gt( unsigned int, unsigned int );
extern unsigned int _r_ge( unsigned int, unsigned int );
extern sim_result_1_t  _d_neg( unsigned int, unsigned int );
extern sim_result_1_t  _d_recip( unsigned int, unsigned int );
extern unsigned int _d_ne( unsigned int, unsigned int, unsigned int, unsigned int );
extern unsigned int _d_gt( unsigned int, unsigned int, unsigned int, unsigned int );
extern unsigned int _d_ge( unsigned int, unsigned int, unsigned int, unsigned int );
extern unsigned int _r_fix( unsigned int );
extern unsigned int _r_ufix( unsigned int );
extern unsigned int _d_fix( unsigned int, unsigned int );
extern unsigned int _d_ufix( unsigned int, unsigned int );
extern unsigned int fpgetround(  );
extern unsigned int fpsetround( unsigned int );
extern unsigned int fpgetmask(  );
extern unsigned int fpsetmask( unsigned int );
extern unsigned int fpgetsticky(  );
extern unsigned int fpsetsticky( unsigned int );

/*********************************
            DATA SYMBOLS
*********************************/

static unsigned int _X1PACKETX37[256]; 
static unsigned int _X1PACKETX3[1]; 
static unsigned int _X1PACKETX1[1]; 
static unsigned int _X1PACKETX2[1]; 
static unsigned int _X1PACKETX4[1]; 
static unsigned int _X1PACKETX37[256] = { 
	0x00000008,
	0x00000007,
	0x00000006,
	0x00000006,
	0x00000005,
	0x00000005,
	0x00000005,
	0x00000005,
	0x00000004,
	0x00000004,
	0x00000004,
	0x00000004,
	0x00000004,
	0x00000004,
	0x00000004,
	0x00000004,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000003,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000002,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000001,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000,
	0x00000000
}; 

static unsigned int _X1PACKETX3[1] = { 
	0x00000000
}; 

static unsigned int _X1PACKETX1[1] = { 
	0x00000000
}; 

static unsigned int _X1PACKETX2[1] = { 
	0x00000000
}; 

static unsigned int _X1PACKETX4[1] = { 
	0x00000000
}; 


/*********************************
            TEXT
*********************************/
extern unsigned int sim_create_stack(unsigned int, unsigned int);
extern void sim_check_stack(unsigned int, unsigned int);
extern void sim_bad_label(int);
extern unsigned int reg_b0_0;
extern unsigned int reg_b0_1;
extern unsigned int reg_b0_2;
extern unsigned int reg_b0_3;
extern unsigned int reg_b0_4;
extern unsigned int reg_b0_5;
extern unsigned int reg_b0_6;
extern unsigned int reg_l0_0;
extern unsigned int reg_r0_0;
extern unsigned int reg_r0_1;
extern unsigned int reg_r0_2;
extern unsigned int reg_r0_3;
extern unsigned int reg_r0_4;
extern unsigned int reg_r0_5;
extern unsigned int reg_r0_6;
extern unsigned int reg_r0_7;
extern unsigned int reg_r0_8;
extern unsigned int reg_r0_9;
extern unsigned int reg_r0_10;
extern unsigned int reg_r0_11;
extern unsigned int reg_r0_12;
extern unsigned int reg_r0_13;
extern unsigned int reg_r0_14;
extern unsigned int reg_r0_15;
extern unsigned int reg_r0_16;
extern unsigned int reg_r0_17;
extern unsigned int reg_r0_18;
extern unsigned int reg_r0_19;
extern unsigned int reg_r0_20;
extern unsigned int reg_r0_21;
extern unsigned int reg_r0_22;
extern unsigned int reg_r0_23;
extern unsigned int reg_r0_24;
extern unsigned int reg_r0_25;
extern unsigned int reg_r0_26;


static unsigned int estimateDiv64To32( unsigned int arg0, unsigned int arg1, unsigned int arg2 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(estimateDiv64To32);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_l0_0 = (108 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(0 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 20 */
   CMPLEU(reg_b0_0, reg_r0_5, reg_r0_3); /* line 21 */
   MOV(reg_r0_2, reg_r0_3); /* line 22 */
} /* line 22 */
  sim_icache_fetch(3 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_3, (unsigned int) -1); /* line 24 */
} /* line 24 */
  sim_icache_fetch(4 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L0X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 26 */
  sim_icache_fetch(5 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(estimateDiv64To32);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 29 */
l_L0X3: ;/* line 32 */
LABEL(l_L0X3);
  sim_icache_fetch(6 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHRU(reg_r0_11, reg_r0_5, (unsigned int) 16); /* line 33 */
   MTB(reg_b0_0, 0); /* line 34 */
   MOV(reg_r0_12, (unsigned int) -65536); /* line 35 */
} /* line 35 */
  sim_icache_fetch(10 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_15, reg_r0_11, (unsigned int) 16); /* line 37 */
   CMPLT(reg_r0_13, reg_r0_11, 0); /* line 38 */
   CMPGEU(reg_r0_14, reg_r0_2, reg_r0_11); /* line 39 */
   MOV(reg_r0_9, reg_r0_12); /* line 40 */
} /* line 40 */
  sim_icache_fetch(14 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_17, reg_r0_11, reg_r0_13); /* line 42 */
   SHRU(reg_r0_16, reg_r0_2, reg_r0_13); /* line 43 */
   CMPGTU(reg_b0_2, reg_r0_15, reg_r0_2); /* line 44 */
   MTB(reg_b0_1, reg_r0_13); /* line 45 */
} /* line 45 */
  sim_icache_fetch(18 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_3, reg_r0_5, (unsigned int) 16); /* line 47 */
   ADDCG(reg_r0_13, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_0); /* line 48 */
   MOV(reg_r0_6, reg_r0_1); /* line 49 */
   MOV(reg_r0_10, 0); /* line 50 */
} /* line 50 */
  sim_icache_fetch(22 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_13 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, 0, reg_r0_17, reg_b0_3); /* line 52 */
   ADDCG(reg_r0_16, reg_b0_4, t__i32_0, t__i32_0, reg_b0_0); /* line 53 */
} /* line 53 */
  sim_icache_fetch(24 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 55 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 56 */
} /* line 56 */
  sim_icache_fetch(26 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 58 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 59 */
} /* line 59 */
  sim_icache_fetch(28 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 61 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 62 */
} /* line 62 */
  sim_icache_fetch(30 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 64 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 65 */
} /* line 65 */
  sim_icache_fetch(32 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 67 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 68 */
} /* line 68 */
  sim_icache_fetch(34 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 70 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 71 */
} /* line 71 */
  sim_icache_fetch(36 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 73 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 74 */
} /* line 74 */
  sim_icache_fetch(38 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 76 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 77 */
} /* line 77 */
  sim_icache_fetch(40 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 79 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 80 */
} /* line 80 */
  sim_icache_fetch(42 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 82 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 83 */
} /* line 83 */
  sim_icache_fetch(44 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 85 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 86 */
} /* line 86 */
  sim_icache_fetch(46 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 88 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 89 */
} /* line 89 */
  sim_icache_fetch(48 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 91 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 92 */
} /* line 92 */
  sim_icache_fetch(50 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 94 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 95 */
} /* line 95 */
  sim_icache_fetch(52 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 97 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 98 */
} /* line 98 */
  sim_icache_fetch(54 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 100 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 101 */
} /* line 101 */
  sim_icache_fetch(56 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 103 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 104 */
} /* line 104 */
  sim_icache_fetch(58 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 106 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 107 */
} /* line 107 */
  sim_icache_fetch(60 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 109 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 110 */
} /* line 110 */
  sim_icache_fetch(62 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 112 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 113 */
} /* line 113 */
  sim_icache_fetch(64 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 115 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 116 */
} /* line 116 */
  sim_icache_fetch(66 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 118 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 119 */
} /* line 119 */
  sim_icache_fetch(68 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 121 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 122 */
} /* line 122 */
  sim_icache_fetch(70 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 124 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 125 */
} /* line 125 */
  sim_icache_fetch(72 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 127 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 128 */
} /* line 128 */
  sim_icache_fetch(74 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 130 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 131 */
} /* line 131 */
  sim_icache_fetch(76 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 133 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 134 */
} /* line 134 */
  sim_icache_fetch(78 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 136 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 137 */
} /* line 137 */
  sim_icache_fetch(80 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 139 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 140 */
} /* line 140 */
  sim_icache_fetch(82 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_3, reg_r0_13, reg_r0_17, reg_b0_3); /* line 142 */
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 143 */
} /* line 143 */
  sim_icache_fetch(84 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_13, reg_b0_4, reg_r0_13, reg_r0_17, reg_b0_4); /* line 145 */
   ADDCG(reg_r0_15, reg_b0_3, reg_r0_16, reg_r0_16, reg_b0_3); /* line 146 */
} /* line 146 */
  sim_icache_fetch(86 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADDCG(reg_r0_16, reg_b0_4, reg_r0_15, reg_r0_15, reg_b0_4); /* line 148 */
   CMPGE(reg_r0_13, reg_r0_13, 0); /* line 149 */
} /* line 149 */
  sim_icache_fetch(88 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORC(reg_r0_16, reg_r0_16, 0); /* line 151 */
} /* line 151 */
  sim_icache_fetch(89 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SH1ADD(reg_r0_16, reg_r0_16, reg_r0_13); /* line 153 */
} /* line 153 */
  sim_icache_fetch(90 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_14, reg_b0_1, reg_r0_14, reg_r0_16); /* line 155 */
} /* line 155 */
  sim_icache_fetch(91 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_14, reg_r0_14, (unsigned int) 16); /* line 157 */
} /* line 157 */
  sim_icache_fetch(92 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_8, reg_b0_2, reg_r0_14, reg_r0_12); /* line 159 */
} /* line 159 */
  sim_icache_fetch(93 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_7, reg_r0_8, reg_r0_12); /* line 161 */
   MULLHU(reg_r0_14, reg_r0_5, reg_r0_8); /* line 162 */
   MULLHU(reg_r0_13, reg_r0_8, reg_r0_5); /* line 163 */
} /* line 163 */
  sim_icache_fetch(96 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_5 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MULHHU(reg_r0_5, t__i32_0, reg_r0_8); /* line 165 */
   MULLLU(reg_r0_12, t__i32_0, reg_r0_8); /* line 166 */
} /* line 166 */
  sim_icache_fetch(98 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_14, reg_r0_13, reg_r0_14); /* line 168 */
} /* line 168 */
  sim_icache_fetch(99 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_14 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHRU(reg_r0_14, t__i32_0, (unsigned int) 16); /* line 170 */
   CMPLTU(reg_r0_13, t__i32_0, reg_r0_13); /* line 171 */
   SHL(reg_r0_15, t__i32_0, (unsigned int) 16); /* line 172 */
} /* line 172 */
  sim_icache_fetch(102 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_13, reg_r0_13, (unsigned int) 16); /* line 174 */
   ADD(reg_r0_12, reg_r0_12, reg_r0_15); /* line 175 */
   ADD(reg_r0_14, reg_r0_14, reg_r0_5); /* line 176 */
   ADD(reg_r0_5, reg_r0_1, (unsigned int) 4); /* line 177 */
} /* line 177 */
  sim_icache_fetch(106 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_4 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_15, reg_r0_12, reg_r0_15); /* line 179 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 8),0,4), reg_r0_12); /* line 180 */
   SUB(reg_r0_4, t__i32_0, reg_r0_12); /* line 181 */
   CMPLTU(reg_r0_16, t__i32_0, reg_r0_12); /* line 182 */
} /* line 182 */
  sim_icache_fetch(110 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_13, reg_r0_13, reg_r0_15); /* line 184 */
   STW(mem_trace_st(reg_r0_1,0,4), reg_r0_4); /* line 185 */
} /* line 185 */
  sim_icache_fetch(112 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_14, reg_r0_14, reg_r0_13); /* line 187 */
   MOV(reg_r0_4, reg_r0_11); /* line 188 */
} /* line 188 */
  sim_icache_fetch(114 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 12),0,4), reg_r0_14); /* line 190 */
   SUB(reg_r0_2, reg_r0_2, reg_r0_14); /* line 191 */
} /* line 191 */
  sim_icache_fetch(116 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SUB(reg_r0_2, reg_r0_2, reg_r0_16); /* line 193 */
} /* line 193 */
  sim_icache_fetch(117 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 4),0,4), reg_r0_2); /* line 195 */
} /* line 195 */
l_L1X3: ;/* line 198 */
LABEL(l_L1X3);
  sim_icache_fetch(118 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld(reg_r0_1,0,4)); /* line 199 */
} /* line 199 */
  sim_icache_fetch(119 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 4),0,4)); /* line 201 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 202 */
   ADD_CYCLES(1);
} /* line 202 */
  sim_icache_fetch(121 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_12, reg_r0_2, reg_r0_3); /* line 204 */
} /* line 204 */
  sim_icache_fetch(122 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLT(reg_b0_0, reg_r0_11, 0); /* line 206 */
   CMPLTU(reg_r0_2, reg_r0_12, reg_r0_2); /* line 207 */
   ADD(reg_r0_13, reg_r0_11, reg_r0_4); /* line 208 */
} /* line 208 */
  sim_icache_fetch(125 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_13, reg_r0_13, reg_r0_2); /* line 210 */
} /* line 210 */
  sim_icache_fetch(126 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L2X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 212 */
  sim_icache_fetch(127 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_13); /* line 214 */
   ADD(reg_r0_8, reg_r0_8, (unsigned int) -131072); /* line 215 */
} /* line 215 */
  sim_icache_fetch(130 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 4),0,4)); /* line 217 */
} /* line 217 */
  sim_icache_fetch(131 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_12); /* line 219 */
} /* line 219 */
  sim_icache_fetch(132 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_11, mem_trace_ld(reg_r0_1,0,4)); /* line 221 */
} /* line 221 */
  sim_icache_fetch(133 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLT(reg_b0_0, reg_r0_2, 0); /* line 223 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 224 */
   ADD_CYCLES(1);
} /* line 224 */
  sim_icache_fetch(135 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_12, reg_r0_3, reg_r0_11); /* line 226 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L3X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 227 */
  sim_icache_fetch(137 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLTU(reg_r0_11, reg_r0_12, reg_r0_11); /* line 229 */
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_12); /* line 230 */
   ADD(reg_r0_10, reg_r0_10, (unsigned int) -131072); /* line 231 */
} /* line 231 */
  sim_icache_fetch(141 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_11, reg_r0_4, reg_r0_11); /* line 233 */
   LDWs(reg_r0_12, mem_trace_ld(reg_r0_1,0,4)); /* line 234 */
} /* line 234 */
  sim_icache_fetch(143 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_11, reg_r0_11, reg_r0_2); /* line 236 */
} /* line 236 */
  sim_icache_fetch(144 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_11); /* line 238 */
} /* line 238 */
  sim_icache_fetch(145 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 4),0,4)); /* line 240 */
   ADD(reg_r0_11, reg_r0_3, reg_r0_12); /* line 241 */
} /* line 241 */
  sim_icache_fetch(147 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLTU(reg_r0_12, reg_r0_11, reg_r0_12); /* line 243 */
} /* line 243 */
  sim_icache_fetch(148 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_12, reg_r0_4, reg_r0_12); /* line 245 */
} /* line 245 */
  sim_icache_fetch(149 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_b0_0, reg_r0_2, 0); /* line 247 */
   ADD(reg_r0_12, reg_r0_12, reg_r0_2); /* line 248 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 249 */
   ADD_CYCLES(1);
} /* line 249 */
  sim_icache_fetch(152 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L4X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 251 */
  sim_icache_fetch(153 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_11); /* line 253 */
   ADD(reg_r0_7, reg_r0_7, (unsigned int) -131072); /* line 254 */
} /* line 254 */
  sim_icache_fetch(156 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld(reg_r0_1,0,4)); /* line 256 */
} /* line 256 */
  sim_icache_fetch(157 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_12); /* line 258 */
} /* line 258 */
  sim_icache_fetch(158 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 4),0,4)); /* line 260 */
} /* line 260 */
  sim_icache_fetch(159 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_12, reg_r0_3, reg_r0_2); /* line 262 */
} /* line 262 */
  sim_icache_fetch(160 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLTU(reg_r0_2, reg_r0_12, reg_r0_2); /* line 264 */
} /* line 264 */
  sim_icache_fetch(161 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_b0_0, reg_r0_11, 0); /* line 266 */
   ADD(reg_r0_2, reg_r0_4, reg_r0_2); /* line 267 */
} /* line 267 */
  sim_icache_fetch(163 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_2, reg_r0_2, reg_r0_11); /* line 269 */
} /* line 269 */
  sim_icache_fetch(164 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L5X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 271 */
  sim_icache_fetch(165 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_12); /* line 273 */
   ADD(reg_r0_9, reg_r0_9, (unsigned int) -131072); /* line 274 */
} /* line 274 */
  sim_icache_fetch(168 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_2); /* line 276 */
   GOTO(l_L1X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L1X3;
} /* line 277 */
l_L5X3: ;/* line 280 */
LABEL(l_L5X3);
  sim_icache_fetch(170 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_10, reg_r0_9); /* line 282 */
   LDW(reg_r0_2, mem_trace_ld(reg_r0_1,0,4)); /* line 283 */
   CMPLT(reg_b0_1, reg_r0_4, 0); /* line 284 */
} /* line 284 */
  sim_icache_fetch(173 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_6, reg_r0_4, (unsigned int) 16); /* line 286 */
   MTB(reg_b0_0, 0); /* line 287 */
} /* line 287 */
  sim_icache_fetch(175 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MFB(reg_r0_5, reg_b0_1); /* line 289 */
} /* line 289 */
  sim_icache_fetch(176 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHRU(reg_r0_9, reg_r0_4, reg_r0_5); /* line 291 */
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 4),0,4)); /* line 292 */
} /* line 292 */
  sim_icache_fetch(178 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L6X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L6X3;
} /* line 294 */
l_L4X3: ;/* line 297 */
LABEL(l_L4X3);
  sim_icache_fetch(179 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_10, reg_r0_9); /* line 298 */
   MOV(reg_r0_8, reg_r0_7); /* line 299 */
   LDW(reg_r0_2, mem_trace_ld(reg_r0_1,0,4)); /* line 300 */
   CMPLT(reg_b0_1, reg_r0_4, 0); /* line 301 */
} /* line 301 */
  sim_icache_fetch(183 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_6, reg_r0_4, (unsigned int) 16); /* line 303 */
   MTB(reg_b0_0, 0); /* line 304 */
} /* line 304 */
  sim_icache_fetch(185 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MFB(reg_r0_5, reg_b0_1); /* line 306 */
} /* line 306 */
  sim_icache_fetch(186 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHRU(reg_r0_9, reg_r0_4, reg_r0_5); /* line 308 */
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 4),0,4)); /* line 309 */
} /* line 309 */
  sim_icache_fetch(188 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L6X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L6X3;
} /* line 311 */
l_L3X3: ;/* line 315 */
LABEL(l_L3X3);
  sim_icache_fetch(189 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_8, reg_r0_7); /* line 316 */
   LDW(reg_r0_2, mem_trace_ld(reg_r0_1,0,4)); /* line 317 */
   CMPLT(reg_b0_1, reg_r0_4, 0); /* line 318 */
} /* line 318 */
  sim_icache_fetch(192 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_6, reg_r0_4, (unsigned int) 16); /* line 320 */
   MTB(reg_b0_0, 0); /* line 321 */
} /* line 321 */
  sim_icache_fetch(194 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MFB(reg_r0_5, reg_b0_1); /* line 323 */
} /* line 323 */
  sim_icache_fetch(195 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHRU(reg_r0_9, reg_r0_4, reg_r0_5); /* line 325 */
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 4),0,4)); /* line 326 */
} /* line 326 */
  sim_icache_fetch(197 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L6X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L6X3;
} /* line 328 */
l_L2X3: ;/* line 331 */
LABEL(l_L2X3);
  sim_icache_fetch(198 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDW(reg_r0_2, mem_trace_ld(reg_r0_1,0,4)); /* line 332 */
   SHL(reg_r0_6, reg_r0_4, (unsigned int) 16); /* line 333 */
   CMPLT(reg_r0_5, reg_r0_4, 0); /* line 334 */
   MTB(reg_b0_0, 0); /* line 335 */
} /* line 335 */
  sim_icache_fetch(202 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 4),0,4)); /* line 338 */
   SHRU(reg_r0_9, reg_r0_4, reg_r0_5); /* line 339 */
   MTB(reg_b0_1, reg_r0_5); /* line 340 */
} /* line 340 */
  sim_icache_fetch(205 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(0);
} /* line 342 */
l_L6X3: ;/* line 344 */
LABEL(l_L6X3);
  sim_icache_fetch(206 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_8, reg_r0_8, reg_r0_10); /* line 345 */
   SHRU(reg_r0_2, reg_r0_2, (unsigned int) 16); /* line 346 */
} /* line 346 */
  sim_icache_fetch(208 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_7, reg_r0_7, (unsigned int) 16); /* line 348 */
} /* line 348 */
  sim_icache_fetch(209 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_7); /* line 350 */
} /* line 350 */
  sim_icache_fetch(210 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 4),0,4), reg_r0_2); /* line 352 */
   SHRU(reg_r0_5, reg_r0_2, reg_r0_5); /* line 353 */
   CMPGEU(reg_r0_4, reg_r0_2, reg_r0_4); /* line 354 */
   CMPGTU(reg_b0_2, reg_r0_6, reg_r0_2); /* line 355 */
} /* line 355 */
  sim_icache_fetch(214 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_0); /* line 357 */
} /* line 357 */
  sim_icache_fetch(215 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, 0, reg_r0_9, reg_b0_3); /* line 359 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_0); /* line 360 */
} /* line 360 */
  sim_icache_fetch(217 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 362 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 363 */
} /* line 363 */
  sim_icache_fetch(219 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 365 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 366 */
} /* line 366 */
  sim_icache_fetch(221 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 368 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 369 */
} /* line 369 */
  sim_icache_fetch(223 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 371 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 372 */
} /* line 372 */
  sim_icache_fetch(225 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 374 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 375 */
} /* line 375 */
  sim_icache_fetch(227 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 377 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 378 */
} /* line 378 */
  sim_icache_fetch(229 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 380 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 381 */
} /* line 381 */
  sim_icache_fetch(231 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 383 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 384 */
} /* line 384 */
  sim_icache_fetch(233 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 386 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 387 */
} /* line 387 */
  sim_icache_fetch(235 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 389 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 390 */
} /* line 390 */
  sim_icache_fetch(237 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 392 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 393 */
} /* line 393 */
  sim_icache_fetch(239 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 395 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 396 */
} /* line 396 */
  sim_icache_fetch(241 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 398 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 399 */
} /* line 399 */
  sim_icache_fetch(243 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 401 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 402 */
} /* line 402 */
  sim_icache_fetch(245 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 404 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 405 */
} /* line 405 */
  sim_icache_fetch(247 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 407 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 408 */
} /* line 408 */
  sim_icache_fetch(249 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 410 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 411 */
} /* line 411 */
  sim_icache_fetch(251 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 413 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 414 */
} /* line 414 */
  sim_icache_fetch(253 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 416 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 417 */
} /* line 417 */
  sim_icache_fetch(255 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 419 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 420 */
} /* line 420 */
  sim_icache_fetch(257 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 422 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 423 */
} /* line 423 */
  sim_icache_fetch(259 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 425 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 426 */
} /* line 426 */
  sim_icache_fetch(261 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 428 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 429 */
} /* line 429 */
  sim_icache_fetch(263 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 431 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 432 */
} /* line 432 */
  sim_icache_fetch(265 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 434 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 435 */
} /* line 435 */
  sim_icache_fetch(267 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 437 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 438 */
} /* line 438 */
  sim_icache_fetch(269 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 440 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 441 */
} /* line 441 */
  sim_icache_fetch(271 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 443 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 444 */
} /* line 444 */
  sim_icache_fetch(273 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 446 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 447 */
} /* line 447 */
  sim_icache_fetch(275 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_3, reg_r0_6, reg_r0_9, reg_b0_3); /* line 449 */
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 450 */
} /* line 450 */
  sim_icache_fetch(277 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   DIVS(reg_r0_6, reg_b0_4, reg_r0_6, reg_r0_9, reg_b0_4); /* line 452 */
   ADDCG(reg_r0_2, reg_b0_3, reg_r0_5, reg_r0_5, reg_b0_3); /* line 453 */
} /* line 453 */
  sim_icache_fetch(279 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADDCG(reg_r0_5, reg_b0_4, reg_r0_2, reg_r0_2, reg_b0_4); /* line 455 */
   CMPGE(reg_r0_6, reg_r0_6, 0); /* line 456 */
} /* line 456 */
  sim_icache_fetch(281 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORC(reg_r0_5, reg_r0_5, 0); /* line 458 */
} /* line 458 */
  sim_icache_fetch(282 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SH1ADD(reg_r0_5, reg_r0_5, reg_r0_6); /* line 460 */
} /* line 460 */
  sim_icache_fetch(283 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_4, reg_b0_1, reg_r0_4, reg_r0_5); /* line 462 */
} /* line 462 */
  sim_icache_fetch(284 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_4, reg_b0_2, reg_r0_4, (unsigned int) 65535); /* line 464 */
} /* line 464 */
  sim_icache_fetch(286 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_3, reg_r0_8, reg_r0_4); /* line 467 */
   RETURN(estimateDiv64To32);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 468 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 101: goto l_L0X3;
    case 102: goto l_L1X3;
    case 103: goto l_L5X3;
    case 104: goto l_L4X3;
    case 105: goto l_L3X3;
    case 106: goto l_L2X3;
    case 107: goto l_L6X3;
    case 108:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

static unsigned int countLeadingZeros32( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(countLeadingZeros32);
  sim_check_stack(reg_r0_1, 0); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (109 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(288 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPGEU(reg_b0_0, reg_r0_3, (unsigned int) 65536); /* line 488 */
} /* line 488 */
  sim_icache_fetch(290 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_2, reg_r0_3, (unsigned int) 16); /* line 490 */
   SLCT(reg_r0_4, reg_b0_0, 0, (unsigned int) 16); /* line 491 */
} /* line 491 */
  sim_icache_fetch(292 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_3, reg_b0_0, reg_r0_3, reg_r0_2); /* line 493 */
   ADD(reg_r0_2, reg_r0_4, (unsigned int) 8); /* line 494 */
} /* line 494 */
  sim_icache_fetch(294 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPGEU(reg_b0_0, reg_r0_3, (unsigned int) 16777216); /* line 496 */
   SHL(reg_r0_5, reg_r0_3, (unsigned int) 8); /* line 497 */
} /* line 497 */
  sim_icache_fetch(297 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_3, reg_b0_0, reg_r0_3, reg_r0_5); /* line 499 */
   SLCT(reg_r0_4, reg_b0_0, reg_r0_4, reg_r0_2); /* line 500 */
} /* line 500 */
  sim_icache_fetch(299 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHRU(reg_r0_3, reg_r0_3, (unsigned int) 24); /* line 502 */
} /* line 502 */
  sim_icache_fetch(300 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SH2ADD(reg_r0_3, reg_r0_3, (unsigned int) _X1PACKETX37); /* line 504 */
} /* line 504 */
  sim_icache_fetch(302 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld(reg_r0_3,0,4)); /* line 506 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 507 */
   ADD_CYCLES(2);
} /* line 507 */
  sim_icache_fetch(304 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_3, reg_r0_4, reg_r0_3); /* line 510 */
   RETURN(countLeadingZeros32);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + 0; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 511 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 109:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

static  float_raise( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(float_raise);
  sim_check_stack(reg_r0_1, 0); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (110 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(306 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((unsigned int) _X1PACKETX3,0,4)); /* line 784 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 785 */
   ADD_CYCLES(2);
} /* line 785 */
  sim_icache_fetch(309 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_3, reg_r0_3, reg_r0_2); /* line 787 */
} /* line 787 */
  sim_icache_fetch(310 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((unsigned int) _X1PACKETX3,0,4), reg_r0_3); /* line 790 */
   RETURN(float_raise);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + 0; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 791 */
  reg_l0_0 = t_client_rpc;
  return;

labelfinder:
  switch (t_labelnum >> 5) {
    case 110:
      reg_l0_0 = t_client_rpc;
      return;
    default:
      sim_bad_label(t_labelnum);
    }
}

static sim_result_0_t float32ToCommonNaN( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_0_t t_sim_result_0_t_0;
   ENTRY(float32ToCommonNaN);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (115 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(313 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 806 */
   SHRU(reg_r0_2, reg_r0_3, (unsigned int) 22); /* line 807 */
   SHRU(reg_r0_6, reg_r0_3, (unsigned int) 31); /* line 808 */
} /* line 808 */
  sim_icache_fetch(316 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_2, reg_r0_2, (unsigned int) 511); /* line 810 */
   SHL(reg_r0_4, reg_r0_3, (unsigned int) 9); /* line 811 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 812 */
} /* line 812 */
  sim_icache_fetch(320 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_2, reg_r0_2, (unsigned int) 510); /* line 814 */
   AND(reg_r0_7, reg_r0_3, (unsigned int) 4194303); /* line 815 */
} /* line 815 */
  sim_icache_fetch(324 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ANDL(reg_b0_0, reg_r0_2, reg_r0_7); /* line 817 */
   MOV(reg_r0_5, 0); /* line 818 */
   MOV(reg_r0_8, reg_r0_3); /* line 819 */
} /* line 819 */
  sim_icache_fetch(327 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_3, reg_r0_6); /* line 821 */
} /* line 821 */
  sim_icache_fetch(328 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L7X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 823 */
l_L8X3: ;/* line 825 */
LABEL(l_L8X3);
  sim_icache_fetch(329 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(float32ToCommonNaN);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 827 */
l_L7X3: ;/* line 830 */
LABEL(l_L7X3);
		 /* line 830 */
  sim_icache_fetch(330 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_8); /* line 833 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 834 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (115 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 834 */
l_lr_13: ;/* line 834 */
LABEL(l_lr_13);
  sim_icache_fetch(334 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_5, 0); /* line 836 */
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 837 */
} /* line 837 */
  sim_icache_fetch(336 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 839 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 840 */
   ADD_CYCLES(1);
} /* line 840 */
  sim_icache_fetch(338 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHRU(reg_r0_3, reg_r0_2, (unsigned int) 31); /* line 842 */
   SHL(reg_r0_4, reg_r0_2, (unsigned int) 9); /* line 843 */
} /* line 843 */
  sim_icache_fetch(340 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L8X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L8X3;
} /* line 845 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_0_t_0.alias0 = reg_r0_3;
  t_sim_result_0_t_0.alias1 = reg_r0_4;
  t_sim_result_0_t_0.alias2 = reg_r0_5;
  return t_sim_result_0_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 111: goto l_L8X3;
    case 112: goto l_L7X3;
    case 114: goto l_lr_13;
    case 115:
      reg_l0_0 = t_client_rpc;
      t_sim_result_0_t_0.alias0 = reg_r0_3;
      t_sim_result_0_t_0.alias1 = reg_r0_4;
      t_sim_result_0_t_0.alias2 = reg_r0_5;
      return t_sim_result_0_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

static unsigned int propagateFloat32NaN( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(propagateFloat32NaN);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (120 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(341 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 863 */
   SHL(reg_r0_2, reg_r0_4, (unsigned int) 1); /* line 864 */
   SHRU(reg_r0_5, reg_r0_4, (unsigned int) 22); /* line 865 */
} /* line 865 */
  sim_icache_fetch(344 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPGTU(reg_r0_2, reg_r0_2, (unsigned int) -16777216); /* line 867 */
   SHRU(reg_r0_6, reg_r0_3, (unsigned int) 22); /* line 868 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 869 */
} /* line 869 */
  sim_icache_fetch(348 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_7, reg_r0_3, (unsigned int) 4194304); /* line 871 */
   OR(reg_r0_8, reg_r0_4, (unsigned int) 4194304); /* line 872 */
} /* line 872 */
  sim_icache_fetch(352 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_5, reg_r0_5, (unsigned int) 511); /* line 874 */
   AND(reg_r0_4, reg_r0_4, (unsigned int) 4194303); /* line 875 */
} /* line 875 */
  sim_icache_fetch(356 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_6, reg_r0_6, (unsigned int) 511); /* line 877 */
   CMPEQ(reg_r0_5, reg_r0_5, (unsigned int) 510); /* line 878 */
} /* line 878 */
  sim_icache_fetch(360 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_r0_6, reg_r0_6, (unsigned int) 510); /* line 880 */
   ANDL(reg_r0_5, reg_r0_5, reg_r0_4); /* line 881 */
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 882 */
} /* line 882 */
  sim_icache_fetch(364 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_3, reg_r0_3, (unsigned int) 4194303); /* line 884 */
   SLCT(reg_r0_4, reg_b0_0, reg_r0_8, reg_r0_7); /* line 885 */
   CMPNE(reg_b0_1, reg_r0_5, 0); /* line 886 */
} /* line 886 */
  sim_icache_fetch(368 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ANDL(reg_r0_6, reg_r0_6, reg_r0_3); /* line 888 */
} /* line 888 */
  sim_icache_fetch(369 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_9, reg_r0_5, reg_r0_6); /* line 890 */
   CMPNE(reg_b0_0, reg_r0_6, 0); /* line 891 */
} /* line 891 */
  sim_icache_fetch(371 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_b0_2, reg_r0_9, 0); /* line 893 */
   SLCT(reg_r0_4, reg_b0_0, reg_r0_7, reg_r0_4); /* line 894 */
} /* line 894 */
  sim_icache_fetch(373 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_3, reg_b0_1, reg_r0_8, reg_r0_4); /* line 896 */
} /* line 896 */
  sim_icache_fetch(374 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_2) {    BRANCH(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L9X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 898 */
l_L10X3: ;/* line 900 */
LABEL(l_L10X3);
  sim_icache_fetch(375 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(propagateFloat32NaN);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 902 */
l_L9X3: ;/* line 905 */
LABEL(l_L9X3);
  sim_icache_fetch(376 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_5); /* line 906 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 907 */
} /* line 907 */
  sim_icache_fetch(378 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_6); /* line 909 */
} /* line 909 */
  sim_icache_fetch(379 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_7); /* line 911 */
} /* line 911 */
  sim_icache_fetch(380 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_8); /* line 913 */
} /* line 913 */
		 /* line 914 */
  sim_icache_fetch(381 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_2); /* line 917 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (120 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 917 */
l_lr_18: ;/* line 917 */
LABEL(l_lr_18);
  sim_icache_fetch(384 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 919 */
} /* line 919 */
  sim_icache_fetch(385 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 921 */
} /* line 921 */
  sim_icache_fetch(386 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 923 */
} /* line 923 */
  sim_icache_fetch(387 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 925 */
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 926 */
} /* line 926 */
  sim_icache_fetch(389 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 928 */
} /* line 928 */
  sim_icache_fetch(390 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_4, reg_b0_0, reg_r0_8, reg_r0_7); /* line 930 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 931 */
} /* line 931 */
  sim_icache_fetch(392 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_6, 0); /* line 933 */
} /* line 933 */
  sim_icache_fetch(393 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_4, reg_b0_0, reg_r0_7, reg_r0_4); /* line 935 */
   CMPNE(reg_b0_0, reg_r0_5, 0); /* line 936 */
} /* line 936 */
  sim_icache_fetch(395 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_3, reg_b0_0, reg_r0_8, reg_r0_4); /* line 938 */
   GOTO(l_L10X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L10X3;
} /* line 939 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 116: goto l_L10X3;
    case 117: goto l_L9X3;
    case 119: goto l_lr_18;
    case 120:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

static sim_result_0_t float64ToCommonNaN( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_0_t t_sim_result_0_t_0;
   ENTRY(float64ToCommonNaN);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (125 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(397 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 957 */
   SHRU(reg_r0_2, reg_r0_3, (unsigned int) 19); /* line 958 */
   SHRU(reg_r0_6, reg_r0_3, (unsigned int) 31); /* line 959 */
} /* line 959 */
  sim_icache_fetch(400 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_2, reg_r0_2, (unsigned int) 4095); /* line 961 */
   SHL(reg_r0_5, reg_r0_4, (unsigned int) 12); /* line 962 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_l0_0); /* line 963 */
} /* line 963 */
  sim_icache_fetch(404 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_2, reg_r0_2, (unsigned int) 4094); /* line 965 */
   AND(reg_r0_7, reg_r0_3, (unsigned int) 524287); /* line 966 */
} /* line 966 */
  sim_icache_fetch(408 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ORL(reg_r0_7, reg_r0_4, reg_r0_7); /* line 968 */
   SHL(reg_r0_8, reg_r0_3, (unsigned int) 12); /* line 969 */
   SHRU(reg_r0_9, reg_r0_4, (unsigned int) 20); /* line 970 */
   MOV(reg_r0_10, reg_r0_3); /* line 971 */
} /* line 971 */
  sim_icache_fetch(412 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ANDL(reg_b0_0, reg_r0_2, reg_r0_7); /* line 973 */
   OR(reg_r0_8, reg_r0_8, reg_r0_9); /* line 974 */
   MOV(reg_r0_3, reg_r0_6); /* line 975 */
} /* line 975 */
  sim_icache_fetch(415 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_9, reg_r0_4); /* line 977 */
} /* line 977 */
  sim_icache_fetch(416 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_4, reg_r0_8); /* line 979 */
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L11X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 980 */
l_L12X3: ;/* line 982 */
LABEL(l_L12X3);
  sim_icache_fetch(418 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_6); /* line 983 */
} /* line 983 */
  sim_icache_fetch(419 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_5); /* line 985 */
} /* line 985 */
  sim_icache_fetch(420 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_8); /* line 988 */
   RETURN(float64ToCommonNaN);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 989 */
l_L11X3: ;/* line 992 */
LABEL(l_L11X3);
  sim_icache_fetch(422 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_9); /* line 993 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 994 */
} /* line 994 */
		 /* line 995 */
  sim_icache_fetch(424 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_10); /* line 998 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (125 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 998 */
l_lr_23: ;/* line 998 */
LABEL(l_lr_23);
  sim_icache_fetch(427 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 1000 */
} /* line 1000 */
  sim_icache_fetch(428 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 1002 */
} /* line 1002 */
  sim_icache_fetch(429 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 1004 */
} /* line 1004 */
  sim_icache_fetch(430 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHRU(reg_r0_3, reg_r0_2, (unsigned int) 31); /* line 1006 */
   SHL(reg_r0_9, reg_r0_2, (unsigned int) 12); /* line 1007 */
} /* line 1007 */
  sim_icache_fetch(432 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_5, reg_r0_7, (unsigned int) 12); /* line 1009 */
   SHRU(reg_r0_2, reg_r0_7, (unsigned int) 20); /* line 1010 */
   MOV(reg_r0_6, reg_r0_3); /* line 1011 */
} /* line 1011 */
  sim_icache_fetch(435 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_4, reg_r0_9, reg_r0_2); /* line 1013 */
} /* line 1013 */
  sim_icache_fetch(436 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_8, reg_r0_4); /* line 1015 */
   GOTO(l_L12X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L12X3;
} /* line 1016 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_0_t_0.alias0 = reg_r0_3;
  t_sim_result_0_t_0.alias1 = reg_r0_4;
  t_sim_result_0_t_0.alias2 = reg_r0_5;
  return t_sim_result_0_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 121: goto l_L12X3;
    case 122: goto l_L11X3;
    case 124: goto l_lr_23;
    case 125:
      reg_l0_0 = t_client_rpc;
      t_sim_result_0_t_0.alias0 = reg_r0_3;
      t_sim_result_0_t_0.alias1 = reg_r0_4;
      t_sim_result_0_t_0.alias2 = reg_r0_5;
      return t_sim_result_0_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

static sim_result_1_t commonNaNToFloat64( unsigned int arg0, unsigned int arg1, unsigned int arg2 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(commonNaNToFloat64);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_l0_0 = (126 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(438 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 1035 */
   SHRU(reg_r0_2, reg_r0_4, (unsigned int) 12); /* line 1036 */
   SHL(reg_r0_3, reg_r0_3, (unsigned int) 31); /* line 1037 */
} /* line 1037 */
  sim_icache_fetch(441 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHRU(reg_r0_5, reg_r0_5, (unsigned int) 12); /* line 1039 */
   SHL(reg_r0_4, reg_r0_4, (unsigned int) 20); /* line 1040 */
   OR(reg_r0_2, reg_r0_2, (unsigned int) 2146959360); /* line 1041 */
} /* line 1041 */
  sim_icache_fetch(445 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_4, reg_r0_5, reg_r0_4); /* line 1043 */
   OR(reg_r0_3, reg_r0_2, reg_r0_3); /* line 1044 */
} /* line 1044 */
  sim_icache_fetch(447 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_1,0,4), reg_r0_3); /* line 1046 */
} /* line 1046 */
  sim_icache_fetch(448 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 4),0,4), reg_r0_4); /* line 1049 */
   RETURN(commonNaNToFloat64);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1050 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 126:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

static sim_result_1_t propagateFloat64NaN( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(propagateFloat64NaN);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (134 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(450 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 1066 */
   SHL(reg_r0_2, reg_r0_5, (unsigned int) 1); /* line 1067 */
   SHRU(reg_r0_7, reg_r0_5, (unsigned int) 19); /* line 1068 */
} /* line 1068 */
  sim_icache_fetch(453 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPGEU(reg_r0_2, reg_r0_2, (unsigned int) -2097152); /* line 1070 */
   SHRU(reg_r0_8, reg_r0_3, (unsigned int) 19); /* line 1071 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 1072 */
} /* line 1072 */
  sim_icache_fetch(457 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_9, reg_r0_5, (unsigned int) 1048575); /* line 1074 */
   OR(reg_r0_10, reg_r0_3, (unsigned int) 524288); /* line 1075 */
} /* line 1075 */
  sim_icache_fetch(461 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ORL(reg_r0_9, reg_r0_6, reg_r0_9); /* line 1077 */
   AND(reg_r0_7, reg_r0_7, (unsigned int) 4095); /* line 1078 */
   MOV(reg_r0_11, reg_r0_3); /* line 1079 */
} /* line 1079 */
  sim_icache_fetch(465 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_2, reg_r0_2, reg_r0_9); /* line 1081 */
   OR(reg_r0_3, reg_r0_5, (unsigned int) 524288); /* line 1082 */
} /* line 1082 */
  sim_icache_fetch(468 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_7, reg_r0_7, (unsigned int) 4094); /* line 1084 */
   AND(reg_r0_5, reg_r0_5, (unsigned int) 524287); /* line 1085 */
} /* line 1085 */
  sim_icache_fetch(472 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_8, reg_r0_8, (unsigned int) 4095); /* line 1087 */
   ORL(reg_r0_5, reg_r0_6, reg_r0_5); /* line 1088 */
} /* line 1088 */
  sim_icache_fetch(475 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_8, reg_r0_8, (unsigned int) 4094); /* line 1090 */
   ANDL(reg_r0_7, reg_r0_7, reg_r0_5); /* line 1091 */
} /* line 1091 */
  sim_icache_fetch(478 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_11, reg_r0_11, (unsigned int) 524287); /* line 1093 */
   CMPNE(reg_b0_0, reg_r0_7, 0); /* line 1094 */
} /* line 1094 */
  sim_icache_fetch(481 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_r0_11, reg_r0_4, reg_r0_11); /* line 1096 */
   MOV(reg_r0_5, reg_r0_4); /* line 1097 */
} /* line 1097 */
  sim_icache_fetch(483 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_8, reg_r0_8, reg_r0_11); /* line 1099 */
   MOV(reg_r0_4, reg_r0_6); /* line 1100 */
} /* line 1100 */
  sim_icache_fetch(485 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_6, reg_r0_7, reg_r0_8); /* line 1102 */
} /* line 1102 */
  sim_icache_fetch(486 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_1, reg_r0_6, 0); /* line 1104 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1105 */
   ADD_CYCLES(1);
} /* line 1105 */
  sim_icache_fetch(488 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L13X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1107 */
l_L14X3: ;/* line 1109 */
LABEL(l_L14X3);
  sim_icache_fetch(489 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L15X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1110 */
  sim_icache_fetch(490 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(propagateFloat64NaN);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1113 */
l_L15X3: ;/* line 1116 */
LABEL(l_L15X3);
  sim_icache_fetch(491 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_4 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPNE(reg_b0_0, reg_r0_8, 0); /* line 1117 */
   MOV(reg_r0_4, reg_r0_5); /* line 1118 */
   MOV(reg_r0_6, t__i32_0); /* line 1119 */
   MOV(reg_r0_5, reg_r0_3); /* line 1120 */
} /* line 1120 */
  sim_icache_fetch(495 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_3, reg_r0_10); /* line 1122 */
} /* line 1122 */
  sim_icache_fetch(496 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L16X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1124 */
  sim_icache_fetch(497 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(propagateFloat64NaN);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1127 */
l_L16X3: ;/* line 1130 */
LABEL(l_L16X3);
  sim_icache_fetch(498 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_4 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 1131 */
   MOV(reg_r0_4, reg_r0_6); /* line 1132 */
   MOV(reg_r0_2, t__i32_0); /* line 1133 */
   MOV(reg_r0_10, reg_r0_3); /* line 1134 */
} /* line 1134 */
  sim_icache_fetch(502 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_3, reg_r0_5); /* line 1136 */
} /* line 1136 */
  sim_icache_fetch(503 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L17X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1138 */
  sim_icache_fetch(504 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(propagateFloat64NaN);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1141 */
l_L17X3: ;/* line 1144 */
LABEL(l_L17X3);
  sim_icache_fetch(505 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_4, reg_r0_2); /* line 1147 */
   MOV(reg_r0_3, reg_r0_10); /* line 1148 */
   RETURN(propagateFloat64NaN);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1148 */
l_L13X3: ;/* line 1151 */
LABEL(l_L13X3);
  sim_icache_fetch(508 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_5); /* line 1152 */
} /* line 1152 */
  sim_icache_fetch(509 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_4); /* line 1154 */
} /* line 1154 */
  sim_icache_fetch(510 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_3); /* line 1156 */
} /* line 1156 */
  sim_icache_fetch(511 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_10); /* line 1158 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 1159 */
} /* line 1159 */
  sim_icache_fetch(513 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_8); /* line 1161 */
} /* line 1161 */
  sim_icache_fetch(514 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_2); /* line 1163 */
} /* line 1163 */
		 /* line 1164 */
  sim_icache_fetch(515 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 44),0,4), reg_r0_7); /* line 1167 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (134 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 1167 */
l_lr_32: ;/* line 1167 */
LABEL(l_lr_32);
  sim_icache_fetch(518 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 1169 */
} /* line 1169 */
  sim_icache_fetch(519 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 1171 */
} /* line 1171 */
  sim_icache_fetch(520 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 1173 */
} /* line 1173 */
  sim_icache_fetch(521 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_b0_0, reg_r0_7, 0); /* line 1175 */
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 1176 */
} /* line 1176 */
  sim_icache_fetch(523 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 1178 */
} /* line 1178 */
  sim_icache_fetch(524 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 1180 */
} /* line 1180 */
  sim_icache_fetch(525 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 1182 */
} /* line 1182 */
  sim_icache_fetch(526 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 1184 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1185 */
   ADD_CYCLES(1);
} /* line 1185 */
  sim_icache_fetch(528 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L14X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L14X3;
} /* line 1187 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 127: goto l_L14X3;
    case 128: goto l_L15X3;
    case 129: goto l_L16X3;
    case 130: goto l_L17X3;
    case 131: goto l_L13X3;
    case 133: goto l_lr_32;
    case 134:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

static unsigned int roundAndPackFloat32( unsigned int arg0, unsigned int arg1, unsigned int arg2 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(roundAndPackFloat32);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_l0_0 = (148 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(529 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 1205 */
   LDW(reg_r0_2, mem_trace_ld((unsigned int) _X1PACKETX2,0,4)); /* line 1206 */
} /* line 1206 */
  sim_icache_fetch(532 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPNE(reg_b0_0, reg_r0_3, 0); /* line 1208 */
   AND(reg_r0_6, reg_r0_5, (unsigned int) 127); /* line 1209 */
   ZXTH(reg_r0_7, reg_r0_4); /* line 1210 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 1211 */
} /* line 1211 */
  sim_icache_fetch(536 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPGE(reg_b0_1, reg_r0_7, (unsigned int) 253); /* line 1213 */
   CMPNE(reg_b0_2, reg_r0_6, 0); /* line 1214 */
   LDWs(reg_r0_8, mem_trace_ld((unsigned int) _X1PACKETX3,0,4)); /* line 1215 */
} /* line 1215 */
  sim_icache_fetch(540 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_r0_9, reg_r0_2, 0); /* line 1217 */
   CMPEQ(reg_b0_5, reg_r0_2, (unsigned int) 3); /* line 1218 */
   CMPEQ(reg_b0_3, reg_r0_2, (unsigned int) 2); /* line 1219 */
   CMPEQ(reg_b0_4, reg_r0_2, (unsigned int) 1); /* line 1220 */
} /* line 1220 */
  sim_icache_fetch(544 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SLCT(reg_r0_2, reg_b0_3, 0, (unsigned int) 127); /* line 1222 */
   SLCT(reg_r0_7, reg_b0_4, 0, (unsigned int) 127); /* line 1223 */
   CMPEQ(reg_b0_6, reg_r0_9, 0); /* line 1224 */
   XOR(reg_r0_10, reg_r0_6, (unsigned int) 64); /* line 1225 */
} /* line 1225 */
  sim_icache_fetch(548 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SLCT(reg_r0_2, reg_b0_0, reg_r0_2, reg_r0_7); /* line 1227 */
   OR(reg_r0_8, reg_r0_8, (unsigned int) 1); /* line 1228 */
   CMPEQ(reg_r0_10, reg_r0_10, 0); /* line 1229 */
} /* line 1229 */
  sim_icache_fetch(551 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_3); /* line 1231 */
   SLCTF(reg_r0_2, reg_b0_5, reg_r0_2, 0); /* line 1232 */
   AND(reg_r0_10, reg_r0_9, reg_r0_10); /* line 1233 */
} /* line 1233 */
  sim_icache_fetch(554 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SLCT(reg_r0_2, reg_b0_6, reg_r0_2, (unsigned int) 64); /* line 1235 */
   ORC(reg_r0_10, reg_r0_10, 0); /* line 1236 */
   LDWs(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 1237 */
} /* line 1237 */
  sim_icache_fetch(557 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), reg_r0_4); /* line 1239 */
} /* line 1239 */
  sim_icache_fetch(558 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_5); /* line 1241 */
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L18X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1242 */
l_L19X3: ;/* line 1244 */
LABEL(l_L19X3);
  sim_icache_fetch(560 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1245 */
   SHL(reg_r0_7, reg_r0_7, (unsigned int) 31); /* line 1246 */
   if (!reg_b0_2) {    BRANCHF(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L20X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1247 */
  sim_icache_fetch(563 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((unsigned int) _X1PACKETX3,0,4), reg_r0_8); /* line 1249 */
} /* line 1249 */
l_L21X3: ;/* line 1251 */
LABEL(l_L21X3);
  sim_icache_fetch(565 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(0);
} /* line 1251 */
  sim_icache_fetch(566 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_4, reg_r0_4, reg_r0_2); /* line 1253 */
} /* line 1253 */
  sim_icache_fetch(567 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHRU(reg_r0_4, reg_r0_4, (unsigned int) 7); /* line 1255 */
} /* line 1255 */
  sim_icache_fetch(568 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   AND(reg_r0_4, reg_r0_4, reg_r0_10); /* line 1257 */
} /* line 1257 */
  sim_icache_fetch(569 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_4); /* line 1259 */
   CMPEQ(reg_b0_0, reg_r0_4, 0); /* line 1260 */
} /* line 1260 */
  sim_icache_fetch(571 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1262 */
} /* line 1262 */
  sim_icache_fetch(572 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L22X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1264 */
  sim_icache_fetch(573 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), 0); /* line 1266 */
} /* line 1266 */
l_L23X3: ;/* line 1268 */
LABEL(l_L23X3);
  sim_icache_fetch(574 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 1269 */
   ADD(reg_r0_2, reg_r0_2, reg_r0_7); /* line 1270 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 1271 */
   ADD_CYCLES(2);
} /* line 1271 */
  sim_icache_fetch(577 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_4, reg_r0_4, (unsigned int) 23); /* line 1273 */
} /* line 1273 */
  sim_icache_fetch(578 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_3, reg_r0_2, reg_r0_4); /* line 1276 */
   RETURN(roundAndPackFloat32);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1277 */
l_L22X3: ;/* line 1280 */
LABEL(l_L22X3);
  sim_icache_fetch(580 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L23X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L23X3;
} /* line 1281 */
l_L20X3: ;/* line 1284 */
LABEL(l_L20X3);
  sim_icache_fetch(581 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(0);
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1285 */
   ADD_CYCLES(1);
} /* line 1285 */
  sim_icache_fetch(582 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1287 */
} /* line 1287 */
  sim_icache_fetch(583 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L21X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L21X3;
} /* line 1289 */
l_L18X3: ;/* line 1292 */
LABEL(l_L18X3);
  sim_icache_fetch(584 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_4 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPGT(reg_r0_4, t__i32_0, (unsigned int) 253); /* line 1293 */
   CMPEQ(reg_r0_11, t__i32_0, (unsigned int) 253); /* line 1294 */
   ADD(reg_r0_5, reg_r0_5, reg_r0_2); /* line 1295 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_2); /* line 1296 */
} /* line 1296 */
  sim_icache_fetch(588 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_r0_5, reg_r0_5, 0); /* line 1298 */
   MOV(reg_r0_3, (unsigned int) 5); /* line 1299 */
} /* line 1299 */
  sim_icache_fetch(590 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ANDL(reg_r0_11, reg_r0_11, reg_r0_5); /* line 1301 */
} /* line 1301 */
  sim_icache_fetch(591 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_b0_0, reg_r0_4, reg_r0_11); /* line 1303 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1304 */
   ADD_CYCLES(1);
} /* line 1304 */
  sim_icache_fetch(593 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L24X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1306 */
		 /* line 1307 */
  sim_icache_fetch(594 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (148 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 1309 */
l_lr_41: ;/* line 1309 */
LABEL(l_lr_41);
  sim_icache_fetch(596 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 1311 */
} /* line 1311 */
  sim_icache_fetch(597 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 1313 */
} /* line 1313 */
  sim_icache_fetch(598 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 1315 */
} /* line 1315 */
  sim_icache_fetch(599 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_4, reg_r0_4, (unsigned int) 31); /* line 1317 */
} /* line 1317 */
  sim_icache_fetch(600 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_2, reg_r0_2, 0); /* line 1319 */
   ADD(reg_r0_4, reg_r0_4, (unsigned int) 2139095040); /* line 1320 */
} /* line 1320 */
  sim_icache_fetch(603 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SUB(reg_r0_3, reg_r0_4, reg_r0_2); /* line 1322 */
} /* line 1322 */
  sim_icache_fetch(604 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(roundAndPackFloat32);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1325 */
l_L24X3: ;/* line 1328 */
LABEL(l_L24X3);
  sim_icache_fetch(605 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, (unsigned int) 2); /* line 1329 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_9); /* line 1330 */
} /* line 1330 */
  sim_icache_fetch(607 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1332 */
} /* line 1332 */
  sim_icache_fetch(608 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 1334 */
} /* line 1334 */
  sim_icache_fetch(609 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 1336 */
} /* line 1336 */
  sim_icache_fetch(610 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_12, mem_trace_ld((unsigned int) _X1PACKETX1,0,4)); /* line 1338 */
   CMPNE(reg_r0_11, reg_r0_4, 0); /* line 1339 */
} /* line 1339 */
  sim_icache_fetch(613 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLT(reg_b0_0, reg_r0_5, 0); /* line 1341 */
   SUB(reg_r0_13, 0, reg_r0_5); /* line 1342 */
   CMPLT(reg_r0_5, reg_r0_5, (unsigned int) -1); /* line 1343 */
} /* line 1343 */
  sim_icache_fetch(616 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_14, 0, reg_r0_13); /* line 1345 */
   SHRU(reg_r0_15, reg_r0_4, reg_r0_13); /* line 1346 */
   CMPGE(reg_b0_1, reg_r0_13, (unsigned int) 32); /* line 1347 */
   CMPEQ(reg_b0_3, reg_r0_13, 0); /* line 1348 */
} /* line 1348 */
  sim_icache_fetch(620 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_r0_12, reg_r0_12, (unsigned int) 1); /* line 1350 */
   ADD(reg_r0_2, reg_r0_4, reg_r0_2); /* line 1351 */
   AND(reg_r0_14, reg_r0_14, (unsigned int) 31); /* line 1352 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L25X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1353 */
  sim_icache_fetch(624 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLTU(reg_r0_2, reg_r0_2, (unsigned int) -2147483648); /* line 1355 */
   SHL(reg_r0_14, reg_r0_4, reg_r0_14); /* line 1356 */
} /* line 1356 */
  sim_icache_fetch(627 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ORL(reg_r0_12, reg_r0_12, reg_r0_2); /* line 1358 */
   CMPNE(reg_r0_14, reg_r0_14, 0); /* line 1359 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), 0); /* line 1360 */
} /* line 1360 */
  sim_icache_fetch(630 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_r0_12, reg_r0_12, reg_r0_5); /* line 1362 */
   OR(reg_r0_15, reg_r0_15, reg_r0_14); /* line 1363 */
} /* line 1363 */
  sim_icache_fetch(632 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_11, reg_b0_1, reg_r0_11, reg_r0_15); /* line 1365 */
} /* line 1365 */
  sim_icache_fetch(633 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_4, reg_b0_3, reg_r0_4, reg_r0_11); /* line 1367 */
} /* line 1367 */
  sim_icache_fetch(634 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_4); /* line 1369 */
   AND(reg_r0_6, reg_r0_4, (unsigned int) 127); /* line 1370 */
} /* line 1370 */
  sim_icache_fetch(636 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_b0_0, reg_r0_12, reg_r0_6); /* line 1372 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_6); /* line 1373 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1374 */
   ADD_CYCLES(1);
} /* line 1374 */
  sim_icache_fetch(639 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L26X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1376 */
		 /* line 1377 */
  sim_icache_fetch(640 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (148 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 1379 */
l_lr_44: ;/* line 1379 */
LABEL(l_lr_44);
  sim_icache_fetch(642 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_3, mem_trace_ld((unsigned int) _X1PACKETX3,0,4)); /* line 1381 */
} /* line 1381 */
  sim_icache_fetch(644 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 1383 */
} /* line 1383 */
  sim_icache_fetch(645 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 1385 */
} /* line 1385 */
  sim_icache_fetch(646 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_8, reg_r0_3, (unsigned int) 1); /* line 1387 */
   LDWs(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 1388 */
} /* line 1388 */
  sim_icache_fetch(648 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPNE(reg_b0_2, reg_r0_6, 0); /* line 1390 */
   XOR(reg_r0_3, reg_r0_6, (unsigned int) 64); /* line 1391 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 1392 */
} /* line 1392 */
  sim_icache_fetch(651 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_3, reg_r0_3, 0); /* line 1394 */
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 1395 */
} /* line 1395 */
  sim_icache_fetch(653 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   AND(reg_r0_3, reg_r0_9, reg_r0_3); /* line 1397 */
} /* line 1397 */
  sim_icache_fetch(654 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORC(reg_r0_10, reg_r0_3, 0); /* line 1399 */
   GOTO(l_L19X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L19X3;
} /* line 1400 */
l_L26X3: ;/* line 1403 */
LABEL(l_L26X3);
  sim_icache_fetch(656 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 1404 */
} /* line 1404 */
  sim_icache_fetch(657 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 1406 */
} /* line 1406 */
  sim_icache_fetch(658 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 1408 */
} /* line 1408 */
  sim_icache_fetch(659 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPNE(reg_b0_2, reg_r0_6, 0); /* line 1410 */
   XOR(reg_r0_3, reg_r0_6, (unsigned int) 64); /* line 1411 */
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 1412 */
} /* line 1412 */
  sim_icache_fetch(662 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_r0_3, reg_r0_3, 0); /* line 1414 */
} /* line 1414 */
  sim_icache_fetch(663 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   AND(reg_r0_3, reg_r0_9, reg_r0_3); /* line 1416 */
} /* line 1416 */
  sim_icache_fetch(664 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORC(reg_r0_10, reg_r0_3, 0); /* line 1418 */
   GOTO(l_L19X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L19X3;
} /* line 1419 */
l_L25X3: ;/* line 1422 */
LABEL(l_L25X3);
  sim_icache_fetch(666 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 1423 */
} /* line 1423 */
  sim_icache_fetch(667 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 1425 */
} /* line 1425 */
  sim_icache_fetch(668 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 1427 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1428 */
   ADD_CYCLES(1);
} /* line 1428 */
  sim_icache_fetch(670 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L19X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L19X3;
} /* line 1430 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 135: goto l_L19X3;
    case 136: goto l_L21X3;
    case 137: goto l_L23X3;
    case 138: goto l_L22X3;
    case 139: goto l_L20X3;
    case 140: goto l_L18X3;
    case 142: goto l_lr_41;
    case 143: goto l_L24X3;
    case 145: goto l_lr_44;
    case 146: goto l_L26X3;
    case 147: goto l_L25X3;
    case 148:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

static unsigned int normalizeRoundAndPackFloat32( unsigned int arg0, unsigned int arg1, unsigned int arg2 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(normalizeRoundAndPackFloat32);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_l0_0 = (153 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(671 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 1449 */
} /* line 1449 */
  sim_icache_fetch(672 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 1451 */
} /* line 1451 */
  sim_icache_fetch(673 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_3); /* line 1453 */
} /* line 1453 */
  sim_icache_fetch(674 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_4); /* line 1455 */
   MOV(reg_r0_3, reg_r0_5); /* line 1456 */
} /* line 1456 */
		 /* line 1457 */
  sim_icache_fetch(676 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_5); /* line 1460 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (153 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 1460 */
l_lr_49: ;/* line 1460 */
LABEL(l_lr_49);
  sim_icache_fetch(679 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_6, reg_r0_3, (unsigned int) -1); /* line 1462 */
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 1463 */
} /* line 1463 */
  sim_icache_fetch(681 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 1465 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1466 */
   ADD_CYCLES(1);
} /* line 1466 */
  sim_icache_fetch(683 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_2, reg_r0_2, (unsigned int) 1); /* line 1468 */
} /* line 1468 */
  sim_icache_fetch(684 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SUB(reg_r0_4, reg_r0_2, reg_r0_3); /* line 1470 */
   SHL(reg_r0_5, reg_r0_7, reg_r0_6); /* line 1471 */
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 1472 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1473 */
   ADD_CYCLES(1);
} /* line 1473 */
		 /* line 1474 */
  sim_icache_fetch(688 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(roundAndPackFloat32);
   reg_l0_0 = (153 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) roundAndPackFloat32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 1476 */
l_lr_51: ;/* line 1476 */
LABEL(l_lr_51);
  sim_icache_fetch(690 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 1478 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 1479 */
   ADD_CYCLES(3);
} /* line 1479 */
  sim_icache_fetch(692 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(normalizeRoundAndPackFloat32);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1482 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 150: goto l_lr_49;
    case 152: goto l_lr_51;
    case 153:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

static  normalizeFloat64Subnormal( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(normalizeFloat64Subnormal);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_r0_7 =  arg4; 
  reg_l0_0 = (160 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(693 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 1501 */
   CMPEQ(reg_b0_0, reg_r0_3, 0); /* line 1502 */
   MOV(reg_r0_2, reg_r0_3); /* line 1503 */
} /* line 1503 */
  sim_icache_fetch(696 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 1505 */
} /* line 1505 */
  sim_icache_fetch(697 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_7); /* line 1507 */
   MOV(reg_r0_3, reg_r0_4); /* line 1508 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L27X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1509 */
  sim_icache_fetch(700 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_6); /* line 1511 */
} /* line 1511 */
  sim_icache_fetch(701 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_5); /* line 1513 */
} /* line 1513 */
		 /* line 1514 */
  sim_icache_fetch(702 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_4); /* line 1517 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (160 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 1517 */
l_lr_54: ;/* line 1517 */
LABEL(l_lr_54);
  sim_icache_fetch(705 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_2, reg_r0_3, (unsigned int) -11); /* line 1519 */
   SUB(reg_r0_5, (unsigned int) -20, reg_r0_3); /* line 1520 */
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 1521 */
} /* line 1521 */
  sim_icache_fetch(708 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_3, 0, reg_r0_2); /* line 1523 */
   CMPGE(reg_b0_0, reg_r0_2, 0); /* line 1524 */
   AND(reg_r0_7, reg_r0_2, (unsigned int) 31); /* line 1525 */
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 1526 */
} /* line 1526 */
  sim_icache_fetch(712 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 1528 */
} /* line 1528 */
  sim_icache_fetch(713 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_3, reg_r0_4, reg_r0_3); /* line 1530 */
   SHL(reg_r0_2, reg_r0_4, reg_r0_2); /* line 1531 */
   SHL(reg_r0_7, reg_r0_4, reg_r0_7); /* line 1532 */
   LDW(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 1533 */
} /* line 1533 */
  sim_icache_fetch(717 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SLCT(reg_r0_2, reg_b0_0, reg_r0_2, reg_r0_3); /* line 1535 */
   SLCTF(reg_r0_7, reg_b0_0, reg_r0_7, 0); /* line 1536 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 1537 */
} /* line 1537 */
  sim_icache_fetch(720 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_2); /* line 1539 */
} /* line 1539 */
  sim_icache_fetch(721 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_8,0,4), reg_r0_7); /* line 1541 */
} /* line 1541 */
  sim_icache_fetch(722 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_9,0,4), reg_r0_5); /* line 1543 */
} /* line 1543 */
l_L28X3: ;/* line 1545 */
LABEL(l_L28X3);
  sim_icache_fetch(723 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(normalizeFloat64Subnormal);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1547 */
l_L27X3: ;/* line 1550 */
LABEL(l_L27X3);
  sim_icache_fetch(724 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_5); /* line 1551 */
   MOV(reg_r0_3, reg_r0_2); /* line 1552 */
} /* line 1552 */
  sim_icache_fetch(726 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_6); /* line 1554 */
} /* line 1554 */
  sim_icache_fetch(727 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_4); /* line 1556 */
} /* line 1556 */
		 /* line 1557 */
  sim_icache_fetch(728 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_2); /* line 1560 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (160 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 1560 */
l_lr_58: ;/* line 1560 */
LABEL(l_lr_58);
  sim_icache_fetch(731 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_2, reg_r0_3, (unsigned int) -11); /* line 1562 */
   SUB(reg_r0_3, (unsigned int) 12, reg_r0_3); /* line 1563 */
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 1564 */
} /* line 1564 */
  sim_icache_fetch(734 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SUB(reg_r0_5, 0, reg_r0_2); /* line 1566 */
   CMPEQ(reg_b0_0, reg_r0_2, 0); /* line 1567 */
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 1568 */
} /* line 1568 */
  sim_icache_fetch(737 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_5, reg_r0_5, (unsigned int) 31); /* line 1570 */
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 1571 */
} /* line 1571 */
  sim_icache_fetch(739 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_4 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_4, t__i32_0, reg_r0_2); /* line 1573 */
   SHRU(reg_r0_5, t__i32_0, reg_r0_5); /* line 1574 */
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 1575 */
} /* line 1575 */
  sim_icache_fetch(742 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_2, reg_r0_6, reg_r0_2); /* line 1577 */
   LDW(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 1578 */
} /* line 1578 */
  sim_icache_fetch(744 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_2, reg_r0_2, reg_r0_5); /* line 1580 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 1581 */
} /* line 1581 */
  sim_icache_fetch(746 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_7,0,4), reg_r0_4); /* line 1583 */
   SLCT(reg_r0_6, reg_b0_0, reg_r0_6, reg_r0_2); /* line 1584 */
} /* line 1584 */
  sim_icache_fetch(748 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_8,0,4), reg_r0_6); /* line 1586 */
} /* line 1586 */
  sim_icache_fetch(749 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_9,0,4), reg_r0_3); /* line 1588 */
   GOTO(l_L28X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L28X3;
} /* line 1589 */
  reg_l0_0 = t_client_rpc;
  return;

labelfinder:
  switch (t_labelnum >> 5) {
    case 155: goto l_lr_54;
    case 156: goto l_L28X3;
    case 157: goto l_L27X3;
    case 159: goto l_lr_58;
    case 160:
      reg_l0_0 = t_client_rpc;
      return;
    default:
      sim_bad_label(t_labelnum);
    }
}

static sim_result_1_t packFloat64( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(packFloat64);
  sim_check_stack(reg_r0_1, 0); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (161 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(751 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_4, reg_r0_4, (unsigned int) 20); /* line 1608 */
   SHL(reg_r0_3, reg_r0_3, (unsigned int) 31); /* line 1609 */
} /* line 1609 */
  sim_icache_fetch(753 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_5, reg_r0_5, reg_r0_3); /* line 1611 */
} /* line 1611 */
  sim_icache_fetch(754 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_3, reg_r0_5, reg_r0_4); /* line 1614 */
   MOV(reg_r0_4, reg_r0_6); /* line 1616 */
   RETURN(packFloat64);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + 0; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1616 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 161:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

static sim_result_1_t roundAndPackFloat64( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(roundAndPackFloat64);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_r0_7 =  arg4; 
  reg_l0_0 = (188 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(757 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 1631 */
   CMPLT(reg_r0_2, reg_r0_7, 0); /* line 1632 */
} /* line 1632 */
  sim_icache_fetch(759 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 1634 */
} /* line 1634 */
  sim_icache_fetch(760 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((unsigned int) _X1PACKETX2,0,4)); /* line 1636 */
} /* line 1636 */
  sim_icache_fetch(762 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 48),0,4), reg_r0_3); /* line 1638 */
} /* line 1638 */
  sim_icache_fetch(763 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_4); /* line 1640 */
} /* line 1640 */
  sim_icache_fetch(764 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), reg_r0_5); /* line 1642 */
   CMPEQ(reg_r0_3, reg_r0_8, 0); /* line 1643 */
   CMPEQ(reg_b0_0, reg_r0_8, (unsigned int) 3); /* line 1644 */
} /* line 1644 */
  sim_icache_fetch(767 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_6); /* line 1646 */
   CMPEQ(reg_b0_1, reg_r0_3, 0); /* line 1647 */
} /* line 1647 */
  sim_icache_fetch(769 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 64),0,4), reg_r0_7); /* line 1649 */
} /* line 1649 */
  sim_icache_fetch(770 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L29X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1651 */
  sim_icache_fetch(771 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_2, 0); /* line 1653 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L30X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1654 */
l_L29X3: ;/* line 1657 */
LABEL(l_L29X3);
  sim_icache_fetch(773 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 1658 */
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 1659 */
} /* line 1659 */
  sim_icache_fetch(775 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 64),0,4)); /* line 1661 */
} /* line 1661 */
  sim_icache_fetch(776 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_10, mem_trace_ld((unsigned int) _X1PACKETX3,0,4)); /* line 1663 */
} /* line 1663 */
  sim_icache_fetch(778 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ZXTH(reg_r0_11, reg_r0_7); /* line 1665 */
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 64),0,4)); /* line 1666 */
} /* line 1666 */
  sim_icache_fetch(780 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPGE(reg_b0_1, reg_r0_11, (unsigned int) 2045); /* line 1668 */
   CMPNE(reg_b0_2, reg_r0_9, 0); /* line 1669 */
} /* line 1669 */
  sim_icache_fetch(783 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_10, reg_r0_10, (unsigned int) 1); /* line 1671 */
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1672 */
} /* line 1672 */
  sim_icache_fetch(785 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDWs(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 1674 */
   ADD(reg_r0_9, reg_r0_12, reg_r0_12); /* line 1675 */
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L31X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1676 */
l_L32X3: ;/* line 1678 */
LABEL(l_L32X3);
  sim_icache_fetch(788 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_r0_9, reg_r0_9, 0); /* line 1679 */
   LDWs(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 1680 */
   if (!reg_b0_2) {    BRANCHF(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L33X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1681 */
  sim_icache_fetch(791 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_12, reg_r0_13, (unsigned int) 1); /* line 1683 */
   AND(reg_r0_3, reg_r0_3, reg_r0_9); /* line 1684 */
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 1685 */
} /* line 1685 */
  sim_icache_fetch(794 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((unsigned int) _X1PACKETX3,0,4), reg_r0_10); /* line 1687 */
   CMPLTU(reg_r0_13, reg_r0_12, reg_r0_13); /* line 1688 */
   ORC(reg_r0_3, reg_r0_3, 0); /* line 1689 */
} /* line 1689 */
l_L34X3: ;/* line 1691 */
LABEL(l_L34X3);
  sim_icache_fetch(798 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_11, reg_r0_11, reg_r0_13); /* line 1692 */
   AND(reg_r0_12, reg_r0_12, reg_r0_3); /* line 1693 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L35X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1694 */
  sim_icache_fetch(801 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_12); /* line 1696 */
   MOV(reg_r0_3, reg_r0_7); /* line 1697 */
} /* line 1697 */
  sim_icache_fetch(803 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1699 */
} /* line 1699 */
  sim_icache_fetch(804 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), reg_r0_11); /* line 1701 */
} /* line 1701 */
l_L36X3: ;/* line 1703 */
LABEL(l_L36X3);
  sim_icache_fetch(805 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 1704 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1705 */
   ADD_CYCLES(1);
} /* line 1705 */
		 /* line 1706 */
  sim_icache_fetch(807 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (188 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 1708 */
l_lr_66: ;/* line 1708 */
LABEL(l_lr_66);
  sim_icache_fetch(809 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 1710 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 1711 */
   ADD_CYCLES(3);
} /* line 1711 */
  sim_icache_fetch(811 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(roundAndPackFloat64);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1714 */
l_L35X3: ;/* line 1717 */
LABEL(l_L35X3);
  sim_icache_fetch(812 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1718 */
   MOV(reg_r0_3, reg_r0_7); /* line 1719 */
} /* line 1719 */
  sim_icache_fetch(814 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 1721 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 1722 */
   ADD_CYCLES(2);
} /* line 1722 */
  sim_icache_fetch(816 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_5); /* line 1724 */
} /* line 1724 */
  sim_icache_fetch(817 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_0, reg_r0_2, 0); /* line 1726 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1727 */
   ADD_CYCLES(1);
} /* line 1727 */
  sim_icache_fetch(819 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L37X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1729 */
  sim_icache_fetch(820 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), 0); /* line 1731 */
} /* line 1731 */
  sim_icache_fetch(821 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 1733 */
} /* line 1733 */
  sim_icache_fetch(822 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1735 */
} /* line 1735 */
  sim_icache_fetch(823 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L36X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L36X3;
} /* line 1737 */
l_L37X3: ;/* line 1740 */
LABEL(l_L37X3);
  sim_icache_fetch(824 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1741 */
} /* line 1741 */
  sim_icache_fetch(825 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L36X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L36X3;
} /* line 1743 */
l_L33X3: ;/* line 1746 */
LABEL(l_L33X3);
  sim_icache_fetch(826 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_12, reg_r0_13, (unsigned int) 1); /* line 1747 */
   AND(reg_r0_3, reg_r0_3, reg_r0_9); /* line 1748 */
} /* line 1748 */
  sim_icache_fetch(828 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLTU(reg_r0_13, reg_r0_12, reg_r0_13); /* line 1750 */
   ORC(reg_r0_3, reg_r0_3, 0); /* line 1751 */
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 1752 */
} /* line 1752 */
  sim_icache_fetch(831 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L34X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L34X3;
} /* line 1754 */
l_L31X3: ;/* line 1757 */
LABEL(l_L31X3);
  sim_icache_fetch(832 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_r0_5, reg_r0_7, (unsigned int) 2045); /* line 1758 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_8); /* line 1759 */
   MOV(reg_r0_6, reg_r0_3); /* line 1760 */
} /* line 1760 */
  sim_icache_fetch(836 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 1762 */
   ANDL(reg_r0_5, reg_r0_5, reg_r0_2); /* line 1763 */
   MOV(reg_r0_3, (unsigned int) 5); /* line 1764 */
} /* line 1764 */
  sim_icache_fetch(839 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPGT(reg_r0_7, reg_r0_7, (unsigned int) 2045); /* line 1766 */
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1767 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1768 */
   ADD_CYCLES(1);
} /* line 1768 */
  sim_icache_fetch(843 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_r0_12, reg_r0_12, (unsigned int) 2097151); /* line 1770 */
} /* line 1770 */
  sim_icache_fetch(845 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_r0_11, reg_r0_11, (unsigned int) -1); /* line 1772 */
} /* line 1772 */
  sim_icache_fetch(846 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ANDL(reg_r0_12, reg_r0_12, reg_r0_11); /* line 1774 */
} /* line 1774 */
  sim_icache_fetch(847 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ANDL(reg_r0_5, reg_r0_5, reg_r0_12); /* line 1776 */
} /* line 1776 */
  sim_icache_fetch(848 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_b0_1, reg_r0_7, reg_r0_5); /* line 1778 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1779 */
   ADD_CYCLES(1);
} /* line 1779 */
  sim_icache_fetch(850 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L38X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1781 */
		 /* line 1782 */
  sim_icache_fetch(851 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (188 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 1784 */
l_lr_72: ;/* line 1784 */
LABEL(l_lr_72);
  sim_icache_fetch(853 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 1786 */
   MOV(reg_r0_6, (unsigned int) -1); /* line 1787 */
} /* line 1787 */
  sim_icache_fetch(855 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_4, (unsigned int) 2046); /* line 1789 */
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 1790 */
} /* line 1790 */
  sim_icache_fetch(858 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_5, (unsigned int) 1048575); /* line 1792 */
} /* line 1792 */
  sim_icache_fetch(860 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_r0_7, reg_r0_3, 0); /* line 1794 */
} /* line 1794 */
  sim_icache_fetch(861 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_8 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_r0_12, t__i32_0, (unsigned int) 3); /* line 1796 */
   CMPEQ(reg_r0_8, t__i32_0, (unsigned int) 2); /* line 1797 */
   CMPEQ(reg_r0_11, t__i32_0, (unsigned int) 1); /* line 1798 */
} /* line 1798 */
  sim_icache_fetch(864 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_8, reg_r0_3, reg_r0_8); /* line 1800 */
   ANDL(reg_r0_11, reg_r0_11, reg_r0_7); /* line 1801 */
} /* line 1801 */
  sim_icache_fetch(866 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_r0_12, reg_r0_12, reg_r0_11); /* line 1803 */
} /* line 1803 */
  sim_icache_fetch(867 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_b0_0, reg_r0_12, reg_r0_8); /* line 1805 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1806 */
   ADD_CYCLES(1);
} /* line 1806 */
  sim_icache_fetch(869 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L39X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1808 */
		 /* line 1809 */
  sim_icache_fetch(870 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (188 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 1811 */
l_lr_74: ;/* line 1811 */
LABEL(l_lr_74);
  sim_icache_fetch(872 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 1813 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 1814 */
   ADD_CYCLES(3);
} /* line 1814 */
  sim_icache_fetch(874 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(roundAndPackFloat64);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1817 */
l_L39X3: ;/* line 1820 */
LABEL(l_L39X3);
  sim_icache_fetch(875 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 1821 */
   MOV(reg_r0_5, 0); /* line 1822 */
   MOV(reg_r0_6, 0); /* line 1823 */
} /* line 1823 */
  sim_icache_fetch(878 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_4, (unsigned int) 2047); /* line 1825 */
} /* line 1825 */
		 /* line 1826 */
  sim_icache_fetch(880 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (188 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 1828 */
l_lr_77: ;/* line 1828 */
LABEL(l_lr_77);
  sim_icache_fetch(882 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 1830 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 1831 */
   ADD_CYCLES(3);
} /* line 1831 */
  sim_icache_fetch(884 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(roundAndPackFloat64);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 1834 */
l_L38X3: ;/* line 1837 */
LABEL(l_L38X3);
  sim_icache_fetch(885 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_5, reg_r0_1, (unsigned int) 56); /* line 1838 */
   CMPEQ(reg_r0_4, reg_r0_2, 0); /* line 1839 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_6); /* line 1840 */
} /* line 1840 */
  sim_icache_fetch(888 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_6, mem_trace_ld((unsigned int) _X1PACKETX1,0,4)); /* line 1842 */
   ADD(reg_r0_7, reg_r0_1, (unsigned int) 60); /* line 1843 */
} /* line 1843 */
  sim_icache_fetch(891 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 1845 */
   ADD(reg_r0_12, reg_r0_1, (unsigned int) 64); /* line 1846 */
} /* line 1846 */
  sim_icache_fetch(893 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1848 */
   MOV(reg_r0_3, (unsigned int) 2); /* line 1849 */
} /* line 1849 */
  sim_icache_fetch(895 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_14, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 1851 */
   CMPEQ(reg_r0_6, reg_r0_6, (unsigned int) 1); /* line 1852 */
} /* line 1852 */
  sim_icache_fetch(897 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLTU(reg_r0_15, reg_r0_11, (unsigned int) 2097151); /* line 1854 */
   ORL(reg_r0_6, reg_r0_6, reg_r0_4); /* line 1855 */
   MOV(reg_r0_16, reg_r0_11); /* line 1856 */
} /* line 1856 */
  sim_icache_fetch(901 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_r0_4, reg_r0_11, (unsigned int) 2097151); /* line 1858 */
   CMPLTU(reg_r0_17, reg_r0_13, (unsigned int) -1); /* line 1859 */
   ORL(reg_r0_6, reg_r0_6, reg_r0_15); /* line 1860 */
} /* line 1860 */
  sim_icache_fetch(905 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLT(reg_b0_1, reg_r0_14, 0); /* line 1862 */
   SUB(reg_r0_18, 0, reg_r0_14); /* line 1863 */
   CMPLT(reg_r0_15, reg_r0_14, (unsigned int) -1); /* line 1864 */
   ANDL(reg_r0_4, reg_r0_4, reg_r0_17); /* line 1865 */
} /* line 1865 */
  sim_icache_fetch(909 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SUB(reg_r0_17, 0, reg_r0_18); /* line 1867 */
   ORL(reg_r0_15, reg_r0_15, reg_r0_4); /* line 1868 */
   LDWs(reg_r0_19, mem_trace_ld((reg_r0_1 + (unsigned int) 64),0,4)); /* line 1869 */
} /* line 1869 */
  sim_icache_fetch(912 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_b0_1 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ORL(reg_r0_6, reg_r0_6, reg_r0_15); /* line 1871 */
   AND(reg_r0_17, reg_r0_17, (unsigned int) 31); /* line 1872 */
   CMPEQ(reg_b0_1, reg_r0_18, 0); /* line 1873 */
   if (!t__i32_0) {    BRANCHF(t__i32_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L40X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1874 */
  sim_icache_fetch(916 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_4, reg_r0_13); /* line 1876 */
} /* line 1876 */
  sim_icache_fetch(917 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_14, reg_r0_19); /* line 1878 */
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L41X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1879 */
l_L42X3: ;/* line 1881 */
LABEL(l_L42X3);
  sim_icache_fetch(919 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_12,0,4), reg_r0_14); /* line 1882 */
} /* line 1882 */
  sim_icache_fetch(920 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 64),0,4)); /* line 1884 */
} /* line 1884 */
  sim_icache_fetch(921 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_7,0,4), reg_r0_4); /* line 1886 */
} /* line 1886 */
  sim_icache_fetch(922 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_16); /* line 1888 */
} /* line 1888 */
  sim_icache_fetch(923 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), 0); /* line 1890 */
   ANDL(reg_b0_1, reg_r0_6, reg_r0_11); /* line 1891 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1892 */
   ADD_CYCLES(1);
} /* line 1892 */
  sim_icache_fetch(926 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L43X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1894 */
		 /* line 1895 */
  sim_icache_fetch(927 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (188 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 1897 */
l_lr_81: ;/* line 1897 */
LABEL(l_lr_81);
l_L43X3: ;/* line 1899 */
LABEL(l_L43X3);
  sim_icache_fetch(929 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 1900 */
} /* line 1900 */
  sim_icache_fetch(930 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 64),0,4)); /* line 1902 */
} /* line 1902 */
  sim_icache_fetch(931 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 1904 */
} /* line 1904 */
  sim_icache_fetch(932 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_b0_1, reg_r0_4, 0); /* line 1906 */
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 1907 */
} /* line 1907 */
  sim_icache_fetch(934 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_r0_4, reg_r0_5, 0); /* line 1909 */
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 64),0,4)); /* line 1910 */
} /* line 1910 */
  sim_icache_fetch(936 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_r0_7, reg_r0_8, (unsigned int) 1); /* line 1912 */
   CMPEQ(reg_r0_11, reg_r0_8, (unsigned int) 2); /* line 1913 */
   LDWs(reg_r0_12, mem_trace_ld((unsigned int) _X1PACKETX3,0,4)); /* line 1914 */
} /* line 1914 */
  sim_icache_fetch(940 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ANDL(reg_r0_7, reg_r0_5, reg_r0_7); /* line 1916 */
   ANDL(reg_r0_11, reg_r0_5, reg_r0_11); /* line 1917 */
   CMPNE(reg_b0_3, reg_r0_3, 0); /* line 1918 */
} /* line 1918 */
  sim_icache_fetch(943 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SLCT(reg_r0_7, reg_b0_1, reg_r0_7, reg_r0_11); /* line 1920 */
   CMPNE(reg_b0_2, reg_r0_6, 0); /* line 1921 */
   LDWs(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 64),0,4)); /* line 1922 */
} /* line 1922 */
  sim_icache_fetch(946 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_2, reg_b0_3, reg_r0_4, reg_r0_7); /* line 1924 */
   OR(reg_r0_10, reg_r0_12, (unsigned int) 1); /* line 1925 */
} /* line 1925 */
  sim_icache_fetch(948 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 1927 */
} /* line 1927 */
  sim_icache_fetch(949 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_9, reg_r0_5, reg_r0_5); /* line 1929 */
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1930 */
} /* line 1930 */
  sim_icache_fetch(951 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 1932 */
   GOTO(l_L32X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L32X3;
} /* line 1933 */
l_L41X3: ;/* line 1936 */
LABEL(l_L41X3);
  sim_icache_fetch(953 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLT(reg_b0_0, reg_r0_18, (unsigned int) 32); /* line 1937 */
   SHL(reg_r0_9, reg_r0_13, reg_r0_17); /* line 1938 */
   SHRU(reg_r0_10, reg_r0_13, reg_r0_18); /* line 1939 */
   CMPNE(reg_r0_2, reg_r0_19, 0); /* line 1940 */
} /* line 1940 */
  sim_icache_fetch(957 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_15, reg_r0_11, reg_r0_17); /* line 1942 */
   SHRU(reg_r0_16, reg_r0_11, reg_r0_18); /* line 1943 */
   OR(reg_r0_14, reg_r0_2, reg_r0_9); /* line 1944 */
   MOV(reg_r0_3, (unsigned int) 2); /* line 1945 */
} /* line 1945 */
  sim_icache_fetch(961 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_4, reg_r0_10, reg_r0_15); /* line 1947 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L44X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 1949 */
  sim_icache_fetch(963 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L42X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L42X3;
} /* line 1951 */
l_L44X3: ;/* line 1954 */
LABEL(l_L44X3);
  sim_icache_fetch(964 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPGE(reg_b0_1, reg_r0_18, (unsigned int) 64); /* line 1955 */
   CMPNE(reg_r0_2, reg_r0_11, 0); /* line 1956 */
   CMPEQ(reg_b0_0, reg_r0_18, (unsigned int) 64); /* line 1957 */
   SHL(reg_r0_17, reg_r0_11, reg_r0_17); /* line 1958 */
} /* line 1958 */
  sim_icache_fetch(968 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_b0_0 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_0, reg_r0_18, (unsigned int) 32); /* line 1960 */
   OR(reg_r0_8, reg_r0_13, reg_r0_19); /* line 1961 */
   SLCT(reg_r0_2, t__i32_0, reg_r0_11, reg_r0_2); /* line 1962 */
   AND(reg_r0_18, reg_r0_18, (unsigned int) 31); /* line 1963 */
} /* line 1963 */
  sim_icache_fetch(972 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_18, reg_r0_11, reg_r0_18); /* line 1965 */
   MOV(reg_r0_16, 0); /* line 1966 */
   SLCT(reg_r0_2, reg_b0_1, reg_r0_2, reg_r0_17); /* line 1967 */
   SLCT(reg_r0_19, reg_b0_0, reg_r0_19, reg_r0_8); /* line 1968 */
} /* line 1968 */
  sim_icache_fetch(976 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SLCT(reg_r0_9, reg_b0_0, reg_r0_13, reg_r0_2); /* line 1970 */
   SLCTF(reg_r0_18, reg_b0_1, reg_r0_18, 0); /* line 1971 */
   CMPNE(reg_r0_2, reg_r0_19, 0); /* line 1972 */
   MOV(reg_r0_3, (unsigned int) 2); /* line 1973 */
} /* line 1973 */
  sim_icache_fetch(980 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SLCT(reg_r0_4, reg_b0_0, reg_r0_11, reg_r0_18); /* line 1975 */
   OR(reg_r0_14, reg_r0_2, reg_r0_9); /* line 1976 */
   GOTO(l_L42X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L42X3;
} /* line 1977 */
l_L40X3: ;/* line 1980 */
LABEL(l_L40X3);
  sim_icache_fetch(983 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 1981 */
} /* line 1981 */
  sim_icache_fetch(984 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 1983 */
} /* line 1983 */
  sim_icache_fetch(985 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 1985 */
   GOTO(l_L32X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L32X3;
} /* line 1986 */
l_L30X3: ;/* line 1989 */
LABEL(l_L30X3);
  sim_icache_fetch(987 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 1990 */
   CMPEQ(reg_r0_5, reg_r0_8, (unsigned int) 1); /* line 1991 */
   CMPEQ(reg_r0_6, reg_r0_8, (unsigned int) 2); /* line 1992 */
} /* line 1992 */
  sim_icache_fetch(990 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 64),0,4)); /* line 1994 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 1995 */
   ADD_CYCLES(1);
} /* line 1995 */
  sim_icache_fetch(992 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_4, 0); /* line 1997 */
} /* line 1997 */
  sim_icache_fetch(993 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_5, reg_r0_5, reg_r0_7); /* line 1999 */
   ANDL(reg_r0_7, reg_r0_7, reg_r0_6); /* line 2000 */
} /* line 2000 */
  sim_icache_fetch(995 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_2, reg_b0_0, reg_r0_5, reg_r0_7); /* line 2002 */
   GOTO(l_L29X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L29X3;
} /* line 2003 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 162: goto l_L29X3;
    case 163: goto l_L32X3;
    case 164: goto l_L34X3;
    case 165: goto l_L36X3;
    case 167: goto l_lr_66;
    case 168: goto l_L35X3;
    case 169: goto l_L37X3;
    case 170: goto l_L33X3;
    case 171: goto l_L31X3;
    case 173: goto l_lr_72;
    case 175: goto l_lr_74;
    case 176: goto l_L39X3;
    case 178: goto l_lr_77;
    case 179: goto l_L38X3;
    case 180: goto l_L42X3;
    case 182: goto l_lr_81;
    case 183: goto l_L43X3;
    case 184: goto l_L41X3;
    case 185: goto l_L44X3;
    case 186: goto l_L40X3;
    case 187: goto l_L30X3;
    case 188:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

static sim_result_1_t normalizeRoundAndPackFloat64( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(normalizeRoundAndPackFloat64);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (199 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(997 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 2022 */
   CMPEQ(reg_b0_0, reg_r0_5, 0); /* line 2023 */
   ADD(reg_r0_2, reg_r0_4, (unsigned int) -32); /* line 2024 */
} /* line 2024 */
  sim_icache_fetch(1000 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_l0_0); /* line 2026 */
} /* line 2026 */
  sim_icache_fetch(1001 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 48),0,4), reg_r0_3); /* line 2028 */
} /* line 2028 */
  sim_icache_fetch(1002 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_4); /* line 2030 */
} /* line 2030 */
  sim_icache_fetch(1003 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), reg_r0_5); /* line 2032 */
} /* line 2032 */
  sim_icache_fetch(1004 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_6); /* line 2034 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L45X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2035 */
  sim_icache_fetch(1006 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), reg_r0_6); /* line 2037 */
} /* line 2037 */
  sim_icache_fetch(1007 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 2039 */
} /* line 2039 */
  sim_icache_fetch(1008 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), 0); /* line 2041 */
} /* line 2041 */
		 /* line 2042 */
  sim_icache_fetch(1009 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_2); /* line 2044 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (199 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 2045 */
l_lr_89: ;/* line 2045 */
LABEL(l_lr_89);
l_L46X3: ;/* line 2047 */
LABEL(l_L46X3);
  sim_icache_fetch(1012 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_3, reg_r0_3, (unsigned int) -11); /* line 2048 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 2049 */
} /* line 2049 */
  sim_icache_fetch(1014 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPGE(reg_b0_0, reg_r0_3, 0); /* line 2051 */
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 2052 */
   SUB(reg_r0_9, 0, reg_r0_3); /* line 2053 */
} /* line 2053 */
  sim_icache_fetch(1017 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_9, reg_r0_9, (unsigned int) 31); /* line 2055 */
   CMPEQ(reg_b0_1, reg_r0_3, 0); /* line 2056 */
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 2057 */
} /* line 2057 */
  sim_icache_fetch(1020 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_11, reg_r0_2, reg_r0_3); /* line 2059 */
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 2060 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L47X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2061 */
  sim_icache_fetch(1023 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), 0); /* line 2063 */
   SHL(reg_r0_13, reg_r0_8, reg_r0_3); /* line 2064 */
   SHRU(reg_r0_9, reg_r0_8, reg_r0_9); /* line 2065 */
} /* line 2065 */
  sim_icache_fetch(1026 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_13); /* line 2067 */
   OR(reg_r0_11, reg_r0_11, reg_r0_9); /* line 2068 */
   SUB(reg_r0_4, reg_r0_10, reg_r0_3); /* line 2069 */
} /* line 2069 */
  sim_icache_fetch(1029 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SLCT(reg_r0_2, reg_b0_1, reg_r0_2, reg_r0_11); /* line 2071 */
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 2072 */
   MOV(reg_r0_3, reg_r0_12); /* line 2073 */
} /* line 2073 */
  sim_icache_fetch(1032 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), reg_r0_2); /* line 2075 */
} /* line 2075 */
l_L48X3: ;/* line 2077 */
LABEL(l_L48X3);
  sim_icache_fetch(1033 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 2078 */
} /* line 2078 */
  sim_icache_fetch(1034 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 2080 */
} /* line 2080 */
  sim_icache_fetch(1035 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_4); /* line 2082 */
} /* line 2082 */
		 /* line 2083 */
  sim_icache_fetch(1036 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(roundAndPackFloat64);
   reg_l0_0 = (199 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) roundAndPackFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 2085 */
l_lr_93: ;/* line 2085 */
LABEL(l_lr_93);
  sim_icache_fetch(1038 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2087 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2088 */
   ADD_CYCLES(3);
} /* line 2088 */
  sim_icache_fetch(1040 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(normalizeRoundAndPackFloat64);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2091 */
l_L47X3: ;/* line 2094 */
LABEL(l_L47X3);
  sim_icache_fetch(1041 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 2095 */
   SUB(reg_r0_5, 0, reg_r0_3); /* line 2096 */
} /* line 2096 */
  sim_icache_fetch(1043 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_6, 0, reg_r0_5); /* line 2098 */
   CMPEQ(reg_b0_2, reg_r0_5, (unsigned int) 32); /* line 2099 */
   CMPGE(reg_b0_1, reg_r0_5, (unsigned int) 64); /* line 2100 */
   CMPEQ(reg_b0_0, reg_r0_5, (unsigned int) 64); /* line 2101 */
} /* line 2101 */
  sim_icache_fetch(1047 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 2103 */
   AND(reg_r0_6, reg_r0_6, (unsigned int) 31); /* line 2104 */
   CMPGE(reg_b0_3, reg_r0_5, (unsigned int) 32); /* line 2105 */
} /* line 2105 */
  sim_icache_fetch(1050 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPNE(reg_r0_8, reg_r0_2, 0); /* line 2107 */
   SHRU(reg_r0_11, reg_r0_2, reg_r0_5); /* line 2108 */
   SHL(reg_r0_9, reg_r0_2, reg_r0_6); /* line 2109 */
   CMPNE(reg_b0_4, reg_r0_5, 0); /* line 2110 */
} /* line 2110 */
  sim_icache_fetch(1054 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   AND(reg_r0_12, reg_r0_5, (unsigned int) 31); /* line 2112 */
   SLCT(reg_r0_8, reg_b0_0, reg_r0_2, reg_r0_8); /* line 2113 */
   SLCTF(reg_r0_11, reg_b0_3, reg_r0_11, 0); /* line 2114 */
   CMPEQ(reg_b0_0, reg_r0_5, 0); /* line 2115 */
} /* line 2115 */
  sim_icache_fetch(1058 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_6, reg_r0_7, reg_r0_6); /* line 2117 */
   SLCT(reg_r0_8, reg_b0_1, reg_r0_8, reg_r0_9); /* line 2118 */
   SLCTF(reg_r0_13, reg_b0_2, reg_r0_7, 0); /* line 2119 */
   SLCT(reg_r0_11, reg_b0_0, reg_r0_2, reg_r0_11); /* line 2120 */
} /* line 2120 */
  sim_icache_fetch(1062 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_14, reg_r0_7, reg_r0_5); /* line 2122 */
   SHRU(reg_r0_12, reg_r0_2, reg_r0_12); /* line 2123 */
   SLCT(reg_r0_8, reg_b0_2, reg_r0_7, reg_r0_8); /* line 2124 */
   SLCT(reg_r0_13, reg_b0_3, reg_r0_13, 0); /* line 2125 */
} /* line 2125 */
  sim_icache_fetch(1066 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   OR(reg_r0_14, reg_r0_14, reg_r0_9); /* line 2127 */
   SLCT(reg_r0_8, reg_b0_3, reg_r0_8, reg_r0_6); /* line 2128 */
   SLCTF(reg_r0_12, reg_b0_1, reg_r0_12, 0); /* line 2129 */
   CMPNE(reg_r0_13, reg_r0_13, 0); /* line 2130 */
} /* line 2130 */
  sim_icache_fetch(1070 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SLCT(reg_r0_2, reg_b0_2, reg_r0_2, reg_r0_12); /* line 2132 */
   CMPEQ(reg_b0_0, reg_r0_5, 0); /* line 2133 */
   OR(reg_r0_8, reg_r0_8, reg_r0_13); /* line 2134 */
   SUB(reg_r0_4, reg_r0_10, reg_r0_3); /* line 2135 */
} /* line 2135 */
  sim_icache_fetch(1074 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_2, reg_b0_3, reg_r0_2, reg_r0_14); /* line 2137 */
   SLCT(reg_r0_8, reg_b0_4, reg_r0_8, 0); /* line 2138 */
} /* line 2138 */
  sim_icache_fetch(1076 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_7, reg_b0_0, reg_r0_7, reg_r0_2); /* line 2140 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_8); /* line 2141 */
} /* line 2141 */
  sim_icache_fetch(1078 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 2143 */
} /* line 2143 */
  sim_icache_fetch(1079 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), reg_r0_11); /* line 2145 */
} /* line 2145 */
  sim_icache_fetch(1080 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_7); /* line 2147 */
} /* line 2147 */
  sim_icache_fetch(1081 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 2149 */
} /* line 2149 */
  sim_icache_fetch(1082 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L48X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L48X3;
} /* line 2151 */
l_L45X3: ;/* line 2154 */
LABEL(l_L45X3);
  sim_icache_fetch(1083 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 2155 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 2156 */
   ADD_CYCLES(1);
} /* line 2156 */
		 /* line 2157 */
  sim_icache_fetch(1085 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (199 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 2159 */
l_lr_97: ;/* line 2159 */
LABEL(l_lr_97);
  sim_icache_fetch(1087 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L46X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L46X3;
} /* line 2161 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 190: goto l_lr_89;
    case 191: goto l_L46X3;
    case 192: goto l_L48X3;
    case 194: goto l_lr_93;
    case 195: goto l_L47X3;
    case 196: goto l_L45X3;
    case 198: goto l_lr_97;
    case 199:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_ilfloat( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_ilfloat);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (203 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(1088 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 2180 */
   CMPEQ(reg_r0_2, reg_r0_3, 0); /* line 2181 */
   CMPEQ(reg_b0_0, reg_r0_3, 0); /* line 2182 */
} /* line 2182 */
  sim_icache_fetch(1091 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_4, reg_r0_3, (unsigned int) -2147483648); /* line 2184 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 2185 */
} /* line 2185 */
  sim_icache_fetch(1094 + t_thisfile.offset, 5);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ORL(reg_b0_1, reg_r0_2, reg_r0_4); /* line 2187 */
   SLCT(reg_r0_3, reg_b0_0, 0, (unsigned int) -822083584); /* line 2188 */
   MOV(reg_r0_2, t__i32_0); /* line 2189 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 2190 */
   ADD_CYCLES(1);
} /* line 2190 */
  sim_icache_fetch(1099 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L49X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2192 */
  sim_icache_fetch(1100 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_ilfloat);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2195 */
l_L49X3: ;/* line 2198 */
LABEL(l_L49X3);
  sim_icache_fetch(1101 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_6, 0, reg_r0_2); /* line 2199 */
   CMPLT(reg_r0_3, reg_r0_2, 0); /* line 2200 */
   CMPLT(reg_b0_0, reg_r0_2, 0); /* line 2201 */
   MOV(reg_r0_4, (unsigned int) 156); /* line 2202 */
} /* line 2202 */
		 /* line 2203 */
  sim_icache_fetch(1105 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_5, reg_b0_0, reg_r0_6, reg_r0_2); /* line 2205 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(normalizeRoundAndPackFloat32);
   reg_l0_0 = (203 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) normalizeRoundAndPackFloat32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 2206 */
l_lr_101: ;/* line 2206 */
LABEL(l_lr_101);
  sim_icache_fetch(1108 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 2208 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2209 */
   ADD_CYCLES(3);
} /* line 2209 */
  sim_icache_fetch(1110 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_ilfloat);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2212 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 200: goto l_L49X3;
    case 202: goto l_lr_101;
    case 203:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_ufloat( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_ufloat);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (207 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(1111 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 2229 */
   CMPEQ(reg_b0_0, reg_r0_3, 0); /* line 2230 */
   MOV(reg_r0_2, reg_r0_3); /* line 2231 */
} /* line 2231 */
  sim_icache_fetch(1114 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, 0); /* line 2233 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 2234 */
} /* line 2234 */
  sim_icache_fetch(1116 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L50X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2236 */
  sim_icache_fetch(1117 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_ufloat);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2239 */
l_L50X3: ;/* line 2242 */
LABEL(l_L50X3);
		 /* line 2242 */
  sim_icache_fetch(1118 + t_thisfile.offset, 5);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_5, reg_r0_2); /* line 2245 */
   MOV(reg_r0_4, (unsigned int) 156); /* line 2246 */
   MOV(reg_r0_3, 0); /* line 2247 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(normalizeRoundAndPackFloat32);
   reg_l0_0 = (207 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) normalizeRoundAndPackFloat32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 2247 */
l_lr_105: ;/* line 2247 */
LABEL(l_lr_105);
  sim_icache_fetch(1123 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 2249 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2250 */
   ADD_CYCLES(3);
} /* line 2250 */
  sim_icache_fetch(1125 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_ufloat);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2253 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 204: goto l_L50X3;
    case 206: goto l_lr_105;
    case 207:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern sim_result_1_t _d_ilfloat( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(_d_ilfloat);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (217 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(1126 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 2270 */
   CMPEQ(reg_b0_0, reg_r0_3, 0); /* line 2271 */
   MOV(reg_r0_5, 0); /* line 2272 */
} /* line 2272 */
  sim_icache_fetch(1129 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_6, 0); /* line 2274 */
   MOV(reg_r0_4, 0); /* line 2275 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_l0_0); /* line 2276 */
   MOV(reg_r0_2, reg_r0_3); /* line 2277 */
} /* line 2277 */
  sim_icache_fetch(1133 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, 0); /* line 2279 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L51X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2280 */
		 /* line 2281 */
  sim_icache_fetch(1135 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (217 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 2283 */
l_lr_108: ;/* line 2283 */
LABEL(l_lr_108);
  sim_icache_fetch(1137 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2285 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2286 */
   ADD_CYCLES(3);
} /* line 2286 */
  sim_icache_fetch(1139 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_ilfloat);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2289 */
l_L51X3: ;/* line 2292 */
LABEL(l_L51X3);
  sim_icache_fetch(1140 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SUB(reg_r0_6, 0, reg_r0_2); /* line 2293 */
   CMPLT(reg_r0_5, reg_r0_2, 0); /* line 2294 */
} /* line 2294 */
  sim_icache_fetch(1142 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_5); /* line 2296 */
   MTB(reg_b0_0, reg_r0_5); /* line 2297 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 2298 */
   ADD_CYCLES(1);
} /* line 2298 */
  sim_icache_fetch(1145 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_3, reg_b0_0, reg_r0_6, reg_r0_2); /* line 2300 */
} /* line 2300 */
		 /* line 2301 */
  sim_icache_fetch(1146 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_3); /* line 2304 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (217 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 2304 */
l_lr_111: ;/* line 2304 */
LABEL(l_lr_111);
  sim_icache_fetch(1149 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_2, reg_r0_3, (unsigned int) -11); /* line 2306 */
   SUB(reg_r0_4, (unsigned int) 1053, reg_r0_3); /* line 2307 */
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 2308 */
} /* line 2308 */
  sim_icache_fetch(1153 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPGE(reg_b0_0, reg_r0_2, 0); /* line 2310 */
   MOV(reg_r0_8, reg_r0_3); /* line 2311 */
} /* line 2311 */
  sim_icache_fetch(1155 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 2313 */
} /* line 2313 */
  sim_icache_fetch(1156 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_7, reg_r0_7, reg_r0_2); /* line 2315 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L52X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2316 */
  sim_icache_fetch(1158 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_7); /* line 2318 */
} /* line 2318 */
  sim_icache_fetch(1159 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2320 */
} /* line 2320 */
  sim_icache_fetch(1160 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), 0); /* line 2322 */
} /* line 2322 */
l_L53X3: ;/* line 2324 */
LABEL(l_L53X3);
  sim_icache_fetch(1161 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 2325 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 2326 */
   ADD_CYCLES(1);
} /* line 2326 */
		 /* line 2327 */
  sim_icache_fetch(1163 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (217 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 2329 */
l_lr_114: ;/* line 2329 */
LABEL(l_lr_114);
  sim_icache_fetch(1165 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2331 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2332 */
   ADD_CYCLES(3);
} /* line 2332 */
  sim_icache_fetch(1167 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_ilfloat);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2335 */
l_L52X3: ;/* line 2338 */
LABEL(l_L52X3);
  sim_icache_fetch(1168 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SUB(reg_r0_2, 0, reg_r0_2); /* line 2339 */
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 2340 */
} /* line 2340 */
  sim_icache_fetch(1170 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ZXTH(reg_r0_7, reg_r0_2); /* line 2342 */
   SUB(reg_r0_6, 0, reg_r0_2); /* line 2343 */
   AND(reg_r0_2, reg_r0_2, (unsigned int) 31); /* line 2344 */
} /* line 2344 */
  sim_icache_fetch(1173 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   AND(reg_r0_6, reg_r0_6, (unsigned int) 31); /* line 2346 */
   SHRU(reg_r0_8, 0, reg_r0_7); /* line 2347 */
   CMPGE(reg_b0_1, reg_r0_7, (unsigned int) 32); /* line 2348 */
   CMPLT(reg_b0_0, reg_r0_7, (unsigned int) 64); /* line 2349 */
} /* line 2349 */
  sim_icache_fetch(1177 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_9, reg_r0_5, reg_r0_7); /* line 2351 */
   SHL(reg_r0_6, reg_r0_5, reg_r0_6); /* line 2352 */
   SHRU(reg_r0_2, reg_r0_5, reg_r0_2); /* line 2353 */
   CMPNE(reg_b0_2, reg_r0_7, 0); /* line 2354 */
} /* line 2354 */
  sim_icache_fetch(1181 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   OR(reg_r0_6, reg_r0_6, reg_r0_8); /* line 2356 */
   SLCT(reg_r0_2, reg_b0_0, reg_r0_2, 0); /* line 2357 */
   SLCTF(reg_r0_9, reg_b0_1, reg_r0_9, 0); /* line 2358 */
   CMPEQ(reg_b0_0, reg_r0_7, 0); /* line 2359 */
} /* line 2359 */
  sim_icache_fetch(1185 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_5, reg_b0_0, reg_r0_5, reg_r0_9); /* line 2361 */
   SLCT(reg_r0_2, reg_b0_1, reg_r0_2, reg_r0_6); /* line 2362 */
} /* line 2362 */
  sim_icache_fetch(1187 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_5); /* line 2364 */
   SLCT(reg_r0_2, reg_b0_2, reg_r0_2, 0); /* line 2365 */
} /* line 2365 */
  sim_icache_fetch(1189 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_2); /* line 2367 */
} /* line 2367 */
  sim_icache_fetch(1190 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2369 */
} /* line 2369 */
  sim_icache_fetch(1191 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L53X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L53X3;
} /* line 2371 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 209: goto l_lr_108;
    case 210: goto l_L51X3;
    case 212: goto l_lr_111;
    case 213: goto l_L53X3;
    case 215: goto l_lr_114;
    case 216: goto l_L52X3;
    case 217:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern sim_result_1_t _d_ufloat( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(_d_ufloat);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (227 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(1192 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 2391 */
   CMPEQ(reg_b0_0, reg_r0_3, 0); /* line 2392 */
   MOV(reg_r0_5, 0); /* line 2393 */
} /* line 2393 */
  sim_icache_fetch(1195 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_6, 0); /* line 2395 */
   MOV(reg_r0_4, 0); /* line 2396 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_l0_0); /* line 2397 */
   MOV(reg_r0_2, reg_r0_3); /* line 2398 */
} /* line 2398 */
  sim_icache_fetch(1199 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, 0); /* line 2400 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L54X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2401 */
		 /* line 2402 */
  sim_icache_fetch(1201 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (227 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 2404 */
l_lr_118: ;/* line 2404 */
LABEL(l_lr_118);
  sim_icache_fetch(1203 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2406 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2407 */
   ADD_CYCLES(3);
} /* line 2407 */
  sim_icache_fetch(1205 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_ufloat);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2410 */
l_L54X3: ;/* line 2413 */
LABEL(l_L54X3);
		 /* line 2413 */
  sim_icache_fetch(1206 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_3, reg_r0_2); /* line 2416 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_2); /* line 2417 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (227 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 2417 */
l_lr_121: ;/* line 2417 */
LABEL(l_lr_121);
  sim_icache_fetch(1210 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_2, reg_r0_3, (unsigned int) -11); /* line 2419 */
   SUB(reg_r0_4, (unsigned int) 1053, reg_r0_3); /* line 2420 */
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 2421 */
} /* line 2421 */
  sim_icache_fetch(1214 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPGE(reg_b0_0, reg_r0_2, 0); /* line 2423 */
   MOV(reg_r0_8, reg_r0_3); /* line 2424 */
} /* line 2424 */
  sim_icache_fetch(1216 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_3, 0); /* line 2426 */
} /* line 2426 */
  sim_icache_fetch(1217 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_7, reg_r0_7, reg_r0_2); /* line 2428 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L55X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2429 */
  sim_icache_fetch(1219 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_7); /* line 2431 */
} /* line 2431 */
  sim_icache_fetch(1220 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2433 */
} /* line 2433 */
  sim_icache_fetch(1221 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), 0); /* line 2435 */
} /* line 2435 */
l_L56X3: ;/* line 2437 */
LABEL(l_L56X3);
  sim_icache_fetch(1222 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 2438 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 2439 */
   ADD_CYCLES(1);
} /* line 2439 */
		 /* line 2440 */
  sim_icache_fetch(1224 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (227 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 2442 */
l_lr_124: ;/* line 2442 */
LABEL(l_lr_124);
  sim_icache_fetch(1226 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2444 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2445 */
   ADD_CYCLES(3);
} /* line 2445 */
  sim_icache_fetch(1228 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_ufloat);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2448 */
l_L55X3: ;/* line 2451 */
LABEL(l_L55X3);
  sim_icache_fetch(1229 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SUB(reg_r0_2, 0, reg_r0_2); /* line 2452 */
   MOV(reg_r0_3, 0); /* line 2453 */
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 2454 */
} /* line 2454 */
  sim_icache_fetch(1232 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ZXTH(reg_r0_7, reg_r0_2); /* line 2456 */
   SUB(reg_r0_6, 0, reg_r0_2); /* line 2457 */
   AND(reg_r0_2, reg_r0_2, (unsigned int) 31); /* line 2458 */
} /* line 2458 */
  sim_icache_fetch(1235 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   AND(reg_r0_6, reg_r0_6, (unsigned int) 31); /* line 2460 */
   SHRU(reg_r0_8, 0, reg_r0_7); /* line 2461 */
   CMPGE(reg_b0_1, reg_r0_7, (unsigned int) 32); /* line 2462 */
   CMPLT(reg_b0_0, reg_r0_7, (unsigned int) 64); /* line 2463 */
} /* line 2463 */
  sim_icache_fetch(1239 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_9, reg_r0_5, reg_r0_7); /* line 2465 */
   SHL(reg_r0_6, reg_r0_5, reg_r0_6); /* line 2466 */
   SHRU(reg_r0_2, reg_r0_5, reg_r0_2); /* line 2467 */
   CMPNE(reg_b0_2, reg_r0_7, 0); /* line 2468 */
} /* line 2468 */
  sim_icache_fetch(1243 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   OR(reg_r0_6, reg_r0_6, reg_r0_8); /* line 2470 */
   SLCT(reg_r0_2, reg_b0_0, reg_r0_2, 0); /* line 2471 */
   SLCTF(reg_r0_9, reg_b0_1, reg_r0_9, 0); /* line 2472 */
   CMPEQ(reg_b0_0, reg_r0_7, 0); /* line 2473 */
} /* line 2473 */
  sim_icache_fetch(1247 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_5, reg_b0_0, reg_r0_5, reg_r0_9); /* line 2475 */
   SLCT(reg_r0_2, reg_b0_1, reg_r0_2, reg_r0_6); /* line 2476 */
} /* line 2476 */
  sim_icache_fetch(1249 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_5); /* line 2478 */
   SLCT(reg_r0_2, reg_b0_2, reg_r0_2, 0); /* line 2479 */
} /* line 2479 */
  sim_icache_fetch(1251 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_2); /* line 2481 */
} /* line 2481 */
  sim_icache_fetch(1252 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2483 */
} /* line 2483 */
  sim_icache_fetch(1253 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L56X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L56X3;
} /* line 2485 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 219: goto l_lr_118;
    case 220: goto l_L54X3;
    case 222: goto l_lr_121;
    case 223: goto l_L56X3;
    case 225: goto l_lr_124;
    case 226: goto l_L55X3;
    case 227:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

static unsigned int float32_to_int32_round_to_zero( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(float32_to_int32_round_to_zero);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (236 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(1254 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 2505 */
   AND(reg_r0_2, reg_r0_3, (unsigned int) 8388607); /* line 2506 */
} /* line 2506 */
  sim_icache_fetch(1257 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_6, reg_r0_3, (unsigned int) 23); /* line 2508 */
   SHRU(reg_r0_5, reg_r0_3, (unsigned int) 31); /* line 2509 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 2510 */
   MOV(reg_r0_7, reg_r0_3); /* line 2511 */
} /* line 2511 */
  sim_icache_fetch(1261 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_6, reg_r0_6, (unsigned int) 255); /* line 2513 */
   LDWs(reg_r0_8, mem_trace_ld((unsigned int) _X1PACKETX3,0,4)); /* line 2514 */
   MOV(reg_r0_3, 0); /* line 2515 */
} /* line 2515 */
  sim_icache_fetch(1265 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_9, reg_r0_6, (unsigned int) -158); /* line 2517 */
   CMPLE(reg_b0_0, reg_r0_6, (unsigned int) 126); /* line 2518 */
   OR(reg_r0_10, reg_r0_2, reg_r0_6); /* line 2519 */
} /* line 2519 */
  sim_icache_fetch(1268 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPGE(reg_b0_1, reg_r0_9, 0); /* line 2521 */
   CMPNE(reg_b0_2, reg_r0_10, 0); /* line 2522 */
} /* line 2522 */
  sim_icache_fetch(1270 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_8, reg_r0_8, (unsigned int) 1); /* line 2524 */
} /* line 2524 */
  sim_icache_fetch(1271 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L57X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2526 */
  sim_icache_fetch(1272 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L58X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2528 */
  sim_icache_fetch(1273 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_2) {    BRANCHF(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L59X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2530 */
  sim_icache_fetch(1274 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((unsigned int) _X1PACKETX3,0,4), reg_r0_8); /* line 2533 */
   RETURN(float32_to_int32_round_to_zero);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2534 */
l_L59X3: ;/* line 2537 */
LABEL(l_L59X3);
  sim_icache_fetch(1277 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, 0); /* line 2540 */
   RETURN(float32_to_int32_round_to_zero);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2540 */
l_L58X3: ;/* line 2543 */
LABEL(l_L58X3);
  sim_icache_fetch(1279 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   OR(reg_r0_2, reg_r0_2, (unsigned int) 8388608); /* line 2544 */
   SUB(reg_r0_4, 0, reg_r0_9); /* line 2545 */
   AND(reg_r0_6, reg_r0_9, (unsigned int) 31); /* line 2546 */
} /* line 2546 */
  sim_icache_fetch(1283 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_2, reg_r0_2, (unsigned int) 8); /* line 2548 */
   LDWs(reg_r0_7, mem_trace_ld((unsigned int) _X1PACKETX3,0,4)); /* line 2549 */
   MTB(reg_b0_0, reg_r0_5); /* line 2550 */
} /* line 2550 */
  sim_icache_fetch(1287 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHRU(reg_r0_4, reg_r0_2, reg_r0_4); /* line 2552 */
   SHL(reg_r0_6, reg_r0_2, reg_r0_6); /* line 2553 */
} /* line 2553 */
  sim_icache_fetch(1289 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_b0_1, reg_r0_6, 0); /* line 2555 */
   SUB(reg_r0_2, 0, reg_r0_4); /* line 2556 */
} /* line 2556 */
  sim_icache_fetch(1291 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_7, reg_r0_7, (unsigned int) 1); /* line 2558 */
   SLCT(reg_r0_3, reg_b0_0, reg_r0_2, reg_r0_4); /* line 2559 */
} /* line 2559 */
  sim_icache_fetch(1293 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L60X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2561 */
  sim_icache_fetch(1294 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((unsigned int) _X1PACKETX3,0,4), reg_r0_7); /* line 2564 */
   RETURN(float32_to_int32_round_to_zero);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2565 */
l_L60X3: ;/* line 2568 */
LABEL(l_L60X3);
  sim_icache_fetch(1297 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(float32_to_int32_round_to_zero);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2570 */
l_L57X3: ;/* line 2573 */
LABEL(l_L57X3);
  sim_icache_fetch(1298 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_0, reg_r0_7, (unsigned int) -822083584); /* line 2574 */
   CMPEQ(reg_b0_1, reg_r0_4, 0); /* line 2575 */
} /* line 2575 */
  sim_icache_fetch(1301 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_3, reg_b0_1, 0, (unsigned int) -2147483648); /* line 2577 */
} /* line 2577 */
  sim_icache_fetch(1303 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L61X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2579 */
  sim_icache_fetch(1304 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(float32_to_int32_round_to_zero);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2582 */
l_L61X3: ;/* line 2585 */
LABEL(l_L61X3);
  sim_icache_fetch(1305 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_4); /* line 2586 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 2587 */
} /* line 2587 */
  sim_icache_fetch(1307 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_5); /* line 2589 */
} /* line 2589 */
  sim_icache_fetch(1308 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_2); /* line 2591 */
} /* line 2591 */
		 /* line 2592 */
  sim_icache_fetch(1309 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_6); /* line 2595 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (236 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 2595 */
l_lr_133: ;/* line 2595 */
LABEL(l_lr_133);
  sim_icache_fetch(1312 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_2, (unsigned int) 2147483647); /* line 2597 */
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 2598 */
} /* line 2598 */
  sim_icache_fetch(1315 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 2600 */
} /* line 2600 */
  sim_icache_fetch(1316 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2602 */
} /* line 2602 */
  sim_icache_fetch(1317 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_6, reg_r0_6, (unsigned int) 255); /* line 2604 */
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2605 */
} /* line 2605 */
  sim_icache_fetch(1319 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_6, reg_r0_6, reg_r0_5); /* line 2607 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 2608 */
} /* line 2608 */
  sim_icache_fetch(1321 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_r0_7, reg_r0_7, 0); /* line 2610 */
} /* line 2610 */
  sim_icache_fetch(1322 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_b0_0, reg_r0_7, reg_r0_6); /* line 2612 */
   CMPNE(reg_b0_1, reg_r0_4, 0); /* line 2613 */
} /* line 2613 */
  sim_icache_fetch(1324 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_3, reg_b0_1, reg_r0_2, (unsigned int) -1); /* line 2615 */
} /* line 2615 */
  sim_icache_fetch(1325 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L62X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2617 */
  sim_icache_fetch(1326 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(float32_to_int32_round_to_zero);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2620 */
l_L62X3: ;/* line 2623 */
LABEL(l_L62X3);
  sim_icache_fetch(1327 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2624 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 2625 */
   ADD_CYCLES(2);
} /* line 2625 */
  sim_icache_fetch(1329 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_0, reg_r0_4, 0); /* line 2627 */
} /* line 2627 */
  sim_icache_fetch(1330 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_3, reg_b0_0, 0, (unsigned int) -2147483648); /* line 2630 */
   RETURN(float32_to_int32_round_to_zero);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2631 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 228: goto l_L59X3;
    case 229: goto l_L58X3;
    case 230: goto l_L60X3;
    case 231: goto l_L57X3;
    case 232: goto l_L61X3;
    case 234: goto l_lr_133;
    case 235: goto l_L62X3;
    case 236:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern sim_result_1_t _d_r( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(_d_r);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (254 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(1333 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 2649 */
   AND(reg_r0_2, reg_r0_3, (unsigned int) 8388607); /* line 2650 */
} /* line 2650 */
  sim_icache_fetch(1336 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_8, reg_r0_3, (unsigned int) 23); /* line 2652 */
   SHRU(reg_r0_7, reg_r0_3, (unsigned int) 31); /* line 2653 */
   SHRU(reg_r0_5, reg_r0_2, (unsigned int) 3); /* line 2654 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_l0_0); /* line 2655 */
} /* line 2655 */
  sim_icache_fetch(1340 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_8, reg_r0_8, (unsigned int) 255); /* line 2657 */
   SHL(reg_r0_6, reg_r0_2, (unsigned int) 29); /* line 2658 */
   MOV(reg_r0_9, reg_r0_3); /* line 2659 */
} /* line 2659 */
  sim_icache_fetch(1343 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_b0_0, reg_r0_8, (unsigned int) 255); /* line 2661 */
   CMPEQ(reg_b0_1, reg_r0_8, 0); /* line 2662 */
   ADD(reg_r0_4, reg_r0_8, (unsigned int) 896); /* line 2663 */
} /* line 2663 */
  sim_icache_fetch(1347 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_3, reg_r0_7); /* line 2665 */
} /* line 2665 */
  sim_icache_fetch(1348 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L63X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2667 */
  sim_icache_fetch(1349 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L64X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2669 */
l_L65X3: ;/* line 2671 */
LABEL(l_L65X3);
  sim_icache_fetch(1350 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_5); /* line 2672 */
} /* line 2672 */
		 /* line 2673 */
  sim_icache_fetch(1351 + t_thisfile.offset, 3);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_6); /* line 2675 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (254 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 2676 */
l_lr_138: ;/* line 2676 */
LABEL(l_lr_138);
  sim_icache_fetch(1354 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2678 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2679 */
   ADD_CYCLES(3);
} /* line 2679 */
  sim_icache_fetch(1356 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_r);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2682 */
l_L64X3: ;/* line 2685 */
LABEL(l_L64X3);
  sim_icache_fetch(1357 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_0, reg_r0_2, 0); /* line 2686 */
   MOV(reg_r0_5, 0); /* line 2687 */
   MOV(reg_r0_6, 0); /* line 2688 */
   MOV(reg_r0_3, reg_r0_7); /* line 2689 */
} /* line 2689 */
  sim_icache_fetch(1361 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_4, 0); /* line 2691 */
} /* line 2691 */
  sim_icache_fetch(1362 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L66X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2693 */
		 /* line 2694 */
  sim_icache_fetch(1363 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (254 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 2696 */
l_lr_141: ;/* line 2696 */
LABEL(l_lr_141);
  sim_icache_fetch(1365 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2698 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2699 */
   ADD_CYCLES(3);
} /* line 2699 */
  sim_icache_fetch(1367 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_r);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2702 */
l_L66X3: ;/* line 2705 */
LABEL(l_L66X3);
  sim_icache_fetch(1368 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_7); /* line 2706 */
   MOV(reg_r0_3, reg_r0_2); /* line 2707 */
} /* line 2707 */
		 /* line 2708 */
  sim_icache_fetch(1370 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_2); /* line 2711 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (254 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 2711 */
l_lr_144: ;/* line 2711 */
LABEL(l_lr_144);
  sim_icache_fetch(1373 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_2, reg_r0_3, (unsigned int) -8); /* line 2713 */
   SUB(reg_r0_8, (unsigned int) 8, reg_r0_3); /* line 2714 */
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 2715 */
} /* line 2715 */
  sim_icache_fetch(1376 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_4, reg_r0_8, (unsigned int) 896); /* line 2717 */
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 2718 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 2719 */
   ADD_CYCLES(1);
} /* line 2719 */
  sim_icache_fetch(1380 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_7, reg_r0_7, reg_r0_2); /* line 2721 */
} /* line 2721 */
  sim_icache_fetch(1381 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHRU(reg_r0_5, reg_r0_7, (unsigned int) 3); /* line 2723 */
   SHL(reg_r0_6, reg_r0_7, (unsigned int) 29); /* line 2724 */
   GOTO(l_L65X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L65X3;
} /* line 2725 */
l_L63X3: ;/* line 2728 */
LABEL(l_L63X3);
  sim_icache_fetch(1384 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 2729 */
   MOV(reg_r0_3, reg_r0_9); /* line 2730 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 2731 */
   ADD_CYCLES(1);
} /* line 2731 */
  sim_icache_fetch(1387 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L67X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2733 */
		 /* line 2734 */
  sim_icache_fetch(1388 + t_thisfile.offset, 2);
{
  sim_result_0_t t_sim_result_0_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float32ToCommonNaN);
   reg_l0_0 = (254 << 5);
   {
    typedef sim_result_0_t t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float32ToCommonNaN;
    t_sim_result_0_t =     (*t_call)(reg_r0_3);
    reg_r0_3 = t_sim_result_0_t.alias0;
    reg_r0_4 = t_sim_result_0_t.alias1;
    reg_r0_5 = t_sim_result_0_t.alias2;
   }
} /* line 2736 */
l_lr_147: ;/* line 2736 */
LABEL(l_lr_147);
		 /* line 2737 */
  sim_icache_fetch(1390 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(commonNaNToFloat64);
   reg_l0_0 = (254 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) commonNaNToFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 2739 */
l_lr_149: ;/* line 2739 */
LABEL(l_lr_149);
  sim_icache_fetch(1392 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2741 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2742 */
   ADD_CYCLES(3);
} /* line 2742 */
  sim_icache_fetch(1394 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_r);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2745 */
l_L67X3: ;/* line 2748 */
LABEL(l_L67X3);
  sim_icache_fetch(1395 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_5, 0); /* line 2749 */
   MOV(reg_r0_6, 0); /* line 2750 */
   MOV(reg_r0_3, reg_r0_7); /* line 2751 */
} /* line 2751 */
		 /* line 2752 */
  sim_icache_fetch(1398 + t_thisfile.offset, 4);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_4, (unsigned int) 2047); /* line 2755 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (254 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 2755 */
l_lr_152: ;/* line 2755 */
LABEL(l_lr_152);
  sim_icache_fetch(1402 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2757 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2758 */
   ADD_CYCLES(3);
} /* line 2758 */
  sim_icache_fetch(1404 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_r);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2761 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 237: goto l_L65X3;
    case 239: goto l_lr_138;
    case 240: goto l_L64X3;
    case 242: goto l_lr_141;
    case 243: goto l_L66X3;
    case 245: goto l_lr_144;
    case 246: goto l_L63X3;
    case 248: goto l_lr_147;
    case 250: goto l_lr_149;
    case 251: goto l_L67X3;
    case 253: goto l_lr_152;
    case 254:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

static unsigned int addFloat32Sigs( unsigned int arg0, unsigned int arg1, unsigned int arg2 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(addFloat32Sigs);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_l0_0 = (280 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(1405 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 2781 */
   AND(reg_r0_2, reg_r0_3, (unsigned int) 8388607); /* line 2782 */
} /* line 2782 */
  sim_icache_fetch(1408 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_6, reg_r0_4, (unsigned int) 8388607); /* line 2784 */
   SHL(reg_r0_2, reg_r0_2, (unsigned int) 6); /* line 2785 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_l0_0); /* line 2786 */
} /* line 2786 */
  sim_icache_fetch(1412 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_7, reg_r0_3, (unsigned int) 23); /* line 2788 */
   SHRU(reg_r0_8, reg_r0_4, (unsigned int) 23); /* line 2789 */
   SHL(reg_r0_6, reg_r0_6, (unsigned int) 6); /* line 2790 */
   MOV(reg_r0_9, reg_r0_3); /* line 2791 */
} /* line 2791 */
  sim_icache_fetch(1416 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   AND(reg_r0_7, reg_r0_7, (unsigned int) 255); /* line 2793 */
   AND(reg_r0_8, reg_r0_8, (unsigned int) 255); /* line 2794 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_2); /* line 2795 */
   MOV(reg_r0_3, reg_r0_5); /* line 2796 */
} /* line 2796 */
  sim_icache_fetch(1420 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_2, reg_r0_7, reg_r0_8); /* line 2798 */
   CMPEQ(reg_b0_0, reg_r0_7, (unsigned int) 255); /* line 2799 */
   CMPEQ(reg_b0_1, reg_r0_8, 0); /* line 2800 */
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2801 */
} /* line 2801 */
  sim_icache_fetch(1424 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_6); /* line 2803 */
   CMPGT(reg_b0_2, reg_r0_2, 0); /* line 2804 */
   MOV(reg_r0_11, reg_r0_7); /* line 2805 */
} /* line 2805 */
  sim_icache_fetch(1427 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 2807 */
   ADD(reg_r0_12, reg_r0_11, (unsigned int) -1); /* line 2808 */
} /* line 2808 */
  sim_icache_fetch(1429 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_10, reg_r0_10, (unsigned int) 536870912); /* line 2810 */
   if (!reg_b0_2) {    BRANCHF(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L68X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2811 */
  sim_icache_fetch(1432 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L69X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2813 */
  sim_icache_fetch(1433 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_r0_8, reg_r0_6, 0); /* line 2815 */
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L70X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2816 */
  sim_icache_fetch(1435 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_2, reg_r0_2, (unsigned int) -1); /* line 2818 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_10); /* line 2819 */
} /* line 2819 */
l_L71X3: ;/* line 2821 */
LABEL(l_L71X3);
  sim_icache_fetch(1437 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_7, 0, reg_r0_2); /* line 2822 */
   SHRU(reg_r0_9, reg_r0_6, reg_r0_2); /* line 2823 */
   CMPGE(reg_b0_0, reg_r0_2, (unsigned int) 32); /* line 2824 */
   CMPEQ(reg_b0_1, reg_r0_2, 0); /* line 2825 */
} /* line 2825 */
  sim_icache_fetch(1441 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   AND(reg_r0_7, reg_r0_7, (unsigned int) 31); /* line 2827 */
} /* line 2827 */
  sim_icache_fetch(1442 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_7, reg_r0_6, reg_r0_7); /* line 2829 */
} /* line 2829 */
  sim_icache_fetch(1443 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_r0_7, reg_r0_7, 0); /* line 2831 */
} /* line 2831 */
  sim_icache_fetch(1444 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_9, reg_r0_9, reg_r0_7); /* line 2833 */
} /* line 2833 */
  sim_icache_fetch(1445 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_8, reg_b0_0, reg_r0_8, reg_r0_9); /* line 2835 */
} /* line 2835 */
  sim_icache_fetch(1446 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_6, reg_b0_1, reg_r0_6, reg_r0_8); /* line 2837 */
} /* line 2837 */
  sim_icache_fetch(1447 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_6); /* line 2839 */
} /* line 2839 */
l_L72X3: ;/* line 2841 */
LABEL(l_L72X3);
  sim_icache_fetch(1448 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 2842 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 2843 */
   ADD_CYCLES(2);
} /* line 2843 */
  sim_icache_fetch(1450 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_10, reg_r0_10, reg_r0_2); /* line 2845 */
} /* line 2845 */
  sim_icache_fetch(1451 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_2, reg_r0_10, (unsigned int) 1); /* line 2847 */
} /* line 2847 */
  sim_icache_fetch(1452 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPGE(reg_b0_0, reg_r0_2, 0); /* line 2849 */
} /* line 2849 */
		 /* line 2850 */
  sim_icache_fetch(1453 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SLCT(reg_r0_5, reg_b0_0, reg_r0_2, reg_r0_10); /* line 2852 */
   SLCT(reg_r0_4, reg_b0_0, reg_r0_12, reg_r0_11); /* line 2853 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(roundAndPackFloat32);
   reg_l0_0 = (280 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) roundAndPackFloat32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 2854 */
l_lr_157: ;/* line 2854 */
LABEL(l_lr_157);
l_L73X3: ;/* line 2856 */
LABEL(l_L73X3);
  sim_icache_fetch(1457 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2857 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2858 */
   ADD_CYCLES(3);
} /* line 2858 */
  sim_icache_fetch(1459 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2861 */
l_L70X3: ;/* line 2864 */
LABEL(l_L70X3);
  sim_icache_fetch(1460 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 2865 */
   MOV(reg_r0_3, reg_r0_5); /* line 2866 */
} /* line 2866 */
  sim_icache_fetch(1462 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_10); /* line 2868 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 2869 */
   ADD_CYCLES(1);
} /* line 2869 */
  sim_icache_fetch(1464 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_4, reg_r0_4, (unsigned int) 536870912); /* line 2871 */
} /* line 2871 */
  sim_icache_fetch(1466 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_4); /* line 2873 */
} /* line 2873 */
  sim_icache_fetch(1467 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 2875 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 2876 */
   ADD_CYCLES(2);
} /* line 2876 */
  sim_icache_fetch(1469 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_r0_8, reg_r0_6, 0); /* line 2878 */
   GOTO(l_L71X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L71X3;
} /* line 2879 */
l_L69X3: ;/* line 2882 */
LABEL(l_L69X3);
  sim_icache_fetch(1471 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2883 */
   MOV(reg_r0_3, reg_r0_9); /* line 2884 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 2885 */
   ADD_CYCLES(2);
} /* line 2885 */
  sim_icache_fetch(1474 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 2887 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 2888 */
   ADD_CYCLES(1);
} /* line 2888 */
  sim_icache_fetch(1476 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L74X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2890 */
		 /* line 2891 */
  sim_icache_fetch(1477 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat32NaN);
   reg_l0_0 = (280 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat32NaN;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 2893 */
l_lr_162: ;/* line 2893 */
LABEL(l_lr_162);
  sim_icache_fetch(1479 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2895 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2896 */
   ADD_CYCLES(3);
} /* line 2896 */
  sim_icache_fetch(1481 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2899 */
l_L74X3: ;/* line 2902 */
LABEL(l_L74X3);
  sim_icache_fetch(1482 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, reg_r0_9); /* line 2903 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2904 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2905 */
   ADD_CYCLES(3);
} /* line 2905 */
  sim_icache_fetch(1485 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2908 */
l_L68X3: ;/* line 2911 */
LABEL(l_L68X3);
  sim_icache_fetch(1486 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLT(reg_b0_0, reg_r0_2, 0); /* line 2912 */
   CMPEQ(reg_b0_1, reg_r0_8, (unsigned int) 255); /* line 2913 */
   CMPEQ(reg_b0_2, reg_r0_7, 0); /* line 2914 */
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2915 */
} /* line 2915 */
  sim_icache_fetch(1490 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_11, reg_r0_8); /* line 2917 */
   MOV(reg_r0_3, reg_r0_5); /* line 2918 */
} /* line 2918 */
  sim_icache_fetch(1492 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_12, reg_r0_11, (unsigned int) -1); /* line 2920 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L75X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2921 */
  sim_icache_fetch(1494 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_r0_6, reg_r0_13, 0); /* line 2923 */
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L76X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2924 */
  sim_icache_fetch(1496 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_2) {    BRANCHF(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L77X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2926 */
  sim_icache_fetch(1497 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_2, reg_r0_2, (unsigned int) 1); /* line 2928 */
} /* line 2928 */
l_L78X3: ;/* line 2930 */
LABEL(l_L78X3);
  sim_icache_fetch(1498 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SUB(reg_r0_2, 0, reg_r0_2); /* line 2931 */
} /* line 2931 */
  sim_icache_fetch(1499 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_9, 0, reg_r0_2); /* line 2933 */
   SHRU(reg_r0_14, reg_r0_13, reg_r0_2); /* line 2934 */
   CMPGE(reg_b0_0, reg_r0_2, (unsigned int) 32); /* line 2935 */
   CMPEQ(reg_b0_1, reg_r0_2, 0); /* line 2936 */
} /* line 2936 */
  sim_icache_fetch(1503 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   AND(reg_r0_9, reg_r0_9, (unsigned int) 31); /* line 2938 */
} /* line 2938 */
  sim_icache_fetch(1504 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_9, reg_r0_13, reg_r0_9); /* line 2940 */
} /* line 2940 */
  sim_icache_fetch(1505 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_r0_9, reg_r0_9, 0); /* line 2942 */
} /* line 2942 */
  sim_icache_fetch(1506 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_14, reg_r0_14, reg_r0_9); /* line 2944 */
} /* line 2944 */
  sim_icache_fetch(1507 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_6, reg_b0_0, reg_r0_6, reg_r0_14); /* line 2946 */
} /* line 2946 */
  sim_icache_fetch(1508 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_13, reg_b0_1, reg_r0_13, reg_r0_6); /* line 2948 */
} /* line 2948 */
  sim_icache_fetch(1509 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_13); /* line 2950 */
} /* line 2950 */
  sim_icache_fetch(1510 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2952 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 2953 */
   ADD_CYCLES(2);
} /* line 2953 */
  sim_icache_fetch(1512 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_10, reg_r0_6, (unsigned int) 536870912); /* line 2955 */
} /* line 2955 */
  sim_icache_fetch(1514 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_10); /* line 2957 */
   GOTO(l_L72X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L72X3;
} /* line 2958 */
l_L77X3: ;/* line 2961 */
LABEL(l_L77X3);
  sim_icache_fetch(1516 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2962 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 2963 */
   ADD_CYCLES(2);
} /* line 2963 */
  sim_icache_fetch(1518 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_4, reg_r0_4, (unsigned int) 536870912); /* line 2965 */
} /* line 2965 */
  sim_icache_fetch(1520 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_4); /* line 2967 */
} /* line 2967 */
  sim_icache_fetch(1521 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 2969 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 2970 */
   ADD_CYCLES(2);
} /* line 2970 */
  sim_icache_fetch(1523 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_r0_6, reg_r0_13, 0); /* line 2972 */
   GOTO(l_L78X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L78X3;
} /* line 2973 */
l_L76X3: ;/* line 2976 */
LABEL(l_L76X3);
  sim_icache_fetch(1525 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 2977 */
   MOV(reg_r0_3, reg_r0_9); /* line 2978 */
   MOV(reg_r0_5, t__i32_0); /* line 2979 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 2980 */
   ADD_CYCLES(2);
} /* line 2980 */
  sim_icache_fetch(1529 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 2982 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 2983 */
   ADD_CYCLES(1);
} /* line 2983 */
  sim_icache_fetch(1531 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L79X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 2985 */
		 /* line 2986 */
  sim_icache_fetch(1532 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat32NaN);
   reg_l0_0 = (280 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat32NaN;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 2988 */
l_lr_169: ;/* line 2988 */
LABEL(l_lr_169);
  sim_icache_fetch(1534 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2990 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 2991 */
   ADD_CYCLES(3);
} /* line 2991 */
  sim_icache_fetch(1536 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 2994 */
l_L79X3: ;/* line 2997 */
LABEL(l_L79X3);
  sim_icache_fetch(1537 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_5, reg_r0_5, (unsigned int) 31); /* line 2998 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 2999 */
} /* line 2999 */
  sim_icache_fetch(1539 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_3, reg_r0_5, (unsigned int) 2139095040); /* line 3001 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 3002 */
   ADD_CYCLES(2);
} /* line 3002 */
  sim_icache_fetch(1542 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3005 */
l_L75X3: ;/* line 3008 */
LABEL(l_L75X3);
  sim_icache_fetch(1543 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_0, reg_r0_7, (unsigned int) 255); /* line 3009 */
   CMPEQ(reg_b0_1, reg_r0_7, 0); /* line 3010 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3011 */
   SHL(reg_r0_6, reg_r0_3, (unsigned int) 31); /* line 3012 */
} /* line 3012 */
  sim_icache_fetch(1547 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3014 */
} /* line 3014 */
  sim_icache_fetch(1548 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3016 */
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L80X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3017 */
  sim_icache_fetch(1550 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L81X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3019 */
  sim_icache_fetch(1551 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_2, reg_r0_2, reg_r0_8); /* line 3021 */
} /* line 3021 */
  sim_icache_fetch(1552 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHRU(reg_r0_2, reg_r0_2, (unsigned int) 6); /* line 3023 */
} /* line 3023 */
  sim_icache_fetch(1553 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_3, reg_r0_2, reg_r0_6); /* line 3026 */
   RETURN(addFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3027 */
l_L81X3: ;/* line 3030 */
LABEL(l_L81X3);
  sim_icache_fetch(1555 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3031 */
   MOV(reg_r0_4, reg_r0_7); /* line 3032 */
} /* line 3032 */
  sim_icache_fetch(1557 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3034 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3035 */
   ADD_CYCLES(1);
} /* line 3035 */
  sim_icache_fetch(1559 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_2, reg_r0_2, (unsigned int) 1073741824); /* line 3037 */
} /* line 3037 */
		 /* line 3038 */
  sim_icache_fetch(1561 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_5, reg_r0_2, reg_r0_6); /* line 3040 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(roundAndPackFloat32);
   reg_l0_0 = (280 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) roundAndPackFloat32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 3041 */
l_lr_174: ;/* line 3041 */
LABEL(l_lr_174);
  sim_icache_fetch(1564 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L73X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L73X3;
} /* line 3043 */
l_L80X3: ;/* line 3046 */
LABEL(l_L80X3);
  sim_icache_fetch(1565 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3047 */
   MOV(reg_r0_3, reg_r0_9); /* line 3048 */
} /* line 3048 */
  sim_icache_fetch(1567 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3050 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 3051 */
   ADD_CYCLES(2);
} /* line 3051 */
  sim_icache_fetch(1569 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_5); /* line 3053 */
} /* line 3053 */
  sim_icache_fetch(1570 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 3055 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3056 */
   ADD_CYCLES(1);
} /* line 3056 */
  sim_icache_fetch(1572 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L82X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3058 */
		 /* line 3059 */
  sim_icache_fetch(1573 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat32NaN);
   reg_l0_0 = (280 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat32NaN;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 3061 */
l_lr_177: ;/* line 3061 */
LABEL(l_lr_177);
  sim_icache_fetch(1575 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3063 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3064 */
   ADD_CYCLES(3);
} /* line 3064 */
  sim_icache_fetch(1577 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3067 */
l_L82X3: ;/* line 3070 */
LABEL(l_L82X3);
  sim_icache_fetch(1578 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, reg_r0_9); /* line 3071 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3072 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3073 */
   ADD_CYCLES(3);
} /* line 3073 */
  sim_icache_fetch(1581 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3076 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 255: goto l_L71X3;
    case 256: goto l_L72X3;
    case 258: goto l_lr_157;
    case 259: goto l_L73X3;
    case 260: goto l_L70X3;
    case 261: goto l_L69X3;
    case 263: goto l_lr_162;
    case 264: goto l_L74X3;
    case 265: goto l_L68X3;
    case 266: goto l_L78X3;
    case 267: goto l_L77X3;
    case 268: goto l_L76X3;
    case 270: goto l_lr_169;
    case 271: goto l_L79X3;
    case 272: goto l_L75X3;
    case 273: goto l_L81X3;
    case 275: goto l_lr_174;
    case 276: goto l_L80X3;
    case 278: goto l_lr_177;
    case 279: goto l_L82X3;
    case 280:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

static unsigned int subFloat32Sigs( unsigned int arg0, unsigned int arg1, unsigned int arg2 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(subFloat32Sigs);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_l0_0 = (310 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(1582 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 3095 */
   AND(reg_r0_2, reg_r0_3, (unsigned int) 8388607); /* line 3096 */
} /* line 3096 */
  sim_icache_fetch(1585 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_6, reg_r0_4, (unsigned int) 8388607); /* line 3098 */
   SHL(reg_r0_2, reg_r0_2, (unsigned int) 7); /* line 3099 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_l0_0); /* line 3100 */
} /* line 3100 */
  sim_icache_fetch(1589 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_7, reg_r0_3, (unsigned int) 23); /* line 3102 */
   SHRU(reg_r0_8, reg_r0_4, (unsigned int) 23); /* line 3103 */
   SHL(reg_r0_6, reg_r0_6, (unsigned int) 7); /* line 3104 */
   MOV(reg_r0_9, reg_r0_3); /* line 3105 */
} /* line 3105 */
  sim_icache_fetch(1593 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   AND(reg_r0_7, reg_r0_7, (unsigned int) 255); /* line 3107 */
   AND(reg_r0_8, reg_r0_8, (unsigned int) 255); /* line 3108 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_2); /* line 3109 */
   MOV(reg_r0_3, reg_r0_5); /* line 3110 */
} /* line 3110 */
  sim_icache_fetch(1597 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_2, reg_r0_7, reg_r0_8); /* line 3112 */
   CMPEQ(reg_b0_0, reg_r0_7, (unsigned int) 255); /* line 3113 */
   CMPEQ(reg_b0_1, reg_r0_8, 0); /* line 3114 */
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3115 */
} /* line 3115 */
  sim_icache_fetch(1601 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_6); /* line 3117 */
   CMPGT(reg_b0_2, reg_r0_2, 0); /* line 3118 */
   MOV(reg_r0_11, reg_r0_7); /* line 3119 */
} /* line 3119 */
  sim_icache_fetch(1604 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3121 */
   MOV(reg_r0_12, reg_r0_4); /* line 3122 */
} /* line 3122 */
  sim_icache_fetch(1606 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   OR(reg_r0_10, reg_r0_10, (unsigned int) 1073741824); /* line 3124 */
   ADD(reg_r0_4, reg_r0_11, (unsigned int) -1); /* line 3125 */
   if (!reg_b0_2) {    BRANCHF(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L83X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3126 */
  sim_icache_fetch(1610 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L84X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3128 */
  sim_icache_fetch(1611 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_r0_8, reg_r0_6, 0); /* line 3130 */
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L85X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3131 */
  sim_icache_fetch(1613 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_2, reg_r0_2, (unsigned int) -1); /* line 3133 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_10); /* line 3134 */
} /* line 3134 */
l_L86X3: ;/* line 3136 */
LABEL(l_L86X3);
  sim_icache_fetch(1615 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_7, 0, reg_r0_2); /* line 3137 */
   SHRU(reg_r0_9, reg_r0_6, reg_r0_2); /* line 3138 */
   CMPGE(reg_b0_0, reg_r0_2, (unsigned int) 32); /* line 3139 */
   CMPEQ(reg_b0_1, reg_r0_2, 0); /* line 3140 */
} /* line 3140 */
  sim_icache_fetch(1619 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_7, reg_r0_7, (unsigned int) 31); /* line 3142 */
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3143 */
} /* line 3143 */
  sim_icache_fetch(1621 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_7, reg_r0_6, reg_r0_7); /* line 3145 */
} /* line 3145 */
  sim_icache_fetch(1622 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_r0_7, reg_r0_7, 0); /* line 3147 */
} /* line 3147 */
  sim_icache_fetch(1623 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_9, reg_r0_9, reg_r0_7); /* line 3149 */
} /* line 3149 */
  sim_icache_fetch(1624 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_8, reg_b0_0, reg_r0_8, reg_r0_9); /* line 3151 */
} /* line 3151 */
  sim_icache_fetch(1625 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_6, reg_b0_1, reg_r0_6, reg_r0_8); /* line 3153 */
} /* line 3153 */
  sim_icache_fetch(1626 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_6); /* line 3155 */
} /* line 3155 */
l_L87X3: ;/* line 3157 */
LABEL(l_L87X3);
  sim_icache_fetch(1627 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3158 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 3159 */
   ADD_CYCLES(2);
} /* line 3159 */
		 /* line 3160 */
  sim_icache_fetch(1629 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SUB(reg_r0_5, reg_r0_2, reg_r0_6); /* line 3162 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(normalizeRoundAndPackFloat32);
   reg_l0_0 = (310 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) normalizeRoundAndPackFloat32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 3163 */
l_lr_183: ;/* line 3163 */
LABEL(l_lr_183);
l_L88X3: ;/* line 3165 */
LABEL(l_L88X3);
  sim_icache_fetch(1632 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3166 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3167 */
   ADD_CYCLES(3);
} /* line 3167 */
  sim_icache_fetch(1634 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3170 */
l_L85X3: ;/* line 3173 */
LABEL(l_L85X3);
  sim_icache_fetch(1635 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3174 */
   MOV(reg_r0_3, reg_r0_5); /* line 3175 */
} /* line 3175 */
  sim_icache_fetch(1637 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_10); /* line 3177 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3178 */
   ADD_CYCLES(1);
} /* line 3178 */
  sim_icache_fetch(1639 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_7, reg_r0_7, (unsigned int) 1073741824); /* line 3180 */
} /* line 3180 */
  sim_icache_fetch(1641 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_7); /* line 3182 */
} /* line 3182 */
  sim_icache_fetch(1642 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3184 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 3185 */
   ADD_CYCLES(2);
} /* line 3185 */
  sim_icache_fetch(1644 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_r0_8, reg_r0_6, 0); /* line 3187 */
   GOTO(l_L86X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L86X3;
} /* line 3188 */
l_L84X3: ;/* line 3191 */
LABEL(l_L84X3);
  sim_icache_fetch(1646 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3192 */
   MOV(reg_r0_4, reg_r0_12); /* line 3193 */
   MOV(reg_r0_3, reg_r0_9); /* line 3194 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 3195 */
   ADD_CYCLES(2);
} /* line 3195 */
  sim_icache_fetch(1650 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 3197 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3198 */
   ADD_CYCLES(1);
} /* line 3198 */
  sim_icache_fetch(1652 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L89X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3200 */
		 /* line 3201 */
  sim_icache_fetch(1653 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat32NaN);
   reg_l0_0 = (310 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat32NaN;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 3203 */
l_lr_188: ;/* line 3203 */
LABEL(l_lr_188);
  sim_icache_fetch(1655 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3205 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3206 */
   ADD_CYCLES(3);
} /* line 3206 */
  sim_icache_fetch(1657 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3209 */
l_L89X3: ;/* line 3212 */
LABEL(l_L89X3);
  sim_icache_fetch(1658 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, reg_r0_9); /* line 3213 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3214 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3215 */
   ADD_CYCLES(3);
} /* line 3215 */
  sim_icache_fetch(1661 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3218 */
l_L83X3: ;/* line 3221 */
LABEL(l_L83X3);
  sim_icache_fetch(1662 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLT(reg_b0_0, reg_r0_2, 0); /* line 3222 */
   CMPEQ(reg_b0_1, reg_r0_8, (unsigned int) 255); /* line 3223 */
   CMPEQ(reg_b0_2, reg_r0_7, 0); /* line 3224 */
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3225 */
} /* line 3225 */
  sim_icache_fetch(1666 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3227 */
   MOV(reg_r0_11, reg_r0_8); /* line 3228 */
} /* line 3228 */
  sim_icache_fetch(1668 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_4, reg_r0_11, (unsigned int) -1); /* line 3230 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L90X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3231 */
  sim_icache_fetch(1670 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_r0_11, reg_r0_10, 0); /* line 3233 */
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L91X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3234 */
  sim_icache_fetch(1672 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_6, reg_r0_6, (unsigned int) 1073741824); /* line 3236 */
   if (!reg_b0_2) {    BRANCHF(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L92X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3237 */
  sim_icache_fetch(1675 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_2, reg_r0_2, (unsigned int) 1); /* line 3239 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_6); /* line 3240 */
   XOR(reg_r0_3, reg_r0_5, (unsigned int) 1); /* line 3241 */
} /* line 3241 */
l_L93X3: ;/* line 3243 */
LABEL(l_L93X3);
  sim_icache_fetch(1678 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SUB(reg_r0_2, 0, reg_r0_2); /* line 3244 */
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3245 */
} /* line 3245 */
  sim_icache_fetch(1680 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_9, 0, reg_r0_2); /* line 3247 */
   SHRU(reg_r0_12, reg_r0_10, reg_r0_2); /* line 3248 */
   CMPGE(reg_b0_0, reg_r0_2, (unsigned int) 32); /* line 3249 */
   CMPEQ(reg_b0_1, reg_r0_2, 0); /* line 3250 */
} /* line 3250 */
  sim_icache_fetch(1684 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   AND(reg_r0_9, reg_r0_9, (unsigned int) 31); /* line 3252 */
} /* line 3252 */
  sim_icache_fetch(1685 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_9, reg_r0_10, reg_r0_9); /* line 3254 */
} /* line 3254 */
  sim_icache_fetch(1686 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_r0_9, reg_r0_9, 0); /* line 3256 */
} /* line 3256 */
  sim_icache_fetch(1687 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_12, reg_r0_12, reg_r0_9); /* line 3258 */
} /* line 3258 */
  sim_icache_fetch(1688 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_11, reg_b0_0, reg_r0_11, reg_r0_12); /* line 3260 */
} /* line 3260 */
  sim_icache_fetch(1689 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_10, reg_b0_1, reg_r0_10, reg_r0_11); /* line 3262 */
} /* line 3262 */
  sim_icache_fetch(1690 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_10); /* line 3264 */
} /* line 3264 */
l_L94X3: ;/* line 3266 */
LABEL(l_L94X3);
  sim_icache_fetch(1691 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3267 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 3268 */
   ADD_CYCLES(2);
} /* line 3268 */
		 /* line 3269 */
  sim_icache_fetch(1693 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SUB(reg_r0_5, reg_r0_6, reg_r0_9); /* line 3271 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(normalizeRoundAndPackFloat32);
   reg_l0_0 = (310 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) normalizeRoundAndPackFloat32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 3272 */
l_lr_194: ;/* line 3272 */
LABEL(l_lr_194);
  sim_icache_fetch(1696 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L88X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L88X3;
} /* line 3274 */
l_L92X3: ;/* line 3277 */
LABEL(l_L92X3);
  sim_icache_fetch(1697 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3278 */
   XOR(reg_r0_3, reg_r0_5, (unsigned int) 1); /* line 3279 */
} /* line 3279 */
  sim_icache_fetch(1699 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_6); /* line 3281 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3282 */
   ADD_CYCLES(1);
} /* line 3282 */
  sim_icache_fetch(1701 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_7, reg_r0_7, (unsigned int) 1073741824); /* line 3284 */
} /* line 3284 */
  sim_icache_fetch(1703 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_7); /* line 3286 */
} /* line 3286 */
  sim_icache_fetch(1704 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3288 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 3289 */
   ADD_CYCLES(2);
} /* line 3289 */
  sim_icache_fetch(1706 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_r0_11, reg_r0_10, 0); /* line 3291 */
   GOTO(l_L93X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L93X3;
} /* line 3292 */
l_L91X3: ;/* line 3295 */
LABEL(l_L91X3);
  sim_icache_fetch(1708 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3296 */
   MOV(reg_r0_4, reg_r0_12); /* line 3297 */
   MOV(reg_r0_3, reg_r0_9); /* line 3298 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 3299 */
   ADD_CYCLES(2);
} /* line 3299 */
  sim_icache_fetch(1712 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 3301 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3302 */
   ADD_CYCLES(1);
} /* line 3302 */
  sim_icache_fetch(1714 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L95X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3304 */
		 /* line 3305 */
  sim_icache_fetch(1715 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat32NaN);
   reg_l0_0 = (310 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat32NaN;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 3307 */
l_lr_198: ;/* line 3307 */
LABEL(l_lr_198);
  sim_icache_fetch(1717 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3309 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3310 */
   ADD_CYCLES(3);
} /* line 3310 */
  sim_icache_fetch(1719 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3313 */
l_L95X3: ;/* line 3316 */
LABEL(l_L95X3);
  sim_icache_fetch(1720 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   XOR(reg_r0_5, reg_r0_5, (unsigned int) 1); /* line 3317 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3318 */
} /* line 3318 */
  sim_icache_fetch(1722 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_5, reg_r0_5, (unsigned int) 31); /* line 3320 */
} /* line 3320 */
  sim_icache_fetch(1723 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_3, reg_r0_5, (unsigned int) 2139095040); /* line 3322 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3323 */
   ADD_CYCLES(1);
} /* line 3323 */
  sim_icache_fetch(1726 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3326 */
l_L90X3: ;/* line 3329 */
LABEL(l_L90X3);
  sim_icache_fetch(1727 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_0, reg_r0_7, (unsigned int) 255); /* line 3330 */
   CMPNE(reg_b0_1, reg_r0_7, 0); /* line 3331 */
   CMPNE(reg_b0_2, reg_r0_7, 0); /* line 3332 */
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3333 */
} /* line 3333 */
  sim_icache_fetch(1731 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SLCT(reg_r0_8, reg_b0_1, reg_r0_8, (unsigned int) 1); /* line 3335 */
   SLCT(reg_r0_7, reg_b0_2, reg_r0_7, (unsigned int) 1); /* line 3336 */
   LDWs(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3337 */
   MOV(reg_r0_3, reg_r0_5); /* line 3338 */
} /* line 3338 */
  sim_icache_fetch(1735 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3340 */
   MOV(reg_r0_11, reg_r0_7); /* line 3341 */
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L96X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3342 */
  sim_icache_fetch(1738 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_4, reg_r0_11, (unsigned int) -1); /* line 3344 */
} /* line 3344 */
  sim_icache_fetch(1739 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLTU(reg_b0_0, reg_r0_10, reg_r0_6); /* line 3346 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3347 */
   ADD_CYCLES(1);
} /* line 3347 */
  sim_icache_fetch(1741 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L97X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3350 */
  sim_icache_fetch(1742 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L87X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L87X3;
} /* line 3352 */
l_L97X3: ;/* line 3355 */
LABEL(l_L97X3);
  sim_icache_fetch(1743 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_b0_0, reg_r0_6, reg_r0_10); /* line 3356 */
   LDWs(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3357 */
   MOV(reg_r0_11, reg_r0_8); /* line 3358 */
   XOR(reg_r0_3, reg_r0_3, (unsigned int) 1); /* line 3359 */
} /* line 3359 */
  sim_icache_fetch(1747 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_4, reg_r0_11, (unsigned int) -1); /* line 3361 */
} /* line 3361 */
  sim_icache_fetch(1748 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L98X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3364 */
  sim_icache_fetch(1749 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L94X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L94X3;
} /* line 3366 */
l_L98X3: ;/* line 3369 */
LABEL(l_L98X3);
  sim_icache_fetch(1750 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((unsigned int) _X1PACKETX2,0,4)); /* line 3370 */
} /* line 3370 */
  sim_icache_fetch(1752 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3372 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3373 */
   ADD_CYCLES(1);
} /* line 3373 */
  sim_icache_fetch(1754 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_r0_2, reg_r0_2, (unsigned int) 1); /* line 3375 */
} /* line 3375 */
  sim_icache_fetch(1755 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_3, reg_r0_2, (unsigned int) 31); /* line 3377 */
} /* line 3377 */
  sim_icache_fetch(1756 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3380 */
l_L96X3: ;/* line 3383 */
LABEL(l_L96X3);
  sim_icache_fetch(1757 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3384 */
   MOV(reg_r0_4, reg_r0_12); /* line 3385 */
   MOV(reg_r0_3, reg_r0_9); /* line 3386 */
} /* line 3386 */
  sim_icache_fetch(1760 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3388 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 3389 */
   ADD_CYCLES(2);
} /* line 3389 */
  sim_icache_fetch(1762 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_5, reg_r0_5, reg_r0_6); /* line 3391 */
} /* line 3391 */
  sim_icache_fetch(1763 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_5, 0); /* line 3393 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3394 */
   ADD_CYCLES(1);
} /* line 3394 */
  sim_icache_fetch(1765 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L99X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3396 */
		 /* line 3397 */
  sim_icache_fetch(1766 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat32NaN);
   reg_l0_0 = (310 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat32NaN;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 3399 */
l_lr_205: ;/* line 3399 */
LABEL(l_lr_205);
  sim_icache_fetch(1768 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3401 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3402 */
   ADD_CYCLES(3);
} /* line 3402 */
  sim_icache_fetch(1770 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3405 */
l_L99X3: ;/* line 3408 */
LABEL(l_L99X3);
		 /* line 3408 */
  sim_icache_fetch(1771 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, (unsigned int) 16); /* line 3411 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (310 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 3411 */
l_lr_208: ;/* line 3411 */
LABEL(l_lr_208);
  sim_icache_fetch(1774 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3413 */
   MOV(reg_r0_3, (unsigned int) 2147483647); /* line 3414 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3415 */
   ADD_CYCLES(3);
} /* line 3415 */
  sim_icache_fetch(1778 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat32Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3418 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 281: goto l_L86X3;
    case 282: goto l_L87X3;
    case 284: goto l_lr_183;
    case 285: goto l_L88X3;
    case 286: goto l_L85X3;
    case 287: goto l_L84X3;
    case 289: goto l_lr_188;
    case 290: goto l_L89X3;
    case 291: goto l_L83X3;
    case 292: goto l_L93X3;
    case 293: goto l_L94X3;
    case 295: goto l_lr_194;
    case 296: goto l_L92X3;
    case 297: goto l_L91X3;
    case 299: goto l_lr_198;
    case 300: goto l_L95X3;
    case 301: goto l_L90X3;
    case 302: goto l_L97X3;
    case 303: goto l_L98X3;
    case 304: goto l_L96X3;
    case 306: goto l_lr_205;
    case 307: goto l_L99X3;
    case 309: goto l_lr_208;
    case 310:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_add( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_add);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (316 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(1779 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 3437 */
   SHRU(reg_r0_5, reg_r0_3, (unsigned int) 31); /* line 3438 */
   SHRU(reg_r0_2, reg_r0_4, (unsigned int) 31); /* line 3439 */
} /* line 3439 */
  sim_icache_fetch(1782 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_0, reg_r0_5, reg_r0_2); /* line 3441 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 3442 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3443 */
   ADD_CYCLES(1);
} /* line 3443 */
  sim_icache_fetch(1785 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L100X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3445 */
		 /* line 3446 */
  sim_icache_fetch(1786 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(addFloat32Sigs);
   reg_l0_0 = (316 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) addFloat32Sigs;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 3448 */
l_lr_211: ;/* line 3448 */
LABEL(l_lr_211);
  sim_icache_fetch(1788 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3450 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3451 */
   ADD_CYCLES(3);
} /* line 3451 */
  sim_icache_fetch(1790 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_add);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3454 */
l_L100X3: ;/* line 3457 */
LABEL(l_L100X3);
		 /* line 3457 */
  sim_icache_fetch(1791 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(subFloat32Sigs);
   reg_l0_0 = (316 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) subFloat32Sigs;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 3459 */
l_lr_214: ;/* line 3459 */
LABEL(l_lr_214);
  sim_icache_fetch(1793 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3461 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3462 */
   ADD_CYCLES(3);
} /* line 3462 */
  sim_icache_fetch(1795 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_add);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3465 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 312: goto l_lr_211;
    case 313: goto l_L100X3;
    case 315: goto l_lr_214;
    case 316:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_sub( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_sub);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (322 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(1796 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 3482 */
   SHRU(reg_r0_5, reg_r0_3, (unsigned int) 31); /* line 3483 */
   SHRU(reg_r0_2, reg_r0_4, (unsigned int) 31); /* line 3484 */
} /* line 3484 */
  sim_icache_fetch(1799 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_0, reg_r0_5, reg_r0_2); /* line 3486 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 3487 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3488 */
   ADD_CYCLES(1);
} /* line 3488 */
  sim_icache_fetch(1802 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L101X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3490 */
		 /* line 3491 */
  sim_icache_fetch(1803 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(subFloat32Sigs);
   reg_l0_0 = (322 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) subFloat32Sigs;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 3493 */
l_lr_217: ;/* line 3493 */
LABEL(l_lr_217);
  sim_icache_fetch(1805 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3495 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3496 */
   ADD_CYCLES(3);
} /* line 3496 */
  sim_icache_fetch(1807 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_sub);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3499 */
l_L101X3: ;/* line 3502 */
LABEL(l_L101X3);
		 /* line 3502 */
  sim_icache_fetch(1808 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(addFloat32Sigs);
   reg_l0_0 = (322 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) addFloat32Sigs;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 3504 */
l_lr_220: ;/* line 3504 */
LABEL(l_lr_220);
  sim_icache_fetch(1810 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3506 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3507 */
   ADD_CYCLES(3);
} /* line 3507 */
  sim_icache_fetch(1812 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_sub);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3510 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 318: goto l_lr_217;
    case 319: goto l_L101X3;
    case 321: goto l_lr_220;
    case 322:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_mul( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_mul);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (349 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(1813 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 3527 */
   SHRU(reg_r0_2, reg_r0_4, (unsigned int) 23); /* line 3528 */
   SHRU(reg_r0_6, reg_r0_3, (unsigned int) 31); /* line 3529 */
} /* line 3529 */
  sim_icache_fetch(1816 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_8, reg_r0_3, (unsigned int) 23); /* line 3531 */
   AND(reg_r0_2, reg_r0_2, (unsigned int) 255); /* line 3532 */
   SHRU(reg_r0_7, reg_r0_4, (unsigned int) 31); /* line 3533 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_l0_0); /* line 3534 */
} /* line 3534 */
  sim_icache_fetch(1820 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_10, reg_r0_4, (unsigned int) 8388607); /* line 3536 */
   AND(reg_r0_8, reg_r0_8, (unsigned int) 255); /* line 3537 */
   MOV(reg_r0_9, reg_r0_3); /* line 3538 */
} /* line 3538 */
  sim_icache_fetch(1824 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_11, reg_r0_9, (unsigned int) 8388607); /* line 3540 */
   XOR(reg_r0_3, reg_r0_6, reg_r0_7); /* line 3541 */
   CMPEQ(reg_b0_0, reg_r0_8, (unsigned int) 255); /* line 3542 */
} /* line 3542 */
  sim_icache_fetch(1828 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_b0_1, reg_r0_2, (unsigned int) 255); /* line 3544 */
   CMPEQ(reg_b0_2, reg_r0_8, 0); /* line 3545 */
   OR(reg_r0_6, reg_r0_10, (unsigned int) 8388608); /* line 3546 */
} /* line 3546 */
  sim_icache_fetch(1832 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   OR(reg_r0_7, reg_r0_11, (unsigned int) 8388608); /* line 3548 */
   SHL(reg_r0_6, reg_r0_6, (unsigned int) 8); /* line 3549 */
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L102X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3550 */
  sim_icache_fetch(1836 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_0, reg_r0_2, 0); /* line 3552 */
   ADD(reg_r0_12, reg_r0_2, reg_r0_8); /* line 3553 */
   SHL(reg_r0_7, reg_r0_7, (unsigned int) 7); /* line 3554 */
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L103X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3555 */
  sim_icache_fetch(1840 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_14, reg_r0_12, (unsigned int) -127); /* line 3557 */
   MULLHU(reg_r0_9, reg_r0_6, reg_r0_7); /* line 3558 */
   MULLHU(reg_r0_13, reg_r0_7, reg_r0_6); /* line 3559 */
   if (reg_b0_2) {    BRANCH(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L104X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3560 */
l_L105X3: ;/* line 3562 */
LABEL(l_L105X3);
  sim_icache_fetch(1844 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MULLLU(reg_r0_2, reg_r0_7, reg_r0_6); /* line 3563 */
   MULHHU(reg_r0_15, reg_r0_7, reg_r0_6); /* line 3564 */
   ADD(reg_r0_12, reg_r0_12, (unsigned int) -128); /* line 3565 */
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L106X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3566 */
l_L107X3: ;/* line 3568 */
LABEL(l_L107X3);
  sim_icache_fetch(1848 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_13, reg_r0_9, reg_r0_13); /* line 3569 */
} /* line 3569 */
  sim_icache_fetch(1849 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHRU(reg_r0_7, reg_r0_13, (unsigned int) 16); /* line 3571 */
   CMPLTU(reg_r0_9, reg_r0_13, reg_r0_9); /* line 3572 */
   SHL(reg_r0_6, reg_r0_13, (unsigned int) 16); /* line 3573 */
} /* line 3573 */
  sim_icache_fetch(1852 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_9, reg_r0_9, (unsigned int) 16); /* line 3575 */
   ADD(reg_r0_2, reg_r0_2, reg_r0_6); /* line 3576 */
   ADD(reg_r0_7, reg_r0_7, reg_r0_15); /* line 3577 */
} /* line 3577 */
  sim_icache_fetch(1855 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLTU(reg_r0_6, reg_r0_2, reg_r0_6); /* line 3579 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_2); /* line 3580 */
   CMPNE(reg_r0_8, reg_r0_2, 0); /* line 3581 */
} /* line 3581 */
  sim_icache_fetch(1858 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_9, reg_r0_9, reg_r0_6); /* line 3583 */
} /* line 3583 */
  sim_icache_fetch(1859 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_7, reg_r0_7, reg_r0_9); /* line 3585 */
} /* line 3585 */
  sim_icache_fetch(1860 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_7); /* line 3587 */
   OR(reg_r0_8, reg_r0_7, reg_r0_8); /* line 3588 */
} /* line 3588 */
  sim_icache_fetch(1862 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_2, reg_r0_8, (unsigned int) 1); /* line 3590 */
} /* line 3590 */
  sim_icache_fetch(1863 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLT(reg_b0_0, reg_r0_2, 0); /* line 3592 */
} /* line 3592 */
		 /* line 3593 */
  sim_icache_fetch(1864 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SLCT(reg_r0_5, reg_b0_0, reg_r0_8, reg_r0_2); /* line 3595 */
   SLCT(reg_r0_4, reg_b0_0, reg_r0_14, reg_r0_12); /* line 3596 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(roundAndPackFloat32);
   reg_l0_0 = (349 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) roundAndPackFloat32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 3597 */
l_lr_225: ;/* line 3597 */
LABEL(l_lr_225);
  sim_icache_fetch(1868 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3599 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3600 */
   ADD_CYCLES(3);
} /* line 3600 */
  sim_icache_fetch(1870 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3603 */
l_L106X3: ;/* line 3606 */
LABEL(l_L106X3);
  sim_icache_fetch(1871 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_b0_0, reg_r0_10, 0); /* line 3607 */
   SHL(reg_r0_4, reg_r0_3, (unsigned int) 31); /* line 3608 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3609 */
} /* line 3609 */
  sim_icache_fetch(1874 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, reg_r0_4); /* line 3611 */
   MOV(reg_r0_2, t__i32_0); /* line 3612 */
} /* line 3612 */
  sim_icache_fetch(1876 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L108X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3614 */
  sim_icache_fetch(1877 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(0);
} /* line 3615 */
  sim_icache_fetch(1878 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3618 */
l_L108X3: ;/* line 3621 */
LABEL(l_L108X3);
  sim_icache_fetch(1879 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_2); /* line 3622 */
   MOV(reg_r0_3, reg_r0_10); /* line 3623 */
} /* line 3623 */
  sim_icache_fetch(1881 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_11); /* line 3625 */
} /* line 3625 */
  sim_icache_fetch(1882 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 44),0,4), reg_r0_8); /* line 3627 */
} /* line 3627 */
		 /* line 3628 */
  sim_icache_fetch(1883 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_10); /* line 3631 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (349 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 3631 */
l_lr_229: ;/* line 3631 */
LABEL(l_lr_229);
  sim_icache_fetch(1886 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_2, reg_r0_3, (unsigned int) -8); /* line 3633 */
   SUB(reg_r0_3, (unsigned int) 9, reg_r0_3); /* line 3634 */
   LDW(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 3635 */
} /* line 3635 */
  sim_icache_fetch(1889 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 3637 */
} /* line 3637 */
  sim_icache_fetch(1890 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 3639 */
} /* line 3639 */
  sim_icache_fetch(1891 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_10, reg_r0_10, reg_r0_2); /* line 3641 */
} /* line 3641 */
  sim_icache_fetch(1892 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_11, reg_r0_11, (unsigned int) 8388608); /* line 3643 */
   OR(reg_r0_10, reg_r0_10, (unsigned int) 8388608); /* line 3644 */
} /* line 3644 */
  sim_icache_fetch(1896 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_3, reg_r0_3, reg_r0_8); /* line 3646 */
   SHL(reg_r0_7, reg_r0_11, (unsigned int) 7); /* line 3647 */
   SHL(reg_r0_6, reg_r0_10, (unsigned int) 8); /* line 3648 */
} /* line 3648 */
  sim_icache_fetch(1899 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_14, reg_r0_3, (unsigned int) -127); /* line 3650 */
   MULLHU(reg_r0_9, reg_r0_6, reg_r0_7); /* line 3651 */
   MULLHU(reg_r0_13, reg_r0_7, reg_r0_6); /* line 3652 */
   ADD(reg_r0_12, reg_r0_3, (unsigned int) -128); /* line 3653 */
} /* line 3653 */
  sim_icache_fetch(1903 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 3655 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3656 */
   ADD_CYCLES(1);
} /* line 3656 */
  sim_icache_fetch(1905 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MULLLU(reg_r0_2, reg_r0_7, reg_r0_6); /* line 3658 */
   MULHHU(reg_r0_15, reg_r0_7, reg_r0_6); /* line 3659 */
   GOTO(l_L107X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L107X3;
} /* line 3660 */
l_L104X3: ;/* line 3663 */
LABEL(l_L104X3);
  sim_icache_fetch(1908 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_b0_0, reg_r0_11, 0); /* line 3664 */
   SHL(reg_r0_4, reg_r0_3, (unsigned int) 31); /* line 3665 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3666 */
} /* line 3666 */
  sim_icache_fetch(1911 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, reg_r0_4); /* line 3668 */
   MOV(reg_r0_5, t__i32_0); /* line 3669 */
} /* line 3669 */
  sim_icache_fetch(1913 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L109X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3671 */
  sim_icache_fetch(1914 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(0);
} /* line 3672 */
  sim_icache_fetch(1915 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3675 */
l_L109X3: ;/* line 3678 */
LABEL(l_L109X3);
  sim_icache_fetch(1916 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_5); /* line 3679 */
   MOV(reg_r0_3, reg_r0_11); /* line 3680 */
} /* line 3680 */
  sim_icache_fetch(1918 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_10); /* line 3682 */
} /* line 3682 */
  sim_icache_fetch(1919 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_2); /* line 3684 */
} /* line 3684 */
		 /* line 3685 */
  sim_icache_fetch(1920 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_11); /* line 3688 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (349 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 3688 */
l_lr_233: ;/* line 3688 */
LABEL(l_lr_233);
  sim_icache_fetch(1923 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_2, reg_r0_3, (unsigned int) -8); /* line 3690 */
   SUB(reg_r0_8, (unsigned int) 9, reg_r0_3); /* line 3691 */
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 3692 */
} /* line 3692 */
  sim_icache_fetch(1926 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 3694 */
} /* line 3694 */
  sim_icache_fetch(1927 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 3696 */
} /* line 3696 */
  sim_icache_fetch(1928 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_11, reg_r0_11, reg_r0_2); /* line 3698 */
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 3699 */
} /* line 3699 */
  sim_icache_fetch(1930 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_b0_0, reg_r0_4, 0); /* line 3701 */
   ADD(reg_r0_12, reg_r0_4, reg_r0_8); /* line 3702 */
   OR(reg_r0_2, reg_r0_11, (unsigned int) 8388608); /* line 3703 */
} /* line 3703 */
  sim_icache_fetch(1934 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_14, reg_r0_12, (unsigned int) -127); /* line 3705 */
   SHL(reg_r0_7, reg_r0_2, (unsigned int) 7); /* line 3706 */
   OR(reg_r0_2, reg_r0_10, (unsigned int) 8388608); /* line 3707 */
} /* line 3707 */
  sim_icache_fetch(1938 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_6, reg_r0_2, (unsigned int) 8); /* line 3709 */
} /* line 3709 */
  sim_icache_fetch(1939 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MULLHU(reg_r0_9, reg_r0_6, reg_r0_7); /* line 3711 */
   MULLHU(reg_r0_13, reg_r0_7, reg_r0_6); /* line 3712 */
   GOTO(l_L105X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L105X3;
} /* line 3713 */
l_L103X3: ;/* line 3716 */
LABEL(l_L103X3);
  sim_icache_fetch(1942 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPNE(reg_b0_1, reg_r0_10, 0); /* line 3717 */
   MOV(reg_r0_3, reg_r0_9); /* line 3718 */
   MOV(reg_r0_2, t__i32_0); /* line 3719 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3720 */
   ADD_CYCLES(1);
} /* line 3720 */
  sim_icache_fetch(1946 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L110X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3722 */
		 /* line 3723 */
  sim_icache_fetch(1947 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat32NaN);
   reg_l0_0 = (349 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat32NaN;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 3725 */
l_lr_236: ;/* line 3725 */
LABEL(l_lr_236);
  sim_icache_fetch(1949 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3727 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3728 */
   ADD_CYCLES(3);
} /* line 3728 */
  sim_icache_fetch(1951 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3731 */
l_L110X3: ;/* line 3734 */
LABEL(l_L110X3);
  sim_icache_fetch(1952 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_11, reg_r0_11, reg_r0_8); /* line 3735 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 3736 */
} /* line 3736 */
  sim_icache_fetch(1954 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_0, reg_r0_11, 0); /* line 3738 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3739 */
   ADD_CYCLES(1);
} /* line 3739 */
  sim_icache_fetch(1956 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L111X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3741 */
		 /* line 3742 */
  sim_icache_fetch(1957 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (349 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 3744 */
l_lr_239: ;/* line 3744 */
LABEL(l_lr_239);
  sim_icache_fetch(1959 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3746 */
   MOV(reg_r0_3, (unsigned int) 2147483647); /* line 3747 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3748 */
   ADD_CYCLES(3);
} /* line 3748 */
  sim_icache_fetch(1963 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3751 */
l_L111X3: ;/* line 3754 */
LABEL(l_L111X3);
  sim_icache_fetch(1964 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_2, reg_r0_2, (unsigned int) 31); /* line 3755 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3756 */
} /* line 3756 */
  sim_icache_fetch(1966 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_3, reg_r0_2, (unsigned int) 2139095040); /* line 3758 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 3759 */
   ADD_CYCLES(2);
} /* line 3759 */
  sim_icache_fetch(1969 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3762 */
l_L102X3: ;/* line 3765 */
LABEL(l_L102X3);
  sim_icache_fetch(1970 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_r0_5, reg_r0_2, (unsigned int) 255); /* line 3766 */
   MOV(reg_r0_3, reg_r0_9); /* line 3767 */
   MOV(reg_r0_6, t__i32_0); /* line 3768 */
} /* line 3768 */
  sim_icache_fetch(1973 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ANDL(reg_r0_5, reg_r0_5, reg_r0_10); /* line 3770 */
} /* line 3770 */
  sim_icache_fetch(1974 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_b0_0, reg_r0_11, reg_r0_5); /* line 3772 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3773 */
   ADD_CYCLES(1);
} /* line 3773 */
  sim_icache_fetch(1976 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L112X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3775 */
		 /* line 3776 */
  sim_icache_fetch(1977 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat32NaN);
   reg_l0_0 = (349 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat32NaN;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 3778 */
l_lr_243: ;/* line 3778 */
LABEL(l_lr_243);
  sim_icache_fetch(1979 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3780 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3781 */
   ADD_CYCLES(3);
} /* line 3781 */
  sim_icache_fetch(1981 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3784 */
l_L112X3: ;/* line 3787 */
LABEL(l_L112X3);
  sim_icache_fetch(1982 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_10, reg_r0_10, reg_r0_2); /* line 3788 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 3789 */
} /* line 3789 */
  sim_icache_fetch(1984 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_0, reg_r0_10, 0); /* line 3791 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3792 */
   ADD_CYCLES(1);
} /* line 3792 */
  sim_icache_fetch(1986 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L113X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3794 */
		 /* line 3795 */
  sim_icache_fetch(1987 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (349 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 3797 */
l_lr_246: ;/* line 3797 */
LABEL(l_lr_246);
  sim_icache_fetch(1989 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3799 */
   MOV(reg_r0_3, (unsigned int) 2147483647); /* line 3800 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 3801 */
   ADD_CYCLES(3);
} /* line 3801 */
  sim_icache_fetch(1993 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3804 */
l_L113X3: ;/* line 3807 */
LABEL(l_L113X3);
  sim_icache_fetch(1994 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_6, reg_r0_6, (unsigned int) 31); /* line 3808 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 3809 */
} /* line 3809 */
  sim_icache_fetch(1996 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_3, reg_r0_6, (unsigned int) 2139095040); /* line 3811 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 3812 */
   ADD_CYCLES(2);
} /* line 3812 */
  sim_icache_fetch(1999 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 3815 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 323: goto l_L105X3;
    case 324: goto l_L107X3;
    case 326: goto l_lr_225;
    case 327: goto l_L106X3;
    case 328: goto l_L108X3;
    case 330: goto l_lr_229;
    case 331: goto l_L104X3;
    case 332: goto l_L109X3;
    case 334: goto l_lr_233;
    case 335: goto l_L103X3;
    case 337: goto l_lr_236;
    case 338: goto l_L110X3;
    case 340: goto l_lr_239;
    case 341: goto l_L111X3;
    case 342: goto l_L102X3;
    case 344: goto l_lr_243;
    case 345: goto l_L112X3;
    case 347: goto l_lr_246;
    case 348: goto l_L113X3;
    case 349:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_div( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_div);
  sim_check_stack(reg_r0_1, -96); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (391 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(2000 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -96); /* line 3835 */
   SHRU(reg_r0_2, reg_r0_4, (unsigned int) 23); /* line 3836 */
   SHRU(reg_r0_10, reg_r0_3, (unsigned int) 31); /* line 3837 */
} /* line 3837 */
  sim_icache_fetch(2003 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_12, reg_r0_3, (unsigned int) 23); /* line 3839 */
   AND(reg_r0_2, reg_r0_2, (unsigned int) 255); /* line 3840 */
   SHRU(reg_r0_11, reg_r0_4, (unsigned int) 31); /* line 3841 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_l0_0); /* line 3842 */
} /* line 3842 */
  sim_icache_fetch(2007 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_14, reg_r0_3, (unsigned int) 8388607); /* line 3844 */
   AND(reg_r0_12, reg_r0_12, (unsigned int) 255); /* line 3845 */
   XOR(reg_r0_13, reg_r0_10, reg_r0_11); /* line 3846 */
} /* line 3846 */
  sim_icache_fetch(2011 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_10, reg_r0_4, (unsigned int) 8388607); /* line 3848 */
   CMPEQ(reg_b0_0, reg_r0_12, (unsigned int) 255); /* line 3849 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_13); /* line 3850 */
} /* line 3850 */
  sim_icache_fetch(2015 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_b0_1, reg_r0_2, (unsigned int) 255); /* line 3852 */
   CMPEQ(reg_b0_2, reg_r0_2, 0); /* line 3853 */
   OR(reg_r0_11, reg_r0_14, (unsigned int) 8388608); /* line 3854 */
} /* line 3854 */
  sim_icache_fetch(2019 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_11, reg_r0_11, (unsigned int) 7); /* line 3856 */
   OR(reg_r0_13, reg_r0_10, (unsigned int) 8388608); /* line 3857 */
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L114X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3858 */
  sim_icache_fetch(2023 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_15, reg_r0_11, reg_r0_11); /* line 3860 */
   SHL(reg_r0_16, reg_r0_13, (unsigned int) 8); /* line 3861 */
   SHRU(reg_r0_17, reg_r0_11, (unsigned int) 1); /* line 3862 */
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L115X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3863 */
  sim_icache_fetch(2027 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_13, reg_r0_12, reg_r0_2); /* line 3865 */
   CMPGTU(reg_b0_0, reg_r0_16, reg_r0_15); /* line 3866 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_16); /* line 3867 */
   if (reg_b0_2) {    BRANCH(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L116X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3868 */
l_L117X3: ;/* line 3870 */
LABEL(l_L117X3);
  sim_icache_fetch(2031 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_1, reg_r0_12, 0); /* line 3871 */
   ADD(reg_r0_15, reg_r0_13, (unsigned int) 125); /* line 3872 */
   ADD(reg_r0_18, reg_r0_13, (unsigned int) 126); /* line 3873 */
   SLCT(reg_r0_3, reg_b0_0, reg_r0_11, reg_r0_17); /* line 3874 */
} /* line 3874 */
  sim_icache_fetch(2035 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_4, 0); /* line 3876 */
   MOV(reg_r0_5, reg_r0_16); /* line 3877 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 44),0,4), reg_r0_3); /* line 3878 */
   MOV(reg_r0_11, reg_r0_14); /* line 3879 */
} /* line 3879 */
  sim_icache_fetch(2039 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_14, reg_b0_0, reg_r0_15, reg_r0_18); /* line 3881 */
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L118X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3882 */
l_L119X3: ;/* line 3884 */
LABEL(l_L119X3);
		 /* line 3884 */
  sim_icache_fetch(2041 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 48),0,4), reg_r0_14); /* line 3887 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(estimateDiv64To32);
   reg_l0_0 = (391 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) estimateDiv64To32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 3887 */
l_lr_252: ;/* line 3887 */
LABEL(l_lr_252);
  sim_icache_fetch(2044 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   AND(reg_r0_10, reg_r0_3, (unsigned int) 63); /* line 3889 */
   MOV(reg_r0_7, reg_r0_3); /* line 3890 */
   MOV(reg_r0_8, (unsigned int) -1); /* line 3891 */
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 3892 */
} /* line 3892 */
  sim_icache_fetch(2048 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLEU(reg_b0_0, reg_r0_10, (unsigned int) 2); /* line 3894 */
   ADD(reg_r0_4, reg_r0_1, (unsigned int) 20); /* line 3895 */
   ADD(reg_r0_6, reg_r0_3, (unsigned int) -1); /* line 3896 */
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 3897 */
} /* line 3897 */
  sim_icache_fetch(2052 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_5, reg_r0_1, (unsigned int) 16); /* line 3899 */
   MOV(reg_r0_9, 0); /* line 3900 */
   LDW(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 3901 */
} /* line 3901 */
  sim_icache_fetch(2055 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MULLHU(reg_r0_10, reg_r0_3, reg_r0_2); /* line 3903 */
   MULLHU(reg_r0_13, reg_r0_2, reg_r0_3); /* line 3904 */
   LDW(reg_r0_14, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 3905 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L120X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3906 */
  sim_icache_fetch(2059 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MULLLU(reg_r0_15, reg_r0_2, reg_r0_3); /* line 3908 */
   MULHHU(reg_r0_16, reg_r0_2, reg_r0_3); /* line 3909 */
} /* line 3909 */
  sim_icache_fetch(2061 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_13, reg_r0_10, reg_r0_13); /* line 3911 */
} /* line 3911 */
  sim_icache_fetch(2062 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_18, reg_r0_13, (unsigned int) 16); /* line 3913 */
   CMPLTU(reg_r0_10, reg_r0_13, reg_r0_10); /* line 3914 */
   SHL(reg_r0_17, reg_r0_13, (unsigned int) 16); /* line 3915 */
   MOV(reg_r0_3, reg_r0_2); /* line 3916 */
} /* line 3916 */
  sim_icache_fetch(2066 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_10, reg_r0_10, (unsigned int) 16); /* line 3918 */
   ADD(reg_r0_15, reg_r0_15, reg_r0_17); /* line 3919 */
   ADD(reg_r0_18, reg_r0_18, reg_r0_16); /* line 3920 */
   LDW(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 3921 */
} /* line 3921 */
  sim_icache_fetch(2070 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_17, reg_r0_15, reg_r0_17); /* line 3923 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_15); /* line 3924 */
   SUB(reg_r0_16, 0, reg_r0_15); /* line 3925 */
   CMPGTU(reg_r0_2, reg_r0_15, 0); /* line 3926 */
} /* line 3926 */
  sim_icache_fetch(2074 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_10, reg_r0_10, reg_r0_17); /* line 3928 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_16); /* line 3929 */
} /* line 3929 */
  sim_icache_fetch(2076 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_18, reg_r0_18, reg_r0_10); /* line 3931 */
} /* line 3931 */
  sim_icache_fetch(2077 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_18); /* line 3933 */
   SUB(reg_r0_11, reg_r0_11, reg_r0_18); /* line 3934 */
} /* line 3934 */
  sim_icache_fetch(2079 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SUB(reg_r0_11, reg_r0_11, reg_r0_2); /* line 3936 */
} /* line 3936 */
  sim_icache_fetch(2080 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_11); /* line 3938 */
} /* line 3938 */
l_L121X3: ;/* line 3941 */
LABEL(l_L121X3);
  sim_icache_fetch(2081 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3942 */
} /* line 3942 */
  sim_icache_fetch(2082 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3944 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3945 */
   ADD_CYCLES(1);
} /* line 3945 */
  sim_icache_fetch(2084 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_11, reg_r0_2, reg_r0_3); /* line 3947 */
} /* line 3947 */
  sim_icache_fetch(2085 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_b0_0, reg_r0_10, 0); /* line 3949 */
   CMPLTU(reg_r0_2, reg_r0_11, reg_r0_2); /* line 3950 */
} /* line 3950 */
  sim_icache_fetch(2087 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_10, reg_r0_10, reg_r0_2); /* line 3952 */
} /* line 3952 */
  sim_icache_fetch(2088 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L122X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3954 */
  sim_icache_fetch(2089 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_4,0,4), reg_r0_10); /* line 3956 */
   ADD(reg_r0_7, reg_r0_7, (unsigned int) -2); /* line 3957 */
} /* line 3957 */
  sim_icache_fetch(2091 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3959 */
} /* line 3959 */
  sim_icache_fetch(2092 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_11); /* line 3961 */
} /* line 3961 */
  sim_icache_fetch(2093 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3963 */
} /* line 3963 */
  sim_icache_fetch(2094 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLT(reg_b0_0, reg_r0_2, 0); /* line 3965 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3966 */
   ADD_CYCLES(1);
} /* line 3966 */
  sim_icache_fetch(2096 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_11, reg_r0_3, reg_r0_10); /* line 3968 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L123X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3969 */
  sim_icache_fetch(2098 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLTU(reg_r0_10, reg_r0_11, reg_r0_10); /* line 3971 */
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_11); /* line 3972 */
   ADD(reg_r0_9, reg_r0_9, (unsigned int) -2); /* line 3973 */
} /* line 3973 */
  sim_icache_fetch(2101 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_2, reg_r0_2, reg_r0_10); /* line 3975 */
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3976 */
} /* line 3976 */
  sim_icache_fetch(2103 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_4,0,4), reg_r0_2); /* line 3978 */
} /* line 3978 */
  sim_icache_fetch(2104 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3980 */
} /* line 3980 */
  sim_icache_fetch(2105 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_11, reg_r0_3, reg_r0_10); /* line 3982 */
} /* line 3982 */
  sim_icache_fetch(2106 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLTU(reg_r0_10, reg_r0_11, reg_r0_10); /* line 3984 */
} /* line 3984 */
  sim_icache_fetch(2107 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_b0_0, reg_r0_2, 0); /* line 3986 */
   ADD(reg_r0_2, reg_r0_2, reg_r0_10); /* line 3987 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 3988 */
   ADD_CYCLES(1);
} /* line 3988 */
  sim_icache_fetch(2110 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L124X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 3990 */
  sim_icache_fetch(2111 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_11); /* line 3992 */
   ADD(reg_r0_6, reg_r0_6, (unsigned int) -2); /* line 3993 */
} /* line 3993 */
  sim_icache_fetch(2113 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 3995 */
} /* line 3995 */
  sim_icache_fetch(2114 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_4,0,4), reg_r0_2); /* line 3997 */
} /* line 3997 */
  sim_icache_fetch(2115 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 3999 */
} /* line 3999 */
  sim_icache_fetch(2116 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_11, reg_r0_3, reg_r0_10); /* line 4001 */
} /* line 4001 */
  sim_icache_fetch(2117 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLTU(reg_r0_10, reg_r0_11, reg_r0_10); /* line 4003 */
} /* line 4003 */
  sim_icache_fetch(2118 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_b0_0, reg_r0_2, 0); /* line 4005 */
   ADD(reg_r0_2, reg_r0_2, reg_r0_10); /* line 4006 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4007 */
   ADD_CYCLES(1);
} /* line 4007 */
  sim_icache_fetch(2121 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L125X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4009 */
  sim_icache_fetch(2122 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_11); /* line 4011 */
   ADD(reg_r0_8, reg_r0_8, (unsigned int) -2); /* line 4012 */
} /* line 4012 */
  sim_icache_fetch(2124 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_4,0,4), reg_r0_2); /* line 4014 */
   GOTO(l_L121X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L121X3;
} /* line 4015 */
l_L125X3: ;/* line 4018 */
LABEL(l_L125X3);
  sim_icache_fetch(2126 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_9, reg_r0_8); /* line 4020 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_13); /* line 4021 */
   GOTO(l_L126X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L126X3;
} /* line 4022 */
l_L124X3: ;/* line 4025 */
LABEL(l_L124X3);
  sim_icache_fetch(2129 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_9, reg_r0_8); /* line 4026 */
   MOV(reg_r0_7, reg_r0_6); /* line 4027 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_13); /* line 4028 */
   GOTO(l_L126X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L126X3;
} /* line 4029 */
l_L123X3: ;/* line 4033 */
LABEL(l_L123X3);
  sim_icache_fetch(2133 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_7, reg_r0_6); /* line 4034 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_13); /* line 4035 */
   GOTO(l_L126X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L126X3;
} /* line 4036 */
l_L122X3: ;/* line 4041 */
LABEL(l_L122X3);
  sim_icache_fetch(2136 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_13); /* line 4042 */
} /* line 4042 */
l_L126X3: ;/* line 4044 */
LABEL(l_L126X3);
  sim_icache_fetch(2137 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_7, reg_r0_7, reg_r0_9); /* line 4045 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_12); /* line 4046 */
} /* line 4046 */
  sim_icache_fetch(2139 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 4048 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 4049 */
   ADD_CYCLES(2);
} /* line 4049 */
  sim_icache_fetch(2141 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_r0_2, reg_r0_2, 0); /* line 4051 */
} /* line 4051 */
  sim_icache_fetch(2142 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_5, reg_r0_7, reg_r0_2); /* line 4053 */
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 4054 */
} /* line 4054 */
  sim_icache_fetch(2144 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L127X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L127X3;
} /* line 4056 */
l_L120X3: ;/* line 4059 */
LABEL(l_L120X3);
  sim_icache_fetch(2145 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_5, reg_r0_7); /* line 4060 */
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 4061 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4062 */
   ADD_CYCLES(1);
} /* line 4062 */
l_L127X3: ;/* line 4064 */
LABEL(l_L127X3);
		 /* line 4064 */
  sim_icache_fetch(2148 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_4, reg_r0_14); /* line 4067 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(roundAndPackFloat32);
   reg_l0_0 = (391 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) roundAndPackFloat32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 4067 */
l_lr_262: ;/* line 4067 */
LABEL(l_lr_262);
  sim_icache_fetch(2151 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4069 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4070 */
   ADD_CYCLES(3);
} /* line 4070 */
  sim_icache_fetch(2153 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4073 */
l_L118X3: ;/* line 4076 */
LABEL(l_L118X3);
  sim_icache_fetch(2154 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_0, reg_r0_11, 0); /* line 4077 */
   LDW(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 4078 */
} /* line 4078 */
  sim_icache_fetch(2156 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4080 */
} /* line 4080 */
  sim_icache_fetch(2157 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L128X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4082 */
  sim_icache_fetch(2158 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_3, reg_r0_13, (unsigned int) 31); /* line 4084 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4085 */
   ADD_CYCLES(1);
} /* line 4085 */
  sim_icache_fetch(2160 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4088 */
l_L128X3: ;/* line 4091 */
LABEL(l_L128X3);
  sim_icache_fetch(2161 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_10); /* line 4092 */
   MOV(reg_r0_3, reg_r0_11); /* line 4093 */
} /* line 4093 */
  sim_icache_fetch(2163 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 64),0,4), reg_r0_2); /* line 4095 */
} /* line 4095 */
		 /* line 4096 */
  sim_icache_fetch(2164 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_11); /* line 4099 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (391 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 4099 */
l_lr_266: ;/* line 4099 */
LABEL(l_lr_266);
  sim_icache_fetch(2167 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_2, reg_r0_3, (unsigned int) -8); /* line 4101 */
   SUB(reg_r0_12, (unsigned int) 9, reg_r0_3); /* line 4102 */
   MOV(reg_r0_4, 0); /* line 4103 */
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 4104 */
} /* line 4104 */
  sim_icache_fetch(2171 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 4106 */
} /* line 4106 */
  sim_icache_fetch(2172 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 64),0,4)); /* line 4108 */
} /* line 4108 */
  sim_icache_fetch(2173 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_6, reg_r0_6, reg_r0_2); /* line 4110 */
} /* line 4110 */
  sim_icache_fetch(2174 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_11, reg_r0_6, (unsigned int) 8388608); /* line 4112 */
   OR(reg_r0_13, reg_r0_10, (unsigned int) 8388608); /* line 4113 */
} /* line 4113 */
  sim_icache_fetch(2178 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_13 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SUB(reg_r0_13, reg_r0_12, reg_r0_7); /* line 4115 */
   SHL(reg_r0_11, reg_r0_11, (unsigned int) 7); /* line 4116 */
   SHL(reg_r0_5, t__i32_0, (unsigned int) 8); /* line 4117 */
} /* line 4117 */
  sim_icache_fetch(2181 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_2, reg_r0_13, (unsigned int) 125); /* line 4119 */
   ADD(reg_r0_15, reg_r0_11, reg_r0_11); /* line 4120 */
   SHRU(reg_r0_17, reg_r0_11, (unsigned int) 1); /* line 4121 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_5); /* line 4122 */
} /* line 4122 */
  sim_icache_fetch(2185 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPGTU(reg_b0_0, reg_r0_5, reg_r0_15); /* line 4124 */
   ADD(reg_r0_18, reg_r0_13, (unsigned int) 126); /* line 4125 */
} /* line 4125 */
  sim_icache_fetch(2187 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_3, reg_b0_0, reg_r0_11, reg_r0_17); /* line 4127 */
   SLCT(reg_r0_14, reg_b0_0, reg_r0_2, reg_r0_18); /* line 4128 */
} /* line 4128 */
  sim_icache_fetch(2189 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 44),0,4), reg_r0_3); /* line 4130 */
   GOTO(l_L119X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L119X3;
} /* line 4131 */
l_L116X3: ;/* line 4134 */
LABEL(l_L116X3);
  sim_icache_fetch(2191 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_b0_0, reg_r0_10, 0); /* line 4135 */
   OR(reg_r0_2, reg_r0_14, reg_r0_12); /* line 4136 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 4137 */
} /* line 4137 */
  sim_icache_fetch(2194 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_1, reg_r0_2, 0); /* line 4139 */
} /* line 4139 */
  sim_icache_fetch(2195 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L129X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4141 */
  sim_icache_fetch(2196 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L130X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4143 */
		 /* line 4144 */
  sim_icache_fetch(2197 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (391 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 4146 */
l_lr_269: ;/* line 4146 */
LABEL(l_lr_269);
  sim_icache_fetch(2199 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4148 */
   MOV(reg_r0_3, (unsigned int) 2147483647); /* line 4149 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4150 */
   ADD_CYCLES(3);
} /* line 4150 */
  sim_icache_fetch(2203 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4153 */
l_L130X3: ;/* line 4156 */
LABEL(l_L130X3);
		 /* line 4156 */
  sim_icache_fetch(2204 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, (unsigned int) 128); /* line 4159 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (391 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 4159 */
l_lr_272: ;/* line 4159 */
LABEL(l_lr_272);
  sim_icache_fetch(2207 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 4161 */
} /* line 4161 */
  sim_icache_fetch(2208 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4163 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4164 */
   ADD_CYCLES(1);
} /* line 4164 */
  sim_icache_fetch(2210 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_13, reg_r0_13, (unsigned int) 31); /* line 4166 */
} /* line 4166 */
  sim_icache_fetch(2211 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_3, reg_r0_13, (unsigned int) 2139095040); /* line 4168 */
} /* line 4168 */
  sim_icache_fetch(2213 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4171 */
l_L129X3: ;/* line 4174 */
LABEL(l_L129X3);
  sim_icache_fetch(2214 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_14); /* line 4175 */
   MOV(reg_r0_3, reg_r0_10); /* line 4176 */
} /* line 4176 */
  sim_icache_fetch(2216 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), reg_r0_12); /* line 4178 */
} /* line 4178 */
		 /* line 4179 */
  sim_icache_fetch(2217 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_10); /* line 4182 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(countLeadingZeros32);
   reg_l0_0 = (391 << 5);
   {
    typedef unsigned int t_FT (unsigned int);
    t_FT *t_call = (t_FT*) countLeadingZeros32;
    reg_r0_3 =     (*t_call)(reg_r0_3);
   }
} /* line 4182 */
l_lr_275: ;/* line 4182 */
LABEL(l_lr_275);
  sim_icache_fetch(2220 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_4, reg_r0_3, (unsigned int) -8); /* line 4184 */
   SUB(reg_r0_2, (unsigned int) 9, reg_r0_3); /* line 4185 */
   LDW(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 4186 */
} /* line 4186 */
  sim_icache_fetch(2223 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_14, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 4188 */
} /* line 4188 */
  sim_icache_fetch(2224 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 56),0,4)); /* line 4190 */
} /* line 4190 */
  sim_icache_fetch(2225 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_10, reg_r0_10, reg_r0_4); /* line 4192 */
} /* line 4192 */
  sim_icache_fetch(2226 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_4, reg_r0_14, (unsigned int) 8388608); /* line 4194 */
   OR(reg_r0_3, reg_r0_10, (unsigned int) 8388608); /* line 4195 */
} /* line 4195 */
  sim_icache_fetch(2230 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SUB(reg_r0_13, reg_r0_12, reg_r0_2); /* line 4197 */
   SHL(reg_r0_11, reg_r0_4, (unsigned int) 7); /* line 4198 */
   SHL(reg_r0_16, reg_r0_3, (unsigned int) 8); /* line 4199 */
} /* line 4199 */
  sim_icache_fetch(2233 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_15, reg_r0_11, reg_r0_11); /* line 4201 */
   SHRU(reg_r0_17, reg_r0_11, (unsigned int) 1); /* line 4202 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_16); /* line 4203 */
} /* line 4203 */
  sim_icache_fetch(2236 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPGTU(reg_b0_0, reg_r0_16, reg_r0_15); /* line 4205 */
} /* line 4205 */
  sim_icache_fetch(2237 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L117X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L117X3;
} /* line 4207 */
l_L115X3: ;/* line 4210 */
LABEL(l_L115X3);
  sim_icache_fetch(2238 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_10, 0); /* line 4211 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4212 */
   ADD_CYCLES(1);
} /* line 4212 */
  sim_icache_fetch(2240 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L131X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4214 */
		 /* line 4215 */
  sim_icache_fetch(2241 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat32NaN);
   reg_l0_0 = (391 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat32NaN;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 4217 */
l_lr_278: ;/* line 4217 */
LABEL(l_lr_278);
  sim_icache_fetch(2243 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4219 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4220 */
   ADD_CYCLES(3);
} /* line 4220 */
  sim_icache_fetch(2245 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4223 */
l_L131X3: ;/* line 4226 */
LABEL(l_L131X3);
  sim_icache_fetch(2246 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 4227 */
} /* line 4227 */
  sim_icache_fetch(2247 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4229 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4230 */
   ADD_CYCLES(1);
} /* line 4230 */
  sim_icache_fetch(2249 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_3, reg_r0_13, (unsigned int) 31); /* line 4232 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4233 */
   ADD_CYCLES(1);
} /* line 4233 */
  sim_icache_fetch(2251 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4236 */
l_L114X3: ;/* line 4239 */
LABEL(l_L114X3);
  sim_icache_fetch(2252 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_14, 0); /* line 4240 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4241 */
   ADD_CYCLES(1);
} /* line 4241 */
  sim_icache_fetch(2254 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L132X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4243 */
		 /* line 4244 */
  sim_icache_fetch(2255 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat32NaN);
   reg_l0_0 = (391 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat32NaN;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 4246 */
l_lr_282: ;/* line 4246 */
LABEL(l_lr_282);
  sim_icache_fetch(2257 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4248 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4249 */
   ADD_CYCLES(3);
} /* line 4249 */
  sim_icache_fetch(2259 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4252 */
l_L132X3: ;/* line 4255 */
LABEL(l_L132X3);
  sim_icache_fetch(2260 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_0, reg_r0_2, (unsigned int) 255); /* line 4256 */
   CMPNE(reg_b0_1, reg_r0_10, 0); /* line 4257 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4258 */
   ADD_CYCLES(1);
} /* line 4258 */
  sim_icache_fetch(2263 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L133X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4260 */
  sim_icache_fetch(2264 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L134X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4262 */
		 /* line 4263 */
  sim_icache_fetch(2265 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat32NaN);
   reg_l0_0 = (391 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat32NaN;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 4265 */
l_lr_285: ;/* line 4265 */
LABEL(l_lr_285);
  sim_icache_fetch(2267 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4267 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4268 */
   ADD_CYCLES(3);
} /* line 4268 */
  sim_icache_fetch(2269 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4271 */
l_L134X3: ;/* line 4274 */
LABEL(l_L134X3);
		 /* line 4274 */
  sim_icache_fetch(2270 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, (unsigned int) 16); /* line 4277 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (391 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 4277 */
l_lr_288: ;/* line 4277 */
LABEL(l_lr_288);
  sim_icache_fetch(2273 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4279 */
   MOV(reg_r0_3, (unsigned int) 2147483647); /* line 4280 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4281 */
   ADD_CYCLES(3);
} /* line 4281 */
  sim_icache_fetch(2277 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4284 */
l_L133X3: ;/* line 4287 */
LABEL(l_L133X3);
  sim_icache_fetch(2278 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 4288 */
} /* line 4288 */
  sim_icache_fetch(2279 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4290 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4291 */
   ADD_CYCLES(1);
} /* line 4291 */
  sim_icache_fetch(2281 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SHL(reg_r0_13, reg_r0_13, (unsigned int) 31); /* line 4293 */
} /* line 4293 */
  sim_icache_fetch(2282 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_3, reg_r0_13, (unsigned int) 2139095040); /* line 4295 */
} /* line 4295 */
  sim_icache_fetch(2284 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4298 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 350: goto l_L117X3;
    case 351: goto l_L119X3;
    case 353: goto l_lr_252;
    case 354: goto l_L121X3;
    case 355: goto l_L125X3;
    case 356: goto l_L124X3;
    case 357: goto l_L123X3;
    case 358: goto l_L122X3;
    case 359: goto l_L126X3;
    case 360: goto l_L120X3;
    case 361: goto l_L127X3;
    case 363: goto l_lr_262;
    case 364: goto l_L118X3;
    case 365: goto l_L128X3;
    case 367: goto l_lr_266;
    case 368: goto l_L116X3;
    case 370: goto l_lr_269;
    case 371: goto l_L130X3;
    case 373: goto l_lr_272;
    case 374: goto l_L129X3;
    case 376: goto l_lr_275;
    case 377: goto l_L115X3;
    case 379: goto l_lr_278;
    case 380: goto l_L131X3;
    case 381: goto l_L114X3;
    case 383: goto l_lr_282;
    case 384: goto l_L132X3;
    case 386: goto l_lr_285;
    case 387: goto l_L134X3;
    case 389: goto l_lr_288;
    case 390: goto l_L133X3;
    case 391:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_eq( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_eq);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (396 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(2285 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 4320 */
   SHRU(reg_r0_2, reg_r0_3, (unsigned int) 23); /* line 4321 */
   SHRU(reg_r0_5, reg_r0_4, (unsigned int) 23); /* line 4322 */
} /* line 4322 */
  sim_icache_fetch(2288 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_2, reg_r0_2, (unsigned int) 255); /* line 4324 */
   AND(reg_r0_6, reg_r0_3, (unsigned int) 8388607); /* line 4325 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 4326 */
} /* line 4326 */
  sim_icache_fetch(2292 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_5, reg_r0_5, (unsigned int) 255); /* line 4328 */
   CMPEQ(reg_r0_2, reg_r0_2, (unsigned int) 255); /* line 4329 */
   AND(reg_r0_7, reg_r0_4, (unsigned int) 8388607); /* line 4330 */
} /* line 4330 */
  sim_icache_fetch(2296 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_r0_5, reg_r0_5, (unsigned int) 255); /* line 4332 */
   ANDL(reg_r0_2, reg_r0_2, reg_r0_6); /* line 4333 */
   CMPEQ(reg_r0_8, reg_r0_3, reg_r0_4); /* line 4334 */
   OR(reg_r0_6, reg_r0_3, reg_r0_4); /* line 4335 */
} /* line 4335 */
  sim_icache_fetch(2300 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_5, reg_r0_5, reg_r0_7); /* line 4337 */
   SHL(reg_r0_6, reg_r0_6, (unsigned int) 1); /* line 4338 */
} /* line 4338 */
  sim_icache_fetch(2302 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_b0_0, reg_r0_2, reg_r0_5); /* line 4340 */
   CMPEQ(reg_r0_6, reg_r0_6, 0); /* line 4341 */
} /* line 4341 */
  sim_icache_fetch(2304 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_r0_3, reg_r0_8, reg_r0_6); /* line 4343 */
   MOV(reg_r0_2, t__i32_0); /* line 4344 */
} /* line 4344 */
  sim_icache_fetch(2306 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L135X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4346 */
  sim_icache_fetch(2307 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_eq);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4349 */
l_L135X3: ;/* line 4352 */
LABEL(l_L135X3);
  sim_icache_fetch(2308 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHRU(reg_r0_5, reg_r0_2, (unsigned int) 22); /* line 4353 */
   AND(reg_r0_6, reg_r0_2, (unsigned int) 4194303); /* line 4354 */
   SHRU(reg_r0_7, reg_r0_4, (unsigned int) 22); /* line 4355 */
} /* line 4355 */
  sim_icache_fetch(2312 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_5, reg_r0_5, (unsigned int) 511); /* line 4357 */
   AND(reg_r0_7, reg_r0_7, (unsigned int) 511); /* line 4358 */
} /* line 4358 */
  sim_icache_fetch(2316 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_5, reg_r0_5, (unsigned int) 510); /* line 4360 */
   CMPEQ(reg_r0_7, reg_r0_7, (unsigned int) 510); /* line 4361 */
} /* line 4361 */
  sim_icache_fetch(2320 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ANDL(reg_r0_5, reg_r0_5, reg_r0_6); /* line 4363 */
   AND(reg_r0_4, reg_r0_4, (unsigned int) 4194303); /* line 4364 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 4365 */
} /* line 4365 */
  sim_icache_fetch(2324 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ANDL(reg_r0_7, reg_r0_7, reg_r0_4); /* line 4367 */
} /* line 4367 */
  sim_icache_fetch(2325 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_b0_0, reg_r0_5, reg_r0_7); /* line 4369 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4370 */
   ADD_CYCLES(1);
} /* line 4370 */
  sim_icache_fetch(2327 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L136X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4372 */
		 /* line 4373 */
  sim_icache_fetch(2328 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (396 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 4375 */
l_lr_293: ;/* line 4375 */
LABEL(l_lr_293);
l_L136X3: ;/* line 4377 */
LABEL(l_L136X3);
  sim_icache_fetch(2330 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, 0); /* line 4378 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 4379 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4380 */
   ADD_CYCLES(3);
} /* line 4380 */
  sim_icache_fetch(2333 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_eq);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4383 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 392: goto l_L135X3;
    case 394: goto l_lr_293;
    case 395: goto l_L136X3;
    case 396:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_le( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_le);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (401 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(2334 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 4400 */
   SHRU(reg_r0_2, reg_r0_3, (unsigned int) 23); /* line 4401 */
   SHRU(reg_r0_5, reg_r0_4, (unsigned int) 23); /* line 4402 */
} /* line 4402 */
  sim_icache_fetch(2337 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_2, reg_r0_2, (unsigned int) 255); /* line 4404 */
   AND(reg_r0_6, reg_r0_3, (unsigned int) 8388607); /* line 4405 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 4406 */
} /* line 4406 */
  sim_icache_fetch(2341 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_5, reg_r0_5, (unsigned int) 255); /* line 4408 */
   CMPEQ(reg_r0_2, reg_r0_2, (unsigned int) 255); /* line 4409 */
   AND(reg_r0_7, reg_r0_4, (unsigned int) 8388607); /* line 4410 */
} /* line 4410 */
  sim_icache_fetch(2345 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_r0_5, reg_r0_5, (unsigned int) 255); /* line 4412 */
   ANDL(reg_r0_2, reg_r0_2, reg_r0_6); /* line 4413 */
   SHRU(reg_r0_6, reg_r0_3, (unsigned int) 31); /* line 4414 */
   SHRU(reg_r0_8, reg_r0_4, (unsigned int) 31); /* line 4415 */
} /* line 4415 */
  sim_icache_fetch(2349 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ANDL(reg_r0_5, reg_r0_5, reg_r0_7); /* line 4417 */
   CMPNE(reg_b0_0, reg_r0_6, reg_r0_8); /* line 4418 */
   OR(reg_r0_7, reg_r0_3, reg_r0_4); /* line 4419 */
} /* line 4419 */
  sim_icache_fetch(2352 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_b0_1, reg_r0_2, reg_r0_5); /* line 4421 */
   SHL(reg_r0_7, reg_r0_7, (unsigned int) 1); /* line 4422 */
} /* line 4422 */
  sim_icache_fetch(2354 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_r0_7, reg_r0_7, 0); /* line 4424 */
} /* line 4424 */
  sim_icache_fetch(2355 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ORL(reg_r0_3, reg_r0_6, reg_r0_7); /* line 4426 */
   MOV(reg_r0_2, t__i32_0); /* line 4427 */
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L137X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4428 */
  sim_icache_fetch(2358 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L138X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4430 */
  sim_icache_fetch(2359 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_le);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4433 */
l_L138X3: ;/* line 4436 */
LABEL(l_L138X3);
  sim_icache_fetch(2360 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_2 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_2, t__i32_0, reg_r0_4); /* line 4437 */
   CMPLTU(reg_r0_5, t__i32_0, reg_r0_4); /* line 4438 */
} /* line 4438 */
  sim_icache_fetch(2362 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   XOR(reg_r0_5, reg_r0_5, reg_r0_6); /* line 4440 */
} /* line 4440 */
  sim_icache_fetch(2363 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_r0_3, reg_r0_2, reg_r0_5); /* line 4443 */
   RETURN(_r_le);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4444 */
l_L137X3: ;/* line 4447 */
LABEL(l_L137X3);
		 /* line 4447 */
  sim_icache_fetch(2365 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, (unsigned int) 16); /* line 4450 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (401 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 4450 */
l_lr_299: ;/* line 4450 */
LABEL(l_lr_299);
  sim_icache_fetch(2368 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, 0); /* line 4452 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 4453 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4454 */
   ADD_CYCLES(3);
} /* line 4454 */
  sim_icache_fetch(2371 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_le);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4457 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 397: goto l_L138X3;
    case 398: goto l_L137X3;
    case 400: goto l_lr_299;
    case 401:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_lt( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_lt);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (406 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(2372 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 4474 */
   SHRU(reg_r0_2, reg_r0_3, (unsigned int) 23); /* line 4475 */
   SHRU(reg_r0_5, reg_r0_4, (unsigned int) 23); /* line 4476 */
} /* line 4476 */
  sim_icache_fetch(2375 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_2, reg_r0_2, (unsigned int) 255); /* line 4478 */
   AND(reg_r0_6, reg_r0_3, (unsigned int) 8388607); /* line 4479 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 4480 */
} /* line 4480 */
  sim_icache_fetch(2379 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_5, reg_r0_5, (unsigned int) 255); /* line 4482 */
   CMPEQ(reg_r0_2, reg_r0_2, (unsigned int) 255); /* line 4483 */
   AND(reg_r0_7, reg_r0_4, (unsigned int) 8388607); /* line 4484 */
} /* line 4484 */
  sim_icache_fetch(2383 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_r0_5, reg_r0_5, (unsigned int) 255); /* line 4486 */
   ANDL(reg_r0_2, reg_r0_2, reg_r0_6); /* line 4487 */
   SHRU(reg_r0_6, reg_r0_3, (unsigned int) 31); /* line 4488 */
   SHRU(reg_r0_8, reg_r0_4, (unsigned int) 31); /* line 4489 */
} /* line 4489 */
  sim_icache_fetch(2387 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ANDL(reg_r0_5, reg_r0_5, reg_r0_7); /* line 4491 */
   CMPNE(reg_b0_0, reg_r0_6, reg_r0_8); /* line 4492 */
   OR(reg_r0_7, reg_r0_3, reg_r0_4); /* line 4493 */
} /* line 4493 */
  sim_icache_fetch(2390 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_b0_1, reg_r0_2, reg_r0_5); /* line 4495 */
   SHL(reg_r0_7, reg_r0_7, (unsigned int) 1); /* line 4496 */
} /* line 4496 */
  sim_icache_fetch(2392 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_3, reg_r0_6, reg_r0_7); /* line 4498 */
   MOV(reg_r0_2, t__i32_0); /* line 4499 */
} /* line 4499 */
  sim_icache_fetch(2394 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L139X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4501 */
  sim_icache_fetch(2395 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L140X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4503 */
  sim_icache_fetch(2396 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_lt);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4506 */
l_L140X3: ;/* line 4509 */
LABEL(l_L140X3);
  sim_icache_fetch(2397 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_2 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_r0_2, t__i32_0, reg_r0_4); /* line 4510 */
   CMPLTU(reg_r0_5, t__i32_0, reg_r0_4); /* line 4511 */
} /* line 4511 */
  sim_icache_fetch(2399 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   XOR(reg_r0_5, reg_r0_5, reg_r0_6); /* line 4513 */
} /* line 4513 */
  sim_icache_fetch(2400 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_3, reg_r0_2, reg_r0_5); /* line 4516 */
   RETURN(_r_lt);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4517 */
l_L139X3: ;/* line 4520 */
LABEL(l_L139X3);
		 /* line 4520 */
  sim_icache_fetch(2402 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, (unsigned int) 16); /* line 4523 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (406 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 4523 */
l_lr_304: ;/* line 4523 */
LABEL(l_lr_304);
  sim_icache_fetch(2405 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, 0); /* line 4525 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 4526 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4527 */
   ADD_CYCLES(3);
} /* line 4527 */
  sim_icache_fetch(2408 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_lt);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4530 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 402: goto l_L140X3;
    case 403: goto l_L139X3;
    case 405: goto l_lr_304;
    case 406:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

static unsigned int float64_to_int32_round_to_zero( unsigned int arg0, unsigned int arg1, unsigned int arg2 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(float64_to_int32_round_to_zero);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_l0_0 = (416 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(2409 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 4547 */
   AND(reg_r0_2, reg_r0_3, (unsigned int) 1048575); /* line 4548 */
} /* line 4548 */
  sim_icache_fetch(2412 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_7, reg_r0_3, (unsigned int) 20); /* line 4550 */
   SHRU(reg_r0_6, reg_r0_3, (unsigned int) 31); /* line 4551 */
   CMPNE(reg_b0_0, reg_r0_5, 0); /* line 4552 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_l0_0); /* line 4553 */
} /* line 4553 */
  sim_icache_fetch(2416 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_7, reg_r0_7, (unsigned int) 2047); /* line 4555 */
   MOV(reg_r0_8, (unsigned int) -1073741824); /* line 4556 */
} /* line 4556 */
  sim_icache_fetch(2420 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_9, reg_r0_7, (unsigned int) -1043); /* line 4558 */
   OR(reg_r0_10, reg_r0_4, reg_r0_2); /* line 4559 */
   SLCT(reg_r0_8, reg_b0_0, reg_r0_8, (unsigned int) -1); /* line 4560 */
} /* line 4560 */
  sim_icache_fetch(2424 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPGE(reg_b0_0, reg_r0_9, 0); /* line 4562 */
   CMPGT(reg_b0_1, reg_r0_9, (unsigned int) 11); /* line 4563 */
   CMPEQ(reg_r0_11, reg_r0_7, (unsigned int) 2047); /* line 4564 */
} /* line 4564 */
  sim_icache_fetch(2428 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_b0_2, reg_r0_11, reg_r0_10); /* line 4566 */
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 4567 */
} /* line 4567 */
  sim_icache_fetch(2430 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_10, mem_trace_ld((unsigned int) _X1PACKETX3,0,4)); /* line 4569 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L141X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4570 */
  sim_icache_fetch(2433 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L142X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4572 */
  sim_icache_fetch(2434 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SLCTF(reg_r0_6, reg_b0_2, reg_r0_6, 0); /* line 4574 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_8); /* line 4575 */
   CMPNE(reg_b0_0, reg_r0_12, 0); /* line 4576 */
} /* line 4576 */
l_L143X3: ;/* line 4578 */
LABEL(l_L143X3);
  sim_icache_fetch(2437 + t_thisfile.offset, 5);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 4579 */
   ORL(reg_r0_4, reg_r0_6, reg_r0_5); /* line 4580 */
   OR(reg_r0_10, reg_r0_10, (unsigned int) 1); /* line 4581 */
   MTB(reg_b0_1, reg_r0_6); /* line 4582 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 4583 */
   ADD_CYCLES(2);
} /* line 4583 */
  sim_icache_fetch(2442 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SUB(reg_r0_7, 0, reg_r0_2); /* line 4585 */
} /* line 4585 */
  sim_icache_fetch(2443 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_3, reg_b0_1, reg_r0_7, reg_r0_2); /* line 4587 */
} /* line 4587 */
  sim_icache_fetch(2444 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_r0_2, reg_r0_3, 0); /* line 4589 */
   ANDL(reg_r0_4, reg_r0_3, reg_r0_4); /* line 4590 */
} /* line 4590 */
  sim_icache_fetch(2446 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   XOR(reg_r0_2, reg_r0_6, reg_r0_2); /* line 4592 */
} /* line 4592 */
  sim_icache_fetch(2447 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ANDL(reg_b0_1, reg_r0_4, reg_r0_2); /* line 4594 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4595 */
   ADD_CYCLES(1);
} /* line 4595 */
  sim_icache_fetch(2449 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L144X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4597 */
  sim_icache_fetch(2450 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L145X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4599 */
  sim_icache_fetch(2451 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((unsigned int) _X1PACKETX3,0,4), reg_r0_10); /* line 4602 */
   RETURN(float64_to_int32_round_to_zero);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4603 */
l_L145X3: ;/* line 4606 */
LABEL(l_L145X3);
  sim_icache_fetch(2454 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(float64_to_int32_round_to_zero);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4608 */
l_L144X3: ;/* line 4611 */
LABEL(l_L144X3);
  sim_icache_fetch(2455 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_6); /* line 4612 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 4613 */
} /* line 4613 */
		 /* line 4614 */
  sim_icache_fetch(2457 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_5); /* line 4617 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (416 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 4617 */
l_lr_310: ;/* line 4617 */
LABEL(l_lr_310);
  sim_icache_fetch(2460 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_2, (unsigned int) -2147483648); /* line 4619 */
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4620 */
} /* line 4620 */
  sim_icache_fetch(2463 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 4622 */
} /* line 4622 */
  sim_icache_fetch(2464 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 4624 */
} /* line 4624 */
  sim_icache_fetch(2465 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_5, 0); /* line 4626 */
} /* line 4626 */
  sim_icache_fetch(2466 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MTB(reg_b0_1, reg_r0_6); /* line 4628 */
} /* line 4628 */
  sim_icache_fetch(2467 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L146X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4630 */
  sim_icache_fetch(2468 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_3, reg_b0_1, reg_r0_2, (unsigned int) 2147483647); /* line 4633 */
   RETURN(float64_to_int32_round_to_zero);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4634 */
l_L146X3: ;/* line 4637 */
LABEL(l_L146X3);
  sim_icache_fetch(2471 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_3, reg_b0_1, 0, (unsigned int) -1); /* line 4639 */
   RETURN(float64_to_int32_round_to_zero);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4640 */
l_L142X3: ;/* line 4643 */
LABEL(l_L142X3);
  sim_icache_fetch(2473 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   OR(reg_r0_2, reg_r0_2, (unsigned int) 1048576); /* line 4644 */
   SUB(reg_r0_3, 0, reg_r0_9); /* line 4645 */
   CMPEQ(reg_b0_0, reg_r0_9, 0); /* line 4646 */
} /* line 4646 */
  sim_icache_fetch(2477 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_9 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_9, reg_r0_4, t__i32_0); /* line 4648 */
   SHL(reg_r0_7, reg_r0_2, t__i32_0); /* line 4649 */
   AND(reg_r0_3, reg_r0_3, (unsigned int) 31); /* line 4650 */
} /* line 4650 */
  sim_icache_fetch(2480 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_9); /* line 4652 */
   SHRU(reg_r0_4, reg_r0_4, reg_r0_3); /* line 4653 */
} /* line 4653 */
  sim_icache_fetch(2482 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_7, reg_r0_7, reg_r0_4); /* line 4655 */
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 4656 */
} /* line 4656 */
  sim_icache_fetch(2484 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SLCT(reg_r0_2, reg_b0_0, reg_r0_2, reg_r0_7); /* line 4658 */
} /* line 4658 */
  sim_icache_fetch(2485 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_2); /* line 4660 */
} /* line 4660 */
  sim_icache_fetch(2486 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_10, mem_trace_ld((unsigned int) _X1PACKETX3,0,4)); /* line 4662 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4663 */
   ADD_CYCLES(1);
} /* line 4663 */
  sim_icache_fetch(2489 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_b0_0, reg_r0_12, 0); /* line 4665 */
   GOTO(l_L143X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L143X3;
} /* line 4666 */
l_L141X3: ;/* line 4669 */
LABEL(l_L141X3);
  sim_icache_fetch(2491 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_b0_0, reg_r0_7, (unsigned int) 1022); /* line 4670 */
   OR(reg_r0_3, reg_r0_7, reg_r0_2); /* line 4671 */
} /* line 4671 */
  sim_icache_fetch(2494 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_3, reg_r0_3, reg_r0_4); /* line 4673 */
} /* line 4673 */
  sim_icache_fetch(2495 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L147X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4675 */
  sim_icache_fetch(2496 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_3); /* line 4677 */
} /* line 4677 */
  sim_icache_fetch(2497 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 4679 */
} /* line 4679 */
  sim_icache_fetch(2498 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), 0); /* line 4681 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4682 */
   ADD_CYCLES(1);
} /* line 4682 */
  sim_icache_fetch(2500 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_b0_0, reg_r0_12, 0); /* line 4684 */
   GOTO(l_L143X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L143X3;
} /* line 4685 */
l_L147X3: ;/* line 4688 */
LABEL(l_L147X3);
  sim_icache_fetch(2502 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_9 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   OR(reg_r0_2, reg_r0_2, (unsigned int) 1048576); /* line 4689 */
   SUB(reg_r0_9, 0, t__i32_0); /* line 4690 */
   AND(reg_r0_3, t__i32_0, (unsigned int) 31); /* line 4691 */
} /* line 4691 */
  sim_icache_fetch(2506 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_2 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHRU(reg_r0_2, t__i32_0, reg_r0_9); /* line 4693 */
   SHL(reg_r0_3, t__i32_0, reg_r0_3); /* line 4694 */
} /* line 4694 */
  sim_icache_fetch(2508 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_3, reg_r0_3, reg_r0_4); /* line 4696 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_2); /* line 4697 */
} /* line 4697 */
  sim_icache_fetch(2510 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_3); /* line 4699 */
} /* line 4699 */
  sim_icache_fetch(2511 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 4701 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 4702 */
   ADD_CYCLES(2);
} /* line 4702 */
  sim_icache_fetch(2513 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_b0_0, reg_r0_12, 0); /* line 4704 */
   GOTO(l_L143X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L143X3;
} /* line 4705 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 407: goto l_L143X3;
    case 408: goto l_L145X3;
    case 409: goto l_L144X3;
    case 411: goto l_lr_310;
    case 412: goto l_L146X3;
    case 413: goto l_L142X3;
    case 414: goto l_L141X3;
    case 415: goto l_L147X3;
    case 416:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_d( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_d);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (427 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(2515 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 4725 */
   AND(reg_r0_2, reg_r0_3, (unsigned int) 1048575); /* line 4726 */
} /* line 4726 */
  sim_icache_fetch(2518 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_6, reg_r0_3, (unsigned int) 20); /* line 4728 */
   SHRU(reg_r0_5, reg_r0_3, (unsigned int) 31); /* line 4729 */
   OR(reg_r0_7, reg_r0_4, reg_r0_2); /* line 4730 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_l0_0); /* line 4731 */
} /* line 4731 */
  sim_icache_fetch(2522 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_6, reg_r0_6, (unsigned int) 2047); /* line 4733 */
   CMPNE(reg_b0_0, reg_r0_7, 0); /* line 4734 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_4); /* line 4735 */
} /* line 4735 */
  sim_icache_fetch(2526 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_1, reg_r0_6, (unsigned int) 2047); /* line 4737 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_3); /* line 4738 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4739 */
   ADD_CYCLES(1);
} /* line 4739 */
  sim_icache_fetch(2530 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L148X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4741 */
  sim_icache_fetch(2531 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L149X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4743 */
		 /* line 4744 */
  sim_icache_fetch(2532 + t_thisfile.offset, 2);
{
  sim_result_0_t t_sim_result_0_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float64ToCommonNaN);
   reg_l0_0 = (427 << 5);
   {
    typedef sim_result_0_t t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) float64ToCommonNaN;
    t_sim_result_0_t =     (*t_call)(reg_r0_3, reg_r0_4);
    reg_r0_3 = t_sim_result_0_t.alias0;
    reg_r0_4 = t_sim_result_0_t.alias1;
    reg_r0_5 = t_sim_result_0_t.alias2;
   }
} /* line 4746 */
l_lr_317: ;/* line 4746 */
LABEL(l_lr_317);
  sim_icache_fetch(2534 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHRU(reg_r0_2, reg_r0_4, (unsigned int) 9); /* line 4748 */
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 4749 */
} /* line 4749 */
  sim_icache_fetch(2536 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_2); /* line 4751 */
} /* line 4751 */
  sim_icache_fetch(2537 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4753 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4754 */
   ADD_CYCLES(1);
} /* line 4754 */
		 /* line 4755 */
  sim_icache_fetch(2539 + t_thisfile.offset, 2);
{
  sim_result_0_t t_sim_result_0_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float64ToCommonNaN);
   reg_l0_0 = (427 << 5);
   {
    typedef sim_result_0_t t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) float64ToCommonNaN;
    t_sim_result_0_t =     (*t_call)(reg_r0_3, reg_r0_4);
    reg_r0_3 = t_sim_result_0_t.alias0;
    reg_r0_4 = t_sim_result_0_t.alias1;
    reg_r0_5 = t_sim_result_0_t.alias2;
   }
} /* line 4757 */
l_lr_319: ;/* line 4757 */
LABEL(l_lr_319);
  sim_icache_fetch(2541 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_3, reg_r0_3, (unsigned int) 31); /* line 4759 */
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 4760 */
} /* line 4760 */
  sim_icache_fetch(2543 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 4762 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4763 */
   ADD_CYCLES(1);
} /* line 4763 */
  sim_icache_fetch(2545 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, (unsigned int) 2143289344); /* line 4765 */
} /* line 4765 */
  sim_icache_fetch(2547 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_3, reg_r0_2, reg_r0_3); /* line 4767 */
} /* line 4767 */
  sim_icache_fetch(2548 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_d);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4770 */
l_L149X3: ;/* line 4773 */
LABEL(l_L149X3);
  sim_icache_fetch(2549 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_5, reg_r0_5, (unsigned int) 31); /* line 4774 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 4775 */
} /* line 4775 */
  sim_icache_fetch(2551 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_3, reg_r0_5, (unsigned int) 2139095040); /* line 4777 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 4778 */
   ADD_CYCLES(2);
} /* line 4778 */
  sim_icache_fetch(2554 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_d);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4781 */
l_L148X3: ;/* line 4784 */
LABEL(l_L148X3);
  sim_icache_fetch(2555 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_7, reg_r0_4, (unsigned int) 10); /* line 4785 */
   SHRU(reg_r0_9, reg_r0_4, (unsigned int) 22); /* line 4786 */
   SHL(reg_r0_8, reg_r0_2, (unsigned int) 10); /* line 4787 */
   SHRU(reg_r0_10, reg_r0_2, (unsigned int) 22); /* line 4788 */
} /* line 4788 */
  sim_icache_fetch(2559 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPNE(reg_r0_7, reg_r0_7, 0); /* line 4790 */
   CMPNE(reg_b0_0, reg_r0_6, 0); /* line 4791 */
   ADD(reg_r0_4, reg_r0_6, (unsigned int) -897); /* line 4792 */
} /* line 4792 */
  sim_icache_fetch(2563 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   OR(reg_r0_7, reg_r0_7, reg_r0_8); /* line 4794 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_10); /* line 4795 */
   MOV(reg_r0_3, reg_r0_5); /* line 4796 */
} /* line 4796 */
  sim_icache_fetch(2566 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_7, reg_r0_7, reg_r0_9); /* line 4798 */
} /* line 4798 */
  sim_icache_fetch(2567 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_7); /* line 4800 */
   OR(reg_r0_2, reg_r0_7, (unsigned int) 1073741824); /* line 4801 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L150X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4802 */
  sim_icache_fetch(2571 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_2); /* line 4804 */
} /* line 4804 */
l_L151X3: ;/* line 4806 */
LABEL(l_L151X3);
  sim_icache_fetch(2572 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 4807 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4808 */
   ADD_CYCLES(1);
} /* line 4808 */
		 /* line 4809 */
  sim_icache_fetch(2574 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(roundAndPackFloat32);
   reg_l0_0 = (427 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) roundAndPackFloat32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 4811 */
l_lr_324: ;/* line 4811 */
LABEL(l_lr_324);
  sim_icache_fetch(2576 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 4813 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4814 */
   ADD_CYCLES(3);
} /* line 4814 */
  sim_icache_fetch(2578 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_d);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4817 */
l_L150X3: ;/* line 4820 */
LABEL(l_L150X3);
  sim_icache_fetch(2579 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, reg_r0_5); /* line 4821 */
   GOTO(l_L151X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L151X3;
} /* line 4822 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 418: goto l_lr_317;
    case 420: goto l_lr_319;
    case 421: goto l_L149X3;
    case 422: goto l_L148X3;
    case 423: goto l_L151X3;
    case 425: goto l_lr_324;
    case 426: goto l_L150X3;
    case 427:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

static sim_result_1_t addFloat64Sigs( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(addFloat64Sigs);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_r0_7 =  arg4; 
  reg_l0_0 = (462 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(2581 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 4842 */
   AND(reg_r0_2, reg_r0_3, (unsigned int) 1048575); /* line 4843 */
} /* line 4843 */
  sim_icache_fetch(2584 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_8, reg_r0_5, (unsigned int) 1048575); /* line 4845 */
   SHRU(reg_r0_9, reg_r0_3, (unsigned int) 20); /* line 4846 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 44),0,4), reg_l0_0); /* line 4847 */
} /* line 4847 */
  sim_icache_fetch(2588 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHRU(reg_r0_10, reg_r0_5, (unsigned int) 20); /* line 4849 */
   AND(reg_r0_9, reg_r0_9, (unsigned int) 2047); /* line 4850 */
   OR(reg_r0_11, reg_r0_4, reg_r0_2); /* line 4851 */
} /* line 4851 */
  sim_icache_fetch(2592 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_10, reg_r0_10, (unsigned int) 2047); /* line 4853 */
   CMPEQ(reg_b0_0, reg_r0_9, (unsigned int) 2047); /* line 4854 */
} /* line 4854 */
  sim_icache_fetch(2596 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_4); /* line 4856 */
   SUB(reg_r0_12, reg_r0_9, reg_r0_10); /* line 4857 */
   CMPNE(reg_b0_1, reg_r0_11, 0); /* line 4858 */
} /* line 4858 */
  sim_icache_fetch(2599 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_2); /* line 4860 */
   CMPGT(reg_b0_2, reg_r0_12, 0); /* line 4861 */
} /* line 4861 */
  sim_icache_fetch(2601 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_6); /* line 4863 */
} /* line 4863 */
  sim_icache_fetch(2602 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_8); /* line 4865 */
   if (!reg_b0_2) {    BRANCHF(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L152X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4866 */
  sim_icache_fetch(2604 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L153X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4868 */
  sim_icache_fetch(2605 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L154X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4870 */
		 /* line 4871 */
  sim_icache_fetch(2606 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat64NaN);
   reg_l0_0 = (462 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat64NaN;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 4873 */
l_lr_328: ;/* line 4873 */
LABEL(l_lr_328);
  sim_icache_fetch(2608 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 4875 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4876 */
   ADD_CYCLES(3);
} /* line 4876 */
  sim_icache_fetch(2610 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4879 */
l_L154X3: ;/* line 4882 */
LABEL(l_L154X3);
  sim_icache_fetch(2611 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 4883 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4884 */
   ADD_CYCLES(3);
} /* line 4884 */
  sim_icache_fetch(2613 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4887 */
l_L153X3: ;/* line 4890 */
LABEL(l_L153X3);
  sim_icache_fetch(2614 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_0, reg_r0_10, 0); /* line 4891 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 4892 */
   ADD(reg_r0_8, reg_r0_1, (unsigned int) 16); /* line 4893 */
   ADD(reg_r0_11, reg_r0_1, (unsigned int) 20); /* line 4894 */
} /* line 4894 */
  sim_icache_fetch(2618 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 4896 */
   MOV(reg_r0_14, 0); /* line 4897 */
   ADD(reg_r0_15, reg_r0_1, (unsigned int) 32); /* line 4898 */
   MOV(reg_r0_16, 0); /* line 4899 */
} /* line 4899 */
  sim_icache_fetch(2622 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_17, reg_r0_9); /* line 4901 */
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 4902 */
   MOV(reg_r0_3, reg_r0_7); /* line 4903 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L155X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4904 */
  sim_icache_fetch(2626 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_12, reg_r0_12, (unsigned int) -1); /* line 4906 */
   MOV(reg_r0_19, reg_r0_2); /* line 4907 */
   LDWs(reg_r0_18, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 4908 */
   ADD(reg_r0_20, reg_r0_17, (unsigned int) -1); /* line 4909 */
} /* line 4909 */
l_L156X3: ;/* line 4911 */
LABEL(l_L156X3);
  sim_icache_fetch(2630 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SUB(reg_r0_21, 0, reg_r0_12); /* line 4912 */
   CMPEQ(reg_b0_0, reg_r0_12, 0); /* line 4913 */
   MOV(reg_r0_22, reg_r0_13); /* line 4914 */
} /* line 4914 */
  sim_icache_fetch(2633 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   AND(reg_r0_21, reg_r0_21, (unsigned int) 31); /* line 4916 */
} /* line 4916 */
  sim_icache_fetch(2634 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_18, reg_r0_18, (unsigned int) 1048576); /* line 4918 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L157X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4919 */
l_L158X3: ;/* line 4921 */
LABEL(l_L158X3);
  sim_icache_fetch(2637 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_11,0,4), reg_r0_22); /* line 4922 */
} /* line 4922 */
  sim_icache_fetch(2638 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 4924 */
} /* line 4924 */
  sim_icache_fetch(2639 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_8,0,4), reg_r0_19); /* line 4926 */
} /* line 4926 */
  sim_icache_fetch(2640 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 4928 */
} /* line 4928 */
  sim_icache_fetch(2641 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_15,0,4), reg_r0_16); /* line 4930 */
   ADD(reg_r0_2, reg_r0_10, reg_r0_2); /* line 4931 */
} /* line 4931 */
l_L159X3: ;/* line 4933 */
LABEL(l_L159X3);
  sim_icache_fetch(2643 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLTU(reg_r0_10, reg_r0_2, reg_r0_10); /* line 4934 */
   LDWs(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4935 */
} /* line 4935 */
  sim_icache_fetch(2645 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_10, reg_r0_18, reg_r0_10); /* line 4937 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_2); /* line 4938 */
} /* line 4938 */
  sim_icache_fetch(2647 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_10, reg_r0_10, reg_r0_8); /* line 4940 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 4941 */
} /* line 4941 */
  sim_icache_fetch(2649 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_10); /* line 4943 */
   CMPLTU(reg_b0_0, reg_r0_10, (unsigned int) 2097152); /* line 4944 */
   CMPNE(reg_r0_11, reg_r0_11, 0); /* line 4945 */
} /* line 4945 */
  sim_icache_fetch(2653 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 4947 */
} /* line 4947 */
  sim_icache_fetch(2654 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_18); /* line 4949 */
   SHL(reg_r0_13, reg_r0_2, (unsigned int) 31); /* line 4950 */
   SHRU(reg_r0_10, reg_r0_2, (unsigned int) 1); /* line 4951 */
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L160X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 4952 */
  sim_icache_fetch(2658 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_4, reg_r0_17); /* line 4954 */
   OR(reg_r0_13, reg_r0_13, reg_r0_11); /* line 4955 */
} /* line 4955 */
l_L161X3: ;/* line 4957 */
LABEL(l_L161X3);
  sim_icache_fetch(2660 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_13); /* line 4958 */
   SHL(reg_r0_11, reg_r0_8, (unsigned int) 31); /* line 4959 */
   SHRU(reg_r0_2, reg_r0_8, (unsigned int) 1); /* line 4960 */
} /* line 4960 */
  sim_icache_fetch(2663 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_11, reg_r0_11, reg_r0_10); /* line 4962 */
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4963 */
} /* line 4963 */
  sim_icache_fetch(2665 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_2); /* line 4965 */
} /* line 4965 */
  sim_icache_fetch(2666 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 4967 */
} /* line 4967 */
  sim_icache_fetch(2667 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_11); /* line 4969 */
} /* line 4969 */
l_L162X3: ;/* line 4971 */
LABEL(l_L162X3);
  sim_icache_fetch(2668 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 4972 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 4973 */
   ADD_CYCLES(1);
} /* line 4973 */
		 /* line 4974 */
  sim_icache_fetch(2670 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(roundAndPackFloat64);
   reg_l0_0 = (462 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) roundAndPackFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 4976 */
l_lr_337: ;/* line 4976 */
LABEL(l_lr_337);
  sim_icache_fetch(2672 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 4978 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 4979 */
   ADD_CYCLES(3);
} /* line 4979 */
  sim_icache_fetch(2674 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 4982 */
l_L160X3: ;/* line 4985 */
LABEL(l_L160X3);
  sim_icache_fetch(2675 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 4986 */
   MOV(reg_r0_3, reg_r0_7); /* line 4987 */
   MOV(reg_r0_4, reg_r0_20); /* line 4988 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 4989 */
   ADD_CYCLES(2);
} /* line 4989 */
  sim_icache_fetch(2679 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_7, reg_r0_2); /* line 4991 */
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 4992 */
} /* line 4992 */
  sim_icache_fetch(2681 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L162X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L162X3;
} /* line 4994 */
l_L157X3: ;/* line 4997 */
LABEL(l_L157X3);
  sim_icache_fetch(2682 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLT(reg_b0_0, reg_r0_12, (unsigned int) 32); /* line 4998 */
   SHL(reg_r0_4, reg_r0_13, reg_r0_21); /* line 4999 */
   SHRU(reg_r0_5, reg_r0_13, reg_r0_12); /* line 5000 */
   CMPNE(reg_r0_14, reg_r0_14, 0); /* line 5001 */
} /* line 5001 */
  sim_icache_fetch(2686 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_6, reg_r0_2, reg_r0_21); /* line 5003 */
   SHRU(reg_r0_19, reg_r0_2, reg_r0_12); /* line 5004 */
   OR(reg_r0_16, reg_r0_14, reg_r0_4); /* line 5005 */
   MOV(reg_r0_3, reg_r0_7); /* line 5006 */
} /* line 5006 */
  sim_icache_fetch(2690 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_22, reg_r0_5, reg_r0_6); /* line 5008 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L163X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5010 */
  sim_icache_fetch(2692 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L158X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L158X3;
} /* line 5012 */
l_L163X3: ;/* line 5015 */
LABEL(l_L163X3);
  sim_icache_fetch(2693 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPGE(reg_b0_1, reg_r0_12, (unsigned int) 64); /* line 5016 */
   CMPNE(reg_r0_4, reg_r0_2, 0); /* line 5017 */
   CMPEQ(reg_b0_0, reg_r0_12, (unsigned int) 64); /* line 5018 */
   SHL(reg_r0_21, reg_r0_2, reg_r0_21); /* line 5019 */
} /* line 5019 */
  sim_icache_fetch(2697 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_b0_0 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_0, reg_r0_12, (unsigned int) 32); /* line 5021 */
   SLCT(reg_r0_4, t__i32_0, reg_r0_2, reg_r0_4); /* line 5022 */
   AND(reg_r0_12, reg_r0_12, (unsigned int) 31); /* line 5023 */
   MOV(reg_r0_19, 0); /* line 5024 */
} /* line 5024 */
  sim_icache_fetch(2701 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_12, reg_r0_2, reg_r0_12); /* line 5026 */
   SLCT(reg_r0_4, reg_b0_1, reg_r0_4, reg_r0_21); /* line 5027 */
   SLCTF(reg_r0_14, reg_b0_0, reg_r0_13, 0); /* line 5028 */
   MOV(reg_r0_3, reg_r0_7); /* line 5029 */
} /* line 5029 */
  sim_icache_fetch(2705 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SLCTF(reg_r0_12, reg_b0_1, reg_r0_12, 0); /* line 5031 */
   SLCT(reg_r0_4, reg_b0_0, reg_r0_13, reg_r0_4); /* line 5032 */
   CMPNE(reg_r0_14, reg_r0_14, 0); /* line 5033 */
} /* line 5033 */
  sim_icache_fetch(2708 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SLCT(reg_r0_22, reg_b0_0, reg_r0_2, reg_r0_12); /* line 5035 */
   OR(reg_r0_16, reg_r0_14, reg_r0_4); /* line 5036 */
   GOTO(l_L158X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L158X3;
} /* line 5037 */
l_L155X3: ;/* line 5040 */
LABEL(l_L155X3);
  sim_icache_fetch(2711 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5041 */
   ADD(reg_r0_20, reg_r0_17, (unsigned int) -1); /* line 5042 */
   MOV(reg_r0_3, reg_r0_7); /* line 5043 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 5044 */
   ADD_CYCLES(2);
} /* line 5044 */
  sim_icache_fetch(2715 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_4, reg_r0_4, (unsigned int) 1048576); /* line 5046 */
} /* line 5046 */
  sim_icache_fetch(2717 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_4); /* line 5048 */
} /* line 5048 */
  sim_icache_fetch(2718 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5050 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 5051 */
   ADD_CYCLES(2);
} /* line 5051 */
  sim_icache_fetch(2720 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_19, reg_r0_2); /* line 5053 */
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5054 */
} /* line 5054 */
  sim_icache_fetch(2722 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_18, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5056 */
   GOTO(l_L156X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L156X3;
} /* line 5057 */
l_L152X3: ;/* line 5060 */
LABEL(l_L152X3);
  sim_icache_fetch(2724 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLT(reg_b0_0, reg_r0_12, 0); /* line 5061 */
   CMPEQ(reg_b0_1, reg_r0_10, (unsigned int) 2047); /* line 5062 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5063 */
} /* line 5063 */
  sim_icache_fetch(2728 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5065 */
} /* line 5065 */
  sim_icache_fetch(2729 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L164X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5067 */
  sim_icache_fetch(2730 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L165X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5069 */
  sim_icache_fetch(2731 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_8); /* line 5071 */
} /* line 5071 */
  sim_icache_fetch(2732 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 5073 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5074 */
   ADD_CYCLES(1);
} /* line 5074 */
  sim_icache_fetch(2734 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L166X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5076 */
		 /* line 5077 */
  sim_icache_fetch(2735 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat64NaN);
   reg_l0_0 = (462 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat64NaN;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5079 */
l_lr_344: ;/* line 5079 */
LABEL(l_lr_344);
  sim_icache_fetch(2737 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 5081 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5082 */
   ADD_CYCLES(3);
} /* line 5082 */
  sim_icache_fetch(2739 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5085 */
l_L166X3: ;/* line 5088 */
LABEL(l_L166X3);
  sim_icache_fetch(2740 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_5, 0); /* line 5089 */
   MOV(reg_r0_6, 0); /* line 5090 */
   MOV(reg_r0_3, reg_r0_7); /* line 5091 */
} /* line 5091 */
		 /* line 5092 */
  sim_icache_fetch(2743 + t_thisfile.offset, 4);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_4, (unsigned int) 2047); /* line 5095 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (462 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5095 */
l_lr_347: ;/* line 5095 */
LABEL(l_lr_347);
  sim_icache_fetch(2747 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 5097 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5098 */
   ADD_CYCLES(3);
} /* line 5098 */
  sim_icache_fetch(2749 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5101 */
l_L165X3: ;/* line 5104 */
LABEL(l_L165X3);
  sim_icache_fetch(2750 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_0, reg_r0_9, 0); /* line 5105 */
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5106 */
   ADD(reg_r0_5, reg_r0_1, (unsigned int) 24); /* line 5107 */
   ADD(reg_r0_6, reg_r0_1, (unsigned int) 28); /* line 5108 */
} /* line 5108 */
  sim_icache_fetch(2754 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5110 */
   ADD(reg_r0_11, reg_r0_1, (unsigned int) 32); /* line 5111 */
   MOV(reg_r0_13, 0); /* line 5112 */
   MOV(reg_r0_17, reg_r0_10); /* line 5113 */
} /* line 5113 */
  sim_icache_fetch(2758 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDWs(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5115 */
   ADD(reg_r0_20, reg_r0_17, (unsigned int) -1); /* line 5116 */
   MOV(reg_r0_3, reg_r0_7); /* line 5117 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L167X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5118 */
  sim_icache_fetch(2762 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_12, reg_r0_12, (unsigned int) 1); /* line 5120 */
   MOV(reg_r0_14, reg_r0_4); /* line 5121 */
} /* line 5121 */
l_L168X3: ;/* line 5123 */
LABEL(l_L168X3);
  sim_icache_fetch(2764 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SUB(reg_r0_12, 0, reg_r0_12); /* line 5124 */
   MOV(reg_r0_15, reg_r0_8); /* line 5125 */
} /* line 5125 */
  sim_icache_fetch(2766 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SUB(reg_r0_16, 0, reg_r0_12); /* line 5127 */
   CMPEQ(reg_b0_0, reg_r0_12, 0); /* line 5128 */
} /* line 5128 */
  sim_icache_fetch(2768 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   AND(reg_r0_16, reg_r0_16, (unsigned int) 31); /* line 5130 */
} /* line 5130 */
  sim_icache_fetch(2769 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L169X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5132 */
l_L170X3: ;/* line 5134 */
LABEL(l_L170X3);
  sim_icache_fetch(2770 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_11,0,4), reg_r0_13); /* line 5135 */
} /* line 5135 */
  sim_icache_fetch(2771 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_15); /* line 5137 */
} /* line 5137 */
  sim_icache_fetch(2772 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5139 */
} /* line 5139 */
  sim_icache_fetch(2773 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_14); /* line 5141 */
} /* line 5141 */
  sim_icache_fetch(2774 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5143 */
} /* line 5143 */
  sim_icache_fetch(2775 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_2, reg_r0_10, reg_r0_9); /* line 5145 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5146 */
   ADD_CYCLES(1);
} /* line 5146 */
  sim_icache_fetch(2777 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_18, reg_r0_4, (unsigned int) 1048576); /* line 5148 */
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5149 */
} /* line 5149 */
  sim_icache_fetch(2780 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L159X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L159X3;
} /* line 5151 */
l_L169X3: ;/* line 5154 */
LABEL(l_L169X3);
  sim_icache_fetch(2781 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_10, reg_r0_4, reg_r0_16); /* line 5155 */
   CMPNE(reg_r0_2, reg_r0_4, 0); /* line 5156 */
   CMPGE(reg_b0_1, reg_r0_12, (unsigned int) 64); /* line 5157 */
   CMPEQ(reg_b0_0, reg_r0_12, (unsigned int) 64); /* line 5158 */
} /* line 5158 */
  sim_icache_fetch(2785 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_b0_0 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPGE(reg_b0_2, reg_r0_12, (unsigned int) 32); /* line 5160 */
   CMPEQ(reg_b0_0, reg_r0_12, (unsigned int) 32); /* line 5161 */
   SHL(reg_r0_16, reg_r0_8, reg_r0_16); /* line 5162 */
   SLCT(reg_r0_2, t__i32_0, reg_r0_4, reg_r0_2); /* line 5163 */
} /* line 5163 */
  sim_icache_fetch(2789 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_21, reg_r0_8, reg_r0_12); /* line 5165 */
   AND(reg_r0_19, reg_r0_12, (unsigned int) 31); /* line 5166 */
   SLCT(reg_r0_2, reg_b0_1, reg_r0_2, reg_r0_10); /* line 5167 */
   SLCTF(reg_r0_18, reg_b0_0, reg_r0_8, 0); /* line 5168 */
} /* line 5168 */
  sim_icache_fetch(2793 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   OR(reg_r0_21, reg_r0_21, reg_r0_10); /* line 5170 */
   SHRU(reg_r0_19, reg_r0_4, reg_r0_19); /* line 5171 */
   SLCT(reg_r0_8, reg_b0_0, reg_r0_8, reg_r0_2); /* line 5172 */
   SLCT(reg_r0_18, reg_b0_2, reg_r0_18, 0); /* line 5173 */
} /* line 5173 */
  sim_icache_fetch(2797 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_12, reg_r0_4, reg_r0_12); /* line 5175 */
   SLCT(reg_r0_8, reg_b0_2, reg_r0_8, reg_r0_16); /* line 5176 */
   SLCTF(reg_r0_19, reg_b0_1, reg_r0_19, 0); /* line 5177 */
   CMPNE(reg_r0_18, reg_r0_18, 0); /* line 5178 */
} /* line 5178 */
  sim_icache_fetch(2801 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SLCT(reg_r0_4, reg_b0_0, reg_r0_4, reg_r0_19); /* line 5180 */
   SLCTF(reg_r0_14, reg_b0_2, reg_r0_12, 0); /* line 5181 */
   OR(reg_r0_13, reg_r0_8, reg_r0_18); /* line 5182 */
   MOV(reg_r0_3, reg_r0_7); /* line 5183 */
} /* line 5183 */
  sim_icache_fetch(2805 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_15, reg_b0_2, reg_r0_4, reg_r0_21); /* line 5185 */
   GOTO(l_L170X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L170X3;
} /* line 5186 */
l_L167X3: ;/* line 5189 */
LABEL(l_L167X3);
  sim_icache_fetch(2807 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5190 */
   MOV(reg_r0_3, reg_r0_7); /* line 5191 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 5192 */
   ADD_CYCLES(2);
} /* line 5192 */
  sim_icache_fetch(2810 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, (unsigned int) 1048576); /* line 5194 */
} /* line 5194 */
  sim_icache_fetch(2812 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_2); /* line 5196 */
} /* line 5196 */
  sim_icache_fetch(2813 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5198 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 5199 */
   ADD_CYCLES(2);
} /* line 5199 */
  sim_icache_fetch(2815 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_14, reg_r0_4); /* line 5201 */
   LDWs(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5202 */
} /* line 5202 */
  sim_icache_fetch(2817 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L168X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L168X3;
} /* line 5204 */
l_L164X3: ;/* line 5207 */
LABEL(l_L164X3);
  sim_icache_fetch(2818 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_0, reg_r0_9, (unsigned int) 2047); /* line 5208 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5209 */
} /* line 5209 */
  sim_icache_fetch(2821 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5211 */
} /* line 5211 */
  sim_icache_fetch(2822 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5213 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L171X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5214 */
  sim_icache_fetch(2824 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5216 */
} /* line 5216 */
  sim_icache_fetch(2825 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_8); /* line 5218 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5219 */
   ADD_CYCLES(1);
} /* line 5219 */
  sim_icache_fetch(2827 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_10, reg_r0_10, reg_r0_11); /* line 5221 */
} /* line 5221 */
  sim_icache_fetch(2828 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_10); /* line 5223 */
} /* line 5223 */
  sim_icache_fetch(2829 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 5225 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5226 */
   ADD_CYCLES(1);
} /* line 5226 */
  sim_icache_fetch(2831 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L172X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5228 */
		 /* line 5229 */
  sim_icache_fetch(2832 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat64NaN);
   reg_l0_0 = (462 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat64NaN;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5231 */
l_lr_355: ;/* line 5231 */
LABEL(l_lr_355);
  sim_icache_fetch(2834 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 5233 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5234 */
   ADD_CYCLES(3);
} /* line 5234 */
  sim_icache_fetch(2836 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5237 */
l_L172X3: ;/* line 5240 */
LABEL(l_L172X3);
  sim_icache_fetch(2837 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 5241 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5242 */
   ADD_CYCLES(3);
} /* line 5242 */
  sim_icache_fetch(2839 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5245 */
l_L171X3: ;/* line 5248 */
LABEL(l_L171X3);
  sim_icache_fetch(2840 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5249 */
   CMPEQ(reg_b0_0, reg_r0_9, 0); /* line 5250 */
   MOV(reg_r0_3, reg_r0_7); /* line 5251 */
   MOV(reg_r0_4, 0); /* line 5252 */
} /* line 5252 */
  sim_icache_fetch(2844 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5254 */
} /* line 5254 */
  sim_icache_fetch(2845 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5256 */
} /* line 5256 */
  sim_icache_fetch(2846 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5258 */
} /* line 5258 */
  sim_icache_fetch(2847 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_6, reg_r0_2, reg_r0_8); /* line 5260 */
} /* line 5260 */
  sim_icache_fetch(2848 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLTU(reg_r0_2, reg_r0_6, reg_r0_2); /* line 5262 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_6); /* line 5263 */
} /* line 5263 */
  sim_icache_fetch(2850 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_10, reg_r0_10, reg_r0_2); /* line 5265 */
} /* line 5265 */
  sim_icache_fetch(2851 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_5, reg_r0_10, reg_r0_11); /* line 5267 */
} /* line 5267 */
  sim_icache_fetch(2852 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_5); /* line 5269 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L173X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5270 */
		 /* line 5271 */
  sim_icache_fetch(2854 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (462 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5273 */
l_lr_359: ;/* line 5273 */
LABEL(l_lr_359);
  sim_icache_fetch(2856 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 5275 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5276 */
   ADD_CYCLES(3);
} /* line 5276 */
  sim_icache_fetch(2858 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(addFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5279 */
l_L173X3: ;/* line 5282 */
LABEL(l_L173X3);
  sim_icache_fetch(2859 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 5283 */
   MOV(reg_r0_4, reg_r0_9); /* line 5284 */
   MOV(reg_r0_3, reg_r0_7); /* line 5285 */
} /* line 5285 */
  sim_icache_fetch(2862 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 5287 */
} /* line 5287 */
  sim_icache_fetch(2863 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), 0); /* line 5289 */
} /* line 5289 */
  sim_icache_fetch(2864 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_2, reg_r0_2, (unsigned int) 2097152); /* line 5291 */
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 5292 */
} /* line 5292 */
  sim_icache_fetch(2867 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_2); /* line 5294 */
   SHL(reg_r0_6, reg_r0_5, (unsigned int) 31); /* line 5295 */
   SHRU(reg_r0_10, reg_r0_5, (unsigned int) 1); /* line 5296 */
} /* line 5296 */
  sim_icache_fetch(2870 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 5298 */
} /* line 5298 */
  sim_icache_fetch(2871 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_r0_11, reg_r0_11, 0); /* line 5300 */
} /* line 5300 */
  sim_icache_fetch(2872 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_13, reg_r0_6, reg_r0_11); /* line 5302 */
   GOTO(l_L161X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L161X3;
} /* line 5303 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 429: goto l_lr_328;
    case 430: goto l_L154X3;
    case 431: goto l_L153X3;
    case 432: goto l_L156X3;
    case 433: goto l_L158X3;
    case 434: goto l_L159X3;
    case 435: goto l_L161X3;
    case 436: goto l_L162X3;
    case 438: goto l_lr_337;
    case 439: goto l_L160X3;
    case 440: goto l_L157X3;
    case 441: goto l_L163X3;
    case 442: goto l_L155X3;
    case 443: goto l_L152X3;
    case 445: goto l_lr_344;
    case 446: goto l_L166X3;
    case 448: goto l_lr_347;
    case 449: goto l_L165X3;
    case 450: goto l_L168X3;
    case 451: goto l_L170X3;
    case 452: goto l_L169X3;
    case 453: goto l_L167X3;
    case 454: goto l_L164X3;
    case 456: goto l_lr_355;
    case 457: goto l_L172X3;
    case 458: goto l_L171X3;
    case 460: goto l_lr_359;
    case 461: goto l_L173X3;
    case 462:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

static sim_result_1_t subFloat64Sigs( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(subFloat64Sigs);
  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_r0_7 =  arg4; 
  reg_l0_0 = (500 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(2874 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 5327 */
   AND(reg_r0_2, reg_r0_3, (unsigned int) 1048575); /* line 5328 */
} /* line 5328 */
  sim_icache_fetch(2877 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_2, reg_r0_2, (unsigned int) 10); /* line 5330 */
   SHRU(reg_r0_8, reg_r0_4, (unsigned int) 22); /* line 5331 */
   SHRU(reg_r0_9, reg_r0_6, (unsigned int) 22); /* line 5332 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_l0_0); /* line 5333 */
} /* line 5333 */
  sim_icache_fetch(2881 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_8 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_8, reg_r0_5, (unsigned int) 1048575); /* line 5335 */
   SHL(reg_r0_10, reg_r0_4, (unsigned int) 10); /* line 5336 */
   OR(reg_r0_2, reg_r0_2, t__i32_0); /* line 5337 */
} /* line 5337 */
  sim_icache_fetch(2885 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_12, reg_r0_3, (unsigned int) 20); /* line 5339 */
   SHRU(reg_r0_13, reg_r0_5, (unsigned int) 20); /* line 5340 */
   SHL(reg_r0_8, reg_r0_8, (unsigned int) 10); /* line 5341 */
   SHL(reg_r0_11, reg_r0_6, (unsigned int) 10); /* line 5342 */
} /* line 5342 */
  sim_icache_fetch(2889 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_12, reg_r0_12, (unsigned int) 2047); /* line 5344 */
   OR(reg_r0_8, reg_r0_8, reg_r0_9); /* line 5345 */
   OR(reg_r0_9, reg_r0_10, reg_r0_2); /* line 5346 */
} /* line 5346 */
  sim_icache_fetch(2893 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_13, reg_r0_13, (unsigned int) 2047); /* line 5348 */
   CMPEQ(reg_b0_0, reg_r0_12, (unsigned int) 2047); /* line 5349 */
} /* line 5349 */
  sim_icache_fetch(2897 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SUB(reg_r0_14, reg_r0_12, reg_r0_13); /* line 5351 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_2); /* line 5352 */
   CMPNE(reg_b0_1, reg_r0_9, 0); /* line 5353 */
} /* line 5353 */
  sim_icache_fetch(2900 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_8); /* line 5355 */
   CMPGT(reg_b0_2, reg_r0_14, 0); /* line 5356 */
} /* line 5356 */
  sim_icache_fetch(2902 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_10); /* line 5358 */
} /* line 5358 */
  sim_icache_fetch(2903 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_11); /* line 5360 */
   if (!reg_b0_2) {    BRANCHF(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L174X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5361 */
  sim_icache_fetch(2905 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L175X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5363 */
  sim_icache_fetch(2906 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L176X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5365 */
		 /* line 5366 */
  sim_icache_fetch(2907 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat64NaN);
   reg_l0_0 = (500 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat64NaN;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5368 */
l_lr_363: ;/* line 5368 */
LABEL(l_lr_363);
  sim_icache_fetch(2909 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 5370 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5371 */
   ADD_CYCLES(3);
} /* line 5371 */
  sim_icache_fetch(2911 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5374 */
l_L176X3: ;/* line 5377 */
LABEL(l_L176X3);
  sim_icache_fetch(2912 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 5378 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5379 */
   ADD_CYCLES(3);
} /* line 5379 */
  sim_icache_fetch(2914 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5382 */
l_L175X3: ;/* line 5385 */
LABEL(l_L175X3);
  sim_icache_fetch(2915 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_0, reg_r0_13, 0); /* line 5386 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5387 */
   ADD(reg_r0_8, reg_r0_1, (unsigned int) 16); /* line 5388 */
   ADD(reg_r0_9, reg_r0_1, (unsigned int) 24); /* line 5389 */
} /* line 5389 */
  sim_icache_fetch(2919 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5391 */
   MOV(reg_r0_11, reg_r0_12); /* line 5392 */
   MOV(reg_r0_3, reg_r0_7); /* line 5393 */
} /* line 5393 */
  sim_icache_fetch(2922 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5395 */
   ADD(reg_r0_4, reg_r0_11, (unsigned int) -11); /* line 5396 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L177X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5397 */
  sim_icache_fetch(2925 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_14, reg_r0_14, (unsigned int) -1); /* line 5399 */
   MOV(reg_r0_11, reg_r0_2); /* line 5400 */
   LDWs(reg_r0_15, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5401 */
} /* line 5401 */
l_L178X3: ;/* line 5403 */
LABEL(l_L178X3);
  sim_icache_fetch(2928 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SUB(reg_r0_16, 0, reg_r0_14); /* line 5404 */
   CMPEQ(reg_b0_0, reg_r0_14, 0); /* line 5405 */
   MOV(reg_r0_17, reg_r0_10); /* line 5406 */
} /* line 5406 */
  sim_icache_fetch(2931 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_16, reg_r0_16, (unsigned int) 31); /* line 5408 */
   OR(reg_r0_13, reg_r0_13, (unsigned int) 1073741824); /* line 5409 */
} /* line 5409 */
  sim_icache_fetch(2934 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L179X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5411 */
l_L180X3: ;/* line 5413 */
LABEL(l_L180X3);
  sim_icache_fetch(2935 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_13); /* line 5414 */
} /* line 5414 */
  sim_icache_fetch(2936 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5416 */
} /* line 5416 */
  sim_icache_fetch(2937 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_8,0,4), reg_r0_11); /* line 5418 */
} /* line 5418 */
  sim_icache_fetch(2938 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5420 */
} /* line 5420 */
  sim_icache_fetch(2939 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_9,0,4), reg_r0_17); /* line 5422 */
} /* line 5422 */
l_L181X3: ;/* line 5424 */
LABEL(l_L181X3);
  sim_icache_fetch(2940 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5425 */
} /* line 5425 */
  sim_icache_fetch(2941 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SUB(reg_r0_2, reg_r0_2, reg_r0_8); /* line 5427 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5428 */
   ADD_CYCLES(1);
} /* line 5428 */
  sim_icache_fetch(2943 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SUB(reg_r0_10, reg_r0_15, reg_r0_9); /* line 5430 */
   CMPLTU(reg_r0_8, reg_r0_15, reg_r0_9); /* line 5431 */
} /* line 5431 */
  sim_icache_fetch(2945 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_10); /* line 5433 */
   SUB(reg_r0_2, reg_r0_2, reg_r0_8); /* line 5434 */
} /* line 5434 */
  sim_icache_fetch(2947 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 5436 */
} /* line 5436 */
  sim_icache_fetch(2948 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_2); /* line 5438 */
} /* line 5438 */
l_L182X3: ;/* line 5440 */
LABEL(l_L182X3);
  sim_icache_fetch(2949 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 5441 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5442 */
   ADD_CYCLES(1);
} /* line 5442 */
		 /* line 5443 */
  sim_icache_fetch(2951 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(normalizeRoundAndPackFloat64);
   reg_l0_0 = (500 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) normalizeRoundAndPackFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5445 */
l_lr_371: ;/* line 5445 */
LABEL(l_lr_371);
  sim_icache_fetch(2953 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 5447 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5448 */
   ADD_CYCLES(3);
} /* line 5448 */
  sim_icache_fetch(2955 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5451 */
l_L179X3: ;/* line 5454 */
LABEL(l_L179X3);
  sim_icache_fetch(2956 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_5, reg_r0_2, reg_r0_16); /* line 5455 */
   OR(reg_r0_12, reg_r0_10, reg_r0_2); /* line 5456 */
   CMPGE(reg_b0_0, reg_r0_14, (unsigned int) 64); /* line 5457 */
   AND(reg_r0_6, reg_r0_14, (unsigned int) 31); /* line 5458 */
} /* line 5458 */
  sim_icache_fetch(2960 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPNE(reg_r0_19, reg_r0_10, 0); /* line 5460 */
   OR(reg_r0_18, reg_r0_10, reg_r0_5); /* line 5461 */
   CMPNE(reg_r0_12, reg_r0_12, 0); /* line 5462 */
   SHRU(reg_r0_6, reg_r0_2, reg_r0_6); /* line 5463 */
} /* line 5463 */
  sim_icache_fetch(2964 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_1, reg_r0_14, (unsigned int) 32); /* line 5465 */
   SHRU(reg_r0_20, reg_r0_10, reg_r0_14); /* line 5466 */
   CMPNE(reg_r0_18, reg_r0_18, 0); /* line 5467 */
   OR(reg_r0_19, reg_r0_19, reg_r0_2); /* line 5468 */
} /* line 5468 */
  sim_icache_fetch(2968 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPGE(reg_b0_2, reg_r0_14, (unsigned int) 32); /* line 5470 */
   SHL(reg_r0_10, reg_r0_10, reg_r0_16); /* line 5471 */
   OR(reg_r0_20, reg_r0_20, reg_r0_5); /* line 5472 */
   OR(reg_r0_18, reg_r0_18, reg_r0_6); /* line 5473 */
} /* line 5473 */
  sim_icache_fetch(2972 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPNE(reg_r0_10, reg_r0_10, 0); /* line 5475 */
   SHRU(reg_r0_2, reg_r0_2, reg_r0_14); /* line 5476 */
   SLCT(reg_r0_12, reg_b0_0, reg_r0_12, reg_r0_18); /* line 5477 */
   MOV(reg_r0_3, reg_r0_7); /* line 5478 */
} /* line 5478 */
  sim_icache_fetch(2976 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   OR(reg_r0_20, reg_r0_20, reg_r0_10); /* line 5480 */
   SLCT(reg_r0_19, reg_b0_1, reg_r0_19, reg_r0_12); /* line 5481 */
   SLCTF(reg_r0_11, reg_b0_2, reg_r0_2, 0); /* line 5482 */
} /* line 5482 */
  sim_icache_fetch(2979 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_17, reg_b0_2, reg_r0_19, reg_r0_20); /* line 5484 */
   GOTO(l_L180X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L180X3;
} /* line 5485 */
l_L177X3: ;/* line 5488 */
LABEL(l_L177X3);
  sim_icache_fetch(2981 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5489 */
   MOV(reg_r0_3, reg_r0_7); /* line 5490 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 5491 */
   ADD_CYCLES(2);
} /* line 5491 */
  sim_icache_fetch(2984 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_5, reg_r0_5, (unsigned int) 1073741824); /* line 5493 */
} /* line 5493 */
  sim_icache_fetch(2986 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_5); /* line 5495 */
} /* line 5495 */
  sim_icache_fetch(2987 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5497 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 5498 */
   ADD_CYCLES(2);
} /* line 5498 */
  sim_icache_fetch(2989 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_11, reg_r0_2); /* line 5500 */
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5501 */
} /* line 5501 */
  sim_icache_fetch(2991 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_15, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5503 */
   GOTO(l_L178X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L178X3;
} /* line 5504 */
l_L174X3: ;/* line 5507 */
LABEL(l_L174X3);
  sim_icache_fetch(2993 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLT(reg_b0_0, reg_r0_14, 0); /* line 5508 */
   CMPEQ(reg_b0_1, reg_r0_13, (unsigned int) 2047); /* line 5509 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5510 */
} /* line 5510 */
  sim_icache_fetch(2997 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5512 */
} /* line 5512 */
  sim_icache_fetch(2998 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L183X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5514 */
  sim_icache_fetch(2999 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L184X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5516 */
  sim_icache_fetch(3000 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_8); /* line 5518 */
} /* line 5518 */
  sim_icache_fetch(3001 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 5520 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5521 */
   ADD_CYCLES(1);
} /* line 5521 */
  sim_icache_fetch(3003 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L185X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5523 */
		 /* line 5524 */
  sim_icache_fetch(3004 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat64NaN);
   reg_l0_0 = (500 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat64NaN;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5526 */
l_lr_376: ;/* line 5526 */
LABEL(l_lr_376);
  sim_icache_fetch(3006 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 5528 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5529 */
   ADD_CYCLES(3);
} /* line 5529 */
  sim_icache_fetch(3008 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5532 */
l_L185X3: ;/* line 5535 */
LABEL(l_L185X3);
  sim_icache_fetch(3009 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   XOR(reg_r0_3, reg_r0_7, (unsigned int) 1); /* line 5536 */
   MOV(reg_r0_5, 0); /* line 5537 */
   MOV(reg_r0_6, 0); /* line 5538 */
} /* line 5538 */
		 /* line 5539 */
  sim_icache_fetch(3012 + t_thisfile.offset, 4);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_4, (unsigned int) 2047); /* line 5542 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (500 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5542 */
l_lr_379: ;/* line 5542 */
LABEL(l_lr_379);
  sim_icache_fetch(3016 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 5544 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5545 */
   ADD_CYCLES(3);
} /* line 5545 */
  sim_icache_fetch(3018 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5548 */
l_L184X3: ;/* line 5551 */
LABEL(l_L184X3);
  sim_icache_fetch(3019 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_0, reg_r0_12, 0); /* line 5552 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5553 */
   ADD(reg_r0_5, reg_r0_1, (unsigned int) 20); /* line 5554 */
   ADD(reg_r0_6, reg_r0_1, (unsigned int) 28); /* line 5555 */
} /* line 5555 */
  sim_icache_fetch(3023 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5557 */
   MOV(reg_r0_11, reg_r0_13); /* line 5558 */
} /* line 5558 */
  sim_icache_fetch(3025 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDWs(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5560 */
   ADD(reg_r0_4, reg_r0_11, (unsigned int) -11); /* line 5561 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L186X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5562 */
  sim_icache_fetch(3028 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_14, reg_r0_14, (unsigned int) 1); /* line 5564 */
   MOV(reg_r0_10, reg_r0_2); /* line 5565 */
   LDWs(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5566 */
} /* line 5566 */
l_L187X3: ;/* line 5568 */
LABEL(l_L187X3);
  sim_icache_fetch(3031 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SUB(reg_r0_14, 0, reg_r0_14); /* line 5569 */
   MOV(reg_r0_12, reg_r0_8); /* line 5570 */
} /* line 5570 */
  sim_icache_fetch(3033 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SUB(reg_r0_15, 0, reg_r0_14); /* line 5572 */
   CMPEQ(reg_b0_0, reg_r0_14, 0); /* line 5573 */
   OR(reg_r0_9, reg_r0_9, (unsigned int) 1073741824); /* line 5574 */
} /* line 5574 */
  sim_icache_fetch(3037 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   AND(reg_r0_15, reg_r0_15, (unsigned int) 31); /* line 5576 */
} /* line 5576 */
  sim_icache_fetch(3038 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L188X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5578 */
l_L189X3: ;/* line 5580 */
LABEL(l_L189X3);
  sim_icache_fetch(3039 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_9); /* line 5581 */
   XOR(reg_r0_3, reg_r0_7, (unsigned int) 1); /* line 5582 */
} /* line 5582 */
  sim_icache_fetch(3041 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5584 */
} /* line 5584 */
  sim_icache_fetch(3042 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_10); /* line 5586 */
} /* line 5586 */
  sim_icache_fetch(3043 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5588 */
} /* line 5588 */
  sim_icache_fetch(3044 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_12); /* line 5590 */
} /* line 5590 */
l_L190X3: ;/* line 5592 */
LABEL(l_L190X3);
  sim_icache_fetch(3045 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5593 */
} /* line 5593 */
  sim_icache_fetch(3046 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   SUB(reg_r0_2, reg_r0_2, reg_r0_5); /* line 5595 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5596 */
   ADD_CYCLES(1);
} /* line 5596 */
  sim_icache_fetch(3048 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SUB(reg_r0_8, reg_r0_11, reg_r0_6); /* line 5598 */
   CMPLTU(reg_r0_5, reg_r0_11, reg_r0_6); /* line 5599 */
} /* line 5599 */
  sim_icache_fetch(3050 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_8); /* line 5601 */
   SUB(reg_r0_2, reg_r0_2, reg_r0_5); /* line 5602 */
} /* line 5602 */
  sim_icache_fetch(3052 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_2); /* line 5604 */
} /* line 5604 */
  sim_icache_fetch(3053 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 5606 */
} /* line 5606 */
  sim_icache_fetch(3054 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L182X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L182X3;
} /* line 5608 */
l_L188X3: ;/* line 5611 */
LABEL(l_L188X3);
  sim_icache_fetch(3055 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_3, reg_r0_2, reg_r0_15); /* line 5612 */
   OR(reg_r0_16, reg_r0_8, reg_r0_2); /* line 5613 */
   CMPGE(reg_b0_0, reg_r0_14, (unsigned int) 64); /* line 5614 */
   AND(reg_r0_13, reg_r0_14, (unsigned int) 31); /* line 5615 */
} /* line 5615 */
  sim_icache_fetch(3059 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPNE(reg_r0_18, reg_r0_8, 0); /* line 5617 */
   OR(reg_r0_17, reg_r0_8, reg_r0_3); /* line 5618 */
   CMPNE(reg_r0_16, reg_r0_16, 0); /* line 5619 */
   SHRU(reg_r0_13, reg_r0_2, reg_r0_13); /* line 5620 */
} /* line 5620 */
  sim_icache_fetch(3063 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPEQ(reg_b0_1, reg_r0_14, (unsigned int) 32); /* line 5622 */
   SHRU(reg_r0_19, reg_r0_8, reg_r0_14); /* line 5623 */
   CMPNE(reg_r0_17, reg_r0_17, 0); /* line 5624 */
   OR(reg_r0_18, reg_r0_18, reg_r0_2); /* line 5625 */
} /* line 5625 */
  sim_icache_fetch(3067 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPGE(reg_b0_2, reg_r0_14, (unsigned int) 32); /* line 5627 */
   SHL(reg_r0_8, reg_r0_8, reg_r0_15); /* line 5628 */
   OR(reg_r0_19, reg_r0_19, reg_r0_3); /* line 5629 */
   OR(reg_r0_17, reg_r0_17, reg_r0_13); /* line 5630 */
} /* line 5630 */
  sim_icache_fetch(3071 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPNE(reg_r0_8, reg_r0_8, 0); /* line 5632 */
   SHRU(reg_r0_2, reg_r0_2, reg_r0_14); /* line 5633 */
   SLCT(reg_r0_16, reg_b0_0, reg_r0_16, reg_r0_17); /* line 5634 */
} /* line 5634 */
  sim_icache_fetch(3074 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   OR(reg_r0_19, reg_r0_19, reg_r0_8); /* line 5636 */
   SLCT(reg_r0_18, reg_b0_1, reg_r0_18, reg_r0_16); /* line 5637 */
   SLCTF(reg_r0_10, reg_b0_2, reg_r0_2, 0); /* line 5638 */
} /* line 5638 */
  sim_icache_fetch(3077 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_12, reg_b0_2, reg_r0_18, reg_r0_19); /* line 5640 */
   GOTO(l_L189X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L189X3;
} /* line 5641 */
l_L186X3: ;/* line 5644 */
LABEL(l_L186X3);
  sim_icache_fetch(3079 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5645 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 5646 */
   ADD_CYCLES(2);
} /* line 5646 */
  sim_icache_fetch(3081 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_3, reg_r0_3, (unsigned int) 1073741824); /* line 5648 */
} /* line 5648 */
  sim_icache_fetch(3083 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_3); /* line 5650 */
} /* line 5650 */
  sim_icache_fetch(3084 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5652 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 5653 */
   ADD_CYCLES(2);
} /* line 5653 */
  sim_icache_fetch(3086 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_10, reg_r0_2); /* line 5655 */
   LDWs(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5656 */
} /* line 5656 */
  sim_icache_fetch(3088 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5658 */
   GOTO(l_L187X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L187X3;
} /* line 5659 */
l_L183X3: ;/* line 5662 */
LABEL(l_L183X3);
  sim_icache_fetch(3090 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_b0_0, reg_r0_12, (unsigned int) 2047); /* line 5663 */
   CMPNE(reg_b0_1, reg_r0_12, 0); /* line 5664 */
   CMPNE(reg_b0_2, reg_r0_12, 0); /* line 5665 */
} /* line 5665 */
  sim_icache_fetch(3094 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SLCT(reg_r0_13, reg_b0_1, reg_r0_13, (unsigned int) 1); /* line 5667 */
   SLCT(reg_r0_12, reg_b0_2, reg_r0_12, (unsigned int) 1); /* line 5668 */
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5669 */
   MOV(reg_r0_9, reg_r0_3); /* line 5670 */
} /* line 5670 */
  sim_icache_fetch(3098 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDWs(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5672 */
   MOV(reg_r0_11, reg_r0_12); /* line 5673 */
   MOV(reg_r0_3, reg_r0_7); /* line 5674 */
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L191X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5675 */
  sim_icache_fetch(3102 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5677 */
   ADD(reg_r0_4, reg_r0_11, (unsigned int) -11); /* line 5678 */
} /* line 5678 */
  sim_icache_fetch(3104 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_15, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5680 */
} /* line 5680 */
  sim_icache_fetch(3105 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLTU(reg_b0_0, reg_r0_8, reg_r0_10); /* line 5682 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5683 */
   ADD_CYCLES(1);
} /* line 5683 */
  sim_icache_fetch(3107 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L192X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5685 */
  sim_icache_fetch(3108 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5687 */
} /* line 5687 */
  sim_icache_fetch(3109 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L181X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L181X3;
} /* line 5689 */
l_L192X3: ;/* line 5692 */
LABEL(l_L192X3);
  sim_icache_fetch(3110 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLTU(reg_b0_0, reg_r0_10, reg_r0_8); /* line 5693 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5694 */
   MOV(reg_r0_5, reg_r0_13); /* line 5695 */
} /* line 5695 */
  sim_icache_fetch(3113 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5697 */
   ADD(reg_r0_4, reg_r0_5, (unsigned int) -11); /* line 5698 */
} /* line 5698 */
  sim_icache_fetch(3115 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L193X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5700 */
  sim_icache_fetch(3116 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   XOR(reg_r0_3, reg_r0_3, (unsigned int) 1); /* line 5702 */
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5703 */
} /* line 5703 */
  sim_icache_fetch(3118 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L190X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L190X3;
} /* line 5705 */
l_L193X3: ;/* line 5708 */
LABEL(l_L193X3);
  sim_icache_fetch(3119 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5710 */
} /* line 5710 */
  sim_icache_fetch(3120 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5712 */
   ADD(reg_r0_4, reg_r0_12, (unsigned int) -11); /* line 5713 */
} /* line 5713 */
  sim_icache_fetch(3122 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5715 */
} /* line 5715 */
  sim_icache_fetch(3123 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_15, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5717 */
} /* line 5717 */
  sim_icache_fetch(3124 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLTU(reg_b0_0, reg_r0_5, reg_r0_6); /* line 5719 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5720 */
   ADD_CYCLES(1);
} /* line 5720 */
  sim_icache_fetch(3126 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L194X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5722 */
  sim_icache_fetch(3127 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5724 */
} /* line 5724 */
  sim_icache_fetch(3128 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L181X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L181X3;
} /* line 5726 */
l_L194X3: ;/* line 5729 */
LABEL(l_L194X3);
  sim_icache_fetch(3129 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLTU(reg_b0_0, reg_r0_6, reg_r0_5); /* line 5730 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5732 */
   XOR(reg_r0_3, reg_r0_3, (unsigned int) 1); /* line 5733 */
} /* line 5733 */
  sim_icache_fetch(3132 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5735 */
   ADD(reg_r0_4, reg_r0_13, (unsigned int) -11); /* line 5736 */
} /* line 5736 */
  sim_icache_fetch(3134 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L195X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5738 */
  sim_icache_fetch(3135 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5740 */
} /* line 5740 */
  sim_icache_fetch(3136 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L190X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L190X3;
} /* line 5742 */
l_L195X3: ;/* line 5745 */
LABEL(l_L195X3);
  sim_icache_fetch(3137 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_2, mem_trace_ld((unsigned int) _X1PACKETX2,0,4)); /* line 5746 */
   MOV(reg_r0_4, 0); /* line 5747 */
   MOV(reg_r0_5, 0); /* line 5748 */
} /* line 5748 */
  sim_icache_fetch(3141 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_6, 0); /* line 5750 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5751 */
   ADD_CYCLES(1);
} /* line 5751 */
		 /* line 5752 */
  sim_icache_fetch(3143 + t_thisfile.offset, 3);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_3, reg_r0_2, (unsigned int) 1); /* line 5754 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (500 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5755 */
l_lr_392: ;/* line 5755 */
LABEL(l_lr_392);
  sim_icache_fetch(3146 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 5757 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5758 */
   ADD_CYCLES(3);
} /* line 5758 */
  sim_icache_fetch(3148 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5761 */
l_L191X3: ;/* line 5764 */
LABEL(l_L191X3);
  sim_icache_fetch(3149 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5765 */
   MOV(reg_r0_3, reg_r0_9); /* line 5766 */
} /* line 5766 */
  sim_icache_fetch(3151 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5768 */
} /* line 5768 */
  sim_icache_fetch(3152 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5770 */
} /* line 5770 */
  sim_icache_fetch(3153 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5772 */
} /* line 5772 */
  sim_icache_fetch(3154 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_7); /* line 5774 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5775 */
   ADD_CYCLES(1);
} /* line 5775 */
  sim_icache_fetch(3156 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_8, reg_r0_8, reg_r0_9); /* line 5777 */
} /* line 5777 */
  sim_icache_fetch(3157 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_8); /* line 5779 */
} /* line 5779 */
  sim_icache_fetch(3158 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 5781 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5782 */
   ADD_CYCLES(1);
} /* line 5782 */
  sim_icache_fetch(3160 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L196X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5784 */
		 /* line 5785 */
  sim_icache_fetch(3161 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat64NaN);
   reg_l0_0 = (500 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat64NaN;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5787 */
l_lr_395: ;/* line 5787 */
LABEL(l_lr_395);
  sim_icache_fetch(3163 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 5789 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5790 */
   ADD_CYCLES(3);
} /* line 5790 */
  sim_icache_fetch(3165 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5793 */
l_L196X3: ;/* line 5796 */
LABEL(l_L196X3);
		 /* line 5796 */
  sim_icache_fetch(3166 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, (unsigned int) 16); /* line 5799 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (500 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 5799 */
l_lr_398: ;/* line 5799 */
LABEL(l_lr_398);
  sim_icache_fetch(3169 + t_thisfile.offset, 5);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_4, (unsigned int) -1); /* line 5801 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 5802 */
   MOV(reg_r0_3, (unsigned int) 2147483647); /* line 5803 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5804 */
   ADD_CYCLES(3);
} /* line 5804 */
  sim_icache_fetch(3174 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(subFloat64Sigs);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5807 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 464: goto l_lr_363;
    case 465: goto l_L176X3;
    case 466: goto l_L175X3;
    case 467: goto l_L178X3;
    case 468: goto l_L180X3;
    case 469: goto l_L181X3;
    case 470: goto l_L182X3;
    case 472: goto l_lr_371;
    case 473: goto l_L179X3;
    case 474: goto l_L177X3;
    case 475: goto l_L174X3;
    case 477: goto l_lr_376;
    case 478: goto l_L185X3;
    case 480: goto l_lr_379;
    case 481: goto l_L184X3;
    case 482: goto l_L187X3;
    case 483: goto l_L189X3;
    case 484: goto l_L190X3;
    case 485: goto l_L188X3;
    case 486: goto l_L186X3;
    case 487: goto l_L183X3;
    case 488: goto l_L192X3;
    case 489: goto l_L193X3;
    case 490: goto l_L194X3;
    case 491: goto l_L195X3;
    case 493: goto l_lr_392;
    case 494: goto l_L191X3;
    case 496: goto l_lr_395;
    case 497: goto l_L196X3;
    case 499: goto l_lr_398;
    case 500:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern sim_result_1_t _d_add( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(_d_add);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (506 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(3175 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 5830 */
   SHRU(reg_r0_7, reg_r0_3, (unsigned int) 31); /* line 5831 */
   SHRU(reg_r0_2, reg_r0_5, (unsigned int) 31); /* line 5832 */
} /* line 5832 */
  sim_icache_fetch(3178 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_0, reg_r0_7, reg_r0_2); /* line 5834 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 5835 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5836 */
   ADD_CYCLES(1);
} /* line 5836 */
  sim_icache_fetch(3181 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L197X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5838 */
		 /* line 5839 */
  sim_icache_fetch(3182 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(addFloat64Sigs);
   reg_l0_0 = (506 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) addFloat64Sigs;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5841 */
l_lr_401: ;/* line 5841 */
LABEL(l_lr_401);
  sim_icache_fetch(3184 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5843 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5844 */
   ADD_CYCLES(3);
} /* line 5844 */
  sim_icache_fetch(3186 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_add);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5847 */
l_L197X3: ;/* line 5850 */
LABEL(l_L197X3);
		 /* line 5850 */
  sim_icache_fetch(3187 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(subFloat64Sigs);
   reg_l0_0 = (506 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) subFloat64Sigs;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5852 */
l_lr_404: ;/* line 5852 */
LABEL(l_lr_404);
  sim_icache_fetch(3189 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5854 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5855 */
   ADD_CYCLES(3);
} /* line 5855 */
  sim_icache_fetch(3191 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_add);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5858 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 502: goto l_lr_401;
    case 503: goto l_L197X3;
    case 505: goto l_lr_404;
    case 506:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern sim_result_1_t _d_sub( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(_d_sub);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (512 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(3192 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 5875 */
   SHRU(reg_r0_7, reg_r0_3, (unsigned int) 31); /* line 5876 */
   SHRU(reg_r0_2, reg_r0_5, (unsigned int) 31); /* line 5877 */
} /* line 5877 */
  sim_icache_fetch(3195 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_0, reg_r0_7, reg_r0_2); /* line 5879 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 5880 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 5881 */
   ADD_CYCLES(1);
} /* line 5881 */
  sim_icache_fetch(3198 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L198X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5883 */
		 /* line 5884 */
  sim_icache_fetch(3199 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(subFloat64Sigs);
   reg_l0_0 = (512 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) subFloat64Sigs;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5886 */
l_lr_407: ;/* line 5886 */
LABEL(l_lr_407);
  sim_icache_fetch(3201 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5888 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5889 */
   ADD_CYCLES(3);
} /* line 5889 */
  sim_icache_fetch(3203 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_sub);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5892 */
l_L198X3: ;/* line 5895 */
LABEL(l_L198X3);
		 /* line 5895 */
  sim_icache_fetch(3204 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(addFloat64Sigs);
   reg_l0_0 = (512 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) addFloat64Sigs;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 5897 */
l_lr_410: ;/* line 5897 */
LABEL(l_lr_410);
  sim_icache_fetch(3206 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5899 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 5900 */
   ADD_CYCLES(3);
} /* line 5900 */
  sim_icache_fetch(3208 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_sub);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 5903 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 508: goto l_lr_407;
    case 509: goto l_L198X3;
    case 511: goto l_lr_410;
    case 512:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern sim_result_1_t _d_mul( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(_d_mul);
  sim_check_stack(reg_r0_1, -96); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (548 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(3209 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -96); /* line 5920 */
   SHRU(reg_r0_2, reg_r0_3, (unsigned int) 20); /* line 5921 */
   SHRU(reg_r0_8, reg_r0_5, (unsigned int) 20); /* line 5922 */
} /* line 5922 */
  sim_icache_fetch(3212 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_2, reg_r0_2, (unsigned int) 2047); /* line 5924 */
   SHRU(reg_r0_9, reg_r0_3, (unsigned int) 31); /* line 5925 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 80),0,4), reg_l0_0); /* line 5926 */
} /* line 5926 */
  sim_icache_fetch(3216 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_10, reg_r0_3, (unsigned int) 1048575); /* line 5928 */
   AND(reg_r0_8, reg_r0_8, (unsigned int) 2047); /* line 5929 */
} /* line 5929 */
  sim_icache_fetch(3220 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_12, reg_r0_5, (unsigned int) 1048575); /* line 5931 */
   SHRU(reg_r0_11, reg_r0_5, (unsigned int) 31); /* line 5932 */
   CMPEQ(reg_b0_0, reg_r0_2, 0); /* line 5933 */
} /* line 5933 */
  sim_icache_fetch(3224 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_1, reg_r0_2, (unsigned int) 2047); /* line 5935 */
   CMPEQ(reg_b0_2, reg_r0_8, (unsigned int) 2047); /* line 5936 */
} /* line 5936 */
  sim_icache_fetch(3228 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_2); /* line 5938 */
   MOV(reg_r0_13, reg_r0_3); /* line 5939 */
} /* line 5939 */
  sim_icache_fetch(3230 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   XOR(reg_r0_3, reg_r0_9, reg_r0_11); /* line 5941 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 5942 */
} /* line 5942 */
  sim_icache_fetch(3232 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_8); /* line 5944 */
} /* line 5944 */
  sim_icache_fetch(3233 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5946 */
} /* line 5946 */
  sim_icache_fetch(3234 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 5948 */
} /* line 5948 */
  sim_icache_fetch(3235 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_4); /* line 5950 */
} /* line 5950 */
  sim_icache_fetch(3236 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_3, reg_r0_8, 0); /* line 5952 */
   LDWs(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 5953 */
} /* line 5953 */
  sim_icache_fetch(3238 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_10); /* line 5955 */
   ADD(reg_r0_9, reg_r0_9, (unsigned int) -1024); /* line 5956 */
} /* line 5956 */
  sim_icache_fetch(3241 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_9, reg_r0_9, reg_r0_2); /* line 5958 */
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 5959 */
} /* line 5959 */
  sim_icache_fetch(3243 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_6); /* line 5961 */
} /* line 5961 */
  sim_icache_fetch(3244 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 5963 */
} /* line 5963 */
  sim_icache_fetch(3245 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_12); /* line 5965 */
   OR(reg_r0_8, reg_r0_8, (unsigned int) 1048576); /* line 5966 */
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L199X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5967 */
  sim_icache_fetch(3249 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 5969 */
   if (reg_b0_2) {    BRANCH(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L200X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5970 */
  sim_icache_fetch(3251 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_13, reg_r0_2, (unsigned int) 12); /* line 5972 */
   SHRU(reg_r0_14, reg_r0_2, (unsigned int) 20); /* line 5973 */
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L201X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5974 */
l_L202X3: ;/* line 5976 */
LABEL(l_L202X3);
  sim_icache_fetch(3254 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MULLHU(reg_r0_2, reg_r0_13, reg_r0_11); /* line 5977 */
   MULLHU(reg_r0_10, reg_r0_11, reg_r0_13); /* line 5978 */
   if (reg_b0_3) {    BRANCH(reg_b0_3);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L203X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 5979 */
l_L204X3: ;/* line 5981 */
LABEL(l_L204X3);
  sim_icache_fetch(3257 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_8); /* line 5982 */
   SHL(reg_r0_12, reg_r0_12, (unsigned int) 12); /* line 5983 */
   MULLLU(reg_r0_15, reg_r0_11, reg_r0_13); /* line 5984 */
   MULHHU(reg_r0_16, reg_r0_11, reg_r0_13); /* line 5985 */
} /* line 5985 */
  sim_icache_fetch(3261 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   OR(reg_r0_12, reg_r0_12, reg_r0_14); /* line 5987 */
   ADD(reg_r0_10, reg_r0_2, reg_r0_10); /* line 5988 */
   MULLHU(reg_r0_17, reg_r0_8, reg_r0_13); /* line 5989 */
   MULLHU(reg_r0_18, reg_r0_13, reg_r0_8); /* line 5990 */
} /* line 5990 */
  sim_icache_fetch(3265 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MULLHU(reg_r0_20, reg_r0_12, reg_r0_11); /* line 5992 */
   SHRU(reg_r0_19, reg_r0_10, (unsigned int) 16); /* line 5993 */
   CMPLTU(reg_r0_2, reg_r0_10, reg_r0_2); /* line 5994 */
   SHL(reg_r0_14, reg_r0_10, (unsigned int) 16); /* line 5995 */
} /* line 5995 */
  sim_icache_fetch(3269 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_2, reg_r0_2, (unsigned int) 16); /* line 5997 */
   ADD(reg_r0_15, reg_r0_15, reg_r0_14); /* line 5998 */
   ADD(reg_r0_19, reg_r0_19, reg_r0_16); /* line 5999 */
   MULLHU(reg_r0_10, reg_r0_11, reg_r0_12); /* line 6000 */
} /* line 6000 */
  sim_icache_fetch(3273 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MULLLU(reg_r0_16, reg_r0_11, reg_r0_12); /* line 6002 */
   CMPLTU(reg_r0_14, reg_r0_15, reg_r0_14); /* line 6003 */
   MULHHU(reg_r0_21, reg_r0_11, reg_r0_12); /* line 6004 */
   ADD(reg_r0_17, reg_r0_17, reg_r0_18); /* line 6005 */
} /* line 6005 */
  sim_icache_fetch(3277 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_2, reg_r0_2, reg_r0_14); /* line 6007 */
   ADD(reg_r0_10, reg_r0_20, reg_r0_10); /* line 6008 */
   MULLHU(reg_r0_22, reg_r0_8, reg_r0_12); /* line 6009 */
   MULLHU(reg_r0_23, reg_r0_12, reg_r0_8); /* line 6010 */
} /* line 6010 */
  sim_icache_fetch(3281 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_19, reg_r0_19, reg_r0_2); /* line 6012 */
   SHRU(reg_r0_24, reg_r0_10, (unsigned int) 16); /* line 6013 */
   CMPLTU(reg_r0_20, reg_r0_10, reg_r0_20); /* line 6014 */
   SHL(reg_r0_14, reg_r0_10, (unsigned int) 16); /* line 6015 */
} /* line 6015 */
  sim_icache_fetch(3285 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_20, reg_r0_20, (unsigned int) 16); /* line 6017 */
   ADD(reg_r0_16, reg_r0_16, reg_r0_14); /* line 6018 */
   ADD(reg_r0_24, reg_r0_24, reg_r0_21); /* line 6019 */
   ADD(reg_r0_22, reg_r0_22, reg_r0_23); /* line 6020 */
} /* line 6020 */
  sim_icache_fetch(3289 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MULLLU(reg_r0_10, reg_r0_12, reg_r0_8); /* line 6022 */
   CMPLTU(reg_r0_14, reg_r0_16, reg_r0_14); /* line 6023 */
   ADD(reg_r0_19, reg_r0_19, reg_r0_16); /* line 6024 */
   SHL(reg_r0_2, reg_r0_22, (unsigned int) 16); /* line 6025 */
} /* line 6025 */
  sim_icache_fetch(3293 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MULLLU(reg_r0_25, reg_r0_13, reg_r0_8); /* line 6027 */
   CMPLTU(reg_r0_16, reg_r0_19, reg_r0_16); /* line 6028 */
   ADD(reg_r0_20, reg_r0_20, reg_r0_14); /* line 6029 */
   SHL(reg_r0_21, reg_r0_17, (unsigned int) 16); /* line 6030 */
} /* line 6030 */
  sim_icache_fetch(3297 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_24, reg_r0_24, reg_r0_20); /* line 6032 */
   ADD(reg_r0_10, reg_r0_10, reg_r0_2); /* line 6033 */
   SHRU(reg_r0_14, reg_r0_17, (unsigned int) 16); /* line 6034 */
   CMPLTU(reg_r0_18, reg_r0_17, reg_r0_18); /* line 6035 */
} /* line 6035 */
  sim_icache_fetch(3301 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_24, reg_r0_24, reg_r0_16); /* line 6037 */
   SHL(reg_r0_18, reg_r0_18, (unsigned int) 16); /* line 6038 */
   ADD(reg_r0_25, reg_r0_25, reg_r0_21); /* line 6039 */
   MULHHU(reg_r0_17, reg_r0_13, reg_r0_8); /* line 6040 */
} /* line 6040 */
  sim_icache_fetch(3305 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_2, reg_r0_10, reg_r0_2); /* line 6042 */
   ADD(reg_r0_24, reg_r0_10, reg_r0_24); /* line 6043 */
   CMPLTU(reg_r0_21, reg_r0_25, reg_r0_21); /* line 6044 */
   ADD(reg_r0_19, reg_r0_25, reg_r0_19); /* line 6045 */
} /* line 6045 */
  sim_icache_fetch(3309 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_10, reg_r0_24, reg_r0_10); /* line 6047 */
   CMPLTU(reg_r0_16, reg_r0_19, reg_r0_25); /* line 6048 */
   ADD(reg_r0_14, reg_r0_14, reg_r0_17); /* line 6049 */
   ADD(reg_r0_18, reg_r0_18, reg_r0_21); /* line 6050 */
} /* line 6050 */
  sim_icache_fetch(3313 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHRU(reg_r0_17, reg_r0_22, (unsigned int) 16); /* line 6052 */
   CMPLTU(reg_r0_23, reg_r0_22, reg_r0_23); /* line 6053 */
   MULHHU(reg_r0_20, reg_r0_12, reg_r0_8); /* line 6054 */
   ADD(reg_r0_14, reg_r0_14, reg_r0_18); /* line 6055 */
} /* line 6055 */
  sim_icache_fetch(3317 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPNE(reg_r0_18, reg_r0_15, 0); /* line 6057 */
   SHL(reg_r0_23, reg_r0_23, (unsigned int) 16); /* line 6058 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 68),0,4), reg_r0_19); /* line 6059 */
   ADD(reg_r0_14, reg_r0_14, reg_r0_16); /* line 6060 */
} /* line 6060 */
  sim_icache_fetch(3321 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_17, reg_r0_17, reg_r0_20); /* line 6062 */
   ADD(reg_r0_23, reg_r0_23, reg_r0_2); /* line 6063 */
   OR(reg_r0_19, reg_r0_19, reg_r0_18); /* line 6064 */
   ADD(reg_r0_16, reg_r0_24, reg_r0_14); /* line 6065 */
} /* line 6065 */
  sim_icache_fetch(3325 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_17, reg_r0_17, reg_r0_23); /* line 6067 */
   CMPLTU(reg_r0_24, reg_r0_16, reg_r0_24); /* line 6068 */
   ADD(reg_r0_11, reg_r0_11, reg_r0_16); /* line 6069 */
   CMPNE(reg_r0_2, reg_r0_19, 0); /* line 6070 */
} /* line 6070 */
  sim_icache_fetch(3329 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_17, reg_r0_17, reg_r0_10); /* line 6072 */
   CMPLTU(reg_r0_18, reg_r0_11, reg_r0_16); /* line 6073 */
   SHL(reg_r0_21, reg_r0_11, (unsigned int) 31); /* line 6074 */
   SHRU(reg_r0_20, reg_r0_11, (unsigned int) 1); /* line 6075 */
} /* line 6075 */
  sim_icache_fetch(3333 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_17, reg_r0_17, reg_r0_24); /* line 6077 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_11); /* line 6078 */
   ADD(reg_r0_8, reg_r0_8, reg_r0_18); /* line 6079 */
   OR(reg_r0_21, reg_r0_21, reg_r0_2); /* line 6080 */
} /* line 6080 */
  sim_icache_fetch(3337 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_8, reg_r0_8, reg_r0_17); /* line 6082 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 48),0,4), reg_r0_17); /* line 6083 */
} /* line 6083 */
  sim_icache_fetch(3339 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPGEU(reg_b0_0, reg_r0_8, (unsigned int) 2097152); /* line 6085 */
   SHL(reg_r0_10, reg_r0_8, (unsigned int) 31); /* line 6086 */
   SHRU(reg_r0_2, reg_r0_8, (unsigned int) 1); /* line 6087 */
} /* line 6087 */
  sim_icache_fetch(3343 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_8); /* line 6089 */
   OR(reg_r0_20, reg_r0_20, reg_r0_10); /* line 6090 */
} /* line 6090 */
  sim_icache_fetch(3345 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), reg_r0_16); /* line 6092 */
} /* line 6092 */
  sim_icache_fetch(3346 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 44),0,4), reg_r0_14); /* line 6094 */
} /* line 6094 */
  sim_icache_fetch(3347 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 64),0,4), reg_r0_19); /* line 6096 */
} /* line 6096 */
  sim_icache_fetch(3348 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 76),0,4), reg_r0_15); /* line 6098 */
} /* line 6098 */
  sim_icache_fetch(3349 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 72),0,4), reg_r0_15); /* line 6100 */
} /* line 6100 */
  sim_icache_fetch(3350 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_25); /* line 6102 */
} /* line 6102 */
  sim_icache_fetch(3351 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_13); /* line 6104 */
} /* line 6104 */
  sim_icache_fetch(3352 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_12); /* line 6106 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L205X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6107 */
  sim_icache_fetch(3354 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_2); /* line 6109 */
   ADD(reg_r0_4, reg_r0_9, (unsigned int) 1); /* line 6110 */
} /* line 6110 */
  sim_icache_fetch(3356 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 6112 */
} /* line 6112 */
  sim_icache_fetch(3357 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_20); /* line 6114 */
} /* line 6114 */
  sim_icache_fetch(3358 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 6116 */
} /* line 6116 */
  sim_icache_fetch(3359 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 64),0,4), reg_r0_21); /* line 6118 */
} /* line 6118 */
l_L206X3: ;/* line 6120 */
LABEL(l_L206X3);
  sim_icache_fetch(3360 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 64),0,4)); /* line 6121 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6122 */
   ADD_CYCLES(1);
} /* line 6122 */
		 /* line 6123 */
  sim_icache_fetch(3362 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(roundAndPackFloat64);
   reg_l0_0 = (548 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) roundAndPackFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 6125 */
l_lr_416: ;/* line 6125 */
LABEL(l_lr_416);
  sim_icache_fetch(3364 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 80),0,4)); /* line 6127 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 6128 */
   ADD_CYCLES(3);
} /* line 6128 */
  sim_icache_fetch(3366 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 6131 */
l_L205X3: ;/* line 6134 */
LABEL(l_L205X3);
  sim_icache_fetch(3367 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 6135 */
   MOV(reg_r0_4, reg_r0_9); /* line 6136 */
} /* line 6136 */
  sim_icache_fetch(3369 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 60),0,4)); /* line 6138 */
} /* line 6138 */
  sim_icache_fetch(3370 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L206X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L206X3;
} /* line 6140 */
l_L203X3: ;/* line 6143 */
LABEL(l_L203X3);
  sim_icache_fetch(3371 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 6144 */
   MOV(reg_r0_5, 0); /* line 6145 */
   MOV(reg_r0_6, 0); /* line 6146 */
   MOV(reg_r0_4, 0); /* line 6147 */
} /* line 6147 */
  sim_icache_fetch(3375 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 6149 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 6150 */
   ADD_CYCLES(2);
} /* line 6150 */
  sim_icache_fetch(3377 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_7, reg_r0_7, reg_r0_2); /* line 6152 */
} /* line 6152 */
  sim_icache_fetch(3378 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_0, reg_r0_7, 0); /* line 6154 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6155 */
   ADD_CYCLES(1);
} /* line 6155 */
  sim_icache_fetch(3380 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L207X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6157 */
		 /* line 6158 */
  sim_icache_fetch(3381 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (548 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 6160 */
l_lr_420: ;/* line 6160 */
LABEL(l_lr_420);
  sim_icache_fetch(3383 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 80),0,4)); /* line 6162 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 6163 */
   ADD_CYCLES(3);
} /* line 6163 */
  sim_icache_fetch(3385 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 6166 */
l_L207X3: ;/* line 6169 */
LABEL(l_L207X3);
  sim_icache_fetch(3386 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_6, reg_r0_1, (unsigned int) 20); /* line 6170 */
   ADD(reg_r0_7, reg_r0_1, (unsigned int) 24); /* line 6171 */
   ADD(reg_r0_5, reg_r0_1, (unsigned int) 16); /* line 6172 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 84),0,4), reg_r0_3); /* line 6173 */
} /* line 6173 */
  sim_icache_fetch(3390 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 6175 */
} /* line 6175 */
  sim_icache_fetch(3391 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 6177 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6178 */
   ADD_CYCLES(1);
} /* line 6178 */
		 /* line 6179 */
  sim_icache_fetch(3393 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(normalizeFloat64Subnormal);
   reg_l0_0 = (548 << 5);
   {
    typedef void t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) normalizeFloat64Subnormal;
    (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
   }
} /* line 6181 */
l_lr_423: ;/* line 6181 */
LABEL(l_lr_423);
  sim_icache_fetch(3395 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 6183 */
} /* line 6183 */
  sim_icache_fetch(3396 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 6185 */
} /* line 6185 */
  sim_icache_fetch(3397 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 6187 */
} /* line 6187 */
  sim_icache_fetch(3398 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_2, reg_r0_2, (unsigned int) -1024); /* line 6189 */
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 6190 */
} /* line 6190 */
  sim_icache_fetch(3401 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_9, reg_r0_2, reg_r0_4); /* line 6192 */
   LDW(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 6193 */
} /* line 6193 */
  sim_icache_fetch(3403 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_8, reg_r0_5, (unsigned int) 1048576); /* line 6195 */
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 6196 */
} /* line 6196 */
  sim_icache_fetch(3406 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_13, reg_r0_6, (unsigned int) 12); /* line 6198 */
   SHRU(reg_r0_14, reg_r0_6, (unsigned int) 20); /* line 6199 */
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 84),0,4)); /* line 6200 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6201 */
   ADD_CYCLES(1);
} /* line 6201 */
  sim_icache_fetch(3410 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MULLHU(reg_r0_2, reg_r0_13, reg_r0_11); /* line 6203 */
   MULLHU(reg_r0_10, reg_r0_11, reg_r0_13); /* line 6204 */
   GOTO(l_L204X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L204X3;
} /* line 6205 */
l_L201X3: ;/* line 6208 */
LABEL(l_L201X3);
  sim_icache_fetch(3413 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   OR(reg_r0_4, reg_r0_4, reg_r0_10); /* line 6209 */
   MOV(reg_r0_5, 0); /* line 6210 */
   MOV(reg_r0_6, 0); /* line 6211 */
} /* line 6211 */
  sim_icache_fetch(3416 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_0, reg_r0_4, 0); /* line 6213 */
   MOV(reg_r0_4, 0); /* line 6214 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6215 */
   ADD_CYCLES(1);
} /* line 6215 */
  sim_icache_fetch(3419 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L208X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6217 */
		 /* line 6218 */
  sim_icache_fetch(3420 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (548 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 6220 */
l_lr_426: ;/* line 6220 */
LABEL(l_lr_426);
  sim_icache_fetch(3422 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 80),0,4)); /* line 6222 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 6223 */
   ADD_CYCLES(3);
} /* line 6223 */
  sim_icache_fetch(3424 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 6226 */
l_L208X3: ;/* line 6229 */
LABEL(l_L208X3);
  sim_icache_fetch(3425 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_6, reg_r0_1, (unsigned int) 32); /* line 6230 */
   ADD(reg_r0_7, reg_r0_1, (unsigned int) 36); /* line 6231 */
   ADD(reg_r0_5, reg_r0_1, (unsigned int) 28); /* line 6232 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 84),0,4), reg_r0_3); /* line 6233 */
} /* line 6233 */
  sim_icache_fetch(3429 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 6235 */
} /* line 6235 */
  sim_icache_fetch(3430 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 6237 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6238 */
   ADD_CYCLES(1);
} /* line 6238 */
		 /* line 6239 */
  sim_icache_fetch(3432 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(normalizeFloat64Subnormal);
   reg_l0_0 = (548 << 5);
   {
    typedef void t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) normalizeFloat64Subnormal;
    (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
   }
} /* line 6241 */
l_lr_429: ;/* line 6241 */
LABEL(l_lr_429);
  sim_icache_fetch(3434 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 6243 */
} /* line 6243 */
  sim_icache_fetch(3435 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 6245 */
} /* line 6245 */
  sim_icache_fetch(3436 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 6247 */
} /* line 6247 */
  sim_icache_fetch(3437 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_2, reg_r0_2, (unsigned int) -1024); /* line 6249 */
   LDWs(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 6250 */
} /* line 6250 */
  sim_icache_fetch(3440 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_9, reg_r0_2, reg_r0_4); /* line 6252 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 6253 */
} /* line 6253 */
  sim_icache_fetch(3442 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_3, reg_r0_5, 0); /* line 6255 */
   LDWs(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 6256 */
} /* line 6256 */
  sim_icache_fetch(3444 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_8, reg_r0_6, (unsigned int) 1048576); /* line 6258 */
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 84),0,4)); /* line 6259 */
} /* line 6259 */
  sim_icache_fetch(3447 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_13, reg_r0_2, (unsigned int) 12); /* line 6261 */
   SHRU(reg_r0_14, reg_r0_2, (unsigned int) 20); /* line 6262 */
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 6263 */
} /* line 6263 */
  sim_icache_fetch(3450 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L202X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L202X3;
} /* line 6265 */
l_L200X3: ;/* line 6268 */
LABEL(l_L200X3);
  sim_icache_fetch(3451 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 6269 */
   MOV(reg_r0_3, reg_r0_13); /* line 6270 */
   MOV(reg_r0_7, t__i32_0); /* line 6271 */
} /* line 6271 */
  sim_icache_fetch(3454 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 6273 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 6274 */
   ADD_CYCLES(2);
} /* line 6274 */
  sim_icache_fetch(3456 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_8); /* line 6276 */
} /* line 6276 */
  sim_icache_fetch(3457 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 6278 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6279 */
   ADD_CYCLES(1);
} /* line 6279 */
  sim_icache_fetch(3459 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L209X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6281 */
		 /* line 6282 */
  sim_icache_fetch(3460 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat64NaN);
   reg_l0_0 = (548 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat64NaN;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 6284 */
l_lr_432: ;/* line 6284 */
LABEL(l_lr_432);
  sim_icache_fetch(3462 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 80),0,4)); /* line 6286 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 6287 */
   ADD_CYCLES(3);
} /* line 6287 */
  sim_icache_fetch(3464 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 6290 */
l_L209X3: ;/* line 6293 */
LABEL(l_L209X3);
  sim_icache_fetch(3465 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 6294 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 6295 */
} /* line 6295 */
  sim_icache_fetch(3467 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 6297 */
} /* line 6297 */
  sim_icache_fetch(3468 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 6299 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6300 */
   ADD_CYCLES(1);
} /* line 6300 */
  sim_icache_fetch(3470 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_4); /* line 6302 */
} /* line 6302 */
  sim_icache_fetch(3471 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_5); /* line 6304 */
} /* line 6304 */
  sim_icache_fetch(3472 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_0, reg_r0_2, 0); /* line 6306 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6307 */
   ADD_CYCLES(1);
} /* line 6307 */
  sim_icache_fetch(3474 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L211X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6310 */
  sim_icache_fetch(3475 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L210X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L210X3;
} /* line 6312 */
l_L211X3: ;/* line 6315 */
LABEL(l_L211X3);
  sim_icache_fetch(3476 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_5, 0); /* line 6316 */
   MOV(reg_r0_6, 0); /* line 6317 */
   MOV(reg_r0_3, reg_r0_7); /* line 6318 */
} /* line 6318 */
		 /* line 6319 */
  sim_icache_fetch(3479 + t_thisfile.offset, 4);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_4, (unsigned int) 2047); /* line 6322 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (548 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 6322 */
l_lr_436: ;/* line 6322 */
LABEL(l_lr_436);
  sim_icache_fetch(3483 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 80),0,4)); /* line 6324 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 6325 */
   ADD_CYCLES(3);
} /* line 6325 */
  sim_icache_fetch(3485 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 6328 */
l_L199X3: ;/* line 6331 */
LABEL(l_L199X3);
  sim_icache_fetch(3486 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 6332 */
   MOV(reg_r0_3, reg_r0_13); /* line 6333 */
   MOV(reg_r0_8, t__i32_0); /* line 6334 */
} /* line 6334 */
  sim_icache_fetch(3489 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 6336 */
} /* line 6336 */
  sim_icache_fetch(3490 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_9, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 6338 */
} /* line 6338 */
  sim_icache_fetch(3491 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_10, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 6340 */
   CMPEQ(reg_r0_7, reg_r0_7, (unsigned int) 2047); /* line 6341 */
} /* line 6341 */
  sim_icache_fetch(3494 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_11, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 6343 */
} /* line 6343 */
  sim_icache_fetch(3495 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_9); /* line 6345 */
} /* line 6345 */
  sim_icache_fetch(3496 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ANDL(reg_r0_7, reg_r0_7, reg_r0_2); /* line 6347 */
} /* line 6347 */
  sim_icache_fetch(3497 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_10, reg_r0_10, reg_r0_11); /* line 6349 */
} /* line 6349 */
  sim_icache_fetch(3498 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_b0_0, reg_r0_10, reg_r0_7); /* line 6351 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6352 */
   ADD_CYCLES(1);
} /* line 6352 */
  sim_icache_fetch(3500 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L212X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6354 */
		 /* line 6355 */
  sim_icache_fetch(3501 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat64NaN);
   reg_l0_0 = (548 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat64NaN;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 6357 */
l_lr_439: ;/* line 6357 */
LABEL(l_lr_439);
  sim_icache_fetch(3503 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 80),0,4)); /* line 6359 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 6360 */
   ADD_CYCLES(3);
} /* line 6360 */
  sim_icache_fetch(3505 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 6363 */
l_L212X3: ;/* line 6366 */
LABEL(l_L212X3);
  sim_icache_fetch(3506 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 6367 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 6368 */
} /* line 6368 */
  sim_icache_fetch(3508 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 6370 */
} /* line 6370 */
  sim_icache_fetch(3509 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 6372 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6373 */
   ADD_CYCLES(1);
} /* line 6373 */
  sim_icache_fetch(3511 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_5); /* line 6375 */
} /* line 6375 */
  sim_icache_fetch(3512 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_6); /* line 6377 */
} /* line 6377 */
  sim_icache_fetch(3513 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_0, reg_r0_2, 0); /* line 6379 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6380 */
   ADD_CYCLES(1);
} /* line 6380 */
  sim_icache_fetch(3515 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L213X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6382 */
l_L210X3: ;/* line 6384 */
LABEL(l_L210X3);
		 /* line 6384 */
  sim_icache_fetch(3516 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (548 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 6386 */
l_lr_443: ;/* line 6386 */
LABEL(l_lr_443);
  sim_icache_fetch(3518 + t_thisfile.offset, 5);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_4, (unsigned int) -1); /* line 6388 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 80),0,4)); /* line 6389 */
   MOV(reg_r0_3, (unsigned int) 2147483647); /* line 6390 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 6391 */
   ADD_CYCLES(3);
} /* line 6391 */
  sim_icache_fetch(3523 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 6394 */
l_L213X3: ;/* line 6397 */
LABEL(l_L213X3);
  sim_icache_fetch(3524 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_5, 0); /* line 6398 */
   MOV(reg_r0_6, 0); /* line 6399 */
   MOV(reg_r0_3, reg_r0_8); /* line 6400 */
} /* line 6400 */
		 /* line 6401 */
  sim_icache_fetch(3527 + t_thisfile.offset, 4);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_4, (unsigned int) 2047); /* line 6404 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (548 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 6404 */
l_lr_446: ;/* line 6404 */
LABEL(l_lr_446);
  sim_icache_fetch(3531 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 80),0,4)); /* line 6406 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 6407 */
   ADD_CYCLES(3);
} /* line 6407 */
  sim_icache_fetch(3533 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_mul);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 6410 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 513: goto l_L202X3;
    case 514: goto l_L204X3;
    case 515: goto l_L206X3;
    case 517: goto l_lr_416;
    case 518: goto l_L205X3;
    case 519: goto l_L203X3;
    case 521: goto l_lr_420;
    case 522: goto l_L207X3;
    case 524: goto l_lr_423;
    case 525: goto l_L201X3;
    case 527: goto l_lr_426;
    case 528: goto l_L208X3;
    case 530: goto l_lr_429;
    case 531: goto l_L200X3;
    case 533: goto l_lr_432;
    case 534: goto l_L209X3;
    case 535: goto l_L211X3;
    case 537: goto l_lr_436;
    case 538: goto l_L199X3;
    case 540: goto l_lr_439;
    case 541: goto l_L212X3;
    case 542: goto l_L210X3;
    case 544: goto l_lr_443;
    case 545: goto l_L213X3;
    case 547: goto l_lr_446;
    case 548:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern sim_result_1_t _d_div( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(_d_div);
  sim_check_stack(reg_r0_1, -128); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (610 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(3534 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -128); /* line 6444 */
   SHRU(reg_r0_2, reg_r0_3, (unsigned int) 20); /* line 6445 */
   SHRU(reg_r0_12, reg_r0_5, (unsigned int) 20); /* line 6446 */
} /* line 6446 */
  sim_icache_fetch(3537 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_2, reg_r0_2, (unsigned int) 2047); /* line 6448 */
   SHRU(reg_r0_13, reg_r0_3, (unsigned int) 31); /* line 6449 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 116),0,4), reg_l0_0); /* line 6450 */
} /* line 6450 */
  sim_icache_fetch(3541 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_14, reg_r0_3, (unsigned int) 1048575); /* line 6452 */
   AND(reg_r0_12, reg_r0_12, (unsigned int) 2047); /* line 6453 */
} /* line 6453 */
  sim_icache_fetch(3545 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_16, reg_r0_5, (unsigned int) 1048575); /* line 6455 */
   SHRU(reg_r0_15, reg_r0_5, (unsigned int) 31); /* line 6456 */
   CMPEQ(reg_b0_0, reg_r0_12, 0); /* line 6457 */
} /* line 6457 */
  sim_icache_fetch(3549 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 24),0,4), reg_r0_2); /* line 6459 */
   XOR(reg_r0_18, reg_r0_13, reg_r0_15); /* line 6460 */
   CMPEQ(reg_b0_1, reg_r0_2, (unsigned int) 2047); /* line 6461 */
} /* line 6461 */
  sim_icache_fetch(3553 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_2, reg_r0_12, (unsigned int) 2047); /* line 6463 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 120),0,4), reg_r0_18); /* line 6464 */
} /* line 6464 */
  sim_icache_fetch(3556 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 6466 */
} /* line 6466 */
  sim_icache_fetch(3557 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_15, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 6468 */
} /* line 6468 */
  sim_icache_fetch(3558 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_12); /* line 6470 */
} /* line 6470 */
  sim_icache_fetch(3559 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_3, reg_r0_13, 0); /* line 6472 */
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 6473 */
} /* line 6473 */
  sim_icache_fetch(3561 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_4); /* line 6475 */
   ADD(reg_r0_15, reg_r0_15, (unsigned int) 1021); /* line 6476 */
} /* line 6476 */
  sim_icache_fetch(3564 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 6478 */
} /* line 6478 */
  sim_icache_fetch(3565 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_14); /* line 6480 */
   SUB(reg_r0_15, reg_r0_15, reg_r0_12); /* line 6481 */
} /* line 6481 */
  sim_icache_fetch(3567 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 6483 */
} /* line 6483 */
  sim_icache_fetch(3568 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_6); /* line 6485 */
   SHL(reg_r0_18, reg_r0_13, (unsigned int) 11); /* line 6486 */
   SHRU(reg_r0_17, reg_r0_13, (unsigned int) 21); /* line 6487 */
} /* line 6487 */
  sim_icache_fetch(3571 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 6489 */
   SHRU(reg_r0_19, reg_r0_18, (unsigned int) 1); /* line 6490 */
} /* line 6490 */
  sim_icache_fetch(3573 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_16); /* line 6492 */
   OR(reg_r0_12, reg_r0_12, (unsigned int) 1048576); /* line 6493 */
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L214X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6494 */
  sim_icache_fetch(3577 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_12, reg_r0_12, (unsigned int) 11); /* line 6496 */
   LDWs(reg_r0_20, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 6497 */
   if (reg_b0_2) {    BRANCH(reg_b0_2);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L215X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6498 */
  sim_icache_fetch(3580 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   OR(reg_r0_12, reg_r0_12, reg_r0_17); /* line 6500 */
   SHL(reg_r0_22, reg_r0_13, (unsigned int) 11); /* line 6501 */
   SHRU(reg_r0_21, reg_r0_13, (unsigned int) 21); /* line 6502 */
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L216X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6503 */
l_L217X3: ;/* line 6505 */
LABEL(l_L217X3);
  sim_icache_fetch(3584 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLEU(reg_r0_2, reg_r0_22, reg_r0_18); /* line 6506 */
   SHRU(reg_r0_13, reg_r0_12, (unsigned int) 1); /* line 6507 */
   SHL(reg_r0_14, reg_r0_12, (unsigned int) 31); /* line 6508 */
   if (reg_b0_3) {    BRANCH(reg_b0_3);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L218X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6509 */
l_L219X3: ;/* line 6511 */
LABEL(l_L219X3);
  sim_icache_fetch(3588 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_12); /* line 6512 */
   OR(reg_r0_20, reg_r0_20, (unsigned int) 1048576); /* line 6513 */
   OR(reg_r0_19, reg_r0_19, reg_r0_14); /* line 6514 */
} /* line 6514 */
  sim_icache_fetch(3592 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_18); /* line 6516 */
   SHL(reg_r0_20, reg_r0_20, (unsigned int) 11); /* line 6517 */
} /* line 6517 */
  sim_icache_fetch(3594 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_22); /* line 6519 */
   OR(reg_r0_20, reg_r0_20, reg_r0_21); /* line 6520 */
} /* line 6520 */
  sim_icache_fetch(3596 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 28),0,4), reg_r0_20); /* line 6522 */
   CMPLTU(reg_r0_16, reg_r0_20, reg_r0_12); /* line 6523 */
   CMPEQ(reg_r0_14, reg_r0_20, reg_r0_12); /* line 6524 */
} /* line 6524 */
  sim_icache_fetch(3599 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_14, reg_r0_14, reg_r0_2); /* line 6526 */
   LDWs(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 6527 */
} /* line 6527 */
  sim_icache_fetch(3601 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_b0_0, reg_r0_16, reg_r0_14); /* line 6529 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6530 */
   ADD_CYCLES(1);
} /* line 6530 */
  sim_icache_fetch(3603 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L220X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6532 */
  sim_icache_fetch(3604 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_19); /* line 6534 */
} /* line 6534 */
  sim_icache_fetch(3605 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_19, reg_r0_15, (unsigned int) 1); /* line 6536 */
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 6537 */
} /* line 6537 */
  sim_icache_fetch(3607 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 124),0,4), reg_r0_19); /* line 6539 */
} /* line 6539 */
  sim_icache_fetch(3608 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 20),0,4), reg_r0_13); /* line 6541 */
} /* line 6541 */
l_L221X3: ;/* line 6543 */
LABEL(l_L221X3);
  sim_icache_fetch(3609 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 6544 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6545 */
   ADD_CYCLES(1);
} /* line 6545 */
		 /* line 6546 */
  sim_icache_fetch(3611 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(estimateDiv64To32);
   reg_l0_0 = (610 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) estimateDiv64To32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 6548 */
l_lr_452: ;/* line 6548 */
LABEL(l_lr_452);
  sim_icache_fetch(3613 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 6550 */
   ADD(reg_r0_5, reg_r0_1, (unsigned int) 40); /* line 6551 */
   ADD(reg_r0_8, reg_r0_3, (unsigned int) -1); /* line 6552 */
   MOV(reg_r0_10, (unsigned int) -1); /* line 6553 */
} /* line 6553 */
  sim_icache_fetch(3617 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 6555 */
   ADD(reg_r0_6, reg_r0_1, (unsigned int) 44); /* line 6556 */
   ADD(reg_r0_7, reg_r0_1, (unsigned int) 48); /* line 6557 */
   MOV(reg_r0_11, 0); /* line 6558 */
} /* line 6558 */
  sim_icache_fetch(3621 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_9, reg_r0_3); /* line 6560 */
   LDW(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 6561 */
   MOV(reg_r0_20, reg_r0_3); /* line 6562 */
} /* line 6562 */
  sim_icache_fetch(3624 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MULLHU(reg_r0_13, reg_r0_3, reg_r0_2); /* line 6564 */
   MULLHU(reg_r0_14, reg_r0_2, reg_r0_3); /* line 6565 */
   LDW(reg_r0_15, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 6566 */
} /* line 6566 */
  sim_icache_fetch(3627 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MULLLU(reg_r0_16, reg_r0_2, reg_r0_3); /* line 6568 */
   MULHHU(reg_r0_17, reg_r0_2, reg_r0_3); /* line 6569 */
   LDW(reg_r0_18, mem_trace_ld((reg_r0_1 + (unsigned int) 120),0,4)); /* line 6570 */
} /* line 6570 */
  sim_icache_fetch(3630 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_3); /* line 6572 */
   ADD(reg_r0_14, reg_r0_13, reg_r0_14); /* line 6573 */
   MULLHU(reg_r0_19, reg_r0_4, reg_r0_3); /* line 6574 */
   MULLHU(reg_r0_21, reg_r0_3, reg_r0_4); /* line 6575 */
} /* line 6575 */
  sim_icache_fetch(3634 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MULLLU(reg_r0_24, reg_r0_3, reg_r0_4); /* line 6577 */
   SHRU(reg_r0_23, reg_r0_14, (unsigned int) 16); /* line 6578 */
   CMPLTU(reg_r0_13, reg_r0_14, reg_r0_13); /* line 6579 */
   SHL(reg_r0_22, reg_r0_14, (unsigned int) 16); /* line 6580 */
} /* line 6580 */
  sim_icache_fetch(3638 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_13, reg_r0_13, (unsigned int) 16); /* line 6582 */
   ADD(reg_r0_16, reg_r0_16, reg_r0_22); /* line 6583 */
   ADD(reg_r0_23, reg_r0_23, reg_r0_17); /* line 6584 */
   ADD(reg_r0_19, reg_r0_19, reg_r0_21); /* line 6585 */
} /* line 6585 */
  sim_icache_fetch(3642 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_22, reg_r0_16, reg_r0_22); /* line 6587 */
   SHRU(reg_r0_17, reg_r0_19, (unsigned int) 16); /* line 6588 */
   CMPLTU(reg_r0_21, reg_r0_19, reg_r0_21); /* line 6589 */
   SHL(reg_r0_14, reg_r0_19, (unsigned int) 16); /* line 6590 */
} /* line 6590 */
  sim_icache_fetch(3646 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_13, reg_r0_13, reg_r0_22); /* line 6592 */
   SHL(reg_r0_21, reg_r0_21, (unsigned int) 16); /* line 6593 */
   ADD(reg_r0_24, reg_r0_24, reg_r0_14); /* line 6594 */
   MULHHU(reg_r0_3, reg_r0_3, reg_r0_4); /* line 6595 */
} /* line 6595 */
  sim_icache_fetch(3650 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_22, 0, reg_r0_16); /* line 6597 */
   ADD(reg_r0_23, reg_r0_23, reg_r0_13); /* line 6598 */
   CMPLTU(reg_r0_14, reg_r0_24, reg_r0_14); /* line 6599 */
   CMPGTU(reg_r0_19, reg_r0_16, 0); /* line 6600 */
} /* line 6600 */
  sim_icache_fetch(3654 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_23, reg_r0_23, reg_r0_24); /* line 6602 */
   ADD(reg_r0_17, reg_r0_17, reg_r0_3); /* line 6603 */
   ADD(reg_r0_21, reg_r0_21, reg_r0_14); /* line 6604 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 48),0,4), reg_r0_22); /* line 6605 */
} /* line 6605 */
  sim_icache_fetch(3658 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_13, reg_r0_23, reg_r0_24); /* line 6607 */
   ADD(reg_r0_17, reg_r0_17, reg_r0_21); /* line 6608 */
   SUB(reg_r0_14, reg_r0_12, reg_r0_23); /* line 6609 */
   CMPLTU(reg_r0_22, reg_r0_12, reg_r0_23); /* line 6610 */
} /* line 6610 */
  sim_icache_fetch(3662 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_17, reg_r0_17, reg_r0_13); /* line 6612 */
   CMPLTU(reg_r0_12, reg_r0_14, reg_r0_19); /* line 6613 */
   SUB(reg_r0_21, reg_r0_14, reg_r0_19); /* line 6614 */
   SUB(reg_r0_15, reg_r0_15, reg_r0_22); /* line 6615 */
} /* line 6615 */
  sim_icache_fetch(3666 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 76),0,4), reg_r0_17); /* line 6617 */
   ADD(reg_r0_12, reg_r0_17, reg_r0_12); /* line 6618 */
   MOV(reg_r0_3, reg_r0_2); /* line 6619 */
} /* line 6619 */
  sim_icache_fetch(3669 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 80),0,4), reg_r0_17); /* line 6621 */
   SUB(reg_r0_15, reg_r0_15, reg_r0_12); /* line 6622 */
} /* line 6622 */
  sim_icache_fetch(3671 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_17, mem_trace_ld((reg_r0_1 + (unsigned int) 116),0,4)); /* line 6624 */
} /* line 6624 */
  sim_icache_fetch(3672 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_19, mem_trace_ld((reg_r0_1 + (unsigned int) 124),0,4)); /* line 6626 */
} /* line 6626 */
  sim_icache_fetch(3673 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_15); /* line 6628 */
} /* line 6628 */
  sim_icache_fetch(3674 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 44),0,4), reg_r0_21); /* line 6630 */
} /* line 6630 */
  sim_icache_fetch(3675 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 64),0,4), reg_r0_23); /* line 6632 */
} /* line 6632 */
  sim_icache_fetch(3676 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 68),0,4), reg_r0_23); /* line 6634 */
} /* line 6634 */
  sim_icache_fetch(3677 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), reg_r0_16); /* line 6636 */
} /* line 6636 */
  sim_icache_fetch(3678 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_16); /* line 6638 */
} /* line 6638 */
  sim_icache_fetch(3679 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 72),0,4), reg_r0_24); /* line 6640 */
} /* line 6640 */
l_L222X3: ;/* line 6643 */
LABEL(l_L222X3);
  sim_icache_fetch(3680 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 6644 */
} /* line 6644 */
  sim_icache_fetch(3681 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 6646 */
} /* line 6646 */
  sim_icache_fetch(3682 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 6648 */
} /* line 6648 */
  sim_icache_fetch(3683 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_14, reg_r0_2, reg_r0_3); /* line 6650 */
} /* line 6650 */
  sim_icache_fetch(3684 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_15, reg_r0_12, reg_r0_4); /* line 6652 */
   CMPLTU(reg_r0_2, reg_r0_14, reg_r0_2); /* line 6653 */
} /* line 6653 */
  sim_icache_fetch(3686 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_15 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLT(reg_b0_0, reg_r0_13, 0); /* line 6655 */
   CMPLTU(reg_r0_15, t__i32_0, reg_r0_12); /* line 6656 */
   ADD(reg_r0_16, t__i32_0, reg_r0_2); /* line 6657 */
} /* line 6657 */
  sim_icache_fetch(3689 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLTU(reg_r0_2, reg_r0_16, reg_r0_2); /* line 6659 */
} /* line 6659 */
  sim_icache_fetch(3690 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_13, reg_r0_13, reg_r0_2); /* line 6661 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L223X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6662 */
  sim_icache_fetch(3692 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_13, reg_r0_13, reg_r0_15); /* line 6664 */
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_16); /* line 6665 */
   ADD(reg_r0_9, reg_r0_9, (unsigned int) -2); /* line 6666 */
} /* line 6666 */
  sim_icache_fetch(3695 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 6668 */
} /* line 6668 */
  sim_icache_fetch(3696 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_13); /* line 6670 */
} /* line 6670 */
  sim_icache_fetch(3697 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 6672 */
} /* line 6672 */
  sim_icache_fetch(3698 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_7,0,4), reg_r0_14); /* line 6674 */
   ADD(reg_r0_13, reg_r0_4, reg_r0_2); /* line 6675 */
} /* line 6675 */
  sim_icache_fetch(3700 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_14, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 6677 */
   CMPLTU(reg_r0_2, reg_r0_13, reg_r0_2); /* line 6678 */
} /* line 6678 */
  sim_icache_fetch(3702 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLT(reg_b0_0, reg_r0_12, 0); /* line 6680 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6681 */
   ADD_CYCLES(1);
} /* line 6681 */
  sim_icache_fetch(3704 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_15, reg_r0_3, reg_r0_14); /* line 6683 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L224X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6684 */
  sim_icache_fetch(3706 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLTU(reg_r0_14, reg_r0_15, reg_r0_14); /* line 6686 */
   STW(mem_trace_st(reg_r0_7,0,4), reg_r0_15); /* line 6687 */
   ADD(reg_r0_11, reg_r0_11, (unsigned int) -2); /* line 6688 */
} /* line 6688 */
  sim_icache_fetch(3709 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_13, reg_r0_13, reg_r0_14); /* line 6690 */
   LDWs(reg_r0_15, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 6691 */
} /* line 6691 */
  sim_icache_fetch(3711 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLTU(reg_r0_14, reg_r0_13, reg_r0_14); /* line 6693 */
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_13); /* line 6694 */
} /* line 6694 */
  sim_icache_fetch(3713 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_12, reg_r0_12, reg_r0_14); /* line 6696 */
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 6697 */
} /* line 6697 */
  sim_icache_fetch(3715 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_12, reg_r0_12, reg_r0_2); /* line 6699 */
   ADD(reg_r0_2, reg_r0_3, reg_r0_15); /* line 6700 */
} /* line 6700 */
  sim_icache_fetch(3717 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_12); /* line 6702 */
   CMPLTU(reg_r0_15, reg_r0_2, reg_r0_15); /* line 6703 */
} /* line 6703 */
  sim_icache_fetch(3719 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 6705 */
   ADD(reg_r0_14, reg_r0_4, reg_r0_13); /* line 6706 */
} /* line 6706 */
  sim_icache_fetch(3721 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_14 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLTU(reg_r0_14, t__i32_0, reg_r0_13); /* line 6708 */
   ADD(reg_r0_16, t__i32_0, reg_r0_15); /* line 6709 */
} /* line 6709 */
  sim_icache_fetch(3723 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLTU(reg_r0_15, reg_r0_16, reg_r0_15); /* line 6711 */
} /* line 6711 */
  sim_icache_fetch(3724 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_b0_0, reg_r0_12, 0); /* line 6713 */
   ADD(reg_r0_12, reg_r0_12, reg_r0_15); /* line 6714 */
} /* line 6714 */
  sim_icache_fetch(3726 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_12, reg_r0_12, reg_r0_14); /* line 6716 */
} /* line 6716 */
  sim_icache_fetch(3727 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L225X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6718 */
  sim_icache_fetch(3728 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_7,0,4), reg_r0_2); /* line 6720 */
   ADD(reg_r0_8, reg_r0_8, (unsigned int) -2); /* line 6721 */
} /* line 6721 */
  sim_icache_fetch(3730 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 6723 */
} /* line 6723 */
  sim_icache_fetch(3731 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_16); /* line 6725 */
} /* line 6725 */
  sim_icache_fetch(3732 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 6727 */
} /* line 6727 */
  sim_icache_fetch(3733 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_12); /* line 6729 */
   ADD(reg_r0_14, reg_r0_3, reg_r0_2); /* line 6730 */
} /* line 6730 */
  sim_icache_fetch(3735 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 6732 */
   CMPLTU(reg_r0_2, reg_r0_14, reg_r0_2); /* line 6733 */
} /* line 6733 */
  sim_icache_fetch(3737 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_15, reg_r0_4, reg_r0_13); /* line 6735 */
} /* line 6735 */
  sim_icache_fetch(3738 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_15 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLTU(reg_r0_15, t__i32_0, reg_r0_13); /* line 6737 */
   ADD(reg_r0_16, t__i32_0, reg_r0_2); /* line 6738 */
} /* line 6738 */
  sim_icache_fetch(3740 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_b0_0, reg_r0_12, 0); /* line 6740 */
   CMPLTU(reg_r0_2, reg_r0_16, reg_r0_2); /* line 6741 */
} /* line 6741 */
  sim_icache_fetch(3742 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_12, reg_r0_12, reg_r0_2); /* line 6743 */
} /* line 6743 */
  sim_icache_fetch(3743 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_12, reg_r0_12, reg_r0_15); /* line 6745 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L226X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6746 */
  sim_icache_fetch(3745 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_7,0,4), reg_r0_14); /* line 6748 */
   ADD(reg_r0_10, reg_r0_10, (unsigned int) -2); /* line 6749 */
} /* line 6749 */
  sim_icache_fetch(3747 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_16); /* line 6751 */
} /* line 6751 */
  sim_icache_fetch(3748 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_12); /* line 6753 */
   GOTO(l_L222X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L222X3;
} /* line 6754 */
l_L226X3: ;/* line 6757 */
LABEL(l_L226X3);
  sim_icache_fetch(3750 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_11, reg_r0_10); /* line 6759 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 120),0,4), reg_r0_18); /* line 6760 */
   GOTO(l_L227X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L227X3;
} /* line 6761 */
l_L228X3: ;/* line 6764 */
LABEL(l_L228X3);
  sim_icache_fetch(3753 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 108),0,4)); /* line 6765 */
} /* line 6765 */
  sim_icache_fetch(3754 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 6767 */
} /* line 6767 */
  sim_icache_fetch(3755 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 6769 */
} /* line 6769 */
  sim_icache_fetch(3756 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_14, reg_r0_2, reg_r0_3); /* line 6771 */
} /* line 6771 */
  sim_icache_fetch(3757 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_15, reg_r0_12, reg_r0_4); /* line 6773 */
   CMPLTU(reg_r0_2, reg_r0_14, reg_r0_2); /* line 6774 */
} /* line 6774 */
  sim_icache_fetch(3759 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_15 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLT(reg_b0_0, reg_r0_13, 0); /* line 6776 */
   CMPLTU(reg_r0_15, t__i32_0, reg_r0_12); /* line 6777 */
   ADD(reg_r0_16, t__i32_0, reg_r0_2); /* line 6778 */
} /* line 6778 */
  sim_icache_fetch(3762 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLTU(reg_r0_2, reg_r0_16, reg_r0_2); /* line 6780 */
} /* line 6780 */
  sim_icache_fetch(3763 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_13, reg_r0_13, reg_r0_2); /* line 6782 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L229X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6783 */
  sim_icache_fetch(3765 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_13, reg_r0_13, reg_r0_15); /* line 6785 */
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_16); /* line 6786 */
   ADD(reg_r0_9, reg_r0_9, (unsigned int) -2); /* line 6787 */
} /* line 6787 */
  sim_icache_fetch(3768 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 6789 */
} /* line 6789 */
  sim_icache_fetch(3769 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_13); /* line 6791 */
} /* line 6791 */
  sim_icache_fetch(3770 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 6793 */
} /* line 6793 */
  sim_icache_fetch(3771 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_7,0,4), reg_r0_14); /* line 6795 */
   ADD(reg_r0_13, reg_r0_4, reg_r0_2); /* line 6796 */
} /* line 6796 */
  sim_icache_fetch(3773 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_14, mem_trace_ld((reg_r0_1 + (unsigned int) 108),0,4)); /* line 6798 */
   CMPLTU(reg_r0_2, reg_r0_13, reg_r0_2); /* line 6799 */
} /* line 6799 */
  sim_icache_fetch(3775 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLT(reg_b0_0, reg_r0_12, 0); /* line 6801 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6802 */
   ADD_CYCLES(1);
} /* line 6802 */
  sim_icache_fetch(3777 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_15, reg_r0_3, reg_r0_14); /* line 6804 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L230X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6805 */
  sim_icache_fetch(3779 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPLTU(reg_r0_14, reg_r0_15, reg_r0_14); /* line 6807 */
   STW(mem_trace_st(reg_r0_7,0,4), reg_r0_15); /* line 6808 */
   ADD(reg_r0_11, reg_r0_11, (unsigned int) -2); /* line 6809 */
} /* line 6809 */
  sim_icache_fetch(3782 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_13, reg_r0_13, reg_r0_14); /* line 6811 */
   LDWs(reg_r0_15, mem_trace_ld((reg_r0_1 + (unsigned int) 108),0,4)); /* line 6812 */
} /* line 6812 */
  sim_icache_fetch(3784 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLTU(reg_r0_14, reg_r0_13, reg_r0_14); /* line 6814 */
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_13); /* line 6815 */
} /* line 6815 */
  sim_icache_fetch(3786 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_12, reg_r0_12, reg_r0_14); /* line 6817 */
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 6818 */
} /* line 6818 */
  sim_icache_fetch(3788 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_12, reg_r0_12, reg_r0_2); /* line 6820 */
   ADD(reg_r0_2, reg_r0_3, reg_r0_15); /* line 6821 */
} /* line 6821 */
  sim_icache_fetch(3790 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_12); /* line 6823 */
   CMPLTU(reg_r0_15, reg_r0_2, reg_r0_15); /* line 6824 */
} /* line 6824 */
  sim_icache_fetch(3792 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 6826 */
   ADD(reg_r0_14, reg_r0_4, reg_r0_13); /* line 6827 */
} /* line 6827 */
  sim_icache_fetch(3794 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_14 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLTU(reg_r0_14, t__i32_0, reg_r0_13); /* line 6829 */
   ADD(reg_r0_16, t__i32_0, reg_r0_15); /* line 6830 */
} /* line 6830 */
  sim_icache_fetch(3796 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPLTU(reg_r0_15, reg_r0_16, reg_r0_15); /* line 6832 */
} /* line 6832 */
  sim_icache_fetch(3797 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_b0_0, reg_r0_12, 0); /* line 6834 */
   ADD(reg_r0_12, reg_r0_12, reg_r0_15); /* line 6835 */
} /* line 6835 */
  sim_icache_fetch(3799 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_12, reg_r0_12, reg_r0_14); /* line 6837 */
} /* line 6837 */
  sim_icache_fetch(3800 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L231X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6839 */
  sim_icache_fetch(3801 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_7,0,4), reg_r0_2); /* line 6841 */
   ADD(reg_r0_8, reg_r0_8, (unsigned int) -2); /* line 6842 */
} /* line 6842 */
  sim_icache_fetch(3803 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 108),0,4)); /* line 6844 */
} /* line 6844 */
  sim_icache_fetch(3804 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_16); /* line 6846 */
} /* line 6846 */
  sim_icache_fetch(3805 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 6848 */
} /* line 6848 */
  sim_icache_fetch(3806 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_12); /* line 6850 */
   ADD(reg_r0_14, reg_r0_3, reg_r0_2); /* line 6851 */
} /* line 6851 */
  sim_icache_fetch(3808 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_12, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 6853 */
   CMPLTU(reg_r0_2, reg_r0_14, reg_r0_2); /* line 6854 */
} /* line 6854 */
  sim_icache_fetch(3810 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_15, reg_r0_4, reg_r0_13); /* line 6856 */
} /* line 6856 */
  sim_icache_fetch(3811 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_15 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLTU(reg_r0_15, t__i32_0, reg_r0_13); /* line 6858 */
   ADD(reg_r0_16, t__i32_0, reg_r0_2); /* line 6859 */
} /* line 6859 */
  sim_icache_fetch(3813 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLT(reg_b0_0, reg_r0_12, 0); /* line 6861 */
   CMPLTU(reg_r0_2, reg_r0_16, reg_r0_2); /* line 6862 */
} /* line 6862 */
  sim_icache_fetch(3815 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_12, reg_r0_12, reg_r0_2); /* line 6864 */
} /* line 6864 */
  sim_icache_fetch(3816 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_12, reg_r0_12, reg_r0_15); /* line 6866 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L232X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6867 */
  sim_icache_fetch(3818 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_7,0,4), reg_r0_14); /* line 6869 */
   ADD(reg_r0_10, reg_r0_10, (unsigned int) -2); /* line 6870 */
} /* line 6870 */
  sim_icache_fetch(3820 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st(reg_r0_6,0,4), reg_r0_16); /* line 6872 */
} /* line 6872 */
  sim_icache_fetch(3821 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st(reg_r0_5,0,4), reg_r0_12); /* line 6874 */
   GOTO(l_L228X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L228X3;
} /* line 6875 */
l_L232X3: ;/* line 6878 */
LABEL(l_L232X3);
  sim_icache_fetch(3823 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_11, reg_r0_10); /* line 6880 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 124),0,4), reg_r0_19); /* line 6881 */
   GOTO(l_L233X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L233X3;
} /* line 6882 */
l_L234X3: ;/* line 6885 */
LABEL(l_L234X3);
  sim_icache_fetch(3826 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 6886 */
   MOV(reg_r0_3, reg_r0_18); /* line 6887 */
} /* line 6887 */
  sim_icache_fetch(3828 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 84),0,4)); /* line 6889 */
} /* line 6889 */
  sim_icache_fetch(3829 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 124),0,4)); /* line 6891 */
} /* line 6891 */
  sim_icache_fetch(3830 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_9, reg_r0_2, (unsigned int) 21); /* line 6893 */
   SHRU(reg_r0_5, reg_r0_2, (unsigned int) 11); /* line 6894 */
} /* line 6894 */
  sim_icache_fetch(3832 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_7, reg_r0_8, (unsigned int) 21); /* line 6896 */
   SHRU(reg_r0_2, reg_r0_8, (unsigned int) 11); /* line 6897 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_5); /* line 6898 */
} /* line 6898 */
  sim_icache_fetch(3835 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 112),0,4), reg_r0_7); /* line 6900 */
   OR(reg_r0_6, reg_r0_9, reg_r0_2); /* line 6901 */
} /* line 6901 */
		 /* line 6902 */
  sim_icache_fetch(3837 + t_thisfile.offset, 3);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 84),0,4), reg_r0_6); /* line 6904 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(roundAndPackFloat64);
   reg_l0_0 = (610 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) roundAndPackFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 6905 */
l_lr_459: ;/* line 6905 */
LABEL(l_lr_459);
  sim_icache_fetch(3840 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 116),0,4)); /* line 6907 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 6908 */
   ADD_CYCLES(3);
} /* line 6908 */
  sim_icache_fetch(3842 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 128; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 6911 */
l_L236X3: ;/* line 6914 */
LABEL(l_L236X3);
  sim_icache_fetch(3843 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(0);
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 6915 */
   ADD_CYCLES(1);
} /* line 6915 */
  sim_icache_fetch(3844 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 6917 */
} /* line 6917 */
  sim_icache_fetch(3845 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L235X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L235X3;
} /* line 6919 */
l_L231X3: ;/* line 6922 */
LABEL(l_L231X3);
  sim_icache_fetch(3846 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_11, reg_r0_10); /* line 6923 */
   MOV(reg_r0_9, reg_r0_8); /* line 6924 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 124),0,4), reg_r0_19); /* line 6925 */
   GOTO(l_L233X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L233X3;
} /* line 6926 */
l_L230X3: ;/* line 6930 */
LABEL(l_L230X3);
  sim_icache_fetch(3850 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_9, reg_r0_8); /* line 6931 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 124),0,4), reg_r0_19); /* line 6932 */
   GOTO(l_L233X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L233X3;
} /* line 6933 */
l_L229X3: ;/* line 6938 */
LABEL(l_L229X3);
  sim_icache_fetch(3853 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 124),0,4), reg_r0_19); /* line 6939 */
} /* line 6939 */
l_L233X3: ;/* line 6941 */
LABEL(l_L233X3);
  sim_icache_fetch(3854 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_9, reg_r0_9, reg_r0_11); /* line 6942 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 116),0,4), reg_r0_17); /* line 6943 */
} /* line 6943 */
  sim_icache_fetch(3856 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_b0_0, reg_r0_9, reg_r0_20); /* line 6945 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 108),0,4)); /* line 6946 */
} /* line 6946 */
  sim_icache_fetch(3858 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 6948 */
} /* line 6948 */
  sim_icache_fetch(3859 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 6950 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L236X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 6951 */
  sim_icache_fetch(3861 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 84),0,4), reg_r0_9); /* line 6953 */
} /* line 6953 */
l_L235X3: ;/* line 6955 */
LABEL(l_L235X3);
  sim_icache_fetch(3862 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 84),0,4)); /* line 6956 */
   OR(reg_r0_2, reg_r0_2, reg_r0_3); /* line 6957 */
} /* line 6957 */
  sim_icache_fetch(3864 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_4); /* line 6959 */
} /* line 6959 */
  sim_icache_fetch(3865 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_r0_2, reg_r0_2, 0); /* line 6961 */
} /* line 6961 */
  sim_icache_fetch(3866 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_5, reg_r0_5, reg_r0_2); /* line 6963 */
} /* line 6963 */
  sim_icache_fetch(3867 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 84),0,4), reg_r0_5); /* line 6965 */
   GOTO(l_L234X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L234X3;
} /* line 6966 */
l_L238X3: ;/* line 6969 */
LABEL(l_L238X3);
  sim_icache_fetch(3869 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 6970 */
} /* line 6970 */
  sim_icache_fetch(3870 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L237X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L237X3;
} /* line 6972 */
l_L225X3: ;/* line 6975 */
LABEL(l_L225X3);
  sim_icache_fetch(3871 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_11, reg_r0_10); /* line 6976 */
   MOV(reg_r0_9, reg_r0_8); /* line 6977 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 120),0,4), reg_r0_18); /* line 6978 */
   GOTO(l_L227X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L227X3;
} /* line 6979 */
l_L224X3: ;/* line 6983 */
LABEL(l_L224X3);
  sim_icache_fetch(3875 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_9, reg_r0_8); /* line 6984 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 120),0,4), reg_r0_18); /* line 6985 */
   GOTO(l_L227X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L227X3;
} /* line 6986 */
l_L223X3: ;/* line 6991 */
LABEL(l_L223X3);
  sim_icache_fetch(3878 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 120),0,4), reg_r0_18); /* line 6992 */
} /* line 6992 */
l_L227X3: ;/* line 6994 */
LABEL(l_L227X3);
  sim_icache_fetch(3879 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_9, reg_r0_9, reg_r0_11); /* line 6995 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 124),0,4), reg_r0_19); /* line 6996 */
} /* line 6996 */
  sim_icache_fetch(3881 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPNE(reg_b0_0, reg_r0_9, reg_r0_20); /* line 6998 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 116),0,4), reg_r0_17); /* line 6999 */
} /* line 6999 */
  sim_icache_fetch(3883 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 7001 */
} /* line 7001 */
  sim_icache_fetch(3884 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 7003 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L238X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7004 */
  sim_icache_fetch(3886 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 7006 */
} /* line 7006 */
  sim_icache_fetch(3887 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_9); /* line 7008 */
} /* line 7008 */
l_L237X3: ;/* line 7010 */
LABEL(l_L237X3);
		 /* line 7010 */
  sim_icache_fetch(3888 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(estimateDiv64To32);
   reg_l0_0 = (610 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) estimateDiv64To32;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 7012 */
l_lr_473: ;/* line 7012 */
LABEL(l_lr_473);
  sim_icache_fetch(3890 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_12, reg_r0_3, (unsigned int) 1023); /* line 7014 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 7015 */
   MOV(reg_r0_10, (unsigned int) -1); /* line 7016 */
} /* line 7016 */
  sim_icache_fetch(3894 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLEU(reg_b0_0, reg_r0_12, (unsigned int) 4); /* line 7018 */
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 7019 */
   ADD(reg_r0_5, reg_r0_1, (unsigned int) 44); /* line 7020 */
   ADD(reg_r0_8, reg_r0_3, (unsigned int) -1); /* line 7021 */
} /* line 7021 */
  sim_icache_fetch(3898 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_9, reg_r0_3); /* line 7023 */
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 7024 */
   ADD(reg_r0_6, reg_r0_1, (unsigned int) 48); /* line 7025 */
   ADD(reg_r0_7, reg_r0_1, (unsigned int) 108); /* line 7026 */
} /* line 7026 */
  sim_icache_fetch(3902 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MULLHU(reg_r0_12, reg_r0_3, reg_r0_2); /* line 7028 */
   MULLHU(reg_r0_14, reg_r0_2, reg_r0_3); /* line 7029 */
   LDWs(reg_r0_16, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 7030 */
   MOV(reg_r0_11, 0); /* line 7031 */
} /* line 7031 */
  sim_icache_fetch(3906 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MULLLU(reg_r0_19, reg_r0_2, reg_r0_3); /* line 7033 */
   MULHHU(reg_r0_20, reg_r0_2, reg_r0_3); /* line 7034 */
   LDW(reg_r0_18, mem_trace_ld((reg_r0_1 + (unsigned int) 120),0,4)); /* line 7035 */
} /* line 7035 */
  sim_icache_fetch(3909 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_14, reg_r0_12, reg_r0_14); /* line 7037 */
   MULLHU(reg_r0_21, reg_r0_4, reg_r0_3); /* line 7038 */
   MULLHU(reg_r0_22, reg_r0_3, reg_r0_4); /* line 7039 */
   LDW(reg_r0_17, mem_trace_ld((reg_r0_1 + (unsigned int) 116),0,4)); /* line 7040 */
} /* line 7040 */
  sim_icache_fetch(3913 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MULLLU(reg_r0_25, reg_r0_4, reg_r0_3); /* line 7042 */
   SHRU(reg_r0_24, reg_r0_14, (unsigned int) 16); /* line 7043 */
   CMPLTU(reg_r0_12, reg_r0_14, reg_r0_12); /* line 7044 */
   SHL(reg_r0_23, reg_r0_14, (unsigned int) 16); /* line 7045 */
} /* line 7045 */
  sim_icache_fetch(3917 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_12, reg_r0_12, (unsigned int) 16); /* line 7047 */
   ADD(reg_r0_19, reg_r0_19, reg_r0_23); /* line 7048 */
   ADD(reg_r0_24, reg_r0_24, reg_r0_20); /* line 7049 */
   ADD(reg_r0_21, reg_r0_21, reg_r0_22); /* line 7050 */
} /* line 7050 */
  sim_icache_fetch(3921 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_23, reg_r0_19, reg_r0_23); /* line 7052 */
   SHRU(reg_r0_20, reg_r0_21, (unsigned int) 16); /* line 7053 */
   CMPLTU(reg_r0_22, reg_r0_21, reg_r0_22); /* line 7054 */
   SHL(reg_r0_14, reg_r0_21, (unsigned int) 16); /* line 7055 */
} /* line 7055 */
  sim_icache_fetch(3925 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_12, reg_r0_12, reg_r0_23); /* line 7057 */
   SHL(reg_r0_22, reg_r0_22, (unsigned int) 16); /* line 7058 */
   ADD(reg_r0_25, reg_r0_25, reg_r0_14); /* line 7059 */
   MULHHU(reg_r0_21, reg_r0_3, reg_r0_4); /* line 7060 */
} /* line 7060 */
  sim_icache_fetch(3929 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_26, 0, reg_r0_19); /* line 7062 */
   ADD(reg_r0_24, reg_r0_24, reg_r0_12); /* line 7063 */
   CMPLTU(reg_r0_14, reg_r0_25, reg_r0_14); /* line 7064 */
   CMPGTU(reg_r0_23, reg_r0_19, 0); /* line 7065 */
} /* line 7065 */
  sim_icache_fetch(3933 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 84),0,4), reg_r0_3); /* line 7067 */
   ADD(reg_r0_24, reg_r0_24, reg_r0_25); /* line 7068 */
   ADD(reg_r0_20, reg_r0_20, reg_r0_21); /* line 7069 */
   ADD(reg_r0_22, reg_r0_22, reg_r0_14); /* line 7070 */
} /* line 7070 */
  sim_icache_fetch(3937 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_12, reg_r0_24, reg_r0_25); /* line 7072 */
   ADD(reg_r0_20, reg_r0_20, reg_r0_22); /* line 7073 */
   SUB(reg_r0_14, reg_r0_13, reg_r0_24); /* line 7074 */
   CMPLTU(reg_r0_21, reg_r0_13, reg_r0_24); /* line 7075 */
} /* line 7075 */
  sim_icache_fetch(3941 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   ADD(reg_r0_20, reg_r0_20, reg_r0_12); /* line 7077 */
   CMPLTU(reg_r0_13, reg_r0_14, reg_r0_23); /* line 7078 */
   SUB(reg_r0_16, reg_r0_16, reg_r0_21); /* line 7079 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L234X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7080 */
  sim_icache_fetch(3945 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 88),0,4), reg_r0_19); /* line 7082 */
   SUB(reg_r0_14, reg_r0_14, reg_r0_23); /* line 7083 */
   ADD(reg_r0_13, reg_r0_20, reg_r0_13); /* line 7084 */
} /* line 7084 */
  sim_icache_fetch(3948 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 68),0,4), reg_r0_20); /* line 7086 */
   SUB(reg_r0_16, reg_r0_16, reg_r0_13); /* line 7087 */
} /* line 7087 */
  sim_icache_fetch(3950 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 104),0,4), reg_r0_20); /* line 7089 */
} /* line 7089 */
  sim_icache_fetch(3951 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 92),0,4), reg_r0_19); /* line 7091 */
   MOV(reg_r0_20, reg_r0_3); /* line 7092 */
} /* line 7092 */
  sim_icache_fetch(3953 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_19, mem_trace_ld((reg_r0_1 + (unsigned int) 124),0,4)); /* line 7094 */
   MOV(reg_r0_3, reg_r0_2); /* line 7095 */
} /* line 7095 */
  sim_icache_fetch(3955 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 44),0,4), reg_r0_16); /* line 7097 */
} /* line 7097 */
  sim_icache_fetch(3956 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 48),0,4), reg_r0_14); /* line 7099 */
} /* line 7099 */
  sim_icache_fetch(3957 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 96),0,4), reg_r0_24); /* line 7101 */
} /* line 7101 */
  sim_icache_fetch(3958 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_24); /* line 7103 */
} /* line 7103 */
  sim_icache_fetch(3959 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 108),0,4), reg_r0_26); /* line 7105 */
} /* line 7105 */
  sim_icache_fetch(3960 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 100),0,4), reg_r0_25); /* line 7107 */
   GOTO(l_L228X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L228X3;
} /* line 7108 */
l_L220X3: ;/* line 7111 */
LABEL(l_L220X3);
  sim_icache_fetch(3962 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 124),0,4), reg_r0_15); /* line 7112 */
} /* line 7112 */
  sim_icache_fetch(3963 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7114 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7115 */
   ADD_CYCLES(1);
} /* line 7115 */
  sim_icache_fetch(3965 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L221X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L221X3;
} /* line 7117 */
l_L218X3: ;/* line 7120 */
LABEL(l_L218X3);
  sim_icache_fetch(3966 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7121 */
   MOV(reg_r0_5, 0); /* line 7122 */
   MOV(reg_r0_6, 0); /* line 7123 */
   MOV(reg_r0_4, 0); /* line 7124 */
} /* line 7124 */
  sim_icache_fetch(3970 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 7126 */
} /* line 7126 */
  sim_icache_fetch(3971 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 120),0,4)); /* line 7128 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7129 */
   ADD_CYCLES(1);
} /* line 7129 */
  sim_icache_fetch(3973 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_7); /* line 7131 */
} /* line 7131 */
  sim_icache_fetch(3974 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_0, reg_r0_2, 0); /* line 7133 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7134 */
   ADD_CYCLES(1);
} /* line 7134 */
  sim_icache_fetch(3976 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L239X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7136 */
		 /* line 7137 */
  sim_icache_fetch(3977 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (610 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 7139 */
l_lr_477: ;/* line 7139 */
LABEL(l_lr_477);
  sim_icache_fetch(3979 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 116),0,4)); /* line 7141 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7142 */
   ADD_CYCLES(3);
} /* line 7142 */
  sim_icache_fetch(3981 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 128; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7145 */
l_L239X3: ;/* line 7148 */
LABEL(l_L239X3);
  sim_icache_fetch(3982 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 7149 */
   ADD(reg_r0_6, reg_r0_1, (unsigned int) 20); /* line 7150 */
   ADD(reg_r0_7, reg_r0_1, (unsigned int) 16); /* line 7151 */
   ADD(reg_r0_5, reg_r0_1, (unsigned int) 24); /* line 7152 */
} /* line 7152 */
  sim_icache_fetch(3986 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7154 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7155 */
   ADD_CYCLES(1);
} /* line 7155 */
		 /* line 7156 */
  sim_icache_fetch(3988 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(normalizeFloat64Subnormal);
   reg_l0_0 = (610 << 5);
   {
    typedef void t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) normalizeFloat64Subnormal;
    (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
   }
} /* line 7158 */
l_lr_480: ;/* line 7158 */
LABEL(l_lr_480);
  sim_icache_fetch(3990 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 7160 */
} /* line 7160 */
  sim_icache_fetch(3991 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7162 */
} /* line 7162 */
  sim_icache_fetch(3992 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_5, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 7164 */
} /* line 7164 */
  sim_icache_fetch(3993 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDW(reg_r0_6, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 7166 */
   OR(reg_r0_3, reg_r0_3, (unsigned int) 1048576); /* line 7167 */
} /* line 7167 */
  sim_icache_fetch(3996 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SHL(reg_r0_18, reg_r0_4, (unsigned int) 11); /* line 7169 */
   SHL(reg_r0_3, reg_r0_3, (unsigned int) 11); /* line 7170 */
   SHRU(reg_r0_17, reg_r0_4, (unsigned int) 21); /* line 7171 */
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 7172 */
} /* line 7172 */
  sim_icache_fetch(4000 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_5, reg_r0_5, (unsigned int) 1021); /* line 7174 */
   OR(reg_r0_12, reg_r0_3, reg_r0_17); /* line 7175 */
   SHRU(reg_r0_19, reg_r0_18, (unsigned int) 1); /* line 7176 */
} /* line 7176 */
  sim_icache_fetch(4004 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   SUB(reg_r0_15, reg_r0_5, reg_r0_6); /* line 7178 */
   LDW(reg_r0_20, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 7179 */
   SHRU(reg_r0_13, reg_r0_12, (unsigned int) 1); /* line 7180 */
   SHL(reg_r0_14, reg_r0_12, (unsigned int) 31); /* line 7181 */
} /* line 7181 */
  sim_icache_fetch(4008 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SHL(reg_r0_22, reg_r0_7, (unsigned int) 11); /* line 7183 */
   SHRU(reg_r0_21, reg_r0_7, (unsigned int) 21); /* line 7184 */
} /* line 7184 */
  sim_icache_fetch(4010 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPLEU(reg_r0_2, reg_r0_22, reg_r0_18); /* line 7186 */
   GOTO(l_L219X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L219X3;
} /* line 7187 */
l_L216X3: ;/* line 7190 */
LABEL(l_L216X3);
  sim_icache_fetch(4012 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   OR(reg_r0_6, reg_r0_6, reg_r0_16); /* line 7191 */
   OR(reg_r0_4, reg_r0_4, reg_r0_2); /* line 7192 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 7193 */
} /* line 7193 */
  sim_icache_fetch(4015 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_b0_0, reg_r0_6, 0); /* line 7195 */
   OR(reg_r0_4, reg_r0_4, reg_r0_14); /* line 7196 */
} /* line 7196 */
  sim_icache_fetch(4017 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_1, reg_r0_4, 0); /* line 7198 */
} /* line 7198 */
  sim_icache_fetch(4018 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L240X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7200 */
  sim_icache_fetch(4019 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_1) {    BRANCHF(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L241X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7202 */
l_L242X3: ;/* line 7204 */
LABEL(l_L242X3);
		 /* line 7204 */
  sim_icache_fetch(4020 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (610 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 7206 */
l_lr_484: ;/* line 7206 */
LABEL(l_lr_484);
  sim_icache_fetch(4022 + t_thisfile.offset, 5);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_4, (unsigned int) -1); /* line 7208 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 116),0,4)); /* line 7209 */
   MOV(reg_r0_3, (unsigned int) 2147483647); /* line 7210 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7211 */
   ADD_CYCLES(3);
} /* line 7211 */
  sim_icache_fetch(4027 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 128; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7214 */
l_L241X3: ;/* line 7217 */
LABEL(l_L241X3);
		 /* line 7217 */
  sim_icache_fetch(4028 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, (unsigned int) 128); /* line 7220 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (610 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 7220 */
l_lr_487: ;/* line 7220 */
LABEL(l_lr_487);
  sim_icache_fetch(4031 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_5, 0); /* line 7222 */
   MOV(reg_r0_6, 0); /* line 7223 */
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 120),0,4)); /* line 7224 */
} /* line 7224 */
  sim_icache_fetch(4034 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_4, (unsigned int) 2047); /* line 7226 */
} /* line 7226 */
		 /* line 7227 */
  sim_icache_fetch(4036 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (610 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 7229 */
l_lr_489: ;/* line 7229 */
LABEL(l_lr_489);
  sim_icache_fetch(4038 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 116),0,4)); /* line 7231 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7232 */
   ADD_CYCLES(3);
} /* line 7232 */
  sim_icache_fetch(4040 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 128; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7235 */
l_L240X3: ;/* line 7238 */
LABEL(l_L240X3);
  sim_icache_fetch(4041 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 7239 */
   ADD(reg_r0_6, reg_r0_1, (unsigned int) 28); /* line 7240 */
   ADD(reg_r0_7, reg_r0_1, (unsigned int) 32); /* line 7241 */
   ADD(reg_r0_5, reg_r0_1, (unsigned int) 36); /* line 7242 */
} /* line 7242 */
  sim_icache_fetch(4045 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 7244 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7245 */
   ADD_CYCLES(1);
} /* line 7245 */
		 /* line 7246 */
  sim_icache_fetch(4047 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(normalizeFloat64Subnormal);
   reg_l0_0 = (610 << 5);
   {
    typedef void t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) normalizeFloat64Subnormal;
    (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7);
   }
} /* line 7248 */
l_lr_492: ;/* line 7248 */
LABEL(l_lr_492);
  sim_icache_fetch(4049 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 7250 */
} /* line 7250 */
  sim_icache_fetch(4050 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7252 */
} /* line 7252 */
  sim_icache_fetch(4051 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 7254 */
} /* line 7254 */
  sim_icache_fetch(4052 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   LDWs(reg_r0_4, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 7256 */
   OR(reg_r0_2, reg_r0_2, (unsigned int) 1048576); /* line 7257 */
} /* line 7257 */
  sim_icache_fetch(4055 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_13 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   LDW(reg_r0_13, mem_trace_ld((reg_r0_1 + (unsigned int) 24),0,4)); /* line 7259 */
   SHL(reg_r0_18, t__i32_0, (unsigned int) 11); /* line 7260 */
   SHL(reg_r0_2, reg_r0_2, (unsigned int) 11); /* line 7261 */
   SHRU(reg_r0_17, t__i32_0, (unsigned int) 21); /* line 7262 */
} /* line 7262 */
  sim_icache_fetch(4059 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_3, reg_r0_3, (unsigned int) 1021); /* line 7264 */
   OR(reg_r0_12, reg_r0_2, reg_r0_17); /* line 7265 */
   SHRU(reg_r0_19, reg_r0_18, (unsigned int) 1); /* line 7266 */
} /* line 7266 */
  sim_icache_fetch(4063 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SUB(reg_r0_15, reg_r0_3, reg_r0_4); /* line 7268 */
   LDWs(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 7269 */
} /* line 7269 */
  sim_icache_fetch(4065 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_3, reg_r0_13, 0); /* line 7271 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7272 */
   ADD_CYCLES(1);
} /* line 7272 */
  sim_icache_fetch(4067 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHL(reg_r0_22, reg_r0_2, (unsigned int) 11); /* line 7274 */
   SHRU(reg_r0_21, reg_r0_2, (unsigned int) 21); /* line 7275 */
   LDWs(reg_r0_20, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 7276 */
} /* line 7276 */
  sim_icache_fetch(4070 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   GOTO(l_L217X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L217X3;
} /* line 7278 */
l_L215X3: ;/* line 7281 */
LABEL(l_L215X3);
  sim_icache_fetch(4071 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 7282 */
} /* line 7282 */
  sim_icache_fetch(4072 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 7284 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 7285 */
   ADD_CYCLES(2);
} /* line 7285 */
  sim_icache_fetch(4074 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_7); /* line 7287 */
} /* line 7287 */
  sim_icache_fetch(4075 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 7289 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7290 */
   ADD_CYCLES(1);
} /* line 7290 */
  sim_icache_fetch(4077 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L243X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7292 */
		 /* line 7293 */
  sim_icache_fetch(4078 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat64NaN);
   reg_l0_0 = (610 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat64NaN;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 7295 */
l_lr_495: ;/* line 7295 */
LABEL(l_lr_495);
  sim_icache_fetch(4080 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 116),0,4)); /* line 7297 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7298 */
   ADD_CYCLES(3);
} /* line 7298 */
  sim_icache_fetch(4082 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 128; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7301 */
l_L243X3: ;/* line 7304 */
LABEL(l_L243X3);
  sim_icache_fetch(4083 + t_thisfile.offset, 5);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_5, 0); /* line 7305 */
   MOV(reg_r0_6, 0); /* line 7306 */
   MOV(reg_r0_4, 0); /* line 7307 */
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 120),0,4)); /* line 7308 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7309 */
   ADD_CYCLES(1);
} /* line 7309 */
		 /* line 7310 */
  sim_icache_fetch(4088 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (610 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 7312 */
l_lr_498: ;/* line 7312 */
LABEL(l_lr_498);
  sim_icache_fetch(4090 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 116),0,4)); /* line 7314 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7315 */
   ADD_CYCLES(3);
} /* line 7315 */
  sim_icache_fetch(4092 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 128; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7318 */
l_L214X3: ;/* line 7321 */
LABEL(l_L214X3);
  sim_icache_fetch(4093 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7322 */
} /* line 7322 */
  sim_icache_fetch(4094 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 20),0,4)); /* line 7324 */
   INC_NOP_CNT((unsigned int) 2);
   XNOP((unsigned int) 2); /* line 7325 */
   ADD_CYCLES(2);
} /* line 7325 */
  sim_icache_fetch(4096 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   OR(reg_r0_2, reg_r0_2, reg_r0_7); /* line 7327 */
} /* line 7327 */
  sim_icache_fetch(4097 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_2, 0); /* line 7329 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7330 */
   ADD_CYCLES(1);
} /* line 7330 */
  sim_icache_fetch(4099 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L244X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7332 */
		 /* line 7333 */
  sim_icache_fetch(4100 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat64NaN);
   reg_l0_0 = (610 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat64NaN;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 7335 */
l_lr_501: ;/* line 7335 */
LABEL(l_lr_501);
  sim_icache_fetch(4102 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 116),0,4)); /* line 7337 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7338 */
   ADD_CYCLES(3);
} /* line 7338 */
  sim_icache_fetch(4104 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 128; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7341 */
l_L244X3: ;/* line 7344 */
LABEL(l_L244X3);
  sim_icache_fetch(4105 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 7345 */
} /* line 7345 */
  sim_icache_fetch(4106 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_7, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 7347 */
} /* line 7347 */
  sim_icache_fetch(4107 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDWs(reg_r0_8, mem_trace_ld((reg_r0_1 + (unsigned int) 28),0,4)); /* line 7349 */
} /* line 7349 */
  sim_icache_fetch(4108 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_b0_0, reg_r0_2, (unsigned int) 2047); /* line 7351 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7352 */
   ADD_CYCLES(1);
} /* line 7352 */
  sim_icache_fetch(4111 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_7, reg_r0_7, reg_r0_8); /* line 7354 */
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L245X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7355 */
  sim_icache_fetch(4113 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPNE(reg_b0_0, reg_r0_7, 0); /* line 7357 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7358 */
   ADD_CYCLES(1);
} /* line 7358 */
  sim_icache_fetch(4115 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L246X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7360 */
		 /* line 7361 */
  sim_icache_fetch(4116 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(propagateFloat64NaN);
   reg_l0_0 = (610 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) propagateFloat64NaN;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 7363 */
l_lr_504: ;/* line 7363 */
LABEL(l_lr_504);
  sim_icache_fetch(4118 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 116),0,4)); /* line 7365 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7366 */
   ADD_CYCLES(3);
} /* line 7366 */
  sim_icache_fetch(4120 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 128; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7369 */
l_L246X3: ;/* line 7372 */
LABEL(l_L246X3);
  sim_icache_fetch(4121 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, (unsigned int) 16); /* line 7373 */
   GOTO(l_L242X3);   INC_BTU_CNT();
   INC_STALL_CNT();
   goto l_L242X3;
} /* line 7374 */
l_L245X3: ;/* line 7377 */
LABEL(l_L245X3);
  sim_icache_fetch(4123 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_5, 0); /* line 7378 */
   MOV(reg_r0_6, 0); /* line 7379 */
   LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 120),0,4)); /* line 7380 */
} /* line 7380 */
  sim_icache_fetch(4126 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   MOV(reg_r0_4, (unsigned int) 2047); /* line 7382 */
} /* line 7382 */
		 /* line 7383 */
  sim_icache_fetch(4128 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(packFloat64);
   reg_l0_0 = (610 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) packFloat64;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 7385 */
l_lr_508: ;/* line 7385 */
LABEL(l_lr_508);
  sim_icache_fetch(4130 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 116),0,4)); /* line 7387 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7388 */
   ADD_CYCLES(3);
} /* line 7388 */
  sim_icache_fetch(4132 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_div);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 128; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7391 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 549: goto l_L217X3;
    case 550: goto l_L219X3;
    case 551: goto l_L221X3;
    case 553: goto l_lr_452;
    case 554: goto l_L222X3;
    case 555: goto l_L226X3;
    case 556: goto l_L228X3;
    case 557: goto l_L232X3;
    case 558: goto l_L234X3;
    case 560: goto l_lr_459;
    case 561: goto l_L236X3;
    case 562: goto l_L231X3;
    case 563: goto l_L230X3;
    case 564: goto l_L229X3;
    case 565: goto l_L233X3;
    case 566: goto l_L235X3;
    case 567: goto l_L238X3;
    case 568: goto l_L225X3;
    case 569: goto l_L224X3;
    case 570: goto l_L223X3;
    case 571: goto l_L227X3;
    case 572: goto l_L237X3;
    case 574: goto l_lr_473;
    case 575: goto l_L220X3;
    case 576: goto l_L218X3;
    case 578: goto l_lr_477;
    case 579: goto l_L239X3;
    case 581: goto l_lr_480;
    case 582: goto l_L216X3;
    case 583: goto l_L242X3;
    case 585: goto l_lr_484;
    case 586: goto l_L241X3;
    case 588: goto l_lr_487;
    case 590: goto l_lr_489;
    case 591: goto l_L240X3;
    case 593: goto l_lr_492;
    case 594: goto l_L215X3;
    case 596: goto l_lr_495;
    case 597: goto l_L243X3;
    case 599: goto l_lr_498;
    case 600: goto l_L214X3;
    case 602: goto l_lr_501;
    case 603: goto l_L244X3;
    case 605: goto l_lr_504;
    case 606: goto l_L246X3;
    case 607: goto l_L245X3;
    case 609: goto l_lr_508;
    case 610:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _d_eq( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_d_eq);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (615 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4133 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7434 */
   SHRU(reg_r0_2, reg_r0_3, (unsigned int) 20); /* line 7435 */
   SHRU(reg_r0_7, reg_r0_5, (unsigned int) 20); /* line 7436 */
} /* line 7436 */
  sim_icache_fetch(4136 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_2, reg_r0_2, (unsigned int) 2047); /* line 7438 */
   OR(reg_r0_8, reg_r0_3, reg_r0_5); /* line 7439 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7440 */
} /* line 7440 */
  sim_icache_fetch(4140 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_2, reg_r0_2, (unsigned int) 2047); /* line 7442 */
   AND(reg_r0_9, reg_r0_3, (unsigned int) 1048575); /* line 7443 */
} /* line 7443 */
  sim_icache_fetch(4144 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_7, reg_r0_7, (unsigned int) 2047); /* line 7445 */
   OR(reg_r0_9, reg_r0_4, reg_r0_9); /* line 7446 */
   SHL(reg_r0_8, reg_r0_8, (unsigned int) 1); /* line 7447 */
} /* line 7447 */
  sim_icache_fetch(4148 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_r0_7, reg_r0_7, (unsigned int) 2047); /* line 7449 */
   ANDL(reg_r0_2, reg_r0_2, reg_r0_9); /* line 7450 */
   NORL(reg_r0_8, reg_r0_4, reg_r0_8); /* line 7451 */
} /* line 7451 */
  sim_icache_fetch(4152 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_9, reg_r0_5, (unsigned int) 1048575); /* line 7453 */
   CMPEQ(reg_r0_11, reg_r0_4, reg_r0_6); /* line 7454 */
   CMPEQ(reg_r0_10, reg_r0_3, reg_r0_5); /* line 7455 */
} /* line 7455 */
  sim_icache_fetch(4156 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_9, reg_r0_6, reg_r0_9); /* line 7457 */
   ORL(reg_r0_10, reg_r0_10, reg_r0_8); /* line 7458 */
} /* line 7458 */
  sim_icache_fetch(4158 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ANDL(reg_r0_7, reg_r0_7, reg_r0_9); /* line 7460 */
   ANDL(reg_r0_3, reg_r0_11, reg_r0_10); /* line 7461 */
   MOV(reg_r0_8, t__i32_0); /* line 7462 */
} /* line 7462 */
  sim_icache_fetch(4161 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_b0_0, reg_r0_2, reg_r0_7); /* line 7464 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7465 */
   ADD_CYCLES(1);
} /* line 7465 */
  sim_icache_fetch(4163 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_0) {    BRANCH(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L247X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7467 */
  sim_icache_fetch(4164 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_eq);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7470 */
l_L247X3: ;/* line 7473 */
LABEL(l_L247X3);
  sim_icache_fetch(4165 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   SHRU(reg_r0_2, reg_r0_8, (unsigned int) 19); /* line 7474 */
   AND(reg_r0_7, reg_r0_8, (unsigned int) 524287); /* line 7475 */
   SHRU(reg_r0_9, reg_r0_5, (unsigned int) 19); /* line 7476 */
} /* line 7476 */
  sim_icache_fetch(4169 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_2, reg_r0_2, (unsigned int) 4095); /* line 7478 */
   ORL(reg_r0_7, reg_r0_7, reg_r0_4); /* line 7479 */
   MOV(reg_r0_3, (unsigned int) 16); /* line 7480 */
} /* line 7480 */
  sim_icache_fetch(4173 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_2, reg_r0_2, (unsigned int) 4094); /* line 7482 */
   AND(reg_r0_9, reg_r0_9, (unsigned int) 4095); /* line 7483 */
} /* line 7483 */
  sim_icache_fetch(4177 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_2, reg_r0_2, reg_r0_7); /* line 7485 */
   CMPEQ(reg_r0_9, reg_r0_9, (unsigned int) 4094); /* line 7486 */
} /* line 7486 */
  sim_icache_fetch(4180 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   AND(reg_r0_5, reg_r0_5, (unsigned int) 524287); /* line 7488 */
} /* line 7488 */
  sim_icache_fetch(4182 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_r0_5, reg_r0_5, reg_r0_6); /* line 7490 */
} /* line 7490 */
  sim_icache_fetch(4183 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ANDL(reg_r0_9, reg_r0_9, reg_r0_5); /* line 7492 */
} /* line 7492 */
  sim_icache_fetch(4184 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_b0_0, reg_r0_2, reg_r0_9); /* line 7494 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 7495 */
   ADD_CYCLES(1);
} /* line 7495 */
  sim_icache_fetch(4186 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L248X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7497 */
		 /* line 7498 */
  sim_icache_fetch(4187 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (615 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 7500 */
l_lr_512: ;/* line 7500 */
LABEL(l_lr_512);
l_L248X3: ;/* line 7502 */
LABEL(l_L248X3);
  sim_icache_fetch(4189 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, 0); /* line 7503 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7504 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7505 */
   ADD_CYCLES(3);
} /* line 7505 */
  sim_icache_fetch(4192 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_eq);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7508 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 611: goto l_L247X3;
    case 613: goto l_lr_512;
    case 614: goto l_L248X3;
    case 615:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _d_le( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_d_le);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (620 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4193 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7525 */
   SHRU(reg_r0_2, reg_r0_3, (unsigned int) 20); /* line 7526 */
   SHRU(reg_r0_7, reg_r0_5, (unsigned int) 20); /* line 7527 */
} /* line 7527 */
  sim_icache_fetch(4196 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_2, reg_r0_2, (unsigned int) 2047); /* line 7529 */
   SHRU(reg_r0_8, reg_r0_3, (unsigned int) 31); /* line 7530 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7531 */
} /* line 7531 */
  sim_icache_fetch(4200 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_2, reg_r0_2, (unsigned int) 2047); /* line 7533 */
   AND(reg_r0_9, reg_r0_3, (unsigned int) 1048575); /* line 7534 */
} /* line 7534 */
  sim_icache_fetch(4204 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_7, reg_r0_7, (unsigned int) 2047); /* line 7536 */
   OR(reg_r0_9, reg_r0_4, reg_r0_9); /* line 7537 */
   SHRU(reg_r0_10, reg_r0_5, (unsigned int) 31); /* line 7538 */
} /* line 7538 */
  sim_icache_fetch(4208 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_r0_7, reg_r0_7, (unsigned int) 2047); /* line 7540 */
   ANDL(reg_r0_2, reg_r0_2, reg_r0_9); /* line 7541 */
   CMPNE(reg_b0_0, reg_r0_8, reg_r0_10); /* line 7542 */
} /* line 7542 */
  sim_icache_fetch(4212 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_9, reg_r0_5, (unsigned int) 1048575); /* line 7544 */
   OR(reg_r0_10, reg_r0_3, reg_r0_5); /* line 7545 */
} /* line 7545 */
  sim_icache_fetch(4215 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_9, reg_r0_6, reg_r0_9); /* line 7547 */
   SHL(reg_r0_10, reg_r0_10, (unsigned int) 1); /* line 7548 */
} /* line 7548 */
  sim_icache_fetch(4217 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_7, reg_r0_7, reg_r0_9); /* line 7550 */
   OR(reg_r0_10, reg_r0_4, reg_r0_10); /* line 7551 */
} /* line 7551 */
  sim_icache_fetch(4219 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_b0_1, reg_r0_2, reg_r0_7); /* line 7553 */
   OR(reg_r0_10, reg_r0_10, reg_r0_6); /* line 7554 */
} /* line 7554 */
  sim_icache_fetch(4221 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   CMPEQ(reg_r0_10, reg_r0_10, 0); /* line 7556 */
} /* line 7556 */
  sim_icache_fetch(4222 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ORL(reg_r0_3, reg_r0_8, reg_r0_10); /* line 7558 */
   MOV(reg_r0_2, t__i32_0); /* line 7559 */
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L249X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7560 */
  sim_icache_fetch(4225 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L250X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7562 */
  sim_icache_fetch(4226 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_le);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7565 */
l_L250X3: ;/* line 7568 */
LABEL(l_L250X3);
  sim_icache_fetch(4227 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_10, reg_r0_5, reg_r0_2); /* line 7569 */
   CMPEQ(reg_r0_7, reg_r0_5, reg_r0_2); /* line 7570 */
   CMPEQ(reg_r0_11, reg_r0_2, reg_r0_5); /* line 7571 */
   CMPLEU(reg_r0_9, reg_r0_6, reg_r0_4); /* line 7572 */
} /* line 7572 */
  sim_icache_fetch(4231 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_2, reg_r0_2, reg_r0_5); /* line 7574 */
   ANDL(reg_r0_7, reg_r0_7, reg_r0_9); /* line 7575 */
   CMPLEU(reg_r0_4, reg_r0_4, reg_r0_6); /* line 7576 */
   MTB(reg_b0_0, reg_r0_8); /* line 7577 */
} /* line 7577 */
  sim_icache_fetch(4235 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_r0_10, reg_r0_10, reg_r0_7); /* line 7579 */
   ANDL(reg_r0_11, reg_r0_11, reg_r0_4); /* line 7580 */
} /* line 7580 */
  sim_icache_fetch(4237 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_r0_2, reg_r0_2, reg_r0_11); /* line 7582 */
} /* line 7582 */
  sim_icache_fetch(4238 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_3, reg_b0_0, reg_r0_10, reg_r0_2); /* line 7585 */
   RETURN(_d_le);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7586 */
l_L249X3: ;/* line 7589 */
LABEL(l_L249X3);
		 /* line 7589 */
  sim_icache_fetch(4240 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, (unsigned int) 16); /* line 7592 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (620 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 7592 */
l_lr_518: ;/* line 7592 */
LABEL(l_lr_518);
  sim_icache_fetch(4243 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, 0); /* line 7594 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7595 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7596 */
   ADD_CYCLES(3);
} /* line 7596 */
  sim_icache_fetch(4246 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_le);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7599 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 616: goto l_L250X3;
    case 617: goto l_L249X3;
    case 619: goto l_lr_518;
    case 620:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _d_lt( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_d_lt);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (625 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4247 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7616 */
   SHRU(reg_r0_2, reg_r0_3, (unsigned int) 20); /* line 7617 */
   SHRU(reg_r0_7, reg_r0_5, (unsigned int) 20); /* line 7618 */
} /* line 7618 */
  sim_icache_fetch(4250 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_2, reg_r0_2, (unsigned int) 2047); /* line 7620 */
   SHRU(reg_r0_8, reg_r0_3, (unsigned int) 31); /* line 7621 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7622 */
} /* line 7622 */
  sim_icache_fetch(4254 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_2, reg_r0_2, (unsigned int) 2047); /* line 7624 */
   AND(reg_r0_9, reg_r0_3, (unsigned int) 1048575); /* line 7625 */
} /* line 7625 */
  sim_icache_fetch(4258 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   AND(reg_r0_7, reg_r0_7, (unsigned int) 2047); /* line 7627 */
   OR(reg_r0_9, reg_r0_4, reg_r0_9); /* line 7628 */
   SHRU(reg_r0_10, reg_r0_5, (unsigned int) 31); /* line 7629 */
} /* line 7629 */
  sim_icache_fetch(4262 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   CMPEQ(reg_r0_7, reg_r0_7, (unsigned int) 2047); /* line 7631 */
   ANDL(reg_r0_2, reg_r0_2, reg_r0_9); /* line 7632 */
   CMPNE(reg_b0_0, reg_r0_8, reg_r0_10); /* line 7633 */
} /* line 7633 */
  sim_icache_fetch(4266 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   AND(reg_r0_9, reg_r0_5, (unsigned int) 1048575); /* line 7635 */
   OR(reg_r0_10, reg_r0_3, reg_r0_5); /* line 7636 */
} /* line 7636 */
  sim_icache_fetch(4269 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   OR(reg_r0_9, reg_r0_6, reg_r0_9); /* line 7638 */
   SHL(reg_r0_10, reg_r0_10, (unsigned int) 1); /* line 7639 */
} /* line 7639 */
  sim_icache_fetch(4271 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_7, reg_r0_7, reg_r0_9); /* line 7641 */
   OR(reg_r0_10, reg_r0_4, reg_r0_10); /* line 7642 */
} /* line 7642 */
  sim_icache_fetch(4273 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_b0_1, reg_r0_2, reg_r0_7); /* line 7644 */
   OR(reg_r0_10, reg_r0_10, reg_r0_6); /* line 7645 */
} /* line 7645 */
  sim_icache_fetch(4275 + t_thisfile.offset, 2);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ANDL(reg_r0_3, reg_r0_8, reg_r0_10); /* line 7647 */
   MOV(reg_r0_2, t__i32_0); /* line 7648 */
} /* line 7648 */
  sim_icache_fetch(4277 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (reg_b0_1) {    BRANCH(reg_b0_1);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L251X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7650 */
  sim_icache_fetch(4278 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   if (!reg_b0_0) {    BRANCHF(reg_b0_0);
      INC_BTC_CNT();
      INC_STALL_CNT();
      goto l_L252X3; 
   } else {
      INC_BNT_CNT();
   }
} /* line 7652 */
  sim_icache_fetch(4279 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_lt);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7655 */
l_L252X3: ;/* line 7658 */
LABEL(l_L252X3);
  sim_icache_fetch(4280 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_10, reg_r0_5, reg_r0_2); /* line 7659 */
   CMPEQ(reg_r0_7, reg_r0_5, reg_r0_2); /* line 7660 */
   CMPEQ(reg_r0_11, reg_r0_2, reg_r0_5); /* line 7661 */
   CMPLTU(reg_r0_9, reg_r0_6, reg_r0_4); /* line 7662 */
} /* line 7662 */
  sim_icache_fetch(4284 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   CMPLTU(reg_r0_2, reg_r0_2, reg_r0_5); /* line 7664 */
   ANDL(reg_r0_7, reg_r0_7, reg_r0_9); /* line 7665 */
   CMPLTU(reg_r0_4, reg_r0_4, reg_r0_6); /* line 7666 */
   MTB(reg_b0_0, reg_r0_8); /* line 7667 */
} /* line 7667 */
  sim_icache_fetch(4288 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ORL(reg_r0_10, reg_r0_10, reg_r0_7); /* line 7669 */
   ANDL(reg_r0_11, reg_r0_11, reg_r0_4); /* line 7670 */
} /* line 7670 */
  sim_icache_fetch(4290 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ORL(reg_r0_2, reg_r0_2, reg_r0_11); /* line 7672 */
} /* line 7672 */
  sim_icache_fetch(4291 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   SLCT(reg_r0_3, reg_b0_0, reg_r0_10, reg_r0_2); /* line 7675 */
   RETURN(_d_lt);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7676 */
l_L251X3: ;/* line 7679 */
LABEL(l_L251X3);
		 /* line 7679 */
  sim_icache_fetch(4293 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, (unsigned int) 16); /* line 7682 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float_raise);
   reg_l0_0 = (625 << 5);
   {
    typedef void t_FT (unsigned int);
    t_FT *t_call = (t_FT*) float_raise;
    (*t_call)(reg_r0_3);
   }
} /* line 7682 */
l_lr_523: ;/* line 7682 */
LABEL(l_lr_523);
  sim_icache_fetch(4296 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_3, 0); /* line 7684 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7685 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7686 */
   ADD_CYCLES(3);
} /* line 7686 */
  sim_icache_fetch(4299 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_lt);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7689 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 621: goto l_L252X3;
    case 622: goto l_L251X3;
    case 624: goto l_lr_523;
    case 625:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_neg( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_neg);
  sim_check_stack(reg_r0_1, 0); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (626 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4300 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   XOR(reg_r0_3, reg_r0_3, (unsigned int) -2147483648); /* line 7707 */
} /* line 7707 */
  sim_icache_fetch(4302 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_neg);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + 0; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7710 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 626:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_recip( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_recip);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (629 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4303 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7725 */
   MOV(reg_r0_4, reg_r0_3); /* line 7726 */
} /* line 7726 */
		 /* line 7727 */
  sim_icache_fetch(4305 + t_thisfile.offset, 5);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7730 */
   MOV(reg_r0_3, (unsigned int) 1065353216); /* line 7731 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(_r_div);
   reg_l0_0 = (629 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) _r_div;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 7731 */
l_lr_527: ;/* line 7731 */
LABEL(l_lr_527);
  sim_icache_fetch(4310 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7733 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7734 */
   ADD_CYCLES(3);
} /* line 7734 */
  sim_icache_fetch(4312 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_recip);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7737 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 628: goto l_lr_527;
    case 629:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_ne( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_ne);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (632 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4313 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7754 */
} /* line 7754 */
		 /* line 7755 */
  sim_icache_fetch(4314 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7758 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(_r_eq);
   reg_l0_0 = (632 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) _r_eq;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 7758 */
l_lr_530: ;/* line 7758 */
LABEL(l_lr_530);
  sim_icache_fetch(4317 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_3, reg_r0_3, 0); /* line 7760 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7761 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7762 */
   ADD_CYCLES(3);
} /* line 7762 */
  sim_icache_fetch(4320 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_ne);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7765 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 631: goto l_lr_530;
    case 632:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_gt( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_gt);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (635 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4321 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7782 */
   MOV(reg_r0_3, reg_r0_4); /* line 7783 */
   MOV(reg_r0_2, t__i32_0); /* line 7784 */
} /* line 7784 */
		 /* line 7785 */
  sim_icache_fetch(4324 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7788 */
   MOV(reg_r0_4, reg_r0_2); /* line 7789 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(_r_lt);
   reg_l0_0 = (635 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) _r_lt;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 7789 */
l_lr_533: ;/* line 7789 */
LABEL(l_lr_533);
  sim_icache_fetch(4328 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7791 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7792 */
   ADD_CYCLES(3);
} /* line 7792 */
  sim_icache_fetch(4330 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_gt);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7795 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 634: goto l_lr_533;
    case 635:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_ge( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_ge);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (638 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4331 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7812 */
   MOV(reg_r0_3, reg_r0_4); /* line 7813 */
   MOV(reg_r0_2, t__i32_0); /* line 7814 */
} /* line 7814 */
		 /* line 7815 */
  sim_icache_fetch(4334 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7818 */
   MOV(reg_r0_4, reg_r0_2); /* line 7819 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(_r_le);
   reg_l0_0 = (638 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) _r_le;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 7819 */
l_lr_536: ;/* line 7819 */
LABEL(l_lr_536);
  sim_icache_fetch(4338 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7821 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7822 */
   ADD_CYCLES(3);
} /* line 7822 */
  sim_icache_fetch(4340 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_ge);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7825 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 637: goto l_lr_536;
    case 638:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern sim_result_1_t _d_neg( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(_d_neg);
  sim_check_stack(reg_r0_1, 0); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (639 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4341 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   XOR(reg_r0_3, reg_r0_3, (unsigned int) -2147483648); /* line 7843 */
} /* line 7843 */
  sim_icache_fetch(4343 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_neg);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + 0; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7846 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 639:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern sim_result_1_t _d_recip( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
  sim_result_1_t t_sim_result_1_t_0;
   ENTRY(_d_recip);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (642 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4344 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7861 */
   MOV(reg_r0_6, reg_r0_4); /* line 7862 */
   MOV(reg_r0_5, reg_r0_3); /* line 7863 */
} /* line 7863 */
  sim_icache_fetch(4347 + t_thisfile.offset, 4);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   MOV(reg_r0_4, 0); /* line 7865 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7866 */
   MOV(reg_r0_3, (unsigned int) 1072693248); /* line 7867 */
} /* line 7867 */
		 /* line 7868 */
  sim_icache_fetch(4351 + t_thisfile.offset, 2);
{
  sim_result_1_t t_sim_result_1_t;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(_d_div);
   reg_l0_0 = (642 << 5);
   {
    typedef sim_result_1_t t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) _d_div;
    t_sim_result_1_t =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
    reg_r0_3 = t_sim_result_1_t.alias0;
    reg_r0_4 = t_sim_result_1_t.alias1;
   }
} /* line 7870 */
l_lr_540: ;/* line 7870 */
LABEL(l_lr_540);
  sim_icache_fetch(4353 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7872 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7873 */
   ADD_CYCLES(3);
} /* line 7873 */
  sim_icache_fetch(4355 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_recip);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7876 */
  reg_l0_0 = t_client_rpc;
  t_sim_result_1_t_0.alias0 = reg_r0_3;
  t_sim_result_1_t_0.alias1 = reg_r0_4;
  return t_sim_result_1_t_0;

labelfinder:
  switch (t_labelnum >> 5) {
    case 641: goto l_lr_540;
    case 642:
      reg_l0_0 = t_client_rpc;
      t_sim_result_1_t_0.alias0 = reg_r0_3;
      t_sim_result_1_t_0.alias1 = reg_r0_4;
      return t_sim_result_1_t_0;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _d_ne( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_d_ne);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (645 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4356 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7893 */
} /* line 7893 */
		 /* line 7894 */
  sim_icache_fetch(4357 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7897 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(_d_eq);
   reg_l0_0 = (645 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) _d_eq;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
   }
} /* line 7897 */
l_lr_543: ;/* line 7897 */
LABEL(l_lr_543);
  sim_icache_fetch(4360 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   CMPEQ(reg_r0_3, reg_r0_3, 0); /* line 7899 */
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7900 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7901 */
   ADD_CYCLES(3);
} /* line 7901 */
  sim_icache_fetch(4363 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_ne);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7904 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 644: goto l_lr_543;
    case 645:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _d_gt( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_d_gt);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (648 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4364 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_4 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7921 */
   MOV(reg_r0_4, reg_r0_6); /* line 7922 */
   MOV(reg_r0_2, t__i32_0); /* line 7923 */
} /* line 7923 */
  sim_icache_fetch(4367 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_3, reg_r0_5); /* line 7925 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7926 */
   MOV(reg_r0_7, t__i32_0); /* line 7927 */
   MOV(reg_r0_6, reg_r0_2); /* line 7928 */
} /* line 7928 */
		 /* line 7929 */
  sim_icache_fetch(4371 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_5, reg_r0_7); /* line 7932 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(_d_lt);
   reg_l0_0 = (648 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) _d_lt;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
   }
} /* line 7932 */
l_lr_546: ;/* line 7932 */
LABEL(l_lr_546);
  sim_icache_fetch(4374 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7934 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7935 */
   ADD_CYCLES(3);
} /* line 7935 */
  sim_icache_fetch(4376 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_gt);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7938 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 647: goto l_lr_546;
    case 648:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _d_ge( unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_d_ge);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_r0_5 =  arg2; 
  reg_r0_6 =  arg3; 
  reg_l0_0 = (651 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4377 + t_thisfile.offset, 3);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_4 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(3);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7955 */
   MOV(reg_r0_4, reg_r0_6); /* line 7956 */
   MOV(reg_r0_2, t__i32_0); /* line 7957 */
} /* line 7957 */
  sim_icache_fetch(4380 + t_thisfile.offset, 4);
{
  unsigned int t__i32_0;
  t__i32_0 = reg_r0_3 ;
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(4);
   MOV(reg_r0_3, reg_r0_5); /* line 7959 */
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7960 */
   MOV(reg_r0_7, t__i32_0); /* line 7961 */
   MOV(reg_r0_6, reg_r0_2); /* line 7962 */
} /* line 7962 */
		 /* line 7963 */
  sim_icache_fetch(4384 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   MOV(reg_r0_5, reg_r0_7); /* line 7966 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(_d_le);
   reg_l0_0 = (651 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) _d_le;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6);
   }
} /* line 7966 */
l_lr_549: ;/* line 7966 */
LABEL(l_lr_549);
  sim_icache_fetch(4387 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7968 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7969 */
   ADD_CYCLES(3);
} /* line 7969 */
  sim_icache_fetch(4389 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_ge);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 7972 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 650: goto l_lr_549;
    case 651:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_fix( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_fix);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (654 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4390 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 7989 */
   MOV(reg_r0_4, (unsigned int) 1); /* line 7990 */
} /* line 7990 */
		 /* line 7991 */
  sim_icache_fetch(4392 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 7994 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float32_to_int32_round_to_zero);
   reg_l0_0 = (654 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) float32_to_int32_round_to_zero;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 7994 */
l_lr_552: ;/* line 7994 */
LABEL(l_lr_552);
  sim_icache_fetch(4395 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 7996 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 7997 */
   ADD_CYCLES(3);
} /* line 7997 */
  sim_icache_fetch(4397 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_fix);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 8000 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 653: goto l_lr_552;
    case 654:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _r_ufix( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_r_ufix);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (657 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4398 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 8017 */
   MOV(reg_r0_4, 0); /* line 8018 */
} /* line 8018 */
		 /* line 8019 */
  sim_icache_fetch(4400 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 8022 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float32_to_int32_round_to_zero);
   reg_l0_0 = (657 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) float32_to_int32_round_to_zero;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4);
   }
} /* line 8022 */
l_lr_555: ;/* line 8022 */
LABEL(l_lr_555);
  sim_icache_fetch(4403 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 8024 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 8025 */
   ADD_CYCLES(3);
} /* line 8025 */
  sim_icache_fetch(4405 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_r_ufix);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 8028 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 656: goto l_lr_555;
    case 657:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _d_fix( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_d_fix);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (660 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4406 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 8045 */
   MOV(reg_r0_5, (unsigned int) 1); /* line 8046 */
} /* line 8046 */
		 /* line 8047 */
  sim_icache_fetch(4408 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 8050 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float64_to_int32_round_to_zero);
   reg_l0_0 = (660 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) float64_to_int32_round_to_zero;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 8050 */
l_lr_558: ;/* line 8050 */
LABEL(l_lr_558);
  sim_icache_fetch(4411 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 8052 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 8053 */
   ADD_CYCLES(3);
} /* line 8053 */
  sim_icache_fetch(4413 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_fix);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 8056 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 659: goto l_lr_558;
    case 660:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int _d_ufix( unsigned int arg0, unsigned int arg1 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(_d_ufix);
  sim_check_stack(reg_r0_1, -32); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_r0_4 =  arg1; 
  reg_l0_0 = (663 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4414 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 8073 */
   MOV(reg_r0_5, 0); /* line 8074 */
} /* line 8074 */
		 /* line 8075 */
  sim_icache_fetch(4416 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(2);
   STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_l0_0); /* line 8078 */
   INC_BTU_CNT();
   INC_STALL_CNT();
   CALL(float64_to_int32_round_to_zero);
   reg_l0_0 = (663 << 5);
   {
    typedef unsigned int t_FT (unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) float64_to_int32_round_to_zero;
    reg_r0_3 =     (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5);
   }
} /* line 8078 */
l_lr_561: ;/* line 8078 */
LABEL(l_lr_561);
  sim_icache_fetch(4419 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 8080 */
   INC_NOP_CNT((unsigned int) 3);
   XNOP((unsigned int) 3); /* line 8081 */
   ADD_CYCLES(3);
} /* line 8081 */
  sim_icache_fetch(4421 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(_d_ufix);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 32; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 8084 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 662: goto l_lr_561;
    case 663:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int fpgetround(  )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(fpgetround);
  sim_check_stack(reg_r0_1, 0); 

  t_client_rpc = reg_l0_0; 
  reg_l0_0 = (664 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4422 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((unsigned int) _X1PACKETX2,0,4)); /* line 8102 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 8103 */
   ADD_CYCLES(1);
} /* line 8103 */
  sim_icache_fetch(4425 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(fpgetround);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + 0; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 8106 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 664:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int fpsetround( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(fpsetround);
  sim_check_stack(reg_r0_1, 0); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (665 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4426 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((unsigned int) _X1PACKETX2,0,4), reg_r0_3); /* line 8122 */
} /* line 8122 */
  sim_icache_fetch(4428 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(fpsetround);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + 0; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 8125 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 665:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int fpgetmask(  )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(fpgetmask);
  sim_check_stack(reg_r0_1, 0); 

  t_client_rpc = reg_l0_0; 
  reg_l0_0 = (666 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4429 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((unsigned int) _X1PACKETX4,0,4)); /* line 8141 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 8142 */
   ADD_CYCLES(1);
} /* line 8142 */
  sim_icache_fetch(4432 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(fpgetmask);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + 0; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 8145 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 666:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int fpsetmask( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(fpsetmask);
  sim_check_stack(reg_r0_1, 0); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (667 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4433 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((unsigned int) _X1PACKETX4,0,4), reg_r0_3); /* line 8161 */
} /* line 8161 */
  sim_icache_fetch(4435 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(fpsetmask);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + 0; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 8164 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 667:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int fpgetsticky(  )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(fpgetsticky);
  sim_check_stack(reg_r0_1, 0); 

  t_client_rpc = reg_l0_0; 
  reg_l0_0 = (668 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4436 + t_thisfile.offset, 3);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   LDW(reg_r0_3, mem_trace_ld((unsigned int) _X1PACKETX3,0,4)); /* line 8180 */
   INC_NOP_CNT((unsigned int) 1);
   XNOP((unsigned int) 1); /* line 8181 */
   ADD_CYCLES(1);
} /* line 8181 */
  sim_icache_fetch(4439 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(fpgetsticky);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + 0; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 8184 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 668:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int fpsetsticky( unsigned int arg0 )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   ENTRY(fpsetsticky);
  sim_check_stack(reg_r0_1, 0); 

  t_client_rpc = reg_l0_0; 
  reg_r0_3 =  arg0; 
  reg_l0_0 = (669 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(4440 + t_thisfile.offset, 2);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   STW(mem_trace_st((unsigned int) _X1PACKETX3,0,4), reg_r0_3); /* line 8200 */
} /* line 8200 */
  sim_icache_fetch(4442 + t_thisfile.offset, 1);
{
   ADD_CYCLES(1);
   INC_BUNDLE_CNT(1);
   RETURN(fpsetsticky);   INC_BTU_CNT();
   INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + 0; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 8203 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 669:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}


static sim_fileinfo_t t_thisfile = {"floatlib.s", 4448, 0, 0, 0, 2};

