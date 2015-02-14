extern	_ft_bzero
extern	_malloc

section	.text

global	_ft_memalloc

_ft_memalloc:
	push	rdi
	call	_malloc

	cmp		rax,		byte 0
	je		ret_over

	pop		rsi					;arg 2
	push	rax

	mov		rdi,		rax		;arg 1
	call	_ft_bzero

	pop		rax
	jmp		ret_over

ret_over:
	ret
