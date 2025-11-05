; Mathe Ruben-Jonathan
; mrim2553
; 512/1
; L2
;  
; Írjunk meg egy-egy ASM alprogramot (függvényt, eljárást) 32 bites, 
; előjeles egész (decimális), illetve 32 bites, pozitív hexa számok 
; beolvasására és kiírására.
;

%include 'mio.inc'

%include 'io.inc'

global main

section .text

; READ INT
readInt10:
	mov ebx, 0
	.for:
		; SET eax -> 0 | READ CHAR | IF(CHAR == LF) END | ELSE WRITE CHAR
		mov eax, 0
		call mio_readchar
		CMP al, 13
		JE .endFor
		call mio_writechar
		
		; TRANSFORM CHAR -> INT
		mov cl, '0'
		sub al, cl
		call io_writeint
		
		; TEST: ADD TO ebx
		imul ebx, 10
		add ebx, eax
		mov eax, ebx 
		
		push eax
		mov     al, 13              ; carriage return
		call    mio_writechar
		mov     al, 10              ; line feed
		call    mio_writechar
		pop eax
		call io_writeint
		mov     al, 13              ; carriage return
		call    mio_writechar
		mov     al, 10              ; line feed
		call    mio_writechar
		pop eax
		
		;TEST
		;stc <-- set carry
		;JMP .endFor
		
		; for LOOP ITERATION
		JMP .for
		
	; READ INT vege
	.endFor:
		mov eax, ebx
		
		push eax
		; New line
		mov     al, 13              ; carriage return
		call    mio_writechar
		mov     al, 10              ; line feed
		call    mio_writechar
		
		call io_writeint
		
		ret
		
readInt10Error:
	mov eax, hiba
	call mio_writestr
	ret
	
writeInt10:
	mov EBP, ESP
	pop eax

	; WHILE numb != 0
	.for:
		CMP ebx, 0
		JE .endFor
		
		; GET LAST DIGIT
		mov edi, 10
		idiv edi
		mov ebx, eax
		mov eax, edx

		; CONVERT LAST DIGIT
		mov cl, '0'
		add al, cl
		
		; STORE LAST DIGIT
		push eax
		
		; for LOOP ITERATION
		JMP .for
		
	.endFor:
		; GET LAST DIGIT
		.for2:
			CMP ESP, EBP
			JE .endFor2
			pop ecx
			mov al,cl
			call mio_writechar
			JMP .for2
		.endFor2:
	ret
	
readInt16:
	ret
	
writeInt16:
	ret
	
testt:
	mov eax, 0
	;mov ebx, 0

	;mov al, 0x2
	;mov bl, '9'
	
	mov al, '5'
	call io_writestr
	
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
	call readInt10
	
	JC readInt10Error
	
	; test
	;call testt
	
	;reset registers
	;mov ebx, 0
	;mov ecx, 0
	
	; CALL WRITE INT
	;call writeInt10
	
	ret
	
section .data:
	hiba db "Hibaaa", 0