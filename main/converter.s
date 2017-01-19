.intel_syntax noprefix
.text
.globl _start

_start:
  mov eax, 0
  mov ecx, [esp+8]
	mov bl, byte ptr [ecx]
	sub bl, '0'
	movzx ebx, bl
	add eax, ebx
	cmp byte ptr [ecx+1], 0
	je second
	mov bl, byte ptr [ecx+1]
	sub bl, '0'
	movzx ebx, bl
	imul eax, 10
	add eax, ebx
	cmp byte ptr [ecx+2], 0
	je second
	mov bl, byte ptr [ecx+2]
	sub bl, '0'
	movzx ebx, bl
	imul eax, 10
	add eax, ebx


second:
  mov edx, 0
  mov ecx, [esp+12]
	mov bl, byte ptr [ecx]
	sub bl, '0'
	movzx ebx, bl
	add edx, ebx
	cmp byte ptr [ecx+1], 0
	je conv
	mov bl, byte ptr [ecx+1]
	sub bl, '0'
	movzx ebx, bl
	imul edx, 10
	add edx, ebx
	cmp byte ptr [ecx+2], 0
	je conv
	mov bl, byte ptr [ecx+2]
	sub bl, '0'
	movzx ebx, bl
	imul edx, 10
	add edx, ebx

conv:
  xor ebx,ebx
  mov ecx, 10
  mov ebx,[esp+16]
  cmp byte ptr [ebx], 'x'
  je multiply
  cmp byte ptr [ebx], '-'
  je minus

multiply:
  imul eax, edx
  jmp clear

minus:
  sub eax,edx
  jmp clear

clear:
  xor ebx,ebx
  jmp checkifminus

checkifminus:
  test eax,eax
  js makeplus
  jmp divide

makeplus:
  imul eax, -1
  jmp divide2

divide:
	xor edx, edx
	div ecx
	push edx
	inc ebx
	test eax, eax
	jnz divide
  xor ecx,ecx

next_digit:
	pop eax
	add eax, '0'
	mov [sum+ecx], eax
  inc ecx
	dec ebx
	cmp ebx, 0
	je final
  cmp ebx, 0
  jne next_digit

divide2:
	xor edx, edx
	div ecx
	push edx
	inc ebx
	test eax, eax
	jnz divide
  xor ecx,ecx

next_digit2:
	pop eax
	add eax, '0'
	mov [sum+ecx], eax
  inc ecx
	dec ebx
	cmp ebx, 0
	je final2
  cmp ebx, 0
  jne next_digit2

final:
	mov	edx, 3
	mov	ecx, offset sum
	mov	ebx, 1
	mov	eax, 4
	int	0x80

  mov	edx, 1
	mov	ecx, offset msg
	mov	ebx, 1
	mov	eax, 4
	int	0x80

  mov	eax, 1
	int	0x80

final2:
  mov	edx, 1
  mov	ecx, offset msg2
  mov	ebx, 1
  mov	eax, 4
  int	0x80

	mov	edx, 3
	mov	ecx, offset sum
	mov	ebx, 1
	mov	eax, 4
	int	0x80

  mov	edx, 1
	mov	ecx, offset msg
	mov	ebx, 1
	mov	eax, 4
	int	0x80

  mov	eax, 1
	int	0x80

.data
msg2: .ascii "-"
msg: .ascii "\n"
sum: .byte 0, 0, 0, 0
