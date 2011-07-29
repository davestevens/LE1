#include <stdio.h>
#include <stdlib.h>
#include "functions.h"
#include "macros.h"

#ifdef API
#include "xmlRead.h"
#endif

unsigned *loadBinary(char *fileName, unsigned size)
{
  unsigned fileSize;
  FILE *filePoint;
  char *point;
  unsigned i;
  unsigned int *temp = (unsigned int *)malloc(sizeof(unsigned int));

  filePoint = fopen(fileName, "rb");
  if(filePoint == NULL)
    {
      printf("could not open file: %s\n", fileName);
      return NULL;
    }

  fseek(filePoint, 0L, SEEK_END);
  fileSize = ftell(filePoint);
  printf("\tSize of %s is 0x%x\n", fileName, fileSize);
  printf("\trequired size is: %d bytes\n", (size * 1000));
  fseek(filePoint, 0L, SEEK_SET);

  if(size)
    {
      if((unsigned)((size * 1000) < fileSize))
	{
	  printf("\tYou haven't given allocated enough space for the stack!\n");
	  printf("\t\tsize:     %d (bytes)\n", (size * 1000));
	  printf("\t\tfileSize: %d (bytes)\n", fileSize);
	  return NULL;
	}

      point = (char *)calloc((size * 1000), 1);
    }
  else
    {
      point = (char *)calloc((sizeof(char) * fileSize), 1);
    }

  printf("LOADING BINARY\n");

  for(i=0;i<fileSize;i+=4)
    {
      if(fread(temp, sizeof(char), 4, filePoint) == 0)
	{
	  printf("error reading file\n");
	  return NULL;
	}
      *(unsigned int *)(point + i) = ((*temp >> 24) & 0xff) | (((*temp >> 16) & 0xff) << 8) | (((*temp >> 8) & 0xff) << 16) | ((*temp & 0xff) << 24);
    }
  fclose(filePoint);

  return (unsigned *)point;
}

int cycle(contextT *context, hyperContextT *hypercontext, unsigned numClusters)
{
  clusterT *cluster;
  unsigned c;

  /* this will need to get all the details of the current cycle */
  printf("\tiram:           0x%0x\n", (unsigned)context->iram);
  printf("\ttotalWidth:     %d\n", hypercontext->totalWidth);
  printf("\tprogramCounter: 0x%x\n", (unsigned)hypercontext->programCounter);
  printf("\t\tinstruction:  0x%08x\n", *(context->iram + (hypercontext->programCounter)));

  for(c=0;c<numClusters;c++)
    {
      printf("\t\tcluster %d\n", c);
      cluster = (clusterT *)((unsigned)hypercontext->registers + (c * sizeof(clusterT)));
      printf("\t\t\tS_GPR: 0x%x\n", (unsigned)cluster->S_GPR);
      printf("\t\t\tS_FPR: 0x%x\n", (unsigned)cluster->S_FPR);
      printf("\t\t\tS_VR:  0x%x\n", (unsigned)cluster->S_VR);
      printf("\t\t\tS_PR:  0x%x\n", (unsigned)cluster->S_PR);
    }

  /* TODO: call the operation! */

  /* bundleCount
     decodeStallCount
     branchTaken
     branchNotTaken
   */
  *(unsigned long long *)((unsigned)hypercontext->bundleCount + (sizeof(unsigned long long) * 3)) = 10;
  hypercontext->decodeStallCount = 53;
  hypercontext->branchTaken = 4;
  hypercontext->branchNotTaken = 45;

  return 0;
}

int printCounts(hyperContextT *hypercontext)
{
  /*clusterT *cluster;*/
    unsigned c;
    unsigned long long *bundleCount;

  printf("printCounts\n");

  printf("\tcycleCount:       %lld\n", hypercontext->cycleCount);
  printf("\tstallCount:       %lld\n", hypercontext->stallCount);
  printf("\tnopCount:         %lld\n", hypercontext->nopCount);
  printf("\tidleCount:        %lld\n", hypercontext->idleCount);

  for(c=0;c<hypercontext->totalWidth+1;c++)
    {
      bundleCount = (unsigned long long *)((unsigned)hypercontext->bundleCount + (sizeof(unsigned long long) * c));
      printf("\t\t[%d] = %lld\n", c, *bundleCount);
    }

  printf("\tdecodeStallCount: %lld\n", hypercontext->decodeStallCount);
  printf("\tbranchTaken:      %lld\n", hypercontext->branchTaken);
  printf("\tbranchNotTaken:   %lld\n", hypercontext->branchNotTaken);
  printf("\tcontrolFlowChange:%lld\n", hypercontext->controlFlowChange);


  return 0;
}

unsigned checkActive(void)
{
  systemT *system;
  contextT *context;
  hyperContextT *hypercontext;

  systemConfig *SYS;
  contextConfig *CNT;
  hyperContextConfig *HCNT;

  unsigned i, j, k;

  /* loop through each available hypercontext */
  for(i=0;i<(GALAXY_CONFIG & 0xff);i++)
    {
      /*printf("\tsystem: %d\n", i);*/
      SYS = (systemConfig *)((unsigned)SYSTEM + (i * sizeof(systemConfig)));
      system = (systemT *)((unsigned)galaxyT + (i * sizeof(systemT)));

      /* loop through contexts */
      for(j=0;j<(SYS->SYSTEM_CONFIG & 0xff);j++)
	{
	  /*printf("\t\tcontext: %d\n", j);*/
	  CNT = (contextConfig *)((unsigned)SYS->CONTEXT + (j * sizeof(contextConfig)));
	  context = (contextT *)((unsigned)system->context + (j * sizeof(contextT)));

	  /* loop through hypercontexts */
	  for(k=0;k<((CNT->CONTEXT_CONFIG >> 4) & 0xf);k++)
	    {
	      /*printf("\t\t\thypercontext: %d\n", k);*/
	      HCNT = (hyperContextConfig *)((unsigned)CNT->HCONTEXT + (k * sizeof(hyperContextConfig)));
	      hypercontext = (hyperContextT *)((unsigned)context->hypercontext + (k * sizeof(hyperContextT)));

	      /*printf("\t\t\t\thypercontext totalWidth: %d\n", hypercontext->totalWidth);*/

	      /* TODO: need to check for other states */
	      /*if(((hypercontext->VT_CTRL >> 3) & 0xff) == 1)*/
	      /*return 1;*/
	      if(((hypercontext->VT_CTRL >> 1) & 0x1) == 0)
		return 1;
	    }
	}
    }

  return 0;
}

instructionPacket fetchInstruction(contextT *context, unsigned programCounter)
{
  instructionPacket inst;
  unsigned format, check;
  /*printf("fetchInstruction\n");
  printf("\tprogramCounter: 0x%x\n", programCounter);
  printf("\tiram: 0x%x\n", *context->iram);*/

  inst.op = (unsigned)*(context->iram + (programCounter >> 2));
  /*  printf("inst.op: 0x%08x\n", inst.op);*/

  format = (inst.op >> 26) & 0xf;
  check = (inst.op >> 6) & 0x7;

  inst.imm = 0;

  if(((format == 1) && (check != 1)) || (format == 5))
    {
      inst.imm = (unsigned)*(context->iram + ((programCounter >> 2) + 1));
      inst.immValid = 1;
      inst.nextPC = programCounter + 8;
    }
  else
    {
      inst.immValid = 0;
      inst.nextPC = programCounter + 4;
    }

  return inst;
}

unsigned checkBundle(hyperContextT *hypercontext, unsigned startPC, unsigned endPC)
{
  unsigned long long *bundleCount;
  unsigned totalWidth = hypercontext->totalWidth;
  unsigned numOfWords = ((endPC >> 2) + 1) - (startPC >> 2);

  /*printf("numOfWords: %d\n", numOfWords);
    printf("totalWidth: %d\n", totalWidth);*/

  if(numOfWords > totalWidth)
    {
      /*printf("numOfWorks > totalWidth\n");*/
      hypercontext->decodeStallCount++;
      hypercontext->stallCount++;
      if((numOfWords == (totalWidth * 2)) && ((startPC >> 2) % totalWidth))
	{
	  hypercontext->decodeStallCount++;
#ifndef API
	  hypercontext->stalled++;
#else
	  hypercontext->stallCount++;
#endif
	}
      bundleCount = (unsigned long long *)((unsigned)hypercontext->bundleCount);
      *bundleCount = *bundleCount + 1;
      return 1;
    }
  else if(numOfWords == totalWidth)
    {
      if((startPC >> 2) % totalWidth)
	{
	  /*printf("numOfWorks ==  totalWidth\n");*/
	  hypercontext->decodeStallCount++;
	  hypercontext->stallCount++;
	  bundleCount = (unsigned long long *)((unsigned)hypercontext->bundleCount);
	  *bundleCount = *bundleCount + 1;
	  return 1;
	}
    }

  return 0;
}

instruction instructionDecode(unsigned inst, unsigned immediate, /*unsigned *dram,*/ hyperContextT *hypercontext, systemT *system, contextT *context, unsigned VT_CTRL, unsigned dramSize)
{
  instruction this; /* TODO: possibly zero this out */

  this.is = (inst >> 31) & 0x1;
  this.cs = (inst >> 30) & 0x1;
  this.format = (inst >> 26) & 0xf;

  this.opc = 0;
  this.b = 0;

  /*printf("formatXXX: %d\n", this.format);*/
  /*  printf("immediate: %d\n", immediate);*/

  switch(this.format)
    {
    case 0:
      this.opc = (inst >> 21) & 0x1f;
      break;
    case 1:
      this.opc = (inst >> 21) & 0x1f;
      break;
    case 2:
      this.opc = (inst >> 21) & 0x1f;
      break;
    case 3:
      this.opc = (inst >> 24) & 0x3;
      break;
    case 4:
      this.opc = (inst >> 21) & 0xf;
      this.b = (inst >> 25) & 0x1;
      break;
    case 5:
      this.opc = (inst >> 21) & 0xf;
      this.b = (inst >> 25) & 0x1;
      break;
    case 6:
      this.opc = (inst >> 21) & 0xf;
      this.b = (inst >> 25) & 0x1;
      break;
    case 7:
      this.opc = (inst >> 24) & 0x3;
      break;
    case 8:
      this.opc = (inst >> 24) & 0x3;
      break;
    case 9:
      this.opc = (inst >> 21) & 0x1f;
      break;
    case 10:
      this.opc = (inst >> 24) & 0x3;
      break;
    case 11:
      this.opc = (inst >> 24) & 0x3;
      break;
    case 12:
      this.opc = (inst >> 24) & 0x3;
      break;
    case 13:
      this.opc = (inst >> 24) & 0x3;
      break;
    case 14:
      this.opc = (inst >> 24) & 0x3;
      break;
    case 15:
      this.opc = (inst >> 20) & 0x3f;
      break;
    default:
      printf("unknown format: %d\n", this.format);
      break;
    }

  this.packet = getOp(this.format, this.opc, inst, immediate, /*dram,*/ hypercontext, system, context, VT_CTRL, dramSize);

  return this;
}

void memRequest(systemT *system, unsigned *t, unsigned s1, unsigned ctrlReg, memOpT memOp, unsigned tV)
{

  struct memReqT *temp;

  if(system->memReq == NULL)
    {
      /* this means there are no memory request */
      /*printf("nothing in the list\n");*/
      if((system->memReq = calloc(sizeof(struct memReqT), 1)) == NULL)
	{
	  printf("error allocating memory (memReqT)\n");
	  return;
	}
      temp = system->memReq;
    }
  else
    {
      /* need to run through the list and find the last */
      temp = system->memReq;

      while(temp->next != NULL)
	temp = temp->next;

      if((temp->next = calloc(sizeof(struct memReqT), 1)) == NULL)
	{
	  printf("error allocating memory (memReqT)\n");
	}
      temp = temp->next;
    }

  temp->pointer = t;
  temp->value = s1;
  temp->ctrlReg = ctrlReg;
  temp->memOp = memOp;
  temp->pointerV = tV;

  temp->next = NULL;

  return;
}

int memoryDump(unsigned size, unsigned system, unsigned *dram)
{
  FILE *filePoint;
  char filename[256];
  unsigned count;

  sprintf(filename, "memoryDump_%d.dat", system);
  printf("filename: %s\n", filename);

  filePoint = fopen(filename, "w");

  if(filePoint == NULL)
    {
      printf("could not open file: %s\n", filename);
      return -1;
    }

  fprintf(filePoint, "Cache dump size of 0x%x\n", (size << 2));

  for(count=0;count<size;count++)
    {
      fprintf(filePoint, "Location\t");
      fprintf(filePoint, "0x%08x (%d)\t-\t", (count << 2), (count << 2));
      fprintf(filePoint, "0x%08x\n", *((unsigned *)dram + count));
    }
  fclose(filePoint);

  return 0;
}

/* this should push to a list the thread requests */
void newThreadRequest(unsigned from, unsigned to, systemT *system)
{
  /* get system */
  struct newThreadT *temp;

  printf("newThreadRequest: 0x%x, 0x%x\n", from, to);

  if(system->threadReq == NULL)
    {
      /* this means there are no memory requests */
      printf("nothing in the list\n");
      if((system->threadReq = calloc(sizeof(struct newThreadT), 1)) == NULL)
	{
	  printf("error allocating memory (newThreadT)\n");
	  return;
	}
      temp = system->threadReq;
    }
  else
    {
      /* need to run through list and put it at the end */
      temp = system->threadReq;

      while(temp->next != NULL)
	temp = temp->next;

      if((temp->next = calloc(sizeof(struct newThreadT), 1)) == NULL)
	{
	  printf("error allocating memory (newThreadT)\n");
	  return;
	}
      temp = temp->next;
    }

  temp->from = from;
  temp->to = to;

  temp->next = NULL;
  return;
}

int serviceThreadRequests(systemT *system)
{
  struct newThreadT *temp;

  if((temp = system->threadReq) == NULL)
    return 0;

  do {
      printf("there is a thread request\n");
      printf("\ttemp->from 0x%x\n", temp->from);
      printf("\ttemp->to 0x%x\n", temp->to);

      /* start thread running */
      {
	unsigned context, hypercontext;
	contextT *cnt;
	hyperContextT *hcnt;
	context = (temp->to >> 16) & 0xff;
	hypercontext = (temp->to >> 12) & 0xf;

	printf("context[%d] hypercontext[%d]\n", context, hypercontext);
	cnt = (contextT *)((unsigned)system->context + (context * sizeof(contextT)));
	hcnt = (hyperContextT *)((unsigned)cnt->hypercontext + (hypercontext * sizeof(hyperContextT)));

	hcnt->VT_CTRL |= RUNNING << 3;
	printf("hcnt->VT_CTRL 0x%x\n", hcnt->VT_CTRL);

      }

      /* remove from list */
      if(temp == system->threadReq)
	{
	  struct newThreadT *toDel = temp;
	  system->threadReq = temp->next;
	  temp = temp->next;
	  free(toDel);
	}
      else
	{
	  temp = temp->next;
	}
  } while(temp);

  return 0;
}

void serviceMemRequest(systemT *system, unsigned findBank, unsigned numBanks, unsigned dramSize)
{
  /* print all memReqs */
  struct memReqT *temp;
  unsigned context, hypercontext, whichBank;
  contextT *cnt;
  hyperContextT *hcnt;

  unsigned given = 0;

  temp = system->memReq;

  if(temp == NULL)
    {
#ifdef DEBUGmem
      printf("nothing in list\n");
#endif
    }
  else
    {
      for(whichBank=0;whichBank<numBanks;whichBank++)
	{
#ifdef DEBUGmem
	  printf("whichBank: %d\n", whichBank);
#endif
	  do {

	    if((temp->value & findBank) == whichBank)
	      {
#ifdef DEBUGmem
		printf("\tthis req is on this bank\n");
#endif
		context = (temp->ctrlReg >> 16) & 0xff;
		hypercontext = (temp->ctrlReg >> 12) & 0xf;
		cnt = (contextT *)((unsigned)system->context + (context * sizeof(contextT)));
		hcnt = (hyperContextT *)((unsigned)cnt->hypercontext + (hypercontext * sizeof(hyperContextT)));

#ifdef DEBUGmem
		printf("context: %d, hypercontext: %d\n", context, hypercontext);
#endif

		if(given)
		  {
#ifdef DEBUGmem
		    printf("need to stall this\n");
#endif
		    hcnt->stalled++;
		  }
		else
		  {
#ifdef DEBUGmem
		    printf("this one will get it\n");
#endif
		    switch(temp->memOp)
		      {
		      case mLDSB:
			if(temp->value >= dramSize)
			  {
			    printf("ERROR: OOB\n");
			    *(temp->pointer) = 0;
			  }
			else
			  _LDSB_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
			break;
		      case mLDBs:
			if(temp->value >= dramSize)
			  {
			    printf("ERROR: OOB\n");
			    *(temp->pointer) = 0;
			  }
			else
			  _LDBs_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
			break;
		      case mLDUB:
#ifdef DEBUGmem
			printf("LDUB\n");
			printf("temp->value: %d\n", temp->value);
			printf("0x%08x\n", *((unsigned *)system->dram + (temp->value)));
			printf("0x%08x\n", *((unsigned *)system->dram + (temp->value >> 2)));
#endif
			if(temp->value >= dramSize)
			  {
			    printf("ERROR: OOB\n");
			    *(temp->pointer) = 0;
			  }
			else
			  _LDUB_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
#ifdef DEBUGmem
			printf("%p -> 0x%x\n", (void *)temp->pointer, *(temp->pointer));
#endif
			break;
		      case mLDSH:
			if(temp->value >= dramSize)
			  {
			    printf("ERROR: OOB\n");
			    *(temp->pointer) = 0;
			  }
			else
			  _LDSH_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
#ifdef DEBUGmem
			printf("value: 0x%x\n", *(unsigned *)(temp->pointer));
#endif
			break;
		      case mLDUH:
			if(temp->value >= dramSize)
			  {
			    printf("ERROR: OOB\n");
			    *(temp->pointer) = 0;
			  }
			else
			  _LDUH_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
			break;
		      case mLDW:
#ifdef DEBUGmem
			printf("LDW!!!\n");
#endif
#ifdef DEBUGmem
			printf("loading from: 0x%x\n", (temp->value + (unsigned)(system->dram)));
#endif
			if(temp->value >= dramSize)
			  {
			    printf("ERROR: OOB\n");
			    *(temp->pointer) = 0;
			  }
			else
			  _LDW_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
#ifdef DEBUGmem
			printf("value: 0x%x\n", *(unsigned *)(temp->pointer));
#endif
			break;
		      case mSTB:
#ifdef DEBUGmem
			printf("STB!!!\n");
			printf("storing: 0x%x\n", temp->pointerV);
			printf("to: 0x%x\n", (temp->value));
#endif
			if(temp->value >= dramSize)
			  {
			    unsigned fZero = 0;
			    unsigned *fuckingZero = &fZero;
			    printf("ERROR: OOB\n");
			    _STB_iss((temp->value + (unsigned)(system->dram)), fuckingZero);
			  }
			else {
			  unsigned *tempP = (unsigned *)malloc(sizeof(int));
			  *tempP = temp->pointerV;
			  _STB_iss((temp->value + (unsigned)(system->dram)), tempP);
			  free(tempP);
			}
#ifdef DEBUGmem
			printf("memory now: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif
			break;
		      case mSTBs:
#ifdef DEBUGmem
			printf("STBs!!!\n");
			printf("storing: 0x%x\n", *temp->pointer);
			printf("to: 0x%x\n", (temp->value));
#endif
			if(temp->value >= dramSize)
			  {
			    printf("ERROR: OOB\n");
			    unsigned fZero = 0;
			    unsigned *fuckingZero = &fZero;
			    _STB_iss((temp->value + (unsigned)(system->dram)), fuckingZero);
			  }
			else {
			  unsigned *tempP = (unsigned *)malloc(sizeof(int));
			  *tempP = temp->pointerV;
			  _STB_iss((temp->value + (unsigned)(system->dram)), tempP);
			  free(tempP);
			}
#ifdef DEBUGmem
			printf("memory now: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif
			break;
		      case mSTH:
#ifdef DEBUGmem
			printf("STH!!!\n");
			printf("storing: 0x%x\n", *temp->pointer);
			printf("to: 0x%x\n", (temp->value));
#endif
			if(temp->value >= dramSize)
			  {
			    printf("ERROR: OOB\n");
			    unsigned fZero = 0;
			    unsigned *fuckingZero = &fZero;
			    _STH_iss((temp->value + (unsigned)(system->dram)), fuckingZero);
			  }
			else {
			  unsigned *tempP = (unsigned *)malloc(sizeof(int));
			  *tempP = temp->pointerV;
			  _STH_iss((temp->value + (unsigned)(system->dram)), tempP);
			  free(tempP);
			}
#ifdef DEBUGmem
			printf("memory now: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif

			break;
		      case mSTW:
			{
#ifdef DEBUGmem
			  printf("STW!!!\n");
			  printf("storing: 0x%x\n", *temp->pointer);
			  printf("to: 0x%x\n", (temp->value));
#endif
			  if(temp->value >= dramSize)
			    {
			      printf("ERROR: OOB\n");
			      unsigned fZero = 0;
			      unsigned *fuckingZero = &fZero;
			      _STW_iss((temp->value + (unsigned)(system->dram)), fuckingZero);
			    }
			  else {
			    unsigned *tempP = (unsigned *)malloc(sizeof(int));
			    *tempP = temp->pointerV;
			    _STW_iss((temp->value + (unsigned)(system->dram)), tempP);
			    free(tempP);
			  }
#ifdef DEBUGmem
			  printf("memory now: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif
			}
			break;
		      default:
			printf("unknown memory op :(\n");
			break;
		      }

		    given = 1;

		    /* then remove from list */
		    if(temp == system->memReq)
		      {
			system->memReq = temp->next;
			free(temp);
		      }
		    else
		      {
			/* TODO: TEST THIS!!!! */
			struct memReqT *remove = temp;
			temp = system->memReq;
			do {
			  if(temp->next == remove)
			    {
			      temp->next = remove->next;
			      free(remove);
			      break;
			    }
			  temp = temp->next;
			} while(temp != NULL);
		      }
		  }
	      }

	    temp = temp->next;

	  } while(temp != NULL);
	}
    }
}

void serviceMemRequestPERFECT(systemT *system, unsigned dramSize)
{
  struct memReqT *temp;
  unsigned context, hypercontext;
  contextT *cnt;
  hyperContextT *hcnt;

  temp = system->memReq;

  if(temp == NULL)
    {
    }
  else
    {
      do {
	context = (temp->ctrlReg >> 16) & 0xff;
	hypercontext = (temp->ctrlReg >> 12) & 0xf;
	cnt = (contextT *)((unsigned)system->context + (context * sizeof(contextT)));
	hcnt = (hyperContextT *)((unsigned)cnt->hypercontext + (hypercontext * sizeof(hyperContextT)));

	switch(temp->memOp)
	  {
	  case mLDSB:
	    if(temp->value >= dramSize)
	      {
		/*printf("ERROR: OOB\n");*/
		*(temp->pointer) = 0;
	      }
	    else
	      {
		_LDSB_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
#ifdef DEBUGmem
		printf("LDSB: 0x%x\n", *(unsigned *)temp->pointer);
#endif
	      }
	    break;
	  case mLDBs:
	    if(temp->value >= dramSize)
	      {
		/*printf("ERROR: OOB\n");*/
		*(temp->pointer) = 0;
	      }
	    else
	      {
		_LDBs_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
#ifdef DEBUGmem
		printf("LDBs: 0x%x\n", *(unsigned *)temp->pointer);
#endif
	      }
	    break;
	  case mLDUB:
	    if(temp->value >= dramSize)
	      {
		/*printf("ERROR: OOB\n");*/
		*(temp->pointer) = 0;
	      }
	    else
	      {
		_LDUB_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
#ifdef DEBUGmem
		printf("LDUB: 0x%x\n", *(unsigned *)temp->pointer);
#endif
	      }
	    break;
	  case mLDSH:
	    if(temp->value >= dramSize)
	      {
		/*printf("ERROR: OOB\n");*/
		*(temp->pointer) = 0;
	      }
	    else
	      {
		_LDSH_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
#ifdef DEBUGmem
		printf("LDSH: 0x%x\n", *(unsigned *)temp->pointer);
#endif
	      }
	    break;
	  case mLDUH:
	    if(temp->value >= dramSize)
	      {
		/*printf("ERROR: OOB\n");*/
		*(temp->pointer) = 0;
	      }
	    else
	      {
		_LDUH_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
#ifdef DEBUGmem
		printf("LDUH: 0x%x\n", *(unsigned *)temp->pointer);
#endif
	      }
	    break;
	  case mLDW:
	    if(temp->value >= dramSize)
	      {
		/*printf("ERROR: OOB\n");*/
		*(temp->pointer) = 0;
	      }
	    else
	      {
		_LDW_iss(temp->pointer, (temp->value + (unsigned)(system->dram)));
#ifdef DEBUGmem
		printf("LDW: 0x%x\n", *(unsigned *)temp->pointer);
#endif
	      }
	    break;
	  case mSTB:
	    if(temp->value >= dramSize)
	      {
		unsigned fZero = 0;
		unsigned *fuckingZero = &fZero;
		/*printf("ERROR: OOB\n");*/
		_STB_iss((temp->value + (unsigned)(system->dram)), fuckingZero);
	      }
	    else
	      {
		_STB_iss((temp->value + (unsigned)(system->dram)), temp->pointer);
#ifdef DEBUGmem
		printf("STB: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif
	      }
	    break;
	  case mSTBs:
	    if(temp->value >= dramSize)
	      {
		/*printf("ERROR: OOB\n");*/
		unsigned fZero = 0;
		unsigned *fuckingZero = &fZero;
		_STB_iss((temp->value + (unsigned)(system->dram)), fuckingZero);
	      }
	    else
	      {
		_STB_iss((temp->value + (unsigned)(system->dram)), temp->pointer);
#ifdef DEBUGmem
		printf("STBs: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif
	      }
	    break;
	  case mSTH:
	    if(temp->value >= dramSize)
	      {
		/*printf("ERROR: OOB\n");*/
		unsigned fZero = 0;
		unsigned *fuckingZero = &fZero;
		_STH_iss((temp->value + (unsigned)(system->dram)), fuckingZero);
	      }
	    else
	      {
		_STH_iss((temp->value + (unsigned)(system->dram)), temp->pointer);
#ifdef DEBUGmem
		printf("STH: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif
	      }
	    break;
	  case mSTW:
	    {
	      if(temp->value >= dramSize)
		{
		  /*printf("ERROR: OOB\n");*/
		  unsigned fZero = 0;
		  unsigned *fuckingZero = &fZero;
		  _STW_iss((temp->value + (unsigned)(system->dram)), fuckingZero);
		}
	      else
		{
		  _STW_iss((temp->value + (unsigned)(system->dram)), temp->pointer);
#ifdef DEBUGmem
		  printf("STW: 0x%x\n", *(unsigned *)((unsigned)system->dram + temp->value));
#endif
		}
	    }
	    break;
	  default:
	    printf("unknown memory op :(\n");
	    break;
	  }

	/* then remove from list */
	if(temp == system->memReq)
	  {
	    system->memReq = temp->next;
	    free(temp);
	  }
	else
	  {
	    /* TODO: TEST THIS!!!! */
	    struct memReqT *remove = temp;
	    temp = system->memReq;
	    do {
	      if(temp->next == remove)
		{
		  temp->next = remove->next;
		  free(remove);
		  break;
		}
	      temp = temp->next;
	    } while(temp != NULL);
	  }

	temp = temp->next;
      } while(temp != NULL);
    }
}

#ifdef API
void insizzleAPILdIRAM(char *iram, int size) {
  int i;
  char *point;

#ifdef APIDEBUG
  printf("loadIRAM:\n");
  printf("\t%p\n", iram);
  printf("\t%d\n", size);
#endif

  /* need to malloc a space of memory */

  point = (char *)calloc(sizeof(char) * size, 1);
  if(point == NULL) {
    printf("error allocating memory for iram\n");
    return;
  }

  for(i=0;i<size;i+=4) {
    *(unsigned *)(point + i) = (((*(iram + i) & 0xff) << 24) | ((*(iram + i + 1) & 0xff) << 16) | ((*(iram + i + 2) & 0xff) << 8) | (*(iram + i + 3) & 0xff));
  }

  globalC->iram = (unsigned *)point;
}

void insizzleAPILdDRAM(char *dram, int size) {
  int i;
  char *point;

#ifdef APIDEBUG
  printf("loadDRAM:\n");
  printf("\t%p\n", dram);
  printf("\t%d\n", size);
#endif

  /* need to malloc a space of memory */

  point = (char *)calloc(sizeof(char) * size, 1);
  if(point == NULL) {
    printf("error allocating memory for iram\n");
    return;
  }

  for(i=0;i<size;i+=4) {
    *(unsigned *)(point + i) = (((*(dram + i) & 0xff) << 24) | ((*(dram + i + 1) & 0xff) << 16) | ((*(dram + i + 2) & 0xff) << 8) | (*(dram + i + 3) & 0xff));
  }

  globalS->dram = (unsigned *)point;
}

/*int insizzleAPIClock(galaxyConfigT *galaxyConfig, hcTracePacketT gTracePacket[][MASTERCFG_CONTEXTS_MAX][MASTERCFG_HYPERCONTEXTS_MAX]) {
  printf("insizzleAPIClock\n");
  gTracePacket[0][0][0].vt_ctrl = 0xdeadbeef;
  gTracePacket[0][0][0].bundle[0].pc = 0xcafef00d;
  return 0;
  }*/

/* setup global System, Context and Hypercontext pointers
 */
int insizzleAPISetCurrent(unsigned system, unsigned context, unsigned hypercontext, unsigned cluster) {
#ifdef APIDEBUG
  printf("insizzleAPISetCurrent(%d, %d, %d, %d)\n", system, context, hypercontext, cluster);
#endif
  /* TODO: should put a check here to see its not above the MAX */
  if(system >= MASTERCFG_SYSTEMS_MAX) {
    printf("\tsystem %d >= MASTERCFG_SYSTEMS_MAX: %d\n", system, MASTERCFG_SYSTEMS_MAX);
    return -1;
  }
  if(context >= MASTERCFG_CONTEXTS_MAX) {
    printf("\tcontext %d >= MASTERCFG_CONTEXTS_MAX: %d\n", context, MASTERCFG_CONTEXTS_MAX);
    return -1;
  }
  if(hypercontext >= MASTERCFG_HYPERCONTEXTS_MAX) {
    printf("\thypercontext %d >= MASTERCFG_HYPERCONTEXTS_MAX: %d\n", hypercontext, MASTERCFG_HYPERCONTEXTS_MAX);
    return -1;
  }
  if(cluster >= MASTERCFG_CLUSTERS) {
    printf("\tcluster %d >= MASTERCFG_CLUSTERS: %d\n", cluster, MASTERCFG_CLUSTERS);
    return -1;
  }
  globalS = (systemT *)((unsigned)galaxyT + (system * sizeof(systemT)));
  globalC = (contextT *)((unsigned)globalS->context + (context * sizeof(contextT)));
  globalHC = (hyperContextT *)((unsigned)globalC->hypercontext + (hypercontext * sizeof(hyperContextT)));
  globalSid = system;
  globalCid = context;
  globalHCid = hypercontext;
  return 0;
}

/* read one word from memory (iram)
 */
int insizzleAPIRdOneIramLocation(galaxyConfigT *galaxyConfig, unsigned iaddr, unsigned *data) {
  *data = (unsigned)*(globalC->iram + (iaddr >> 2));
#ifdef APIDEBUG
  printf("insizzleAPIRdOneIramLocation: 0x%08x = 0x%08x\n", iaddr, *data);
#endif
  return 0;
}

/* write one word to memory (iram)
 */
int insizzleAPIWrOneIramLocation(galaxyConfigT *galaxyConfig, unsigned iaddr, unsigned data) {
  *(globalC->iram + (iaddr >> 2)) = data;
#ifdef APIDEBUG
  printf("insizzleAPIWrOneIramLocation: 0x%08x = 0x%08x\n", iaddr, data);
#endif
  return 0;
}

/* read one word from memory (dram)
 */
int insizzleAPIRdOneDramLocation (galaxyConfigT *galaxyConfig, unsigned daddr, unsigned *data) {
  *data = (unsigned)*(globalS->dram + (daddr >> 2));
#ifdef APIDEBUG
  printf("insizzleAPIRdOneDramLocation: 0x%08x = 0x%08x\n", daddr, *data);
#endif
  return 0;
}

/* write one word to memory (dram)
 */
int insizzleAPIWrOneDramLocation (galaxyConfigT *galaxyConfig, unsigned daddr, unsigned data) {
  *(globalS->dram + (daddr >> 2)) = data;
#ifdef APIDEBUG
  printf("insizzleAPIWrOneDramLocation: 0x%08x = 0x%08x\n", daddr, data);
#endif
  return 0;
}

/* read a single register
 */
int insizzleAPIRdOneSGpr(unsigned sgpr, unsigned *rdata) {
  *rdata = (unsigned)*(globalHC->S_GPR + sgpr);
#ifdef APIDEBUG
  printf("insizzleAPIRdOneSGpr: 0x%08x\n", *rdata);
#endif
  return 0;
}

/* write a single register
 */
int insizzleAPIWrOneSGpr(unsigned sgpr, unsigned wdata) {
  *(globalHC->S_GPR + sgpr) = wdata;
  *(globalHC->pS_GPR + sgpr) = wdata;
#ifdef APIDEBUG
  printf("insizzleAPIWrOneSGpr: 0x%08x\n", wdata);
#endif
  return 0;
}

/* read link register
 */
int insizzleAPIRdOneLr(galaxyConfigT *galaxyConfig, unsigned *rdata) {
  *rdata = globalHC->linkReg;
#ifdef APIDEBUG
  printf("insizzzleAPIRdOneLr: 0x%08x\n", *rdata);
#endif
  return 0;
}

/* write link register
 */
int insizzleAPIWrOneLr(galaxyConfigT *galaxyConfig, unsigned wdata) {
  globalHC->linkReg = wdata;
  globalHC->plinkReg = wdata;
#ifdef APIDEBUG
  printf("insizzleAPIWrOneLr: 0x%08x\n", wdata);
#endif
  return 0;
}

/* read a single branch register
 */
int insizzleAPIRdOneBr(unsigned br, unsigned *rdata) {
  *rdata = (unsigned)*(globalHC->S_PR + br);
#ifdef APIDEBUG
  printf("insizzleAPIWrOneBr: 0x%x\n", *rdata);
#endif
  return 0;
}

/* write a single branch register
 */
int insizzleAPIWrOneBr(unsigned br, unsigned wdata) {
  *(globalHC->S_PR + br) = (wdata & 0x1);
  *(globalHC->pS_PR + br) = (wdata & 0x1);
#ifdef APIDEBUG
  printf("insizzleAPIWrOneBr: 0x%x\n", wdata);
#endif
  return 0;
}

/* defines used here, will need to change to fit with vtAPI */
#define RDY 0
#define RNG 1
#define BML 2
#define TS  3
#define TAS 4
#define TA  5

/* read control register
 */
int insizzleAPIRdCtrl(galaxyConfigT *galaxyConfig, vtCtrlStateE *val) {
  /*val = (globalHC->VT_CTRL >> 3) & 0xff;*/
  if((globalHC->VT_CTRL >> 1) & 0x1) {
    *val = _DEBUG;
  }
  else {
    if((globalHC->VT_CTRL >> 2) & 0x1) {
      /* single step mode */
      switch((globalHC->VT_CTRL >> 3) & 0xff) {
      case RDY:
	*val = SSTEP_READY;
	break;
      case RNG:
	*val = SSTEP_RUNNING;
	break;
      case BML:
	*val = SSTEP_BLOCKED_MUTEX_LOCK;
	break;
      case TS:
	*val = SSTEP_TERMINATED_SYNC;
	break;
      default:
	printf("unknown VT_CTRL mode: %d\n", globalHC->VT_CTRL);
	return -1;
	break;
      }
    }
    else {
      /* normal mode */
      switch((globalHC->VT_CTRL >> 3) & 0xff) {
      case RDY:
	*val = READY;
	break;
      case RNG:
	*val = RUNNING;
	break;
      case BML:
	*val = BLOCKED_MUTEX_LOCK;
	break;
      case TS:
	*val = TERMINATED_SYNC;
	break;
      case TAS:
	*val = TERMINATED_ASYNC_HOST;
	break;
      case TA:
	*val = TERMINATED_ASYNC;
	break;
      default:
	printf("unknown VT_CTRL mode: %d\n", globalHC->VT_CTRL);
	return -1;
	break;
      }
    }
  }
#ifdef APIDEBUG
  printf("insizzleAPIRdCtrl: 0x%08x\n", *val);
#endif
  return 0;
}

/* write control register
 */
int insizzleAPIWrCtrl(galaxyConfigT *galaxyConfig, vtCtrlStateE val) {
  switch(val) {
  case _DEBUG:
    globalHC->VT_CTRL &= 0xfffffffb;
    globalHC->VT_CTRL |= (1 << 1);
    break;
  case SSTEP_READY:
    globalHC->VT_CTRL &= 0xfffffffd;
    globalHC->VT_CTRL |= (RDY << 3);
    break;
  case SSTEP_RUNNING:
    globalHC->VT_CTRL &= 0xfffffffd;
    globalHC->VT_CTRL |= (RNG << 3);
    break;
  case SSTEP_BLOCKED_MUTEX_LOCK:
    globalHC->VT_CTRL &= 0xfffffffd;
    globalHC->VT_CTRL |= (BML << 3);
    break;
  case SSTEP_TERMINATED_SYNC:
    globalHC->VT_CTRL &= 0xfffffffd;
    globalHC->VT_CTRL |= (TS << 3);
    break;
  case READY:
    globalHC->VT_CTRL &= 0xfffffff9;
    globalHC->VT_CTRL |= (RDY << 3);
    break;
  case RUNNING:
    globalHC->VT_CTRL &= 0xfffffff9;
    globalHC->VT_CTRL |= (RNG << 3);
    break;
  case BLOCKED_MUTEX_LOCK:
    globalHC->VT_CTRL &= 0xfffffff9;
    globalHC->VT_CTRL |= (BML << 3);
    break;
  case TERMINATED_ASYNC_HOST:
    globalHC->VT_CTRL &= 0xfffffff9;
    globalHC->VT_CTRL |= (TAS << 3);
    break;
  case TERMINATED_ASYNC:
    globalHC->VT_CTRL &= 0xfffffff9;
    globalHC->VT_CTRL |= (TA << 3);
    break;
  case TERMINATED_SYNC:
    globalHC->VT_CTRL &= 0xfffffff9;
    globalHC->VT_CTRL |= (TS << 3);
    break;
  default:
    printf("unknown Control State requested (%d)\n", val);
    return -1;
    break;
  }
#ifdef APIDEBUG
  printf("insizzleAPIWrCtrl: 0x%08x\n", globalHC->VT_CTRL);
#endif
  return 0;
}

/* read in XML machine model, copy values into static arrays and then populate the galaxy
 */
int insizzleAPIStubInitVtApi(galaxyConfigT *galaxyConfig) {
  char *filename = "LE1/Insizzle/MM/vexdefault.xml";
#ifdef APIDEBUG
  printf("insizzleAPIStubInitVtApi (FROM INSIZZLE)\n");
  printf("need to open and read in: %s\n", filename);
#endif
  if(readConf(filename) == -1) {
    printf("error reading config file: %s\n", filename);
    return -1;
  }
  if(readConfStatic(filename, galaxyConfig) == -1) {
    printf("error reading config file: %s\n", filename);
    return -1;
  }
#ifdef APIDEBUG
  printf("then setupGalaxy()\n");
#endif
  if(setupGalaxy() == -1) {
    printf("error setting up galaxy\n");
    return -1;
  }
  return 0;
}

/* write program counter
 */
int insizzleAPIWrPC(galaxyConfigT *galaxyConfig, unsigned val) {
  globalHC->programCounter = val;
#ifdef APIDEBUG
  printf("insizzleAPIWrPC: 0x%08x\n", val);
#endif
  return 0;
}

int insizzleAPIRdPC(galaxyConfigT *galaxyConfig, unsigned *val) {
  *val = globalHC->programCounter;
#ifdef APIDEBUG
  printf("insizzleAPIRdPC: 0x%08x\n", *val);
#endif
  return 0;
}
#endif
