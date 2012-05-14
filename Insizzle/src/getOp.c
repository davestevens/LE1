#include <stdio.h>
#include "functions.h"
#include "macros.h"
#include "pcre_split.h"
#include <stdlib.h>

void insertSource(sourceReg *, regT, unsigned short, unsigned char, unsigned, unsigned char);
void insertDest(destReg *, regT, unsigned char, unsigned short, unsigned char, unsigned char, unsigned);

packetT getOp(unsigned format, unsigned opc, unsigned inst, unsigned immediate, /*unsigned *dataP,*/ hyperContextT *hypercontext, systemT *system, contextT *context, unsigned VT_CTRL, unsigned dramSize)
{
  unsigned clust = VT_CTRL; /* TODO: Remove this */
  unsigned extra;
  packetT ret;
  unsigned i;

  unsigned *S_GPR, *pS_GPR;
  unsigned *S_FPR, *pS_FPR;
  unsigned *S_VR, *pS_VR;
  unsigned char *S_PR, *pS_PR;

  clusterT *cluster;

  unsigned *S_L = &(hypercontext->linkReg);
  unsigned *pS_L = &(hypercontext->plinkReg);

  unsigned ldwVal = 0;
  unsigned lduhVal = 0;
  unsigned ldshVal = 0;
  unsigned ldubVal = 0;
  unsigned ldsbVal = 0;
  unsigned ldlVal = 0;

  ret.target = 0;
  ret.addr = 0;
  ret.data = 0;
  ret.opcode = 0;
  ret.source1 = 0;
  ret.source2 = 0;
  ret.source3 = 0;
  ret.source4 = 0;
  ret.source5 = 0;
  ret.source6 = 0;
  ret.target1 = 0;
  ret.target2 = 0;
  ret.target3 = 0;
  ret.target4 = 0;
  ret.target5 = 0;
  ret.addr2 = 0;
  ret.data2 = 0;
  ret.newPC = 0;
  ret.newPCValid = 0;

  ret.executed = 1;
  ret.maddr = 0;
  ret.maddrValid = 0;
  for(i=0;i<7;i++) {
    ret.source[i].target = 0;
    ret.source[i].reg = 0;
    ret.source[i].valid = 0;
    ret.source[i].value = 0;
    ret.source[i].cluster = 0;
  }
  for(i=0;i<5;i++) {
    ret.dest[i].target = 0;
    ret.dest[i].chk = 0;
    ret.dest[i].reg = 0;
    ret.dest[i].valid = 0;
    ret.dest[i].cluster = 0;
    ret.dest[i].res = 0;
  }

  /* TODO: this is max 2 at the moment */
  for(clust=0;clust<hypercontext->numClusters;clust++)
    {
      cluster = (clusterT *)((unsigned)hypercontext->registers + (clust * sizeof(clusterT)));

      /* set up register pointers */
      S_GPR = cluster->S_GPR;
      S_FPR = cluster->S_FPR;
      S_VR = cluster->S_VR;
      S_PR = cluster->S_PR;

      pS_GPR = cluster->pS_GPR;
      pS_FPR = cluster->pS_FPR;
      pS_VR = cluster->pS_VR;
      pS_PR = cluster->pS_PR;

#ifdef DEBUG
      printf("cluster: %d\nr1: 0x%x\n", clust, *(S_GPR + 1));
      printf("cluster: %d\nr1: 0x%x\n", clust, *(pS_GPR + 1));
#endif
      /* TODO: need to work out clusters, need to read the cs bit in 'inst' */

      if(((inst >> 30) & 0x1) == clust)
	{
#ifdef DEBUG
	  printf("FORMAT: %d\n", format);
#endif
	  switch(format)
	    {
	    case 0:
	      ret.addr = _R_iss;
	      ret.target = (inst >> 15) & 0x3f;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = *(pS_GPR + ((inst >> 6) & 0x3f));

	      switch(opc)
		{
		case 0:
		  if(!((inst >> 15) & 0x3f))
		    {
		      /* if rd is r0 then this is a NOP */
		      ret.opcode = NOP;
		      ret.addr = _NUL_iss;
		      ret.target = -1;
		      ret.data = 0;
		    }
		  else
		    {
		      ret.opcode = ADD;
		      ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		    }
		  break;
		case 1:
		  ret.opcode = AND;
		  AND(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 2:
		  ret.opcode = ANDC;
		  ANDC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 3:
		  ret.opcode = MAXS;
		  MAXS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 4:
		  ret.opcode = MAXU;
		  MAXU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 5:
		  ret.opcode = MINS;
		  MINS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 6:
		  ret.opcode = MINU;
		  MINU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 7:
		  ret.opcode = OR;
		  OR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 8:
		  ret.opcode = ORC;
		  ORC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 9:
		  ret.opcode = SH1ADD;
		  SH1ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 10:
		  ret.opcode = SH2ADD;
		  SH2ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 11:
		  ret.opcode = SH3ADD;
		  SH3ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 12:
		  ret.opcode = SH4ADD;
		  SH4ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 13:
		  ret.opcode = SHL;
		  SHL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 14:
		  ret.opcode = SHRS;
		  SHRS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 15:
		  ret.opcode = SHRU;
		  SHRU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 16:
		  ret.opcode = SUB;
		  SUB(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 17:
		  ret.opcode = XOR;
		  XOR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 18:
		  ret.opcode = MLSLL;
		  MLSLL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 19:
		  ret.opcode = MLULL;
		  MLULL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 20:
		  ret.opcode = MLSLH;
		  MLSLH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 21:
		  ret.opcode = MLULH;
		  MLULH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 22:
		  ret.opcode = MLSHH;
		  MLSHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 23:
		  ret.opcode = MLUHH;
		  MLUHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 24:
		  ret.opcode = MLSL;
		  MLSL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 25:
		  ret.opcode = MLUL;
		  MLUL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 26:
		  ret.opcode = MLSH;
		  MLSH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 27:
		  ret.opcode = MLUH;
		  MLUH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 28:
		  ret.opcode = MLSHS;
		  MLSHS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 29:
		  ret.opcode = SWBT;
		  ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		  SWBT(*(S_GPR + (ret.target)), ret.source3, ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 30:
		  ret.opcode = SWBF;
		  ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		  SWBF(*(S_GPR + (ret.target)), ret.source3, ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		case 31:
		  ret.opcode = RSUB;
		  RSUB(*(S_GPR + (ret.target)), ret.source2, ret.source1);
		  ret.data = *(S_GPR + (ret.target));
		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 5) & 0x3f), 1, clust, *(S_GPR + ((inst >> 5) & 0x3f)));
		  break;
		default:
		  /*ret.opcode = XXX;
		    XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		  printf("UNKNOWN OPCODE!\n");
		  break;
		}
	      break;
	    case 1:
	      /* this is a special case because its got 4 different things */
	      extra = (inst >> 6) & 0x7;
	      switch(extra)
		{
		case 0:
		  ret.addr = _R_iss;
		  ret.target = (inst >> 15) & 0x3f;

		  ret.source1 = *(pS_GPR + ((inst) & 0x3f));
		  ret.source2 = immediate;

		  switch(opc)
		    {
		    case 0:
		      ret.opcode = ADD;
		      ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 1:
		      ret.opcode = AND;
		      AND(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 2:
		      ret.opcode = ANDC;
		      ANDC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 3:
		      ret.opcode = MAXS;
		      MAXS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 4:
		      ret.opcode = MAXU;
		      MAXU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 5:
		      ret.opcode = MINS;
		      MINS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 6:
		      ret.opcode = MINU;
		      MINU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 7:
		      ret.opcode = OR;
		      OR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 8:
		      ret.opcode = ORC;
		      ORC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 9:
		      ret.opcode = SH1ADD;
		      SH1ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 10:
		      ret.opcode = SH2ADD;
		      SH2ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 11:
		      ret.opcode = SH3ADD;
		      SH3ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 12:
		      ret.opcode = SH4ADD;
		      SH4ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 13:
		      ret.opcode = SHL;
		      SHL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 14:
		      ret.opcode = SHRS;
		      SHRS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 15:
		      ret.opcode = SHRU;
		      SHRU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 16:
		      ret.opcode = SUB;
		      SUB(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 17:
		      ret.opcode = XOR;
		      XOR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 18:
		      ret.opcode = MLSLL;
		      MLSLL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 19:
		      ret.opcode = MLULL;
		      MLULL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 20:
		      ret.opcode = MLSLH;
		      MLSLH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 21:
		      ret.opcode = MLULH;
		      MLULH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 22:
		      ret.opcode = MLSHH;
		      MLSHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 23:
		      ret.opcode = MLUHH;
		      MLUHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 24:
		      ret.opcode = MLSL;
		      MLSL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 25:
		      ret.opcode = MLUL;
		      MLUL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 26:
		      ret.opcode = MLSH;
		      MLSH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 27:
		      ret.opcode = MLUH;
		      MLUH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 28:
		      ret.opcode = MLSHS;
		      MLSHS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 29:
		      ret.opcode = SWBT;
		      ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		      SWBT(*(S_GPR + (ret.target)), ret.source3, ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 30:
		      ret.opcode = SWBF;
		      ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		      SWBF(*(S_GPR + (ret.target)), ret.source3, ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 31:
		      ret.opcode = RSUB;
		      RSUB(*(S_GPR + (ret.target)), ret.source2, ret.source1);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    default:
		      /*ret.opcode = XXX;
			XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		      printf("UNKNOWN OPCODE!\n");
		      break;
		    }
		  break;
		case 1:
		  ret.addr = _R_iss;
		  ret.target = (inst >> 15) & 0x3f;

		  ret.source1 = *(pS_GPR + ((inst) & 0x3f));

		  switch(opc)
		    {
		    case 0:
		      ret.opcode = SEXTB;
		      SEXTB(*(S_GPR + (ret.target)), ret.source1);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 1:
		      ret.opcode = SEXTH;
		      SEXTH(*(S_GPR + (ret.target)), ret.source1);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 2:
		      ret.opcode = ZEXTB;
		      ZEXTB(*(S_GPR + (ret.target)), ret.source1);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 3:
		      ret.opcode = ZEXTH;
		      ZEXTH(*(S_GPR + (ret.target)), ret.source1);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 4:
		      ret.opcode = MVL2G;
		      ADD(*(S_GPR + (ret.target)), *(pS_L), 0);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), LINK, 0, 1, *(pS_L), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 5:
		      ret.addr = _L_iss;
		      ret.dest[0].target = LINK;
		      ret.opcode = MVG2L;
		      ADD(*(S_L), ret.source1, 0);
		      ret.data = *(S_L);
		      ret.dest[0].res = *(S_L + (ret.dest[0].reg));
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), LINK, 1, 0, 1, clust, *(S_L));
		      break;
		    case 6:
		      /* not yet implemented: RDALTCTRL */
		      break;
		    case 7:
		      /* not yet implemented: WRALTCTRL */
		      break;
		    default:

		      /*ret.opcode = XXX;
			XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		      printf("UNKNOWN OPCODE!\n");
		      break;
		    }
		  break;
		case 2:
		  ret.addr = _R_iss;
		  ret.target = (inst >> 15) & 0x3f;

		  ret.source1 = *(pS_GPR + ((inst) & 0x3f));
		  ret.source2 = immediate;

		  switch(opc)
		    {
		    case 3:
		      ret.opcode = LDSB;
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSB, 0);
		      ret.data = -1;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
#ifdef DEBUGmem
		      printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		      if((ret.source[0].value + ret.source[1].value) >= dramSize)
			{ if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		      else
			_LDSB_iss(&ldsbVal, ((unsigned)system->dram + (ret.source[0].value + ret.source[1].value)));
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, ldsbVal);
		      ret.maddr = ret.source[0].value + ret.source[1].value;
		      ret.maddrValid = 1;
		      break;
		    case 4:
		      ret.opcode = LDSB; /* LBSB.D */
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSB, 0);
		      ret.data = -1;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
#ifdef DEBUGmem
		      printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		      if((ret.source[0].value + ret.source[1].value) >= dramSize)
			{ if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		      else
			_LDSB_iss(&ldsbVal, ((unsigned)system->dram + (ret.source[0].value + ret.source[1].value)));
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, ldsbVal);
		      ret.maddr = ret.source[0].value + ret.source[1].value;
		      ret.maddrValid = 1;
		      break;
		    case 7:
		      ret.opcode = LDUB;
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUB, 0);
		      ret.data = -1;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
#ifdef DEBUGmem
		      printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		      if((ret.source[0].value + ret.source[1].value) >= dramSize)
			{ if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		      else
			_LDUB_iss(&ldubVal, ((unsigned)system->dram + (ret.source[0].value + ret.source[1].value)));
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, ldubVal);
		      ret.maddr = ret.source[0].value + ret.source[1].value;
		      ret.maddrValid = 1;
		      break;
		    case 8:
		      ret.opcode = LDUB; /* LBUB.D */
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUB, 0);
		      ret.data = -1;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
#ifdef DEBUGmem
		      printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		      if((ret.source[0].value + ret.source[1].value) >= dramSize)
			{ if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		      else
			_LDUB_iss(&ldubVal, ((unsigned)system->dram + (ret.source[0].value + ret.source[1].value)));
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, ldubVal);
		      ret.maddr = ret.source[0].value + ret.source[1].value;
		      ret.maddrValid = 1;
		      break;
		    case 11:
		      ret.opcode = LDSH;
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSH, 0);
		      ret.data = -1;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
#ifdef DEBUGmem
		      printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		      if((ret.source[0].value + ret.source[1].value) >= dramSize)
			{ if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		      else
			_LDSH_iss(&ldshVal, ((unsigned)system->dram + (ret.source[0].value + ret.source[1].value)));
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, ldshVal);
		      ret.maddr = ret.source[0].value + ret.source[1].value;
		      ret.maddrValid = 1;
		      break;
		    case 12:
		      ret.opcode = LDSH; /* LBSH.D */
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSH, 0);
		      ret.data = -1;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
#ifdef DEBUGmem
		      printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		      if((ret.source[0].value + ret.source[1].value) >= dramSize)
			{ if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		      else
			_LDSH_iss(&ldshVal, ((unsigned)system->dram + (ret.source[0].value + ret.source[1].value)));
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, ldshVal);
		      ret.maddr = ret.source[0].value + ret.source[1].value;
		      ret.maddrValid = 1;
		      break;
		    case 15:
		      ret.opcode = LDUH;
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUH, 0);
		      ret.data = -1;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
#ifdef DEBUGmem
		      printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		      if((ret.source[0].value + ret.source[1].value) >= dramSize)
			{ if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		      else
			_LDUH_iss(&lduhVal, ((unsigned)system->dram + (ret.source[0].value + ret.source[1].value)));
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, lduhVal);
		      ret.maddr = ret.source[0].value + ret.source[1].value;
		      ret.maddrValid = 1;
		      break;
		    case 16:
		      ret.opcode = LDUH; /* LDUH.D */
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUH, 0);
		      ret.data = -1;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
#ifdef DEBUGmem
		      printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		      if((ret.source[0].value + ret.source[1].value) >= dramSize)
			{ if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		      else
			_LDUH_iss(&ldshVal, ((unsigned)system->dram + (ret.source[0].value + ret.source[1].value)));
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, lduhVal);
		      ret.maddr = ret.source[0].value + ret.source[1].value;
		      ret.maddrValid = 1;
		      break;
		    case 18:
		      ret.opcode = LDW; /* LDW.D */
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW, 0);
		      ret.data = -1;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
#ifdef DEBUGmem
		      printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		      if((ret.source[0].value + ret.source[1].value) >= dramSize)
			{ if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		      else
			_LDW_iss(&ldwVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, ldwVal);
		      ret.maddr = ret.source[0].value + ret.source[1].value;
		      ret.maddrValid = 1;
		      break;
		    case 19:
		      ret.opcode = LDW;
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW, 0);
		      ret.data = -1;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
#ifdef DEBUGmem
		      printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		      if((ret.source[0].value + ret.source[1].value) >= dramSize)
			{ if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		      else
			_LDW_iss(&ldwVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, ldwVal);
		      ret.maddr = ret.source[0].value + ret.source[1].value;
		      ret.maddrValid = 1;
		      break;
		    case 20:
		      ret.opcode = PSYSCALL;
		      /* not yet impletmented */
		      ret.data = 0;
		      break;
		    case 21:
		      ret.opcode = LDL;
		      memRequest(system, S_L, (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW, 0);
		      ret.data = -1;
		      ret.addr = _L_iss;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
#ifdef DEBUGmem
		      printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		      if((ret.source[0].value + ret.source[1].value) >= dramSize)
			{ if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		      else
			_LDW_iss(&ldlVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, ldlVal);
		      ret.maddr = ret.source[0].value + ret.source[1].value;
		      ret.maddrValid = 1;
		      break;
		      /* TODO: CUSTOM INSTRUCTIONS POSSIBLY SHOULDN'T BE
			 EXECUTED IN API MODE
		      */
		    case 24:
		      ret.opcode = CUSTOM;
		      /* not yet implemented: CASM7 */
		      ret.data = 0;
		      ret.executed = 0; /* operation is not executed */
		      break;
		    case 25:
		      ret.opcode = CUSTOM;
		      /* not yet implemented: CASM6 */
		      ret.data = 0;
		      ret.executed = 0; /* operation is not executed */
		      break;
		    case 26:
		      ret.opcode = CUSTOM; /* CASM5 */
		      /* need to figure out which it is */
		      extra = ((immediate >> 30) & 0x3);
		      ret.executed = 0; /* operation is not executed */
		      switch(extra)
			{
			case 0:
			  extra = ((inst >> 9) & 0x3f);
			  switch(extra)
			    {
			    default:
			      /*ret.opcode = XXX;
				XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
			      printf("Unknown CASM5 -> CASM41 custom instruction\n");
			      break;
			    }
			  break;
			case 1:
#ifdef DEBUG
			  printf("CASM32\n");
#endif
			  extra  = ((inst >> 9) & 0x3f);
			  ret.target = ((inst >> 15) & 0x3f);
			  ret.target2 = (inst & 0x3f);

			  ret.source1 = (immediate & 0x3f);
			  ret.source2 = ((immediate >> 6) & 0x3f);
			  ret.source3 = ((immediate >> 12) & 0x3f);

			  switch(extra)
			    {
			    case 0:
			      /* vthread_create_local */
#ifdef DEBUG
			      printf("vthread_create_local\n");
			      printf("target1: %d\n", ret.target);
			      printf("\t0x%x\n", *(pS_GPR + ret.target));
			      printf("target2: %d\n", ret.target2);
			      printf("\t0x%x\n", *(pS_GPR + ret.target2));

			      printf("source1: %d\n", ret.source1);
			      printf("\t0x%x\n", *(pS_GPR + ret.source1));
			      printf("source2: %d\n", ret.source2);
			      printf("\t0x%x\n", *(pS_GPR + ret.source2));
			      printf("source3: %d\n", ret.source3);
			      printf("\t0x%x\n", *(pS_GPR + ret.source3));
#endif
			      /* TODO: find free thread here
				 setup r7 (thread_id)
				 put in list to start at end of current cycle
			      */
			      {
				unsigned i, deepstate, debug;
				hyperContextT *hcnt;
				unsigned found = 0;
				unsigned *GPR;
				for(i=0;i<context->numHyperContext;i++)
				  {
#ifdef DEBUG
				    printf("\thypercontext: %d\n", i);
#endif
				    hcnt = (hyperContextT *)((unsigned)context->hypercontext + (i * sizeof(hyperContextT)));
#ifdef DEBUG
				    printf("\t0x%08x\n", hcnt->VT_CTRL);
#endif
				    deepstate = (hcnt->VT_CTRL >> 3) & 0xff;
				    debug = (hcnt->VT_CTRL >> 1) & 0x1;

				    if((deepstate == READY) && (!debug))
				      {
#ifdef DEBUG
					printf("need to set this thread up!\n");
#endif
					found = 1;

					hcnt->programCounter = *(pS_GPR + ret.source2);
					GPR = hcnt->S_GPR;
					*(GPR + 3) = *(pS_GPR + ret.source3);
#ifdef DEBUG
					printf("\t\tset PC: 0x%x\n", hcnt->programCounter);
					printf("\t\tset args: 0x%x\n", *(GPR + 3));
#endif

					/* then need to set r7 to id */
					*(S_GPR + ret.target2) = hcnt->VT_CTRL >> 12;

					newThreadRequest(hypercontext->VT_CTRL, hcnt->VT_CTRL, system);

					break;
				      }
				    /*else
				      {
					printf("\tnot available\n");
					}*/
				  }

				if(!found)
				  {
				    /* TODO: error out, need to allow to carry on */
				    printf("ERROR: There was a problem allocating a new thread (vthread_create_local)\n");
				  }
			      }
			      /*newThreadRequest(VT_CTRL, *(pS_GPR + ret.source2), *(pS_GPR + ret.source3), system, context, 0);*/

			      break;
			    case 1:
			      /* vthread_create_remote */
#ifdef DEBUG
			      printf("vthread_create_remote\n");
			      printf("target1: %d\n", ret.target);
			      printf("\t0x%x\n", *(pS_GPR + ret.target));
			      printf("target2: %d\n", ret.target2);
			      printf("\t0x%x\n", *(pS_GPR + ret.target2));

			      printf("source1: %d\n", ret.source1);
			      printf("\t0x%x\n", *(pS_GPR + ret.source1));
			      printf("source2: %d\n", ret.source2);
			      printf("\t0x%x\n", *(pS_GPR + ret.source2));
			      printf("source3: %d\n", ret.source3);
			      printf("\t0x%x\n", *(pS_GPR + ret.source3));
#endif
			      /* TODO: find free thread here
				 setup r7 (thread_id)
				 put in list to start at end of current cycle
				 REMOTE WILL CURRENTLY LOOK AT LOCAL HYPERCONTEXTS AS WELL
			      */
			      {
				unsigned i, j, deepstate, debug;
				contextT *cnt;
				hyperContextT *hcnt;
				unsigned found = 0;
				unsigned *GPR;
				for(i=0;i<system->numContext;i++)
				  {
#ifdef DEBUG
				    printf("\tcontext: %d\n", i);
#endif
				    cnt = (contextT *)((unsigned)system->context + (i * sizeof(contextT)));

				    for(j=0;j<cnt->numHyperContext;j++)
				      {
#ifdef DEBUG
					printf("\thypercontext: %d\n", j);
#endif
					hcnt = (hyperContextT *)((unsigned)cnt->hypercontext + (j * sizeof(hyperContextT)));
#ifdef DEBUG
					printf("\t0x%08x\n", hcnt->VT_CTRL);
#endif
					deepstate = (hcnt->VT_CTRL >> 3) & 0xff;
					debug = (hcnt->VT_CTRL >> 1) & 0x1;

					if((deepstate == READY) && (!debug))
					  {
#ifdef DEBUG
					    printf("need to set this thread up!\n");
#endif
					    found = 1;

					    hcnt->programCounter = *(pS_GPR + ret.source2);
					    GPR = hcnt->S_GPR;
					    *(GPR + 3) = *(pS_GPR + ret.source3);
#ifdef DEBUG
					    printf("\t\tset PC: 0x%x\n", hcnt->programCounter);
					    printf("\t\tset args: 0x%x\n", *(GPR + 3));
#endif
					    /* then need to set r7 to id */
					    *(S_GPR + ret.target2) = hcnt->VT_CTRL >> 12;

					    newThreadRequest(hypercontext->VT_CTRL, hcnt->VT_CTRL, system);

					    break;
					  }
					/*else
					  {
					    printf("\tnot available\n");
					    }*/
				      }
				    if(found)
				      break;
				  }

				if(!found)
				  {
				    /* TODO: error out, need to allow to carry on */
				    printf("ERROR: There was a problem allocating a new thread (vthread_create_remote)\n");
				  }
			      }
			      break;
			    default:
			      /*ret.opcode = XXX;
				XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
			      printf("Unknown CASM5 -> CASM32 custom instruction\n");
			      break;
			    }
			  break;
			default:
			  /*ret.opcode = XXX;
			    XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
			  printf("UNKNOWN OPCODE!\n");
			  break;
			}
		      ret.data = 0;
		      break;
		    case 27:
		      ret.opcode = CUSTOM;
		      /* not yet implemented: CASM4 */
		      ret.data = 0;
		      ret.executed = 0; /* operation is not executed */
		      break;
		    case 28:
		      ret.opcode = CUSTOM;
		      /* not yet implemented: CASM3 */
		      ret.data = 0;
		      ret.executed = 0; /* operation is not executed */
		      break;
		    default:
		      /*ret.opcode = XXX;
			XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		      printf("UNKNOWN OPCODE!\n");
		      break;
		    }
		  break;
		case 3:
		  ret.addr = _MEM_iss;

		  ret.source1 = *(pS_GPR + ((inst) & 0x3f));
		  ret.source2 = *(pS_GPR + ((inst >> 15) & 0x3f));

		  /*ret.target = immediate + ret.source1;*/

		  switch(opc)
		    {
		    case 0:
		      ret.opcode = STB;
		      ret.target = immediate + ret.source1;
		      memRequest(system, NULL, ret.target, hypercontext->VT_CTRL, mSTB, *(pS_GPR + ((inst >> 15) & 0x3f)));
		      ret.data = ret.source2;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), MEM, 1, 0, 1, 0, *(pS_GPR + ((inst >>15) & 0x3f)));
		      ret.maddr = immediate + ret.source[0].value;
		      ret.maddrValid = 1;
		      break;
		    case 1:
		      ret.opcode = STH;
		      ret.target = immediate + ret.source1;
		      memRequest(system, NULL, ret.target, hypercontext->VT_CTRL, mSTH, *(pS_GPR + ((inst >> 15) & 0x3f)));
		      ret.data = ret.source2;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), MEM, 1, 0, 1, 0, *(pS_GPR + ((inst >>15) & 0x3f)));
		      /*insertDest(&(ret.dest[0]), MEM, 1, 0, 0, 0, 0);*/
		      ret.maddr = immediate + ret.source[0].value;
		      ret.maddrValid = 1;
		      break;
		    case 2:
		      ret.opcode = STW;
		      ret.target = immediate + ret.source1;
		      /*memRequest(system, (pS_GPR + ((inst >> 15) & 0x3f)), ret.target, hypercontext->VT_CTRL, mSTW);*/
		      memRequest(system, NULL, ret.target, hypercontext->VT_CTRL, mSTW, *(pS_GPR + ((inst >> 15) & 0x3f)));
		      ret.data = ret.source2;
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), MEM, 1, 0, 1, 0, *(pS_GPR + ((inst >>15) & 0x3f)));
		      /*insertDest(&(ret.dest[0]), MEM, 1, 0, 0, 0, 0);*/
		      ret.maddr = immediate + ret.source[0].value;
		      ret.maddrValid = 1;
		      break;
		    case 3:
		      ret.opcode = PFT;
		      /* not yet implemented */
		      ret.data = 0;
		      break;
		    case 12:
		      ret.opcode = STL;
		      ret.target = immediate + ret.source1;
		      /*ret.data = ret.source2;*/
		      ret.data = *pS_L;
		      memRequest(system, NULL, ret.target, hypercontext->VT_CTRL, mSTW, *pS_L);
		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), MEM, 1, 0, 1, 0, *(pS_L));
		      ret.maddr = immediate + *(pS_GPR + (inst & 0x3f));
		      ret.maddrValid = 1;
		      break;
		    default:
		      /*ret.opcode = XXX;
			XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		      printf("UNKNOWN OPCODE!\n");
		      break;
		    }
		  break;
		default:
		  printf("error: unknown extra: %d\n", extra);
		  printf("UNKNOWN OPCODE!\n");
		  break;
		}
	      break;
	    case 2:
	      ret.addr = _R_iss;
	      ret.target = (inst >> 15) & 0x3f;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8); /* IMM9 */

	      switch(opc)
		{
		case 0:
		  ret.opcode = ADD;
		  ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 1:
		  ret.opcode = AND;
		  AND(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 2:
		  ret.opcode = ANDC;
		  ANDC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 3:
		  ret.opcode = MAXS;
		  MAXS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 4:
		  ret.opcode = MAXU;
		  MAXU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 5:
		  ret.opcode = MINS;
		  MINS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 6:
		  ret.opcode = MINU;
		  MINU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 7:
		  ret.opcode = OR;
		  OR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 8:
		  ret.opcode = ORC;
		  ORC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 9:
		  ret.opcode = SH1ADD;
		  SH1ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 10:
		  ret.opcode = SH2ADD;
		  SH2ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 11:
		  ret.opcode = SH3ADD;
		  SH3ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 12:
		  ret.opcode = SH4ADD;
		  SH4ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 13:
		  ret.opcode = SHL;
		  SHL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 14:
		  ret.opcode = SHRS;
		  SHRS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 15:
		  ret.opcode = SHRU;
		  SHRU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 16:
		  ret.opcode = SUB;
		  SUB(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 17:
		  ret.opcode = XOR;
		  XOR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 18:
		  ret.opcode = MLSLL;
		  MLSLL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 19:
		  ret.opcode = MLULL;
		  MLULL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 20:
		  ret.opcode = MLSLH;
		  MLSLH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 21:
		  ret.opcode = MLULH;
		  MLULH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 22:
		  ret.opcode = MLSHH;
		  MLSHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 23:
		  ret.opcode = MLUHH;
		  MLUHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 24:
		  ret.opcode = MLSL;
		  MLSL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 25:
		  ret.opcode = MLUL;
		  MLUL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 26:
		  ret.opcode = MLSH;
		  MLSH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 27:
		  ret.opcode = MLUH;
		  MLUH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 28:
		  ret.opcode = MLSHS;
		  MLSHS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		case 29:

		  extra = (inst >> 20) & 0x1;

		  switch(extra)
		    {
		    case 0:
		      ret.opcode = RETURN;
		      ret.source1 = ((inst & 0xfffff) ^ (1 << 19)) - (1 << 19);
		      /* change stack pointer */
		      *(S_GPR + (1)) += ret.source1;
		      /* TODO: returns in threads */
		      /* if the link register is zero, then it is possibly the end of the function */
		      if(!(*(pS_L)))
			{
#ifdef DEBUG
			  printf("This is possibly the end? LINK_REG = 0x0\n");
#endif
#ifdef VTHREAD
			  /* put the context back in the ready state so it can be used again */
			  hypercontext->VT_CTRL &= 0xfffff807;
			  hypercontext->VT_CTRL |= READY << 3;
#else
			  /* set ctrl register into debug state */
			  hypercontext->VT_CTRL |= 1 << 1;
#endif
			}
		      /* set PC to link register */
		      ret.newPCValid = 1;
		      ret.newPC = *(pS_L);
		      ret.data = 0;
		      ret.target = -1;
		      ret.addr = _NUL_iss;
		      break;
		    case 1:
		      ret.opcode = XNOP;
		      ret.source1 = (inst >> 6) & 0x1ff;
		      /* TODO: not sure if there is an XNOP in the ISA */
		      XNOP(ret.source1);
		      ret.data = ret.source1;
		      break;
		    }
		  break;
		case 30:

		  extra = (inst >> 20) & 0x1;
		  switch(extra)
		    {
		    case 0:
		      /*printf("case0\n");*/
		      ret.opcode = SYSCALL;
		      /* TODO: implement! */
		      switch(inst & 0xfffff) {
			/* All assume registers are availabe in current
			   registers, due to VEX seeming to work this way
			 */
		      case 0: /* printf */
			/* r3 = printf(r3, r4...r10);*/
			{
			  char format[256] = {'\0'};
			  getString(&format[0], 256, *(S_GPR + 3) + (unsigned)(system->dram));
			  /* PCRE section */
			  split_t *_test;
			  split_t *_temp;
			  int _count = 4; /* arguments start from register 4 */

			  _test = pcre_split("%[\\+#-]?(\\d+|\\*)?\\.?\\d*([hlLzjt]|[hl]{2})?([csuxXfFeEpgGdionz])",format);
			  _temp = _test;
			  if(_test == NULL)
			    printf("Error: Nothing to print\n");
			  else {
			    do {
			      if(_test->string != NULL)
				printf("%s", _test->string);
			      
			      if(_test->match != NULL) {
				switch(*(char *)((unsigned)_test->match + strlen(_test->match) - 1)) {
				case 's':
				case 'S':
				  {
				    char str[256] = {'\0'};
				    getString(&str[0], 256, *(pS_GPR + _count++) + (unsigned)(system->dram));
				    printf(_test->match, str);
				  }
				  break;
				case 'f':
				case 'F':
				  {
				    /* first register needs to be odd :S */
				    if(!(_count % 2)) { _count++; } /* skip odd register */
				    double d;
				    int *dP = (int *)&d;
				    *(dP+1) = *(S_GPR + _count++);
				    *dP = *(S_GPR + _count++);
				    printf(_test->match, d);
				  }
				  break;
				default:
				  /* TODO: may need to perform an endian swap? */
				  {
				    int temp = *(S_GPR + _count++);
				    if(!(temp >> 8)) {
				      /* possibly char */
				      printf(_test->match, temp);
				    }
				    else if(!(temp >> 16)) {
				      /* possibly short */
				      printf(_test->match, ntohs(temp));
				    }
				    else {
				      /* possibly int */
				      printf(_test->match, ntohl(temp));
				    }
				  }
				  break;
				}
			      }
			      if(_count > 10) {
				printf("*** Limit of Insizzle printf ***\n");
				break;
			      }
			    } while((_test = _test->next) != NULL);
			  }
			  
			  /* TODO: fix this */
			  /*pcre_split_free(_temp);*/
			}
			break;
		      case 1: /* fopen */
			/* r3 = fopen(r3, r4) */
			{
			  char filename[256] = {'\0'};
			  getString(&filename[0], 256, *(S_GPR + 3) + (unsigned)(system->dram));
			  char filemode[256] = {'\0'};
			  getString(&filemode[0], 256, *(S_GPR + 4) + (unsigned)(system->dram));

			  FILE *fp = fopen(filename, filemode);

			  *(S_GPR + 3) = (unsigned)fp;
			}
			break;
		      case 2: /* fclose */
			/* r3 = fclose(r3) */
			{
			  FILE *stream = (FILE *)*(S_GPR + 3);

			  int ret = fclose(stream);

			  *(S_GPR + 3) = (unsigned)ret;
			}
			break;
		      case 3: /* fwrite */
			/* r3 = fwrite(r3, r4, r5, r6) */
			{
			  void *ptr = (void *)(*(S_GPR + 3) + (unsigned)(system->dram));
			  size_t size = (size_t)*(S_GPR + 4);
			  size_t nitems = (size_t)*(S_GPR + 5);
			  FILE *stream = (FILE *)*(S_GPR + 6);

			  char *ptrLittle = (char *)calloc((size * nitems), 1);
			  endianSwapBig2Little(ptrLittle, size, nitems, ptr);
			  size_t ret = fwrite(ptrLittle, size, nitems, stream);
			  *(S_GPR + 3) = (unsigned)ret;
			  
			}
			break;
		      case 4: /* fread */
			/* r3 = fread(r3, r4, r5, r6) */
			{
			  void *ptr = (void *)(*(S_GPR + 3) + (unsigned)(system->dram));
			  size_t size = (size_t)*(S_GPR + 4);
			  size_t nitems = (size_t)*(S_GPR + 5);
			  FILE *stream = (FILE *)*(S_GPR + 6);
			  
			  /* copy into local memory, then perform endian switch into LE1 space */
			  char *ptrLittle = (char *)calloc((size * nitems), 1);
			  size_t ret = fread(ptrLittle, size, nitems, stream);
			  endianSwapLittle2Big(ptr, size, nitems, ptrLittle);
			  *(S_GPR + 3) = (unsigned)ret;
			}
			break;
		      case 5: /* fprintf */
			/* r3 = fprintf(r3, r4, r5...r10) */
			{
			  FILE *stream = (FILE *)*(S_GPR + 3);
			  char format[256] = {'\0'};
			  getString(&format[0], 256, *(S_GPR + 4) + (unsigned)(system->dram));

			  /* PCRE section */
			  split_t *_test;
			  split_t *_temp;
			  int _count = 5; /* arguments start from register 4 */

			  _test = pcre_split("%[\\+#-]?(\\d+|\\*)?\\.?\\d*([hlLzjt]|[hl]{2})?([csuxXfFeEpgGdionz])",format);
			  _temp = _test;
			  if(_test == NULL)
			    printf("Error: Nothing to print\n");
			  else {
			    do {
			      if(_test->string != NULL)
				fprintf(stream, "%s", _test->string);
			      
			      if(_test->match != NULL) {
				fprintf(stream, _test->match, *(pS_GPR + _count++));
			      }
			    } while((_test = _test->next) != NULL);
			  }
			  /* TODO: work out freeing this without stack dump */
			  /* if there are no extra parts it breaks */
			  /*pcre_split_free(_temp);*/
			}
			break;
		      case 6: /* fseek */
			/* r3 = fseek(r3, r4, r5) */
			{
			  FILE *stream = (FILE *)*(S_GPR + 3);
			  long offset = (long)*(S_GPR + 4);
			  int whence = (int)*(S_GPR + 5);

			  int ret = fseek(stream, offset, whence);

			  *(S_GPR + 3) = (unsigned)ret;
			}
			break;
		      case 7: /* ftell */
			/* r3 = ftell(r3) */
			{
			  FILE *stream = (FILE *)*(S_GPR + 3);

			  long ret = ftell(stream);

			  *(S_GPR + 3) = (unsigned)ret;
			}
			break;
		      case 8: /* snprintf */
			/* r3 = snprintf(r3, r4, r5, ...) */
			{
			  char *s = (char *)*(S_GPR + 3) + (unsigned)(system->dram);
			  size_t n = (size_t)*(S_GPR + 4);
			  char format[256] = {'\0'};
			  getString(&format[0], 256, *(S_GPR + 5) + (unsigned)(system->dram));


			  /* make a char array the size of n */
			  char *sLittle = calloc(n+1, 1);

			  /* PCRE section */
			  split_t *_test;
			  split_t *_temp;
			  int _count = 6; /* arguments start from register 4 */

			  _test = pcre_split("%[\\+#-]?(\\d+|\\*)?\\.?\\d*([hlLzjt]|[hl]{2})?([csuxXfFeEpgGdionz])",format);
			  _temp = _test;
			  if(_test == NULL)
			    printf("Error: Nothing to print\n");
			  else {
			    do {
			      if(_test->string != NULL)
				strcat(sLittle, _test->string);
			      
			      if(_test->match != NULL) {
				switch(*(char *)((unsigned)_test->match + strlen(_test->match) - 1)) {
				case 's':
				case 'S':
				  {
				    char str[256] = {'\0'};
				    getString(&str[0], 256, *(pS_GPR + _count++) + (unsigned)(system->dram));
				    char _s[256];
				    snprintf(_s, 256, _test->match, str);
				    strcat(sLittle, _s);
				  }
				  break;
				case 'f':
				case 'F':
				  {
				    /* first register needs to be odd :S */
				    if(!(_count % 2)) { _count++; } /* skip odd register */
				    double d;
				    int *dP = (int *)&d;
				    *(dP+1) = *(S_GPR + _count++);
				    *dP = *(S_GPR + _count++);

				    char _s[256];
				    snprintf(_s, 256, _test->match, d);
				    strcat(sLittle, _s);
				  }
				  break;
				default:
				  {
				    char _s[256];
				    snprintf(_s, 256, _test->match, *(S_GPR + _count++));
				    strcat(sLittle, _s);
				  }
				  break;
				}
			      }
			      if(_count > 10) {
				printf("*** Limit of Insizzle printf ***\n");
				break;
			      }
			    } while((_test = _test->next) != NULL);
			  }
			  
			  /* TODO: fix this */
			  /*pcre_split_free(_temp);*/

			  /* need to copy sLittle into s */
			  endianSwapLittle2Big(s, 1, strlen(sLittle), sLittle);
			}
			break;
		      case 9: /* clock */
			{
			  *(S_GPR + 3) = (unsigned)cycleCount;
			}
			break;
		      case 10: /* fscanf */
			/* r3 = fscanf(r3, r4, ...) */
			{
			  FILE *stream = (FILE *)*(S_GPR + 3);
			  char format[256] = {'\0'};
			  getString(&format[0], 256, *(S_GPR + 4) + (unsigned)(system->dram));
			  /* PCRE section */
			  split_t *_test;
			  split_t *_temp;
			  int _count = 5; /* arguments start from register 4 */

			  _test = pcre_split("%[\\+#-]?(\\d+|\\*)?\\.?\\d*([hlLzjt]|[hl]{2})?([csuxXfFeEpgGdionz])",format);
			  _temp = _test;
			  if(_test == NULL)
			    printf("Error: Nothing to print\n");
			  else {
			    char _str[256] = {'\0'};
			    do {
			      if(_test->string != NULL) {
				/*printf("%s", _test->string);*/
				strcat(_str, _test->string);
			      }

			      if(_test->match != NULL) {
				strcat(_str, _test->match);
				switch(*(char *)((unsigned)_test->match + strlen(_test->match) - 1)) {
				case 's':
				case 'S':
				  {
				    char str[256] = {'\0'};
				    fscanf(stream, _str, str);
				    endianSwapLittle2Big((char *)*(S_GPR + _count++) + (unsigned)(system->dram), 1, strlen(str), str);
				  }
				  break;
				case 'f':
				case 'F':
				  {
				    switch(*(char *)((unsigned)_test->match + strlen(_test->match) - 2)) {
				    case 'l':
				      {
					double d;
					fscanf(stream, _str, &d);
					int *dP = (int *)&d;
					*(unsigned *)(*(S_GPR + _count) + (unsigned)(system->dram)) = *dP;
					*(unsigned *)(*(S_GPR + _count++) + (unsigned)(system->dram)) = *(dP+1);
				      }
				      break;
				    default:
				      {
					float d;
					fscanf(stream, _str, &d);
					int *dP = (int *)&d;
					*(unsigned *)(*(S_GPR + _count++) + (unsigned)(system->dram)) = *dP;
				      }
				      break;
				    }
				  }
				  break;
				default:
				  fscanf(stream, _str, (unsigned *)(*(S_GPR + _count++) + (unsigned)(system->dram)));
				  break;
				}
				_str[0] = '\0';
			      }
			      if(_count > 10) {
				printf("*** Limit of Insizzle printf ***\n");
				break;
			      }
			    } while((_test = _test->next) != NULL);
			  }
			  
			  /* TODO: fix this */
			  /*pcre_split_free(_temp);*/
			}
			break;
		      case 11: /* fgetc */
			/* r3 = fgetc(r3) */
			{
			  FILE *stream = (FILE *)*(S_GPR + 3);

			  int ret = fgetc(stream);

			  *(S_GPR + 3) = (unsigned)ret;
			}
			break;
		      default:
			printf("Unknown SYSCALL: %d\n", (inst & 0xfffff));
			break;
		      }
		      break;
		    case 1:
		      /*printf("case1\n");*/
		      extra = (inst >> 15) & 0x1f;

		      switch(extra)
			{
			case 0:
			  ret.opcode = RFI;
			  /* TODO: unimplemented */
			  ret.data = 0;
			  break;
			case 1:
			  ret.opcode = HALT;
			  /*printf("HALT! WHO GOES THERE!\n");*/
			  int system_id = (((hypercontext->VT_CTRL) >> 24) & 0xff);
			  int context_id = (((hypercontext->VT_CTRL) >> 16) & 0xff);
			  int hypercontext_id = (((hypercontext->VT_CTRL) >> 12) & 0xf);
			  printf("HALT operation received from [%d][%d][%d] at cycle %llu\n", system_id, context_id, hypercontext_id, cycleCount);
			  /* set ctrl reg to terminated */
			  /* TODO: THIS */
			  /*printOutDataPerThread(data, cnt, hcnt);*/
			  hypercontext->VT_CTRL |= 1 << 1;
			  ret.executed = 0; /* operation is not executed */
			  break;
			case 2:
			  ret.opcode = RDCTRL;
			  /* TODO: unimplemented */

			  ret.addr = _R_iss;
			  ret.target = (inst & 0x3f);

			  ret.source1 = (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8);
			  ret.data = 0;
			  break;
			case 3:
			  ret.opcode = WRCTRL;
			  /* TODO: unimplemented */

			  ret.addr = _MEM_iss;
			  ret.target = (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8);

			  ret.source1 = *(pS_GPR + ((inst & 0x3f)));

			  ret.data = 0;
			  break;
			default:
			  printf("nothing implemented\n");
			  printf("UNKNOWN OPCODE!\n");
			  break;
			}
		      break;
		    }

		  ret.data = 0;
		  break;
		case 31:
		  ret.opcode = RSUB;
		  RSUB(*(S_GPR + (ret.target)), ret.source2, ret.source1);
		  ret.data = *(S_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  break;
		default:
		  /*ret.opcode = XXX;
		    XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		  printf("UNKNOWN OPCODE!\n");
		  break;
		}
	      break;
	    case 3:
	      ret.addr = _R_iss;
	      ret.target = (inst >> 15) & 0x3f;

	      ret.addr2 = _B_iss;
	      ret.target2 = (inst >> 21) & 0x7;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = *(pS_GPR + ((inst >> 6) & 0x3f));

	      switch(opc)
		{
		case 0:
		  ret.opcode = ADDCG;
		  ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		  ADDCG(*(S_GPR + (ret.target)), *(S_PR + (ret.target2)), ret.source1, ret.source1, ret.source3);
		  ret.data = *(S_GPR + (ret.target));
		  ret.data2 = *(S_PR + (ret.target2));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  insertDest(&(ret.dest[1]), S_PRED, 1, ((inst >> 21) & 0x7), 1, clust, *(S_PR + ((inst >> 21) & 0x7)));
		  break;
		case 1:
		  ret.opcode = DIVS;
		  ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		  DIVS(*(S_GPR + (ret.target)), *(S_PR + (ret.target2)), ret.source1, ret.source2, ret.source3);
		  ret.data = *(S_GPR + (ret.target));
		  ret.data2 = *(S_PR + (ret.target2));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		  insertDest(&(ret.dest[1]), S_PRED, 1, ((inst >> 21) & 0x7), 1, clust, *(S_PR + ((inst >> 21) & 0x7)));
		  break;
		case 2:

		  extra = (inst >> 21) & 0x7;

		  switch(extra)
		    {
		    case 0:
		      ret.opcode = MFB;
		      ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		      MFB(*(S_GPR + (ret.target)), ret.source3);
		      ret.data = *(S_GPR + (ret.target));
		      insertSource(&(ret.source[0]), S_PRED, ((inst >> 12) & 0x7), 1, *(pS_PR + ((inst >> 12) & 0x7)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 1:
		      ret.opcode = GOTO;
		      ret.source1 = ((inst & 0xfffff) ^ (1 << 19)) - (1 << 19);
		      ret.newPCValid = 1;
		      ret.newPC = hypercontext->programCounter + ret.source1;
		      ret.data = 0;
		      ret.target = -1;
		      ret.addr = _NUL_iss;
		      break;
		    case 2:
		      ret.opcode = CALL;
		      ret.source1 = ((inst & 0xfffff) ^ (1 << 19)) - (1 << 19);
		      ret.newPCValid = 1;
		      ret.newPC = hypercontext->programCounter + ret.source1;
		      ret.addr = _NUL_iss;
		      ret.data = 0;
		      ret.target = -1;
		      /* need to set link_register to correct value */
		      *(S_L) = hypercontext->programCounter + 0x4;
		      break;
		    case 3:
		      ret.opcode = GOTOL;
		      ret.source1 = *(pS_L);
		      ret.newPCValid = 1;
		      ret.newPC = ret.source1;
		      ret.data = 0;
		      ret.target = -1;
		      ret.addr = _NUL_iss;
		      break;
		    case 4:
		      ret.opcode = CALLL;
		      ret.source1 = *(pS_L);
		      ret.newPCValid = 1;
		      ret.newPC = ret.source1;
		      ret.data = ret.source1;
		      ret.addr = _NUL_iss;
		      ret.data = 0;
		      ret.target = -1;
		      /* need to set link_register to correct value */
		      *(S_L) = hypercontext->programCounter + 0x4;
		      break;
		    case 5:
		      ret.opcode = CPUID;
		      /* TODO: FIX THIS */
		      /*ADD(*(S_GPR + (ret.target)), (cnt << 8), (hcnt << 16));
		      ret.source1 = (cnt << 8) | (hcnt << 16);
		      ret.data =  *(S_GPR + (ret.target));*/
		      int system_id = (((hypercontext->VT_CTRL) >> 24) & 0xff);
		      int context_id = (((hypercontext->VT_CTRL) >> 16) & 0xff);
		      int hypercontext_id = (((hypercontext->VT_CTRL) >> 12) & 0xf);
		      *(S_GPR + (ret.target)) = (system_id | (context_id << 8) | (hypercontext_id << 16));
		      ret.data = (system_id | (context_id << 8) | (hypercontext_id << 16));
		      /* This is a new way which should be used now? */
		      /**(S_GPR + (ret.target)) = (hypercontext->VT_CTRL >> 12) & 0xfffff;
		      ret.source1 = (hypercontext->VT_CTRL >> 12) & 0xfffff;
		      ret.data = (hypercontext->VT_CTRL >> 12) & 0xfffff;*/
		      ret.addr = _R_iss;
		      break;
		    }

		  break;
		case 3:

		  extra = (inst >> 20) & 0x1;

		  ret.addr = _B_iss;
		  ret.target = (inst >> 21) & 0x7;
		  ret.target2 = (inst >> 16) & 0xf;

		  /* this is an offset, so needs to be added to the current PC */
		  /* need to sign extend it (16 bits) */
		  ret.source1 = ((inst & 0xffff) ^ (1 << 15)) - (1 << 15);

		  clusterT *clusterForBranch;
		  clusterForBranch = (clusterT *)((unsigned)hypercontext->registers + (ret.target2 * sizeof(clusterT)));

		  switch(extra)
		    {
		    case 0:
		      ret.opcode = BRANCH;
		      /* TODO: check this is correct
			 target2 is the cluster value */
		      ret.data = *(clusterForBranch->pS_PR + (ret.target));

		      insertSource(&(ret.source[0]), S_PRED, ((inst >> 21) & 0x7), 1, *(clusterForBranch->pS_PR + ((inst >> 21) & 0x7)), ((inst >> 16) & 0xf));

		      if(*(clusterForBranch->pS_PR + (ret.target)))
			{
			  /* branch taken */
			  hypercontext->branchTaken++;
			  /* need to set new PC */
			  ret.newPC = hypercontext->programCounter + ret.source1;
			  ret.newPCValid = 1;
			  /* need to add stall cycles */
#ifdef NOSTALLS
			  hypercontext->stallCount += PIPELINE_REFILL;
#else
			  hypercontext->stalled += PIPELINE_REFILL;
#endif
			  hypercontext->controlFlowChange++;
			}
		      else
			{
			  /* branch not taken */
			  hypercontext->branchNotTaken++;
			}
		      break;
		    case 1:
		      ret.opcode = BRANCHF;
		      ret.data = *(clusterForBranch->pS_PR + (ret.target));

		      insertSource(&(ret.source[0]), S_PRED, ((inst >> 21) & 0x7), 1, *(clusterForBranch->pS_PR + ((inst >> 21) & 0x7)), ((inst >> 16) & 0xf));
		      if(*(clusterForBranch->pS_PR + (ret.target)))
			{
			  /* branch not taken */
			  hypercontext->branchNotTaken++;
			}
		      else
			{
			  /* branch taken */
			  hypercontext->branchTaken++;
			  /* need to set new PC */
			  ret.newPC = hypercontext->programCounter + ret.source1;
			  ret.newPCValid = 1;
			  /* need to add stall cycles */
#ifdef NOSTALLS
			  hypercontext->stallCount += PIPELINE_REFILL;
#else
			  hypercontext->stalled += PIPELINE_REFILL;
#endif
			  hypercontext->controlFlowChange++;
			}
		      break;
		    }
		  break;
		}
	      break;
	    case 4:
	      extra = (inst >> 25) & 0x1;

	      ret.target = (inst >> 15) & 0x3f;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = *(pS_GPR + ((inst >> 6) & 0x3f));

	      switch(extra)
		{
		case 0:
		  ret.addr = _R_iss;
		  switch(opc)
		    {
		    case 0:
		      ret.opcode = CMPEQ;
		      CMPEQ(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      NORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 14:
		      /* TODO: special case */
		      /*ret.opcode = MVCL;
			MVCL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
			ret.data = *(S_GPR + (ret.target));*/
		      {
			unsigned sourceCluster = (inst >> 6) & 0xf;
			unsigned destCluster = (inst >> 10) & 0xf;

			clusterT *sourceClusterP;
			sourceClusterP = (clusterT *)((unsigned)hypercontext->registers + (sourceCluster * sizeof(clusterT)));
			clusterT *destClusterP;
			destClusterP = (clusterT *)((unsigned)hypercontext->registers + (destCluster * sizeof(clusterT)));

			ADD(*(destClusterP->S_GPR + (ret.target)), *(sourceClusterP->pS_GPR + (ret.source1)), 0);
			insertSource(&(ret.source[0]), S_PRED, (inst & 0x3f), 1, *(sourceClusterP->pS_GPR + (inst & 0x3f)), sourceCluster);
			insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, destCluster, *(destClusterP->S_GPR + ((inst >> 15) & 0x3f)));
		      }
		      break;
		    case 15:
		      /* CASM3 */
		      ret.opcode = CUSTOM;
		      extra = ((inst >> 12) & 0x7);
		      ret.executed = 0; /* operation is not executed */
		      switch(extra)
			{
			case 0:
			  /* TODO: fix this issue in the ISA */
			  printf("error, unknown CASM3\n");
			  break;
			case 1:
			  /*ret.opcode = XXX;
			    XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
			  printf("Unknown CASM3 -> CASM21 custom instruction\n");
#if 0
			  /* using this for clock */
			  printf("get time: %llu\n", cycleCount);
			  ret.target = 2;
			  *(S_GPR + (ret.target)) = cycleCount;
#endif
			  break;
			case 2:
			  ret.source1 = (inst & 0x3f);
			  ret.target = ((inst >> 15) & 0x3f);
			  ret.target2 = ((inst >> 6) & 0x3f);
#ifdef DEBUG
			  printf("vthread_join\n");
#endif
			  /*printf("source: %d\n", *(pS_GPR + ret.source1));
			    printf("ret.target: %d\n", *(pS_GPR + ret.target));
			    printf("ret.target2: %d\n", *(pS_GPR + ret.target2));*/
			  hypercontext->VT_CTRL &= 0xfffff807;
			  hypercontext->VT_CTRL |= TERMINATED_ASYNC_HOST << 3;
			  hypercontext->joinWaiting = *(pS_GPR + ret.source1);
#if 0
			  *(join + (cnt * HCNT) + hcnt) = *(pS_GPR + ret.source1);
#endif
			  break;
			default:
			  printf("UNKNOWN CASM3 custom instruction\n");
			  break;
			}
		      ret.data = 0;
		      break;
		    }
		  break;
		case 1:
		  ret.addr = _B_iss;
		  switch(opc)
		    {
		    case 0:
		      ret.opcode = CMPEQ;
		      CMPEQ(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      NORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 14:
		      ret.opcode = MTB;
		      MTB(*(S_PR + (ret.target)), ret.source1);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 15:
		      ret.opcode = MTBF;
		      MTBF(*(S_PR + (ret.target)), ret.source1);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    }
		  break;
		}
	      break;
	    case 5:
	      extra = (inst >> 25) & 0x1;

	      ret.target = (inst >> 15) & 0x3f;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = immediate;

	      switch(extra)
		{
		case 0:
		  ret.addr = _R_iss;
		  switch(opc)
		    {
		    case 0:
		      ret.opcode = CMPEQ;
		      CMPEQ(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      NORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    default:
		      /*ret.opcode = XXX;
			XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		      printf("UNKNOWN OPCODE!\n");
		      break;
		    }
		  break;
		case 1:
		  ret.addr = _B_iss;
		  switch(opc)
		    {
		    case 0:
		      ret.opcode = CMPEQ;
		      CMPEQ(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      NORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM32, 0, 1, immediate, 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    default:
		      /*ret.opcode = XXX;
			XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		      printf("UNKNOWN OPCODE!\n");
		      break;
		    }
		  break;
		}
	      break;
	    case 6:
	      extra = (inst >> 25) & 0x1;

	      ret.target = (inst >> 15) & 0x3f;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8); /* IMM9 */

	      switch(extra)
		{
		case 0:
		  ret.addr = _R_iss;
		  switch(opc)
		    {
		    case 0:
		      ret.opcode = CMPEQ;
		      CMPEQ(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      NORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 15) & 0x3f), 1, clust, *(S_GPR + ((inst >> 15) & 0x3f)));
		      break;
		    default:
		      /*ret.opcode = XXX;
			XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		      printf("UNKNOWN OPCODE!\n");
		      break;
		    }
		  break;
		case 1:
		  ret.addr = _B_iss;
		  switch(opc)
		    {
		    case 0:
		      ret.opcode = CMPEQ;
		      CMPEQ(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      NORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));

		      insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		      insertSource(&(ret.source[1]), IMM9, 0, 1, (((inst >> 6) & 0x1ff) ^ (1 << 8)) - (1 << 8), 0);
		      insertDest(&(ret.dest[0]), S_PRED, 1, ((inst >> 15) & 0x7), 1, clust, *(S_PR + ((inst >> 15) & 0x7)));
		      break;
		    default:
		      /*ret.opcode = XXX;
			XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		      printf("UNKNOWN OPCODE!\n");
		      break;
		    }
		  break;
		}
	      break;
	    case 7:
	      ret.addr = _MEM_iss;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = *(pS_GPR + ((inst >> 6) & 0x3f));

	      /*ret.target = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11) + ret.source1;*/ /* IMM12 */

	      switch(opc)
		{
		case 0:
		  ret.opcode = STB;
		  ret.target = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11) + ret.source1; /* IMM12 */
		  memRequest(system, NULL, ret.target, hypercontext->VT_CTRL, mSTB, *(pS_GPR + ((inst >> 6) & 0x3f)));
		  ret.data = ret.source2;

		  insertSource(&(ret.source[0]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
		  insertDest(&(ret.dest[0]), MEM, 1, 0, 1, 0, *(pS_GPR + (inst & 0x3f)));
		  ret.maddr = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11) + ret.source[0].value;
		  ret.maddrValid = 1;
		  break;
		case 1:
		  ret.opcode = STH;
		  ret.target = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11) + ret.source1; /* IMM12 */
		  memRequest(system, NULL, ret.target, hypercontext->VT_CTRL, mSTH, *(pS_GPR + ((inst >> 6) & 0x3f)));
		  ret.data = ret.source2;

		  insertSource(&(ret.source[0]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
		  insertDest(&(ret.dest[0]), MEM, 1, 0, 1, 0, *(pS_GPR + (inst & 0x3f)));
		  ret.maddr = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11) + ret.source[0].value;
		  ret.maddrValid = 1;
		  break;
		case 2:
		  ret.opcode = STW;
		  ret.target = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11) + ret.source1; /* IMM12 */
		  memRequest(system, NULL, ret.target, hypercontext->VT_CTRL, mSTW, *(pS_GPR + ((inst >> 6) & 0x3f)));
		  ret.data = ret.source2;

		  insertSource(&(ret.source[0]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
		  insertDest(&(ret.dest[0]), MEM, 1, 0, 1, 0, *(pS_GPR + (inst & 0x3f)));
		  /*insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertDest(&(ret.dest[0]), MEM, 1, 0, 0, 0, 0);*/
		  ret.maddr = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11) + ret.source[0].value;
		  ret.maddrValid = 1;
		  break;
		case 3:
		  /* not yet implemented: STWPS/STWAS */
		  ret.data = 0;
		  break;
		}
	      break;
	    case 8:
	      printf("this is not yet implemented: format 8\n");
	      /* not yet implemented */
	      ret.data = 0;
	      break;
	    case 9:
	      printf("this is not yet implemented: format 9\n");
	      /* not yet implemented */
	      ret.data = 0;
	      break;
	    case 10:
	      ret.addr = _R_iss;
	      ret.target = (inst >> 6) & 0x3f;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11); /* IMM12 */

	      switch(opc)
		{
		case 0:
		  ret.opcode = LDSB;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSB, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDSB_iss(&ldsbVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldsbVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 1:
		  ret.opcode = LDSB; /* LDSB.D */
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSB, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDSB_iss(&ldsbVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldsbVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 2:
		  /* not yet implemented: LDV */
		  ret.data = 0;
		  break;
		default:
		  /*ret.opcode = XXX;
		    XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		  printf("UNKNOWN OPCODE!\n");
		  break;
		}
	      break;
	    case 11:

	      ret.addr = _R_iss;
	      ret.target = (inst >> 6) & 0x3f;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11); /* IMM12 */

	      switch(opc)
		{
		case 0:
		  ret.opcode = LDUB;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUB, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDUB_iss(&ldubVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldubVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 1:
		  ret.opcode = LDUB; /* LDUB.D */
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUB, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDUB_iss(&ldubVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldubVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 2:
		  /* not yet implemented: LDV.D */
		  ret.data = 0;
		  break;
		default:
		  /*ret.opcode = XXX;
		    XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		  printf("UNKNOWN OPCODE!\n");
		  break;
		}
	      break;
	    case 12:
	      ret.addr = _R_iss;
	      ret.target = (inst >> 6) & 0x3f;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11); /* IMM12 */

	      switch(opc)
		{
		case 0:
		  ret.opcode = LDSH;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSH, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDSH_iss(&ldshVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldshVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 1:
		  ret.opcode = LDSH; /* LDSH.D */
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSH, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDSH_iss(&ldshVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldshVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		default:
		  /*ret.opcode = XXX;
		    XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		  printf("UNKNOWN OPCODE!\n");
		  break;
		}
	      break;
	    case 13:
	      ret.addr = _R_iss;
	      ret.target = (inst >> 6) & 0x3f;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11); /* IMM12 */

	      switch(opc)
		{
		case 0:
		  ret.opcode = LDUH;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUH, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDUH_iss(&lduhVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 1:
		  ret.opcode = LDUH; /* LDUH.D */
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUH, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDUH_iss(&lduhVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, lduhVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		default:
		  /*ret.opcode = XXX;
		    XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		  printf("UNKNOWN OPCODE!\n");
		  break;
		}
	      break;
	    case 14:
	      ret.addr = _R_iss;
	      ret.target = (inst >> 6) & 0x3f;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11); /* IMM12 */

	      switch(opc)
		{
		case 0:
		  ret.opcode = LDW;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDW_iss(&ldwVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldwVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 1:
		  ret.opcode = LDW; /* LDW.D */
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM12, 0, 1, (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDW_iss(&ldwVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldwVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 2:
		  /* not yet implemented: LDWPS/LDWAS */
		  ret.data = 0;
		  break;
		default:
		  /*ret.opcode = XXX;
		    XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		  printf("UNKNOWN OPCODE!\n");
		  break;
		}
	      break;
	    case 15:
	      ret.addr = _R_iss;
	      ret.target = (inst >> 6) & 0x3f;

	      ret.source1 = *(pS_GPR + ((inst) & 0x3f));
	      ret.source2 = (((inst >> 12) & 0xff) ^ (1 << 7)) - (1 << 7); /* IMM8 */

	      switch(opc)
		{
		case 0:
		  ret.opcode = LDUB;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUB, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM8, 0, 1, (((inst >> 12) & 0xff) ^ (1 << 7)) - (1 << 7), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDUB_iss(&ldubVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldubVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 1:
		  ret.opcode = LDSB;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSB, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM8, 0, 1, (((inst >> 12) & 0xff) ^ (1 << 7)) - (1 << 7), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDSB_iss(&ldsbVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldsbVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 2:
		  ret.opcode = LDUH;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUH, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM8, 0, 1, (((inst >> 12) & 0xff) ^ (1 << 7)) - (1 << 7), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDUH_iss(&lduhVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, lduhVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 3:
		  ret.opcode = LDSH;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSH, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM8, 0, 1, (((inst >> 12) & 0xff) ^ (1 << 7)) - (1 << 7), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDSH_iss(&ldshVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldshVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 4:
		  ret.opcode = LDW;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW, 0);
		  ret.data = -1;

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM8, 0, 1, (((inst >> 12) & 0xff) ^ (1 << 7)) - (1 << 7), 0);
#ifdef DEBUGmem
		  printf("loading from: 0x%x\n", ((ret.source[0].value + ret.source[1].value) + (unsigned)(system->dram)));
#endif
		  if((ret.source[0].value + ret.source[1].value) >= dramSize)
		    { if(suppressOOB != 1) { printf("ERROR: OOB\n"); } }
		  else
		    _LDW_iss(&ldwVal, ((int)system->dram + (ret.source[0].value + ret.source[1].value)));
		  insertDest(&(ret.dest[0]), GPR, 1, ((inst >> 6) & 0x3f), 1, clust, ldwVal);
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 5:
		  /* not yet implemented: LDAS */
		  ret.data = 0;
		  break;
		case 32:
		  /* TODO: memAlign */
		  /* source2 + dest wrong way round */
		  ret.opcode = STB;
		  memRequest(system, NULL, (ret.source2 + ret.source1), hypercontext->VT_CTRL, mSTB, *(pS_GPR + (ret.target)));
		  ret.data = *(pS_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, ((inst >> 6) & 0x3f), 1, *(pS_GPR + ((inst >> 6) & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM8, 0, 1, (((inst >> 12) & 0xff) ^ (1 << 7)) - (1 << 7), 0);
		  insertDest(&(ret.dest[0]), MEM, 1, 0, 1, 0, *(pS_GPR + (inst & 0x3f)));
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 33:
		  /* TODO: memAlign */
		  /* source2 + dest wrong way round */
		  ret.opcode = STH; /* STHW */
		  memRequest(system, NULL, (ret.source2 + ret.source1), hypercontext->VT_CTRL, mSTH, *(pS_GPR + (ret.target)));
		  ret.data = *(pS_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM8, 0, 1, (((inst >> 12) & 0xff) ^ (1 << 7)) - (1 << 7), 0);
		  insertDest(&(ret.dest[0]), MEM, 1, 0, 1, 0, *(pS_GPR + (inst & 0x3f)));
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 34:
		  /* TODO: memAlign */
		  /* source2 + dest wrong way round */
		  ret.opcode = STW;
		  memRequest(system, NULL, (ret.source2 + ret.source1), hypercontext->VT_CTRL, mSTW, *(pS_GPR + (ret.target)));
		  ret.data = *(pS_GPR + (ret.target));

		  insertSource(&(ret.source[0]), GPR, (inst & 0x3f), 1, *(pS_GPR + (inst & 0x3f)), clust);
		  insertSource(&(ret.source[1]), IMM8, 0, 1, (((inst >> 12) & 0xff) ^ (1 << 7)) - (1 << 7), 0);
		  insertDest(&(ret.dest[0]), MEM, 1, 0, 1, 0, *(pS_GPR + (inst & 0x3f)));
		  ret.maddr = ret.source[0].value + ret.source[1].value;
		  ret.maddrValid = 1;
		  break;
		case 35:
		  /* not yet implemented: STAS */
		  ret.data = 0;
		  break;
		default:
		  /*ret.opcode = XXX;
		    XXX(*(S_GPR + (ret.target)), ret.source1, ret.source2);*/
		  printf("UNKNOWN OPCODE!\n");
		  break;
		}
	      break;
	    default:
	      printf("unknown format: %d\n", format);
	      printf("UNKNOWN OPCODE!\n");
	      break;
	    }
	}
    }

  return ret;
}

void insertSource(sourceReg *src,
		  regT target,
		  unsigned short reg,
		  unsigned char valid,
		  unsigned value,
		  unsigned char cluster) {
  src->target = target;
  src->reg = reg;
  src->valid = valid;
  src->value = value;
  src->cluster = cluster;
  return;
}

void insertDest(destReg *dst,
		regT target,
		unsigned char chk,
		unsigned short reg,
		unsigned char valid,
		unsigned char cluster,
		unsigned res) {
  dst->target = target;
  dst->chk = chk;
  dst->reg = reg;
  dst->valid = valid;
  dst->cluster = cluster;
  dst->res = res;
  return;
}
