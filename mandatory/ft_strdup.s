section .text
    global ft_strdup
    extern ft_strlen
    extern malloc
    extern __errno_location

ft_strdup:
    mov rdi, rax
    call ft_strlen
    mov rax, rsi
    ret
.error
    neg rax
    call __errno_location WRT ..plt
    mov [rax], rdi
    mov rax, -1
    ret