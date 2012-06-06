#include <stdio.h>
#include <stdlib.h>

#ifdef MAIN_ARGS
int main (int argc, char *argv[])
#else
int main_test (int, char **);

int main(void) {
  int _argc = 2;
  char *_argv[2] = {
    "fact2",
    "10"
  };
  return main_test(_argc, _argv);
}

int main_test (int argc, char *argv[])
#endif
{
  int i,s,n;

  if (argc < 2) {
    printf("Usage: fact2 <n>\n");
    exit(1);
  }
  n = atoi(argv[1]);

  for (i=1, s=1 ; i <= n ; i++) s *= i;
  printf("fact %d = %d\n", (i-1), s);
  exit(0);
}

  
