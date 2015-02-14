section	.text

global	_ft_isgraph

_ft_isgraph:
	mov		rax,		42			;return 42

	cmp		dil,		32			;key space
	jle		ret_over
	cmp		dil,		127			;key del
	jge		ret_over

	mov		rax,		0			;return 0
	jmp		ret_over

ret_over:
	ret
