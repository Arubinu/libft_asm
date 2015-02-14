section	.text

global	_ft_toupper

_ft_toupper:
	mov		al,			dil			;backup char

	cmp		al,			97			;letter a
	jl		ret_over
	cmp		al,			122			;letter z
	jg		ret_over
	sub		al,			32

ret_over:
	ret
