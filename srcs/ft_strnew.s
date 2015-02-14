extern	_ft_memalloc

section	.text

global	_ft_strnew

_ft_strnew:
	call	_ft_memalloc
	ret
