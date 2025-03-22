NAME = libasm.a

MANDATORY_DIR = mandatory
BONUS_DIR = bonus
OBJ_DIR = .obj

SRCS = \
	$(MANDATORY_DIR)/ft_strlen.s \
	$(MANDATORY_DIR)/ft_strcpy.s \
	$(MANDATORY_DIR)/ft_strcmp.s \
	$(MANDATORY_DIR)/ft_write.s \
	$(MANDATORY_DIR)/ft_read.s \
	$(MANDATORY_DIR)/ft_strdup.s
OBJS = $(patsubst %.s,$(OBJ_DIR)/%.o,$(SRCS))

BONUS_SRCS = \
	$(BONUS_DIR)/ft_list_size.s \
	$(BONUS_DIR)/ft_list_push_front.s \
	$(BONUS_DIR)/ft_list_sort.s \
	$(BONUS_DIR)/ft_list_remove_if.s
BONUS_OBJS = $(patsubst %.s,$(OBJ_DIR)/%.o,$(BONUS_SRCS))

CC = gcc
CFLAGS = -Wall -Wextra -Werror

ASM = nasm
ASFLAGS = -f elf64

AR = ar 
ARFLAGS = rcs



# Rules for building the project
all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

bonus: $(OBJS) $(BONUS_OBJS)
	$(AR) $(ARFLAGS) $(NAME) $^

$(OBJ_DIR)/%.o: %.s
	@echo "Compiling $< into $@"
	@mkdir -p $(dir $@)
	$(ASM) $(ASFLAGS) $< -o $@

clean:
	rm -f $(OBJS) $(BONUS_OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

test: $(NAME)
	$(CC) $(CFLAGS) ./test/test.c -L. -lasm -o test_program

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
	@echo "  debug	 : Show the value of some variables"

debug:
	@echo "=== Source Files ==="
	@echo "SRCS = $(SRCS)"
	@echo ""
	@echo "=== Object Files ==="
	@echo "OBJS = $(OBJS)"
	@echo ""
	@echo "=== Bonus Source Files ==="
	@echo "BONUS_SRCS = $(BONUS_SRCS)"
	@echo ""
	@echo "=== Bonus Object Files ==="
	@echo "BONUS_OBJS = $(BONUS_OBJS)"
	@echo ""
	@echo "=== Commands ==="
	@echo "ASM = $(ASM)"
	@echo "ASFLAGS = $(ASFLAGS)"
	@echo "AR = $(AR)"
	@echo "ARFLAGS = $(ARFLAGS)"