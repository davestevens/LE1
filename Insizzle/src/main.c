#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "xmlRead.h"
#include "functions.h"
#include "macros.h"

#define RUNIT

/* compile with
   gcc -o Insizzle `xml2-config --cflags` main.c `xml2-config --libs` -m32 -Wall -Wextra -pedantic -std=c99
*/

#ifdef VAJAZZLE
#include "vajazzle.h"
extern void *_vajazzle_main(void);
#endif

void returnOpcode(opT);
void printOut(instruction, instructionPacket, hyperContextT *, unsigned long long);
int setupGalaxy(void);
int freeMem(void);
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
  unsigned long long cycleCount = 0;

#ifdef VAJAZZLE
  printf("           /\\\n");
  printf("          /  \\\n");
  printf("         /    \\\n");
  printf("________/      \\________\n");
  printf("\\                      /\n");
  printf(" \\                    /\n");
  printf("  \\     Vajazzle     /\n");
  printf("  /                  \\\n");
  printf(" /                    \\\n");
  printf("/-------\\      /-------\\\n");
  printf("         \\    /\n");
  printf("          \\  /\n");
  printf("           \\/\n");
#else
  printf("Insizzle\n");
#endif

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

  printf("readConf ok\n");

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

#ifdef VAJAZZLE
  printf("Running Insizzle\n");
#endif

#ifdef RUNIT
  while(checkActive())
    {
#endif
#ifdef DEBUF
      printf("------------------------------------------------------------ end of cycle %lld\n", cycleCount);
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
		  printf("\tkernel:    %d\n", kernel);
#endif

		  if(debug)
		    {
		      printf("HC STATE: DEBUG\n");
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
			      printf("HC STATE: READY\n");
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
				  /*printf("stalled\n");*/
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
					  hypercontext->cycleCount++;
					  continue;
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
				  do {
				    bundleCount++;
				    this = fetchInstruction(context, hypercontext->programCounter);

#ifdef DEBUG
				    printf("PC: 0x%x, this.op: 0x%08x\n", hypercontext->programCounter, this.op);
				    if(this.immValid)
				      printf("PC: 0x%x, this.imm: 0x%08x\n", (hypercontext->programCounter + 4), this.imm);
#endif

				    inst = instructionDecode(this.op, this.imm, /*system->dram,*/ hypercontext, system);

				    /*printf("%d : %d : ", *(hypercontext->S_GPR + 60), *(hypercontext->pS_GPR + 60));*/
				    /*printOut(inst, this, hypercontext, cycleCount);*/

				    if(inst.packet.newPCValid)
				      {
					hypercontext->programCounter = inst.packet.newPC;
					inst.packet.newPCValid = 0;
					/* TODO: add stalls for control flow change */
					hypercontext->stalled += PIPELINE_REFILL;
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
			    printf("HC STATE: TERMINATED_ASYNC_HOST\n");
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
	  {
#ifdef DEBUG
	    printf("checking memory Requests\n");
#endif
	    struct memReqT *temp;
	    unsigned context, hypercontext, whichBank;
	    unsigned findBank, findBankT, i;
	    contextT *cnt;
	    hyperContextT *hcnt;

	    unsigned given = 0;

	    findBank=0;
	    findBankT = (unsigned)log2(((SYS->DRAM_SHARED_CONFIG >> 24) & 0xff));
	    for(i=0;i<findBankT;i++)
	      findBank |= 1 << i;

	    for(whichBank=0;whichBank<((SYS->DRAM_SHARED_CONFIG >> 24) & 0xff);whichBank++)
	      {
#ifdef DEBUG
		printf("whichBank: %d\n", whichBank);
#endif
		temp = system->memQueueHead;
		while(temp->next != NULL)
		  {
		    if((temp->value & findBank) == whichBank)
		      {
			
			context = (temp->ctrlReg >> 16) & 0xff;
			hypercontext = (temp->ctrlReg >> 12) & 0xf;
			cnt = (contextT *)((unsigned)system->context + (context * sizeof(contextT)));
			hcnt = (hyperContextT *)((unsigned)cnt->hypercontext + (hypercontext * sizeof(hyperContextT)));
			
#ifdef DEBUG
			printf("context: %d, hypercontext: %d\n", context, hypercontext);
#endif
			
			if(given)
			  {
#ifdef DEBUG
			    printf("need to stall this\n");
#endif
			    hcnt->stalled++;
			  }
			else
			  {
#ifdef DEBUG
			    printf("this one will get it!\n");
#endif
			    /* need to work out which bank it hits */
			    switch(temp->memOp)
			      {
			      case mLDSB:
				_LDSB_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
				break;
			      case mLDBs:
				_LDBs_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
				break;
			      case mLDUB:
#if 0
				printf("LDUB\n");
				printf("temp->value: %d\n", temp->value);
				printf("0x%08x\n", *((unsigned *)system->dram + (temp->value)));
				printf("0x%08x\n", *((unsigned *)system->dram + (temp->value >> 2)));
#endif
				_LDUB_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
#if 0
				printf("%p -> 0x%x\n", (void *)temp->pointer, *(temp->pointer));
#endif
				break;
			      case mLDSH:
				_LDSH_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
				break;
			      case mLDUH:
				_LDUH_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
				break;
			      case mLDW:
#ifdef DEBUG
				printf("LDW!!!\n");
#endif
#ifdef DEBUG
				printf("loading from: 0x%x\n", (temp->value + (unsigned)(system->dram)));
#endif
				_LDW_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
#ifdef DEBUG
				printf("value: 0x%x\n", *(unsigned *)(temp->pointer));
#endif
				break;
			      case mSTB:
#if 0
				printf("STB!!!\n");
				printf("storing: 0x%x\n", *temp->pointer);
				printf("%p\n", (void *)temp->pointer);
				printf("to: 0x%x\n", (temp->value));
#endif
				_STB_iss((temp->value + (unsigned)(system->dram)), temp->pointer);
#if 0
				printf("memory now: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif
				break;
			      case mSTBs:
#ifdef DEBUG
				printf("STBs!!!\n");
				printf("storing: 0x%x\n", *temp->pointer);
				printf("to: 0x%x\n", (temp->value));
#endif
				_STB_iss((temp->value + (unsigned)(system->dram)), temp->pointer);
#ifdef DEBUG
				printf("memory now: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif
				break;
			      case mSTH:
#ifdef DEBUG
				printf("STH!!!\n");
				printf("storing: 0x%x\n", *temp->pointer);
				printf("to: 0x%x\n", (temp->value));
#endif
				_STH_iss((temp->value + (unsigned)(system->dram)), temp->pointer);
#ifdef DEBUG
				printf("memory now: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif
				break;
			      case mSTW:
				{
#ifdef DEBUG
				  printf("STW!!!\n");
				  printf("storing: 0x%x\n", *temp->pointer);
				  printf("to: 0x%x\n", (temp->value));
#endif
				  _STW_iss((temp->value + (unsigned)(system->dram)), temp->pointer);
#ifdef DEBUG
				  printf("memory now: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif
				}
				break;
			      default:
				printf("unknown memory op :(\n");
				break;
			      }
			    
			    /* perform the operation and remove from Queue */
			    
			    /* if its the Head then simply point Head to next */
			    if(temp == system->memQueueHead)
			      {
#ifdef DEBUG
				printf("this is the head\n");
#endif
				struct memReqT *tempP = system->memQueueHead->next;
				free(system->memQueueHead);
				system->memQueueHead = tempP;
				temp = system->memQueueHead;
				break;
			      }
			    /* otherwise need to copy next into current and remove next */
			    else
			      {
				struct memReqT *toRemove;
				toRemove = temp->next;
				
				temp->pointer = toRemove->pointer;
				temp->value = toRemove->value;
				temp->ctrlReg = toRemove->ctrlReg;
				temp->memOp = toRemove->memOp;
				temp->next = toRemove->next;
				
				free(toRemove);
			      }
			    
			    given = 1;
			  }
		      }
		    temp = temp->next;
		  }
	      }
#ifdef DEBUG
	    printf("finished checking memory Requsts\n");
#endif
	  }
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
		  /* TODO: SWITCHING POINTERS DIDN'T WORK, NEED TO COPY ALL */
		  /*for(clust=0;clust<hypercontext->sGPRCount;clust++)
		    {
		      *(hypercontext->pS_GPR + clust) = *(hypercontext->S_GPR + clust);
		      }*/
		  memcpy(hypercontext->pS_GPR, hypercontext->S_GPR, (hypercontext->sGPRCount * sizeof(unsigned)));
		  /*for(clust=0;clust<hypercontext->sFPRCount;clust++)
		    {
		      *(hypercontext->pS_FPR + clust) = *(hypercontext->S_FPR + clust);
		      }*/
		  memcpy(hypercontext->pS_FPR, hypercontext->S_FPR, (hypercontext->sFPRCount * sizeof(unsigned)));
		  /*for(clust=0;clust<hypercontext->sVRCount;clust++)
		    {
		      *(hypercontext->pS_VR + clust) = *(hypercontext->S_VR + clust);
		      }*/
		  memcpy(hypercontext->pS_VR, hypercontext->S_VR, (hypercontext->sVRCount * sizeof(unsigned)));
		  /*for(clust=0;clust<hypercontext->sPRCount;clust++)
		    {
		      *(hypercontext->pS_PR + clust) = *(hypercontext->S_PR + clust);
		      }*/
		  memcpy(hypercontext->pS_PR, hypercontext->S_PR, (hypercontext->sPRCount * sizeof(unsigned char)));
		  /*memcpy(hypercontext->pS_GPR, hypercontext->S_GPR, hypercontext->sGPRCount);*/
		  /*memcpy(hypercontext->pS_FPR, hypercontext->S_FPR, hypercontext->sFPRCount);*/
		  /*memcpy(hypercontext->pS_VR, hypercontext->S_VR, hypercontext->sVRCount);*/
		  /*memcpy(hypercontext->pS_PR, hypercontext->S_PR, hypercontext->sPRCount);*/
		  hypercontext->plinkReg = hypercontext->linkReg;
		}
	    }


	}

      cycleCount++;
#ifdef RUNIT
    }
#endif

#ifdef VAJAZZLE
  printf("\tInsizzle run complete\n");

  printf("Running GCC\n");
  _vajazzle_main();
  printf("\tGCC run complete\n");

  printf("running setupMem()\n");
  setupMem();

  /* TODO: need to get a system pointer */
  system = (systemT *)((unsigned)galaxyT);

  printf("comparing global data variables\n");
  {
    struct mem *this;
    unsigned c, temp;
    this = _vajazzle_vars;
    do {
      /*    printf("le1Addr: 0x%x\n", this->addr);
	    printf("size:    %d\n", this->size);
	    printf("name:    %s\n", this->name);
	    printf("point:   %p\n", this->P);*/
      printf("checking: %s\n", this->name);

      switch(this->type)
	{
	case charT:
	  printf("\tcharT\n");
	  unsigned char *charP;
	  printf("SIZE: %d\n", this->size);
	  for(c=0;c<this->size;c++)
	    {
	      if(this->pointer)
		{
		  _LDW_iss(&temp, ((unsigned)system->dram + (this->addr + c)));
		  _LDUB_iss(&temp, ((unsigned)system->dram + temp));
		  charP = (unsigned char*)(*(unsigned int*)((unsigned)this->P + c));
		  printf("\t\t%d [0x%x] [0x%x]\n",
			 c,
			 *charP,
			 temp);
		  if(*charP != temp)
		    printf("\t\tdifference: GCC 0x%02x INS: 0x%02x\n", *charP, temp);
		}
	      else
		{
		  _LDUB_iss(&temp, ((unsigned)system->dram + (this->addr + c)));
		  printf("\t\t%d [0x%x] [0x%x]\n",
			 c,
			 *(unsigned char*)((unsigned)this->P + c),
			 temp);
		  if(*(unsigned char*)((unsigned)this->P + c) != temp)
		    printf("\t\tdifference: GCC 0x%02x INS: 0x%02x\n", *(unsigned char*)((unsigned)this->P + c), temp);
		}
	    }
	  break;
	case shortT:
	  printf("\tshortT\n");
	  unsigned short *shortP;
	  for(c=0;c<this->size;c++)
	    {
	      if(this->pointer)
		{
		  _LDW_iss(&temp, ((unsigned)system->dram + (this->addr + (c * 2))));
		  _LDUH_iss(&temp, ((unsigned)system->dram + temp));
		  shortP = (unsigned short *)(*(unsigned int*)((unsigned)this->P + (c * 2)));
		  printf("\t\t%d [0x%x] [0x%x]\n",
			 c,
			 *shortP,
			 temp);
		  if(*shortP != temp)
		    printf("\t\tdifference: GCC 0x%04x INS: 0x%04x\n", *shortP, temp);
		}
	      else
		{
		  _LDUH_iss(&temp, ((unsigned)system->dram + (this->addr + (c * 2))));
		  printf("\t\t%d [0x%x] [0x%x]\n",
			 c,
			 *(unsigned short*)((unsigned)this->P + (c * 2)),
			 temp);
		  if(*(unsigned short*)((unsigned)this->P + (c * 2)) != temp)
		    printf("\t\tdifference: GCC 0x%04x INS: 0x%04x\n", *(unsigned short*)((unsigned)this->P + (c * 2)), temp);
		}
	    }
	  break;
	case intT:
	  printf("\tintT\n");
	  unsigned *intP;
	  for(c=0;c<this->size;c++)
	    {
	      if(this->pointer)
		{
		  _LDW_iss(&temp, ((unsigned)system->dram + (this->addr + (c * 4))));
		  _LDW_iss(&temp, ((unsigned)system->dram + temp));
		  intP = (unsigned *)(*(unsigned int*)((unsigned)this->P + (c * 4)));
		  printf("\t\t%d [0x%x] [0x%x]\n",
			 c,
			 *intP,
			 temp);
		  if(*intP != temp)
		    printf("\t\tdifference: GCC 0x%08x INS 0x%08x\n", *intP, temp);
		}
	      else
		{
		  _LDW_iss(&temp, ((unsigned)system->dram + (this->addr + (c * 4))));
		  printf("\t\t%d [0x%x] [0x%x]\n",
			 c,
			 *(unsigned int*)((unsigned)this->P + (c * 4)),
			 temp);
		  if(*(unsigned int*)((unsigned)this->P + (c * 4)) != temp)
		    printf("\t\tdifference: GCC 0x%08x INS 0x%08x\n", *(unsigned int*)((unsigned)this->P + (c * 4)), temp);
		}
	    }
	  break;
	case longT:
	  printf("\tlongT\n");
	  break;
	case longlongT:
	  printf("\tlonglongT\n");
	  break;
	case unkT:
	  printf("\t i can't check this right now, its a struct or somthing\n");
	  break;
	default:
	  printf("\terror\n");
	  break;
	}
    this = this->next;
    } while((this != NULL) && (this->valid));
  }

#if 0
  printf("comparing global data variables\n");
  /* TODO: need to get a system pointer */
  system = (systemT *)((unsigned)galaxyT);
  {
    /*    unsigned *dram = system->dram;*/
    unsigned c, count;
    unsigned char temp;

    for(c=0;c<SIZE;c++)
      {
	printf("\tvariable name: %s (size: %d)\n", arrayOfMem[c].name, arrayOfMem[c].size);
	printf("sizeof = %d\n", sizeof((void *)arrayOfMem[c].P));
	for(count=0;count<arrayOfMem[c].size;count++)
	  {
	    _LDUB_iss(&temp, ((unsigned)system->dram + (arrayOfMem[c].addr + count)));
	    printf("GCC: 0x%x - INS: 0x%x\n",
		   *(unsigned char *)((unsigned)arrayOfMem[c].P + count), 
		   temp);
	  }
      }
  }
#endif

#endif
  /* print out details */
  printf("galaxy: 0\n");
  /* loop through systems in the galaxy */
  for(i=0;i<(GALAXY_CONFIG & 0xff);i++)
    {
      printf("\tsystem: %d\n", i);
      SYS = (systemConfig *)((unsigned)SYSTEM + (i * sizeof(systemConfig)));
      system = (systemT *)((unsigned)galaxyT + (i * sizeof(systemT)));

      /* loop through contexts */
      for(j=0;j<(SYS->SYSTEM_CONFIG & 0xff);j++)
	{
	  printf("\t\tcontext: %d\n", j);
	  CNT = (contextConfig *)((unsigned)SYS->CONTEXT + (j * sizeof(contextConfig)));
	  context = (contextT *)((unsigned)system->context + (j * sizeof(contextT)));

	  /* loop through hypercontexts */
	  for(k=0;k<((CNT->CONTEXT_CONFIG >> 4) & 0xf);k++)
	    {
	      printf("\t\t\thypercontext: %d\n", k);
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

  char binary[256];

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
      system->memQueue = (struct memReqT *)calloc(sizeof(struct memReqT), 1);
      system->memQueueHead = system->memQueue;
      system->memQueueCurrent = system->memQueue;

      if(system->context == NULL)
	return -1;

      printf("Please specify the location of the dram binary for system %d\n> ", i);
#if 0
      scanf("%s", binary);
#else
      strcpy(binary, "binaries/dram.bin");
#endif
      printf("file: %s\n", binary);
      system->dram = loadBinary(binary, ((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff));
      if(system->dram == NULL)
	return -1;

      printf("system->dram: %p\n", (void *)system->dram);

      for(j=0;j<(SYS->SYSTEM_CONFIG & 0xff);j++)
	{
	  CNT = (contextConfig *)((unsigned)SYS->CONTEXT + (j * sizeof(contextConfig)));
	  context = (contextT *)((unsigned)system->context + (j * sizeof(contextT)));

	  printf("Please specify the location of the iram binary for system %d, context %d\n> ", i, j);
#if 0
      scanf("%s", binary);
#else
      strcpy(binary, "binaries/iram.bin");
#endif
	  printf("file: %s\n", binary);

	  context->iram = loadBinary(binary, 0);
	  /*(unsigned *)malloc(sizeof(unsigned) * ((CNT->IFE_SIMPLE_IRAM_PRIV_CONFIG >> 8) & 0xffff));*/
	  if(context->iram == NULL)
	    return -1;

	  context->hypercontext = (hyperContextT *)calloc(sizeof(hyperContextT) * ((CNT->CONTEXT_CONFIG >> 4) & 0xf), 1);
	  if(context->hypercontext == NULL)
	    return -1;

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
	      hypercontext->VT_CTRL |= RUNNING << 3;
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
		  *(cluster->S_GPR + (unsigned)1) = ((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000;
		  cluster->S_FPR = (unsigned *)((unsigned)hypercontext->S_FPR + sFPRCount);
		  cluster->S_VR = (unsigned *)((unsigned)hypercontext->S_VR + sVRCount);
		  cluster->S_PR = (unsigned char*)((unsigned)hypercontext->S_PR + sPRCount);

		  cluster->pS_GPR = (unsigned *)((unsigned)hypercontext->pS_GPR + sGPRCount);
		  *(cluster->pS_GPR + (unsigned)1) = ((SYS->DRAM_SHARED_CONFIG >> 8) & 0xffff) * 1000;
		  cluster->pS_FPR = (unsigned *)((unsigned)hypercontext->pS_FPR + sFPRCount);
		  cluster->pS_VR = (unsigned *)((unsigned)hypercontext->pS_VR + sVRCount);
		  cluster->pS_PR = (unsigned char*)((unsigned)hypercontext->pS_PR + sPRCount);

		  printf("cluster: %d, sGPR 0x%x\n", l, (unsigned)cluster->S_GPR);

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

      free((unsigned *)system->dram);

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
	 *(hypercontext->S_GPR + (unsigned)1),
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
      printf("Q:%d - CC:%llu - T:%d - A:%d - D:%d - OP:%d - PC:%x - LR:%d - SP:%d - SYLL:%08x - S1:%d - S2:%d - S3:%d - T2:%d - A2:%d - D2:%d\n",
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

#ifdef VAJAZZLE
void push(unsigned le1Addr, void *gccAddr, typeT type, char *name, unsigned size, char pointer)
{
  struct mem *next;

  if(_vajazzle_vars == NULL)
    {
      /* first time round */
      _vajazzle_vars = calloc(sizeof(struct mem), 1);
      _vajazzle_vars_next = calloc(sizeof(struct mem), 1);

      _vajazzle_vars->addr = le1Addr;
      _vajazzle_vars->size = size;
      strcpy(_vajazzle_vars->name, name);
      _vajazzle_vars->P = gccAddr;
      _vajazzle_vars->type = type;
      _vajazzle_vars->pointer = pointer;

      _vajazzle_vars->valid = 1;

      _vajazzle_vars->next = _vajazzle_vars_next;
    }
  else
    {
      next = _vajazzle_vars_next;
      _vajazzle_vars_next = calloc(sizeof(struct mem), 1);

      next->addr = le1Addr;
      next->size = size;
      strcpy(next->name, name);
      next->P = gccAddr;
      next->type = type;
      next->pointer = pointer;

      next->valid = 1;

      next->next = _vajazzle_vars_next;
    }

  return;
}
#endif
