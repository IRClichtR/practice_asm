global ft_strdup
    global ft_strdup
    extern ft_strcpy
    extern ft_strlen
    extern malloc
    extern __errno_location

ft_strdup:
    push rdi
    call ft_strlen
    inc rax ; add 1 to the length of the string
    mov rdi, rax
    call malloc WRT ..plt
    test rax, rax
    jz .error
    mov rdi, rax
    pop rsi

    call ft_strcpy
    ret

.error
    pop rdi ; pop the return address
    call __errno_location WRT ..plt
    mov dword [rax], 12 ; set errno to ENOMEM
    xor rax, rax
    ret