#include <stdio.h>

extern int output[4];

static void function(void) {
  output[2] = 0xffffffff;
  return;
}

void file2(void) {
  function();
  return;
}
