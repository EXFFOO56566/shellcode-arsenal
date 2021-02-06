format elf executable
entry start

start:
    ; Save all registers
    pushad

    ; Save frame pointer
    push ebp
    mov ebp, esp

    ; NULL terminator
    xor eax, eax
    push eax

    ; New line
    sub esp, 1
    mov byte[esp], 0ah

    push 21646c72h
    push 6f77206fh
    push 6c6c6548h
    ; "Hello world!\n\0"
    ; 14 bytes

    ; Print
    mov edx, 14
    lea ecx, [esp]
    mov ebx, 1
    mov eax, 4
    int 0x80

    add esp, 14 ; Clear the stack

    mov esp, ebp
    pop ebp

    popad
