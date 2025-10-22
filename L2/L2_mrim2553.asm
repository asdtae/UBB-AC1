; Mathe Ruben-Jonathan
; mrim2553
; 512/1
; L1b
;  
; Írjunk meg egy-egy ASM alprogramot (függvényt, eljárást) 32 bites, 
; előjeles egész (decimális), illetve 32 bites, pozitív hexa számok 
; beolvasására és kiírására.
;

%include 'mio.inc'

global main

section .text

; READ INT
readInt:
	.for:
		; SET eax -> 0 | READ CHAR | IF(CHAR == LF) END | ELSE WRITE CHAR
		mov eax, 0
		call mio_readchar
		CMP al, 13
		JE .endFor
		call mio_writechar
		
		; New line
		mov     al, 13              ; carriage return
		call    mio_writechar
		mov     al, 10              ; line feed
		call    mio_writechar
		
		; TRANSFORM CHAR -> INT
		;mov cl, '0'
		;sub cl, al
		;mov al, cl
		
		; TEST: ADD TO ebx
		imul ebx, 10
		add ebx, eax
		
		;TEST
		stc
		JMP .endFor
		
		; for LOOP ITERATION
		JMP .for
		
	; READ INT vege
	.endFor:
		mov eax, ebx
		call mio_writechar
		ret
		
readIntError:
	mov eax, hiba
	call mio_writestr
	ret

main:
	; SET->0
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	mov esi, 0
	mov edi, 0
	
	; CALL READ INT
	call readInt
	JC readIntError
	
	ret
	
section .data:
	hiba db "Hibaaa", 0