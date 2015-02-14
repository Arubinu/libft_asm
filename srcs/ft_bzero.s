section	.text

global	_ft_bzero

_ft_bzero:
	cmp		rsi,			0
	jle		ret_over

	sub		rsi,			1
	mov		qword [rdi],	0
	inc		rdi
	call	_ft_bzero

	jmp		ret_over

ret_over:
	ret
