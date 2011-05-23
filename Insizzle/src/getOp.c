#include <stdio.h>
#include "functions.h"
#include "macros.h"

packetT getOp(unsigned format, unsigned opc, unsigned inst, unsigned immediate, /*unsigned *dataP,*/ hyperContextT *hypercontext, systemT *system, contextT *context, unsigned VT_CTRL)
{
  unsigned clust = VT_CTRL; /* TODO: Remove this */
  unsigned extra;
  packetT ret;
  /*int newThread;*/
  /*char *data = (char *)dataP;*/

  unsigned *S_GPR, *pS_GPR;
  unsigned *S_FPR, *pS_FPR;
  unsigned *S_VR, *pS_VR;
  unsigned char *S_PR, *pS_PR;

  clusterT *cluster;

  unsigned *S_L = &(hypercontext->linkReg);
  unsigned *pS_L = &(hypercontext->plinkReg);

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
#ifdef DEBUG
		      printf("ADD\n");
#endif
		      ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
#ifdef DEBUG
		      printf("result: 0x%x\n", *(S_GPR + (ret.target)));
#endif
		      ret.data = *(S_GPR + (ret.target));
		    }
		  break;
		case 1:
		  ret.opcode = AND;
		  AND(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 2:
		  ret.opcode = ANDC;
		  ANDC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 3:
		  ret.opcode = MAXS;
		  MAXS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 4:
		  ret.opcode = MAXU;
		  MAXU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 5:
		  ret.opcode = MINS;
		  MINS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 6:
		  ret.opcode = MINU;
		  MINU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 7:
		  ret.opcode = OR;
		  OR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 8:
		  ret.opcode = ORC;
		  ORC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 9:
		  ret.opcode = SH1ADD;
		  SH1ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 10:
		  ret.opcode = SH2ADD;
		  SH2ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 11:
		  ret.opcode = SH3ADD;
		  SH3ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 12:
		  ret.opcode = SH4ADD;
		  SH4ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 13:
		  ret.opcode = SHL;
		  SHL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 14:
		  ret.opcode = SHRS;
		  SHRS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 15:
		  ret.opcode = SHRU;
		  SHRU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 16:
		  ret.opcode = SUB;
		  SUB(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 17:
		  ret.opcode = XOR;
		  XOR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 18:
		  ret.opcode = MLSLL;
		  MLSLL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 19:
		  ret.opcode = MLULL;
		  MLULL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 20:
		  ret.opcode = MLSLH;
		  MLSLH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 21:
		  ret.opcode = MLULH;
		  MLULH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 22:
		  ret.opcode = MLSHH;
		  MLSHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 23:
		  ret.opcode = MLUHH;
		  MLUHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 24:
		  ret.opcode = MLSL;
		  MLSL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 25:
		  ret.opcode = MLUL;
		  MLUL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 26:
		  ret.opcode = MLSH;
		  MLSH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 27:
		  ret.opcode = MLUH;
		  MLUH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 28:
		  ret.opcode = MLSHS;
		  MLSHS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 29:
		  ret.opcode = SWBT;
		  ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		  SWBT(*(S_GPR + (ret.target)), ret.source3, ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 30:
		  ret.opcode = SWBF;
		  ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		  SWBF(*(S_GPR + (ret.target)), ret.source3, ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 31:
		  ret.opcode = RSUB;
		  RSUB(*(S_GPR + (ret.target)), ret.source2, ret.source1);
		  ret.data = *(S_GPR + (ret.target));
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
#ifdef DEBUG
		      printf("ADD2\n");
		      printf("r %d = %d + %d\n", ((inst >> 15) & 0x3f), ret.source1, ret.source2);
#endif
		      ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
#ifdef DEBUG
		      printf("result: %d\n", *(S_GPR + (ret.target)));
#endif
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 1:
		      ret.opcode = AND;
		      AND(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 2:
		      ret.opcode = ANDC;
		      ANDC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 3:
		      ret.opcode = MAXS;
		      MAXS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 4:
		      ret.opcode = MAXU;
		      MAXU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 5:
		      ret.opcode = MINS;
		      MINS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 6:
		      ret.opcode = MINU;
		      MINU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 7:
		      ret.opcode = OR;
		      OR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 8:
		      ret.opcode = ORC;
		      ORC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 9:
		      ret.opcode = SH1ADD;
		      SH1ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 10:
		      ret.opcode = SH2ADD;
		      SH2ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 11:
		      ret.opcode = SH3ADD;
		      SH3ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 12:
		      ret.opcode = SH4ADD;
		      SH4ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 13:
		      ret.opcode = SHL;
		      SHL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 14:
		      ret.opcode = SHRS;
		      SHRS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 15:
		      ret.opcode = SHRU;
		      SHRU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 16:
		      ret.opcode = SUB;
		      SUB(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 17:
		      ret.opcode = XOR;
		      XOR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 18:
		      ret.opcode = MLSLL;
		      MLSLL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 19:
		      ret.opcode = MLULL;
		      MLULL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 20:
		      ret.opcode = MLSLH;
		      MLSLH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 21:
		      ret.opcode = MLULH;
		      MLULH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 22:
		      ret.opcode = MLSHH;
		      MLSHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 23:
		      ret.opcode = MLUHH;
		      MLUHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 24:
		      ret.opcode = MLSL;
		      MLSL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 25:
		      ret.opcode = MLUL;
		      MLUL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 26:
		      ret.opcode = MLSH;
		      MLSH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 27:
		      ret.opcode = MLUH;
		      MLUH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 28:
		      ret.opcode = MLSHS;
		      MLSHS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 29:
		      ret.opcode = SWBT;
		      ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		      SWBT(*(S_GPR + (ret.target)), ret.source3, ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 30:
		      ret.opcode = SWBF;
		      ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		      SWBF(*(S_GPR + (ret.target)), ret.source3, ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 31:
		      ret.opcode = RSUB;
		      RSUB(*(S_GPR + (ret.target)), ret.source2, ret.source1);
		      ret.data = *(S_GPR + (ret.target));
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
		      break;
		    case 1:
		      ret.opcode = SEXTH;
		      SEXTH(*(S_GPR + (ret.target)), ret.source1);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 2:
		      ret.opcode = ZEXTB;
		      ZEXTB(*(S_GPR + (ret.target)), ret.source1);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 3:
		      ret.opcode = ZEXTH;
		      ZEXTH(*(S_GPR + (ret.target)), ret.source1);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 4:
		      ret.opcode = MVL2G;
		      ADD(*(S_GPR + (ret.target)), *(pS_L), 0);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 5:
		      ret.addr = _L_iss;
		      ret.opcode = MVG2L;
		      ADD(*(S_L), ret.source1, 0);
		      ret.data = *(S_L);
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
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSB);
		      ret.data = -1;
		      break;
		    case 4:
		      ret.opcode = LDSB; /* LBSB.D */
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSB);
		      ret.data = -1;
		      break;
		    case 7:
		      ret.opcode = LDUB;
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUB);
		      ret.data = -1;
		      break;
		    case 8:
		      ret.opcode = LDUB; /* LBUB.D */
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUB);
		      ret.data = -1;
		      break;
		    case 11:
		      ret.opcode = LDSH;
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSH);
		      ret.data = -1;
		      break;
		    case 12:
		      ret.opcode = LDSH; /* LBSH.D */
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSH);
		      ret.data = -1;
		      break;
		    case 15:
		      ret.opcode = LDUH;
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUH);
		      ret.data = -1;
		      break;
		    case 16:
		      ret.opcode = LDUH; /* LDUH.D */
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUH);
		      ret.data = -1;
		      break;
		    case 18:
		      ret.opcode = LDW; /* LDW.D */
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW);
		      ret.data = -1;
		      break;
		    case 19:
		      ret.opcode = LDW;
		      memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW);
		      ret.data = -1;
		      break;
		    case 20:
		      ret.opcode = PSYSCALL;
		      /* not yet impletmented */
		      ret.data = 0;
		      break;
		    case 21:
		      ret.opcode = LDL;
		      memRequest(system, S_L, (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW);
		      ret.data = -1;
		      ret.addr = _L_iss;
		      break;
		    case 24:
		      ret.opcode = CUSTOM;
		      /* not yet implemented: CASM7 */
		      ret.data = 0;
		      break;
		    case 25:
		      ret.opcode = CUSTOM;
		      /* not yet implemented: CASM6 */
		      ret.data = 0;
		      break;
		    case 26:
		      ret.opcode = CUSTOM; /* CASM5 */
		      /* need to figure out which it is */
		      extra = ((immediate >> 30) & 0x3);
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
			  printf("CASM32\n");
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
				    printf("\thypercontext: %d\n", i);
				    hcnt = (hyperContextT *)((unsigned)context->hypercontext + (i * sizeof(hyperContextT)));
				    printf("\t0x%08x\n", hcnt->VT_CTRL);
				    deepstate = (hcnt->VT_CTRL >> 3) & 0xff;
				    debug = (hcnt->VT_CTRL >> 1) & 0x1;

				    if((deepstate == READY) && (!debug))
				      {
					printf("need to set this thread up!\n");
					found = 1;

					hcnt->programCounter = *(pS_GPR + ret.source2);
					GPR = hcnt->S_GPR;
					*(GPR + 3) = *(pS_GPR + ret.source3);

					printf("\t\tset PC: 0x%x\n", hcnt->programCounter);
					printf("\t\tset args: 0x%x\n", *(GPR + 3));

					/* then need to set r7 to id */
					*(S_GPR + ret.target2) = hcnt->VT_CTRL >> 12;

					newThreadRequest(hypercontext->VT_CTRL, hcnt->VT_CTRL, system);

					break;
				      }
				    else
				      {
					printf("\tnot available\n");
				      }
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
				    printf("\tcontext: %d\n", i);
				    cnt = (contextT *)((unsigned)system->context + (i * sizeof(contextT)));

				    for(j=0;j<cnt->numHyperContext;j++)
				      {
					printf("\thypercontext: %d\n", j);
					hcnt = (hyperContextT *)((unsigned)cnt->hypercontext + (j * sizeof(hyperContextT)));
					printf("\t0x%08x\n", hcnt->VT_CTRL);
					deepstate = (hcnt->VT_CTRL >> 3) & 0xff;
					debug = (hcnt->VT_CTRL >> 1) & 0x1;

					if((deepstate == READY) && (!debug))
					  {
					    printf("need to set this thread up!\n");
					    found = 1;

					    hcnt->programCounter = *(pS_GPR + ret.source2);
					    GPR = hcnt->S_GPR;
					    *(GPR + 3) = *(pS_GPR + ret.source3);

					    printf("\t\tset PC: 0x%x\n", hcnt->programCounter);
					    printf("\t\tset args: 0x%x\n", *(GPR + 3));

					    /* then need to set r7 to id */
					    *(S_GPR + ret.target2) = hcnt->VT_CTRL >> 12;

					    newThreadRequest(hypercontext->VT_CTRL, hcnt->VT_CTRL, system);

					    break;
					  }
					else
					  {
					    printf("\tnot available\n");
					  }
				      }
				    if(found)
				      break;
				  }

				if(!found)
				  {
				    /* TODO: error out, need to allow to carry on */
				    printf("ERROR: There was a problem allocating a new thread (vthread_create_local)\n");
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
		      break;
		    case 28:
		      ret.opcode = CUSTOM;
		      /* not yet implemented: CASM3 */
		      ret.data = 0;
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
#ifdef DEBUG
		  printf("ret.source1: 0x%x\n", ret.source1);
#endif
		  ret.source2 = *(pS_GPR + ((inst >> 15) & 0x3f));

		  /*ret.target = immediate + ret.source1;*/

		  switch(opc)
		    {
		    case 0:
		      ret.opcode = STB;
		      ret.target = immediate + ret.source1;
		      /*printf("HERE1: value to store: 0x%x (%d)\n", *(S_GPR + ((inst >> 15) & 0x3f)), ((inst >> 15) & 0x3f));*/
		      memRequest(system, (pS_GPR + ((inst >> 15) & 0x3f)), ret.target, hypercontext->VT_CTRL, mSTB);
		      ret.data = ret.source2;
		      break;
		    case 1:
		      ret.opcode = STH;
		      ret.target = immediate + ret.source1;
		      memRequest(system, (pS_GPR + ((inst >> 15) & 0x3f)), ret.target, hypercontext->VT_CTRL, mSTH);
		      ret.data = ret.source2;
		      break;
		    case 2:
		      ret.opcode = STW;
		      ret.target = immediate + ret.source1;
#ifdef DEBUG
		      printf("STW to register: %d\n", ((inst >> 15) & 0x3f));
#endif
		      memRequest(system, (pS_GPR + ((inst >> 15) & 0x3f)), ret.target, hypercontext->VT_CTRL, mSTW);
		      ret.data = ret.source2;
		      break;
		    case 3:
		      ret.opcode = PFT;
		      /* not yet implemented */
		      ret.data = 0;
		      break;
		    case 12:
		      ret.opcode = STL;
		      ret.target = immediate + ret.source1;
#ifdef DEBUG
		      printf("STL!\n");
		      printf("immediate: %d\n", immediate);
		      printf("ret.source1: %d\n", ret.source1);
#endif
		      memRequest(system, pS_L, ret.target, hypercontext->VT_CTRL, mSTW);
		      ret.data = ret.source2;
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
#ifdef DEBUG
		  printf("IT SHOULD BE THIS ADD!\n");
#endif
		  ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 1:
		  ret.opcode = AND;
		  AND(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 2:
		  ret.opcode = ANDC;
		  ANDC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 3:
		  ret.opcode = MAXS;
		  MAXS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 4:
		  ret.opcode = MAXU;
		  MAXU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 5:
		  ret.opcode = MINS;
		  MINS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 6:
		  ret.opcode = MINU;
		  MINU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 7:
		  ret.opcode = OR;
		  OR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 8:
		  ret.opcode = ORC;
		  ORC(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 9:
		  ret.opcode = SH1ADD;
		  SH1ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 10:
		  ret.opcode = SH2ADD;
		  SH2ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 11:
		  ret.opcode = SH3ADD;
		  SH3ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 12:
		  ret.opcode = SH4ADD;
		  SH4ADD(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 13:
		  ret.opcode = SHL;
		  SHL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 14:
		  ret.opcode = SHRS;
		  SHRS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 15:
		  ret.opcode = SHRU;
		  SHRU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 16:
		  ret.opcode = SUB;
		  SUB(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 17:
		  ret.opcode = XOR;
		  XOR(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 18:
		  ret.opcode = MLSLL;
		  MLSLL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 19:
		  ret.opcode = MLULL;
		  MLULL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 20:
		  ret.opcode = MLSLH;
		  MLSLH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 21:
		  ret.opcode = MLULH;
		  MLULH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 22:
		  ret.opcode = MLSHH;
		  MLSHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 23:
		  ret.opcode = MLUHH;
		  MLUHH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 24:
		  ret.opcode = MLSL;
		  MLSL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 25:
		  ret.opcode = MLUL;
		  MLUL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 26:
		  ret.opcode = MLSH;
		  MLSH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 27:
		  ret.opcode = MLUH;
		  MLUH(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
		  break;
		case 28:
		  ret.opcode = MLSHS;
		  MLSHS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		  ret.data = *(S_GPR + (ret.target));
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
			  /* set ctrl register into debug state */
			  hypercontext->VT_CTRL |= 1 << 1;
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
			  printf("HALT! WHO GOES THERE!\n");
			  /* set ctrl reg to terminated */
			  /* TODO: THIS */
			  /*printOutDataPerThread(data, cnt, hcnt);*/
			  hypercontext->VT_CTRL |= 1 << 1;
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
		  break;
		case 1:
		  ret.opcode = DIVS;
		  ret.source3 = *(pS_PR + ((inst >> 12) & 0x7));
		  DIVS(*(S_GPR + (ret.target)), *(S_PR + (ret.target2)), ret.source1, ret.source2, ret.source3);
		  ret.data = *(S_GPR + (ret.target));
		  ret.data2 = *(S_PR + (ret.target2));
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
		      if(*(clusterForBranch->pS_PR + (ret.target)))
			{
			  /* branch taken */
			  hypercontext->branchTaken++;
			  /* need to set new PC */
			  ret.newPC = hypercontext->programCounter + ret.source1;
			  ret.newPCValid = 1;
			  /* need to add stall cycles */
			  /*hypercontext->stalled += PIPELINE_REFILL;*/
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
			  /*hypercontext->stalled += PIPELINE_REFILL;*/
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
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      /*printf("NORL - sim_r - ");*/
		      NORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 14:
		      /* TODO: special case */
		      /*ret.opcode = MVCL;
			MVCL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
			ret.data = *(S_GPR + (ret.target));*/
		      break;
		    case 15:
		      /* CASM3 */
		      ret.opcode = CUSTOM;
		      extra = ((inst >> 12) & 0x7);
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
			  break;
			case 2:
			  ret.source1 = (inst & 0x3f);
			  ret.target = ((inst >> 15) & 0x3f);
			  ret.target2 = ((inst >> 6) & 0x3f);
			  printf("vthread_join\n");
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
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      NORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      /*printf("NORL - sim_b (%d) - ", *(S_PR + (ret.target)));*/
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 14:
		      ret.opcode = MTB;
		      MTB(*(S_PR + (ret.target)), ret.source1);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 15:
		      ret.opcode = MTBF;
		      MTBF(*(S_PR + (ret.target)), ret.source1);
		      ret.data = *(S_PR + (ret.target));
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
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      NORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
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
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      NORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
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
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      NORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_GPR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_GPR + (ret.target));
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
		      break;
		    case 1:
		      ret.opcode = CMPGES;
		      CMPGES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 2:
		      ret.opcode = CMPGEU;
		      CMPGEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 3:
		      ret.opcode = CMPGTS;
		      CMPGTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 4:
		      ret.opcode = CMPGTU;
		      CMPGTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 5:
		      ret.opcode = CMPLES;
		      CMPLES(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 6:
		      ret.opcode = CMPLEU;
		      CMPLEU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 7:
		      ret.opcode = CMPLTS;
		      CMPLTS(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 8:
		      ret.opcode = CMPLTU;
		      CMPLTU(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 9:
		      ret.opcode = CMPNE;
		      CMPNE(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 10:
		      ret.opcode = NANDL;
		      NANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 11:
		      ret.opcode = NORL;
		      NORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 12:
		      ret.opcode = ORL;
		      ORL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
		      break;
		    case 13:
		      ret.opcode = ANDL;
		      ANDL(*(S_PR + (ret.target)), ret.source1, ret.source2);
		      ret.data = *(S_PR + (ret.target));
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
		  /*printf("HERE2: value to store: 0x%x (%d)\n", *(S_GPR + ((inst >> 6) & 0x3f)), ((inst >> 6) & 0x3f));*/
		  memRequest(system, (pS_GPR + ((inst >> 6) & 0x3f)), ret.target, hypercontext->VT_CTRL, mSTB);
		  ret.data = ret.source2;
		  break;
		case 1:
		  ret.opcode = STH;
		  ret.target = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11) + ret.source1; /* IMM12 */
		  memRequest(system, (pS_GPR + ((inst >> 6) & 0x3f)), ret.target, hypercontext->VT_CTRL, mSTH);
		  ret.data = ret.source2;
		  break;
		case 2:
		  ret.opcode = STW;
		  ret.target = (((inst >> 12) & 0xfff) ^ (1 << 11)) - (1 << 11) + ret.source1; /* IMM12 */
#ifdef DEBUG
		  printf("STW to register: %d\n", ((inst >> 6) & 0x3f));
#endif
		  memRequest(system, (pS_GPR + ((inst >> 6) & 0x3f)), ret.target, hypercontext->VT_CTRL, mSTW);
		  ret.data = ret.source2;
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
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSB);
		  ret.data = -1;
		  break;
		case 1:
		  ret.opcode = LDSB; /* LDSB.D */
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSB);
		  ret.data = -1;
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
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUB);
		  ret.data = -1;
		  break;
		case 1:
		  ret.opcode = LDUB; /* LDUB.D */
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUB);
		  ret.data = -1;
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
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSH);
		  ret.data = -1;
		  break;
		case 1:
		  ret.opcode = LDSH; /* LDSH.D */
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSH);
		  ret.data = -1;
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
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUH);
		  ret.data = -1;
		  break;
		case 1:
		  ret.opcode = LDUH; /* LDUH.D */
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUH);
		  ret.data = -1;
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
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW);
		  ret.data = -1;
		  break;
		case 1:
		  ret.opcode = LDW; /* LDW.D */
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW);
		  ret.data = -1;
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
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUB);
		  ret.data = -1;
		  break;
		case 1:
		  ret.opcode = LDSB;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSB);
		  ret.data = -1;
		  break;
		case 2:
		  ret.opcode = LDUH;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDUH);
		  ret.data = -1;
		  break;
		case 3:
		  ret.opcode = LDSH;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDSH);
		  ret.data = -1;
		  break;
		case 4:
		  ret.opcode = LDW;
		  memRequest(system, (S_GPR + (ret.target)), (ret.source1 + ret.source2), hypercontext->VT_CTRL, mLDW);
		  ret.data = -1;
		  break;
		case 5:
		  /* not yet implemented: LDAS */
		  ret.data = 0;
		  break;
		case 32:
		  /* TODO: memAlign */
		  /* source2 + dest wrong way round */
		  ret.opcode = STB;
		  /*printf("HERE3: value to store: 0x%x (%d)\n", *(S_GPR + ret.target), ret.target);*/
		  memRequest(system, (pS_GPR + (ret.target)), (ret.source2 + ret.source1), hypercontext->VT_CTRL, mSTB);
		  ret.data = *(pS_GPR + (ret.target));
		  break;
		case 33:
		  /* TODO: memAlign */
		  /* source2 + dest wrong way round */
		  ret.opcode = STH; /* STHW */
		  memRequest(system, (pS_GPR + (ret.target)), (ret.source2 + ret.source1), hypercontext->VT_CTRL, mSTH);
		  ret.data = *(pS_GPR + (ret.target));
		  break;
		case 34:
		  /* TODO: memAlign */
		  /* source2 + dest wrong way round */
		  ret.opcode = STW;
#ifdef DEBUG
		  printf("STW to register: %d\n", ret.target);
#endif
		  memRequest(system, (pS_GPR + (ret.target)), (ret.source2 + ret.source1), hypercontext->VT_CTRL, mSTW);
		  ret.data = *(pS_GPR + (ret.target));
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
