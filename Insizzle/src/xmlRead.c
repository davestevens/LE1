#include "xmlRead.h"


int readConf(char *filename)
{
  systemConfig *SYS = NULL;
  contextConfig *CNT = NULL;
  hyperContextConfig *HCNT = NULL;
  clusterTemplateConfig *CLUT = NULL;

  xmlTextReaderPtr reader;
  int ret;

  xmlReturn xmlR;
  unsigned currentSystem = -1;
  unsigned currentContext = 0;
  unsigned currentClusterTemplate = 0;
  unsigned currentHyperContext = 0;
  int templ, inst;

#ifndef LIBXML_READER_ENABLED
    printf("XML support not enabled\n");
      return -1;
#endif


  reader = xmlReaderForFile(filename, NULL, 0);
  if(reader == NULL)
    {
      printf("Could not open file (%s)\n", filename);
      return -1;
    }
  else
    {
      ret = xmlTextReaderRead(reader);
      while(ret == 1)
	{
	  processNode(reader, &xmlR);
	  if(xmlR.type == 1)
	    {
	      if(!strcmp(xmlR.name, "systems"))
		{
		  ret = xmlTextReaderRead(reader);
		  processNode(reader, &xmlR);
		  GALAXY_CONFIG = 0;
		  GALAXY_CONFIG |= atoi(xmlR.value);

		  SYSTEM = (systemConfig *)malloc(sizeof(systemConfig) * (GALAXY_CONFIG & 0xff));
		  if(SYSTEM == NULL)
		    return -1;


		}
	      else if(!strcmp(xmlR.name, "system"))
		{
		  /* need to make sure the number of these is less than the number of systems */
		  currentSystem++;
		  if(currentSystem >= (GALAXY_CONFIG & 0xff))
		    {
		      printf("xml file contains more system definitions than are specified\n");
		      return -1;
		    }
		  else
		    {
		      /*printf("currentSystem: %d\n", currentSystem);*/
		      SYS = (systemConfig *)((unsigned)SYSTEM + (currentSystem * sizeof(systemConfig)));
		      SYS->SYSTEM_CONFIG = 0;
		      SYS->PERIPH_WRAP_CONFIG = 0;
		      SYS->DRAM_SHARED_CONFIG = 0;
		      SYS->DRAM_SHARED_CTRL = 0;

		  currentContext = -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "contexts"))
		{
		  /*printf("contexts\n");*/
		  if(SYS != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      SYS->SYSTEM_CONFIG |= atoi(xmlR.value);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", SYS->SYSTEM_CONFIG);*/

		      SYS->CONTEXT = (contextConfig *)malloc(sizeof(contextConfig) * (SYS->SYSTEM_CONFIG & 0xff));
		      if(SYS->CONTEXT == NULL)
			return -1;

		    }
		  else
		    {
		      printf("trying to define a context when not in a system\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "SCALARSYS_PRESENT"))
		{
		  /*printf("SCALARSYS_PRESENT\n");*/
		  if(SYS != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      SYS->SYSTEM_CONFIG |= (atoi(xmlR.value) << 8);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", SYS->SYSTEM_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define SCALARSYS_PRESENT when not in a system\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "PERIPH_PRESENT"))
		{
		  /*printf("PERIPH_PRESENT\n");*/
		  if(SYS != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      SYS->SYSTEM_CONFIG |= (atoi(xmlR.value) << 10);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", SYS->SYSTEM_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define PERIPH_PRESENT when not in a system\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "DRAM_BLK_SIZE"))
		{
		  /*printf("DRAM_BLK_SIZE\n");*/
		  if(SYS != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      SYS->DRAM_SHARED_CONFIG |= atoi(xmlR.value);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", SYS->DRAM_SHARED_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define DRAM_BLK_SIZE when not in a system\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "DRAM_SIZE"))
		{
		  /*printf("DRAM_SIZE\n");*/
		  if(SYS != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      SYS->DRAM_SHARED_CONFIG |= (atoi(xmlR.value) << 8);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", SYS->DRAM_SHARED_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define DRAM_SIZE when not in a system\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "DRAM_BANKS"))
		{
		  /*printf("DRAM_BANKS\n");*/
		  if(SYS != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      SYS->DRAM_SHARED_CONFIG |= (atoi(xmlR.value) << 24);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", SYS->DRAM_SHARED_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define DRAM_BANKS when not in a system\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "DARCH"))
		{
		  /*printf("DARCH\n");*/
		  if(SYS != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);

		      if(!strcmp(xmlR.value, "DRAM_SHARED"))
			SYS->SYSTEM_CONFIG |= (0 << 11);
		      else
			{
			  printf("unknown DARCH: %s\n", xmlR.value);
			  return -1;
			}

		      /*printf("\t%s\n", xmlR.value);
			printf("\t0x%x\n", SYS->SYSTEM_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define DARCH when not in a system\n");
		      return -1;
		    }
		}

	      else if(!strcmp(xmlR.name, "context"))
		{
		  /* need to make sure the number of these is less than the number of systems */
		  currentContext++;
		  if(currentContext >= (SYS->SYSTEM_CONFIG & 0xff))
		    {
		      printf("xml file contains more context definitions than are specified for this system (%d)\n", currentSystem);
		      return -1;
		    }
		  else
		    {
		      /*printf("currentContext: %d\n", currentContext);*/
		      CNT = (contextConfig *)((unsigned)SYS->CONTEXT + (currentContext * sizeof(contextConfig)));

		      CNT->CONTEXT_CONFIG = 0;
		      CNT->CONTEXT_CTRL_REG = 0;
		      CNT->IFE_SIMPLE_IRAM_PRIV_CONFIG = 0;

		      currentClusterTemplate = -1;
		      currentHyperContext = -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "ISA_PRSPCTV"))
		{
		  /*printf("ISA_PRSPCTV\n");*/
		  if(CNT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);

		      if(!strcmp(xmlR.value, "VT32PP"))
			CNT->CONTEXT_CONFIG |= 0;
		      else if(!strcmp(xmlR.value, "VT64PP"))
			CNT->CONTEXT_CONFIG |= 1;
		      else if(!strcmp(xmlR.value, "VT32EPIC"))
			CNT->CONTEXT_CONFIG |= 2;
		      else if(!strcmp(xmlR.value, "VT64EPIC"))
			CNT->CONTEXT_CONFIG |= 3;
		      else
			{
			  printf("unknown ISA_PRSPCTV: %s\n", xmlR.value);
			  return -1;
			}

		      /*printf("\t%s\n", xmlR.value);
			printf("\t0x%x\n", CNT->CONTEXT_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define ISA_PRSPCTV when not in a context\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "HYPERCONTEXTS"))
		{
		  /*printf("HYPERCONTEXTS\n");*/
		  if(CNT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CNT->CONTEXT_CONFIG |= (atoi(xmlR.value) << 4);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CNT->CONTEXT_CONFIG);*/

		      /* allocate memory for the hypercontexts */
		      CNT->HCONTEXT = (hyperContextConfig *)malloc(sizeof(hyperContextConfig) *((CNT->CONTEXT_CONFIG >> 4) & 0xf));
		      if(CNT->HCONTEXT == NULL)
			return -1;
		    }
		  else
		    {
		      printf("trying to define HYPERCONTEXTS when not in a context\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "CLUST_TEMPL"))
		{
		  /*printf("CLUST_TEMPL\n");*/
		  if(CNT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CNT->CONTEXT_CONFIG |= (atoi(xmlR.value) << 8);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CNT->CONTEXT_CONFIG);*/

		      /* allocate memory for the cluster templates */
		      CNT->CLUSTER_TEMPL = (clusterTemplateConfig *)malloc(sizeof(clusterTemplateConfig) * ((CNT->CONTEXT_CONFIG >> 8) & 0xf));
		      if(CNT->CLUSTER_TEMPL == NULL)
			return -1;
		    }
		  else
		    {
		      printf("trying to define CLUST_TEMPL when not in a context\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "ISSUE_WIDTH_MAX"))
		{
		  /*printf("ISSUE_WIDTH_MAX\n");*/
		  if(CNT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CNT->CONTEXT_CONFIG |= (atoi(xmlR.value) << 12);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CNT->CONTEXT_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define ISSUE_WIDTH_MAX when not in a context\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "IARCH"))
		{
		  /*printf("IARCH\n");*/
		  if(CNT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);

		      if(!strcmp(xmlR.value, "IFE_SIMPLE_IRAM_PRIV"))
			CNT->CONTEXT_CONFIG |= (0 << 20);
		      else
			{
			  printf("unknown IARCH: %s\n", xmlR.value);
			  return -1;
			}

		      /*printf("\t%s\n", xmlR.value);
			printf("\t0x%x\n", CNT->CONTEXT_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define IARCH when not in a context\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "IFETCH_WIDTH"))
		{
		  /*printf("IFETCH_WIDTH\n");*/
		  if(CNT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CNT->IFE_SIMPLE_IRAM_PRIV_CONFIG |= atoi(xmlR.value);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CNT->IFE_SIMPLE_IRAM_PRIV_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define IFETCH_WIDTH when not in a context\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "IRAM_SIZE"))
		{
		  /*printf("IRAM_SIZE\n");*/
		  if(CNT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CNT->IFE_SIMPLE_IRAM_PRIV_CONFIG |= (atoi(xmlR.value) << 8);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CNT->IFE_SIMPLE_IRAM_PRIV_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define IRAM_SIZE when not in a context\n");
		      return -1;
		    }
		}

	      else if(!strcmp(xmlR.name, "clusterTemplate"))
		{
		  /* need to make sure the number of these is less than the number of systems */
		  currentClusterTemplate++;
		  if(currentClusterTemplate >= ((CNT->CONTEXT_CONFIG >> 8) & 0xf))
		    {
		      printf("xml file contains more clusterTemplate definitions than are specified for this context (%d)\n", currentContext);
		      return -1;
		    }
		  else
		    {
		      /*printf("currentClusterTemplate: %d\n", currentClusterTemplate);*/
		      CLUT = (clusterTemplateConfig *)((unsigned)CNT->CLUSTER_TEMPL + (currentClusterTemplate * sizeof(clusterTemplateConfig)));

		      CLUT->CLUST_TEMPL_CONFIG = 0;
		      CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG = 0;
		      CLUT->CLUST_TEMPL_SCORE_CONFIG = 0;
		    }
		}
	      else if(!strcmp(xmlR.name, "SCORE_PRESENT"))
		{
		  /*printf("SCORE_PRESENT\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_CONFIG |= atoi(xmlR.value);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define SCORE_PRESENT when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "VCORE_PRESENT"))
		{
		  /*printf("VCORE_PRESENT\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_CONFIG |= (atoi(xmlR.value) << 1);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define VCORE_PRESENT when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "FPCORE_PRESENT"))
		{
		  /*printf("FPCORE_PRESENT\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_CONFIG |= (atoi(xmlR.value) << 2);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define FPCORE_PRESENT when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "CCORE_PRESENT"))
		{
		  /*printf("CCORE_PRESENT\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_CONFIG |= (atoi(xmlR.value) << 3);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define CCORE_PRESENT when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "INSTANCES"))
		{
		  /*printf("INSTANCES\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_CONFIG |= (atoi(xmlR.value) << 17);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define INSTANCES when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "INSTANTIATE"))
		{
		  /*printf("INSTANTIATE\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_CONFIG |= (atoi(xmlR.value) << 16);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define INSTANTIATE when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "ISSUE_WIDTH"))
		{
		  /*printf("ISSUE_WIDTH\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_CONFIG |= (atoi(xmlR.value) << 8);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define ISSUE_WIDTH when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "S_GPR_FILE_SIZE"))
		{
		  /*printf("S_GPR_FILE_SIZE\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG |= atoi(xmlR.value);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define S_GPR_FILE_SIZE when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "S_FPR_FILE_SIZE"))
		{
		  /*printf("S_FPR_FILE_SIZE\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG |= (atoi(xmlR.value) << 8);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define S_FPR_FILE_SIZE when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "S_VR_FILE_SIZE"))
		{
		  /*printf("S_VR_FILE_SIZE\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG |= (atoi(xmlR.value) << 16);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define S_VR_FILE_SIZE when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "S_PR_FILE_SIZE"))
		{
		  /*printf("S_PR_FILE_SIZE\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG |= (atoi(xmlR.value) << 24);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_STATIC_REGFILE_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define S_PR_FILE_SIZE when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "IALUS"))
		{
		  /*printf("IALUS\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_SCORE_CONFIG |= atoi(xmlR.value);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_SCORE_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define IALUS when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "IMULTS"))
		{
		  /*printf("IMULTS\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_SCORE_CONFIG |= (atoi(xmlR.value) << 8);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_SCORE_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define IMULTS when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "LSU_CHANNELS"))
		{
		  /*printf("LSU_CHANNELS\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_SCORE_CONFIG |= (atoi(xmlR.value) << 16);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_SCORE_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define LSU_CHANNELS when not in a clusterTemplate\n");
		      return -1;
		    }
		}
	      else if(!strcmp(xmlR.name, "BRUS"))
		{
		  /*printf("BRUS\n");*/
		  if(CLUT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      CLUT->CLUST_TEMPL_SCORE_CONFIG |= (atoi(xmlR.value) << 24);
		      /*printf("\t%d\n", atoi(xmlR.value));
			printf("\t0x%x\n", CLUT->CLUST_TEMPL_SCORE_CONFIG);*/
		    }
		  else
		    {
		      printf("trying to define BRUS when not in a clusterTemplate\n");
		      return -1;
		    }
		}

	      else if(!strcmp(xmlR.name, "hypercontext"))
		{
		  /* need to make sure the number of these is less than the number of systems */
		  currentHyperContext++;
		  if(currentHyperContext >= ((CNT->CONTEXT_CONFIG >> 4) & 0xf))
		    {
		      printf("xml file contains more hyperContext definitions than are specified for this context (%d)\n", currentContext);
		      return -1;
		    }
		  else
		    {
		      /*printf("currentHyperContext: %d\n", currentHyperContext);*/
		      HCNT = (hyperContextConfig *)((unsigned)CNT->HCONTEXT + (currentHyperContext * sizeof(hyperContextConfig)));

		      HCNT->HCONTEXT_CONFIG = 0;
		      HCNT->HCONTEXT_CLUST_TEMPL0_1.hi = 0;
		      HCNT->HCONTEXT_CLUST_TEMPL0_1.lo = 0;

		      HCNT->HCONTEXT_CLUST_TEMPL_INST0_1.hi = 0;
		      HCNT->HCONTEXT_CLUST_TEMPL_INST0_1.lo = 0;
		    }
		}
	      else if(!strcmp(xmlR.name, "cluster"))
		{
		  /*printf("cluster\n");*/
		  if(HCNT != NULL)
		    {
		      ret = xmlTextReaderRead(reader);
		      processNode(reader, &xmlR);
		      sscanf(xmlR.value, "%d_%d", &templ, &inst);
		      /*printf("\t\ttemple: %d\n", templ);
			printf("\t\tint: %d\n", inst);*/

		      if((HCNT->HCONTEXT_CONFIG & 0xf) > 8)
			{
			  HCNT->HCONTEXT_CLUST_TEMPL0_1.hi |= (templ << (4 * (HCNT->HCONTEXT_CONFIG & 0xf)));
			  HCNT->HCONTEXT_CLUST_TEMPL_INST0_1.hi |= (inst << (4 * (HCNT->HCONTEXT_CONFIG & 0xf)));
			}
		      else
			{
			  HCNT->HCONTEXT_CLUST_TEMPL0_1.lo |= (templ << (4 * (HCNT->HCONTEXT_CONFIG & 0xf)));
			  HCNT->HCONTEXT_CLUST_TEMPL_INST0_1.lo |= (inst << (4 * (HCNT->HCONTEXT_CONFIG & 0xf)));
			}


		      /*printf("\t%s\n", xmlR.value);
		      printf("\t0x%x\n", HCNT->HCONTEXT_CONFIG);
		      printf("\t0x%x\n", HCNT->HCONTEXT_CLUST_TEMPL0_1.lo);
		      printf("\t0x%x\n", HCNT->HCONTEXT_CLUST_TEMPL0_1.hi);
		      printf("\t0x%x\n", HCNT->HCONTEXT_CLUST_TEMPL_INST0_1.lo);
		      printf("\t0x%x\n", HCNT->HCONTEXT_CLUST_TEMPL_INST0_1.hi);*/


		      HCNT->HCONTEXT_CONFIG += 1;
		    }
		  else
		    {
		      printf("trying to define cluster when not in a hyperContext\n");
		      return -1;
		    }
		}

	    }
	  ret = xmlTextReaderRead(reader);
	}
      xmlFreeTextReader(reader);
      if(ret != 0)
	{
	  printf("unable to parse file (%s)\n", filename);
	  return -1;
	}
    }


  /* this is simply setting up the things

  for(i=0;i<(GALAXY_CONFIG & 0xff);i++)
    {
      for(j=0;j<(SYS->SYSTEM_CONFIG & 0xff);j++)
	{
	  for(k=0;k<((CNT->CONTEXT_CONFIG >> 8) & 0xf);k++)
	    {
	    }

	  for(k=0;k<((CNT->CONTEXT_CONFIG >> 4) & 0xf);k++)
	    {
	    }

	}
	}*/
  return 0;
}

void processNode(xmlTextReaderPtr reader, xmlReturn *xmlR)
{
  const xmlChar *name, *value;

  name = xmlTextReaderConstName(reader);
  if (name == NULL)
    name = BAD_CAST "--";

  value = xmlTextReaderConstValue(reader);

  /*  printf("WHUT %d %d %s %d %d",
	 xmlTextReaderDepth(reader),
	 xmlTextReaderNodeType(reader),
	 name,
	 xmlTextReaderIsEmptyElement(reader),
	 xmlTextReaderHasValue(reader));
  */

  xmlR->type = xmlTextReaderNodeType(reader);
  xmlR->name = (char *)name;
  xmlR->value = (char *)value;
}

