	.file	"a.c"
	.section	.rodata
.LC0:
	.string	"x=%d x2=%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$-1, -8(%rbp)
	movl	$0, -4(%rbp)
	movl	-8(%rbp), %edx
#APP
# 8 "a.c" 1
	.intel_syntax noprefix;mov eax,%edx;shl eax;jc zapalony;mov eax,17;jmp koniec;zapalony:mov eax,12;koniec:mov %edx, eax;.att_syntax prefix;
# 0 "" 2
#NO_APP
	movl	%edx, -4(%rbp)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
