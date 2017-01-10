// argumenty przekazywane przez stos,
// za uporządkowanie stosu odpowiada wywoływana funkcja
// wszystkie rejestry zachowywane przez wołanego
	.intel_syntax noprefix
	.globl main
	.text

main:
	mov eax, 10								//silnia z tej liczby

	push eax
	call silnia								//wywolanie silnia

	push eax									//uzycie eax
	push offset msg						//uzycie msg
	call printf								//wypisz printf
	add esp, 8								//wrzuc 8 do esp

	mov eax, 0								//wyzeruj eax
	ret												//powrot z procedury

silnia:
	push ebp									//tworzenie stosu ?
	mov ebp, esp							//wrzuc esp do ebp
	push ecx									//uzycie ecx
	push edx									//uzycie edx
	mov eax, [ebp+8]					//do eax wrzuca ebp z 8 ?
	cmp eax, 0								//sprawdz czy eax to 0
	jne dalej									//jak nie zapalone ( nie jest zerem ) to idz do dalej
	mov eax, 1								//wrzuc do eax 1
	pop edx										//wrzuc na stos edx
	pop ecx										//wrzuc na stos ecx
	pop ebp										//wrzuc na stos ebp
	ret 4											//zwolnienie argumentow ze stosu i powrot
dalej:
	push eax									//wrzuc eax
	dec eax										//zmiejsza eax o jeden
	push eax									//wrzuc eax
	call silnia								//wywolaj silnia
	pop ecx										//wyrzuc ecx
	mul ecx										//mnozenie ecx
	pop edx										//wyrzuc edx
	pop ecx										//wyrzuc ecx
	pop ebp										//wyrzuc ebp
	ret 4											//powrot z procedury

	.data
msg:	.asciz "silnia=%d\n"
