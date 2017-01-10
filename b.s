	.file	"b.c"
	.section	.rodata
.LC0:
	.string	"x=%d counter=%d"
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
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	$-1, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	-24(%rbp), %edx
#APP
# 8 "b.c" 1
	.intel_syntax noprefix;mov eax,%edx;mov ebx,0;shl eax;jnc a1;add ebx,1;a1:shl eax;jnc a2;add ebx,1;a2:mov %edx, ebx;.att_syntax prefix;
# 0 "" 2
#NO_APP
	movl	%edx, -20(%rbp)
	movl	-20(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
