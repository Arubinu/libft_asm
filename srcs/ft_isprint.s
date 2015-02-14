section	.text

global	_ft_isprint

_ft_isprint:
	cmp		dil,		32			;start print char (outside)
	jl		ret_fail
	cmp		dil,		126			;end print char (outside)
	jg		ret_fail
	mov		rax,		42			;return 42
	jmp		ret_over

ret_fail:
	mov		rax,		0			;return 0
	jmp		ret_over

ret_over:
	ret
