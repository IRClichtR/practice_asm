section .text
    global ft_read
    extern __errno_location
ft_read:
    mov rax, 0
    syscall
    test rax, rax
    js .error
    ret
.error:
    neg rax
    mov rdi, rax
    call __errno_location WRT ..plt ; relocate the call to __errno_location in the PLT
    mov [rax], rdi
    mov rax, -1
    ret
 