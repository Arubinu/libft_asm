/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: apergens <apergens@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2013/09/26 04:36:20 by apergens          #+#    #+#             */
/*   Updated: 2015/02/14 17:26:56 by apergens         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
# define LIBFTS_H
# include <stdlib.h>
# include <string.h>
# include <unistd.h>

/*
** Special LibFT ASM
*/

int		ft_puts(const char *str);
void	ft_cat(int fd);
void	ft_exit(int exit_code);

/*
** Makes zero a predefined number of characters
*/

void	ft_bzero(void *s, size_t n);
int		ft_isalnum(int c);
int		ft_isalpha(int c);
int		ft_isascii(int c);
int		ft_isdigit(int c);
int		ft_isgraph(int c);
int		ft_islower(int c);
int		ft_isprint(int c);
int		ft_ispunct(int c);
int		ft_isupper(int c);
int		ft_isxdigit(int c);

/*
** Count the number of characters in a string
*/

size_t	ft_strlen(const char *s);

/*
** Copying a memory space to another
*/

void	*ft_memcpy(void *s1, const void *s2, size_t n);

/*
** Replaces a character by the number of desired
*/

void	*ft_memset(void *b, int c, size_t len);

/*
** Concatenation of character strings
*/

char	*ft_strcat(char *s1, const char *s2);

/*
** Compare two string and returns the difference
*/

int		ft_strcmp(const char *s1, const char *s2);

/*
** Copy a string in another
*/

char	*ft_strcpy(char *s1, const char *s2);

/*
** Duplicating a character string
*/

char	*ft_memdup(const char *s1, size_t size);
char	*ft_strdup(const char *s1);

/*
** Convert uppercase to lowercase and vice versa
*/

int		ft_tolower(int c);
int		ft_toupper(int c);

/*
** Allocates a memory space or destroyed
*/

void	*ft_memalloc(size_t size);

/*
** Create a character string, the empty or destroyed
*/

char	*ft_strnew(size_t size);

/*
** Writing a string in the console
*/

void	ft_putstr(const char *s);
void	ft_putstr_fd(const char *s, int fd);
void	ft_putendl(const char *s);
void	ft_putendl_fd(const char *s, int fd);

/*
** Writing a character in the console
*/

void	ft_putchar(char c);
void	ft_putchar_fd(char c, int fd);

#endif
