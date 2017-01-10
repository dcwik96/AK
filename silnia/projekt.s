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
	mov eax,10       							//zmienna m
  mov ecx,4          						//zmienna n
  xor edx,edx
  xor ebx,ebx
  push eax											//przekazanie m przez stos
  call f           			 				//wywołanie funkcji
	add esp, 4										//czyszczenie stosu
//wypisanie wyniku
  push edx
	push offset msg
	call printf
  add esp,8
  ret
  mov eax,0
	ret
f:
  mov edx,0           					//zerowanie rejestru z wynikiem
//zapamietane rejestrow na stosie
  push ebp
  mov ebp, esp	   							//zapamietanie miejsca stosu
  push eax
  push ecx
  push ebx
//******************
//wczytanie zmiennej m[eax] przez stos
  mov eax, [ebp+8]
//******************

//przypadek n=0
  cmp ecx,0
  jne a1
  mov edx,eax
  jmp koniec
a1:
//******************
//przypadek n=1
  cmp ecx,1
  jne a2
  mov edx,0
  jmp koniec
a2:
//******************
//przypadek n=2
  cmp ecx,2
  jne a3
  mov edx,2
  jmp koniec
a3:
//******************
//pozostałe przypadki
//f(n-1,m)
  push ecx											//zapamietanie wartosci n
  sub ecx,1           					//ustawienie ecx na n-1
  push edx            					//zapamietanie wyniku
//wywołanie funkcji
  push eax
  call f
  add esp, 4
  pop ebx												//do ebx wpisujemy ostatnia wartość na stosie czyli stare edx
  add edx,ebx										//do nowego wyniku dodajemy stary
  pop ecx												//przywaracamy stare n
//******************
//2*f(n-2,m)
  push ecx            					//zapamietanie wartosci n
  sub ecx,2           					//ustawienie ecx na n-2
  push edx            					//zapamietanie wyniku
//wywołanie funkcji
  push eax
  call f
  add esp, 4
  pop ebx												//do ebx wpisujemy ostatnia wartość na stosie czyli stare edx
  add edx,edx         					//podwajamy nowy wynik (bo 2*f(n-2,m))
  add edx,ebx        	 					//do nowego wyniku dodajemy stary
  pop ecx             					//przywaracamy stare n
//******************
//-f(n-3,m)
  push ecx            					//zapamietanie wartosci n
  sub ecx,3           					//ustawienie ecx na n-3
  push edx            					//zapamietanie wyniku

  push eax
  call f
  add esp, 4

  pop ebx             					//do ebx wpisujemy ostatnia wartość na stosie czyli stare edx
  sub ebx,edx         					//od starego wyniku odejmujemy nowy (bo -f(n-3,m))
  mov edx,ebx         					//przenosimy wynik do edx
  pop ecx             					//przywaracamy stare n
//******************

koniec:
//przywracanie rejestrów
  pop ebx
  pop ecx
  pop eax
  pop ebp
//******************
  ret

	.data
msg:	.asciz "Wynik:%d\n"
	.byte 0
