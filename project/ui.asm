; https://www.figma.com/design/nAlyAsvY7q2KFvtq9jw8ie/Untitled?node-id=0-1&p=f&t=Dr4KgAMCyWt4Bn8K-0

%include 'io.inc'
%include 'gfx.inc'
%include 'util.inc'

; window size
%define WIDTH  768
%define HEIGHT 768

; UI (x1,y1)(x2,y2)
    ; BG colors
    %define NAVBAR_X1 0
    %define NAVBAR_Y1 0
    %define NAVBAR_X2 768
    %define NAVBAR_Y2 65

    %define SIDEBAR_X1 0
    %define SIDEBAR_Y1 67
    %define SIDEBAR_X2 47
    %define SIDEBAR_Y2 768

    %define DESC_X1 617
    %define DESC_Y1 67
    %define DESC_X2 768
    %define DESC_Y2 768

    %define BG1_X1 47   ; top
    %define BG1_Y1 67
    %define BG1_X2 617
    %define BG1_Y2 193

    %define BG2_X1 47   ; bottom
    %define BG2_Y1 641
    %define BG2_X2 617
    %define BG2_Y2 768

    %define BG3_X1 47    ; left
    %define BG3_Y1 193
    %define BG3_X2 108
    %define BG3_Y2 641

    %define BG4_X1 556    ; right
    %define BG4_Y1 193
    %define BG4_X2 617
    %define BG4_Y2 641

    %define HORI_SEP_X1 0
    %define HORI_SEP_Y1 65
    %define HORI_SEP_X2 768
    %define HORI_SEP_Y2 67

    ; BUTTONS
    %define BUTTONS_WRAPPER_X1 40
    %define BUTTONS_WRAPPER_Y1 0
    %define BUTTONS_WRAPPER_X2 160
    %define BUTTONS_WRAPPER_Y2 40

    %define DELETE_X1 50
    %define DELETE_Y1 10
    %define DELETE_X2 135
    %define DELETE_Y2 30

    %define RUN_X1 150
    %define RUN_Y1 10
    %define RUN_X2 200
    %define RUN_Y2 30

    ; CANVAS
    %define CANVAS_X1 108
    %define CANVAS_Y1 193
    %define CANVAS_X2 556
    %define CANVAS_Y2 641

global main

section .text

draw_rectangle:
    ; frame loop - rectangle
    xor ecx, ecx
    mov eax, [esp+32]     ; get (0,0)

    .yloop_rectangle:
        cmp ecx, HEIGHT
        jge .yend_rectangle

        xor edx, edx
        .xloop_rectangle:
            cmp edx, WIDTH
            jge .xend_rectangle

            mov ebx, [esp+28]   ; y1
            cmp ecx, ebx
            jnge .skip_rectangle
            mov ebx, [esp+24]   ; x1
            cmp ecx, ebx
            jnge .skip_rectangle

            mov ebx, [esp+20]   ; y2
            cmp ecx, ebx
            jnge .skip_rectangle
            mov ebx, [esp+16]   ; x2
            cmp ecx, ebx
            jnge .skip_rectangle

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_rectangle:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_rectangle

        .xend_rectangle:
            inc ecx
            jmp .yloop_rectangle

    .yend_rectangle:
    ret

canvas_init:
    ; frame loop - canvas_init
    xor ecx, ecx
    mov eax, canvas_data

    .loop_canvas_init:
        cmp ecx, 200704 ; canvas area
        jge .end_canvas_init

            ; Pixel color in RGBA
            ; blue
            mov ebx, 255
            mov	[eax], bl
            ; green
            mov ebx, 0
            mov	[eax+1], bl
            ; red
            mov ebx, 204
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            add eax, 4
            inc ecx

        jmp .loop_canvas_init

    .end_canvas_init:
    ret

draw_letter_D:
    ; frame loop - letter_D1
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_D1:
        cmp ecx, HEIGHT
        jge .yend_letter_D1

        xor edx, edx
        .xloop_letter_D1:
            cmp edx, WIDTH
            jge .xend_letter_D1

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_D1
            mov ebx, 50   ; x1
            cmp edx, ebx
            jnge .skip_letter_D1

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_D1
            mov ebx, 52   ; x2
            cmp edx, ebx
            jge .skip_letter_D1

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_D1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_D1

        .xend_letter_D1:
            inc ecx
            jmp .yloop_letter_D1

    .yend_letter_D1:

    ; frame loop - letter_D2
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_D2:
        cmp ecx, HEIGHT
        jge .yend_letter_D2

        xor edx, edx
        .xloop_letter_D2:
            cmp edx, WIDTH
            jge .xend_letter_D2

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_D2
            mov ebx, 52   ; x1
            cmp edx, ebx
            jnge .skip_letter_D2

            mov ebx, 12   ; y2
            cmp ecx, ebx
            jge .skip_letter_D2
            mov ebx, 56   ; x2
            cmp edx, ebx
            jge .skip_letter_D2

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_D2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_D2

        .xend_letter_D2:
            inc ecx
            jmp .yloop_letter_D2

    .yend_letter_D2:

    ; frame loop - letter_D3
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_D3:
        cmp ecx, HEIGHT
        jge .yend_letter_D3

        xor edx, edx
        .xloop_letter_D3:
            cmp edx, WIDTH
            jge .xend_letter_D3

            mov ebx, 28   ; y1
            cmp ecx, ebx
            jnge .skip_letter_D3
            mov ebx, 52   ; x1
            cmp edx, ebx
            jnge .skip_letter_D3

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_D3
            mov ebx, 56   ; x2
            cmp edx, ebx
            jge .skip_letter_D3

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_D3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_D3

        .xend_letter_D3:
            inc ecx
            jmp .yloop_letter_D3

    .yend_letter_D3:

    ; frame loop - letter_D4
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_D4:
        cmp ecx, HEIGHT
        jge .yend_letter_D4

        xor edx, edx
        .xloop_letter_D4:
            cmp edx, WIDTH
            jge .xend_letter_D4

            mov ebx, 12   ; y1
            cmp ecx, ebx
            jnge .skip_letter_D4
            mov ebx, 56   ; x1
            cmp edx, ebx
            jnge .skip_letter_D4

            mov ebx, 14   ; y2
            cmp ecx, ebx
            jge .skip_letter_D4
            mov ebx, 60   ; x2
            cmp edx, ebx
            jge .skip_letter_D4

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_D4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_D4

        .xend_letter_D4:
            inc ecx
            jmp .yloop_letter_D4

    .yend_letter_D4:

    ; frame loop - letter_D5
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_D5:
        cmp ecx, HEIGHT
        jge .yend_letter_D5

        xor edx, edx
        .xloop_letter_D5:
            cmp edx, WIDTH
            jge .xend_letter_D5

            mov ebx, 26   ; y1
            cmp ecx, ebx
            jnge .skip_letter_D5
            mov ebx, 56   ; x1
            cmp edx, ebx
            jnge .skip_letter_D5

            mov ebx, 28   ; y2
            cmp ecx, ebx
            jge .skip_letter_D5
            mov ebx, 60   ; x2
            cmp edx, ebx
            jge .skip_letter_D5

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_D5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_D5

        .xend_letter_D5:
            inc ecx
            jmp .yloop_letter_D5

    .yend_letter_D5:

    ; frame loop - letter_D6
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_D6:
        cmp ecx, HEIGHT
        jge .yend_letter_D6

        xor edx, edx
        .xloop_letter_D6:
            cmp edx, WIDTH
            jge .xend_letter_D6

            mov ebx, 14   ; y1
            cmp ecx, ebx
            jnge .skip_letter_D6
            mov ebx, 60   ; x1
            cmp edx, ebx
            jnge .skip_letter_D6

            mov ebx, 26   ; y2
            cmp ecx, ebx
            jge .skip_letter_D6
            mov ebx, 62   ; x2
            cmp edx, ebx
            jge .skip_letter_D6

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_D6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_D6

        .xend_letter_D6:
            inc ecx
            jmp .yloop_letter_D6

    .yend_letter_D6:
    ret
    
draw_letter_E:
    ; frame loop - letter_E1
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_E1:
        cmp ecx, HEIGHT
        jge .yend_letter_E1

        xor edx, edx
        .xloop_letter_E1:
            cmp edx, WIDTH
            jge .xend_letter_E1

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_E1
            mov ebx, 50   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_E1

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_E1
            mov ebx, 52   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_E1

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_E1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_E1

        .xend_letter_E1:
            inc ecx
            jmp .yloop_letter_E1

    .yend_letter_E1:

    ; frame loop - letter_E2
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_E2:
        cmp ecx, HEIGHT
        jge .yend_letter_E2

        xor edx, edx
        .xloop_letter_E2:
            cmp edx, WIDTH
            jge .xend_letter_E2

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_E2
            mov ebx, 52   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_E2

            mov ebx, 12   ; y2
            cmp ecx, ebx
            jge .skip_letter_E2
            mov ebx, 58   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_E2

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_E2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_E2

        .xend_letter_E2:
            inc ecx
            jmp .yloop_letter_E2

    .yend_letter_E2:

    ; frame loop - letter_E3
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_E3:
        cmp ecx, HEIGHT
        jge .yend_letter_E3

        xor edx, edx
        .xloop_letter_E3:
            cmp edx, WIDTH
            jge .xend_letter_E3

            mov ebx, 20   ; y1
            cmp ecx, ebx
            jnge .skip_letter_E3
            mov ebx, 52   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_E3

            mov ebx, 22   ; y2
            cmp ecx, ebx
            jge .skip_letter_E3
            mov ebx, 58   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_E3

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_E3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_E3

        .xend_letter_E3:
            inc ecx
            jmp .yloop_letter_E3

    .yend_letter_E3:

    ; frame loop - letter_E4
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_E4:
        cmp ecx, HEIGHT
        jge .yend_letter_E4

        xor edx, edx
        .xloop_letter_E4:
            cmp edx, WIDTH
            jge .xend_letter_E4

            mov ebx, 28   ; y1
            cmp ecx, ebx
            jnge .skip_letter_E4
            mov ebx, 52   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_E4

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_E4
            mov ebx, 58   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_E4

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_E4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_E4

        .xend_letter_E4:
            inc ecx
            jmp .yloop_letter_E4

    .yend_letter_E4:
    ret

draw_letter_L:
    ; frame loop - letter_L1
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_L1:
        cmp ecx, HEIGHT
        jge .yend_letter_L1

        xor edx, edx
        .xloop_letter_L1:
            cmp edx, WIDTH
            jge .xend_letter_L1

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_L1
            mov ebx, 50   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_L1

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_L1
            mov ebx, 52   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_L1

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_L1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_L1

        .xend_letter_L1:
            inc ecx
            jmp .yloop_letter_L1

    .yend_letter_L1:

    ; frame loop - letter_L2
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_L2:
        cmp ecx, HEIGHT
        jge .yend_letter_L2

        xor edx, edx
        .xloop_letter_L2:
            cmp edx, WIDTH
            jge .xend_letter_L2

            mov ebx, 28   ; y1
            cmp ecx, ebx
            jnge .skip_letter_L2
            mov ebx, 52   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_L2

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_L2
            mov ebx, 58   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_L2

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_L2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_L2

        .xend_letter_L2:
            inc ecx
            jmp .yloop_letter_L2

    .yend_letter_L2:
    ret

draw_letter_T:
    ; frame loop - letter_T1
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_T1:
        cmp ecx, HEIGHT
        jge .yend_letter_T1

        xor edx, edx
        .xloop_letter_T1:
            cmp edx, WIDTH
            jge .xend_letter_T1

            mov ebx, 12   ; y1
            cmp ecx, ebx
            jnge .skip_letter_T1
            mov ebx, 56   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_T1

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_T1
            mov ebx, 58   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_T1

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_T1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_T1

        .xend_letter_T1:
            inc ecx
            jmp .yloop_letter_T1

    .yend_letter_T1:

    ; frame loop - letter_T2
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_T2:
        cmp ecx, HEIGHT
        jge .yend_letter_T2

        xor edx, edx
        .xloop_letter_T2:
            cmp edx, WIDTH
            jge .xend_letter_T2

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_T2
            mov ebx, 50   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_T2

            mov ebx, 12   ; y2
            cmp ecx, ebx
            jge .skip_letter_T2
            mov ebx, 64   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_T2

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_T2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_T2

        .xend_letter_T2:
            inc ecx
            jmp .yloop_letter_T2

    .yend_letter_T2:
    ret

draw_letter_R:
    ; frame loop - letter_R1
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_R1:
        cmp ecx, HEIGHT
        jge .yend_letter_R1

        xor edx, edx
        .xloop_letter_R1:
            cmp edx, WIDTH
            jge .xend_letter_R1

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_R1
            mov ebx, 150   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_R1

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_R1
            mov ebx, 152   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_R1

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_R1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_R1

        .xend_letter_R1:
            inc ecx
            jmp .yloop_letter_R1

    .yend_letter_R1:

    ; frame loop - letter_R2
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_R2:
        cmp ecx, HEIGHT
        jge .yend_letter_R2

        xor edx, edx
        .xloop_letter_R2:
            cmp edx, WIDTH
            jge .xend_letter_R2

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_R2
            mov ebx, 152   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_R2

            mov ebx, 12   ; y2
            cmp ecx, ebx
            jge .skip_letter_R2
            mov ebx, 156   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_R2

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_R2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_R2

        .xend_letter_R2:
            inc ecx
            jmp .yloop_letter_R2

    .yend_letter_R2:

    ; frame loop - letter_R3
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_R3:
        cmp ecx, HEIGHT
        jge .yend_letter_R3

        xor edx, edx
        .xloop_letter_R3:
            cmp edx, WIDTH
            jge .xend_letter_R3

            mov ebx, 20   ; y1
            cmp ecx, ebx
            jnge .skip_letter_R3
            mov ebx, 152   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_R3

            mov ebx, 22   ; y2
            cmp ecx, ebx
            jge .skip_letter_R3
            mov ebx, 156   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_R3

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_R3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_R3

        .xend_letter_R3:
            inc ecx
            jmp .yloop_letter_R3

    .yend_letter_R3:

    ; frame loop - letter_R4
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_R4:
        cmp ecx, HEIGHT
        jge .yend_letter_R4

        xor edx, edx
        .xloop_letter_R4:
            cmp edx, WIDTH
            jge .xend_letter_R4

            mov ebx, 12   ; y1
            cmp ecx, ebx
            jnge .skip_letter_R4
            mov ebx, 156   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_R4

            mov ebx, 14   ; y2
            cmp ecx, ebx
            jge .skip_letter_R4
            mov ebx, 158   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_R4

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_R4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_R4

        .xend_letter_R4:
            inc ecx
            jmp .yloop_letter_R4

    .yend_letter_R4:

    ; frame loop - letter_R5
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_R5:
        cmp ecx, HEIGHT
        jge .yend_letter_R5

        xor edx, edx
        .xloop_letter_R5:
            cmp edx, WIDTH
            jge .xend_letter_R5

            mov ebx, 18   ; y1
            cmp ecx, ebx
            jnge .skip_letter_R5
            mov ebx, 156   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_R5

            mov ebx, 20   ; y2
            cmp ecx, ebx
            jge .skip_letter_R5
            mov ebx, 158   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_R5

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_R5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_R5

        .xend_letter_R5:
            inc ecx
            jmp .yloop_letter_R5

    .yend_letter_R5:

    ; frame loop - letter_R6
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_R6:
        cmp ecx, HEIGHT
        jge .yend_letter_R6

        xor edx, edx
        .xloop_letter_R6:
            cmp edx, WIDTH
            jge .xend_letter_R6

            mov ebx, 22   ; y1
            cmp ecx, ebx
            jnge .skip_letter_R6
            mov ebx, 156   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_R6

            mov ebx, 24   ; y2
            cmp ecx, ebx
            jge .skip_letter_R6
            mov ebx, 158   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_R6

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_R6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_R6

        .xend_letter_R6:
            inc ecx
            jmp .yloop_letter_R6

    .yend_letter_R6:

    ; frame loop - letter_R7
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_R7:
        cmp ecx, HEIGHT
        jge .yend_letter_R7

        xor edx, edx
        .xloop_letter_R7:
            cmp edx, WIDTH
            jge .xend_letter_R7

            mov ebx, 14   ; y1
            cmp ecx, ebx
            jnge .skip_letter_R7
            mov ebx, 158   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_R7

            mov ebx, 18   ; y2
            cmp ecx, ebx
            jge .skip_letter_R7
            mov ebx, 160   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_R7

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_R7:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_R7

        .xend_letter_R7:
            inc ecx
            jmp .yloop_letter_R7

    .yend_letter_R7:

    ; frame loop - letter_R8
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_R8:
        cmp ecx, HEIGHT
        jge .yend_letter_R8

        xor edx, edx
        .xloop_letter_R8:
            cmp edx, WIDTH
            jge .xend_letter_R8

            mov ebx, 24   ; y1
            cmp ecx, ebx
            jnge .skip_letter_R8
            mov ebx, 158   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_R8

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_R8
            mov ebx, 160   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_R8

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_R8:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_R8

        .xend_letter_R8:
            inc ecx
            jmp .yloop_letter_R8

    .yend_letter_R8:
    ret

draw_letter_U:
    ; frame loop - letter_U1
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_U1:
        cmp ecx, HEIGHT
        jge .yend_letter_U1

        xor edx, edx
        .xloop_letter_U1:
            cmp edx, WIDTH
            jge .xend_letter_U1

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_U1
            mov ebx, 150   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_U1

            mov ebx, 26   ; y2
            cmp ecx, ebx
            jge .skip_letter_U1
            mov ebx, 152   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_U1

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_U1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_U1

        .xend_letter_U1:
            inc ecx
            jmp .yloop_letter_U1

    .yend_letter_U1:

    ; frame loop - letter_U2
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_U2:
        cmp ecx, HEIGHT
        jge .yend_letter_U2

        xor edx, edx
        .xloop_letter_U2:
            cmp edx, WIDTH
            jge .xend_letter_U2

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_U2
            mov ebx, 162   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_U2

            mov ebx, 26   ; y2
            cmp ecx, ebx
            jge .skip_letter_U2
            mov ebx, 164   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_U2

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_U2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_U2

        .xend_letter_U2:
            inc ecx
            jmp .yloop_letter_U2

    .yend_letter_U2:

    ; frame loop - letter_U3
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_U3:
        cmp ecx, HEIGHT
        jge .yend_letter_U3

        xor edx, edx
        .xloop_letter_U3:
            cmp edx, WIDTH
            jge .xend_letter_U3

            mov ebx, 26   ; y1
            cmp ecx, ebx
            jnge .skip_letter_U3
            mov ebx, 152   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_U3

            mov ebx, 28   ; y2
            cmp ecx, ebx
            jge .skip_letter_U3
            mov ebx, 154   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_U3

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_U3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_U3

        .xend_letter_U3:
            inc ecx
            jmp .yloop_letter_U3

    .yend_letter_U3:

    ; frame loop - letter_U4
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_U4:
        cmp ecx, HEIGHT
        jge .yend_letter_U4

        xor edx, edx
        .xloop_letter_U4:
            cmp edx, WIDTH
            jge .xend_letter_U4

            mov ebx, 26   ; y1
            cmp ecx, ebx
            jnge .skip_letter_U4
            mov ebx, 160   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_U4

            mov ebx, 28   ; y2
            cmp ecx, ebx
            jge .skip_letter_U4
            mov ebx, 162   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_U4

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_U4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_U4

        .xend_letter_U4:
            inc ecx
            jmp .yloop_letter_U4

    .yend_letter_U4:

    ; frame loop - letter_U5
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_U5:
        cmp ecx, HEIGHT
        jge .yend_letter_U5

        xor edx, edx
        .xloop_letter_U5:
            cmp edx, WIDTH
            jge .xend_letter_U5

            mov ebx, 28   ; y1
            cmp ecx, ebx
            jnge .skip_letter_U5
            mov ebx, 154   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_U5

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_U5
            mov ebx, 160   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_U5

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_U5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_U5

        .xend_letter_U5:
            inc ecx
            jmp .yloop_letter_U5

    .yend_letter_U5:
    ret
draw_letter_N:
    ; frame loop - letter_N1
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_N1:
        cmp ecx, HEIGHT
        jge .yend_letter_N1

        xor edx, edx
        .xloop_letter_N1:
            cmp edx, WIDTH
            jge .xend_letter_N1

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_N1
            mov ebx, 150   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_N1

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_N1
            mov ebx, 152   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_N1

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_N1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_N1

        .xend_letter_N1:
            inc ecx
            jmp .yloop_letter_N1

    .yend_letter_N1:

    ; frame loop - letter_N2
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_N2:
        cmp ecx, HEIGHT
        jge .yend_letter_N2

        xor edx, edx
        .xloop_letter_N2:
            cmp edx, WIDTH
            jge .xend_letter_N2

            mov ebx, 10   ; y1
            cmp ecx, ebx
            jnge .skip_letter_N2
            mov ebx, 162   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_N2

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_N2
            mov ebx, 164   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_N2

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_N2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_N2

        .xend_letter_N2:
            inc ecx
            jmp .yloop_letter_N2

    .yend_letter_N2:

    ; frame loop - letter_N3
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_N3:
        cmp ecx, HEIGHT
        jge .yend_letter_N3

        xor edx, edx
        .xloop_letter_N3:
            cmp edx, WIDTH
            jge .xend_letter_N3

            mov ebx, 12   ; y1
            cmp ecx, ebx
            jnge .skip_letter_N3
            mov ebx, 152   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_N3

            mov ebx, 16   ; y2
            cmp ecx, ebx
            jge .skip_letter_N3
            mov ebx, 154   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_N3

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_N3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_N3

        .xend_letter_N3:
            inc ecx
            jmp .yloop_letter_N3

    .yend_letter_N3:

    ; frame loop - letter_N4
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_N4:
        cmp ecx, HEIGHT
        jge .yend_letter_N4

        xor edx, edx
        .xloop_letter_N4:
            cmp edx, WIDTH
            jge .xend_letter_N4

            mov ebx, 24   ; y1
            cmp ecx, ebx
            jnge .skip_letter_N4
            mov ebx, 160   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_N4

            mov ebx, 28   ; y2
            cmp ecx, ebx
            jge .skip_letter_N4
            mov ebx, 162   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_N4

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_N4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_N4

        .xend_letter_N4:
            inc ecx
            jmp .yloop_letter_N4

    .yend_letter_N4:

    ; frame loop - letter_N5
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_N5:
        cmp ecx, HEIGHT
        jge .yend_letter_N5

        xor edx, edx
        .xloop_letter_N5:
            cmp edx, WIDTH
            jge .xend_letter_N5

            mov ebx, 16   ; y1
            cmp ecx, ebx
            jnge .skip_letter_N5
            mov ebx, 154   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_N5

            mov ebx, 18   ; y2
            cmp ecx, ebx
            jge .skip_letter_N5
            mov ebx, 156   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_N5

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_N5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_N5

        .xend_letter_N5:
            inc ecx
            jmp .yloop_letter_N5

    .yend_letter_N5:

    ; frame loop - letter_N6
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_N6:
        cmp ecx, HEIGHT
        jge .yend_letter_N6

        xor edx, edx
        .xloop_letter_N6:
            cmp edx, WIDTH
            jge .xend_letter_N6

            mov ebx, 22   ; y1
            cmp ecx, ebx
            jnge .skip_letter_N6
            mov ebx, 158   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_N6

            mov ebx, 24   ; y2
            cmp ecx, ebx
            jge .skip_letter_N6
            mov ebx, 160   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_N6

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_N6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_N6

        .xend_letter_N6:
            inc ecx
            jmp .yloop_letter_N6

    .yend_letter_N6:

    ; frame loop - letter_N7
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_N7:
        cmp ecx, HEIGHT
        jge .yend_letter_N7

        xor edx, edx
        .xloop_letter_N7:
            cmp edx, WIDTH
            jge .xend_letter_N7

            mov ebx, 18   ; y1
            cmp ecx, ebx
            jnge .skip_letter_N7
            mov ebx, 156   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_N7

            mov ebx, 22   ; y2
            cmp ecx, ebx
            jge .skip_letter_N7
            mov ebx, 158   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_N7

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+12]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+4]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_letter_N7:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_N7

        .xend_letter_N7:
            inc ecx
            jmp .yloop_letter_N7

    .yend_letter_N7:
    ret


draw_DELETE:
    ; frame loop - DELETE
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    ; Pixel color in RGBA
    ; handle eventloop return
    cmp esi, 10
    je .DELETE_press_color
        ; draw D
            push eax    ; save (0,0)
            mov ebx, 0
            push ebx    ; start poz
            mov ebx, 255  
            push ebx    ; push BLUE
            mov ebx, 255  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_D
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw E
            push eax    ; save (0,0)
            mov ebx, 16
            push ebx    ; start poz
            mov ebx, 255  
            push ebx    ; push BLUE
            mov ebx, 255  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_E
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw L
            push eax    ; save (0,0)
            mov ebx, 28
            push ebx    ; start poz
            mov ebx, 255  
            push ebx    ; push BLUE
            mov ebx, 255  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_L
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw E
            push eax    ; save (0,0)
            mov ebx, 40
            push ebx    ; start poz
            mov ebx, 255  
            push ebx    ; push BLUE
            mov ebx, 255  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_E
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw T
            push eax    ; save (0,0)
            mov ebx, 52
            push ebx    ; start poz
            mov ebx, 255  
            push ebx    ; push BLUE
            mov ebx, 255  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_T
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw E
            push eax    ; save (0,0)
            mov ebx, 70
            push ebx    ; start poz
            mov ebx, 255  
            push ebx    ; push BLUE
            mov ebx, 255  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_E
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)
    jmp .DELETE_default_color
    .DELETE_press_color:
        ; draw D
            push eax    ; save (0,0)
            mov ebx, 0
            push ebx    ; start poz
            mov ebx, 0  
            push ebx    ; push BLUE
            mov ebx, 98  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_D
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw E
            push eax    ; save (0,0)
            mov ebx, 16
            push ebx    ; start poz
            mov ebx, 0  
            push ebx    ; push BLUE
            mov ebx, 98  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_E
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw L
            push eax    ; save (0,0)
            mov ebx, 28
            push ebx    ; start poz
            mov ebx, 0  
            push ebx    ; push BLUE
            mov ebx, 98  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_L
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw E
            push eax    ; save (0,0)
            mov ebx, 40
            push ebx    ; start poz
            mov ebx, 0  
            push ebx    ; push BLUE
            mov ebx, 98  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_E
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw T
            push eax    ; save (0,0)
            mov ebx, 52
            push ebx    ; start poz
            mov ebx, 0  
            push ebx    ; push BLUE
            mov ebx, 98  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_T
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw E
            push eax    ; save (0,0)
            mov ebx, 70
            push ebx    ; start poz
            mov ebx, 0  
            push ebx    ; push BLUE
            mov ebx, 98  
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_E
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)
    .DELETE_default_color:
    ret

draw_RUN:
    ; frame loop - RUN
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    ; Pixel color in RGBA
    ; handle eventloop return
    cmp esi, 20
    je .RUN_press_color
        ; draw R
            push eax    ; save (0,0)
            mov ebx, 0
            push ebx    ; start poz
            mov ebx, 255
            push ebx    ; push BLUE
            mov ebx, 255
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_R
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw U
            push eax    ; save (0,0)
            mov ebx, 14
            push ebx    ; start poz
            mov ebx, 255
            push ebx    ; push BLUE
            mov ebx, 255
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_U
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw N
            push eax    ; save (0,0)
            mov ebx, 32
            push ebx    ; start poz
            mov ebx, 255
            push ebx    ; push BLUE
            mov ebx, 255
            push ebx    ; push GREEN
            mov ebx, 255
            push ebx    ; push RED

            call draw_letter_N
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)
    jmp .RUN_default_color
    .RUN_press_color:
        ; draw R
            push eax    ; save (0,0)
            mov ebx, 0
            push ebx    ; start poz
            mov ebx, 134
            push ebx    ; push BLUE
            mov ebx, 246
            push ebx    ; push GREEN
            mov ebx, 21
            push ebx    ; push RED

            call draw_letter_R
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw U
            push eax    ; save (0,0)
            mov ebx, 14
            push ebx    ; start poz
            mov ebx, 134
            push ebx    ; push BLUE
            mov ebx, 246
            push ebx    ; push GREEN
            mov ebx, 21
            push ebx    ; push RED

            call draw_letter_U
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)

        ; draw N
            push eax    ; save (0,0)
            mov ebx, 32
            push ebx    ; start poz
            mov ebx, 134
            push ebx    ; push BLUE
            mov ebx, 246
            push ebx    ; push GREEN
            mov ebx, 21
            push ebx    ; push RED

            call draw_letter_N
            
            pop ebx    ; pop RED
            pop ebx    ; pop GREEN
            pop ebx    ; pop BLUE
            pop ebx    ; pop start poz 
            pop eax    ; get (0,0)
        .RUN_default_color:
    ret

handle_delete:
    call canvas_init
    ret

handle_run:
;TODO
    ret

handle_canvas:
    ; get local (x,y) from global (eax,ebx)
    mov ecx, 108    ; x
    sub eax, ecx

    mov ecx, 193    ; y
    sub ebx, ecx

    mov ecx, 448    ; CANVAS_WIDTH
    imul ecx, ebx
    add ecx, eax
    imul ecx, 4     ; get start poz in canvas_data

    mov eax, canvas_data
    add eax, ecx    ; set start poz

    ; Pixel color in RGBA
    ; blue
    mov ebx, 255
    mov	[eax], bl
    ; green
    mov ebx, 255
    mov	[eax+1], bl
    ; red
    mov ebx, 255
    mov	[eax+2], bl
    ; zero
    xor	ebx, ebx
    mov	[eax+3], bl

    ret

main:
	; Create the graphics window
    mov	eax, WIDTH		; window width (X)
	mov	ebx, HEIGHT		; window hieght (Y)
	mov	ecx, 0			; window mode
	mov	edx, caption	; window caption
	call gfx_init
	
	test eax, eax		; if the return value is 0, something went wrong
	jnz	.init
	; Print error message and exit
	mov	eax, errormsg
	call io_writestr
	call io_writeln
	ret

    ; prerequisite
    .init:
        xor esi, esi    ; return eventloop info
        xor edi, edi    ; eventloop timeout
        call canvas_init
        jmp .mainloop

    ; Main loop
    .mainloop:
        call gfx_map    ; map eax to framebuffer
        push eax        ; save (0,0)

        ; draw UI
            ; draw BG colors
                ; frame loop - NAVBAR
                xor ecx, ecx
                pop eax     ; get (0,0)
                push eax    ; save (0,0)
                .yloop_NAVBAR:
                    cmp ecx, HEIGHT
                    jge .yend_NAVBAR

                    xor edx, edx
                    .xloop_NAVBAR:
                        cmp edx, WIDTH
                        jge .xend_NAVBAR

                        cmp ecx, NAVBAR_Y1    ; y1
                        jnge .skip_NAVBAR
                        cmp edx, NAVBAR_X1    ; x1
                        jnge .skip_NAVBAR

                        cmp ecx, NAVBAR_Y2    ;y2
                        jge .skip_NAVBAR
                        cmp edx, NAVBAR_X2    ;x2
                        jge .skip_NAVBAR

                        ; Pixel color in RGBA
                        ; blue
                        mov ebx, 74
                        mov	[eax], bl
                        ; green
                        mov ebx, 68
                        mov	[eax+1], bl
                        ; red
                        mov ebx, 67
                        mov	[eax+2], bl
                        ; zero
                        xor	ebx, ebx
                        mov	[eax+3], bl

                        .skip_NAVBAR:
                        add	eax, 4  ; next pixel
                        inc edx
                        jmp .xloop_NAVBAR

                    .xend_NAVBAR:
                        inc ecx
                        jmp .yloop_NAVBAR

                .yend_NAVBAR:

                ; frame loop - SIDEBAR
                xor ecx, ecx
                pop eax     ; get (0,0)
                push eax    ; save (0,0)
                .yloop_SIDEBAR:
                    cmp ecx, HEIGHT
                    jge .yend_SIDEBAR

                    xor edx, edx
                    .xloop_SIDEBAR:
                        cmp edx, WIDTH
                        jge .xend_SIDEBAR

                        cmp ecx, SIDEBAR_Y1    ; y1
                        jnge .skip_SIDEBAR
                        cmp edx, SIDEBAR_X1    ; x1
                        jnge .skip_SIDEBAR

                        cmp ecx, SIDEBAR_Y2    ;y2
                        jge .skip_SIDEBAR
                        cmp edx, SIDEBAR_X2    ;x2
                        jge .skip_SIDEBAR

                        ; Pixel color in RGBA
                        ; blue
                        mov ebx, 74
                        mov	[eax], bl
                        ; green
                        mov ebx, 68
                        mov	[eax+1], bl
                        ; red
                        mov ebx, 67
                        mov	[eax+2], bl
                        ; zero
                        xor	ebx, ebx
                        mov	[eax+3], bl

                        .skip_SIDEBAR:
                        add	eax, 4  ; next pixel
                        inc edx
                        jmp .xloop_SIDEBAR

                    .xend_SIDEBAR:
                        inc ecx
                        jmp .yloop_SIDEBAR

                .yend_SIDEBAR:

                ; frame loop - DESC
                xor ecx, ecx
                pop eax     ; get (0,0)
                push eax    ; save (0,0)
                .yloop_DESC:
                    cmp ecx, HEIGHT
                    jge .yend_DESC

                    xor edx, edx
                    .xloop_DESC:
                        cmp edx, WIDTH
                        jge .xend_DESC

                        cmp ecx, DESC_Y1    ; y1
                        jnge .skip_DESC
                        cmp edx, DESC_X1    ; x1
                        jnge .skip_DESC

                        cmp ecx, DESC_Y2    ;y2
                        jge .skip_DESC
                        cmp edx, DESC_X2    ;x2
                        jge .skip_DESC

                        ; Pixel color in RGBA
                        ; blue
                        mov ebx, 74
                        mov	[eax], bl
                        ; green
                        mov ebx, 68
                        mov	[eax+1], bl
                        ; red
                        mov ebx, 67
                        mov	[eax+2], bl
                        ; zero
                        xor	ebx, ebx
                        mov	[eax+3], bl

                        .skip_DESC:
                        add	eax, 4  ; next pixel
                        inc edx
                        jmp .xloop_DESC

                    .xend_DESC:
                        inc ecx
                        jmp .yloop_DESC

                .yend_DESC:

                ; frame loop - BG1
                xor ecx, ecx
                pop eax     ; get (0,0)
                push eax    ; save (0,0)
                .yloop_BG1:
                    cmp ecx, HEIGHT
                    jge .yend_BG1

                    xor edx, edx
                    .xloop_BG1:
                        cmp edx, WIDTH
                        jge .xend_BG1

                        cmp ecx, BG1_Y1    ; y1
                        jnge .skip_BG1
                        cmp edx, BG1_X1    ; x1
                        jnge .skip_BG1

                        cmp ecx, BG1_Y2    ;y2
                        jge .skip_BG1
                        cmp edx, BG1_X2    ;x2
                        jge .skip_BG1

                        ; Pixel color in RGBA
                        ; blue
                        mov ebx, 59
                        mov	[eax], bl
                        ; green
                        mov ebx, 54
                        mov	[eax+1], bl
                        ; red
                        mov ebx, 53
                        mov	[eax+2], bl
                        ; zero
                        xor	ebx, ebx
                        mov	[eax+3], bl

                        .skip_BG1:
                        add	eax, 4  ; next pixel
                        inc edx
                        jmp .xloop_BG1

                    .xend_BG1:
                        inc ecx
                        jmp .yloop_BG1

                .yend_BG1:

                ; frame loop - BG2
                xor ecx, ecx
                pop eax     ; get (0,0)
                push eax    ; save (0,0)
                .yloop_BG2:
                    cmp ecx, HEIGHT
                    jge .yend_BG2

                    xor edx, edx
                    .xloop_BG2:
                        cmp edx, WIDTH
                        jge .xend_BG2

                        cmp ecx, BG2_Y1    ; y1
                        jnge .skip_BG2
                        cmp edx, BG2_X1    ; x1
                        jnge .skip_BG2

                        cmp ecx, BG2_Y2    ;y2
                        jge .skip_BG2
                        cmp edx, BG2_X2    ;x2
                        jge .skip_BG2

                        ; Pixel color in RGBA
                        ; blue
                        mov ebx, 59
                        mov	[eax], bl
                        ; green
                        mov ebx, 54
                        mov	[eax+1], bl
                        ; red
                        mov ebx, 53
                        mov	[eax+2], bl
                        ; zero
                        xor	ebx, ebx
                        mov	[eax+3], bl

                        .skip_BG2:
                        add	eax, 4  ; next pixel
                        inc edx
                        jmp .xloop_BG2

                    .xend_BG2:
                        inc ecx
                        jmp .yloop_BG2

                .yend_BG2:

                ; frame loop - BG3
                xor ecx, ecx
                pop eax     ; get (0,0)
                push eax    ; save (0,0)
                .yloop_BG3:
                    cmp ecx, HEIGHT
                    jge .yend_BG3

                    xor edx, edx
                    .xloop_BG3:
                        cmp edx, WIDTH
                        jge .xend_BG3

                        cmp ecx, BG3_Y1    ; y1
                        jnge .skip_BG3
                        cmp edx, BG3_X1    ; x1
                        jnge .skip_BG3

                        cmp ecx, BG3_Y2    ;y2
                        jge .skip_BG3
                        cmp edx, BG3_X2    ;x2
                        jge .skip_BG3

                        ; Pixel color in RGBA
                        ; blue
                        mov ebx, 59
                        mov	[eax], bl
                        ; green
                        mov ebx, 54
                        mov	[eax+1], bl
                        ; red
                        mov ebx, 53
                        mov	[eax+2], bl
                        ; zero
                        xor	ebx, ebx
                        mov	[eax+3], bl

                        .skip_BG3:
                        add	eax, 4  ; next pixel
                        inc edx
                        jmp .xloop_BG3

                    .xend_BG3:
                        inc ecx
                        jmp .yloop_BG3

                .yend_BG3:

                ; frame loop - BG4
                xor ecx, ecx
                pop eax     ; get (0,0)
                push eax    ; save (0,0)
                .yloop_BG4:
                    cmp ecx, HEIGHT
                    jge .yend_BG4

                    xor edx, edx
                    .xloop_BG4:
                        cmp edx, WIDTH
                        jge .xend_BG4

                        cmp ecx, BG4_Y1    ; y1
                        jnge .skip_BG4
                        cmp edx, BG4_X1    ; x1
                        jnge .skip_BG4

                        cmp ecx, BG4_Y2    ;y2
                        jge .skip_BG4
                        cmp edx, BG4_X2    ;x2
                        jge .skip_BG4

                        ; Pixel color in RGBA
                        ; blue
                        mov ebx, 59
                        mov	[eax], bl
                        ; green
                        mov ebx, 54
                        mov	[eax+1], bl
                        ; red
                        mov ebx, 53
                        mov	[eax+2], bl
                        ; zero
                        xor	ebx, ebx
                        mov	[eax+3], bl

                        .skip_BG4:
                        add	eax, 4  ; next pixel
                        inc edx
                        jmp .xloop_BG4

                    .xend_BG4:
                        inc ecx
                        jmp .yloop_BG4

                .yend_BG4:

                ; frame loop - HORI_SEP
                xor ecx, ecx
                pop eax     ; get (0,0)
                push eax    ; save (0,0)
                .yloop_HORI_SEP:
                    cmp ecx, HEIGHT
                    jge .yend_HORI_SEP

                    xor edx, edx
                    .xloop_HORI_SEP:
                        cmp edx, WIDTH
                        jge .xend_HORI_SEP

                        cmp ecx, HORI_SEP_Y1    ; y1
                        jnge .skip_HORI_SEP
                        cmp edx, HORI_SEP_X1    ; x1
                        jnge .skip_HORI_SEP

                        cmp ecx, HORI_SEP_Y2    ;y2
                        jge .skip_HORI_SEP
                        cmp edx, HORI_SEP_X2    ;x2
                        jge .skip_HORI_SEP

                        ; Pixel color in RGBA
                        ; blue
                        mov ebx, 49
                        mov	[eax], bl
                        ; green
                        mov ebx, 45
                        mov	[eax+1], bl
                        ; red
                        mov ebx, 44
                        mov	[eax+2], bl
                        ; zero
                        xor	ebx, ebx
                        mov	[eax+3], bl

                        .skip_HORI_SEP:
                        add	eax, 4  ; next pixel
                        inc edx
                        jmp .xloop_HORI_SEP

                    .xend_HORI_SEP:
                        inc ecx
                        jmp .yloop_HORI_SEP

                .yend_HORI_SEP:

            ; draw buttons
                call draw_DELETE
                call draw_RUN

            ; draw canvas
                ; go to canvast start poz
                pop eax     ; get (0,0)
                mov ebx, CANVAS_Y1
                mov ecx, WIDTH
                imul ebx, ecx
                
                mov ecx, CANVAS_X1
                add ebx, ecx
                
                mov ecx, 4
                imul ebx, ecx

                add eax, ebx 

                ; copy canvas_data to framebuffer
                xor ecx, ecx
                mov ebx, canvas_data

                .yloop_canvas_draw:
                    cmp ecx, 448    ; y
                    jge .yend_canvas_draw

                    xor edx, edx
                    .xloop_canvas_draw:
                        cmp edx, 448    ; x
                        jge .xend_canvas_draw

                        ; copy
                        push ecx
                        xor ecx, ecx

                        mov ecx, [ebx]
                        mov [eax], ecx
                        add eax, 4
                        add ebx, 4

                        pop ecx
                        inc edx
                        jmp .xloop_canvas_draw

                    .xend_canvas_draw:
                        inc ecx

                        add eax, 1280   ; jump to next valid poz
                        jmp .yloop_canvas_draw
                
                .yend_canvas_draw:

        ; draw frame    
        call gfx_unmap  ; unmap eax from framebuffer
        call gfx_draw   ; draw new frame

        ; event loop 
            ; handle timeout
            cmp esi, 0
            je .eventloop
            cmp edi, 0
            je .timeout_reset
            sub edi, 1
            jmp .eventloop

            .timeout_reset:
            xor esi, esi

        .eventloop:
            call gfx_getevent
                xor ebx, ebx
                mov byte bl, [mouse_pressed]
                cmp ebx, 1
                je .mouse_pressed
            cmp eax, 0
            jz .skip_eventloop

            ; handle exit
            cmp eax, 23
            je .end

            ; handle left click
            .mouse_pressed:
            cmp eax, 1
            jg .eventloop
            cmp eax, -1
            jnge .eventloop

                ; press / release logic
                    cmp eax, 1
                    jne .mouse_released
                    mov byte [mouse_pressed], 0x0001
                    jmp .skip_mouse_released

                    .mouse_released:
                    mov byte [mouse_pressed], 0x0000

                    .skip_mouse_released:

                ; button 1 / button 2 / canvas
                call gfx_getmouse
                cmp ebx, BUTTONS_WRAPPER_Y2
                jg .canvas_event
                    
                    ; button 1 / button 2
                    ; (y1,y2)
                    cmp ebx, DELETE_Y1
                    jnge .miss_event
                    cmp ebx, DELETE_Y2
                    jg .miss_event
                        
                    cmp eax, RUN_X1
                    jge .button2_event

                        ; button 1
                        ; (x1,x2)
                            cmp eax, DELETE_X1
                            jnge .miss_event
                            cmp eax, DELETE_X2
                            jg .miss_event

                                ; press logic
                                mov esi, 10
                                mov edi, 6
                                call handle_delete
                                jmp .eventloop

                        ; button 2
                        ; (x1,x2)
                        .button2_event:
                            cmp eax, RUN_X1
                            jnge .miss_event
                            cmp eax, RUN_X2
                            jg .miss_event

                                ; press logic
                                mov esi, 20
                                mov edi, 6
                                call handle_run
                                jmp .eventloop

                    ; canvas
                    .canvas_event:
                        ; (x1,x2)
                        cmp eax, CANVAS_X1
                        jnge .miss_event
                        cmp eax, CANVAS_X2
                        jg .miss_event

                        ; (y1,y2)
                        cmp ebx, CANVAS_Y1
                        jnge .miss_event
                        cmp ebx, CANVAS_Y2
                        jg .miss_event

                            ; press logic
                            call handle_canvas
                            jmp .eventloop
                
                ; left click on empty space
                .miss_event:

            jmp .eventloop
        .skip_eventloop:

        ; 62 fps main loop
        mov eax, 16
        call sleep
        jmp .mainloop

    ; cleanup + close the window
    .end:
        call gfx_destroy
        ret

section .bss
    canvas_data resb 448 * 448 * 4
    mouse_pressed resb 1

section .data
    caption db "Get da numbs w/ CNN", 0
	errormsg db "ERROR: could not initialize graphics!", 0
