; Mathe Ruben-Jonathan
; mrim2553
; 512/1
; L1a
; 4. 
;	((b - e - f) div (d + c)) + ((4 * (a - f)) div d + g) - ((b - e + c - a) mod (d + g))

%include 'io.inc'

global main

section .text

main:

	; READ a-f
	call io_readint 	; read a
	mov edi, eax    	; move a: eax -> edi
	
	call io_readint 	; read b
	mov esi, eax    	; move b: eax -> esi
	
	call io_readint 	; read c
	mov edx, eax    	; move c: eax -> edx
	
	call io_readint 	; read d
	mov ecx, eax    	; move d: eax -> ecx
	
	call io_readint 	; read e
	mov ebx, eax    	; move e: eax -> ebx
	
	call io_readint 	; read f
	
	; calc A = alpha/beta ___excel: 1-7		((b - e - f) div (d + c))
		; calc alpha ___excel: 1-3		(b - e - f)
		push esi
		push ebx
		push eax
		sub esi, ebx
		sub esi, eax
		
		; calc beta	___excel: 4		(d + c)
		mov eax, ecx
		add eax, edx
		
		;div prep ___excel: 5
		push ecx
		push edx
		push edi
		mov edi, eax
		mov eax, 0
		mov ebx, 0
		mov ecx, 0
		mov edx, 0
		
		;div ___excel: 6-7
		mov eax, esi
		mov ebx, edi
		cdq
		idiv ebx
		
	; calc B = gamma/d + g ___excel: 8-15	((4 * (a - f)) div d + g)
		; calc gamma ___excel: 8-10		(4 * (a - f)
		mov edi, eax
		pop eax
		pop ebx
		pop ecx
		pop edx
		push eax
		push ebx
		sub eax, edx
		push edx
		imul eax, 4
		
		; calc delta = gamma/d ___excel: 11-11b
		cdq
		idiv ecx
		mov ebx, eax
		call io_readint ; read g
		push eax
		push ecx
		add eax, ebx
		
	; calc C = epsilon%zeta ___excel: 16-22	((b - e + c - a) mod (d + g))
	; ___excel: 16-17
	mov esi, eax
	add edi, esi
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	mov esi, 0
	
		; calc zeta ___excel: 18-18b		(d + g)
		pop eax
		pop ebx
		add eax, ebx
		mov esi, eax
		mov ebx, 0
		
		; calc epsilon ___excel: 19-22		(b - e + c - a)
		pop eax
		pop eax
		pop ebx
		pop ecx
		pop edx
		sub edx, ecx
		sub eax, ebx
		mov ebx, 0
		mov ecx, 0
		add eax, edx
		mov ebx, esi
		mov edx, 0
		
		;mod ___excel: 23
		cdq
		idiv ebx
		
	; calc A + B - C ___excel: 24-25
	mov ebx, 0
	sub edi, edx
	mov edx, 0
	
	mov eax, txt 
	call io_writestr
	
	mov eax, edi 
	call io_writeint
	
	ret
	
section .data

txt dw "((b - e - f) div (d + c)) + ((4 * (a - f)) div d + g) - ((b - e + c - a) mod (d + g)) = ", 0