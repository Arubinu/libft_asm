section	.text

global	_ft_memcpy

_ft_memcpy:
	push	rdi					;save void *
	mov		rcx,		rdx		;init counter
	cld							;enable counter ++
	rep		movsb				;di = si && inc/dec(1) di && inc/dec(1) si
	jmp		ret_over

ret_over:
	pop		rax					;restore void *
	ret
