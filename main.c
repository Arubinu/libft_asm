/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: apergens <apergens@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/01/31 16:20:10 by apergens          #+#    #+#             */
/*   Updated: 2015/02/14 17:35:52 by apergens         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libfts.h>

#include <fcntl.h>
#include <stdio.h>

int		specialchar(int c)
{
	c = (c == '\f') ? 'f' : c;
	c = (c == '\r') ? 'r' : c;
	c = (c == '\t') ? 't' : c;
	c = (c == '\v') ? 'v' : c;
	return (c);
}

void	printstr(char *str, int endl)
{
	int		i;
	char	*cpy;

	i = -1;
	cpy = str ? strdup(str) : str;
	while (cpy && cpy[++i])
		cpy[i] = specialchar(cpy[i]);
	if (endl)
	{
		i = ft_puts(cpy);
		if (i < 0)
			printf("ft_puts(%d) error...", i);
	}
	else
		ft_putstr(cpy);
	if (str)
		free(cpy);
	return ;
}

void	callasm(char *name, char *str, int (*f)(int), int echo)
{
	char	c[2];
	char	print[128];

	c[1] = '\0';
	sprintf(print, "%s:\n  str = %s\n  ret = ", name, str);
	printstr(print, 0);
	while (*str)
	{
		c[0] = f(*str);
		c[0] = specialchar(c[0]);
		if (*str == ' ' &&  *(str + 1) == ' ')
		{
			printstr("  ", 0);
			++str;
		}
		else if (echo)
			printstr(c, 0);
		else
			ft_putchar(f(*str) ? '1' : '0');
		++str;
	}
	printstr("\n", 1);
	return ;
}

void	callputs(char *str)
{
	char	print[128];

	printstr("ft_puts:\n  null = ", 0);
	printstr(NULL, 1);
	printstr("  str = ", 0);
	sprintf(print, "%s\n", str);
	printstr(print, 1);
	return ;
}

void	callbzero(char *str)
{
	size_t	len;
	char	*ptr;
	char	print[128];

	len = strlen(str);
	ptr = strdup(str);
	bzero(ptr, len);
	sprintf(print, "ft_bzero:\n  org = %lu --> %lu [ %s ]\n", len, strlen(ptr), ptr[1] ? "ERROR" : "OK");
	printstr(print, 0);
	free(ptr);
	ptr = strdup(str);
	ft_bzero(ptr, len);
	sprintf(print, "  ret = %lu --> %lu [ %s ]\n", len, strlen(ptr), ptr[1] ? "ERROR" : "OK");
	printstr(print, 1);
	free(ptr);
	return ;
}

void	callstrcat(char *str)
{
	char	*ptr;
	char	print[128];

	ptr = malloc(sizeof(char) * 50);
	bzero(ptr, 50);
	ft_strcat(ptr, str);
	sprintf(print, "ft_strcat:\n  org = %s\n  ret = %s\n", str, ptr);
	printstr(print, 1);
	free(ptr);
}

void	callmemset(char *str, int c)
{
	size_t	len;
	char	*optr;
	char	*rptr;
	char	print[128];

	len = strlen(str);
	optr = strdup(str);
	rptr = strdup(str);
	memset((void *)optr, c, len);
	ft_memset((void *)rptr, c, len);
	sprintf(print, "ft_memset:\n  org = %s\n  ret = %s\n", optr, rptr);
	printstr(print, 1);
	free(optr);
	free(rptr);
	return ;
}

void	callmemcpy(char *str)
{
	size_t	len;
	char	*optr;
	char	*rptr;
	char	print[128];

	len = strlen(str);
	optr = malloc(sizeof(char) * (len + 42));
	rptr = malloc(sizeof(char) * (len + 42));
	bzero(optr, len + 42);
	bzero(rptr, len + 42);
	memcpy((void *)optr, (void *)str, len);
	ft_memcpy((void *)rptr, (void *)str, len);
	sprintf(print, "ft_memcpy:\n  org = %s\n  ret = %s\n", optr, rptr);
	printstr(print, 1);
	free(optr);
	free(rptr);
	return ;
}

void	callstrcpy(char *str)
{
	size_t	len;
	char	*optr;
	char	*rptr;
	char	print[128];

	len = strlen(str);
	optr = malloc(sizeof(char) * (len + 42));
	rptr = malloc(sizeof(char) * (len + 42));
	bzero(optr, len + 42);
	bzero(rptr, len + 42);
	strcpy(optr, str);
	ft_strcpy(rptr, str);
	sprintf(print, "ft_strcpy:\n  org = %s\n  ret = %s\n", optr, rptr);
	printstr(print, 1);
	free(optr);
	free(rptr);
	return ;
}

void	callstrdup(char *str)
{
	char	*optr;
	char	*rptr;
	char	print[128];

	optr = strdup(str);
	rptr = ft_strdup(str);
	sprintf(print, "ft_strdup:\n  org = %s\n  ret = %s\n", optr, rptr);
	printstr(print, 1);
	free(optr);
	free(rptr);
	return ;
}

void	displaypart1(char *str)
{
	printstr("\n/****************************************/", 1);
	printstr("/**************** Part 1 ****************/", 1);
	printstr("/****************************************/\n", 1);
	callbzero(str);
	callstrcat(str);
	callasm("ft_isalpha", str, ft_isalpha, 0);
	callasm("ft_isdigit", str, ft_isdigit, 0);
	callasm("ft_isalnum", str, ft_isalnum, 0);
	callasm("ft_isascii", str, ft_isascii, 0);
	callasm("ft_isprint", str, ft_isprint, 0);
	callasm("ft_toupper", str, ft_toupper, 1);
	callasm("ft_tolower", str, ft_tolower, 1);
	callputs(str);
	return ;
}

void	displaypart2(char *str)
{
	char	print[128];

	printstr("\n/****************************************/", 1);
	printstr("/**************** Part 2 ****************/", 1);
	printstr("/****************************************/\n", 1);
	sprintf(print, "ft_strlen:\n  org = %lu\n  ret = %lu\n", strlen(str), ft_strlen(str));
	printstr(print, 1);
	callmemset(str, '#');
	callmemcpy(str);
	callstrdup(str);
	return ;
}

void	displaypart3(void)
{
	printstr("\n/****************************************/", 1);
	printstr("/**************** Part 3 ****************/", 1);
	printstr("/****************************************/\n", 1);
	printstr("ft_cat:\n  stdin    = ", 0);
	ft_cat(0);
	printstr("\n  65465    = ", 0);
	ft_cat(65465);
	printstr("\n  __FILE__ v\n", 0);
	ft_cat(open(__FILE__, O_RDONLY));
	printstr("\n", 1);
	return ;
}

void	displaybonus(char *str)
{
	char	*ptr;

	printstr("\n/****************************************/", 1);
	printstr("/**************** Bonus *****************/", 1);
	printstr("/****************************************/\n", 1);
	callasm("ft_isupper", str, ft_isupper, 0);
	callasm("ft_islower", str, ft_islower, 0);
	callasm("ft_isgraph", str, ft_isgraph, 0);
	callasm("ft_ispunct", str, ft_ispunct, 0);
	callasm("ft_isxdigit", str, ft_isxdigit, 0);
	callstrcpy(str);
	printstr("other functions:", 1);
	ptr = ft_strnew(42);
	ft_strcpy(ptr, "  ft_strnew");
	printstr(ptr, 1);
	free(ptr);
	ptr = ft_memalloc(42);
	ft_strcpy(ptr, "  ft_memalloc");
	printstr(ptr, 1);
	free(ptr);
	ptr = ft_memdup("  ft_memdup", 42);
	printstr(ptr, 1);
	free(ptr);
	printstr("  ft_putchar\n  ft_putchar_fd\n", 0);
	printstr("  ft_putstr\n  ft_putstr_fd\n", 0);
	printstr("  ft_putendl\n  ft_putendl_fd\n", 1);
	return ;
}

int		main(int argc, char **argv)
{
	char	str[] = "@AGZ` [sdx{  /0123456789: *$  \f\r\t\v";

	if (!--argc || argc != 1 || argv[1][0] == '\0' || argv[1][1] != '\0'
		|| argv[1][0] < '1' || argv[1][0] > '4')
	{
		ft_putstr_fd("usage: ./debug [ 1 | 2 | 3 | 4 ]\n", STDERR_FILENO);
		ft_putstr_fd("( 1 = Part 1 | 2 = Part 2 | 3  = Part 3 | 4 = Bonus )\n\n", STDERR_FILENO);
		return (21);
	}
	if (argv[1][0] == '1')
		displaypart1(str);
	else if (argv[1][0] == '2')
		displaypart2(str);
	else if (argv[1][0] == '3')
		displaypart3();
	else if (argv[1][0] == '4')
		displaybonus(str);
	ft_putstr_fd("\nft_cat( auteur ): \t", STDERR_FILENO);
	ft_cat(open("auteur", O_RDONLY));
	ft_exit(42);
	printstr("No exit here ...", 1);
	return (0);
}
