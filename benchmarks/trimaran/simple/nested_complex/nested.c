#include <stdio.h>
#include <stdlib.h>

#define MAX 100

/* Assume that global data is initialized to 0. */
int NUM;
int a[MAX][MAX];
float b[MAX][MAX];
double c[MAX][MAX];

int check_a()
{
    int check = 0;
    int i,j;
    
    for ( i= 0 ; i < MAX; i++ )
	{ 
	    for ( j= 0 ; j < MAX; j++ )
		{
		    check += a[i][j];
		}
	}
    return check;
}

float check_b()
{
    float check = 0.0;
    int i,j;
    
    for ( i= 0 ; i < MAX; i++ )
	{ 
	    for ( j= 0 ; j < MAX; j++ )
		{
		    check += b[i][j];
		}
	}
    return check;
}

double check_c()
{
    double check = 0.0;
    int i,j;
    
    for ( i= 0 ; i < MAX; i++ )
	{ 
	    for ( j= 0 ; j < MAX; j++ )
		{
		    check += c[i][j];
		}
	}
    return check;
}
    

/* Tests basic predication within a loop body,
   tests casting from int to float and int to double,
   tests multiple modulo scheduled loops in a function,
   tests uses of both floats and doubles,
   tests accumulator j,
   tests short accumulator n; */
void init()
{
  int i, j;
  short m;
  char n;
  
  for(i=0; i<NUM; i++)
    for(j=0; j<NUM; j++)
      if((i+j)&7)
	a[i][j] = i+j;

  for(i=0; i<NUM; i++)
    for(j=0; j<NUM; j++)
      if((i+j)&0xF)
	b[i][j] = (float)i+j;

  for(m=0; m<NUM; m++)
    for(n=0; n<NUM; n++)
      if((m+n)&0xE)
	c[m][n] = (double)m+n;

  return;
}

/* Tests basic predication in a loop body,
   tests loop live in (mask),
   tests loop live out (temp),
   tests accumulation. */
int accum_mask( int bound, int incr, int mask )
{
  int i, j;
  int temp = 0;
  
  for(i=0; i<NUM; i++)
    for(j=0; j<bound; j = j + incr)
      if((i+j)&mask)
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
	temp += i+j;
  
  return temp;
}

int accum_and()
{
  int i, j;
  int temp = 0;
  
  for(i=0; i<NUM; i++)
    for(j=0; j<NUM; j++)
      if((i+j)&7 && i>(NUM/10) && j>(NUM/10) )
	temp += i+j;
  
  return temp;
}

float init_flt(float val)
{
  int i, j;
  float last_val = 0.0;
  float accum = 0.0;

  for(i=0; i<NUM/2; i++)
    {
      for(j=0; j<NUM/2; j++)
	{
	  b[i][j] = (val + last_val)/1.1;
	  accum += (val + last_val)/1.1;
	  last_val = val;
	  val = val * 1.1;
	}
      printf("init_flt: [%d], v %lf, lv %lf, a %lf\n", i, val, last_val, accum);
    }

  return accum;
}

double init_dbl(double val)
{
  int i, j;
  double last_val = 0.0;
  double accum = 0.0;

  for(i=0; i<NUM/2; i++)
    {
      for(j=0; j<NUM/2; j++)
	{
	  c[i][j] = (val + last_val)/1.1;
	  accum += (val + last_val)/1.1;
	  last_val = val;
	  val = val * 1.1;
	}
    }

  return accum;
}

double init_mixfltdbl(double val)
{
  int i, j;
  float last_val = 0.0;
  float accum = 0.0;

  for(i=0; i<NUM/2; i++)
    for(j=0; j<NUM/2; j++)
      {
	c[i][j] = (val + last_val)/1.1;
	accum += (val + last_val)/1.1;
	last_val = (float)val;
	val = val * 1.1;
      }

  return ((double)accum);
}

/* break_after and break_before tests to ensure
   that the proper value of k is live out. */
int break_after(int stop)
{
  int i, k = 0;

  for( i = 6; i < 1000; i++ )
    {
      k++;
      if( i == stop )
	break;
    }
  
  return k;
}

int break_before(int stop)
{
  int i, k = 0;

  for( i = 6; i < 1000; i++ )
    {
      if( i == stop )
	break;
      k++;
    }
  
  return k;
}

int hand_no_unroll()
{
  int i = 0, j = 0;
  int bound = 100000;

  if( (((i+1)*3+1)*2) > bound )
    goto end;

 top:
  
  i += ((i&3) + 1);
  if( i&7 )
    j += i;

  if( (((i+1)*3+1)*2) <= bound )
    goto top;

 end:
  
  return j;
}

int hand_unroll()
{
  int i = 0, j = 0;
  int bound = 100000;

  if( (((i+1)*3+1)*2) > bound )
    goto end;

 top:
  
  i += ((i&3) + 1);
  if( i&7 )
    j += i;

  if( (((i+1)*3+1)*2) > bound )
    goto end;

  i += ((i&3) + 1);
  if( i&7 )
    j += i;

  if( (((i+1)*3+1)*2) <= bound )
    goto top;

 end:
  
  return j;
}

/* This tests the live in fix up code.  Related is need
   for extra register stages for rotating registers when
   a variable is live in. In this case no fix up code
   or extra stages are necessary since there
   is no reaching def to g. This function also models a
   complete write of g, which would hence not require
   the complete write move of g(stage 1) into
   g(stage 0) when using rotating registers, if that
   were implemented. */
int var_not_live_in( int bound )
{
  int g;
  int i;
  int total = 10;

  for( i = 0; i < bound; i++ )
    {
      if( (i&7) == 0 )
	g = 4;
      else
	{
	  g += i;
	  total += g*7;
	}
    }
  
  return (g + total);
}

int var_not_live_in2( int bound )
{
  int g;
  int i;

  for( i = 0; i < bound; i++ )
    {
      if( (i&7) == 0 )
	g = 4;
      else
	g += i;
    }
  
  return (g);
}

int check_d(int *D)
{
  int check = 0;
  int i;

  for( i = 0; i < (2*MAX); i++ )
    check += D[i];

  return check;
}

void omega()
{
  int d[(2*MAX)];
  int i;

  /* Initialize the array. */
  for( i = 0; i < (2*MAX); i++ )
    d[i] = i;

  printf("(omega_init)       %ld\n", check_d(d));
  
  /* Dependence on a higher index, thus the read for this
     iteration must occur before the write of a future iteration,
     which is always guaranteed in the software pipelining model. 
     However, check the effective distance between the two iterations;
     unless omega test is used, the compiler may serialize the iters. */

  for( i = 2; i < (2*MAX); i++ )
    d[i-2] = d[i];

  printf("(omega_check1)     %ld\n", check_d(d));

  /* Dependence on a lower index, thus the read for this
     iteration must occur after the write of a previous
     iteration. In this case, the dependence distance
     is 2 iterations.  When examining the performance
     of this loop, check the effective distance; it is 
     likely 1 iteration (more conservative than it has to be). */
  
  for( i = 2; i < (2*MAX); i++ )
    d[i] = d[i-2];

  printf("(omega_check2)     %ld\n", check_d(d));

  return;
}

void omega_empty()
{

}

void (*OMEGA[2])() = { omega, omega_empty }; 
int OMEGA_IDX = 0;

#ifdef MAIN_ARGS
int main (int argc, char *argv[])
#else
int main_test (int, char **);

int main(void) {
  int _argc = 2;
  char *_argv[2] = {
    "nested_complex",
    "1"
  };
  return main_test(_argc, _argv);
}

int main_test (int argc, char *argv[])
#endif
{
  int i, j, c;
 
  if (argc != 2)
    {
      fprintf(stdout,"Invalid number of args %d.\n", argc);
      exit(-1);
    }

  c = atoi( argv[1] );
 
  if( c )
    { 
 
      NUM = 20;  

      init();
  
#if 0
      for(i=0; i<NUM; i++)
      for(j=0; j<NUM; j++)
        printf("%ld\n", a[i][j]);
#endif

      printf("<check a>          %ld\n", check_a());
      printf("<check b>          %lf\n", check_b());
      printf("<check c>          %lf\n", check_c());
      printf("(accum_mask)       %ld\n", accum_mask(NUM,1,7));
      printf("(accum_or)         %ld\n", accum_or());
      printf("(accum_and)        %ld\n", accum_and());
      printf("(init_flt)         %lf\n", init_flt(1.1)); 
      printf("<check b>          %lf\n", check_b());
      printf("(init_dbl)         %lf\n", init_dbl(1.1)); 
      printf("<check c>          %lf\n", check_c());
      printf("(init_mixfltdbl)   %lf\n", init_mixfltdbl(1.1)); 
      printf("<check c>          %lf\n", check_c());
      printf("(break_before)     %ld\n", break_before(899));
      printf("(break_after)      %ld\n", break_after(899));
      printf("(hand_no_unroll)   %ld\n", hand_no_unroll());
      printf("(hand_unroll)      %ld\n", hand_unroll());
      printf("(var_not_live_in)  %ld\n", var_not_live_in(899));
      printf("(var_not_live_in2) %ld\n", var_not_live_in2(899));

      OMEGA[OMEGA_IDX]();

    }
  else
    {
      fprintf(stdout,"Nothing to do.\n");
    }

  return 0;
}
