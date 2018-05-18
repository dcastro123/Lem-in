# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mikim <mikim@student.42.us.org>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/10/29 23:38:02 by mikim             #+#    #+#              #
#    Updated: 2017/11/04 19:18:13 by dcastro-          ###   ########.fr       #
#                                                                              #
# **************************************************************************** #

SRC = main.c\
	  lem_in.c\
	  dijkstra.c\
	  store_handler.c\
	  room_handler.c\
	  link_handler.c\
	  path_handler.c\
	  queue_handler.c\
	  move_handler.c\
	  console_handler.c\
	  print_handler.c\
	  error_handler.c

OBJ = $(SRC:.c=.o)

SRCDIR = srcs
OBJDIR = objs
LIBDIR = libft

SRCS = $(addprefix $(SRCDIR)/, $(SRC))
OBJS = $(addprefix $(OBJDIR)/, $(OBJ))
LIBS = -L $(LIBDIR) -lft
HEADER = -I includes -I $(LIBDIR)/includes

CC = gcc
CFLAGS = -c -Wall -Wextra -Werror

NAME = lem_in

.PHONY: all clean fclean re
.SUFFIXES: .c .o

all: $(NAME)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	@$(CC) $(CFLAGS) $(HEADER) $< -o $@

$(NAME): $(OBJS)
	@make -C $(LIBDIR)
	@$(CC) $(OBJS) $(LIBS) -o $@

clean:
	@/bin/rm -rf $(OBJDIR)
	@make -C $(LIBDIR) clean
	@echo "[Lem_in - clean]"

fclean:
	@/bin/rm -rf $(OBJDIR)
	@/bin/rm -f $(NAME)
	@make -C $(LIBDIR) fclean
	@echo "[Lem_in - fclean]"

re: fclean all
