#include <stdio.h>

int main(){
	int x=0x0102; //dowolna liczba, do testów
	int x2=0;
	asm volatile(
		".intel_syntax noprefix;"
		"mov ebx,0;" // ebx <- 0 etc.
		"mov ecx,0;"
		"mov edx,0;"
		"mov eax, %1;" // eax <- x
		"petla:"
			"inc edx;" // inkrementacja edx, bo 32-bitowe rejestry
			"cmp edx,34;"
			"jz a3;" // jeśli flaga "z" zapalona, skok do a3;jeśli nie, dalej
			"shl eax;" // przesunięcie bitowe w lewo
			"jnc a1;" // jeśli flaga "c" zgaszona, skok do a1, jeśli nie, dalej
			"inc ebx;" // inkrementacja ebx
			"jmp petla;" // zapętlenie
		"a1:"
			"cmp ebx,ecx;" // porównanie ebx i ecx, gdzie ebx to licznik tymczasowy ciągu jedynek, a ecx to max
			"jng a2;" // jeśli ebx nie większe od ecx, skok do a2
			"mov ecx,ebx;" // jeśli większe, ebx to nowy max
			"xor ebx,ebx;" // wyzerowanie ebx
			"jmp petla;"
		"a2:"
			"mov ebx,0;" // wyzerowanie ebx
			"jmp petla;"
		"a3:"
		"mov %1,ecx;" // x2 <- ecx

		".att_syntax prefix;"
		:"=r" (x2)
		:"r" (x)
		:"eax","ebx","ecx","edx"
	);
	printf("x=%d x2=%d", x,x2);
	return 0;
}
