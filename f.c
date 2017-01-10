#include <stdio.h>

int main(){
	int x=0x0F0F; //dowolna liczba, do testów
	int x2=0;
	asm volatile(
		".intel_syntax noprefix;"

    "xor ebx,ebx;"
    "xor edx,edx;"
    "mov ecx,32;"
    "mov eax, %1;"

  "petla:"
    "shl eax;"
    "jnc a1;"
    "inc ebx;"
    "cmp ebx,edx;"
    "jng a3;"
    "mov edx,ebx;"
  "a1:"
    "mov ebx,0;"
  "a3:"
    "loop petla;"

    "mov %0, edx;"

    ".att_syntax prefix;"
    :"=r" (x2)
    :"r" (x)
    :"eax","ebx","ecx","edx"
  );
  printf("x=%d x2=%d", x,x2);
  return 0;
}
