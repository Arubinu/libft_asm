%define	SYSCALL_WRITE		0x2000004
%define	STDOUT				1

default	rel

extern	_ft_strlen

section	.data
	char:	db				0, 0

section	.text

global	_ft_putchar
global	_ft_putchar_fd

_ft_putchar:
	mov		rsi,			STDOUT
	jmp		_ft_putchar_fd

_ft_putchar_fd:
	push	rsi								;save fd
	mov		[char],			rdi

	mov		rdx,			rax				;length (arg 3)
	lea		rsi,			[char]
	pop		rdi								;restore fd (arg 1)
	mov		rax,			SYSCALL_WRITE	;call write
	syscall

	ret
