#include <stdio.h>
#include "functions.h"

volatile int barrier[NUM_THREADS] = {0x0};
int iterations = 4;

void controller(unsigned id) {
  int i,j;
  /*printf("\tcontroller(%d)\n", id);*/
  for(i=0;i<NUM_THREADS;i++) {
    barrier[i] = 0; /* make sure all are zero */
  }
  /* initialise data */
  for(i=0;i<(DATA_SIZE * NUM_THREADS);i++) {
    array[i] = i+1;
  }

  for(i=0;i<iterations;i++) {
    /* setup function pointers */
#if 1
    if((i % 4) == 0) {
      fp[0] = &func1;
      fp[1] = &func2;
      fp[2] = &func3;
      fp[3] = &func4;
    }
    else if(((i-1) % 4) == 0) {
      fp[0] = &func2;
      fp[1] = &func3;
      fp[2] = &func4;
      fp[3] = &func1;
    }
    else if(((i-2) % 4) == 0) {
      fp[0] = &func3;
      fp[1] = &func4;
      fp[2] = &func1;
      fp[3] = &func2;
    }
    else {
      fp[0] = &func4;
      fp[1] = &func1;
      fp[2] = &func2;
      fp[3] = &func3;
    }
#else
    fp[0] = &func1;
    fp[1] = &func2;
    fp[2] = &func3;
    fp[3] = &func4;
#endif
    /*printf("\t%d releasing barrier\n", id);*/
    for(j=0;j<NUM_THREADS;j++) {
      barrier[j] = 1; /* release barrier */
    }
    barrier[id] = 0; /* set barrier */
    (*fp[id])(id);
    /*func1(id);*/
    /* wait for other threads */
    /*printf("\t%d waiting for threads to finish\n");*/
    for(j=0;j<NUM_THREADS;j++) {
      while(barrier[j] == 1) { }
    }
  }
  /*printf("\t/controller(%d)\n", id);*/
  return;
}

void worker(unsigned id) {
  int i;
  /*printf("\tworker(%d)\n", id);*/
  for(i=0;i<iterations;i++) {
    /*printf("\t%d waiting for sync\n", id);*/
    while(barrier[id] == 0) { /* Wait for sync */ }
    (*fp[id])(id);
    /*func1(id);*/
    barrier[id] = 0; /* set barrier */
  }
  /*printf("\t/worker(%d)\n", id);*/
  return;
}

int main(void) {
  unsigned cpuid = ((getCPUID(NULL) >> 8) & 0xff);
  /*printf("start of main from %d\n", ((getCPUID(NULL) >> 8) & 0xff));*/
  switch(cpuid) {
  case 0:
    controller(cpuid);
    break;
  default:
    worker(cpuid);
    break;
  }
  /*printf("end of main from %d\n", ((getCPUID(NULL) >> 8) & 0xff));*/
  return 0;
}
