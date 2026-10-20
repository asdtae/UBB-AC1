; Mathe Ruben-Jonathan
; mrim2578
; 511
;
; Lab 1 / 09
; B. feladat
; ha d mod 4 = 0 : b + (c mod a);
; ha d mod 4 = 1 : c + (3 * a);
; ha d mod 4 = 2 : (a + b) div 5;
; ha d mod 4 = 3 : 4 * (9 + c);
;

%include 'io.inc'

global main

section .text

main:
    ; jelenjen meg a képernyőn a feladat
        mov rax, str_felhivoLab
        call io_writestr
        call io_writeln
        mov rax, str_felhivoFel
        call io_writestr
        call io_writeln


    ; jelenjen meg a képernyőn a feladat
        ; read A
        mov rax, str_felhivoA
        call io_writestr
        call io_readint         ; read a
        cdqe                    ; sign-extend
        push rax                ; push a
        
        ; read B
        mov rax, str_felhivoB
        call io_writestr
        call io_readint         ; read b
        cdqe                    ; sign-extend
        push rax                ; push b

        ; read C
        mov rax, str_felhivoC
        call io_writestr
        call io_readint         ; read c
        cdqe                    ; sign-extend
        push rax                ; push c

        ; read D
        mov rax, str_felhivoD
        call io_writestr
        call io_readint         ; read d
        cdqe                    ; sign-extend
        
    ; determine path
        xor rcx, rcx            ; clear ecx
        mov rcx, 4              ; mov 4 to ecx
        cqo                     ; prep idiv
        idiv rcx                ; d % 4
        xor rax, rax            ; clear eax
        mov rax, rdx            ; mov d % 4 to eax
        cmp rax, 0              ; d % 4 = 0 
        je .pathA               ;
        cmp rax, 1              ; d % 4 = 1
        je .pathB               ;
        cmp rax, 2              ; d % 4 = 2
        je .pathC               ;
        cmp rax, 3              ; d % 4 = 3
        je .pathD               ;

    ; calc path A -- b + (c mod a)
    .pathA:
        mov rax, str_felhivoSzA
        call io_writestr
        pop rax                 ; pop c
        mov rbx, rax            ; mov c to ebx from eax
        pop rax                 ; pop b
        mov r8, rax             ; mov b to r8d from eax
        pop rax                 ; pop a
        mov rcx, rax            ; mov a to ecx from eax
        mov rax, rbx            ; mov c to eax from ebx
        cqo                     ; prep idiv
        idiv rcx                ; c % a
        mov rax, rdx            ; mov c % a to eax from edx
        xor rcx, rcx            ; clear ecx
        xor rbx, rbx            ; clear ebx
        add rax, r8             ; calc ress
        push rax                ; push ress
        xor r8, r8              ; clear r8d
        xor rax, rax            ; clear eax
        jmp .pathDone

    ; calc path B -- c + (3 * a)
    .pathB:
        mov rax, str_felhivoSzB
        call io_writestr
        pop rax                 ; pop c
        mov rbx, rax            ; mov c to ebx from eax
        pop rax                 ; pop b
        pop rax                 ; pop a
        imul rax, 3             ; a * 3
        add rax, rbx            ; calc ress
        push rax                ; push ress
        xor rbx, rbx            ; clear ebx
        xor rax, rax            ; clear eax
        jmp .pathDone

    ; calc path C -- (a + b) div 5
    .pathC:
        mov rax, str_felhivoSzC
        call io_writestr
        pop rax                 ; pop c
        pop rax                 ; pop b
        mov rbx, rax            ; mov b to ebx from eax
        pop rax                 ; pop a
        add rax, rbx            ; a + b
        mov rcx, 5              ; mov 5 to ecx
        cqo                     ; prep idiv
        idiv rcx                ; calc ress
        push rax                ; push ress
        xor rcx, rcx            ; clear ecx
        xor rbx, rbx            ; clear ebx
        xor rax, rax            ; clear eax
        jmp .pathDone

    ; calc path D -- 4 * (9 + c)
    .pathD:
        mov rax, str_felhivoSzD
        call io_writestr
        pop rax                 ; pop c
        mov rbx, rax            ; mov c to ebx from eax
        pop rax                 ; pop b
        pop rax                 ; pop a
        add rbx, 9              ; c + 9
        imul rbx, 4             ; calc ress
        mov rax, rbx            ; mov ress to eax from ebx
        push rax                ; push ressp
        xor rbx, rbx            ; clear ebx
        xor rax, rax            ; clear eax

    .pathDone:
        pop rax                 ; pop eax
        call io_writeint
        call io_writeln

    ; return success to the C runtime
    xor rax, rax
    ret

section .data
    str_felhivoLab db 'Lab 1 / 09', 0
    str_felhivoFel db 'B. feladat', 0
    str_felhivoA db 'A = ', 0
    str_felhivoB db 'B = ', 0
    str_felhivoC db 'C = ', 0
    str_felhivoD db 'D = ', 0
    str_felhivoSzA db 'b + (c mod a) = ', 0
    str_felhivoSzB db 'c + (3 * a) = ', 0
    str_felhivoSzC db '(a + b) div 5 = ', 0
    str_felhivoSzD db '4 * (9 + c) = ', 0

section .note.GNU-stack noalloc noexec nowrite progbits