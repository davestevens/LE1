#include <stdio.h>
#include "staticfuncs.h"

void foo(int tid) {
  j[0] = 4;
  return;
}
void bar(int tid) {
  j[1] = 8;
  return;
}

int main(void) {
  const int cpuid = getCPUID(NULL) >> 8;
  (cpuid ? runThread : initialiseAndRunThread)(cpuid);
  (cpuid ? foo : bar)(cpuid);
  return i[0];
}
