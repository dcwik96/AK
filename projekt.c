#include<stdio.h>

int main(){

	char* s = "fqr  b qabxx xryc pqr";
    //char* s = "b";

        int x,y;
	  asm volatile (
      ".intel_syntax noprefix;"
        "mov ebx, %2;"		//przypisanie do ebx
        "mov eax, 0;"		//zerowanie eax
        "mov ecx, 0;"		//zerowanie ecx

      "petla:"
        "mov ecx, 0;"		//zerowanie ecx
        "cmp byte ptr [ebx], 'b';"		//porownanie do 'b'
        "jne sprawdza;"		//skok do sprawdza jesli nie rowne (do b)
        "inc ebx;"		//zwieksz ebx
        "inc eax;"		//zwieksz eax
        "inc ecx;"		//zwieksz ecx
        "jmp sprawdznor;"		//skok do sprawdznor

      "sprawdza:"		//skacze tutaj jak nie jest b w petla
        "cmp byte ptr [ebx], 'a';"		// sprawdza czy rowna sie a
        "jne sprawdz0;"		//jesli nie rowne do a to skacze do sprawdz0
        "inc ebx;"		//zwieksz ebx
        "inc eax;"		//zwieksz eax
        "inc ecx;"		//zwieksz ecx

      "sprawdznor:"
      "cmp byte ptr [ebx], 0;"		//sprawdza czy rowna sie r
      "je wyjscie7;"		//jesli nie to skocz do sprawdz 1


        "cmp byte ptr [ebx], 'r';"		//sprawdza czy rowna sie r
        "jne sprawdz1;"		//jesli nie to skocz do sprawdz 1
        "inc ebx;"		//zwieksz ebx
        "inc ecx;"		//zwieksz ecx
        "jmp petla;"		//skok do petla

      "szukanier:"
        "cmp byte ptr [ebx], 'r';"		//sprawdz czy rowne r
        "jne sprawdz1;"		//jesli nie to skocz do sprawdz1
				"inc ecx;"		//zwieksz ecx
        "jmp wyjscie;"		//skocz do wyjscie

      "sprawdz0:"
        "cmp byte ptr [ebx], 0;"		//sprawdz czy lancuch sie skonczyl
        "je wyjscie;"		//jesli koniec to skocz do wyjscie
        "inc ebx;"		//zwieksz ebx
        "inc eax;"		//zwieksz eax
        "jmp petla;"		//skocz do petla

      "sprawdz1:"
        "cmp byte ptr [ebx], 0;"		//sprawdz czy lancuch sie skonczyl
        "je wyjscie;"		//jesli tak to idz do wyjscie
        "inc ebx;"		//zwieksz ebx
        "inc ecx;"		//zwieksz ecx
        "jmp szukanier;"		//skocz do szukanier

      "wyjscie7:"
        "mov ecx, 0;"

      "wyjscie:"
        "add eax, -1;"
        "mov %0, eax;"
        "mov %1, ecx;"

        ".att_syntax prefix;"
        :"=r" (x), "=r" (y)
        :"r" (s)
        :"al","ebx", "eax", "ecx"
    );
    printf("[pq][^r]=%hd +r=%hd\n", x, y);
    return 0;
}
