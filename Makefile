# Makefile for Fibonacci Assembly Program

ASM = nasm
LD = ld
ASM_FLAGS = -f elf64
LD_FLAGS = -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2
TARGET = fib
SRC = fib.s
OBJ = $(SRC:.s=.o)

all: $(TARGET)

%.o: %.s
	$(ASM) $(ASM_FLAGS) $< -o $@

$(TARGET): $(OBJ)
	$(LD) $< -o $@ $(LD_FLAGS)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(TARGET)

re: fclean all

.PHONY: all clean fclean re