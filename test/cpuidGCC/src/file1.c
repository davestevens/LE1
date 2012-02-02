#include <stdio.h>

extern int output[4];

static void function(void) {
  output[1] = 0xcafef00d;
  return;
}

void file1(void) {
  function();
  return;
}
