section	.text

global	_ft_tolower

_ft_tolower:
	mov		al,			dil			;backup char

	cmp		al,			65			;letter a
	jl		ret_over
	cmp		al,			90			;letter z
	jg		ret_over
	add		al,			32

ret_over:
	ret
