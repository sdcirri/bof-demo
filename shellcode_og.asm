
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
	mov eax, 11
	mov ebx, esp
	mov ecx, 0
	mov edx, 0
	syscall

