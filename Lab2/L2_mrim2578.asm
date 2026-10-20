; Mathe Ruben-Jonathan
; mrim2578
; 511
;
; Lab 2

%include 'io.inc'
%include 'mio.inc'

global main

default rel

section .text

readSTR:
;   IN
;   [rbp+16] - addr
;   [rbp+24] - 1th
;   [rbp+32] - sign
;   [rbp+40] - felhivo addr
;
;   OUT
;   RAX - ERROR
;   RCX - str_len

    ; setup
    push rbp
    mov rbp, rsp

    ; write utasitas
    mov rax, [rbp+40]
    call mio_writestr
    
    xor rcx, rcx        ; reset ecx
    xor rax, rax        ; reset eax
    mov rcx, [rbp+16]   ; save numb addr

    .loop_readSTR:
        call mio_readchar

        ; exit enter eseten
        cmp al, 13
        je .loopEnd_readSTR

        ; handle negative sign
        cmp al, 45
        jne .notNEG_readSTR
            ; type 2 error
            mov rax, [rbp+24]
            mov al, [rax]
            cmp al, 1
            je .not1thcharSignError_readSTR
            
            ; type 1 error
            mov rax, [rbp+32]
            mov al, [rax]
            cmp al, 1
            je .nthNEG_readSTR

            ; 1th
            mov rax, [rbp+32]
            mov BYTE [rax], 1
            mov rax, [rbp+24]
            mov BYTE [rax], 1
            mov rax, 45
            call mio_writechar  ; display the character
            jmp .loop_readSTR

            ; nth
            .nthNEG_readSTR:
            mov rbx, 1
            jmp .error_readSTR

            ; type 2 error cont
            .not1thcharSignError_readSTR:
            mov rax, [rbp+32]
            mov al, [rax]
            cmp al, 1
            je .nthNEG_readSTR
            mov rbx, 2
            jmp .error_readSTR

        .notNEG_readSTR:

        ; handle delete
        cmp al, 8
        jne .extraLogic_readSTR
        cmp rcx, [rbp+16]
        jng .checkSign_readSTR

        mov al, 8
        call mio_writechar
        mov al, ' '
        call mio_writechar
        mov al, 8
        call mio_writechar
        sub rcx, 1
        mov BYTE [rcx], 0

        cmp rcx, [rbp+16]
        jne .loop_readSTR
        mov rax, [rbp+32]
        cmp BYTE [rax], 1
        je .loop_readSTR
        mov rax, [rbp+24]
        mov BYTE [rax], 0
        jmp .loop_readSTR

        .checkSign_readSTR:
        mov rax, [rbp+32]
        cmp BYTE [rax], 1
        jne .loop_readSTR
        mov BYTE [rax], 0
        mov rax, [rbp+24]
        mov BYTE [rax], 0
        mov al, 8
        call mio_writechar
        mov al, ' '
        call mio_writechar
        mov al, 8
        call mio_writechar
        jmp .loop_readSTR

        .extraLogic_readSTR:
        ; display the char
        call mio_writechar

        ; save char
        mov BYTE [rcx], al
        add rcx, 1

        mov rax, [rbp+24]
        mov BYTE [rax], 1

        ; next char
        jmp .loop_readSTR

    .loopEnd_readSTR:
        call mio_writeln
        sub rcx, [rbp+16]
        xor rax, rax
        pop rbp
        ret

    .error_readSTR:
        call mio_writeln
        mov rax, str_hiba
        call mio_writestr

        ; det error type
        cmp rbx, 1
        je .error_1_readSTR
        cmp rbx, 2
        je .error_2_readSTR

        ; default error type
        call mio_writeln
        mov rax, -1
        pop rbp
        ret

        ; error type 1
        .error_1_readSTR:
        mov rax, str_hibaType1
        call mio_writestr
        call mio_writeln
        mov rax, 1
        pop rbp
        ret

        ; error type 2
        .error_2_readSTR:
        mov rax, str_hibaType2
        call mio_writestr
        call mio_writeln
        mov rax, 2
        pop rbp
        ret

writeSTR:
;   IN
;   [rbp+16] - addr
;   [rbp+24] - sign
;   [rbp+32] - str_len
;
;   OUT
;   RAX - ERROR

    ; setup
    push rbp
    mov rbp, rsp

    mov rbx, [rbp+16]   ; addr
    mov rcx, [rbp+32]   ; str_len
    add rcx, rbx        ;
    xor rax, rax        ; reset rax

    ; write sign
    mov BYTE al, [rbp+24]
    cmp al, 1
    jne .loop_writeSTR
    mov al, 45
    call mio_writechar

    .loop_writeSTR:
        cmp rbx, rcx
        je .loopEnd_writeSTR

            mov BYTE al, [rbx]
            cmp al, 0
            je .loop_writeSTR
            call mio_writechar

        inc rbx
        jmp .loop_writeSTR
    .loopEnd_writeSTR:
        call mio_writeln
        xor rax, rax
        ret

trim:
    ret

readINT:
;   IN
;   RBX - numbA / numbB
;
;   OUT
;   RAX - ERROR
;   RCX - str_len

    ; safety
        push rdx

    ; setup params
        mov rax, str_int        ; felhivo addr
        push rax                ;

        ; numbA or numbB ?
        cmp rbx, 1
        je .numbB_readINT

        ; numbA
        mov rax, numbA_sign     ; sign
        push rax                ;
        mov rax, not1thcharA    ; 1th
        push rax                ;
        mov rax, numbA          ; addr
        push rax                ;
        jmp .numbSkip_readINT

        ; numbB
        .numbB_readINT:
        mov rax, numbB_sign     ; sign
        push rax                ;
        mov rax, not1thcharB    ; 1th
        push rax                ;
        mov rax, numbB          ; addr
        push rax                ;
        .numbSkip_readINT:

    ; call readSTR
        call readSTR
        cmp rax, 0
        jne .errors_readINT

    ; validation + transform
    ; RAX - addr
    ; RCX - str_len
        pop rax
        push rax                ; save addr for trim
        add rcx, rax
        xor rbx, rbx

        .loop_readINT:
        cmp rax, rcx
        je .loopEnd_readINT

            mov BYTE bl, [rax]
            cmp bl, 47
            jng .error_3_readINT
            cmp bl, 57
            jg .error_3_readINT

            sub bl, 48
            mov BYTE [rax], bl

        inc rax
        jmp .loop_readINT
        .loopEnd_readINT:
        pop rax                 ; get addr for trim
        jmp .trim_readINT

        ; error type 3
        .error_3_readINT:
        mov rax, str_hibaType3
        call mio_writestr
        call mio_writeln
        pop rax                 ; pop saved addr
        mov rax, 3              ; error type
        jmp .errors_readINT


    ; trim
    ; RAX - addr
    ; RCX - str_len
    .trim_readINT:
        push rax                ; to get normalized str_len
        xor rbx, rbx

        .loop_trim_readINT:
        cmp rax, rcx
        je .loopEND_trim_readINT

            mov BYTE bl, [rax]
            cmp bl, 48
            jg .loopEND_trim_readINT
            mov bl, 0
            mov BYTE [rax], bl

        inc rax
        jmp .loop_trim_readINT
        .loopEND_trim_readINT:
        pop rax
        sub rcx, rax

    ; reset params & exit
        pop rax
        pop rax
        pop rax
        pop rax
        pop rdx
        xor rax, rax

        mov rax, str_DEBUG
        call io_writestr
        call io_writeln

        ret

    ; error handling
    .errors_readINT:
        mov rbx, rax
        pop rax
        pop rax
        pop rax
        pop rax
        pop rdx
        mov rax, rbx
        ret
    
readHEX:
    ret

writeINT:
;   IN
;   RBX - numbA / numbB
;   RCX - str_len
;
;   OUT
;   RAX - ERROR - idk mi de ja

    ; safety
        push rdx

    ; setup params
        ; str_len
        mov rax, rcx            ; str_len
        push rax

        ; numbA or numbB ?
        cmp rbx, 1
        je .numbB_writeINT

        ; numbA
        mov rax, numbA_sign     ; sign
        push rax                ;
        mov rax, numbA          ; addr
        push rax                ;
        jmp .numbSkip_writeINT

        ; numbB
        .numbB_writeINT:
        mov rax, numbB_sign     ; sign
        push rax                ;
        mov rax, numbB          ; addr
        push rax                ;
        .numbSkip_writeINT:

    ; transform
    ; RAX - addr
    ; RCX - str_len
        push rax                ; save addr | i know that it's already saved, but i don't want to mess with that unless needed 
        xor rbx, rbx

        .loop_writeINT:
        cmp rax, rcx
        je .loopEND_writeINT

            mov BYTE bl, [rax]
            add bl, 48
            mov BYTE [rax], bl

        inc rax
        jmp .loop_writeINT
        .loopEND_writeINT:
        pop rax                 ; get addr

    ; call writeSTR
        call writeSTR
        cmp rax, 0
        jne .errors_writeINT

    ; reset params & exit
        pop rax
        pop rax
        pop rax
        xor rax, rax
        ret

    ; error handling
    .errors_writeINT:
        mov rbx, rax
        pop rax
        pop rax
        pop rax
        mov rax, rbx
        ret

writeHEX:
    ret

main:
    ; setup
        xor rax, rax
        mov al, 0
        mov BYTE [numbA_sign], al
        mov BYTE [numbB_sign], al
        mov BYTE [not1thcharA], al
        mov BYTE [not1thcharB], al

    ; tests
        mov rbx, 0      ; numbA
        call readINT

        mov rax, str_DEBUG
        call io_writestr
        call io_writeln

        cmp al, 0
        jne .error

        mov rbx, 0
        mov rax, rcx
        call io_writeint
        call io_writeln
        ;call writeINT

    ; return success to the C runtime
        xor rax, rax
        ret

    ; return error to the C runtime
    .error:
        ret

section .data
    str_hiba db 'Hiba: ', 0
    str_hibaType1 db 'Tobbszor is volt a sign valtoztatva.', 0
    str_hibaType2 db 'A sign nem az elejen volt valtoztatva.', 0
    str_hibaType3 db 'Nem csak szamok voltak megadva', 0
    str_int db 'Adj meg egy decimális egész szamot: ', 0
    str_hex db 'Adj meg egy hexadecimális egész szamot: ', 0
    str_DEBUG db 'crash here', 0

section .bss
    ; flags
    numbA_sign resb 1
    numbB_sign resb 1
    not1thcharA resb 1
    not1thcharB resb 1

    ; numbs
    numbA resb 32
    numbB resb 32

section .note.GNU-stack noalloc noexec nowrite progbits



;           mov rax, str_DEBUG
;           call io_writestr
;           call io_writeln