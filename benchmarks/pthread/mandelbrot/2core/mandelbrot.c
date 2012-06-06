#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#include "q.h"

#ifndef NUM_THREADS
#define NUM_THREADS 2
#endif

#define BAILOUT 2
#define MAX_ITERATIONS 50

#define DEPTH 256

#define IMG_HEIGHT 240
#define IMG_WIDTH 240
#define COLORS 3

int mandelbrot(q_t, q_t);

#define LUT_SIZE 10
const unsigned char colour_lut [LUT_SIZE][3] = {
	{0x00,0x00,0x00},
	{0x00,0x00,0xff},
	{0x00,0xff,0x00},
	{0x00,0xff,0xff},
	{0xff,0x00,0x00},
	{0xff,0x00,0xff},
	{0xff,0xff,0x00},
	{0xff,0xff,0xff},
	{0xaa,0x00,0xaa},
	{0x00,0xaa,0x00}
	};

q_t image_settings[3] = {0xfccccccd, 0xfe000000, 0x00021893};
//q_t image_settings[3] = {0xfccccccd, 0xfe000000, 0x005d1893};

//unsigned char img[IMG_HEIGHT][IMG_WIDTH][3];
unsigned char img[IMG_HEIGHT * IMG_WIDTH * COLORS];

typedef struct {
  int start, end;
} thread_args_t;

void *thread(void *);
pthread_t threads[NUM_THREADS];
thread_args_t thread_args[NUM_THREADS];

int main()
{
  int x, y, i;

  for(i=1;i<NUM_THREADS;i++) {
    thread_args[i].start = (IMG_HEIGHT/NUM_THREADS) * i;
    thread_args[i].end = (IMG_HEIGHT/NUM_THREADS) * (i+1);
    pthread_create(&threads[i], NULL, thread, &thread_args[i]);
  }

  thread_args[0].start = (IMG_HEIGHT/NUM_THREADS) * 0;
  thread_args[0].end = (IMG_HEIGHT/NUM_THREADS) * 1;
  thread((void *)&thread_args[0]);

  for(i=1;i<NUM_THREADS;i++) {
    pthread_join(threads[i], NULL);
  }

#ifndef __vex
  printf("P3\n%d %d\n%d\n", IMG_WIDTH, IMG_HEIGHT, DEPTH);
  for(y = 0; y < IMG_HEIGHT; y++) {
    for(x = 0; x < IMG_WIDTH; x++) {
      printf("%d %d %d ",
	     img[(y * IMG_WIDTH * COLORS) + (x * COLORS)],
	     img[(y * IMG_WIDTH * COLORS) + (x * COLORS) + 1],
	     img[(y * IMG_WIDTH * COLORS) + (x * COLORS) + 2]);
    }
    //printf("\n");
  }
#endif

  exit(0);
}

void *thread(void *args) {
  thread_args_t *thread_a = (thread_args_t *)args;
  int x, y;
  for(y=thread_a->start;y<thread_a->end;y++)
    {
      for(x=0;x<IMG_WIDTH;x++)
	{
	  int res = mandelbrot(x, y) % LUT_SIZE;
	  img[(y * IMG_WIDTH * COLORS) + (x * COLORS)] = colour_lut[res][0];
	  img[(y * IMG_WIDTH * COLORS) + (x * COLORS) + 1] = colour_lut[res][1];
	  img[(y * IMG_WIDTH * COLORS) + (x * COLORS) + 2] = colour_lut[res][2];
	}
    }
  return (void *)0;
}

int mandelbrot(q_t /*0*/ x0, q_t /*0*/ y0)
{
  q_t x = 0;
  q_t y = 0;
  q_t /*25*/ x1 = image_settings[0] + q_mul(q_chtype(x0, 0, 12), image_settings[2], 12, 25, 25);
  q_t /*25*/ y1 = image_settings[1] + q_mul(q_chtype(y0, 0, 12), image_settings[2], 12, 25, 25);
  int iteration = 0;
  while (q_mul(x, x, 25, 25, 25) +
	 q_mul(y, y, 25, 25, 25)
	 <= q_chtype(BAILOUT*BAILOUT, 0, 25) && iteration < MAX_ITERATIONS) {
    q_t xtemp = q_mul(x, x, 25, 25, 25) - q_mul(y, y, 25, 25, 25) + x1;
    y = q_mul(q_mul(q_chtype(2, 0, 25), x, 25, 25, 25), y, 25, 25, 25) + y1;
    x = xtemp;
    iteration++;
  }

  if (iteration == MAX_ITERATIONS)
    return 0;
  else
    return iteration;
}

