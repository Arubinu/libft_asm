extern	_ft_strlen

section	.text

global	_ft_strcpy

_ft_strcpy:
	push	rdi					;save char *
	mov		rdi,		rsi
	call	_ft_strlen
	mov		rcx,		rax		;init counter
	pop		rdi					;restore char *
	push	rdi					;save char *
	cld							;enable counter ++
	rep		movsb				;di = si && inc/dec(1) di && inc/dec(1) si
	jmp		ret_over

ret_over:
	pop		rax					;restore char *
	ret
