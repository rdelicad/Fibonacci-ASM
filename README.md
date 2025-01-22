¡Claro! Aquí tienes un **README.md** en inglés para tu proyecto de Fibonacci en ensamblador. Puedes copiarlo y pegarlo directamente en tu repositorio de GitHub:

```markdown
# Fibonacci Sequence in Assembly

This project is a simple Assembly program that calculates and prints the Fibonacci sequence up to a user-defined maximum value. It demonstrates the use of system calls (`syscall`), external functions from `libc` (like `printf` and `scanf`), and basic Assembly programming concepts.

---

## Features

- **Interactive Input**: The program asks the user to input a maximum number (`max Fn`) and prints all Fibonacci numbers less than that value.
- **Dynamic Linking**: Uses `libc` functions (`printf` and `scanf`) for input/output operations.
- **Efficient Code**: Written in x86_64 Assembly, optimized for performance.

---

## Requirements

- **NASM**: Netwide Assembler (to assemble the `.s` file).
- **LD**: GNU Linker (to link the object file with `libc`).
- **Linux**: The program is designed for Linux systems.

---

## How to Build and Run

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/fibonacci-assembly.git
   cd fibonacci-assembly
   ```

2. **Build the program**:
   ```bash
   make
   ```

3. **Run the program**:
   ```bash
   ./fib
   ```

4. **Clean up**:
   - Remove object files:
     ```bash
     make clean
     ```
   - Remove object files and the executable:
     ```bash
     make fclean
     ```
   - Rebuild the program from scratch:
     ```bash
     make re
     ```

---

## Example Output

```bash
$ ./fib
Please input max Fn: 
100
1
1
2
3
5
8
13
21
34
55
89
```

---

## Code Structure

- **`fib.s`**: The main Assembly source code.
- **`Makefile`**: Automates the build process.
  - `make`: Builds the program.
  - `make clean`: Removes object files.
  - `make fclean`: Removes object files and the executable.
  - `make re`: Rebuilds the program from scratch.

---

## Key Concepts

1. **System Calls**:
   - The program uses `syscall` for low-level operations like writing to the console and exiting the program.

2. **External Functions**:
   - `printf` and `scanf` from `libc` are used for formatted input/output.

3. **Stack Alignment**:
   - Ensures the stack is properly aligned before calling external functions.

4. **Dynamic Linking**:
   - The program is dynamically linked with `libc` for access to standard C functions.

---