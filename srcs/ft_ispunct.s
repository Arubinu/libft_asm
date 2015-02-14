extern	_ft_isalnum

section	.text

global	_ft_ispunct

_ft_ispunct:
	cmp		dil,		32			;key space
	je		ret_fail

	call	_ft_isalnum

	cmp		rax,		0			;return isalnum
	jne		ret_fail

	jmp		ret_good

ret_good:
	mov		rax,		42			;return 42
	ret

ret_fail:
	mov		rax,		0			;return 0
	ret
