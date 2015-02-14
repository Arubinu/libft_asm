section	.text

global	_ft_isupper

_ft_isupper:
	mov		rax,		0			;return 0

	cmp		dil,		65			;letter A
	jl		ret_over
	cmp		dil,		90			;letter Z
	jg		ret_over

	mov		rax,		42			;return 42
	jmp		ret_over

ret_over:
	ret
