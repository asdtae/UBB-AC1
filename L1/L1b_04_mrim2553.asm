; Mathe Ruben-Jonathan
; mrim2553
; 512/1
; L1b
; 4. 
;	ha d mod 4 = 0 : 2 * a * c
;	ha d mod 4 = 1 : (a * c) + (b mod 11)
;	ha d mod 4 = 2 : 8 - (5 * b)
;	ha d mod 4 = 3 : (c - b) * (b + c)

; References:
; 	(1)	https://www.tutorialspoint.com/assembly_programming/assembly_conditions.htm
;	(2) https://www.tutorialspoint.com/assembly_programming/assembly_strings.htm

%include 'io.inc'

global main

section .text

main:
	; READ a-d	___excel: 1-4
	call io_readint 	; read a
	mov esi, eax    	; move a: eax -> esi
	
	call io_readint 	; read b
	mov ecx, eax    	; move b: eax -> ecx
	
	call io_readint 	; read c
	mov ebx, eax    	; move c: eax -> ebx
	
	call io_readint 	; read d
	
	; if(...) ___excel: 5
	cdq
	mov edi, 4
	idiv edi
	mov edi, 0
	mov eax, esi
	
	;	ha d mod 4 = 1
	mov edi, 1
	CMP edx, edi
	JE L1
	
	;	ha d mod 4 = 2
	mov edi, 2
	CMP edx, edi
	JE L2
	
	;	ha d mod 4 = 3
	mov edi, 3
	CMP edx, edi
	JE L3
	
	;	ha d mod 4 = 0		2 * a * c
	;	___excel: 6-7
	L0:
	mov edi, eax
	mov eax, [msg0]
	;call ???
	mov eax, edi
	
	mov edi, 2
	imul eax, edi
	imul eax, ebx
	mov edi, 0
	call io_writeint
	ret
	
	;	ha d mod 4 = 1		(a * c) + (b mod 11)
	;	___excel: 8-10
	L1:
	mov edi, eax
	mov eax, [msg1]
	;call ???
	mov eax, edi
	
	mov edi, 11
	imul eax, ebx	;		a * c
	mov ebx, eax
	mov eax, ecx
	cdq
	idiv edi		;		d mod 11
	mov eax, ebx
	mov edi, 0
	add eax, edx
	mov edx, 0
	call io_writeint
	ret
	
	;	ha d mod 4 = 2		8 - (5 * b)
	;	___excel: 11-13
	L2:
	mov edi, eax
	mov eax, [msg2]
	;call ???
	mov eax, edi
	
	mov edi, 5
	mov eax, 8
	mov ebx, 0
	mov edx, 0
	imul ecx, edi
	mov edi, 0
	sub eax, ecx
	mov ecx, 0
	call io_writeint
	ret
	
	;	ha d mod 4 = 3		(c - b) * (b + c)
	;	___excel: 14-16
	L3:
	mov edi, eax
	mov eax, [msg3]
	;call ???
	mov eax, edi
	
	mov edi, 0
	mov eax, 0
	mov edx, 0
	push ebx
	sub ebx, ecx
	pop eax
	add eax, ecx 
	mov ecx, 0
	imul eax, ebx
	mov ebx, 0
	call io_writeint
	ret
	
section .data
	msg0 db "ha d mod 4 = 0 : 2 * a * c", 0
	msg1 db "ha d mod 4 = 1 : (a * c) + (b mod 11)", 0
	msg2 db "ha d mod 4 = 2 : 8 - (5 * b)", 0
	msg3 db "ha d mod 4 = 3 : (c - b) * (b + c)", 0