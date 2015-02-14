extern	_ft_puts
extern	_ft_puts_fd

section	.text

global	_ft_putendl
global	_ft_putendl_fd

_ft_putendl:
	call	_ft_puts
	ret

_ft_putendl_fd:
	call	_ft_puts_fd
	ret
