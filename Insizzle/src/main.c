#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "xmlRead.h"
#include "functions.h"
#include "macros.h"

/* compile with
   gcc -o Insizzle `xml2-config --cflags` main.c `xml2-config --libs` -m32 -Wall -Wextra -pedantic -std=c99
*/

#ifndef API
int main(int argc, char *argv[])
{

  unsigned i, j, k;
  systemConfig *SYS;
  contextConfig *CNT;
  hyperContextConfig *HCNT;
  /*clusterTemplateConfig *CLUT;*/

  systemT *system;
  contextT *context;
  hyperContextT *hypercontext;
  /*clusterT *cluster;*/
  /*unsigned *tempP, clust;*/
  unsigned bundleCount;
  unsigned long long *bundleCountP;

  /*unsigned curClustTemplate, curClustInstance;*/
  /*unsigned sGPROffset, sFPROffset, sVROffset, sPROffset;*/
  cycleCount = 0;
  char *versionNumber = "Insizzle_Revision";
  similarIRAM = 0;
  suppressOOB = 1;
  STACK_SIZE = 12;
  PRINT_OUT = 0;

  printf("Insizzle (%s)\n", versionNumber);

#ifndef API
  if(argc < 2)
    {
      printf("you need to specify an xml machine model file\n");
      return -1;
    }

  if(readConf(argv[1]) == -1)
    {
      printf("error reading config\n");
      return -1;
    }

  printf("Galaxy setup completed.\n");
  /* for each other argv */
  for(i=2;i<(unsigned)argc;i++) {
    if(!strcmp(argv[i], "-similarIRAM")) {
      similarIRAM = 1;
    }
    else if(!strcmp(argv[i], "-suppressOOB")) {
      suppressOOB = 1;
    }
    else if(!strncmp(argv[i], "-stack=", 7)) {
      sscanf(argv[i], "-stack=%d", (int *)&STACK_SIZE);
    }
    else if(!strcmp(argv[i], "-printout")) {
      PRINT_OUT = 1;
    }
    else {
      printf("Unknown argument: %s\n", argv[i]);
    }
  }

  /* call config to setup the galaxy */
  if(setupGalaxy() == -1)
    {
      printf("error setting up galaxy\n");
      return -1;
    }

  /* then run through like we do */

  /* for each system
        for each context
	  for each hypercontext
  */


  SYS = (systemConfig *)((unsigned)SYSTEM + (0 * sizeof(systemConfig)));
  system = (systemT *)((unsigned)galaxyT + (0 * sizeof(systemT)));
  context = (contextT *)((unsigned)system->context + (0 * sizeof(contextT)));

#ifdef VTHREAD
  /* need to set single hypercontext to active
     c 0 hc 0
  */
  for(i=0;i<(GALAXY_CONFIG & 0xff);i++)
    {
      SYS = (systemConfig *)((unsigned)SYSTEM + (i * sizeof(systemConfig)));
      system = (systemT *)((unsigned)galaxyT + (i * sizeof(systemT)));

      /* loop through contexts */
#if 0
      for(j=0;j<(SYS->SYSTEM_CONFIG & 0xff);j++)
	{
	  context = (contextT *)((unsigned)system->context + (j * sizeof(contextT)));
	  hypercontext = (hyperContextT *)((unsigned)context->hypercontext + (0 * sizeof(hyperContextT)));
	  hypercontext->VT_CTRL |= RUNNING << 3;
	}
#else
      context = (contextT *)((unsigned)system->context + (0 * sizeof(contextT)));
      hypercontext = (hyperContextT *)((unsigned)context->hypercontext + (0 * sizeof(hyperContextT)));
      hypercontext->VT_CTRL |= RUNNING << 3;
#endif
    }
#endif

  int totalHC = 0;

  printf("Stack Size / hypercontext set to %d KB\n", STACK_SIZE);
      /* loop through systems in the galaxy */
  for(i=0;i<(GALAXY_CONFIG & 0xff);i++)
    {
      SYS = (systemConfig *)((unsigned)SYSTEM + (i * sizeof(systemConfig)));
      system = (systemT *)((unsigned)galaxyT + (i * sizeof(systemT)));
      printf("dram_size: 0x%x\n", (((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000));

      /* loop through contexts */
      for(j=0;j<(SYS->SYSTEM_CONFIG & 0xff);j++)
	{
	  CNT = (contextConfig *)((unsigned)SYS->CONTEXT + (j * sizeof(contextConfig)));
	  context = (contextT *)((unsigned)system->context + (j * sizeof(contextT)));

	  /* loop through hypercontexts */
	  for(k=0;k<((CNT->CONTEXT_CONFIG >> 4) & 0xf);k++)
	    {
	      HCNT = (hyperContextConfig *)((unsigned)CNT->HCONTEXT + (k * sizeof(hyperContextConfig)));
	      hypercontext = (hyperContextT *)((unsigned)context->hypercontext + (k * sizeof(hyperContextT)));

	      /*printf("hypercontext: %d\n", k);*/
	      hypercontext->initialStackPointer = (((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000) - ((STACK_SIZE * 1000) * totalHC);
	      *(hypercontext->S_GPR + (unsigned)1) = (((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000) - ((STACK_SIZE * 1000) * totalHC);
	      *(hypercontext->pS_GPR + (unsigned)1) = (((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000) - ((STACK_SIZE * 1000) * totalHC);
	      printf("\tr1: 0x%x\n", *(hypercontext->S_GPR + (unsigned)1));
	      /*printf("\tr1: 0x%x\n", *(hypercontext->pS_GPR + (unsigned)1));*/
	      totalHC++;
	    }

	}
    }

#endif
#endif
  start = time(NULL);
#ifdef API
  int insizzleAPIClock(galaxyConfigT *galaxyConfig, hcTracePacketT gTracePacket[][MASTERCFG_CONTEXTS_MAX][MASTERCFG_HYPERCONTEXTS_MAX])
  {
    unsigned i, j, k;

    systemConfig *SYS;
    contextConfig *CNT;
    hyperContextConfig *HCNT;
    /*clusterTemplateConfig *CLUT;*/

    systemT *system;
    contextT *context;
    hyperContextT *hypercontext;
    unsigned bundleCount;
    unsigned long long *bundleCountP;
    unsigned bundlePos;
#else
  while(checkActive())
    {
#endif
#ifndef API
      if(PRINT_OUT) {
	printf("------------------------------------------------------------ end of cycle %lld\n", cycleCount);
      }
#endif

#ifdef DEBUG
      printf("galaxy: 0\n");
#endif
      /* loop through systems in the galaxy */
      for(i=0;i<(GALAXY_CONFIG & 0xff);i++)
	{
#ifdef DEBUG
	  printf("\tsystem: %d\n", i);
#endif
	  SYS = (systemConfig *)((unsigned)SYSTEM + (i * sizeof(systemConfig)));
	  system = (systemT *)((unsigned)galaxyT + (i * sizeof(systemT)));

	  /* loop through contexts */
	  for(j=0;j<(SYS->SYSTEM_CONFIG & 0xff);j++)
	    {
#ifdef DEBUG
	      printf("\t\tcontext: %d\n", j);
#endif
	      CNT = (contextConfig *)((unsigned)SYS->CONTEXT + (j * sizeof(contextConfig)));
	      context = (contextT *)((unsigned)system->context + (j * sizeof(contextT)));

	      /* loop through hypercontexts */
	      for(k=0;k<((CNT->CONTEXT_CONFIG >> 4) & 0xf);k++)
		{
#ifdef DEBUG
		  printf("\t\t\thypercontext: %d\n", k);
#endif

		  HCNT = (hyperContextConfig *)((unsigned)CNT->HCONTEXT + (k * sizeof(hyperContextConfig)));
		  hypercontext = (hyperContextT *)((unsigned)context->hypercontext + (k * sizeof(hyperContextT)));
#ifdef API
		  bundlePos = 0;
#endif
#ifdef DEBUG
		  printf("\t\t\t\thypercontext totalWidth: %d\n", hypercontext->totalWidth);
#endif
#ifdef DEBUG
		  printf("hypercontext cycleCount: %lld\n", hypercontext->cycleCount);
#endif
		  /* TODO: here will be the status check of the hypercontext to see what
		     state it is in
		  */
		  /* check the state VT_CTRL */
#ifdef DEBUG
		  printf("hypercontext->VT_CTRL: 0x%08x\n", hypercontext->VT_CTRL);
#endif

		  unsigned int deepstate = (hypercontext->VT_CTRL >> 3) & 0xff;
		  unsigned int sstep = (hypercontext->VT_CTRL >> 2) & 0x1;
		  unsigned int debug = (hypercontext->VT_CTRL >> 1) & 0x1;
		  /*unsigned int kernel = hypercontext->VT_CTRL & 0x1;*/

#ifdef DEBUG
		  printf("\tdeepstate: %d\n", deepstate);
#endif
#ifdef DEBUG
		  printf("\tsstep:     %d\n", sstep);
#endif
#ifdef DEBUG
		  printf("\tdebug:     %d\n", debug);
#endif
#ifdef DEBUG
		  /*printf("\tkernel:    %d\n", kernel);*/
#endif

#ifdef API
		  /* full 32 bit register */
		  /*gTracePacket[i][j][k].vt_ctrl = hypercontext->VT_CTRL;*/
		  /* just the deepstate */
		  gTracePacket[i][j][k].vt_ctrl = (hypercontext->VT_CTRL >> 3) & 0xff;
#endif
		  if(debug)
		    {

#ifdef DEBUG
		      printf("HC STATE: DEBUG\n");
#endif
		      /* nothing to do here */
		    }
		  else
		    {
		      /* TODO: need to implement this
			 it will be dependant on having something to say go
		       */
		      if(sstep)
			{
			  int sstmode = 0;
			  do {
			      printf("SINGLE STEP MODE: ");
			      if(scanf("%d", &sstmode) == EOF)
				return -1;
			  } while(!sstmode);

			  if(deepstate == READY)
			    printf("HC STATE: SSTEP_READY\n");
			  else if(deepstate == RUNNING)
			    printf("HC STATE: SSTEP_RUNNING\n");
			  else if(deepstate == BLOCKED_MUTEX_LOCK)
			    printf("HC STATE: SSTEP_BLOCKED_MUTEX_LOCK\n");
			  else if(deepstate == TERMINATED_SYNC)
			    printf("HC STATE: SSTEP_TERMINATED_SYNC\n");
			  else
			    {
			      printf("HC STATE: UNKNOWN\n");
			      return -1;
			    }
			}
		      else
			{
			  if(deepstate == READY)
			    {
#ifdef DEBUG
			      printf("HC STATE: READY\n");
#endif
			      hypercontext->idleCount++;
			    }
			  else if(deepstate == RUNNING)
			    {
#ifdef DEBUG
			      printf("HC STATE: RUNNING\n");
#endif

			      /* TODO: check the microarchitectural state of the hypercontext */
			      /* stalled, running */

#ifdef DEBUG
			      printf("%d:%d:%d (system:context:hypercontext)\n", i, j, k);
#endif
			      bundleCount = 0;
			      if(hypercontext->stalled > 0)
				{
				  hypercontext->stallCount++;
				  hypercontext->stalled--;
				}
			      else
				{
				  if(hypercontext->checkedPC != (int)hypercontext->programCounter)
				    {
				      hypercontext->checkedPC = (int)hypercontext->programCounter;
#ifdef DEBUG
				      printf("checking bundle for PC: 0x%x\n", hypercontext->programCounter);
#endif
				      instructionPacket this;
				      unsigned startPC = hypercontext->programCounter;
				      unsigned endPC = hypercontext->programCounter;

				      do {
					this = fetchInstruction(context, endPC);
					if((this.op >> 31) & 0x1)
					  {
					    if(this.immValid)
					      {
						endPC += 4;
					      }
					    break;
					  }
					endPC  = this.nextPC;
				      } while(!(this.op >> 31) & 0x1);

#ifdef DEBUG
				      printf("startPC: 0x%x\n", startPC);
#endif
#ifdef DEBUG
				      printf("endPC: 0x%x\n", endPC);
#endif

				      /* need to then work out if it needs stalling */
				      if(checkBundle(hypercontext, startPC, endPC))
					{
					  /* this hypercontext needs stalling for x cycles */
					  /*printf("needs to be stalled for a bit\n");*/
#ifndef NOSTALLS
					  hypercontext->cycleCount++;
					  continue;
#endif
					}
				    }

#ifdef DEBUG
				  printf("already checked bundle for PC: 0x%x\n", hypercontext->programCounter);
#endif
				  /*if(cycle(context, hypercontext, (HCNT->HCONTEXT_CONFIG & 0xf)) == -1)
				    {
				    printf("Error\n");
				    return -1;
				    }*/
				  instructionPacket this;
				  instruction inst;
				  /* TODO: possibly zero these out */
				  do {
				    bundleCount++;
				    this = fetchInstruction(context, hypercontext->programCounter);

#ifdef DEBUG
				    printf("PC: 0x%x, this.op: 0x%08x\n", hypercontext->programCounter, this.op);
				    if(this.immValid)
				      printf("PC: 0x%x, this.imm: 0x%08x\n", (hypercontext->programCounter + 4), this.imm);
#endif

				    inst = instructionDecode(this.op, this.imm, /*system->dram,*/ hypercontext, system, context, hypercontext->VT_CTRL, (((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000));

				    /*printf("%d : %d : ", *(hypercontext->S_GPR + 60), *(hypercontext->pS_GPR + 60));*/
  if((inst.packet.addr == 0) && (inst.packet.target == 1)) {
    /*    printf("\nsetting stack register\n");
    printf("initialStackPointer: 0x%x\n", hypercontext->initialStackPointer);
    printf("stackSize: %d\n", STACK_SIZE);
    printf("diff: %d\n", (hypercontext->initialStackPointer - inst.packet.data));*/
    if((hypercontext->initialStackPointer - inst.packet.data) >= (STACK_SIZE * 1000)) {
      /*
      printf("POSSIBLY OUT OF STACK?\n");
      printf("diff: %d\n", (hypercontext->initialStackPointer - inst.packet.data));*/
      int system_id = (((hypercontext->VT_CTRL) >> 24) & 0xff);
      int context_id = (((hypercontext->VT_CTRL) >> 16) & 0xff);
      int hypercontext_id = (((hypercontext->VT_CTRL) >> 12) & 0xf);
      printf("\tStack Overflow detected in [%d][%d][%d]:\n", system_id, context_id, hypercontext_id);
      printf("\t\tStack Pointer initially: 0x%x (%d)\n", hypercontext->initialStackPointer, hypercontext->initialStackPointer);
      printf("\t\tStack Size: 0x%x (%d)\n", (STACK_SIZE * 1000), (STACK_SIZE * 1000));
      printf("\t\tStack Pointer now: 0x%x (%d)\n", inst.packet.data, inst.packet.data);
      printf("\t\tTry setting stack pointer to %d K ( -stack=%d )\n", (hypercontext->initialStackPointer - inst.packet.data),
	     ((int)ceil((hypercontext->initialStackPointer - inst.packet.data) / 1000) + 1));
    }
  }
				    if(PRINT_OUT) {
#ifndef API
				      printOut(inst, this, hypercontext, cycleCount);
#else
				      printOut(inst, this, hypercontext, 0);
#endif
				    }

#ifdef API
				    /* populate the gTracePacketT here */
				    gTracePacket[i][j][k].bundle[bundlePos].executed = inst.packet.executed;
				    gTracePacket[i][j][k].bundle[bundlePos].syll = this.op;
				    gTracePacket[i][j][k].bundle[bundlePos].syllValid = 1;
				    gTracePacket[i][j][k].bundle[bundlePos].pc = hypercontext->programCounter;

				    if(this.immValid) {
				      gTracePacket[i][j][k].bundle[bundlePos].imm = this.imm;
				      gTracePacket[i][j][k].bundle[bundlePos].immValid = this.immValid;
				    }
				    else {
				      gTracePacket[i][j][k].bundle[bundlePos].imm = 0;
				      gTracePacket[i][j][k].bundle[bundlePos].immValid = this.immValid;
				    }

				    gTracePacket[i][j][k].bundle[bundlePos].maddr = inst.packet.maddr;
				    gTracePacket[i][j][k].bundle[bundlePos].maddrValid = inst.packet.maddrValid;

				    /* source register 1 */
				    gTracePacket[i][j][k].bundle[bundlePos].rs1.regType = inst.packet.source[0].target;
				    gTracePacket[i][j][k].bundle[bundlePos].rs1.reg = inst.packet.source[0].reg;
				    gTracePacket[i][j][k].bundle[bundlePos].rs1.valid = inst.packet.source[0].valid;
				    gTracePacket[i][j][k].bundle[bundlePos].rs1.val = inst.packet.source[0].value;
				    gTracePacket[i][j][k].bundle[bundlePos].rs1.cluster = inst.packet.source[0].cluster;

				    /* source register 2 */
				    gTracePacket[i][j][k].bundle[bundlePos].rs2.regType = inst.packet.source[1].target;
				    gTracePacket[i][j][k].bundle[bundlePos].rs2.reg = inst.packet.source[1].reg;
				    gTracePacket[i][j][k].bundle[bundlePos].rs2.valid = inst.packet.source[1].valid;
				    gTracePacket[i][j][k].bundle[bundlePos].rs2.val = inst.packet.source[1].value;
				    gTracePacket[i][j][k].bundle[bundlePos].rs2.cluster = inst.packet.source[1].cluster;

				    /* source register 3 */
				    gTracePacket[i][j][k].bundle[bundlePos].rs3.regType = inst.packet.source[2].target;
				    gTracePacket[i][j][k].bundle[bundlePos].rs3.reg = inst.packet.source[2].reg;
				    gTracePacket[i][j][k].bundle[bundlePos].rs3.valid = inst.packet.source[2].valid;
				    gTracePacket[i][j][k].bundle[bundlePos].rs3.val = inst.packet.source[2].value;
				    gTracePacket[i][j][k].bundle[bundlePos].rs3.cluster = inst.packet.source[2].cluster;

				    /* source register 4 */
				    gTracePacket[i][j][k].bundle[bundlePos].rs4.regType = inst.packet.source[3].target;
				    gTracePacket[i][j][k].bundle[bundlePos].rs4.reg = inst.packet.source[3].reg;
				    gTracePacket[i][j][k].bundle[bundlePos].rs4.valid = inst.packet.source[3].valid;
				    gTracePacket[i][j][k].bundle[bundlePos].rs4.val = inst.packet.source[3].value;
				    gTracePacket[i][j][k].bundle[bundlePos].rs4.cluster = inst.packet.source[3].cluster;

				    /* source register 5 */
				    gTracePacket[i][j][k].bundle[bundlePos].rs5.regType = inst.packet.source[4].target;
				    gTracePacket[i][j][k].bundle[bundlePos].rs5.reg = inst.packet.source[4].reg;
				    gTracePacket[i][j][k].bundle[bundlePos].rs5.valid = inst.packet.source[4].valid;
				    gTracePacket[i][j][k].bundle[bundlePos].rs5.val = inst.packet.source[4].value;
				    gTracePacket[i][j][k].bundle[bundlePos].rs5.cluster = inst.packet.source[4].cluster;

				    /* source register 6 */
				    gTracePacket[i][j][k].bundle[bundlePos].rs6.regType = inst.packet.source[5].target;
				    gTracePacket[i][j][k].bundle[bundlePos].rs6.reg = inst.packet.source[5].reg;
				    gTracePacket[i][j][k].bundle[bundlePos].rs6.valid = inst.packet.source[5].valid;
				    gTracePacket[i][j][k].bundle[bundlePos].rs6.val = inst.packet.source[5].value;
				    gTracePacket[i][j][k].bundle[bundlePos].rs6.cluster = inst.packet.source[5].cluster;

				    /* source register 7 */
				    gTracePacket[i][j][k].bundle[bundlePos].rs7.regType = inst.packet.source[6].target;
				    gTracePacket[i][j][k].bundle[bundlePos].rs7.reg = inst.packet.source[6].reg;
				    gTracePacket[i][j][k].bundle[bundlePos].rs7.valid = inst.packet.source[6].valid;
				    gTracePacket[i][j][k].bundle[bundlePos].rs7.val = inst.packet.source[6].value;
				    gTracePacket[i][j][k].bundle[bundlePos].rs7.cluster = inst.packet.source[6].cluster;

				    /* destination register 1 */
				    gTracePacket[i][j][k].bundle[bundlePos].rd1.regType = inst.packet.dest[0].target;
				    gTracePacket[i][j][k].bundle[bundlePos].rd1.chk = inst.packet.dest[0].chk;
				    gTracePacket[i][j][k].bundle[bundlePos].rd1.reg = inst.packet.dest[0].reg;
				    gTracePacket[i][j][k].bundle[bundlePos].rd1.valid = inst.packet.dest[0].valid;
				    gTracePacket[i][j][k].bundle[bundlePos].rd1.cluster = inst.packet.dest[0].cluster;
				    gTracePacket[i][j][k].bundle[bundlePos].rd1.res = inst.packet.dest[0].res;

				    /* destination register 2 */
				    gTracePacket[i][j][k].bundle[bundlePos].rd2.regType = inst.packet.dest[1].target;
				    gTracePacket[i][j][k].bundle[bundlePos].rd2.chk = inst.packet.dest[1].chk;
				    gTracePacket[i][j][k].bundle[bundlePos].rd2.reg = inst.packet.dest[1].reg;
				    gTracePacket[i][j][k].bundle[bundlePos].rd2.valid = inst.packet.dest[1].valid;
				    gTracePacket[i][j][k].bundle[bundlePos].rd2.cluster = inst.packet.dest[1].cluster;
				    gTracePacket[i][j][k].bundle[bundlePos].rd2.res = inst.packet.dest[1].res;

				    bundlePos++;
#endif
				    if(inst.packet.newPCValid)
				      {
					hypercontext->programCounter = inst.packet.newPC;
					inst.packet.newPCValid = 0;
					/* TODO: add stalls for control flow change */
#ifndef API
#ifdef NOSTALLS
					hypercontext->stallCount += PIPELINE_REFILL;
#else
					hypercontext->stalled += PIPELINE_REFILL;
#endif
#else
					hypercontext->stallCount += PIPELINE_REFILL;
#endif
#ifdef DEBUG
					printf("control flow change!\n");
#endif
					hypercontext->controlFlowChange++;
				      }
				    else
				      {
					hypercontext->programCounter = this.nextPC;
				      }

				    if(inst.packet.opcode == NOP)
				      {
					hypercontext->nopCount++;
					/*printf("NOP\n");*/
				      }

				  } while(!(this.op >> 31) & 0x1);
				}
			      /* TODO bundleCount */
			      bundleCountP = (unsigned long long *)((unsigned)hypercontext->bundleCount + (bundleCount * (sizeof(unsigned long long))));
			      *bundleCountP = *bundleCountP + 1;
			      /**bundleCountP++;*/
			      hypercontext->cycleCount++;
			    }
			  else if(deepstate == BLOCKED_MUTEX_LOCK)
			    printf("HC STATE: BLOCKED_MUTEX_LOCK\n");
			  else if(deepstate == TERMINATED_ASYNC_HOST)
			    {
			      /* TODO: this is the vthread_join thing */
#if 1
#ifdef DEBUG
			      printf("HC STATE: TERMINATED_ASYNC_HOST\n");
			      printf("\twaiting for: 0x%x\n", hypercontext->joinWaiting);
#endif
			      {
				unsigned cnt, hcnt;
				contextT *cntP;
				hyperContextT *hcntP;
				unsigned debug, deepstate;
				cnt = (hypercontext->joinWaiting >> 4) & 0xff;
				hcnt = (hypercontext->joinWaiting) & 0xf;
				/*printf("cnt[%d] hcnt[%d]\n", cnt, hcnt);*/
				cntP = (contextT *)((unsigned)system->context + (cnt * sizeof(contextT)));
				hcntP = (hyperContextT *)((unsigned)cntP->hypercontext + (hcnt * sizeof(hyperContextT)));

				/*printf("VT_CTRL: 0x%x\n", hcntP->VT_CTRL);*/
				debug = (hcntP->VT_CTRL >> 1) & 0x1;
				deepstate = (hcntP->VT_CTRL >> 3) & 0xff;

				if((deepstate != RUNNING) || (debug))
				  {
				    /*printf("this means the join has finished\n");*/
				    hypercontext->joinWaiting = 0;
				    hypercontext->VT_CTRL &= 0xfffff807;
				    hypercontext->VT_CTRL |= RUNNING << 3;
				  }
				else
				  {
				    /*printf("need to wait for it to finish\n");*/
				  }
				hypercontext->stallCount++;
				hypercontext->cycleCount++;
			      }
#endif
			    }
			  else if(deepstate == TERMINATED_ASYNC)
			    printf("HC STATE: TERMINATED_ASYNC\n");
			  else if(deepstate == TERMINATED_SYNC)
			    printf("HC STATE: TERMINATED_SYNC\n");
			  else
			    {
			      printf("HC STATE: UNKNOWN\n");
			      return -1;
			    }
			}
		    }
		}
	    }
	  /* TODO: here need to service memory requests */
	  /* print all memory requests */
	  /*#ifndef API &&*/
#if !defined(API)
	  {
	    unsigned findBank, findBankT, i;
	    findBank=0;
	    findBankT = (unsigned)log2(((SYS->DRAM_SHARED_CONFIG >> 24) & 0xff));
	    for(i=0;i<findBankT;i++)
	      findBank |= 1 << i;
#ifdef NOSTALLS
	    serviceMemRequestNOSTALLS(system, findBank, ((SYS->DRAM_SHARED_CONFIG >> 24) & 0xff), (((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000));
#else
	    serviceMemRequest(system, findBank, ((SYS->DRAM_SHARED_CONFIG >> 24) & 0xff), (((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000));
#endif
	  }
#else
	  serviceMemRequestPERFECT(system, (((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000));
#endif

	  serviceThreadRequests(system);

	  /* NEED TO SWAP REGISTERS HERE */

	  /* SYSTEM LEVEL */
	  for(j=0;j<(SYS->SYSTEM_CONFIG & 0xff);j++)
	    {
#ifdef DEBUG
	      printf("\t\tcontext: %d\n", j);
#endif
	      CNT = (contextConfig *)((unsigned)SYS->CONTEXT + (j * sizeof(contextConfig)));
	      context = (contextT *)((unsigned)system->context + (j * sizeof(contextT)));

	      /* loop through hypercontexts */
	      for(k=0;k<((CNT->CONTEXT_CONFIG >> 4) & 0xf);k++)
		{
#ifdef DEBUG
		  printf("\t\t\thypercontext: %d\n", k);
#endif

		  HCNT = (hyperContextConfig *)((unsigned)CNT->HCONTEXT + (k * sizeof(hyperContextConfig)));
		  hypercontext = (hyperContextT *)((unsigned)context->hypercontext + (k * sizeof(hyperContextT)));

#ifdef DEBUG
		  printf("\t\t\t\thypercontext totalWidth: %d\n", hypercontext->totalWidth);
#endif
#ifdef DEBUG
		  printf("hypercontext cycleCount: %lld\n", hypercontext->cycleCount);
#endif
		  /* at this point flip registers ready for next cycle
		     only need to do it when hypercontext has been active
		  */
		  memcpy(hypercontext->pS_GPR, hypercontext->S_GPR, (hypercontext->sGPRCount * sizeof(unsigned)));
		  memcpy(hypercontext->pS_FPR, hypercontext->S_FPR, (hypercontext->sFPRCount * sizeof(unsigned)));
		  memcpy(hypercontext->pS_VR, hypercontext->S_VR, (hypercontext->sVRCount * sizeof(unsigned)));
		  memcpy(hypercontext->pS_PR, hypercontext->S_PR, (hypercontext->sPRCount * sizeof(unsigned char)));
		  hypercontext->plinkReg = hypercontext->linkReg;
		}
	    }


	}

#ifdef API
      return 0;
#else
      cycleCount++;
#endif
    }

  end = time(NULL);

#ifndef API
#else
  int insizzleAPIoutputCounts(void) {
    unsigned i, j, k;

    systemConfig *SYS;
    contextConfig *CNT;
    hyperContextConfig *HCNT;

    systemT *system;
    contextT *context;
    hyperContextT *hypercontext;
#endif

    /* clock through all memory ops left */
    serviceMemRequestPERFECT(system, ((SYSTEM->DRAM_SHARED_CONFIG >> 8) & 0xffff));

  /* print out details */
    printf("Start Time: %ld\n", start);
    printf("End Time: %ld\n", end);
    printf("Total Time: %ld (seconds)\n", (end - start));



  /* loop through systems in the galaxy */
  for(i=0;i<(GALAXY_CONFIG & 0xff);i++)
    {
   
      SYS = (systemConfig *)((unsigned)SYSTEM + (i * sizeof(systemConfig)));
      system = (systemT *)((unsigned)galaxyT + (i * sizeof(systemT)));

      /* loop through contexts */
      for(j=0;j<(SYS->SYSTEM_CONFIG & 0xff);j++)
	{
	 
	  CNT = (contextConfig *)((unsigned)SYS->CONTEXT + (j * sizeof(contextConfig)));
	  context = (contextT *)((unsigned)system->context + (j * sizeof(contextT)));

	  /* loop through hypercontexts */
	  for(k=0;k<((CNT->CONTEXT_CONFIG >> 4) & 0xf);k++)
	    {
              printf("performance statistics\n");
              printf("\tgalaxy:         0\n");
              printf("\tsystem:         %d\n", i);
 	      printf("\tcontext:        %d\n", j);
	      printf("\thypercontext: %d\n", k);
	      HCNT = (hyperContextConfig *)((unsigned)CNT->HCONTEXT + (k * sizeof(hyperContextConfig)));
	      hypercontext = (hyperContextT *)((unsigned)context->hypercontext + (k * sizeof(hyperContextT)));

	      if(printCounts(hypercontext) == -1)
		return -1;
	    }
	}

      /* print each dram to file */
      if(memoryDump(((((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000) >> 2), i, system->dram) == -1)
	return -1;
    }


  /* TODO: memory dump */

  if(freeMem() == -1)
    return -1;

  return 0;
}

/* read galaxyConfig and setup registers and memory */
int setupGalaxy(void)
{
  unsigned i, j, k, l;
  systemConfig *SYS;
  contextConfig *CNT;
  hyperContextConfig *HCNT;
  clusterTemplateConfig *CLUT;

  systemT *system;
  contextT *context;
  hyperContextT *hypercontext;
  clusterT *cluster;

  unsigned curClustTemplate, curClustInstance;
  unsigned sGPRCount, sFPRCount, sVRCount, sPRCount;
  unsigned totalWidth;

#ifndef API
  char binary[256];
#endif

  /* malloc enough space for all the system */
  galaxyT = (systemT *)malloc(sizeof(systemT) * (GALAXY_CONFIG & 0xff));
  if(galaxyT == NULL)
    return -1;

  /* for each system need to allocate memory for the context and iram */
  for(i=0;i<(GALAXY_CONFIG & 0xff);i++)
    {
      SYS = (systemConfig *)((unsigned)SYSTEM + (i * sizeof(systemConfig)));
      system = (systemT *)((unsigned)galaxyT + (i * sizeof(systemT)));

      system->context = (contextT *)malloc(sizeof(contextT) * (SYS->SYSTEM_CONFIG & 0xff));
      /*system->memQueue = (struct memReqT *)calloc(sizeof(struct memReqT), 1);
      system->memQueueHead = system->memQueue;
      system->memQueueCurrent = system->memQueue;*/

      if(system->context == NULL)
	return -1;

      system->memReq = NULL;
      system->threadReq = NULL;

#ifndef API
      printf("Please specify the location of the dram binary for system %d\n> ", i);
#if 0
      scanf("%s", binary);
#else
      strcpy(binary, "binaries/dram.bin");
#endif
      printf("file: %s\n", binary);
#ifdef SHM
      system->dram = loadBinaryD(binary, ((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff));
#else
      system->dram = loadBinary(binary, ((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff));
#endif

#else
      system->dram = (unsigned *)calloc((((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000), 1);
#endif
      if(system->dram == NULL)
	return -1;

      /*printf("system->dram: %p\n", (void *)system->dram);*/

      system->numContext = (SYS->SYSTEM_CONFIG & 0xff);

      for(j=0;j<(SYS->SYSTEM_CONFIG & 0xff);j++)
	{
	  CNT = (contextConfig *)((unsigned)SYS->CONTEXT + (j * sizeof(contextConfig)));
	  context = (contextT *)((unsigned)system->context + (j * sizeof(contextT)));

#ifndef API
	  printf("Please specify the location of the iram binary for system %d, context %d\n> ", i, j);
#if 0
      scanf("%s", binary);
#else
      /* this now reads a separate binary per context */
      char tempFileName[256];
      sprintf(tempFileName, "binaries/iram%d.bin", (similarIRAM == 1) ? 0 : j);
      strcpy(binary, tempFileName);
#endif
	  printf("file: %s\n", binary);

	  context->iram = loadBinary(binary, 0);
	  /*(unsigned *)malloc(sizeof(unsigned) * ((CNT->IFE_SIMPLE_IRAM_PRIV_CONFIG >> 8) & 0xffff));*/
#else
	  context->iram = (unsigned *)calloc((((CNT->IFE_SIMPLE_IRAM_PRIV_CONFIG >> 8) & 0xffff) * 1000), 1);
#endif
	  if(context->iram == NULL)
	    return -1;

	  /*printf("context->iram: %p\n", (void *)context->iram);*/

	  context->hypercontext = (hyperContextT *)calloc(sizeof(hyperContextT) * ((CNT->CONTEXT_CONFIG >> 4) & 0xf), 1);
	  if(context->hypercontext == NULL)
	    return -1;

	  context->numHyperContext = ((CNT->CONTEXT_CONFIG >> 4) & 0xf);

	  for(k=0;k<((CNT->CONTEXT_CONFIG >> 4) & 0xf);k++)
	    {
	      HCNT = (hyperContextConfig *)((unsigned)CNT->HCONTEXT + (k * sizeof(hyperContextConfig)));
	      hypercontext = (hyperContextT *)((unsigned)context->hypercontext + (k * sizeof(hyperContextT)));

	      hypercontext->registers = (clusterT *)malloc(sizeof(clusterT) * (HCNT->HCONTEXT_CONFIG & 0xf));
	      hypercontext->numClusters = (HCNT->HCONTEXT_CONFIG & 0xf);

	      /*printf("system: %d, context: %d, hypercontext: %d\n", i, j, k);*/
	      sGPRCount = 0;
	      sFPRCount = 0;
	      sVRCount = 0;
	      sPRCount = 0;
	      totalWidth = 0;
	      /* from here need to get the cluster details and work things out */
	      for(l=0;l<(HCNT->HCONTEXT_CONFIG & 0xf);l++)
		{
		  /*printf("\tcluster: %d\n", l);*/
		  /* need to then get the details of them */
		  /* TODO: error checking here */

		  /*hypercontext->registers->S_GPR = (unsigned)(hypercontext->S_GPR) + sGPRCount;
		    printf("cluster: %d, sGPR 0x%x\n", (unsigned)hypercontext->registers->S_GPR);*/

		  if(l < 8)
		    {
		      curClustTemplate = ((HCNT->HCONTEXT_CLUST_TEMPL0_1.lo >> (l * 4)) & 0xf);
		      curClustInstance = ((HCNT->HCONTEXT_CLUST_TEMPL_INST0_1.lo >> (l * 4)) & 0xf);
		    }
		  else
		    {
		      curClustTemplate = ((HCNT->HCONTEXT_CLUST_TEMPL0_1.hi >> (l * 4)) & 0xf);
		      curClustInstance = ((HCNT->HCONTEXT_CLUST_TEMPL_INST0_1.hi >> (l * 4)) & 0xf);
		    }

		  /*printf("\t\tcurrent cluster Template: %d\n", curClustTemplate);
		    printf("\t\tcurrent cluster Instance: %d\n", curClustInstance);*/

		  CLUT = (clusterTemplateConfig *)((unsigned)CNT->CLUSTER_TEMPL + (sizeof(clusterTemplateConfig) * curClustTemplate));

		  if(!((CLUT->CLUST_TEMPL_CONFIG >> 16) & 0x1))
		    {
		      printf("you have specified a cluster template which isn't instantiated\n");
		      return -1;
		    }
		  if(curClustInstance >= ((CLUT->CLUST_TEMPL_CONFIG >> 17) & 0xf))
		    {
		      printf("you have specified a cluster template instance which isn't available\n");
		      return -1;
		    }
		  sGPRCount += CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG & 0xff;
		  sFPRCount += (CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG >> 8) & 0xff;
		  sVRCount += (CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG >> 16) & 0xff;
		  sPRCount += (CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG >> 24) & 0xf;
		  totalWidth += (CLUT->CLUST_TEMPL_CONFIG >> 8) & 0xff;
		}

	      /* at this point we know how many registers are needed */
	      /* TODO: work out a way to point to clusters registers */
	      hypercontext->S_GPR = (unsigned *)calloc(sizeof(unsigned) * sGPRCount, 1);
	      if(hypercontext->S_GPR == NULL)
		return -1;
	      hypercontext->S_FPR = (unsigned *)calloc(sizeof(unsigned) * sFPRCount, 1);
	      if(hypercontext->S_FPR == NULL)
		return -1;
	      hypercontext->S_VR = (unsigned *)calloc(sizeof(unsigned) * sVRCount, 1);
	      if(hypercontext->S_VR == NULL)
		return -1;
	      hypercontext->S_PR = (unsigned char *)calloc(sizeof(unsigned char) * sPRCount, 1);
	      if(hypercontext->S_PR == NULL)
		return -1;

	      hypercontext->pS_GPR = (unsigned *)calloc(sizeof(unsigned) * sGPRCount, 1);
	      if(hypercontext->pS_GPR == NULL)
		return -1;
	      hypercontext->pS_FPR = (unsigned *)calloc(sizeof(unsigned) * sFPRCount, 1);
	      if(hypercontext->pS_FPR == NULL)
		return -1;
	      hypercontext->pS_VR = (unsigned *)calloc(sizeof(unsigned) * sVRCount, 1);
	      if(hypercontext->pS_VR == NULL)
		return -1;
	      hypercontext->pS_PR = (unsigned char *)calloc(sizeof(unsigned char) * sPRCount, 1);
	      if(hypercontext->pS_PR == NULL)
		return -1;

	      hypercontext->sGPRCount = sGPRCount;
	      hypercontext->sFPRCount = sFPRCount;
	      hypercontext->sVRCount = sVRCount;
	      hypercontext->sPRCount = sPRCount;

	      hypercontext->linkReg = 0;

	      hypercontext->totalWidth = totalWidth;
	      hypercontext->bundleCount = (unsigned long long *)malloc(sizeof(unsigned long long) * (totalWidth + 1));
	      if(hypercontext->bundleCount == NULL)
		return -1;

	      /* zero out the bundleCounts */
	      for(l=0;l<totalWidth+1;l++)
		{
		  unsigned long long *bundleCount;
		  bundleCount = (unsigned long long *)((unsigned int)hypercontext->bundleCount + (sizeof(unsigned long long) * l));
		  *bundleCount = 0;
		}

	      hypercontext->VT_CTRL = 0;
	      hypercontext->VT_CTRL |= i << 24; /* system */
	      hypercontext->VT_CTRL |= j << 16; /* context */
	      hypercontext->VT_CTRL |= k << 12; /* hypercontext */

	      /* deepstate */
#ifdef VTHREAD
	      hypercontext->VT_CTRL |= READY << 3;
#else
	      hypercontext->VT_CTRL |= RUNNING << 3;
#endif
	      /*hypercontext->VT_CTRL |= 1 << 1;*/
	      /*hypercontext->VT_CTRL |= 1 << 2; *//* single step mode */

	      hypercontext->stalled = 0;
	      hypercontext->checkedPC = -1;

	      hypercontext->cycleCount = 0;
	      /* TODO: possibly cluster level */
	      hypercontext->stallCount = 0;
	      hypercontext->decodeStallCount = 0;
	      hypercontext->branchTaken = 0;
	      hypercontext->branchNotTaken = 0;
	      hypercontext->nopCount = 0;
	      hypercontext->idleCount = 0;
	      hypercontext->memoryAccessCount = 0;

	      hypercontext->programCounter = 0;

	      /* setup register pointers */
	      sGPRCount = 0;
	      sFPRCount = 0;
	      sVRCount = 0;
	      sPRCount = 0;

	      /*printf("hypercontext->S_GPR: 0x%x\n", (unsigned)hypercontext->S_GPR);*/
	      for(l=0;l<(HCNT->HCONTEXT_CONFIG & 0xf);l++)
		{
		  cluster = (clusterT *)((unsigned)hypercontext->registers + (l * sizeof(clusterT)));

		  cluster->S_GPR = (unsigned *)((unsigned)hypercontext->S_GPR + sGPRCount);
		  /**(cluster->S_GPR + (unsigned)1) = (((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000) -
		     (MAX_CONTEXTS * (STACK_SIZE * 1000) * j) - ((STACK_SIZE * 1000) * k);*/
		  /*printf("[%d][%d][%d] = 0x%x\n", i, j, k, *(cluster->S_GPR + (unsigned)1));*/
		  cluster->S_FPR = (unsigned *)((unsigned)hypercontext->S_FPR + sFPRCount);
		  cluster->S_VR = (unsigned *)((unsigned)hypercontext->S_VR + sVRCount);
		  cluster->S_PR = (unsigned char*)((unsigned)hypercontext->S_PR + sPRCount);

		  cluster->pS_GPR = (unsigned *)((unsigned)hypercontext->pS_GPR + sGPRCount);
		  /**(cluster->pS_GPR + (unsigned)1) = (((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000) -
		     (MAX_CONTEXTS * (STACK_SIZE * 1000) * j) - ((STACK_SIZE * 1000) * k);*/
		  cluster->pS_FPR = (unsigned *)((unsigned)hypercontext->pS_FPR + sFPRCount);
		  cluster->pS_VR = (unsigned *)((unsigned)hypercontext->pS_VR + sVRCount);
		  cluster->pS_PR = (unsigned char*)((unsigned)hypercontext->pS_PR + sPRCount);

		  /*printf("cluster: %d, sGPR 0x%x\n", l, (unsigned)cluster->S_GPR);*/

		  if(l < 8)
		    curClustTemplate = ((HCNT->HCONTEXT_CLUST_TEMPL0_1.lo >> (l * 4)) & 0xf);
		  else
		    curClustTemplate = ((HCNT->HCONTEXT_CLUST_TEMPL0_1.hi >> (l * 4)) & 0xf);

		  CLUT = (clusterTemplateConfig *)((unsigned)CNT->CLUSTER_TEMPL + (sizeof(clusterTemplateConfig) * curClustTemplate));

		  sGPRCount += CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG & 0xff;
		  sFPRCount += (CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG >> 8) & 0xff;
		  sVRCount += (CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG >> 16) & 0xff;
		  sPRCount += (CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG >> 24) & 0xf;
		}
	    }

	}
    }

  return 0;
}

int freeMem(void)
{
  systemConfig *SYS;
  contextConfig *CNT;
  hyperContextConfig *HCNT;
  /*clusterTemplateConfig *CLUT;*/

  systemT *system;
  contextT *context;
  hyperContextT *hypercontext;

  unsigned i,j,k;

  for(i=0;i<(GALAXY_CONFIG & 0xff);i++)
    {
      SYS = (systemConfig *)((unsigned)SYSTEM + (i * sizeof(systemConfig)));
      system = (systemT *)((unsigned)galaxyT + (i * sizeof(systemT)));

#ifndef SHM
      free((unsigned *)system->dram);
#endif

      for(j=0;j<(SYS->SYSTEM_CONFIG & 0xff);j++)
	{
	  CNT = (contextConfig *)((unsigned)SYS->CONTEXT + (j * sizeof(contextConfig)));
	  context = (contextT *)((unsigned)system->context + (j * sizeof(contextT)));

	  free((unsigned *)context->iram);

	  for(k=0;k<((CNT->CONTEXT_CONFIG >> 4) & 0xf);k++)
	    {
	      HCNT = (hyperContextConfig *)((unsigned)CNT->HCONTEXT + (k * sizeof(hyperContextConfig)));
	      hypercontext = (hyperContextT *)((unsigned)context->hypercontext + (k * sizeof(hyperContextT)));

	      free((unsigned *)hypercontext->S_GPR);
	      free((unsigned *)hypercontext->S_FPR);
	      free((unsigned *)hypercontext->S_VR);
	      free((unsigned char*)hypercontext->S_PR);

	      free((unsigned *)hypercontext->pS_GPR);
	      free((unsigned *)hypercontext->pS_FPR);
	      free((unsigned *)hypercontext->pS_VR);
	      free((unsigned char*)hypercontext->pS_PR);
	    }
	  free((hyperContextT *)context->hypercontext);
	  free((hyperContextConfig *)CNT->HCONTEXT);
	  free((clusterTemplateConfig *)CNT->CLUSTER_TEMPL);

	}
      free((contextT *)system->context);
      free((contextConfig *)SYS->CONTEXT);

    }
  free((systemT *)galaxyT);
  free((systemConfig *)SYSTEM);
  return 0;
}

void printOut(instruction inst, instructionPacket this, hyperContextT *hypercontext, unsigned long long cycleCount)
{
  printf("Context:0x%08x - CC:%llu - T:%d - A:%d - D:%d - OP:",
	 ((((hypercontext->VT_CTRL >> 16) & 0xff) << 8) | ((hypercontext->VT_CTRL >> 12) & 0xf)),
         cycleCount,
         inst.packet.target,
         inst.packet.addr,
         inst.packet.data
         );
  returnOpcode(inst.packet.opcode);
  printf(" - PC:0x%x - LR:0x%x - SP:0x%x - SYLL:0x%08x - S1:%d - S2:%d - S3:%d - T2:%d - A2:%d - D2:%d\n",
         /**(programCounter + (cnt * HCNT) + hcnt),*/
	 hypercontext->programCounter,
         /**(sim_l + (cnt * HCNT * CLU) + (hcnt * CLU) + (0)),*/
	 hypercontext->linkReg,
         /**(sim_r + (cnt * HCNT * CLU * GP_R) + (hcnt * CLU * GP_R) + (0 * CLU * GP_R) + 1),*/
	 *(hypercontext->pS_GPR + (unsigned)1),
         this.op,
         inst.packet.source1,
         inst.packet.source2,
         inst.packet.source3,
         inst.packet.target2,
	 inst.packet.addr2,
         inst.packet.data2
         );

  if(this.immValid)
    {
      printf("Q:%d - CC:%llu - T:%d - A:%d - D:%d - OP:%d - PC:0x%x - LR:%d - SP:%d - SYLL:%08x - S1:%d - S2:%d - S3:%d - T2:%d - A2:%d - D2:%d\n",
             -1,
             cycleCount,
             -1,
             -1,
             this.imm,
             -1,
             /**(programCounter + (cnt * HCNT) + hcnt) + 0x4,*/
	     hypercontext->programCounter + (unsigned)0x4,
             -1,
             -1,
             this.imm,
             0,
             0,
             0,
             0,
             0,
             0
             );
    }
  return;
}

static const char *op_strings[] =
  {
    "GOTO"  , "CALL"  , "ENTRY" , "RETURN", "BRANCH", "BRANCHF" , "LDSB"  , "LDUB"  , "LDSH" , "LDUH"   ,
    "LDHU"  , "LDW"   , "STB"   , "STH"   , "STW"   , "MLSL"    , "MLUL"  , "MLSH"  , "MLUH" , "MLSLL"  ,
    "MLULL" , "MLSLH" , "MLULH" , "MLSHH" , "MLUHH" , "ADD"     , "AND"   , "ANDC"  , "ANDL" , "CMPEQ"  ,
    "CMPGES", "CMPGEU", "CMPGTS", "CMPGTU", "CMPLES", "CMPLEU"  , "CMPLTS", "CMPLTU", "CMPNE", "MAXS"   ,
    "MAXU"  , "MINS"  , "MINU"  , "MFB"   , "MFL"   , "MOV"     , "MTL"   , "MTB"   , "MTBF" , "MPY"    ,
    "NANDL" , "NOP"   , "NORL"  , "ORL"   , "OR"    , "ORC"     , "PFT"   , "SBIT"  , "SBITF", "SH1ADD" ,
    "SH2ADD", "SH3ADD", "SH4ADD", "SHL"   , "SHRS"  , "SHRU"    , "SWBT"  , "SWBF"  , "SUB"  , "SEXTB"  ,
    "SEXTH" , "TBIT"  , "TBITF" , "XNOP"  , "XOR"   , "ZEXTB"   , "ZEXTH" , "ADDCG" , "DIVS" , "RSUB"   ,
    "MVL2G" , "MVG2L" , "HALT"  , "CUSTOM", "LDL"   , "PSYSCALL", "STL"   , "GOTOL" , "CALLL", "SYSCALL",
    "RFI"   , "RDCTRL", "WRCTRL", "MLSHS", "CUPID"
  };

void returnOpcode(opT op)
{
  if(op >= (sizeof(op_strings) / sizeof(const char *)))
    printf("UNKNOWN");
  else
    printf("%s", op_strings[op]);

  return;
}
