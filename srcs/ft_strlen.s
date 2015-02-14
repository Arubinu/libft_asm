section	.text

global	_ft_strlen

_ft_strlen:
	cmp		rdi,		byte 0
	je		ret_eof					;check eof
	mov		rcx,		0
	mov		al,			0
	not		rcx
	cld								;auto dec
	repne	scasb					;while not eq
	not		rcx
	dec		rcx
	jmp		ret_over

ret_eof:
	mov		rax, 		-1
	ret

ret_over:
	mov		rax, 		rcx
	ret
