int NUM;
int a[100][100];

void init()
{
  int i, j;
  
  for(i=0; i<NUM; i++)
    for(j=0; j<NUM; j++)
      {
        if((i+j)&7)
	  a[i][j] = i+j;
        else
          a[i][j] = 0;
      }	  
}

int accum()
{
  int i, j;
  int temp = 0;
  
  for(i=0; i<NUM; i++)
    for(j=0; j<NUM; j++)
      if((i+j)&7)
	temp += i+j;
  
  return temp;
}

int accum_or()
{
  int i, j;
  int temp = 0;
  
  for(i=0; i<NUM; i++)
    for(j=0; j<NUM; j++)
      if((i+j)&7 || i>(NUM/2) || j>(NUM/2) )
      {
	temp += i+j;
      }
  
  return temp;
}

int accum_and()
{
  int i, j;
  int temp = 0;
  
  for(i=0; i<NUM; i++)
    for(j=0; j<NUM; j++)
      if((i+j)&7 && i>(NUM/2) && j>(NUM/2) )
	temp += i+j;
  
  return temp;
}

/* The funny_calls test for parameter passing quirks...what goes on the
   memory stack and what goes in the registers. */

double funny_call1(int a, float b, double c, int d, float e, double f, int g){
  return (double)(a+b+c+d+e+f+g);
}

double funny_call2(int a, float b, double c, int d, float e){
  return (double)(a+b+c+d+e);
 }

int main()
{
  int i, j;
  
  NUM = 20;  
  init();
  
  for(i=0; i<NUM; i++)
    for(j=0; j<NUM; j++)
      printf("%ld\n", a[i][j]);
  
  printf("%ld\n", accum());
  printf("%ld\n", accum_or());
  printf("%ld\n", accum_and());
  printf("%lf\n", funny_call1(1, 1.0, 1.0, 2, 2.0, 2.0, 3));
  printf("%lf\n", funny_call2(4, 4.0, 4.0, 5, 5.0));

  return 0;
}
