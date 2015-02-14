section	.text

global	_ft_islower

_ft_islower:
	mov		rax,		0			;return 0

	cmp		dil,		97			;letter a
	jl		ret_over
	cmp		dil,		122			;letter z
	jg		ret_over

	mov		rax,		42			;return 42
	jmp		ret_over

ret_over:
	ret
