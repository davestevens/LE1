#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifdef MAIN_ARGS
int main(int argc, char *argv[])
#else

int main_test(int, char **);

int main(void) {
  int _argc = 3;
  char *_argv[3] = {
    "fft",
    "4",
    "1024"
  };
  return main_test(_argc, _argv);
}

int main_test(int argc, char *argv[])
#endif
{
	unsigned MAXSIZE;
	unsigned MAXWAVES;
	unsigned i,j;
	float *RealIn;
	float *ImagIn;
	float *RealOut;
	float *ImagOut;
	float *coeff;
	float *amp;
	int invfft=0;

	if (argc<3)
	{
		printf("Usage: fft <waves> <length> -i\n");
		printf("-i performs an inverse fft\n");
		printf("make <waves> random sinusoids");
		printf("<length> is the number of samples\n");
		exit(-1);
	}
	else if (argc==4)
		invfft = !strncmp(argv[3],"-i",2);
	MAXSIZE=atoi(argv[2]);
	MAXWAVES=atoi(argv[1]);
		
 srand(1);

 RealIn=(float*)calloc(sizeof(float)*MAXSIZE, 1);
 ImagIn=(float*)calloc(sizeof(float)*MAXSIZE, 1);
 RealOut=(float*)calloc(sizeof(float)*MAXSIZE, 1);
 ImagOut=(float*)calloc(sizeof(float)*MAXSIZE, 1);
 coeff=(float*)calloc(sizeof(float)*MAXWAVES, 1);
 amp=(float*)calloc(sizeof(float)*MAXWAVES, 1);

 /* Makes MAXWAVES waves of random amplitude and period */
 for(i=0;i<MAXWAVES;i++) 
   {
     coeff[i] = rand()%1000;
     amp[i] = rand()%1000;
   }
 for(i=0;i<MAXSIZE;i++) 
 {
   /*   RealIn[i]=rand();*/
	 RealIn[i]=0;
	 for(j=0;j<MAXWAVES;j++) 
	 {
		 /* randomly select sin or cos */
		 if (rand()%2)
		 {
		 		RealIn[i]+=coeff[j]*cos(amp[j]*i);
			}
		 else
		 {
		 	RealIn[i]+=coeff[j]*sin(amp[j]*i);
		 }
  	 ImagIn[i]=0;
	 }
 }

 /* regular*/
 fft_float (MAXSIZE,invfft,RealIn,ImagIn,RealOut,ImagOut);

#if 0 
 printf("RealOut:\n");
 for (i=0;i<MAXSIZE;i++)
   printf("%f \t", RealOut[i]);
 printf("\n");

printf("ImagOut:\n");
 for (i=0;i<MAXSIZE;i++)
   printf("%f \t", ImagOut[i]);
   printf("\n");
#else
   printf("RealOut:\n");
   for (i=0;i<MAXSIZE;i++)
     {
       printf("%f \t", RealOut[i]);
       if (((i + 1) % 5) == 0)
	 printf("\n");
     }
   printf("\n");

   printf("ImagOut:\n");
   for (i=0;i<MAXSIZE;i++)
     {
       printf("%f \t", ImagOut[i]);
       if (((i +1) % 5) == 0)
	 printf("\n");
     }
   printf("\n");
#endif

 free(RealIn);
 free(ImagIn);
 free(RealOut);
 free(ImagOut);
 free(coeff);
 free(amp);
 exit(0);


}
