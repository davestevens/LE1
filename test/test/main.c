#include <stdio.h>

#ifndef SIZE
#define SIZE 2
#endif

int a[SIZE];

int main(void) {
  int i;
  for(i=0;i<SIZE;i++) {
    a[i] = i;
  }
  return 0;
}
