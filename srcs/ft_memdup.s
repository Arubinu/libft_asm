extern	_ft_memalloc
extern	_ft_memcpy

section	.text

global	_ft_memdup

_ft_memdup:
	push	rdi						;save void *
	push	rsi						;save length

	mov		rdi,			rsi
	call	_ft_memalloc
	cmp		rax,			byte 0
	je		ret_over

	mov		rdi,			rax		;arg 1
	pop		rdx						;restore length (arg 3)
	pop		rsi						;restore void * (arg 2)
	call	_ft_memcpy

	jmp		ret_over

ret_over:
	ret
