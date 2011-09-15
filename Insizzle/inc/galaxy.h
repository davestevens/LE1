#ifndef _GALAXY
#define _GALAXY

/* this is the data storage */

#define PIPELINE_REFILL 3

/* per cluster */
typedef struct {
  /* pointers to registers on a per cluster level */
  unsigned *S_GPR;
  unsigned *S_FPR;
  unsigned *S_VR;
  unsigned char *S_PR;

  unsigned *pS_GPR;
  unsigned *pS_FPR;
  unsigned *pS_VR;
  unsigned char *pS_PR;

  } clusterT;

/* per hyperContext */
typedef struct {
  unsigned *S_GPR; /* general purpose */
  unsigned *S_FPR; /* floating point */
  unsigned *S_VR; /* vector/rotating */
  unsigned char *S_PR; /* predicate */

  unsigned *pS_GPR; /* general purpose */
  unsigned *pS_FPR; /* floating point */
  unsigned *pS_VR; /* vector/rotating */
  unsigned char *pS_PR; /* predicate */

  /* counts of registers */
  unsigned sGPRCount;
  unsigned sFPRCount;
  unsigned sVRCount;
  unsigned sPRCount;

  unsigned linkReg; /* link register */
  unsigned plinkReg; /* link register */

  unsigned VT_CTRL; /* current state */
  /*unsigned state;*/ /* micro-architecture state */
  unsigned long long stalled;
  int checkedPC;

  unsigned long long cycleCount;
  unsigned long long stallCount;
  unsigned long long decodeStallCount;
  unsigned long long *bundleCount;
  unsigned long long branchTaken;
  unsigned long long branchNotTaken;
  unsigned long long nopCount;
  unsigned long long idleCount;
  unsigned long long memoryAccessCount;

  unsigned long long controlFlowChange;

  unsigned programCounter;

  unsigned totalWidth;
  unsigned numClusters;
  unsigned joinWaiting;

  clusterT *registers;

} hyperContextT;

/* per context */
typedef struct {

  unsigned *iram;
  hyperContextT *hypercontext;

  unsigned numHyperContext;

} contextT;

/* per system */
typedef struct {

  contextT *context;
  unsigned *dram;

  struct memReqT *memReq;

  struct newThreadT *threadReq;

  unsigned numContext;
} systemT;

systemT *galaxyT;

typedef struct {
  unsigned parent_cpu;
  unsigned parent_thread;
  unsigned running_cpu;
  unsigned mutex_mask;
} threadControlUnitT;

#endif
