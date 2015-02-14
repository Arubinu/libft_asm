extern	_ft_isalpha
extern	_ft_isdigit

section	.text

global	_ft_isalnum

_ft_isalnum:
	mov		rbx,		rdi			;backup char
	jmp		isalpha

isalpha:
	mov		rdi,		rbx			;send char
	call	_ft_isalpha
	cmp		rax,		0
	je		isdigit
	jmp		ret_good

isdigit:
	mov		rdi,		rbx			;send char
	call	_ft_isdigit
	cmp		rax,		0
	je		ret_fail
	jmp		ret_good

ret_good:
	mov		rax,		42			;return 42
	ret

ret_fail:
	mov		rax,		0			;return 0
	ret
