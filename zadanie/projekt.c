#include<stdio.h>

int main(){
        int x=1;
        int y=2;
	  asm volatile (
      ".intel_syntax noprefix;"
      "mov eax, %0;"
      "mov ebx, %1;"


        ".att_syntax prefix;"
        :"=r" (y), "=r" (x)
        :"r" (x)
        :"al","ebx", "eax", "ecx"
    );
    printf("[pq][^r]=%d +r=%d\n", y, x);
    return 0;
}
