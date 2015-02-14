%define	SYSCALL_READ	0x2000003
%define	SYSCALL_WRITE	0x2000004
%define	BUFFER_SIZE		42
%define	STDOUT			1

default	rel

extern	_ft_bzero
extern	_ft_strlen

section	.text

global	_ft_cat

_ft_cat:
	mov		[fd],		rdi				;save fd
	jmp		read

read:
	mov		rdx,		BUFFER_SIZE		;length (arg 3)
	lea		rsi,		[buff]			;buffer (arg 2)
	mov		rdi,		[fd]			;fd (arg 1)
	mov		rax,		SYSCALL_READ	;call write
	syscall

	jc		ret_over

	cmp		rax,		0
	jle		ret_over

	jmp		write

write:
	lea		rdi,		[buff]
	call	_ft_strlen

	mov		rdx,		rax				;length (arg 3)
	lea		rsi,		[buff]			;buffer (arg 2)
	mov		rdi,		STDOUT			;std output (arg 1)
	mov		rax,		SYSCALL_WRITE	;call write
	syscall

	jc		ret_over

	lea		rdi,		[buff]
	mov		rsi,		42
	call	_ft_bzero

	jmp		read

ret_over:
	ret

section	.data
	fd		dw			0

section	.bss
	buff	resb		BUFFER_SIZE
