section	.text

global	_ft_isascii

_ft_isascii:
	cmp		dil,		0			;start ascii table (outside)
	jl		ret_fail
	cmp		dil,		127			;end ascii table (outside)
	jg		ret_fail
	mov		rax,		42			;return 42 (avoid 0)
	jmp		ret_over

ret_fail:
	mov		rax,		0			;return 0
	jmp		ret_over

ret_over:
	ret
