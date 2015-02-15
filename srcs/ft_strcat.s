section	.text

global	_ft_strcat

_ft_strcat:
	mov		rax,			rdi			;backup ptr
	cmp		rsi,			0
	je		ret_over					;check eof
	jmp		start

start:
	cmp		qword [rdi],	0
	je		while
	inc		rdi
	jmp		start

while:
	cmp		qword [rsi],	0
	je		ret_end
	mov		cl,				[rsi]
	mov		[rdi],			cl
	inc		rsi
	inc		rdi
	jmp		while

ret_end:
	mov		qword [rdi],	0
	ret

ret_over:
	ret
