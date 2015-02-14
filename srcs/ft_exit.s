section	.text

global	_ft_exit

_ft_exit:
	mov		rax,	0x2000001
	mov		rbx,	rdi
	syscall

	jmp		ret_over

ret_over:
	ret
