extern	_ft_isdigit

section	.text

global	_ft_isxdigit

_ft_isxdigit:
	cmp		dil,		65			;letter A (outside)
	jl		ret_fail
	cmp		dil,		102			;letter f (outside)
	jg		ret_fail
	cmp		dil,		70			;letter F (inside)
	jle		ret_good
	cmp		dil,		97			;letter a (inside)
	jge		ret_good
	jmp		ret_fail

ret_good:
	mov		rax,		42			;return 42
	ret

ret_fail:
	call	_ft_isdigit
	ret
