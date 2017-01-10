//       {m                              dla n=0
//f(n,m)={0                              dla n=1
//       {2                              dla n=2
//       {f(n-1,m)+2*f(n-2,m)-f(n-3,m)   w pozostałych przypadkach
//(1)Pierwszy argument przekazywany przez rejestr ecx, pozostałe argumenty przekazywane przez stos.
//(2)Wynik zwracany przez rejestr edx.
//(3)Za uporządkowanie stosu odpowiada wywołujący funkcję.
//(4)Wywoływana funkcja musi zachować wszystkie rejesty(oprócz rejestru, w którym zwracany jest wynik).

.intel_syntax noprefix
	.globl main
  .text

main:
	mov ecx,4		//zmienna n
	mov eax,10	//zmienna m
  xor edx,edx
  xor ebx,ebx
  push eax	//przekazanie m przez stos
  call f	//wywolanie funkcji
	add esp, 4	//czyszczenie stosu
/*WYPISANIE WYNIKU*/
  push edx
	push offset msg
	call printf
  add esp,8
  ret
  mov eax,0
	ret
f:
  mov edx,0	//zerowanie rejestru z wynikiem
/*ZAPAMIETANIE REJESTROW NA STOSIE*/
  push ebp
  mov ebp, esp	//zapamietanie miejsca stosu
  push eax
  push ecx
  push ebx
/*WCZYTANIE ZMIENNEJ M[EAX] PRZEZ STOS*/
  mov eax, [ebp+8]
/*PRZYPADEK N=0*/
  cmp ecx,0
  jne a1
  mov edx,eax
  jmp koniec
/*PRZYPADEK N=1*/
a1:
  cmp ecx,1
  jne a2
  mov edx,0
  jmp koniec
/*PRZYPADEK N=2*/
a2:
  cmp ecx,2
  jne a3
  mov edx,2
  jmp koniec
/*PRZYPADEK N=1*/
a3:
 /*F(N-1,M)*/
  push ecx	 //zapamietanie wartosci n
  sub ecx,1 	//ustawienie ecx na n-1
  push edx	//zapamietanie wyniku
  push eax
  call f
  add esp, 4
  pop ebx
  add edx,ebx
  pop ecx
	/*F(N-2,M)*/
  push ecx	//zapamietanie wartosci n
  sub ecx,2	//ustawienie ecx na n-2
  push edx	//zapamietanie wyniku
  push eax
  call f
  add esp, 4
  pop ebx
  add edx,edx
  add edx,ebx
  pop ecx
	/*-F(N-3,M)*/
  push ecx	//zapamietanie wartosci n
  sub ecx,3	//ustawienie ecx na n-3
  push edx	//zapamietanie wyniku
  push eax
  call f
  add esp, 4
  pop ebx		//do ebx wpisujemy ostatnia wartosc na stosie stare edx
  sub ebx,edx		//od starego wyniku odejmujemy nowy
  mov edx,ebx		//przenosimy wynik do edx
  pop ecx
/*PRZYWRACANIE REJESTROW*/
koniec:
  pop ebx
  pop ecx
  pop eax
  pop ebp
  ret

	.data
msg:	.asciz "Wynik:%d\n"
	.byte 0
