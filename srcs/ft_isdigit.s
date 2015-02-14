section	.text

global	_ft_isdigit

_ft_isdigit:
	cmp		dil,		48			;letter 0 (outside)
	jl		ret_fail
	cmp		dil,		57			;letter 9 (outside)
	jg		ret_fail
	mov		rax,		42			;return 42
	jmp		ret_over

ret_fail:
	mov		rax,		0			;return 0
	jmp		ret_over

ret_over:
	ret
