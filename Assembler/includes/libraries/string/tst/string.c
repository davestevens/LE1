#include <stdio.h>
#include <string.h>
#include "string.h"

char in[16] = "hello, world!\n";
char outGCC[16];
char outMY[16];

char outGCC2[16];
char outMY2[16];

char head[16] = "h";
char head1[16] = "?hel";
char tail[16] = "world!";

char rah = 'l';

int main(void)
{
  printf("strspn: %d\n", (int)strcspn(head1, head));
  printf("strspn: %d\n", (int)strcspn(head, head1));
  printf("strspn: %d\n", (int)strcspn(tail, head));
  printf("strspn: %d\n", (int)strcspn(head, head));


  printf("strspn: %d\n", (int)my_strcspn(head1, head));
  printf("strspn: %d\n", (int)my_strcspn(head, head1));
  printf("strspn: %d\n", (int)my_strcspn(tail, head));
  printf("strspn: %d\n", (int)my_strcspn(head, head));

  return 0;
}
