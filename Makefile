NAME = libasm.a

MANDATORY_DIR = mandatory
BONUS_DIR = bonus

SRCS = \
	$(MANDATORY_DIR)/ft_strlen.s \
	$(MANDATORY_DIR)/ft_strcpy.s \
	$(MANDATORY_DIR)/ft_strcmp.s \
	$(MANDATORY_DIR)/ft_write.s \
	$(MANDATORY_DIR)/ft_read.s \
	$(MANDATORY_DIR)/ft_strdup.s
OBJS = $(SRCS:.s=.o)

BONUS_SRCS = \
	$(BONUS_DIR)/ft_list_size.s \
	$(BONUS_DIR)/ft_list_push_front.s \
	$(BONUS_DIR)/ft_list_sort.s \
	$(BONUS_DIR)/ft_list_remove_if.s
BONUS_OBJS = $(BONUS_SRCS:.s=.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror

ASM = nasm
ASFLAGS = -f elf64




# Rules for building the project
all: $(NAME)

$(NAME): $(OBJS)
	$(ASM) $(ASFLAGS) $@ $^

bonus: $(OBJS) $(BONUS_OBJS)
	$(ASM) $(ASFLAGS) $(NAME) $^

%.o: %.s
	$(ASM) $(ASFLAGS) $< -o $@

clean:
	rm -f $(OBJS) $(BONUS_OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

test: $(NAME)
	$(CC) $(CFLAGS) ./test/test.c -L. -lasm 

.PHONY: all bonus clean fclean re

help:
	@echo "Available targets:"
	@echo "  all     : Build the main library with mandatory functions"
	@echo "  bonus   : Build the library including bonus functions"
	@echo "  clean   : Remove object files"
	@echo "  fclean  : Remove object files and library"
	@echo "  re      : Rebuild everything"
	@echo "  test    : Build a test program (requires main.c)"
	@echo "  help    : Show this help message"
