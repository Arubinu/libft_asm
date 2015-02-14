section	.text

global	_ft_isalpha

_ft_isalpha:
	cmp		dil,		65			;letter A (outside)
	jl		ret_fail
	cmp		dil,		122			;letter z (outside)
	jg		ret_fail
	cmp		dil,		90			;letter Z (inside)
	jle		ret_good
	cmp		dil,		97			;letter a (inside)
	jge		ret_good
	jmp		ret_fail

ret_good:
	mov		rax,		42			;return 42
	ret

ret_fail:
	mov		rax,		0			;return 0
	ret
