#include <stdio.h>
#include "functions.h"

/* split array[] over active threads */

/* multiplication */
void func1(unsigned id) {
  int i;
  unsigned result = 0;
  for(i=0;i<(NUM_THREADS * 2);i++) {
    if(((i - id) % NUM_THREADS) == 0) {
      if((array[i+NUM_THREADS] == 0) && (array[i+(NUM_THREADS * 2)] == 0)) {
	result = 0xdeadbeef;
      }
      else if(array[i+NUM_THREADS] == 0) {
	result = array[i+(NUM_THREADS * 2)];
      }
      else if(array[i+(NUM_THREADS * 2)] == 0) {
	result = array[i+NUM_THREADS];
      }
      else {
	result = array[i+NUM_THREADS] * array[i+(NUM_THREADS * 2)];
      }
      array[i] = result;
    }
  }
  for(i=(NUM_THREADS * 2);i<(DATA_SIZE * NUM_THREADS);i++) {
    if(((i - id) % NUM_THREADS) == 0) {
      if((array[i-NUM_THREADS] == 0) && (array[i-(NUM_THREADS * 2)] == 0)) {
	result = 0xdeadbeef;
      }
      else if(array[i-NUM_THREADS] == 0) {
	result = array[i-(NUM_THREADS * 2)];
      }
      else if(array[i-(NUM_THREADS * 2)] == 0) {
	result = array[i-NUM_THREADS];
      }
      else {
	result = array[i-NUM_THREADS] * array[i-(NUM_THREADS * 2)];
      }
      array[i] = result;
    }
  }
  return;
}

/* division */
void func2(unsigned id) {
  int i;
  unsigned result = 0;
  for(i=0;i<(NUM_THREADS * 2);i++) {
    if(((i - id) % NUM_THREADS) == 0) {
      if((array[i+NUM_THREADS] == 0) && (array[i+(NUM_THREADS * 2)] == 0)) {
	result = 0xdeadbeef;
      }
      else if(array[i+NUM_THREADS] == 0) {
	result = array[i+(NUM_THREADS * 2)];
      }
      else if(array[i+(NUM_THREADS * 2)] == 0) {
	result = array[i+NUM_THREADS];
      }
      else {
	result = array[i+NUM_THREADS] / array[i+(NUM_THREADS * 2)];
      }
      array[i] = result;
    }
  }
  for(i=(NUM_THREADS * 2);i<(DATA_SIZE * NUM_THREADS);i++) {
    if(((i - id) % NUM_THREADS) == 0) {
      if((array[i-NUM_THREADS] == 0) && (array[i-(NUM_THREADS * 2)] == 0)) {
	result = 0xdeadbeef;
      }
      else if(array[i-NUM_THREADS] == 0) {
	result = array[i-(NUM_THREADS * 2)];
      }
      else if(array[i-(NUM_THREADS * 2)] == 0) {
	result = array[i-NUM_THREADS];
      }
      else {
	result = array[i-NUM_THREADS] / array[i-(NUM_THREADS * 2)];
      }
      array[i] = result;
    }
  }
  return;
}

/* addition */
void func3(unsigned id) {
  int i;
  unsigned result = 0;
  for(i=0;i<(NUM_THREADS * 2);i++) {
    if(((i - id) % NUM_THREADS) == 0) {
      result = array[i+NUM_THREADS] + array[i+(NUM_THREADS * 2)];
      array[i] = result;
    }
  }
  for(i=(NUM_THREADS * 2);i<(DATA_SIZE * NUM_THREADS);i++) {
    if(((i - id) % NUM_THREADS) == 0) {
      result = array[i-NUM_THREADS] + array[i-(NUM_THREADS * 2)];
      array[i] = result;
    }
  }
  return;
}

/* subtraction */
void func4(unsigned id) {
  int i;
  unsigned result = 0;
  for(i=0;i<(NUM_THREADS * 2);i++) {
    if(((i - id) % NUM_THREADS) == 0) {
      result = array[i+NUM_THREADS] - array[i+(NUM_THREADS * 2)];
      array[i] = result;
    }
  }
  for(i=(NUM_THREADS * 2);i<(DATA_SIZE * NUM_THREADS);i++) {
    if(((i - id) % NUM_THREADS) == 0) {
      result = array[i-NUM_THREADS] - array[i-(NUM_THREADS * 2)];
      array[i] = result;
    }
  }
  return;
}
