#include <stdio.h>
#include <stdlib.h>
#include "functions.h"

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
	  hypercontext->stalled++;
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

instruction instructionDecode(unsigned inst, unsigned immediate, /*unsigned *dram,*/ hyperContextT *hypercontext, systemT *system)
{
  instruction this;

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

  this.packet = getOp(this.format, this.opc, inst, immediate, /*dram,*/ hypercontext, system);

  return this;
}

void memRequest(systemT *system, unsigned *t, unsigned s1, unsigned ctrlReg, memOpT memOp)
{

  /*  printf("t: %p\n", (void *)t);
  printf("s1: %d\n", s1);
  printf("ctrlReg: 0x%08x\n", ctrlReg);
  printf("memOp: %d\n", memOp);*/

  /*printf("pointer: 0x%x\n", *(t));*/
  system->memQueueCurrent->pointer = t;
  /*printf("value: 0x%x\n", s1);*/
  system->memQueueCurrent->value = s1;
  system->memQueueCurrent->ctrlReg = ctrlReg;
  system->memQueueCurrent->memOp = memOp;

  system->memQueueCurrent->next = (struct memReqT *)calloc(sizeof(struct memReqT), 1);
  system->memQueueCurrent = system->memQueueCurrent->next;


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
