#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#ifndef NUM_THREADS
#define NUM_THREADS 4
#endif

pthread_t thread[NUM_THREADS] = {0};

extern int threadedMain(void);

int _asm1(int id, int *x) {
  x = NULL;
  for(id=0;id<NUM_THREADS;id++) {
    if(thread[id] == pthread_self()) {
      return (id << 8);
    }
  }
  return -1;
}

void *initThread(void *args) {
  threadedMain();
  return (void *)args;
}

/*** ***/
extern int output[4];

int main(void) {
  int i;
  printf("creating %d posix threads\n", NUM_THREADS);
  for(i=0;i<NUM_THREADS;i++) {
    pthread_create(&thread[i], NULL, initThread, NULL);
  }
  for(i=0;i<NUM_THREADS;i++) {
    pthread_join(thread[i], NULL);
  }
  printf("All done\n");

  /*** Print out my output array ***/
  for(i=0;i<NUM_THREADS;i++) {
    printf("0x%08x\n", output[i]);
  }
  return 0;
}
