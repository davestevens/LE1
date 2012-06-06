#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/times.h>
#include "paraffins.h"

RADICAL  *radicals[MAX_SIZE_RADICAL];
int      rad_counts[MAX_SIZE_RADICAL];
int      BCP_counts[MAX_SIZE_RADICAL];
int      CCP_counts[MAX_SIZE_RADICAL];
int      paraffins_counts[MAX_SIZE_RADICAL];

PARAFFIN *BCP_array[MAX_SIZE_PARAFFIN];
PARAFFIN *CCP_array[MAX_SIZE_PARAFFIN];
TUPLE    *paraffins_array[MAX_SIZE_PARAFFIN];
PARAFFIN *paraffins;
static char *freeptr, *limitptr;

#ifdef MAIN_ARGS
#else
void main_test(int, char **);

int main(void) {
  int _argc = 2;
  char *_argv[2] = {
    "parafins",
    "15"
  };
  main_test(_argc, _argv);
  return 0;
}

void main_test(int argc, char *argv[])
#endif
{
  int n;
  
/*
  printf("\nPARAFFINS Problem: Version 4\n");
  printf("\t(No Garbage Collection, User-Managed Heap, No Copying for Partitions)\n\n");
*/
  if (argc != 2) {
    printf("Usage: paraffins size\n");
    exit(1);
  }
  n = atoi(argv[1]);
  init_heap();
  paraffins_until(n);
  /* print the information about results */

  print_paraffin_counts(n);
  exit (0);

}

/* Printout Functions */

void print_paraffin_counts(int n)
{
  int i;

  printf("\nParaffin Counts\n");
  for (i = 1; i <= n; i++)
    {
	printf("\tparaffins[%2d] : %d\n", i, paraffins_counts[i]);
    }
}


void paraffins_until (int n)
{
  int i;
  TUPLE *t;

  /* main body */
#ifdef DBG
  printf("Begin RADICALS computed\n");
#endif
  radical_generator(n/2);
#ifdef DBG
  printf("RADICALS computed\n");

  printf("PARAFFINS being computed ...\n");

  printf("\tBCP being computed ...\n");
#endif
  for (i = 1; i <= n; ++i) {
    BCP_generator(i);
#ifdef DBG
    printf("\tBCP computed\n");
    printf("\tCCP being computed ...\n");
#endif
    CCP_generator_with_no_copying(i);
#ifdef DBG
    printf("\tCCP computed\n");
    printf("PARAFFINS computed ...\n");
#endif
    U_NEW_STRUCT(t,TUPLE);
    t->bcp = BCP_array[i];
    t->ccp = CCP_array[i];    
    paraffins_array[i] = t;
    paraffins_counts[i] = BCP_counts[i] + CCP_counts[i];
  }
}


void radical_generator (int n)
{
  RADICAL *h;
  int i;

  /* initialize "radicals" */
  U_NEW_STRUCT(h,RADICAL);
  h->kind = H;
  radicals[0] = h;
  rad_counts[0] = 1;
  for (i = 1; i <= n; i++) {
      rads_of_size_n_with_no_copying(i);
#ifdef DBG
      printf("\tradicals[%d] computed\n", i);
#endif
  }
}

void paraffins_generator (int n)
{
    TUPLE *t;

    U_NEW_STRUCT(t,TUPLE);
    t->bcp = BCP_array[n];
    t->ccp = CCP_array[n];    
    paraffins_array[n] = t;
}


void BCP_generator (int n)
{
  PARAFFIN *p, *root;
  RADICAL  *r1, *r2;
  int half_n;
  int num_BCPs;

  num_BCPs = 0;
  root = (PARAFFIN *) NULL;

  if (n != (half_n = (n/2)) * 2)
    {
#ifdef DBG
	printf("\tNumber of BCPs with size %d : %d\n", n, num_BCPs);  */
#endif
	BCP_array[n] = root;
	BCP_counts[n] = num_BCPs;
	return;
    }
  
#ifdef DBG
  printf("\t\t(%d(%d),%d(%d))\n", half_n, num_rads[half_n], half_n, num_rads[half_n]);
#endif
  for (r1 = radicals[half_n]; r1 != (RADICAL *)NULL; r1 = r1->next)
      for (r2 = r1; r2 != (RADICAL *)NULL; r2 = r2->next)
	  {
	      U_NEW_STRUCT(p,PARAFFIN);
	      p->kind = BCP;
	      p->radicals[0] = r1;
	      p->radicals[1] = r2;
	      p->next = root;
	      root = p;
	      num_BCPs++;
	  }
  BCP_array[n] = root;
  BCP_counts[n] = num_BCPs;
  /*   printf("\tNumber of BCPs with size %d : %d\n", n, num_BCPs);  */
}


/*--------------------------------------------------------
 * This function is used only on VERSION 3 and 4.
 *--------------------------------------------------------
 */
void CCP_generator_with_no_copying (int n)
{
  PARAFFIN *p, *root;
  RADICAL  *r1, *r2, *r3, *r4;
  int m, half_m, nc1, nc2, nc3, nc4, k, num_CCPs;
  int rc1, rc2, rc3, rc4;

  root = (PARAFFIN *) NULL;
  num_CCPs = 0;
  m = n - 1;
  for (nc1 = 0; nc1 <= m/4; nc1++)
    for (nc2 = nc1; nc2 <= (m-nc1)/3; nc2++)
      {
	half_m = m/2;
	if (m == half_m*2)
	  k = half_m-nc1-nc2;
	else 
	  k = half_m+1-nc1-nc2;
	if (k < nc2)
	  k = nc2;
	for (nc3 = k; nc3 <= (m-nc1-nc2)/2; nc3++)
	  {
	    nc4 = m - nc1 - nc2 - nc3;
	    for (r1 = radicals[nc1], rc1 = rad_counts[nc1]; 
		 rc1 > 0; r1 = r1->next, rc1--)
	      for (r2 = (nc1 == nc2) ? r1 : radicals[nc2],
		     rc2 = (nc1 == nc2) ? rc1 : rad_counts[nc2]; 
		   rc2 > 0; r2 = r2->next, rc2--)
		for (r3 = (nc2 == nc3) ? r2 : radicals[nc3],
		       rc3 = (nc2 == nc3) ? rc2 : rad_counts[nc3]; 
		     rc3 > 0; r3 = r3->next, rc3--)
		  for (r4 = (nc3 == nc4) ? r3 : radicals[nc4],
			 rc4 = (nc3 == nc4) ? rc3 : rad_counts[nc4];
		       rc4 > 0; r4 = r4->next, rc4--)
		    {
		      U_NEW_STRUCT(p,PARAFFIN);
		      p->kind = CCP;
		      p->radicals[0] = r1;
		      p->radicals[1] = r2;
		      p->radicals[2] = r3;
		      p->radicals[3] = r4;
		      p->next = root;
		      root = p;
		      num_CCPs++;
		    }
	  }
      }
  CCP_array[n] = root;
  CCP_counts[n] = num_CCPs;
  /* free_four_partitions(parts); */
}

/*--------------------------------------------------------
 * This function is used only on VERSION 3 and 4.
 *--------------------------------------------------------
 */
void rads_of_size_n_with_no_copying (int m)
{
  RADICAL *rad, *r1, *r2, *r3;
  int nc1, nc2, nc3, n;
  int rc1, rc2, rc3, num_rads;

  n = m-1;
  num_rads = 0;
  for (nc1 = 0; nc1 <= n/3; nc1++)
    for (nc2 = nc1; nc2 <= (n-nc1)/2; nc2++)
      {
	nc3 = n - (nc1 + nc2);
	for (r1 = radicals[nc1], rc1 = rad_counts[nc1]; 
	     rc1 > 0; r1 = r1->next, rc1--)
	  for (r2 = (nc1 == nc2) ? r1 : radicals[nc2],
		 rc2 = (nc1 == nc2) ? rc1 : rad_counts[nc2]; 
	       rc2 > 0; r2 = r2->next, rc2--)
	    for (r3 = (nc2 == nc3) ? r2 : radicals[nc3],
		   rc3 = (nc2 == nc3) ? rc2 : rad_counts[nc3]; 
		 rc3 > 0; r3 = r3->next, rc3--)
	      {
		U_NEW_STRUCT(rad,RADICAL);
		rad->kind = C;
		rad->sub_radicals[0] = r1;
		rad->sub_radicals[1] = r2;
		rad->sub_radicals[2] = r3;
		rad->next = radicals[m];
		radicals[m] = rad;
		num_rads++;
	      }
      }
  rad_counts[m] = num_rads;
  /* free_three_partitions(parts); */
}


/*----------------------------------------------------------------
INIT_HEAP should be called at start of MAIN
*/

void init_heap()
{
    char *p;

    /* IMPACT FIX for sunos/gcc - add cast */
    /*p = (char *)sbrk(HEAPSIZE);*/
    p = (char *)malloc(HEAPSIZE);
    if ((int)p == NULL) {
        printf("Error (init_heap) cannot alloc %d bytes.\n", HEAPSIZE);
        exit(1);
    }
    freeptr = (char *) p;
    limitptr = freeptr + HEAPSIZE - 1;
}

/*---------------------------------------------------------------
HALLOC
  Takes N: int
  Returns: pointer to heap object of size N bytes
*/

char *halloc(int n)
{
    char *p;

    p=freeptr;
    freeptr += n;

    if (freeptr > limitptr) {
      printf("Error (halloc) No space for %d bytes.\n", n);
      exit(1);
    }

    return p;
  }







