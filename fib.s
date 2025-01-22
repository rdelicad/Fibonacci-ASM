global  _start
extern  printf, scanf       ; Import functions from libc

section .data
    message db "Please input max Fn: ", 0x0a  ; Prompt message for user
    outFormat db  "%d", 0x0a, 0x00           ; Output format: "number\n"
    inFormat db  "%d", 0x00                  ; Input format: "%d"

section .bss
    userInput resq 1       ; Buffer for user input (8 bytes for 64-bit)

section .text
_start:
    call printMessage      ; 1. Display initial message
    call getInput          ; 2. Read user input
    call initFib           ; 3. Initialize Fibonacci values
    call loopFib           ; 4. Calculate and print sequence
    call Exit              ; 5. Exit the program

printMessage:
    ; Syscall write to print the message
    mov rax, 1             ; write
    mov rdi, 1             ; stdout
    mov rsi, message
    mov rdx, 19            ; Length of the message
    syscall
    ret

getInput:
    sub rsp, 8             ; Align stack to 16 bytes
    mov rdi, inFormat      ; Input format "%d"
    mov rsi, userInput     ; Where to store the number
    call scanf             ; Call scanf
    add rsp, 8             ; Restore stack alignment
    ret

initFib:
    ; Initialize values: rax=0, rbx=1
    xor rax, rax
    xor rbx, rbx
    inc rbx
    ret

printFib:
    push rax               ; Save registers to stack
    push rbx
    mov rdi, outFormat     ; Output format "%d\n"
    mov rsi, rbx           ; Number to print
    call printf            ; Call printf
    pop rbx                ; Restore registers
    pop rax
    ret

loopFib:
    call printFib          ; Print current number
    add rax, rbx           ; Calculate next number
    xchg rax, rbx          ; Swap values (rax <-> rbx)
    cmp rbx, [userInput]   ; Is rbx < user input?
    js loopFib             ; If yes, repeat
    ret

Exit:
    ; Syscall exit
    mov rax, 60
    xor rdi, rdi           ; Exit code 0
    syscall