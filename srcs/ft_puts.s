%define	SYSCALL_WRITE	0x2000004
%define	STDOUT			1

default	rel

extern	_ft_strlen

section	.data
	endl:	db			0xa, 0
	null:	db			"(null)", 0

section	.text

global	_ft_puts
global	_ft_puts_fd

_ft_puts:
	mov		rsi,		STDOUT
	jmp		_ft_puts_fd

_ft_puts_fd:
	push	rsi							;save fd
	mov		rbx,		rdi				;backup ptr

	cmp		rbx,		byte 0			;return null
	je		ret_eof

	call	_ft_strlen
	pop		rcx							;restore fd
	mov		rsi,		0
	push	rsi							;ret
	push	rcx							;save fd

	cmp		rax,		0				;length = 0
	je		ret_endl
	pop		rcx							;restore fd
	pop		rsi							;delete ret
	push	rcx							;save fd

	mov		rcx,		1				;ret
	pop		rdx
	push	rcx
	push	rdx

	mov		rdx,		rax				;length
	mov		rsi,		rbx				;ptr
	jmp		write

write:
	pop		rdi							;select fd (arg 1)
	push	rdi
	mov		rax,		SYSCALL_WRITE	;addr write
	syscall

	jmp		ret_endl

ret_endl:
	lea		rsi,		[endl]			;ptr
	mov		rdx,		1				;length
	pop		rdi							;select fd (arg 1)
	mov		rax,		SYSCALL_WRITE	;addr write
	syscall

	pop		rax
	ret

ret_eof:
	lea		rsi,		[null]			;ptr
	mov		rdx,		6				;length

	mov		rcx,		-1				;ret

	pop		rdi
	push	rcx
	push	rdi

	jmp		write
