; Mathe Ruben-Jonathan
; mrim2578
; 511
;
; Lab 1 / 09
; A. feladat
; ((b - 3) * (f + 5) * d) - ((a div 3) * (g div 4) * (c div 6)) + ((e + a - g) div b)
;

%include 'io.inc'

global main

section .text

main:
    ; jelenjen meg a képernyőn a feladat
        mov rax, str_felhivoA
        call io_writestr
        call io_writeln
        mov rax, str_felhivoB
        call io_writestr
        call io_writeln
        mov rax, str_felhivoC
        call io_writestr
        call io_writeln
        call io_writeln

    ; az adatokat kérjük be
        ; olvassuk be A-t
        mov rax, str_adatokA
        call io_writestr
        call io_readint
        cdqe                    ; sign-extend
        push rax

        ; olvassuk be B-t
        mov rax, str_adatokB
        call io_writestr
        call io_readint
        cdqe                    ; sign-extend
        push rax

        ; olvassuk be C-t
        mov rax, str_adatokC
        call io_writestr
        call io_readint
        cdqe                    ; sign-extend
        push rax

        ; olvassuk be D-t
        mov rax, str_adatokD
        call io_writestr
        call io_readint
        cdqe                    ; sign-extend
        push rax

        ; olvassuk be E-t
        mov rax, str_adatokE
        call io_writestr
        call io_readint
        cdqe                    ; sign-extend
        push rax

        ; olvassuk be F-t
        mov rax, str_adatokF
        call io_writestr
        call io_readint
        cdqe                    ; sign-extend
        push rax

        ; olvassuk be G-t
        mov rax, str_adatokG
        call io_writestr
        call io_readint
        cdqe                    ; sign-extend
        push rax

    ; ((b - 3) * (f + 5) * d)               = alpha -- line 9 in xlsx
        pop rax                 ; pop g
        mov rdx, rax            ; mov g to edx from eax
        pop rax                 ; pop f
        mov rcx, rax            ; mov f to ecx from eax
        pop rax                 ; pop e
        mov rbx, rax            ; mov e to ebx from eax
        pop rax                 ; pop d
        mov rsi, rax            ; mov d to esi from eax
        mov rax, rbx            ; mov e to eax from ebx
        push rax                ; push e
        mov rax, rcx            ; mov f to eax from ecx
        add rax, 5              ; f + 5
        mov rbx, rsi            ; mov d to ebx from esi
        mov rsi, rdx            ; mov g to esi from edx
        imul rax, rbx           ; (f + 5) * d 
        mov rdi, rax            ; mov (f + 5) * d to edi from eax
        xor rax, rax            ; clear eax
        xor rbx, rbx            ; cleax ebx
        xor rcx, rcx            ; cleax ecx
        xor rdx, rdx            ; cleax edx -- line 17 in xlsx
        pop rax                 ; pop e
        mov rcx, rax            ; mov e to ecx from eax
        pop rax                 ; pop c
        mov rdx, rax            ; mov c to edx from eax
        pop rax                 ; pop b
        push rax                ; push b
        sub rax, 3              ; b - 3
        mov rbx, rdi            ; mov (f + 5) * d to ebx from edi
        imul rax, rbx           ; calc alpha
        xor rbx, rbx            ; clear ebx

    ; ((a div 3) * (g div 4) * (c div 6))   = beta -- line 24 in xlsx
        mov rdi, rax            ; mov alpha to edi from eax
        pop rax                 ; pop b
        mov rbx, rax            ; mov b to ebx from eax
        pop rax                 ; pop a
        mov r8, rax             ; mov a to r8d from eax
        mov r9, rcx             ; mov e to r9d from ecx
        mov r10, rsi            ; mov g to r10d from esi
        mov r11, rbx            ; mov b to r11d from ebx
        mov rbx, rax            ; mov a to ebx from eax
        xor rcx, rcx            ; clear ecx
        mov rax, rdi            ; mov alpha to eax from edi
        push rax                ; push alpha
        mov rax, r8             ; mov a to rax from r8d
        push rax                ; push a
        mov rax, r9             ; mov e to rax from r9d
        push rax                ; push e
        mov rax, r10            ; mov g to rax from r10d
        push rax                ; push g
        mov rax, r11            ; mov b to rax from r11d
        push rax                ; push b
        mov r8, rdx             ; mov c to r8d from edx
        mov r9, rsi             ; mov g to r9d from esi
        mov rax, rbx            ; mov a to eax from ebx
        mov rcx, 3              ; mov 3 to ecx
        cqo                     ; prep for idiv
        idiv rcx                ; a/3
        push rax                ; push a/3
        mov rax, r8             ; mov c to eax from r8d
        mov rcx, 6              ; mov 6 to ecx
        cqo                     ; prep for idiv
        idiv rcx                ; c/6
        push rax                ; push c/6
        mov rax, r9             ; mov g to eax from r9d
        mov rcx, 4              ; mov 4 to ecx
        cqo                     ; prep for idiv
        idiv rcx                ; g/4
        mov rbx, rax            ; mov g/4 to ebx from eax
        pop rax                 ; pop c/6
        imul rax, rbx           ; c/6 * g/4
        mov rbx, rax            ; mov c/6 * g/4 to ebx from eax
        pop rax                 ; pop a/3
        imul rax, rbx           ; calc beta
        xor rbx, rbx            ; clear ebx

    ; ((e + a - g) div b)                   = gamma -- line 43 in xlsx
        mov r8, rax             ; mov beta to r8d from rax
        pop rax                 ; pop b
        mov rcx, rax            ; mov b to ecx from eax
        pop rax                 ; pop g
        mov rdx, rax            ; mov g to edx from eax
        pop rax                 ; pop e
        mov rbx, rax            ; mov e to ebx from eax
        pop rax                 ; pop a
        add rax, rbx            ; a + e
        xor rbx, rbx            ; clear ebx
        sub rax, rdx            ; a + e - g
        xor rdx, rdx            ; clear edx
        cqo                     ; prep for idiv
        idiv rcx                ; calc gamma
        xor rcx, rcx            ; clear ecx

    ; alpha - beta + gamma  -- line xx in xlsx
        mov rcx, rax            ; mov gamma to ecx from eax
        mov rbx, r8             ; mov beta to ebx from r8d
        pop rax                 ; pop alpha
        sub rax, rbx            ; alpha - beta
        xor rbx, rbx            ; clear ebx
        add rax, rcx            ; calc result
        xor rcx, rcx            ; clear rcx
        push rax                ; push result

    ; az eredményt megfelelő magyarázat kíséretében írjuk ki
        mov rax, str_felhivoC
        call io_writestr
        mov rax, str_eq
        call io_writestr
        pop rax                 ; pop result
        call io_writeint
        call io_writeln
        
    ; return success to the C runtime
        xor rax, rax
        ret

section .data
    str_felhivoA db 'Lab 1 / 09', 0
    str_felhivoB db 'A. feladat', 0
    str_felhivoC db '((b - 3) * (f + 5) * d) - ((a div 3) * (g div 4) * (c div 6)) + ((e + a - g) div b)', 0
    str_eq db ' = ', 0

    str_adatokA db 'A = ', 0
    str_adatokB db 'B = ', 0
    str_adatokC db 'C = ', 0
    str_adatokD db 'D = ', 0
    str_adatokE db 'E = ', 0
    str_adatokF db 'F = ', 0
    str_adatokG db 'G = ', 0

section .note.GNU-stack noalloc noexec nowrite progbits
    