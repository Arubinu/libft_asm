# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: apergens <apergens@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/09/25 08:56:14 by apergens          #+#    #+#              #
#    Updated: 2015/02/14 16:59:58 by apergens         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LIBNAME	= fts
BUGNAME	= debug
NAME	= lib$(LIBNAME).a

DIRS	= srcs
DIRO	= objs
DIRI	= incs

SRC		= ft_isalpha ft_isdigit ft_isascii ft_isalnum ft_isprint \
	ft_toupper ft_tolower ft_bzero ft_puts \
	ft_strcat ft_strlen ft_strdup ft_memset ft_memcpy \
	ft_cat ft_exit ft_strnew ft_strcpy ft_putstr ft_memalloc ft_memdup \
	ft_isupper ft_islower ft_isgraph ft_ispunct ft_isxdigit \
	ft_putchar ft_putendl
OBJ		= $(patsubst %,$(DIRO)/%.o,$(SRC))

MORE	= $(DIRO)/main.o

FLAGS	= -Wall -Wextra -Werror -pedantic -ansi

CLR0	= \033[0m
CLR1	= \033[32m
CLR2	= \033[1;31m
CLR4	= \033[1;30m
CLR5	= \033[33m

PUCE0	= $(CLR4) ¤
PUCE1	= $(CLR4) -> $(CLR5)
F_INFOS = \
	echo "$(PUCE1)binaire     : $(CLR0)$(NAME)"; \
	echo "$(PUCE1)compilateur : $(CLR0)$(CC)"; \
	echo "$(PUCE1)extra-flags : $(CLR0)$(FLAGS)";
#	echo "$(PUCE1)librairies  : $(CLR0)$(LNAME)";

ifdef DEBUG
    FLAGS	+= -g3
else
#    FLAGS	+= -O3
endif

all: print $(NAME)

$(NAME): print $(OBJ)
	@echo "$(PUCE0)$(CLR1) Compilation du binaire : $(CLR0)$(NAME)$(CLR0)"; \
		sleep 1
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

debug: all $(MORE) $(NAME)
	@echo "$(PUCE0)$(CLR1) Compilation du debug : $(CLR0)$(BUGNAME)$(CLR0)"; \
		sleep 1
	gcc $(FLAGS) -I $(DIRI) -L . -l $(LIBNAME) $(MORE) -o $(BUGNAME)
	clear
	./$(BUGNAME) $(TYPE); echo "exit_code: \t\t$$?"

$(DIRO)/%.o: $(DIRS)/%.s
	mkdir -p $(DIRO)
	nasm -f macho64 $< -o $@

$(DIRO)/%.o: %.c
	gcc $(FLAGS) -I $(DIRI) -L . -l $(LIBNAME) -c $< -o $@

clean: print
	@echo "$(PUCE0)$(CLR2) Suppression des objets ...$(CLR0)" && \
		sleep 1
	$(RM) $(OBJ) $(MORE)
	$(RM) -r $(DIRO)

fclean: clean
	@test -f "$(NAME)" && \
		echo "$(PUCE0)$(CLR2) Suppression du binaire : $(CLR0)$(NAME)$(CLR0)"; \
		sleep 1;
	$(RM) $(NAME)
	@test -f "$(BUGNAME)" && \
		echo "$(PUCE0)$(CLR2) Suppression du debug : $(CLR0)$(BUGNAME)$(CLR0)"; \
		sleep 1
	$(RM) $(BUGNAME)

re: fclean all

print:
	@if [ "$($_INFOS)" != "OK" ]; then $(call F_INFOS) $(eval $_INFOS :=OK) fi;

.PHONY: all clean fclean re debug print
.SILENT: all clean fclean re debug print $(NAME) $(OBJ) $(MORE)
