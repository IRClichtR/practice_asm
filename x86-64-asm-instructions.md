# Some useful references 

## Learn assembly free course on youtube
https://www.youtube.com/watch?v=yBO-EJoVDo0&list=PL2EF13wm-hWCoj6tUBGUmrkJmH1972dBB

Interesting youtube thread where you'll learn : 
- Binary operations
- Basic x86 architecture (32bits)
- Memory, Arithmetics, Logic and File manipulation
- Os Dev

## Very useful assembly tutorial repository
https://github.com/mschwartz/assembly-tutorial/tree/main


# Guide to x86-64 Assembly Instructions


## Register Basics

### General Purpose Registers (64-bit)
- **RAX** - Accumulator, used for operations and function return values
- **RBX** - Base register, preserved across function calls
- **RCX** - Counter register, 4th function argument
- **RDX** - Data register, 3rd function argument
- **RSI** - Source Index, 2nd function argument
- **RDI** - Destination Index, 1st function argument
- **RBP** - Base Pointer, frame reference
- **RSP** - Stack Pointer, points to current stack position
- **R8-R15** - Additional general-purpose registers (R8 and R9 are 5th and 6th function arguments)

### Register Parts
64-bit registers can be accessed partially:
- **RAX** (64 bits) → **EAX** (32 bits) → **AX** (16 bits) → **AH/AL** (8 bits)
- **RDI** (64 bits) → **EDI** (32 bits) → **DI** (16 bits) → **DIL** (8 bits low)
- **RSI** (64 bits) → **ESI** (32 bits) → **SI** (16 bits) → **SIL** (8 bits low)

## Data Movement Instructions

### MOV - Move Data
```nasm
mov dest, src  ; Copy src to dest
```
- Copies data from source to destination
- Examples:
  ```nasm
  mov rax, 42      ; Load immediate value 42 into RAX
  mov rax, rbx     ; Copy value from RBX to RAX
  mov rax, [rbx]   ; Load value at address in RBX into RAX
  mov [rax], rbx   ; Store value from RBX into memory at address in RAX
  mov al, byte [rdi] ; Load single byte from address in RDI into AL
  ```

### MOVZX - Move with Zero Extension
```nasm
movzx dest, src  ; Copy src to dest and zero-extend
```
- Copies smaller data to larger register, filling higher bits with zeros
- Useful for handling unsigned values
- Examples:
  ```nasm
  movzx eax, byte [rdi]  ; Load byte and zero-extend to 32 bits
  movzx rax, word [rsi]  ; Load 16-bit word and zero-extend to 64 bits
  ```

### MOVSX - Move with Sign Extension
```nasm
movsx dest, src  ; Copy src to dest and sign-extend
```
- Copies smaller data to larger register, extending the sign bit
- Used for handling signed values
- Example:
  ```nasm
  movsx eax, byte [rdi]  ; Load signed byte and sign-extend to 32 bits
  ```

## Arithmetic Instructions

### ADD - Addition
```nasm
add dest, src  ; dest = dest + src
```
- Adds source to destination, storing result in destination
- Examples:
  ```nasm
  add rax, 5     ; Add immediate 5 to RAX
  add rax, rbx   ; Add RBX to RAX
  add rax, [rbx] ; Add value at address in RBX to RAX
  ```

### SUB - Subtraction
```nasm
sub dest, src  ; dest = dest - src
```
- Subtracts source from destination, storing result in destination
- Examples:
  ```nasm
  sub rax, 5     ; Subtract immediate 5 from RAX
  sub rax, rbx   ; Subtract RBX from RAX
  sub eax, edx   ; Subtract EDX from EAX (32-bit operation)
  ```

### INC - Increment
```nasm
inc dest  ; dest = dest + 1
```
- Adds 1 to destination
- Example:
  ```nasm
  inc rax   ; Increment RAX by 1
  inc rdi   ; Increment RDI by 1
  ```

### DEC - Decrement
```nasm
dec dest  ; dest = dest - 1
```
- Subtracts 1 from destination
- Example:
  ```nasm
  dec rcx   ; Decrement RCX by 1
  ```

### MUL - Unsigned Multiplication
```nasm
mul src  ; RAX = RAX * src
```
- Multiplies RAX by source, result in RAX (lower bits) and RDX (upper bits)
- Example:
  ```nasm
  mov rax, 3
  mul rcx     ; Multiply RAX by RCX
  ```

### DIV - Unsigned Division
```nasm
div src  ; RAX = RDX:RAX / src, RDX = RDX:RAX % src
```
- Divides 128-bit value in RDX:RAX by source
- Quotient stored in RAX, remainder in RDX
- Example:
  ```nasm
  xor rdx, rdx  ; Clear RDX (important before division)
  mov rax, 10
  div rbx       ; Divide RAX by RBX
  ```

## Logical Instructions

### AND - Bitwise AND
```nasm
and dest, src  ; dest = dest & src
```
- Performs bitwise AND on each bit pair
- Example:
  ```nasm
  and rax, 0xFF  ; Keep only lower 8 bits of RAX
  ```

### OR - Bitwise OR
```nasm
or dest, src  ; dest = dest | src
```
- Performs bitwise OR on each bit pair
- Example:
  ```nasm
  or rax, 0x1    ; Set lowest bit of RAX
  ```

### XOR - Bitwise Exclusive OR
```nasm
xor dest, src  ; dest = dest ^ src
```
- Performs bitwise XOR on each bit pair
- Often used to clear registers (xor reg, reg)
- Examples:
  ```nasm
  xor rax, rax   ; Clear RAX to zero (faster than mov rax, 0)
  xor rax, 0xFF  ; Toggle lower 8 bits of RAX
  ```

### NOT - Bitwise NOT
```nasm
not dest  ; dest = ~dest
```
- Inverts all bits in destination
- Example:
  ```nasm
  not rax   ; Invert all bits in RAX
  ```

## Comparison and Conditional Instructions

### CMP - Compare
```nasm
cmp a, b  ; Compare a and b by computing (a - b)
```
- Compares two values by subtraction without storing the result
- Sets flags used by conditional jumps
- Examples:
  ```nasm
  cmp rax, 0         ; Compare RAX with 0
  cmp byte [rdi], 0  ; Compare byte at address in RDI with 0
  cmp al, dl         ; Compare character in AL with character in DL
  ```

### TEST - Test Bits
```nasm
test a, b  ; Test by computing (a & b)
```
- Performs a bitwise AND but only sets flags without saving result
- Commonly used to test if a value is zero
- Example:
  ```nasm
  test rax, rax   ; Test if RAX is zero (sets ZF if RAX is zero)
  ```

## Jump Instructions

### JMP - Unconditional Jump
```nasm
jmp label  ; Jump to label
```
- Always jumps to the specified label
- Example:
  ```nasm
  jmp .loop   ; Jump to label .loop
  ```

### Conditional Jumps
All conditional jumps evaluate flags set by previous instructions (usually CMP or TEST):

#### Equality/Zero-Based Jumps
```nasm
je label   ; Jump if Equal (ZF=1)
jne label  ; Jump if Not Equal (ZF=0)
jz label   ; Jump if Zero (ZF=1)
jnz label  ; Jump if Not Zero (ZF=0)
```

#### Unsigned Comparison Jumps
```nasm
ja label   ; Jump if Above (CF=0 and ZF=0)
jae label  ; Jump if Above or Equal (CF=0)
jb label   ; Jump if Below (CF=1)
jbe label  ; Jump if Below or Equal (CF=1 or ZF=1)
```

#### Signed Comparison Jumps
```nasm
jg label   ; Jump if Greater (ZF=0 and SF=OF)
jge label  ; Jump if Greater or Equal (SF=OF)
jl label   ; Jump if Less (SF≠OF)
jle label  ; Jump if Less or Equal (ZF=1 or SF≠OF)
```

#### Sign-Based Jumps
```nasm
js label   ; Jump if Sign (SF=1, result is negative)
jns label  ; Jump if Not Sign (SF=0, result is positive or zero)
```

## Stack Instructions

### PUSH - Push to Stack
```nasm
push src  ; Push src onto stack
```
- Decrements RSP and stores value at new stack top
- Examples:
  ```nasm
  push rax    ; Push RAX onto stack
  push 42     ; Push immediate value 42 onto stack
  ```

### POP - Pop from Stack
```nasm
pop dest  ; Pop value from stack to dest
```
- Retrieves value from stack top and increments RSP
- Example:
  ```nasm
  pop rbx     ; Pop value from stack into RBX
  ```

## Function Call Instructions

### CALL - Call Function
```nasm
call function  ; Push return address and jump to function
```
- Pushes address of next instruction and jumps to function
- Example:
  ```nasm
  call ft_strlen   ; Call ft_strlen function
  ```

### RET - Return from Function
```nasm
ret  ; Pop return address and jump to it
```
- Pops return address from stack and jumps to it
- Example:
  ```nasm
  ret     ; Return to caller
  ```

## Section Directives

### SECTION - Define Code/Data Section
```nasm
section .text   ; Code section
section .data   ; Initialized data section
section .bss    ; Uninitialized data section
```

### GLOBAL - Export Symbol
```nasm
global symbol_name  ; Make symbol visible to linker
```
- Makes a symbol (function or variable) accessible outside the file
- Example:
  ```nasm
  global ft_strlen  ; Make ft_strlen function visible
  ```

## Common Assembly Patterns

### String Length (strlen) Implementation
```nasm
ft_strlen:
    xor rax, rax        ; Initialize counter to 0
    
.loop:
    cmp byte [rdi], 0   ; Check if current byte is null
    je .done            ; If null, we're done
    inc rax             ; Increment counter
    inc rdi             ; Move to next character
    jmp .loop           ; Continue loop
    
.done:
    ret                 ; Return length in RAX
```

### String Compare (strcmp) Implementation
```nasm
ft_strcmp:
    .loop:
        movzx eax, byte [rdi]    ; Load char from first string
        movzx edx, byte [rsi]    ; Load char from second string
        cmp al, 0                ; Check if end of first string
        je .end                  ; If yes, we're done
        cmp al, dl               ; Compare characters
        jne .end                 ; If different, we're done
        inc rdi                  ; Move to next char in first string
        inc rsi                  ; Move to next char in second string
        jmp .loop                ; Continue loop
    .end:
        sub eax, edx             ; Return difference between chars
        ret
```

## x86-64 Calling Convention Summary

1. First 6 integer/pointer arguments passed in: RDI, RSI, RDX, RCX, R8, R9
2. Additional arguments passed on the stack
3. Return value stored in RAX
4. Caller-saved registers: RAX, RCX, RDX, RSI, RDI, R8-R11
5. Callee-saved registers: RBX, RBP, R12-R15, RSP

## Tips and Best Practices

1. Always zero out registers before using them for counting (e.g., `xor rax, rax`)
2. When reading from memory, be explicit about size (byte, word, dword, qword)
3. For character/byte manipulation, use the appropriate register parts (AL, DIL, etc.)
4. Mind the calling convention when writing functions
5. Before division, clear RDX to avoid division errors
6. Use clear labels and comments to make your assembly code more readable
7. Follow through your code's execution path mentally to verify correctness

## Common Mistakes to Avoid

1. Forgetting to initialize registers
2. Using the wrong register size for the data being manipulated
3. Not preserving callee-saved registers
4. Improper stack alignment (must be 16-byte aligned before calls)
5. Direct memory-to-memory operations (not allowed in x86)
6. Using conditional jumps without setting flags first
7. Subtracting from the wrong register in comparison functions
