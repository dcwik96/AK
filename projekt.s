	.file	"projekt.c"
	.section	.rodata
.LC0:
	.string	"fqr  b qabxx xryc pqr"
.LC1:
	.string	"[pq][^r]=%hd +r=%hd\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x6,0x2,0x75,0x7c
	.cfi_escape 0x10,0x3,0x2,0x75,0x78
	subl	$28, %esp
	movl	$.LC0, -36(%ebp)
	movl	-36(%ebp), %edx
#APP
# 9 "projekt.c" 1
	.intel_syntax noprefix;mov ebx, %edx;mov eax, 0;mov ecx, 0;petla:mov ecx, 0;cmp byte ptr [ebx], 'b';jne sprawdza;inc ebx;inc eax;inc ecx;jmp sprawdznor;sprawdza:cmp byte ptr [ebx], 'a';jne sprawdz0;inc ebx;inc eax;inc ecx;sprawdznor:cmp byte ptr [ebx], 0;je wyjscie7;cmp byte ptr [ebx], 'r';jne sprawdz1;inc ebx;inc ecx;jmp petla;szukanier:cmp byte ptr [ebx], 'r';jne sprawdz1;inc ecx;jmp wyjscie;sprawdz0:cmp byte ptr [ebx], 0;je wyjscie;inc ebx;inc eax;jmp petla;sprawdz1:cmp byte ptr [ebx], 0;je wyjscie;inc ebx;inc ecx;jmp szukanier;wyjscie7:mov ecx, 0;wyjscie:add eax, -1;mov %esi, eax;mov %edx, ecx;.att_syntax prefix;
# 0 "" 2
#NO_APP
	movl	%esi, -32(%ebp)
	movl	%edx, -28(%ebp)
	subl	$4, %esp
	pushl	-28(%ebp)
	pushl	-32(%ebp)
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	movl	$0, %eax
	leal	-12(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
