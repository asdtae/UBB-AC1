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
    mov rax, [rbp+24]
    mov BYTE [rax], 0
    mov rax, [rbp+32]
    mov BYTE [rax], 0

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
            call mio_writeln
            jmp .error_readSTR

            ; type 2 error cont
            .not1thcharSignError_readSTR:
            mov rax, [rbp+32]
            mov al, [rax]
            cmp al, 1
            je .nthNEG_readSTR
            mov rbx, 2
            call mio_writeln
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
        cmp rcx, 0
        mov rbx, 100
        je .error_readSTR
        xor rax, rax
        pop rbp
        ret

    .error_readSTR:
        call mio_writeln
        mov rax, str_hiba
        call mio_writestr

        ; det error type
        cmp rbx, 100
        je .error_100_readSTR
        cmp rbx, 1
        je .error_1_readSTR
        cmp rbx, 2
        je .error_2_readSTR

        ; default error type
        call mio_writeln
        mov rax, -1
        pop rbp
        ret

        ; error type 100
        .error_100_readSTR:
        mov rax, str_hibaType100
        call mio_writestr
        call mio_writeln
        mov rax, 100
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
;   RCX - str_len
;   RDX - addr

    ; setup
    push rbp
    mov rbp, rsp

    mov rbx, [rbp+16]   ; addr
    mov rdx, [rbp+16]   ; addr for later use: vissza transformnak
    mov rcx, [rbp+32]   ; str_len
    add rcx, rbx        ;
    xor rax, rax        ; reset rax

    ; write sign
    mov rax, [rbp+24]
    mov BYTE al, [rax]
    cmp al, 1
    jne .loop_writeSTR
    mov al, 45
    call mio_writechar

    .loop_writeSTR:
        cmp rbx, rcx
        je .loopEnd_writeSTR

            mov BYTE al, [rbx]
            cmp al, 26
            jne .loopNoSkip_writeSTR
            inc rbx
            jmp .loop_writeSTR

            .loopNoSkip_writeSTR:
            call mio_writechar

        inc rbx
        jmp .loop_writeSTR
    .loopEnd_writeSTR:
        call mio_writeln
        mov rax, [rbp+16]
        pop rbp
        sub rcx, rax
        xor rax, rax
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
        call mio_writeln
        mov rax, str_hiba
        call mio_writestr
        mov rax, str_hibaType3
        call mio_writestr
        call mio_writeln
        mov rax, 3              ; error type
        jmp .errors_readINT


    ; trim
    ; RAX - addr
    ; RCX - str_len
    .trim_readINT:
        push rax                ; to get normalized str_len
        xor rbx, rbx
        mov rdx, rcx
        dec rdx

        .loop_trim_readINT:
        cmp rax, rdx
        jge .loopEND_trim_readINT

            mov BYTE bl, [rax]
            cmp bl, 0
            jg .loopEND_trim_readINT
            mov bl, 26
            mov BYTE [rax], bl

        inc rax
        jmp .loop_trim_readINT
        .loopEND_trim_readINT:
        cmp BYTE [rax], 0       ; -0 
        jne .loopEND_trim_notZero_readINT
        mov rbx, [rsp+16]
        mov BYTE [rbx], 0
        .loopEND_trim_notZero_readINT:
        pop rax
        sub rcx, rax

    ; reset params & exit
        pop rax
        pop rax
        pop rax
        pop rdx
        xor rax, rax
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
;   IN
;   RBX - numbA / numbB
;
;   OUT
;   RAX - ERROR
;   RCX - str_len

    ; safety
        push rdx

    ; setup params
        mov rax, str_hex        ; felhivo addr
        push rax                ;

        ; numbA or numbB ?
        cmp rbx, 1
        je .numbB_readHEX

        ; numbA
        mov rax, numbA_sign     ; sign
        push rax                ;
        mov rax, not1thcharA    ; 1th
        push rax                ;
        mov rax, numbA          ; addr
        push rax                ;
        jmp .numbSkip_readHEX

        ; numbB
        .numbB_readHEX:
        mov rax, numbB_sign     ; sign
        push rax                ;
        mov rax, not1thcharB    ; 1th
        push rax                ;
        mov rax, numbB          ; addr
        push rax                ;
        .numbSkip_readHEX:

    ; call readSTR
        call readSTR
        cmp rax, 0
        jne .errors_readHEX
        
    ; validation + transform
    ; RAX - addr
    ; RCX - str_len
        pop rax
        push rax
        add rcx, rax
        xor rbx, rbx

        .loop_readHEX:
        cmp rax, rcx
        je .loopEnd_readHEX

            ; outer scope: 0 - f
            mov BYTE bl, [rax]
            cmp bl, 47
            jng .error_4_readHEX
            cmp bl, 102
            jg .error_4_readHEX

                ; inner scope #1: 0 - 9 or A - f
                cmp bl, 57
                jng .loop_INT_readHEX
                cmp bl, 64
                jng .error_4_readHEX

                ; inner scope #2: A - F or a - f
                cmp bl, 70
                jng .loop_BIGHEX_readHEX
                cmp bl, 96
                jng .error_4_readHEX
                jmp .loop_SMALLHEX_readHEX

                ; scopes
                    ; 0 - 9
                    .loop_INT_readHEX:
                    sub bl, 48
                    mov BYTE [rax], bl
                    jmp .loop_SKIPSCOPE_readHEX

                    ; A - F
                    .loop_BIGHEX_readHEX:
                    sub bl, 65
                    add bl, 10
                    mov BYTE [rax], bl
                    jmp .loop_SKIPSCOPE_readHEX
                    
                    ; a - f
                    .loop_SMALLHEX_readHEX:
                    sub bl, 97
                    add bl, 10
                    mov BYTE [rax], bl
                    jmp .loop_SKIPSCOPE_readHEX

                .loop_SKIPSCOPE_readHEX:
            
        inc rax
        jmp .loop_readHEX
        .loopEnd_readHEX:
        pop rax                 ; get addr for trim
        jmp .trim_readHEX

        ; error type 4
        .error_4_readHEX:
        call mio_writeln
        mov rax, str_hiba
        call mio_writestr
        mov rax, str_hibaType4
        call mio_writestr
        call mio_writeln
        mov rax, 4              ; error type
        jmp .errors_readHEX

    ; trim
    ; RAX - addr
    ; RCX - str_len
    .trim_readHEX:
        push rax                ; to get normalized str_len
        xor rbx, rbx
        mov rdx, rcx
        dec rdx

        .loop_trim_readHEX:
        cmp rax, rdx
        jge .loopEND_trim_readHEX

            mov BYTE bl, [rax]
            cmp bl, 0
            jg .loopEND_trim_readHEX
            mov bl, 26
            mov BYTE [rax], bl

        inc rax
        jmp .loop_trim_readHEX
        .loopEND_trim_readHEX:
        cmp BYTE [rax], 0       ; -0 
        jne .loopEND_trim_notZero_readHEX
        mov rbx, [rsp+16]
        mov BYTE [rbx], 0
        .loopEND_trim_notZero_readHEX:
        pop rax
        sub rcx, rax

    ; reset params & exit
        pop rax
        pop rax
        pop rax
        pop rdx
        xor rax, rax
        ret

    ; error handling
    .errors_readHEX:
        mov rbx, rax
        pop rax
        pop rax
        pop rax
        pop rax
        pop rdx
        mov rax, rbx
        ret

writeINT:
;   IN
;   RBX - numbA / numbB
;   RCX - str_len
;
;   OUT
;   RAX - ERROR - idk mi de ja
;   RAX - str_len

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
        push rax                ; save addr | i know that it's already saved, but i don't want to mess with BP 
        add rcx, rax
        xor rbx, rbx

        .loop_writeINT:
        cmp rax, rcx
        je .loopEND_writeINT

            mov BYTE bl, [rax]
            cmp bl, 26
            jne .loopNoSkip_writeINT
            inc rax
            jmp .loop_writeINT

            .loopNoSkip_writeINT:
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

    ; transform back
    ; RAX - addr
    ; RCX - str_len
        mov rax, rdx
        add rcx, rax
        xor rbx, rbx

        .loop2_writeINT:
        cmp rax, rcx
        je .loop2END_writeINT

            mov BYTE bl, [rax]
            cmp bl, 26
            jne .loop2NoSkip_writeINT
            inc rax
            jmp .loop2_writeINT

            .loop2NoSkip_writeINT:
            sub bl, 48
            mov BYTE [rax], bl

        inc rax
        jmp .loop2_writeINT
        .loop2END_writeINT:

    ; reset params & exit
        pop rax
        pop rax
        pop rcx
        pop rdx
        xor rax, rax
        ret

    ; error handling
    .errors_writeINT:
        mov rbx, rax
        pop rax
        pop rax
        pop rax
        pop rdx
        mov rax, rbx
        ret

writeHEX:
;   IN
;   RBX - numbA / numbB
;   RCX - str_len
;
;   OUT
;   RAX - ERROR - idk mi de ja
;   RCX - str_len

    ; safety
        push rdx

    ; setup params
        ; str_len
        mov rax, rcx            ; str_len
        push rax

        ; numbA or numbB ?
        cmp rbx, 1
        je .numbB_writeHEX

        ; numbA
        mov rax, numbA_sign     ; sign
        push rax                ;
        mov rax, numbA          ; addr
        push rax                ;
        jmp .numbSkip_writeHEX

        ; numbB
        .numbB_writeHEX:
        mov rax, numbB_sign     ; sign
        push rax                ;
        mov rax, numbB          ; addr
        push rax                ;
        .numbSkip_writeHEX:

    ; transform
    ; RAX - addr
    ; RCX - str_len
    ; RDX - adj str_len
        push rax                ; save addr | i know that it's already saved, but i don't want to mess with that unless needed 
        add rcx, rax
        xor rbx, rbx
        xor rdx, rdx

        .loop_writeHEX:
        cmp rax, rcx
        je .loopEND_writeHEX

            ; handle trim
            mov BYTE bl, [rax]
            cmp bl, 26
            jne .loopNoSkip_writeHEX
            inc rax
            jmp .loop_writeHEX

            ; get scope
            .loopNoSkip_writeHEX:
            inc rdx
            cmp bl, 9
            jg .loop_BIGHEX_writeHEX

                ; 0 - 9
                .loop_INT_writeHEX:
                add bl, 48
                mov BYTE [rax], bl
                jmp .loop_SKIPSCOPE_writeHEX

                ; A - F
                .loop_BIGHEX_writeHEX:
                add bl, 65
                sub bl, 10
                mov BYTE [rax], bl

            .loop_SKIPSCOPE_writeHEX:

        inc rax
        jmp .loop_writeHEX
        .loopEND_writeHEX:
        pop rax                 ; get addr

    ; 0x + pad
        mov al, 48              ; 0
        call mio_writechar
        mov al, 120             ; x
        call mio_writechar

        .loop_pad_writeHEX:
        cmp rdx, 8
        jge .loop_padEND_writeHEX

            mov al, 48          ; pad 0
            call mio_writechar

        inc rdx
        jmp .loop_pad_writeHEX
        .loop_padEND_writeHEX:

    ; call writeSTR
        call writeSTR
        cmp rax, 0
        jne .errors_writeHEX

    ; transform back
    ; RAX - addr
    ; RCX - str_len
        mov rax, rdx
        add rcx, rax
        xor rbx, rbx

        .loop2_writeHEX:
        cmp rax, rcx
        je .loop2END_writeHEX

            ; handle trim
            mov BYTE bl, [rax]
            cmp bl, 26
            jne .loop2NoSkip_writeHEX
            inc rax
            jmp .loop2_writeHEX

            ; get scopes
            .loop2NoSkip_writeHEX:
            cmp bl, 57
            jg .loop2_BIGHEX_writeHEX

                ; 0 - 9
                .loop2_INT_writeHEX:
                sub bl, 48
                mov BYTE [rax], bl
                jmp .loop2_SKIPSCOPE_writeHEX

                ; A - F
                .loop2_BIGHEX_writeHEX:
                sub bl, 65
                add bl, 10
                mov BYTE [rax], bl

            .loop2_SKIPSCOPE_writeHEX:

        inc rax
        jmp .loop2_writeHEX
        .loop2END_writeHEX:

    ; reset params & exit
        pop rax
        pop rax
        pop rcx
        pop rdx
        xor rax, rax
        ret

    ; error handling
    .errors_writeHEX:
        mov rbx, rax
        pop rax
        pop rax
        pop rax
        pop rdx
        mov rax, rbx
        ret

INT2HEX:
;   IN
;   RBX - numbA / numbB
;   RCX - str_len
;
;   OUT
;   RAX - error
;   RCX - str_len

    ; safety
    push rdx
    push rsi
    push rdi

    ; setup params
        ; numbA or numbB ?
        cmp rbx, 1
        je .numbB_INT2HEX

        ; numbA
        mov rsi, numbA          ; addr
        mov rbx, numbA_sign     ; sign
        jmp .numbSkip_INT2HEX

        ; numbB
        .numbB_INT2HEX:
        mov rsi, numbB          ; addr
        mov rbx, numbB_sign     ; sign

        .numbSkip_INT2HEX:
        mov rdi, numbT          ; temp addr
        mov BYTE bl, [rbx]

        xor rax, rax
        add rcx, rsi            ; calc end addr

    ; transform 1
    ; RAX - numb buildup cucc
    ; RBX - source sign
    ; RCX - source end addr
    ; RDX - temp util
    ; RSI - source addr
    ; RDI - dest addr
        .loop_INT2HEX:
        cmp rsi, rcx
        je .loopEnd_INT2HEX

            mov BYTE dl, [rsi]
            cmp dl, 26
            je .loopSkip_INT2HEX

                imul rax, 10
                add rax, rdx

            .loopSkip_INT2HEX:

        inc rsi
        jmp .loop_INT2HEX
        .loopEnd_INT2HEX:

    ; poz / neg
        cmp BYTE bl, 1
        jne .poz_INT2HEX
        neg rax

        .poz_INT2HEX:
        mov rdx, numbT_sign
        mov BYTE [rdx], 0

    ; transform 2
        xor rcx, rcx            ; new len
        mov rbx, 16             ; cuz x/10
        
        .loopTrans2_INT2HEX:
            xor rdx, rdx
            div rbx
            push rdx
            inc rcx
            test rax, rax
            jnz .loopTrans2_INT2HEX

        mov rdx, rcx
        .loop2Trans2_INT2HEX:
            pop rax
            mov BYTE [rdi], al
            inc rdi
            dec rdx
            jnz .loop2Trans2_INT2HEX

    ; reset & exit
    xor rax, rax
    pop rdi
    pop rsi
    pop rdx
    ret

;   -- WIP --
HEX2INT:
;   IN
;   RBX - numbA / numbB
;   RCX - str_len
;
;   OUT
;   RAX - error
;   RCX - str_len

    ; safety
    push rdx
    push rsi
    push rdi

    ; setup params
        ; numbA or numbB ?
        cmp rbx, 1
        je .numbB_HEX2INT

        ; numbA
        mov rsi, numbA          ; addr
        mov rbx, numbA_sign     ; sign
        jmp .numbSkip_HEX2INT

        ; numbB
        .numbB_HEX2INT:
        mov rsi, numbB          ; addr
        mov rbx, numbB_sign     ; sign

        .numbSkip_HEX2INT:
        mov rdi, numbT          ; temp addr
        mov BYTE bl, [rbx]

        xor rax, rax
        add rcx, rsi            ; calc end addr

    ; transform 1
    ; RAX - numb buildup cucc
    ; RBX - source sign
    ; RCX - source end addr
    ; RDX - temp util
    ; RSI - source addr
    ; RDI - dest addr
        .loop_HEX2INT:
        cmp rsi, rcx
        je .loopEnd_HEX2INT

            mov BYTE dl, [rsi]
            cmp dl, 26
            je .loopSkip_HEX2INT

                shl rax, 4
                mov BYTE dl, [rsi]
                or al, dl

            .loopSkip_HEX2INT:

        inc rsi
        jmp .loop_HEX2INT
        .loopEnd_HEX2INT:

    ; poz / neg
        cmp BYTE bl, 1
        jne .testTC_HEX2INT
        neg rax

        .testTC_HEX2INT:
        test rax, rax
        jns .poz_HEX2INT

        mov rdx, numbT_sign
        mov BYTE [rdx], 1
        neg rax
        jmp .trans2_HEX2INT

        .poz_HEX2INT:
        mov rdx, numbT_sign
        mov BYTE [rdx], 0

    ; transform 2
        .trans2_HEX2INT:
        xor rcx, rcx            ; new len
        mov rbx, 10             ; cuz x/10
        
        .loopTrans2_HEX2INT:
            xor rdx, rdx
            div rbx
            push rdx
            inc rcx
            test rax, rax
            jnz .loopTrans2_HEX2INT

        mov rdx, rcx
        .loop2Trans2_HEX2INT:
            pop rax
            mov BYTE [rdi], al
            inc rdi
            dec rdx
            jnz .loop2Trans2_HEX2INT

    ; reset & exit
    xor rax, rax
    pop rdi
    pop rsi
    pop rdx
    ret

COPY:
;   IN
;   RAX - copy_to / copy_from numbT
;   RBX - numbA / numbB
;   RCX - numbA / numbB str_len
;   RDX - switch mode: if true <-> RAX = 0

;   OUT
;   RCX - numbT str_len
;   R8  - numbA / numbB str_len

    ; safety
    push rcx
    push r8
    push rsi
    push rdi

    ; check op mode
        ; copy_to / copy_from
        cmp rax, 1
        je .cpyOp2_COPY
        cmp edx, 1
        je .cpyOp3_COPY

    ; op1
        ; setup params
            ; numbA or numbB ?
            cmp rbx, 1
            je .numbB_COPY

            ; numbA
            mov rsi, numbA          ; addr
            mov rbx, numbA_sign     ; sign
            jmp .numbSkip_COPY
        
            ; numbB
            .numbB_COPY:
            mov rsi, numbB          ; addr
            mov rbx, numbB_sign     ; sign

            .numbSkip_COPY:
            mov rdi, numbT          ; addr
            mov rdx, numbT_sign     ; sign

            xor rax, rax
            add rcx, rsi

        ; copy to numbT
            mov BYTE al, [rbx]     ; copy sign
            mov BYTE [rdx], al
            
            .loop_COPY:
            cmp rsi, rcx
            je .loopEND_COPY

                mov BYTE al, [rsi]
                mov BYTE [rdi], al

            inc rsi
            inc rdi
            jmp .loop_COPY
            .loopEND_COPY:

            jmp .exit_COPY

    ; op2
    .cpyOp2_COPY:
        ; setup params
            ; numbA or numbB ?
            cmp rbx, 1
            je .numbB_Op2_COPY

            ; numbA
            mov rdi, numbA          ; addr
            mov rbx, numbA_sign     ; sign
            jmp .numbSkip_Op2_COPY
        
            ; numbB
            .numbB_Op2_COPY:
            mov rdi, numbB          ; addr
            mov rbx, numbB_sign     ; sign

            .numbSkip_Op2_COPY:
            mov rsi, numbT          ; addr
            mov rdx, numbT_sign     ; sign

            xor rax, rax
            add rcx, rsi

        ; copy from numbT
            mov BYTE al, [rdx]     ; copy sign
            mov BYTE [rbx], al

            .loop_Op2_COPY:
            cmp rsi, rcx
            je .loopEND_Op2_COPY

                mov BYTE al, [rsi]
                mov BYTE [rdi], al

            inc rsi
            inc rdi
            jmp .loop_Op2_COPY
            .loopEND_Op2_COPY:

            jmp .exit_COPY

    ; op3
    .cpyOp3_COPY:
        ; setup params
            ; numbA or numbB ?
            cmp rbx, 1
            je .numbB_Op3_COPY

            ; numbA
            mov rsi, numbA          ; addr
            mov rbx, numbA_sign     ; sign
            jmp .numbSkip_Op3_COPY
        
            ; numbB
            .numbB_Op3_COPY:
            mov rsi, numbB          ; addr
            mov rbx, numbB_sign     ; sign

            .numbSkip_Op3_COPY:
            mov rdi, numbT          ; addr
            mov rdx, numbT_sign     ; sign

        ; switch with numbT
            mov BYTE al, [rbx]      ; switch sign
            push rax
            mov BYTE al, [rdx]
            mov BYTE [rbx], al
            pop rax
            mov BYTE [rdx], al

            mov rcx, 32
            .loop_Op3_COPY:
                cmp rcx, 0
                jz .loopEND_Op3_COPY

                    mov BYTE al, [rsi]
                    mov BYTE dl, [rdi]
                    mov BYTE [rsi], dl
                    mov BYTE [rdi], al

                inc rsi
                inc rdi
                dec rcx
                jmp .loop_Op3_COPY
            .loopEND_Op3_COPY:

        ; switch r8 & rcx
        xor rax, rax
        pop rdi
        pop rsi
        pop rcx
        pop r8
        ret

    ; reset & exit
    .exit_COPY:
    xor rax, rax
    pop rdi
    pop rsi
    pop r8
    pop rcx
    ret

ADD_HEX:
;   IN
;   R8  - numbA str_len
;   RCX - numbB str_len
;
;   OUT
;   RCX - numbT str_len

    ; safety
    push rbx
    push rdx
    push rsi
    push rdi
    push r9

    ; pack numbA
        mov rsi, numbA
        add r8, rsi
        xor r9, r9

        .loop_A_ADD_HEX:
        cmp rsi, r8
        je .loopEND_A_ADD_HEX

            mov BYTE dl, [rsi]
            cmp dl, 26
            je .skipA_ADD_HEX

                shl r9, 4
                or r9b, dl

            .skipA_ADD_HEX:

        inc rsi
        jmp .loop_A_ADD_HEX
        .loopEND_A_ADD_HEX:

    ; pack numbB
        mov rsi, numbB
        add rcx, rsi
        xor rax, rax

        .loop_B_ADD_HEX:
        cmp rsi, rcx
        je .loopEND_B_ADD_HEX

            mov BYTE dl, [rsi]
            cmp dl, 26
            je .skipB_ADD_HEX

                shl rax, 4
                or al, dl

            .skipB_ADD_HEX:

        inc rsi
        jmp .loop_B_ADD_HEX
        .loopEND_B_ADD_HEX:

    ; A + B
    add rax, r9

    ; unpack into numbT
        mov rdi, numbT
        mov rdx, numbT_sign
        mov BYTE [rdx], 0

        xor rcx, rcx
        mov rbx, 16

        .loop3_ADD_HEX:
        xor rdx, rdx
        div rbx

            push rdx
            inc rcx

        test rax, rax
        jnz .loop3_ADD_HEX

        mov rdx, rcx
        .loop4_ADD_HEX:

            pop rax
            mov BYTE [rdi], al

        inc rdi
        dec rdx
        jnz .loop4_ADD_HEX

    ; reset & exit
    pop r9
    pop rdi
    pop rsi
    pop rdx
    pop rbx
    xor rax, rax
    ret

main:
    ; setup
        xor rax, rax
        mov BYTE [numbA_sign], al
        mov BYTE [numbB_sign], al
        mov BYTE [not1thcharA], al
        mov BYTE [not1thcharB], al

    ; run da cucc

        ; beolvas egy számot decimális egészként,
        mov rbx, 0
        call readINT
        cmp rax, 0
        jne .error

        ; kiíratja decimális (előjeles egész) alakban,
        mov rbx, 0
        call writeINT

        ; kiíratja hexadecimális (a szám komplementerkódbeli ábrázolása) alakban,
        mov rbx, 0
        call INT2HEX
        mov rax, 1
        mov rbx, 0
        mov rdx, 0
        call COPY
        mov rbx, 0
        call writeHEX
        mov r8, rcx

        ; beolvas egy másik számot hexadecimális egészként (ezt egy egész komplementerkódbeli ábrázolásának tekintjük),
        mov rbx, 1
        call readHEX
        cmp rax, 0
        jne .error

        ; kiíratja decimális (előjeles egész) alakban,
        mov rbx, 1
        call HEX2INT
        mov rax, 1
        mov rbx, 1
        mov rdx, 0
        call COPY
        mov rbx, 1
        call writeINT

        ; kiíratja hexadecimális alakban,
        mov rbx, 1
        call INT2HEX
        mov rax, 1
        mov rbx, 1
        mov rdx, 0
        call COPY
        mov rbx, 1
        call writeHEX

        ; a két számot összeadja,
        call ADD_HEX
        mov rax, 1
        mov rbx, 0
        mov rdx, 0
        call COPY

        ; az eredményt kiíratja decimális (előjeles egész) alakban,
        mov rbx, 0
        call HEX2INT
        mov rax, 1
        mov rbx, 0
        mov rdx, 0
        call COPY
        mov rbx, 0
        call writeINT

        ; az eredményt kiíratja hexadecimális alakban.
        mov rbx, 0
        call INT2HEX
        mov rax, 1
        mov rbx, 0
        mov rdx, 0
        call COPY
        mov rbx, 0
        call writeHEX

    ; return success to the C runtime
        xor rax, rax
        ret

    ; return error to the C runtime
    .error:
        ret

section .data
    str_hiba db 'Hiba: ', 0

    str_hibaType100 db 'Nem volt megadva egy szam', 0
    str_hibaType1 db 'Tobbszor is volt a sign valtoztatva.', 0
    str_hibaType2 db 'A sign nem az elejen volt valtoztatva.', 0
    str_hibaType3 db 'Nem csak szamok voltak megadva', 0
    str_hibaType4 db 'Nem csak 0-9/a-f/A-F volt megadva', 0

    str_int db 'Adj meg egy decimális egész szamot: ', 0
    str_hex db 'Adj meg egy hexadecimális egész szamot: ', 0


    str_DEBUG db 'crash here', 0
    str_DEBUG_WRITEHEX db 'WRITEHEX', 0
    str_DEBUG_WRITESTR db 'WRITESTR', 0
    str_DEBUG_RAX db 'RAX: ', 0
    str_DEBUG_RCX db 'RCX: ', 0

section .bss
    ; flags
    numbA_sign resb 1
    numbB_sign resb 1
    numbT_sign resb 1
    not1thcharA resb 1
    not1thcharB resb 1

    ; numbs
    numbA resb 32
    numbB resb 32
    numbT resb 32

section .note.GNU-stack noalloc noexec nowrite progbits



;        mov rax, str_DEBUG
;        call io_writestr
;        call io_writeln


;        push rax
;        call io_writeln
;        mov rax, str_DEBUG_WRITEHEX
;        call io_writestr
;        call io_writeln
;        mov rax, str_DEBUG_RCX
;        call io_writestr
;        mov rax, rcx
;        call io_writeint
;        call io_writeln
;        mov rax, str_DEBUG_RAX
;        call io_writestr
;        pop rax
;        call io_writeint
;        call io_writeln
;        call io_writeln