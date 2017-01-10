#include <stdio.h>

int main(void)
{
  int x=-1;
  int x2=0;

  asm volatile (
    ".intel_syntax noprefix;"

    "mov eax,%1;"
    "mov ebx,0;"  // wyzerowanie rejestru ebx
    "shl eax;"
    "jnc a1;"
    "add ebx,1;"
  "a1:"
    "shl eax;"
    "jnc a2;"
    "add ebx,1;"
  "a2:"
    "mov %0, ebx;"

    ".att_syntax prefix;"
    :"=r" (x2)
    :"r" (x)
    :"eax", "ebx"
  );

  printf("x=%d counter=%d",x,x2);
  return 0;
}
