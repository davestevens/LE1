#include <stdio.h>
#include <stdlib.h>

// Tests a linked list node struct
// with struct pointers

struct record {
   volatile struct record * next;
   short a, b, c, d;
};

volatile struct record tail = {NULL, 1, 2, 3, 4};

int main()
{
  volatile struct record node3;// = {&tail, 2, 5, 7, 34};
  volatile struct record node2;// = {&node3, 34, 35, 27, 14};
  volatile struct record node1;// = {&node2, 12, 54, 23, 334};
  volatile struct record head;// = {&node1, 24, 245, 537, 3434};
   int result = 0;
   volatile struct record * ptr = &head;
   head.next = &node1; head.a = 24; head.b = 245; head.c = 537; head.d = 3434;
   node1.next = &node2; node1.a = 12; node1.b = 54; node1.c = 23; node1.d = 334;
   node2.next = &node3; node2.a = 34; node2.b = 35; node2.c = 27; node2.d = 14;
   node3.next = &tail;  node3.a = 2; node3.b = 5; node3.c = 7; node3.d = 34;

   while (ptr) {
       result += ptr->a + ptr->b + ptr->c + ptr->d;
       ptr = ptr->next;
   }

   printf("Result: %d\n", result);
   if (result == 4831) {
       printf("RESULT: PASS\n");
   } else {
       printf("RESULT: FAIL\n");
   }
   
   return result;
}

