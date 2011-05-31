#ifndef _FUNCTIONS
#define FUNCTIONS

#include "galaxy.h"
#include "galaxyConfig.h"

#ifdef API
/*#include "galaxyConfig_STATIC.h"*/
#include "vtapi.h"
#endif

/* deepstate defines */
#define READY                 0
#define RUNNING               1
#define BLOCKED_MUTEX_LOCK    2
#define TERMINATED_ASYNC_HOST 3
#define TERMINATED_ASYNC      4
#define TERMINATED_SYNC       5

#define PIPELINE_REFILL       3
#define STACK_SIZE            8 /* KB */

#define MAX_GALAXIES          1
#define MAX_SYSTEMS           16 /* per galaxy */
#define MAX_CONTEXTS          16 /* per system */
#define MAX_HYPERCONTEXT      16 /* per context */
#define MAX_CLUSTERS          16 /* per context */


unsigned memAlign;

typedef struct {
  unsigned op;
  unsigned imm;
  unsigned char immValid;
  unsigned int nextPC;
} instructionPacket;

typedef enum {
  _R_iss,
  _B_iss,
  _L_iss,
  _MEM_iss,
  _NUL_iss
} targetT;

typedef enum {
  GOTO,CALL,ENTRY,RETURN,BRANCH,BRANCHF,LDSB,LDUB,LDSH,LDUH,
  LDHU,LDW,STB,STH,STW,MLSL,MLUL,MLSH,MLUH,MLSLL,
  MLULL,MLSLH,MLULH,MLSHH,MLUHH,ADD,AND,ANDC,ANDL,CMPEQ,
  CMPGES,CMPGEU,CMPGTS,CMPGTU,CMPLES,CMPLEU,CMPLTS,CMPLTU,CMPNE,MAXS,
  MAXU,MINS,MINU,MFB,MFL,MOV,MTL,MTB,MTBF,MPY,
  NANDL,NOP,NORL,ORL,OR,ORC,PFT,SBIT,SBITF,SH1ADD,
  SH2ADD,SH3ADD,SH4ADD,SHL,SHRS,SHRU,SWBT,SWBF,SUB,SEXTB,
  SEXTH,TBIT,TBITF,XNOP,XOR,ZEXTB,ZEXTH,ADDCG,DIVS,RSUB,
  MVL2G,MVG2L,HALT,CUSTOM,LDL,PSYSCALL,STL,GOTOL,CALLL,SYSCALL,
  RFI,RDCTRL,WRCTRL,MLSHS,CPUID
} opT;

typedef enum {
  mLDSB, mLDBs, mLDUB, mLDSH, mLDUH, mLDW, mSTB, mSTBs, mSTH, mSTW
} memOpT;

typedef struct {
  unsigned target;
  targetT addr;
  unsigned data;
  opT opcode;
  int source1, source2, source3, source4, source5, source6;
  unsigned int target1, target2, target3, target4, target5;
  targetT addr2;
  unsigned data2;

  unsigned newPC;
  unsigned char newPCValid;
} packetT;

typedef struct {
  unsigned char is;
  unsigned char cs;
  unsigned char format;
  unsigned char opc;
  unsigned char b;

  packetT packet;
} instruction;

struct memReqT {
  unsigned *pointer;
  unsigned value;
  unsigned ctrlReg;
  memOpT memOp;
  struct memReqT *next;
};

struct newThreadT {
  unsigned from;
  unsigned to;
  struct newThreadT *next;
};

unsigned *loadBinary(char *, unsigned);
int cycle(contextT *, hyperContextT *, unsigned);
int printCounts(hyperContextT *);
unsigned checkActive(void);
instructionPacket fetchInstruction(contextT *, unsigned);
unsigned checkBundle(hyperContextT *, unsigned, unsigned);
instruction instructionDecode(unsigned, unsigned, /*unsigned *,*/ hyperContextT *, systemT *, contextT *, unsigned);
packetT getOp(unsigned, unsigned, unsigned, unsigned, /*unsigned *,*/ hyperContextT *, systemT *, contextT *, unsigned);
void memRequest(systemT *, unsigned *, unsigned, unsigned, memOpT);
int memoryDump(unsigned, unsigned, unsigned *);
void newThreadRequest(unsigned, unsigned, systemT *);

int serviceThreadRequests(systemT *);

void serviceMemRequest(systemT *, unsigned, unsigned, unsigned);
void serviceMemRequestPERFECT(systemT *, unsigned);

void returnOpcode(opT);
void printOut(instruction, instructionPacket, hyperContextT *, unsigned long long);
int setupGalaxy(void);
int freeMem(void);

#ifdef API
/* function to step through a single cycle (all systems, context, hypercontexts */
/*typedef int gTracePacketT;*/
int insizzleAPIClock(galaxyConfigT *, hcTracePacketT gTracePacket[][MASTERCFG_CONTEXTS_MAX][MASTERCFG_HYPERCONTEXTS_MAX]);

/* read/write registers */
int insizzleAPIWrOneSGpr(unsigned, unsigned);
int insizzleAPIRdOneSGpr(unsigned, unsigned *);

int insizzleAPIRdOneLr(galaxyConfigT *, unsigned *);
int insizzleAPIWrOneLr(galaxyConfigT *, unsigned);

int insizzleAPIRdOneBr(unsigned, unsigned *);
int insizzleAPIWrOneBr(unsigned, unsigned);

/* read/write CTRL registers */
int insizzleAPIRdCtrl(galaxyConfigT *, unsigned *);
int insizzleAPIWrCtrl(galaxyConfigT *, unsigned);

/* read/write memory */
int insizzleAPIWrOneIramLocation (galaxyConfigT *, unsigned, unsigned);
int insizzleAPIRdOneIramLocation (galaxyConfigT *, unsigned, unsigned *);

int insizzleAPIWrOneDramLocation (galaxyConfigT *, unsigned, unsigned);
int insizzleAPIRdOneDramLocation (galaxyConfigT *, unsigned, unsigned *);

/* load iram/dram */
void insizzleAPILdIRAM(char *, int);
void insizzleAPILdDRAM(char *, int);

/* setup global pointers to current CPU */
int insizzleAPISetCurrent(unsigned, unsigned, unsigned, unsigned);

/* initialise system */
int insizzleAPIStubInitVtApi(galaxyConfigT *);

/* write program counter */
int insizzleAPIWrPC(galaxyConfigT *, unsigned);
int insizzleAPIRdPC(galaxyConfigT *, unsigned *);

systemT *globalS;
contextT *globalC;
hyperContextT *globalHC;
clusterT *globalCL;

unsigned globalSid, globalCid, globalHCid, globalCLid;

void driver(void);

#endif

#endif
