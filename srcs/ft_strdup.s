extern	_malloc
extern	_ft_bzero
extern	_ft_memcpy
extern	_ft_strlen

section	.text

global	_ft_strdup

_ft_strdup:
	push	rdi					;save char *
	call	_ft_strlen
	add		rax,		1
	push	rax					;save length

	mov		rdi,		rax
	call	_malloc

	cmp		rax,		byte 0
	je		ret_over

	pop		rsi					;restore length
	push	rsi					;save length
	mov		rdi,		rax
	push	rax					;save malloc
	call	_ft_bzero

	pop		rdi					;restore malloc
	pop		rdx					;restore length
	pop		rsi					;restore char *
	call	_ft_memcpy

	jmp		ret_over

ret_over:
	ret
