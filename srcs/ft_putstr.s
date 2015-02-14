%define	SYSCALL_WRITE		0x2000004
%define	STDOUT				1

default	rel

extern	_ft_strlen

section	.data
	null:	db				"(null)", 0

section	.text

global	_ft_putstr
global	_ft_putstr_fd

_ft_putstr:
	mov		rsi,			STDOUT
	jmp		_ft_putstr_fd

_ft_putstr_fd:
	push	rsi								;save fd
	mov		rbx,			rdi				;backup ptr
	cmp		rbx,			byte 0
	je		ret_eof

	push	rdi								;save char *
	call	_ft_strlen

	mov		rdx,			rax				;length (arg 3)
	pop		rsi								;restore char * (arg 2)
	jmp		write

write:
	pop		rdi								;restore fd (arg 1)
	mov		rax,			SYSCALL_WRITE	;call write
	syscall

	ret

ret_eof:
	lea		rsi,			[null]			;ptr
	mov		rdx,			6				;length
	jmp		write
