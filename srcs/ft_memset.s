section	.text

global	_ft_memset

_ft_memset:
	push	rdi				;save void *
	mov		rax,	rsi		;copy char
	mov		rcx,	rdx		;init counter
	cld						;enable counter ++
	rep		stosb			;[di] = al && inc/dec(1) di
	jmp		ret_over

ret_over:
	pop		rax				;restore void *
	ret
