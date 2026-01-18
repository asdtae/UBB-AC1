; https://www.figma.com/design/nAlyAsvY7q2KFvtq9jw8ie/Untitled?node-id=0-1&p=f&t=Dr4KgAMCyWt4Bn8K-0

%include 'io.inc'
%include 'gfx.inc'
%include 'util.inc'
;%include 'debug.inc'

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

    ; 8-bit display
    %define DISPLAY_8_BIT_X1 647
    %define DISPLAY_8_BIT_Y1 90
    %define DISPLAY_8_BIT_X2 737
    %define DISPLAY_8_BIT_Y2 230

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

    ; DEBUG
    %define DEBUG_0_X1 684
    %define DEBUG_0_Y1 332
    %define DEBUG_0_X2 699
    %define DEBUG_0_Y2 347

    %define DEBUG_1_X1 664
    %define DEBUG_1_Y1 272
    %define DEBUG_1_X2 679
    %define DEBUG_1_Y2 287

    %define DEBUG_2_X1 684
    %define DEBUG_2_Y1 272
    %define DEBUG_2_X2 699
    %define DEBUG_2_Y2 287

    %define DEBUG_3_X1 704
    %define DEBUG_3_Y1 272
    %define DEBUG_3_X2 719
    %define DEBUG_3_Y2 287

    %define DEBUG_4_X1 664
    %define DEBUG_4_Y1 292
    %define DEBUG_4_X2 679
    %define DEBUG_4_Y2 307

    %define DEBUG_5_X1 684
    %define DEBUG_5_Y1 292
    %define DEBUG_5_X2 699
    %define DEBUG_5_Y2 307

    %define DEBUG_6_X1 704
    %define DEBUG_6_Y1 292
    %define DEBUG_6_X2 719
    %define DEBUG_6_Y2 307

    %define DEBUG_7_X1 664
    %define DEBUG_7_Y1 312
    %define DEBUG_7_X2 679
    %define DEBUG_7_Y2 327

    %define DEBUG_8_X1 684
    %define DEBUG_8_Y1 312
    %define DEBUG_8_X2 699
    %define DEBUG_8_Y2 327

    %define DEBUG_9_X1 704
    %define DEBUG_9_Y1 312
    %define DEBUG_9_X2 719
    %define DEBUG_9_Y2 327

    ; BRUSH SIZE
        ; NODE
        %define BRUSH_SIZE_NODE_IN_Y1 382
        %define BRUSH_SIZE_NODE_IN_Y2 391
        %define BRUSH_SIZE_NODE_IN_X1 668
        %define BRUSH_SIZE_NODE_IN_X2 677

        %define BRUSH_SIZE_NODE_OUT_Y1 379
        %define BRUSH_SIZE_NODE_OUT_Y2 394
        %define BRUSH_SIZE_NODE_OUT_X1 665
        %define BRUSH_SIZE_NODE_OUT_X2 680

        ; MINUS
        %define BRUSH_SIZE_MINUS_1_X1 644
        %define BRUSH_SIZE_MINUS_1_Y1 379
        %define BRUSH_SIZE_MINUS_1_X2 659
        %define BRUSH_SIZE_MINUS_1_Y2 394

        %define BRUSH_SIZE_MINUS_2_X1 646
        %define BRUSH_SIZE_MINUS_2_Y1 385
        %define BRUSH_SIZE_MINUS_2_X2 657
        %define BRUSH_SIZE_MINUS_2_Y2 388

        ; PLUS
        %define BRUSH_SIZE_PLUS_1_X1 724
        %define BRUSH_SIZE_PLUS_1_Y1 379
        %define BRUSH_SIZE_PLUS_1_X2 739
        %define BRUSH_SIZE_PLUS_1_Y2 394

        %define BRUSH_SIZE_PLUS_2_X1 726
        %define BRUSH_SIZE_PLUS_2_Y1 385
        %define BRUSH_SIZE_PLUS_2_X2 737
        %define BRUSH_SIZE_PLUS_2_Y2 388

        %define BRUSH_SIZE_PLUS_3_X1 730
        %define BRUSH_SIZE_PLUS_3_Y1 381
        %define BRUSH_SIZE_PLUS_3_X2 733
        %define BRUSH_SIZE_PLUS_3_Y2 392

        ; COLOR
        %define BRUSH_SIZE_FG_COLOR_R 103
        %define BRUSH_SIZE_FG_COLOR_G 105
        %define BRUSH_SIZE_FG_COLOR_B 116

        %define BRUSH_SIZE_BG_COLOR_R 53
        %define BRUSH_SIZE_BG_COLOR_G 54
        %define BRUSH_SIZE_BG_COLOR_B 59

        %define BRUSH_SIZE_ACTIVE_COLOR_R 113
        %define BRUSH_SIZE_ACTIVE_COLOR_G 151
        %define BRUSH_SIZE_ACTIVE_COLOR_B 132


global main

section .text

; UI/UX
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

draw_8_bit_BG:
    ; frame loop - draw_8_bit_BG1
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_BG1:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_BG1

        xor edx, edx
        .xloop_draw_8_bit_BG1:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_BG1

            mov ebx, DISPLAY_8_BIT_Y1   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_BG1
            mov ebx, DISPLAY_8_BIT_X1   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_BG1

            mov ebx, DISPLAY_8_BIT_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_BG1
            mov ebx, DISPLAY_8_BIT_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_BG1

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

            .skip_draw_8_bit_BG1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_BG1

        .xend_draw_8_bit_BG1:
            inc ecx
            jmp .yloop_draw_8_bit_BG1

    .yend_draw_8_bit_BG1:

    ; frame loop - draw_8_bit_BG2
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_BG2:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_BG2

        xor edx, edx
        .xloop_draw_8_bit_BG2:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_BG2

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_BG2
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_BG2

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_BG2
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_BG2

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

            .skip_draw_8_bit_BG2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_BG2

        .xend_draw_8_bit_BG2:
            inc ecx
            jmp .yloop_draw_8_bit_BG2

    .yend_draw_8_bit_BG2:

    ; frame loop - draw_8_bit_BG3
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_BG3:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_BG3

        xor edx, edx
        .xloop_draw_8_bit_BG3:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_BG3

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_BG3
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_BG3

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_BG3
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_BG3

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

            .skip_draw_8_bit_BG3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_BG3

        .xend_draw_8_bit_BG3:
            inc ecx
            jmp .yloop_draw_8_bit_BG3

    .yend_draw_8_bit_BG3:

    ; frame loop - draw_8_bit_BG4
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_BG4:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_BG4

        xor edx, edx
        .xloop_draw_8_bit_BG4:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_BG4

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_BG4
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_BG4

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_BG4
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_BG4

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

            .skip_draw_8_bit_BG4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_BG4

        .xend_draw_8_bit_BG4:
            inc ecx
            jmp .yloop_draw_8_bit_BG4

    .yend_draw_8_bit_BG4:

    ; frame loop - draw_8_bit_BG5
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_BG5:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_BG5

        xor edx, edx
        .xloop_draw_8_bit_BG5:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_BG5

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_BG5
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_BG5

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_BG5
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_BG5

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

            .skip_draw_8_bit_BG5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_BG5

        .xend_draw_8_bit_BG5:
            inc ecx
            jmp .yloop_draw_8_bit_BG5

    .yend_draw_8_bit_BG5:

    ; frame loop - draw_8_bit_BG6
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_BG6:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_BG6

        xor edx, edx
        .xloop_draw_8_bit_BG6:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_BG6

            mov ebx, 112   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_BG6
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_BG6

            mov ebx, 117   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_BG6
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_BG6

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

            .skip_draw_8_bit_BG6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_BG6

        .xend_draw_8_bit_BG6:
            inc ecx
            jmp .yloop_draw_8_bit_BG6

    .yend_draw_8_bit_BG6:

    ; frame loop - draw_8_bit_BG7
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_BG7:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_BG7

        xor edx, edx
        .xloop_draw_8_bit_BG7:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_BG7

            mov ebx, 157   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_BG7
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_BG7

            mov ebx, 162   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_BG7
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_BG7

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

            .skip_draw_8_bit_BG7:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_BG7

        .xend_draw_8_bit_BG7:
            inc ecx
            jmp .yloop_draw_8_bit_BG7

    .yend_draw_8_bit_BG7:

    ; frame loop - draw_8_bit_BG8
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_BG8:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_BG8

        xor edx, edx
        .xloop_draw_8_bit_BG8:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_BG8

            mov ebx, 202   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_BG8
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_BG8

            mov ebx, 207   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_BG8
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_BG8

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

            .skip_draw_8_bit_BG8:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_BG8

        .xend_draw_8_bit_BG8:
            inc ecx
            jmp .yloop_draw_8_bit_BG8

    .yend_draw_8_bit_BG8:
    ret

draw_8_bit_0:
    ; frame loop - draw_8_bit_0_1
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_0_1:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_0_1

        xor edx, edx
        .xloop_draw_8_bit_0_1:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_0_1

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_0_1
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_0_1

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_0_1
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_0_1

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

            .skip_draw_8_bit_0_1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_0_1

        .xend_draw_8_bit_0_1:
            inc ecx
            jmp .yloop_draw_8_bit_0_1

    .yend_draw_8_bit_0_1:

    ; frame loop - draw_8_bit_0_2
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_0_2:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_0_2

        xor edx, edx
        .xloop_draw_8_bit_0_2:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_0_2

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_0_2
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_0_2

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_0_2
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_0_2

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

            .skip_draw_8_bit_0_2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_0_2

        .xend_draw_8_bit_0_2:
            inc ecx
            jmp .yloop_draw_8_bit_0_2

    .yend_draw_8_bit_0_2:

    ; frame loop - draw_8_bit_0_3
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_0_3:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_0_3

        xor edx, edx
        .xloop_draw_8_bit_0_3:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_0_3

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_0_3
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_0_3

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_0_3
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_0_3

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

            .skip_draw_8_bit_0_3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_0_3

        .xend_draw_8_bit_0_3:
            inc ecx
            jmp .yloop_draw_8_bit_0_3

    .yend_draw_8_bit_0_3:

    ; frame loop - draw_8_bit_0_4
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_0_4:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_0_4

        xor edx, edx
        .xloop_draw_8_bit_0_4:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_0_4

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_0_4
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_0_4

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_0_4
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_0_4

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

            .skip_draw_8_bit_0_4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_0_4

        .xend_draw_8_bit_0_4:
            inc ecx
            jmp .yloop_draw_8_bit_0_4

    .yend_draw_8_bit_0_4:

    ; frame loop - draw_8_bit_0_5
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_0_5:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_0_5

        xor edx, edx
        .xloop_draw_8_bit_0_5:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_0_5

            mov ebx, 112   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_0_5
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_0_5

            mov ebx, 117   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_0_5
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_0_5

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

            .skip_draw_8_bit_0_5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_0_5

        .xend_draw_8_bit_0_5:
            inc ecx
            jmp .yloop_draw_8_bit_0_5

    .yend_draw_8_bit_0_5:

    ; frame loop - draw_8_bit_0_7
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_0_7:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_0_7

        xor edx, edx
        .xloop_draw_8_bit_0_7:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_0_7

            mov ebx, 202   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_0_7
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_0_7

            mov ebx, 207   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_0_7
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_0_7

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

            .skip_draw_8_bit_0_7:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_0_7

        .xend_draw_8_bit_0_7:
            inc ecx
            jmp .yloop_draw_8_bit_0_7

    .yend_draw_8_bit_0_7:
    ret

draw_8_bit_1:
    ; frame loop - draw_8_bit_1_1
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_1_1:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_1_1

        xor edx, edx
        .xloop_draw_8_bit_1_1:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_1_1

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_1_1
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_1_1

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_1_1
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_1_1

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

            .skip_draw_8_bit_1_1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_1_1

        .xend_draw_8_bit_1_1:
            inc ecx
            jmp .yloop_draw_8_bit_1_1

    .yend_draw_8_bit_1_1:

    ; frame loop - draw_8_bit_1_2
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_1_2:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_1_2

        xor edx, edx
        .xloop_draw_8_bit_1_2:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_1_2

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_1_2
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_1_2

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_1_2
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_1_2

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

            .skip_draw_8_bit_1_2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_1_2

        .xend_draw_8_bit_1_2:
            inc ecx
            jmp .yloop_draw_8_bit_1_2

    .yend_draw_8_bit_1_2:
    ret

draw_8_bit_2:
    ; frame loop - draw_8_bit_2_2
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_2_2:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_2_2

        xor edx, edx
        .xloop_draw_8_bit_2_2:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_2_2

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_2_2
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_2_2

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_2_2
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_2_2

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

            .skip_draw_8_bit_2_2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_2_2

        .xend_draw_8_bit_2_2:
            inc ecx
            jmp .yloop_draw_8_bit_2_2

    .yend_draw_8_bit_2_2:

    ; frame loop - draw_8_bit_2_3
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_2_3:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_2_3

        xor edx, edx
        .xloop_draw_8_bit_2_3:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_2_3

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_2_3
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_2_3

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_2_3
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_2_3

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

            .skip_draw_8_bit_2_3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_2_3

        .xend_draw_8_bit_2_3:
            inc ecx
            jmp .yloop_draw_8_bit_2_3

    .yend_draw_8_bit_2_3:

    ; frame loop - draw_8_bit_2_5
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_2_5:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_2_5

        xor edx, edx
        .xloop_draw_8_bit_2_5:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_2_5

            mov ebx, 112   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_2_5
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_2_5

            mov ebx, 117   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_2_5
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_2_5

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

            .skip_draw_8_bit_2_5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_2_5

        .xend_draw_8_bit_2_5:
            inc ecx
            jmp .yloop_draw_8_bit_2_5

    .yend_draw_8_bit_2_5:

    ; frame loop - draw_8_bit_2_6
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_2_6:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_2_6

        xor edx, edx
        .xloop_draw_8_bit_2_6:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_2_6

            mov ebx, 157   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_2_6
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_2_6

            mov ebx, 162   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_2_6
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_2_6

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

            .skip_draw_8_bit_2_6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_2_6

        .xend_draw_8_bit_2_6:
            inc ecx
            jmp .yloop_draw_8_bit_2_6

    .yend_draw_8_bit_2_6:

    ; frame loop - draw_8_bit_2_7
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_2_7:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_2_7

        xor edx, edx
        .xloop_draw_8_bit_2_7:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_2_7

            mov ebx, 202   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_2_7
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_2_7

            mov ebx, 207   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_2_7
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_2_7

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

            .skip_draw_8_bit_2_7:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_2_7

        .xend_draw_8_bit_2_7:
            inc ecx
            jmp .yloop_draw_8_bit_2_7

    .yend_draw_8_bit_2_7:
    ret

draw_8_bit_3:
    ; frame loop - draw_8_bit_3_3
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_3_3:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_3_3

        xor edx, edx
        .xloop_draw_8_bit_3_3:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_3_3

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_3_3
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_3_3

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_3_3
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_3_3

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

            .skip_draw_8_bit_3_3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_3_3

        .xend_draw_8_bit_3_3:
            inc ecx
            jmp .yloop_draw_8_bit_3_3

    .yend_draw_8_bit_3_3:

    ; frame loop - draw_8_bit_3_4
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_3_4:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_3_4

        xor edx, edx
        .xloop_draw_8_bit_3_4:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_3_4

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_3_4
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_3_4

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_3_4
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_3_4

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

            .skip_draw_8_bit_3_4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_3_4

        .xend_draw_8_bit_3_4:
            inc ecx
            jmp .yloop_draw_8_bit_3_4

    .yend_draw_8_bit_3_4:

    ; frame loop - draw_8_bit_3_5
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_3_5:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_3_5

        xor edx, edx
        .xloop_draw_8_bit_3_5:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_3_5

            mov ebx, 112   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_3_5
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_3_5

            mov ebx, 117   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_3_5
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_3_5

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

            .skip_draw_8_bit_3_5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_3_5

        .xend_draw_8_bit_3_5:
            inc ecx
            jmp .yloop_draw_8_bit_3_5

    .yend_draw_8_bit_3_5:

    ; frame loop - draw_8_bit_3_6
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_3_6:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_3_6

        xor edx, edx
        .xloop_draw_8_bit_3_6:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_3_6

            mov ebx, 157   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_3_6
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_3_6

            mov ebx, 162   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_3_6
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_3_6

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

            .skip_draw_8_bit_3_6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_3_6

        .xend_draw_8_bit_3_6:
            inc ecx
            jmp .yloop_draw_8_bit_3_6

    .yend_draw_8_bit_3_6:

    ; frame loop - draw_8_bit_3_7
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_3_7:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_3_7

        xor edx, edx
        .xloop_draw_8_bit_3_7:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_3_7

            mov ebx, 202   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_3_7
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_3_7

            mov ebx, 207   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_3_7
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_3_7

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

            .skip_draw_8_bit_3_7:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_3_7

        .xend_draw_8_bit_3_7:
            inc ecx
            jmp .yloop_draw_8_bit_3_7

    .yend_draw_8_bit_3_7:
    ret

draw_8_bit_4:
    ; frame loop - draw_8_bit_4_1
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_4_1:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_4_1

        xor edx, edx
        .xloop_draw_8_bit_4_1:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_4_1

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_4_1
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_4_1

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_4_1
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_4_1

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

            .skip_draw_8_bit_4_1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_4_1

        .xend_draw_8_bit_4_1:
            inc ecx
            jmp .yloop_draw_8_bit_4_1

    .yend_draw_8_bit_4_1:

    ; frame loop - draw_8_bit_4_3
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_4_3:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_4_3

        xor edx, edx
        .xloop_draw_8_bit_4_3:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_4_3

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_4_3
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_4_3

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_4_3
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_4_3

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

            .skip_draw_8_bit_4_3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_4_3

        .xend_draw_8_bit_4_3:
            inc ecx
            jmp .yloop_draw_8_bit_4_3

    .yend_draw_8_bit_4_3:

    ; frame loop - draw_8_bit_4_4
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_4_4:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_4_4

        xor edx, edx
        .xloop_draw_8_bit_4_4:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_4_4

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_4_4
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_4_4

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_4_4
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_4_4

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

            .skip_draw_8_bit_4_4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_4_4

        .xend_draw_8_bit_4_4:
            inc ecx
            jmp .yloop_draw_8_bit_4_4

    .yend_draw_8_bit_4_4:

    ; frame loop - draw_8_bit_4_6
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_4_6:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_4_6

        xor edx, edx
        .xloop_draw_8_bit_4_6:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_4_6

            mov ebx, 157   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_4_6
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_4_6

            mov ebx, 162   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_4_6
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_4_6

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

            .skip_draw_8_bit_4_6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_4_6

        .xend_draw_8_bit_4_6:
            inc ecx
            jmp .yloop_draw_8_bit_4_6

    .yend_draw_8_bit_4_6:
    ret

draw_8_bit_5:
    ; frame loop - draw_8_bit_5_1
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_5_1:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_5_1

        xor edx, edx
        .xloop_draw_8_bit_5_1:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_5_1

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_5_1
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_5_1

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_5_1
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_5_1

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

            .skip_draw_8_bit_5_1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_5_1

        .xend_draw_8_bit_5_1:
            inc ecx
            jmp .yloop_draw_8_bit_5_1

    .yend_draw_8_bit_5_1:

    ; frame loop - draw_8_bit_5_4
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_5_4:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_5_4

        xor edx, edx
        .xloop_draw_8_bit_5_4:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_5_4

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_5_4
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_5_4

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_5_4
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_5_4

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

            .skip_draw_8_bit_5_4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_5_4

        .xend_draw_8_bit_5_4:
            inc ecx
            jmp .yloop_draw_8_bit_5_4

    .yend_draw_8_bit_5_4:

    ; frame loop - draw_8_bit_5_5
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_5_5:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_5_5

        xor edx, edx
        .xloop_draw_8_bit_5_5:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_5_5

            mov ebx, 112   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_5_5
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_5_5

            mov ebx, 117   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_5_5
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_5_5

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

            .skip_draw_8_bit_5_5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_5_5

        .xend_draw_8_bit_5_5:
            inc ecx
            jmp .yloop_draw_8_bit_5_5

    .yend_draw_8_bit_5_5:

    ; frame loop - draw_8_bit_5_6
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_5_6:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_5_6

        xor edx, edx
        .xloop_draw_8_bit_5_6:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_5_6

            mov ebx, 157   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_5_6
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_5_6

            mov ebx, 162   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_5_6
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_5_6

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

            .skip_draw_8_bit_5_6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_5_6

        .xend_draw_8_bit_5_6:
            inc ecx
            jmp .yloop_draw_8_bit_5_6

    .yend_draw_8_bit_5_6:

    ; frame loop - draw_8_bit_5_7
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_5_7:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_5_7

        xor edx, edx
        .xloop_draw_8_bit_5_7:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_5_7

            mov ebx, 202   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_5_7
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_5_7

            mov ebx, 207   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_5_7
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_5_7

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

            .skip_draw_8_bit_5_7:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_5_7

        .xend_draw_8_bit_5_7:
            inc ecx
            jmp .yloop_draw_8_bit_5_7

    .yend_draw_8_bit_5_7:
    ret

draw_8_bit_6:
    ; frame loop - draw_8_bit_6_1
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_6_1:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_6_1

        xor edx, edx
        .xloop_draw_8_bit_6_1:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_6_1

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_6_1
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_6_1

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_6_1
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_6_1

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

            .skip_draw_8_bit_6_1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_6_1

        .xend_draw_8_bit_6_1:
            inc ecx
            jmp .yloop_draw_8_bit_6_1

    .yend_draw_8_bit_6_1:

    ; frame loop - draw_8_bit_6_2
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_6_2:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_6_2

        xor edx, edx
        .xloop_draw_8_bit_6_2:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_6_2

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_6_2
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_6_2

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_6_2
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_6_2

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

            .skip_draw_8_bit_6_2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_6_2

        .xend_draw_8_bit_6_2:
            inc ecx
            jmp .yloop_draw_8_bit_6_2

    .yend_draw_8_bit_6_2:

    ; frame loop - draw_8_bit_6_4
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_6_4:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_6_4

        xor edx, edx
        .xloop_draw_8_bit_6_4:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_6_4

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_6_4
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_6_4

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_6_4
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_6_4

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

            .skip_draw_8_bit_6_4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_6_4

        .xend_draw_8_bit_6_4:
            inc ecx
            jmp .yloop_draw_8_bit_6_4

    .yend_draw_8_bit_6_4:

    ; frame loop - draw_8_bit_6_6
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_6_6:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_6_6

        xor edx, edx
        .xloop_draw_8_bit_6_6:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_6_6

            mov ebx, 157   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_6_6
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_6_6

            mov ebx, 162   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_6_6
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_6_6

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

            .skip_draw_8_bit_6_6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_6_6

        .xend_draw_8_bit_6_6:
            inc ecx
            jmp .yloop_draw_8_bit_6_6

    .yend_draw_8_bit_6_6:

    ; frame loop - draw_8_bit_6_7
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_6_7:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_6_7

        xor edx, edx
        .xloop_draw_8_bit_6_7:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_6_7

            mov ebx, 202   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_6_7
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_6_7

            mov ebx, 207   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_6_7
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_6_7

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

            .skip_draw_8_bit_6_7:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_6_7

        .xend_draw_8_bit_6_7:
            inc ecx
            jmp .yloop_draw_8_bit_6_7

    .yend_draw_8_bit_6_7:
    ret

draw_8_bit_7:
    ; frame loop - draw_8_bit_7_3
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_7_3:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_7_3

        xor edx, edx
        .xloop_draw_8_bit_7_3:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_7_3

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_7_3
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_7_3

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_7_3
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_7_3

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

            .skip_draw_8_bit_7_3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_7_3

        .xend_draw_8_bit_7_3:
            inc ecx
            jmp .yloop_draw_8_bit_7_3

    .yend_draw_8_bit_7_3:

    ; frame loop - draw_8_bit_7_4
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_7_4:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_7_4

        xor edx, edx
        .xloop_draw_8_bit_7_4:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_7_4

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_7_4
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_7_4

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_7_4
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_7_4

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

            .skip_draw_8_bit_7_4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_7_4

        .xend_draw_8_bit_7_4:
            inc ecx
            jmp .yloop_draw_8_bit_7_4

    .yend_draw_8_bit_7_4:

    ; frame loop - draw_8_bit_7_5
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_7_5:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_7_5

        xor edx, edx
        .xloop_draw_8_bit_7_5:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_7_5

            mov ebx, 112   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_7_5
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_7_5

            mov ebx, 117   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_7_5
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_7_5

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

            .skip_draw_8_bit_7_5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_7_5

        .xend_draw_8_bit_7_5:
            inc ecx
            jmp .yloop_draw_8_bit_7_5

    .yend_draw_8_bit_7_5:
    ret

draw_8_bit_8:
    ; frame loop - draw_8_bit_8_1
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_8_1:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_8_1

        xor edx, edx
        .xloop_draw_8_bit_8_1:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_8_1

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_8_1
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_8_1

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_8_1
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_8_1

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

            .skip_draw_8_bit_8_1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_8_1

        .xend_draw_8_bit_8_1:
            inc ecx
            jmp .yloop_draw_8_bit_8_1

    .yend_draw_8_bit_8_1:

    ; frame loop - draw_8_bit_8_2
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_8_2:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_8_2

        xor edx, edx
        .xloop_draw_8_bit_8_2:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_8_2

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_8_2
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_8_2

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_8_2
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_8_2

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

            .skip_draw_8_bit_8_2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_8_2

        .xend_draw_8_bit_8_2:
            inc ecx
            jmp .yloop_draw_8_bit_8_2

    .yend_draw_8_bit_8_2:

    ; frame loop - draw_8_bit_8_3
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_8_3:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_8_3

        xor edx, edx
        .xloop_draw_8_bit_8_3:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_8_3

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_8_3
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_8_3

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_8_3
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_8_3

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

            .skip_draw_8_bit_8_3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_8_3

        .xend_draw_8_bit_8_3:
            inc ecx
            jmp .yloop_draw_8_bit_8_3

    .yend_draw_8_bit_8_3:

    ; frame loop - draw_8_bit_8_4
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_8_4:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_8_4

        xor edx, edx
        .xloop_draw_8_bit_8_4:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_8_4

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_8_4
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_8_4

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_8_4
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_8_4

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

            .skip_draw_8_bit_8_4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_8_4

        .xend_draw_8_bit_8_4:
            inc ecx
            jmp .yloop_draw_8_bit_8_4

    .yend_draw_8_bit_8_4:

    ; frame loop - draw_8_bit_8_5
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_8_5:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_8_5

        xor edx, edx
        .xloop_draw_8_bit_8_5:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_8_5

            mov ebx, 112   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_8_5
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_8_5

            mov ebx, 117   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_8_5
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_8_5

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

            .skip_draw_8_bit_8_5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_8_5

        .xend_draw_8_bit_8_5:
            inc ecx
            jmp .yloop_draw_8_bit_8_5

    .yend_draw_8_bit_8_5:

    ; frame loop - draw_8_bit_8_6
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_8_6:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_8_6

        xor edx, edx
        .xloop_draw_8_bit_8_6:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_8_6

            mov ebx, 157   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_8_6
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_8_6

            mov ebx, 162   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_8_6
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_8_6

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

            .skip_draw_8_bit_8_6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_8_6

        .xend_draw_8_bit_8_6:
            inc ecx
            jmp .yloop_draw_8_bit_8_6

    .yend_draw_8_bit_8_6:

    ; frame loop - draw_8_bit_8_7
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_8_7:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_8_7

        xor edx, edx
        .xloop_draw_8_bit_8_7:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_8_7

            mov ebx, 202   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_8_7
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_8_7

            mov ebx, 207   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_8_7
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_8_7

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

            .skip_draw_8_bit_8_7:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_8_7

        .xend_draw_8_bit_8_7:
            inc ecx
            jmp .yloop_draw_8_bit_8_7

    .yend_draw_8_bit_8_7:
    ret

draw_8_bit_9:
    ; frame loop - draw_8_bit_9_1
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_9_1:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_9_1

        xor edx, edx
        .xloop_draw_8_bit_9_1:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_9_1

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_9_1
            mov ebx, 672   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_9_1

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_9_1
            mov ebx, 677   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_9_1

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

            .skip_draw_8_bit_9_1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_9_1

        .xend_draw_8_bit_9_1:
            inc ecx
            jmp .yloop_draw_8_bit_9_1

    .yend_draw_8_bit_9_1:

    ; frame loop - draw_8_bit_9_3
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_9_3:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_9_3

        xor edx, edx
        .xloop_draw_8_bit_9_3:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_9_3

            mov ebx, 117   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_9_3
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_9_3

            mov ebx, 157   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_9_3
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_9_3

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

            .skip_draw_8_bit_9_3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_9_3

        .xend_draw_8_bit_9_3:
            inc ecx
            jmp .yloop_draw_8_bit_9_3

    .yend_draw_8_bit_9_3:

    ; frame loop - draw_8_bit_9_4
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_9_4:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_9_4

        xor edx, edx
        .xloop_draw_8_bit_9_4:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_9_4

            mov ebx, 162   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_9_4
            mov ebx, 707   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_9_4

            mov ebx, 202   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_9_4
            mov ebx, 712   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_9_4

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

            .skip_draw_8_bit_9_4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_9_4

        .xend_draw_8_bit_9_4:
            inc ecx
            jmp .yloop_draw_8_bit_9_4

    .yend_draw_8_bit_9_4:

    ; frame loop - draw_8_bit_9_5
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_9_5:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_9_5

        xor edx, edx
        .xloop_draw_8_bit_9_5:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_9_5

            mov ebx, 112   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_9_5
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_9_5

            mov ebx, 117   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_9_5
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_9_5

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

            .skip_draw_8_bit_9_5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_9_5

        .xend_draw_8_bit_9_5:
            inc ecx
            jmp .yloop_draw_8_bit_9_5

    .yend_draw_8_bit_9_5:

    ; frame loop - draw_8_bit_9_6
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_8_bit_9_6:
        cmp ecx, HEIGHT
        jge .yend_draw_8_bit_9_6

        xor edx, edx
        .xloop_draw_8_bit_9_6:
            cmp edx, WIDTH
            jge .xend_draw_8_bit_9_6

            mov ebx, 157   ; y1
            cmp ecx, ebx
            jnge .skip_draw_8_bit_9_6
            mov ebx, 677   ; x1
            cmp edx, ebx
            jnge .skip_draw_8_bit_9_6

            mov ebx, 162   ; y2
            cmp ecx, ebx
            jge .skip_draw_8_bit_9_6
            mov ebx, 707   ; x2
            cmp edx, ebx
            jge .skip_draw_8_bit_9_6

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

            .skip_draw_8_bit_9_6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_8_bit_9_6

        .xend_draw_8_bit_9_6:
            inc ecx
            jmp .yloop_draw_8_bit_9_6

    .yend_draw_8_bit_9_6:
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
            mov ebx, 0
            mov	[eax], bl
            ; green
            mov ebx, 0
            mov	[eax+1], bl
            ; red
            mov ebx, 0
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

draw_8_bit:
    call draw_8_bit_BG

    ; switch
    cmp esi, 30
    je .draw_8_bit_case_0
    cmp esi, 31
    je .draw_8_bit_case_1
    cmp esi, 32
    je .draw_8_bit_case_2
    cmp esi, 33
    je .draw_8_bit_case_3
    cmp esi, 34
    je .draw_8_bit_case_4
    cmp esi, 35
    je .draw_8_bit_case_5
    cmp esi, 36
    je .draw_8_bit_case_6
    cmp esi, 37
    je .draw_8_bit_case_7
    cmp esi, 38
    je .draw_8_bit_case_8
    cmp esi, 39
    je .draw_8_bit_case_9
    jmp .draw_8_bit_skip

    ; switch cases 0-9
        ; case 0
            .draw_8_bit_case_0:

                call draw_8_bit_0

            jmp .draw_8_bit_skip

        ; case 1
            .draw_8_bit_case_1:

                call draw_8_bit_1

            jmp .draw_8_bit_skip

        ; case 2
            .draw_8_bit_case_2:

                call draw_8_bit_2

            jmp .draw_8_bit_skip

        ; case 3
            .draw_8_bit_case_3:

                call draw_8_bit_3

            jmp .draw_8_bit_skip

        ; case 4
            .draw_8_bit_case_4:

                call draw_8_bit_4

            jmp .draw_8_bit_skip

        ; case 5
            .draw_8_bit_case_5:

                call draw_8_bit_5

            jmp .draw_8_bit_skip

        ; case 6
            .draw_8_bit_case_6:

                call draw_8_bit_6

            jmp .draw_8_bit_skip

        ; case 7
            .draw_8_bit_case_7:

                call draw_8_bit_7

            jmp .draw_8_bit_skip

        ; case 8
            .draw_8_bit_case_8:

                call draw_8_bit_8

            jmp .draw_8_bit_skip

        ; case 9
            .draw_8_bit_case_9:

                call draw_8_bit_9

    .draw_8_bit_skip:
    ret

draw_debug:
    ; frame loop - draw_debug0
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    .yloop_draw_debug0:
        cmp ecx, HEIGHT
        jge .yend_draw_debug0

        xor edx, edx
        .xloop_draw_debug0:
            cmp edx, WIDTH
            jge .xend_draw_debug0

            mov ebx, DEBUG_0_Y1   ; y1
            cmp ecx, ebx
            jnge .skip_draw_debug0
            mov ebx, DEBUG_0_X1   ; x1
            cmp edx, ebx
            jnge .skip_draw_debug0

            mov ebx, DEBUG_0_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_debug0
            mov ebx, DEBUG_0_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_debug0

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

            .skip_draw_debug0:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_debug0

        .xend_draw_debug0:
            inc ecx
            jmp .yloop_draw_debug0

    .yend_draw_debug0:

    ; frame loop - draw_debug1
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    .yloop_draw_debug1:
        cmp ecx, HEIGHT
        jge .yend_draw_debug1

        xor edx, edx
        .xloop_draw_debug1:
            cmp edx, WIDTH
            jge .xend_draw_debug1

            mov ebx, DEBUG_1_Y1   ; y1
            cmp ecx, ebx
            jnge .skip_draw_debug1
            mov ebx, DEBUG_1_X1   ; x1
            cmp edx, ebx
            jnge .skip_draw_debug1

            mov ebx, DEBUG_1_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_debug1
            mov ebx, DEBUG_1_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_debug1

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

            .skip_draw_debug1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_debug1

        .xend_draw_debug1:
            inc ecx
            jmp .yloop_draw_debug1

    .yend_draw_debug1:

    ; frame loop - draw_debug2
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    .yloop_draw_debug2:
        cmp ecx, HEIGHT
        jge .yend_draw_debug2

        xor edx, edx
        .xloop_draw_debug2:
            cmp edx, WIDTH
            jge .xend_draw_debug2

            mov ebx, DEBUG_2_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_debug2
            mov ebx, DEBUG_2_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_debug2

            mov ebx, DEBUG_2_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_debug2
            mov ebx, DEBUG_2_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_debug2

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

            .skip_draw_debug2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_debug2

        .xend_draw_debug2:
            inc ecx
            jmp .yloop_draw_debug2

    .yend_draw_debug2:

    ; frame loop - draw_debug3
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    .yloop_draw_debug3:
        cmp ecx, HEIGHT
        jge .yend_draw_debug3

        xor edx, edx
        .xloop_draw_debug3:
            cmp edx, WIDTH
            jge .xend_draw_debug3

            mov ebx, DEBUG_3_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_debug3
            mov ebx, DEBUG_3_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_debug3

            mov ebx, DEBUG_3_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_debug3
            mov ebx, DEBUG_3_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_debug3

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

            .skip_draw_debug3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_debug3

        .xend_draw_debug3:
            inc ecx
            jmp .yloop_draw_debug3

    .yend_draw_debug3:

    ; frame loop - draw_debug4
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    .yloop_draw_debug4:
        cmp ecx, HEIGHT
        jge .yend_draw_debug4

        xor edx, edx
        .xloop_draw_debug4:
            cmp edx, WIDTH
            jge .xend_draw_debug4

            mov ebx, DEBUG_4_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_debug4
            mov ebx, DEBUG_4_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_debug4

            mov ebx, DEBUG_4_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_debug4
            mov ebx, DEBUG_4_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_debug4

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

            .skip_draw_debug4:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_debug4

        .xend_draw_debug4:
            inc ecx
            jmp .yloop_draw_debug4

    .yend_draw_debug4:

    ; frame loop - draw_debug5
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    .yloop_draw_debug5:
        cmp ecx, HEIGHT
        jge .yend_draw_debug5

        xor edx, edx
        .xloop_draw_debug5:
            cmp edx, WIDTH
            jge .xend_draw_debug5

            mov ebx, DEBUG_5_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_debug5
            mov ebx, DEBUG_5_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_debug5

            mov ebx, DEBUG_5_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_debug5
            mov ebx, DEBUG_5_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_debug5

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

            .skip_draw_debug5:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_debug5

        .xend_draw_debug5:
            inc ecx
            jmp .yloop_draw_debug5

    .yend_draw_debug5:

    ; frame loop - draw_debug6
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    .yloop_draw_debug6:
        cmp ecx, HEIGHT
        jge .yend_draw_debug6

        xor edx, edx
        .xloop_draw_debug6:
            cmp edx, WIDTH
            jge .xend_draw_debug6

            mov ebx, DEBUG_6_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_debug6
            mov ebx, DEBUG_6_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_debug6

            mov ebx, DEBUG_6_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_debug6
            mov ebx, DEBUG_6_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_debug6

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

            .skip_draw_debug6:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_debug6

        .xend_draw_debug6:
            inc ecx
            jmp .yloop_draw_debug6

    .yend_draw_debug6:

    ; frame loop - draw_debug7
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    .yloop_draw_debug7:
        cmp ecx, HEIGHT
        jge .yend_draw_debug7

        xor edx, edx
        .xloop_draw_debug7:
            cmp edx, WIDTH
            jge .xend_draw_debug7

            mov ebx, DEBUG_7_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_debug7
            mov ebx, DEBUG_7_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_debug7

            mov ebx, DEBUG_7_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_debug7
            mov ebx, DEBUG_7_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_debug7

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

            .skip_draw_debug7:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_debug7

        .xend_draw_debug7:
            inc ecx
            jmp .yloop_draw_debug7

    .yend_draw_debug7:

    ; frame loop - draw_debug8
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    .yloop_draw_debug8:
        cmp ecx, HEIGHT
        jge .yend_draw_debug8

        xor edx, edx
        .xloop_draw_debug8:
            cmp edx, WIDTH
            jge .xend_draw_debug8

            mov ebx, DEBUG_8_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_debug8
            mov ebx, DEBUG_8_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_debug8

            mov ebx, DEBUG_8_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_debug8
            mov ebx, DEBUG_8_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_debug8

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

            .skip_draw_debug8:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_debug8

        .xend_draw_debug8:
            inc ecx
            jmp .yloop_draw_debug8

    .yend_draw_debug8:

    ; frame loop - draw_debug9
    xor ecx, ecx
    mov eax, [esp+4]     ; get (0,0)

    .yloop_draw_debug9:
        cmp ecx, HEIGHT
        jge .yend_draw_debug9

        xor edx, edx
        .xloop_draw_debug9:
            cmp edx, WIDTH
            jge .xend_draw_debug9

            mov ebx, DEBUG_9_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_debug9
            mov ebx, DEBUG_9_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_debug9

            mov ebx, DEBUG_9_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_debug9
            mov ebx, DEBUG_9_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_debug9

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

            .skip_draw_debug9:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_debug9

        .xend_draw_debug9:
            inc ecx
            jmp .yloop_draw_debug9

    .yend_draw_debug9:
    ret

draw_brush_minus:
    ; frame loop - draw_brush_minus1
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_brush_minus1:
        cmp ecx, HEIGHT
        jge .yend_draw_brush_minus1

        xor edx, edx
        .xloop_draw_brush_minus1:
            cmp edx, WIDTH
            jge .xend_draw_brush_minus1

            mov ebx, BRUSH_SIZE_MINUS_1_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_brush_minus1
            mov ebx, BRUSH_SIZE_MINUS_1_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_brush_minus1

            mov ebx, BRUSH_SIZE_MINUS_1_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_brush_minus1
            mov ebx, BRUSH_SIZE_MINUS_1_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_brush_minus1

            ; Pixel color in RGBA
            ; blue
            mov ebx, BRUSH_SIZE_BG_COLOR_B
            mov	[eax], bl
            ; green
            mov ebx, BRUSH_SIZE_BG_COLOR_G
            mov	[eax+1], bl
            ; red
            mov ebx, BRUSH_SIZE_BG_COLOR_R
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_draw_brush_minus1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_brush_minus1

        .xend_draw_brush_minus1:
            inc ecx
            jmp .yloop_draw_brush_minus1

    .yend_draw_brush_minus1:

    ; frame loop - draw_brush_minus2
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_brush_minus2:
        cmp ecx, HEIGHT
        jge .yend_draw_brush_minus2

        xor edx, edx
        .xloop_draw_brush_minus2:
            cmp edx, WIDTH
            jge .xend_draw_brush_minus2

            mov ebx, BRUSH_SIZE_MINUS_2_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_brush_minus2
            mov ebx, BRUSH_SIZE_MINUS_2_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_brush_minus2

            mov ebx, BRUSH_SIZE_MINUS_2_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_brush_minus2
            mov ebx, BRUSH_SIZE_MINUS_2_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_brush_minus2

            ; Pixel color in RGBA
            ; blue
            mov ebx, BRUSH_SIZE_FG_COLOR_B
            mov	[eax], bl
            ; green
            mov ebx, BRUSH_SIZE_FG_COLOR_G
            mov	[eax+1], bl
            ; red
            mov ebx, BRUSH_SIZE_FG_COLOR_R
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_draw_brush_minus2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_brush_minus2

        .xend_draw_brush_minus2:
            inc ecx
            jmp .yloop_draw_brush_minus2

    .yend_draw_brush_minus2:
    ret

draw_brush_plus:
    ; frame loop - draw_brush_plus1
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_brush_plus1:
        cmp ecx, HEIGHT
        jge .yend_draw_brush_plus1

        xor edx, edx
        .xloop_draw_brush_plus1:
            cmp edx, WIDTH
            jge .xend_draw_brush_plus1

            mov ebx, BRUSH_SIZE_PLUS_1_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_brush_plus1
            mov ebx, BRUSH_SIZE_PLUS_1_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_brush_plus1

            mov ebx, BRUSH_SIZE_PLUS_1_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_brush_plus1
            mov ebx, BRUSH_SIZE_PLUS_1_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_brush_plus1

            ; Pixel color in RGBA
            ; blue
            mov ebx, BRUSH_SIZE_BG_COLOR_B
            mov	[eax], bl
            ; green
            mov ebx, BRUSH_SIZE_BG_COLOR_G
            mov	[eax+1], bl
            ; red
            mov ebx, BRUSH_SIZE_BG_COLOR_R
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_draw_brush_plus1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_brush_plus1

        .xend_draw_brush_plus1:
            inc ecx
            jmp .yloop_draw_brush_plus1

    .yend_draw_brush_plus1:

    ; frame loop - draw_brush_plus2
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_brush_plus2:
        cmp ecx, HEIGHT
        jge .yend_draw_brush_plus2

        xor edx, edx
        .xloop_draw_brush_plus2:
            cmp edx, WIDTH
            jge .xend_draw_brush_plus2

            mov ebx, BRUSH_SIZE_PLUS_2_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_brush_plus2
            mov ebx, BRUSH_SIZE_PLUS_2_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_brush_plus2

            mov ebx, BRUSH_SIZE_PLUS_2_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_brush_plus2
            mov ebx, BRUSH_SIZE_PLUS_2_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_brush_plus2

            ; Pixel color in RGBA
            ; blue
            mov ebx, BRUSH_SIZE_FG_COLOR_B
            mov	[eax], bl
            ; green
            mov ebx, BRUSH_SIZE_FG_COLOR_G
            mov	[eax+1], bl
            ; red
            mov ebx, BRUSH_SIZE_FG_COLOR_R
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_draw_brush_plus2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_brush_plus2

        .xend_draw_brush_plus2:
            inc ecx
            jmp .yloop_draw_brush_plus2

    .yend_draw_brush_plus2:

    ; frame loop - draw_brush_plus3
    xor ecx, ecx
    mov eax, [esp+8]     ; get (0,0)

    .yloop_draw_brush_plus3:
        cmp ecx, HEIGHT
        jge .yend_draw_brush_plus3

        xor edx, edx
        .xloop_draw_brush_plus3:
            cmp edx, WIDTH
            jge .xend_draw_brush_plus3

            mov ebx, BRUSH_SIZE_PLUS_3_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_brush_plus3
            mov ebx, BRUSH_SIZE_PLUS_3_X1    ; x1
            cmp edx, ebx
            jnge .skip_draw_brush_plus3

            mov ebx, BRUSH_SIZE_PLUS_3_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_brush_plus3
            mov ebx, BRUSH_SIZE_PLUS_3_X2   ; x2
            cmp edx, ebx
            jge .skip_draw_brush_plus3

            ; Pixel color in RGBA
            ; blue
            mov ebx, BRUSH_SIZE_FG_COLOR_B
            mov	[eax], bl
            ; green
            mov ebx, BRUSH_SIZE_FG_COLOR_G
            mov	[eax+1], bl
            ; red
            mov ebx, BRUSH_SIZE_FG_COLOR_R
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_draw_brush_plus3:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_brush_plus3

        .xend_draw_brush_plus3:
            inc ecx
            jmp .yloop_draw_brush_plus3

    .yend_draw_brush_plus3:
    ret

draw_brush_node:
    ; frame loop - draw_brush_node1
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_draw_brush_node1:
        cmp ecx, HEIGHT
        jge .yend_draw_brush_node1

        xor edx, edx
        .xloop_draw_brush_node1:
            cmp edx, WIDTH
            jge .xend_draw_brush_node1

            mov ebx, BRUSH_SIZE_NODE_OUT_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_brush_node1
            mov ebx, BRUSH_SIZE_NODE_OUT_X1    ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_draw_brush_node1

            mov ebx, BRUSH_SIZE_NODE_OUT_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_brush_node1
            mov ebx, BRUSH_SIZE_NODE_OUT_X2   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_draw_brush_node1

            ; Pixel color in RGBA
            ; blue
            mov ebx, BRUSH_SIZE_BG_COLOR_B
            mov	[eax], bl
            ; green
            mov ebx, BRUSH_SIZE_BG_COLOR_G
            mov	[eax+1], bl
            ; red
            mov ebx, BRUSH_SIZE_BG_COLOR_R
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_draw_brush_node1:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_brush_node1

        .xend_draw_brush_node1:
            inc ecx
            jmp .yloop_draw_brush_node1

    .yend_draw_brush_node1:

    ; frame loop - draw_brush_node2
    xor ecx, ecx
    mov eax, [esp+20]     ; get (0,0)

    .yloop_draw_brush_node2:
        cmp ecx, HEIGHT
        jge .yend_draw_brush_node2

        xor edx, edx
        .xloop_draw_brush_node2:
            cmp edx, WIDTH
            jge .xend_draw_brush_node2

            mov ebx, BRUSH_SIZE_NODE_IN_Y1    ; y1
            cmp ecx, ebx
            jnge .skip_draw_brush_node2
            mov ebx, BRUSH_SIZE_NODE_IN_X1    ; x1
            add ebx, [esp+16]
            cmp edx, ebx
            jnge .skip_draw_brush_node2

            mov ebx, BRUSH_SIZE_NODE_IN_Y2   ; y2
            cmp ecx, ebx
            jge .skip_draw_brush_node2
            mov ebx, BRUSH_SIZE_NODE_IN_X2   ; x2
            add ebx, [esp+16]
            cmp edx, ebx
            jge .skip_draw_brush_node2

            ; Pixel color in RGBA
            ; blue
            mov ebx, [esp+4]
            mov	[eax], bl
            ; green
            mov ebx, [esp+8]
            mov	[eax+1], bl
            ; red
            mov ebx, [esp+12]
            mov	[eax+2], bl
            ; zero
            xor	ebx, ebx
            mov	[eax+3], bl

            .skip_draw_brush_node2:
            add	eax, 4  ; next pixel
            inc edx
            jmp .xloop_draw_brush_node2

        .xend_draw_brush_node2:
            inc ecx
            jmp .yloop_draw_brush_node2

    .yend_draw_brush_node2:
    ret

draw_brush:
    call draw_brush_minus
    call draw_brush_plus

    mov eax, [esp+4]    ; get (0,0)

        xor ebx, ebx
        mov BYTE bl, [brush_size]

        cmp bl, 1
        jnge .draw_brush_size_0

        cmp bl, 2
        jnge .draw_brush_size_1

        cmp bl, 3
        jnge .draw_brush_size_2

    ; size 3
    
        push eax                            ; save (0,0)
        mov ebx, 0                          ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

        mov eax, [esp+4]    ; get (0,0)
        push eax                            ; save (0,0)
        mov ebx, 19                         ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

        mov eax, [esp+4]    ; get (0,0)
        push eax                            ; save (0,0)
        mov ebx, 38                         ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

    jmp .draw_brush_end
        
    ; size 0

    .draw_brush_size_0:

        mov eax, [esp+4]    ; get (0,0)
        push eax                            ; save (0,0)
        mov ebx, 0                          ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

        mov eax, [esp+4]    ; get (0,0)
        push eax                            ; save (0,0)
        mov ebx, 19                          ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

        mov eax, [esp+4]    ; get (0,0)
        push eax                            ; save (0,0)
        mov ebx, 38                          ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

    jmp .draw_brush_end

    ; size 1

    .draw_brush_size_1:

        mov eax, [esp+4]    ; get (0,0)
        push eax                            ; save (0,0)
        mov ebx, 0                          ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

        mov eax, [esp+4]    ; get (0,0)
        push eax                            ; save (0,0)
        mov ebx, 19                          ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

        mov eax, [esp+4]    ; get (0,0)
        push eax                            ; save (0,0)
        mov ebx, 38                          ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

    jmp .draw_brush_end

    ; size 2

    .draw_brush_size_2:

        mov eax, [esp+4]    ; get (0,0)
        push eax                            ; save (0,0)
        mov ebx, 0                          ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

        mov eax, [esp+4]    ; get (0,0)
        push eax                            ; save (0,0)
        mov ebx, 19                          ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_ACTIVE_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

        mov eax, [esp+4]    ; get (0,0)
        push eax                            ; save (0,0)
        mov ebx, 38                          ; eltolas
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_R  ; R
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_G  ; G
        push ebx
        mov ebx, BRUSH_SIZE_FG_COLOR_B  ; B
        push ebx

        call draw_brush_node

        pop ebx    ; B
        pop ebx    ; G
        pop ebx    ; R
        pop ebx    ; eltolas
        pop ebx    ; save (0,0)

    .draw_brush_end:
    ret

brush_size_logic:
    xor ebx, ebx
    mov BYTE bl, [brush_size]
    cmp bl, 1
    jnge .brush_size_logic_0

    cmp bl, 2
    jnge .brush_size_logic_1

    cmp bl, 3
    jnge .brush_size_logic_2

    ; size 3 - 5x5star
        call brush_5x5star
        jmp .brush_size_skip

    ; size 0 - 1x1
    .brush_size_logic_0:
        jmp .brush_size_skip

    ; size 1 - 2x2
    .brush_size_logic_1:
        call brush_2x2
        jmp .brush_size_skip

    ; size 2 - 3x3star
    .brush_size_logic_2:
        call brush_3x3star

    .brush_size_skip:
    ret

brush_2x2:
    ; inner circle
        ; left
            mov ecx, 4
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

        ; bottom
            mov ecx, 4      ; reset to centrum
            sub eax, ecx

            mov ecx, 1792
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

            mov ecx, 4
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

brush_3x3star:
    ; inner circle
        ; right
            mov ecx, 4
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

            mov ecx, 4
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

        ; left
            mov ecx, 12
            sub eax, ecx    ; set start poz

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

            mov ecx, 4
            sub eax, ecx    ; set start poz

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

        ; top
            mov ecx, 4
            add eax, ecx    ; set start poz
            mov ecx, 1792
            sub eax, ecx    ; set start poz

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

            mov ecx, 4
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

            mov ecx, 4
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

        ; bottom
            mov ecx, 3584
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

            mov ecx, 4
            sub eax, ecx    ; set start poz

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

            mov ecx, 4
            sub eax, ecx    ; set start poz

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

    ; spikes
        ; bottom
            mov ecx, 4
            add eax, ecx    ; set start poz
            mov ecx, 1792
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

        ; top
            mov ecx, 7168
            sub eax, ecx    ; set start poz

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

brush_5x5star:
    ; inner circle
        ; right
            mov ecx, 4
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

            mov ecx, 4
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

            mov ecx, 4
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

        ; left
            mov ecx, 16
            sub eax, ecx    ; set start poz

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

            mov ecx, 4
            sub eax, ecx    ; set start poz

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

            mov ecx, 4
            sub eax, ecx    ; set start poz

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

        ; top
            mov ecx, 4
            add eax, ecx    ; set start poz
            mov ecx, 1792
            sub eax, ecx    ; set start poz

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

            mov ecx, 4
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

            mov ecx, 4
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

            mov ecx, 4
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

            mov ecx, 4
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

        ; bottom
            mov ecx, 3584
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

            mov ecx, 4
            sub eax, ecx    ; set start poz

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

            mov ecx, 4
            sub eax, ecx    ; set start poz

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

            mov ecx, 4
            sub eax, ecx    ; set start poz

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

            mov ecx, 4
            sub eax, ecx    ; set start poz

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

    ; spikes
        ; bottom
            mov ecx, 4
            add eax, ecx    ; set start poz
            mov ecx, 1792
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

            mov ecx, 4
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

            mov ecx, 4
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

            mov ecx, 4
            sub eax, ecx    ; set start poz
            mov ecx, 1792
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

        ; top
            mov ecx, 8960
            sub eax, ecx    ; set start poz

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

            mov ecx, 4
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

            mov ecx, 8
            sub eax, ecx    ; set start poz

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

            mov ecx, 4
            add eax, ecx    ; set start poz
            mov ecx, 1792
            sub eax, ecx    ; set start poz

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

handle_delete:
    call canvas_init
    ret

run_copy:
    push esi
    push edi
    push ebx
    
    mov esi, resized_canvas_data
    mov edi, canvas_data

    xor ecx, ecx

    .y_loop_upscale:
        cmp ecx, 28
        jge .end_upscale

        xor edx, edx
        .x_loop_upscale:
            cmp edx, 28
            jge .next_row_upscale

            mov eax, [esi]
            add esi, 4
            
            mov ah, al
            shl eax, 8
            mov al, ah
            
            push ecx
            push edx
            push esi

            mov ebx, ecx
            imul ebx, 28672
            
            mov esi, edx
            shl esi, 6
            
            add ebx, esi
            add ebx, edi
            
            xor ecx, ecx
            .draw_block_y:
                cmp ecx, 16
                jge .draw_block_end
                
                xor edx, edx
                .draw_block_x:
                    cmp edx, 16
                    jge .draw_block_next_line
                    
                    mov [ebx], eax
                    add ebx, 4
                    inc edx
                    jmp .draw_block_x
                    
                .draw_block_next_line:
                add ebx, 1728
                inc ecx
                jmp .draw_block_y
                
            .draw_block_end:
            pop esi
            pop edx
            pop ecx

            inc edx
            jmp .x_loop_upscale

        .next_row_upscale:
        inc ecx
        jmp .y_loop_upscale

    .end_upscale:
    pop ebx
    pop edi
    pop esi
    ret

handle_run:
    ;TODO
    ; debug only
    call resize

    call run_copy

    call rescale

    mov eax, 1
    push eax
    mov eax, rescaled_canvas_data
    push eax
    call reLU

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

    ; middle
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

    ; brush size
    call brush_size_logic
    ret

; AI
resize:
    ; resize loop
    ; canvas_data -> resized_canvas_data
    ; 448 * 448 -> 28 * 28

    push esi
    push edi
    xor ecx, ecx
    mov edi, resized_canvas_data

    .yloop_resize:
        cmp ecx, 28
        jge .yend_resize

        xor edx, edx
        .xloop_resize:
            cmp edx, 28
            jge .xend_resize

                ; 16 * 16 -> 1 * 1
                push ecx
                push edx

                xor ebx, ebx
                xor esi, esi

                ; calc start poz
                    mov eax, ecx
                    imul eax, 28672     ; skip y * 16 * 1792

                    mov ebx, edx
                    shl ebx, 6          ; skip x * 16 * 4

                    add eax, ebx
                    add eax, canvas_data

                xor ebx, ebx
                xor edx, edx
                xor ecx, ecx

                .canvas_yloop:
                    cmp ecx, 16
                    jge .canvas_yloop_end
                
                    xor edx, edx
                    .canvas_xloop:
                        cmp edx, 16
                        jge .canvas_xloop_end

                            mov ebx, [eax]
                            and ebx, 0x0000FF00
                            shr ebx, 8
                            add esi, ebx

                        add eax, 4  ; next pixel
                        inc edx
                        jmp .canvas_xloop
                    .canvas_xloop_end:
                        add eax, 1792   ; next row
                        sub eax, 64     ; reset to the left side
                        inc ecx
                        jmp .canvas_yloop

                .canvas_yloop_end:
                shr esi, 8
                mov [edi], esi

                add edi, 4

                pop edx
                pop ecx

            inc edx
            jmp .xloop_resize
        .xend_resize:
            inc ecx
            jmp .yloop_resize

    .yend_resize:
    pop edi
    pop esi
    ret

rescale:
    ; rescale loop
    ; resized_canvas_data -> rescaled_canvas_data
    ; int -> float

    push edi
    push esi

    xor ecx, ecx
    xorps xmm0, xmm0
    mov esi, resized_canvas_data
    mov edi, rescaled_canvas_data

    .loop_rescale:
        cmp ecx, 196    ; 28 * 28 / 4 cuz egyszerre negyen dolgozunk
        jge .end_rescale

        ; conv2float + temp store
            cvtsi2ss xmm0, [esi]
            movd [edi], xmm0

            cvtsi2ss xmm0, [esi+4]
            movd [edi+4], xmm0

            cvtsi2ss xmm0, [esi+8]
            movd [edi+8], xmm0

            cvtsi2ss xmm0, [esi+12]
            movd [edi+12], xmm0

        ; maga a rescale part
            movaps xmm0, [edi]
            divps xmm0, [rescale_div]
            movaps [edi], xmm0

        add esi, 16
        add edi, 16
        inc ecx
        jmp .loop_rescale

    .end_rescale:

    pop esi
    pop edi

    ret

linear:
    ret

conv:
    ret

reLU:
    ; in:   bejovo adat pointer
    ;       size: n
    push ebp
    mov ebp, esp
    push esi

        xor ecx, ecx
        xorps xmm1, xmm1

        mov esi, [ebp+8]
        mov edx, [ebp+12]

        ; loop
        .reLU_data_loop:
            cmp ecx, edx
            jge .endReLU_data_loop

                movss xmm0, [esi]
                maxss xmm0, xmm1
                movss [esi], xmm0

            add esi, 4
            inc ecx
            jmp .reLU_data_loop
        .endReLU_data_loop:

    pop esi
    pop ebp
    ret

argMax:
    ; in:   bejovo adat pointer
    ;       size: n
    ;
    ; out:  maxi -> eax
    push ebp
    mov ebp, esp
    push esi

        xor ecx, ecx
        xor eax, eax        ; max poz
        xorps xmm0, xmm0
        xorps xmm1, xmm1    ; max val

        mov esi, [ebp+8]
        mov edx, [ebp+12]

        movss xmm1, [esi]
        add esi, 4
        add ecx, 1

        ; loop
        .argMax_data_loop:
            cmp ecx, edx
            jge .endArgMax_data_loop

                movss xmm0, [esi]
                comiss xmm0, xmm1
                jng .argMax_skip

                    movss xmm1, xmm0
                    mov eax, ecx

                .argMax_skip:

            add esi, 4
            inc ecx
            jmp .argMax_data_loop
        .endArgMax_data_loop:

    pop esi
    pop ebp
    ret

MaxPool:
    ; in:   ???
    ;
    ; out:  ???

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

        xor eax, eax
        mov al, 2
        mov BYTE [brush_size], al

        xor eax, eax
        mov BYTE [brush_size_timeout], al
        xor eax, eax

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

            ; draw 8-bit display
                call draw_8_bit

            ; draw debug buttons
                call draw_debug
                call draw_brush

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

                ; canvas conituous draw
                    xor ebx, ebx
                    mov byte bl, [mouse_pressed]
                    cmp ebx, 0
                    je .skip_mouse_pressed

                        push eax

                        call gfx_getmouse
                        ; (x1,x2)
                        cmp eax, CANVAS_X1
                        jnge .skip_mouse_pressed
                        cmp eax, CANVAS_X2
                        jg .skip_mouse_pressed

                        ; (y1,y2)
                        cmp ebx, CANVAS_Y1
                        jnge .skip_mouse_pressed
                        cmp ebx, CANVAS_Y2
                        jg .skip_mouse_pressed

                            ; press logic
                            call handle_canvas

                        pop eax
                    .skip_mouse_pressed:

        ; draw frame    
        call gfx_unmap  ; unmap eax from framebuffer
        call gfx_draw   ; draw new frame

        ; event loop 
            ; handle timeout
            xor eax, eax
            mov BYTE al, [brush_size_timeout]
            cmp al, 0
            jng .skip_brush_timeout

            sub al, 1
            mov BYTE [brush_size_timeout], al
            xor eax, eax
            .skip_brush_timeout:

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

                ; button 1 / button 2 / debug
                call gfx_getmouse
                cmp ebx, BRUSH_SIZE_MINUS_1_Y1
                jge .brush_size_event
                cmp ebx, BUTTONS_WRAPPER_Y2
                jg .debug_event
                    
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

                ; debug
                .debug_event:
                    cmp eax, DEBUG_1_X1
                    jnge .miss_event
                    cmp ebx, DEBUG_1_Y1
                    jnge .miss_event

                    cmp eax, DEBUG_3_X2
                    jge .miss_event
                    cmp ebx, DEBUG_0_Y2
                    jge .miss_event

                    ; 1,2,3
                        cmp ebx, DEBUG_1_Y2     ; y
                        jge .debug_event_456

                            ; 1
                            cmp eax, DEBUG_1_X2     ; x
                            jge .debug_event_2

                                ; press logic
                                mov esi, 31
                                mov edi, 6
                                jmp .eventloop

                            ; 2
                            .debug_event_2:
                            cmp eax, DEBUG_2_X2     ; x
                            jge .debug_event_3

                                ; press logic
                                mov esi, 32
                                mov edi, 6
                                jmp .eventloop

                            ; 3
                            .debug_event_3:
                            cmp eax, DEBUG_3_X2     ; x
                            jge .miss_event

                                ; press logic
                                mov esi, 33
                                mov edi, 6
                                jmp .eventloop

                        jmp .debug_event_skip
                    ; 4,5,6
                        .debug_event_456:
                        cmp ebx, DEBUG_4_Y2     ; y
                        jge .debug_event_789
                            
                            ; 4
                            cmp eax, DEBUG_4_X2     ; x
                            jge .debug_event_5

                                ; press logic
                                mov esi, 34
                                mov edi, 6
                                jmp .eventloop

                            ; 5
                            .debug_event_5:
                            cmp eax, DEBUG_5_X2     ; x
                            jge .debug_event_6

                                ; press logic
                                mov esi, 35
                                mov edi, 6
                                jmp .eventloop

                            ; 6
                            .debug_event_6:
                            cmp eax, DEBUG_6_X2     ; x
                            jge .miss_event

                                ; press logic
                                mov esi, 36
                                mov edi, 6
                                jmp .eventloop

                        jmp .debug_event_skip
                    ; 7,8,9
                        .debug_event_789:
                        cmp ebx, DEBUG_7_Y2     ; y
                        jge .debug_event_0
                        
                            ; 7
                            cmp eax, DEBUG_7_X2     ; x
                            jge .debug_event_8

                                ; press logic
                                mov esi, 37
                                mov edi, 6
                                jmp .eventloop

                            ; 8
                            .debug_event_8:
                            cmp eax, DEBUG_8_X2     ; x
                            jge .debug_event_9

                                ; press logic
                                mov esi, 38
                                mov edi, 6
                                jmp .eventloop

                            ; 9
                            .debug_event_9:
                            cmp eax, DEBUG_9_X2     ; x
                            jge .miss_event

                                ; press logic
                                mov esi, 39
                                mov edi, 6
                                jmp .eventloop

                        jmp .debug_event_skip
                    ; 0
                    .debug_event_0:

                        cmp eax, DEBUG_0_X2     ; x
                        jge .miss_event

                            ; press logic
                            mov esi, 30
                            mov edi, 6
                            jmp .eventloop

                    .debug_event_skip:

                ; brush_size_event
                .brush_size_event:
                    cmp eax, BRUSH_SIZE_MINUS_1_X2
                    jg .brush_size_plus


                    ; brush size minus
                        cmp eax, BRUSH_SIZE_MINUS_1_X1
                        jnge .miss_event
                        cmp ebx, BRUSH_SIZE_MINUS_1_Y1
                        jnge .miss_event

                        cmp eax, BRUSH_SIZE_MINUS_1_X2
                        jge .miss_event
                        cmp ebx, BRUSH_SIZE_MINUS_1_Y2
                        jge .miss_event

                            ; press logic
                            mov eax, [brush_size]
                            cmp eax, 0
                            jng .eventloop
                            mov ebx, [brush_size_timeout]
                            cmp ebx, 0
                            jg .eventloop

                                xor eax, eax
                                xor ebx, ebx

                                mov bl, 8
                                mov BYTE [brush_size_timeout], bl
                                mov BYTE al, [brush_size]
                                sub eax, 1
                                mov BYTE [brush_size], al

                            jmp .eventloop

                    ; brush size plus
                    .brush_size_plus:
                        cmp eax, BRUSH_SIZE_PLUS_1_X1
                        jnge .miss_event
                        cmp ebx, BRUSH_SIZE_PLUS_1_Y1
                        jnge .miss_event

                        cmp eax, BRUSH_SIZE_PLUS_1_X2
                        jge .miss_event
                        cmp ebx, BRUSH_SIZE_PLUS_1_Y2
                        jge .miss_event

                            ; press logic
                            mov eax, [brush_size]
                            cmp eax, 3
                            jge .eventloop
                            mov ebx, [brush_size_timeout]
                            cmp ebx, 0
                            jg .eventloop

                                xor eax, eax
                                xor ebx, ebx

                                mov bl, 8
                                mov BYTE [brush_size_timeout], bl
                                mov BYTE al, [brush_size]
                                add al, 1
                                mov BYTE [brush_size], al

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
    ; AI
        align 16    ; memory eleres cucc orarol
                    ; oszthato 16-al a cim -> gyorsabb eleres
        canvas_data resb 448 * 448 * 4

        align 16
        resized_canvas_data resb 28 * 28 * 4

        align 16
        rescaled_canvas_data resb 28 * 28 * 4

    ; UI/UX
        mouse_pressed resb 1
        brush_size resb 1
        brush_size_timeout resb 1

section .data
    caption db "Get da numbs w/ CNN", 0
	errormsg db "ERROR: could not initialize graphics!", 0
    dbg db "debug", 0

    ; AI
        align 16
        rescale_div dd 255.0, 255.0, 255.0, 255.0
