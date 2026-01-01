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

    %define DESC_X1 616
    %define DESC_Y1 67
    %define DESC_X2 768
    %define DESC_Y2 768

    %define BG1_X1 47   ; top
    %define BG1_Y1 67
    %define BG1_X2 616
    %define BG1_Y2 193

    %define BG2_X1 47   ; bottom
    %define BG2_Y1 641
    %define BG2_X2 616
    %define BG2_Y2 768

    %define BG3_X1 47    ; left
    %define BG3_Y1 193
    %define BG3_X2 108
    %define BG3_Y2 641

    %define BG4_X1 555    ; right
    %define BG4_Y1 193
    %define BG4_X2 616
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
    %define DELETE_X2 100
    %define DELETE_Y2 30

    %define RUN_X1 120
    %define RUN_Y1 10
    %define RUN_X2 150
    %define RUN_Y2 30

    ; CANVAS
    %define CANVAS_X1 120
    %define CANVAS_Y1 10
    %define CANVAS_X2 150
    %define CANVAS_Y2 30

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
; frame loop - letter_T
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_T:
        cmp ecx, HEIGHT
        jge .yend_letter_T

        xor edx, edx
        .xloop_letter_T:
            cmp edx, WIDTH
            jge .xend_letter_T

            mov ebx, 0   ; y1
            cmp ecx, ebx
            jnge .skip_letter_T
            mov ebx, 50   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_T

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_T
            mov ebx, 52   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_T

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

            .skip_letter_T:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_T

        .xend_letter_T:
            inc ecx
            jmp .yloop_letter_T

    .yend_letter_T:
    ret

draw_letter_R:
; frame loop - letter_R
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_R:
        cmp ecx, HEIGHT
        jge .yend_letter_R

        xor edx, edx
        .xloop_letter_R:
            cmp edx, WIDTH
            jge .xend_letter_R

            mov ebx, 0   ; y1
            cmp ecx, ebx
            jnge .skip_letter_R
            mov ebx, 50   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_R

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_R
            mov ebx, 52   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_R

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

            .skip_letter_R:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_R

        .xend_letter_R:
            inc ecx
            jmp .yloop_letter_R

    .yend_letter_R:
    ret

draw_letter_U:
; frame loop - letter_U
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_U:
        cmp ecx, HEIGHT
        jge .yend_letter_U

        xor edx, edx
        .xloop_letter_U:
            cmp edx, WIDTH
            jge .xend_letter_U

            mov ebx, 0   ; y1
            cmp ecx, ebx
            jnge .skip_letter_U
            mov ebx, 50   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_U

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_U
            mov ebx, 52   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_U

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

            .skip_letter_U:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_U

        .xend_letter_U:
            inc ecx
            jmp .yloop_letter_U

    .yend_letter_U:
    ret
draw_letter_N:
; frame loop - letter_N
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_letter_N:
        cmp ecx, HEIGHT
        jge .yend_letter_N

        xor edx, edx
        .xloop_letter_N:
            cmp edx, WIDTH
            jge .xend_letter_N

            mov ebx, 0   ; y1
            cmp ecx, ebx
            jnge .skip_letter_N
            mov ebx, 50   ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_letter_N

            mov ebx, 30   ; y2
            cmp ecx, ebx
            jge .skip_letter_N
            mov ebx, 52   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_letter_N

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

            .skip_letter_N:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_letter_N

        .xend_letter_N:
            inc ecx
            jmp .yloop_letter_N

    .yend_letter_N:
    ret


draw_DELETE:
    ; frame loop - DELETE
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

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


    ret

draw_RUN:
    ; frame loop - RUN
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    .yloop_RUN:
        cmp ecx, HEIGHT
        jge .yend_RUN

        xor edx, edx
        .xloop_RUN:
            cmp edx, WIDTH
            jge .xend_RUN

            cmp ecx, RUN_Y1    ; y1
            jnge .skip_RUN
            cmp edx, RUN_X1    ; x1
            jnge .skip_RUN

            cmp ecx, RUN_Y2    ;y2
            jge .skip_RUN
            cmp edx, RUN_X2    ;x2
            jge .skip_RUN

            ; Pixel color in RGBA
            ; handle eventloop return
                cmp esi, 20
                je .RUN_press_color

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

                jmp .RUN_default_color

                    .RUN_press_color:
                    ; blue
                    mov ebx, 134
                    mov	[eax], bl
                    ; green
                    mov ebx, 246
                    mov	[eax+1], bl
                    ; red
                    mov ebx, 21
                    mov	[eax+2], bl
                    ; zero
                    xor	ebx, ebx
                    mov	[eax+3], bl

                .RUN_default_color:

            .skip_RUN:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_RUN

        .xend_RUN:
            inc ecx
            jmp .yloop_RUN

    .yend_RUN:
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
                ; TODO

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
            cmp eax, 0
            jz .skip_eventloop

            ; handle exit
            cmp eax, 23
            je .end

            ; handle left click
            cmp eax, 1
            jne .eventloop

                ; button 1 / button 2 / canvas
                call gfx_getmouse
                cmp ebx, 40
                jg .canvas_event
                    
                    ; button 1 / button 2
                    cmp ebx, 30
                    jg .miss_event
                        
                        cmp eax, 110
                        jg .button2_event
                        ; button 1
                        cmp eax, 50
                        jnge .miss_event
                        cmp eax, 100
                        jg .miss_event

                            ; press logic
                            mov esi, 10
                            mov edi, 6
                            jmp .eventloop

                        ; button 2
                        .button2_event:
                        cmp eax, 120
                        jnge .miss_event
                        cmp eax, 150
                        jg .miss_event

                            ; press logic
                            mov esi, 20
                            mov edi, 6
                            jmp .eventloop

                    ; canvas
                    .canvas_event:
                        ; (x1,x2)
                        cmp eax, 108
                        jnge .miss_event
                        cmp eax, 555
                        jg .miss_event

                        ; (y1,y2)
                        cmp eax, 193
                        jnge .miss_event
                        cmp eax, 641
                        jg .miss_event

                            ; press logic
                            mov esi, 30
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

section .data
    caption db "Get da numbs w/ CNN", 0
	errormsg db "ERROR: could not initialize graphics!", 0
