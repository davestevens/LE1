#include <stdio.h>

int output[4] = {0};
extern void file1(void);
extern void file2(void);
extern void file3(void);

static void function(void) {
  output[0] = 0xdeadbeef;
  return;
}

int main(void) {
  int i;
  switch((getCPUID(NULL) >> 8) & 0xff) {
  case 0:
    function();
    break;
  case 1:
    file1();
    break;
  case 2:
    file2();
    break;
  case 3:
    file3();
    break;
  default:
    break;
  }
  /*  for(i=0;i<4;i++) {
    printf("0x%08x\n", output[i]);
    }*/
  return 0;
}
