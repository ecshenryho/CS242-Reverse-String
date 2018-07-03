.686
.model flat

.code

_reverse PROC	;named _test because C automatically prepends an underscode, it is needed to interoperate

	push ebp
	mov ebp,esp		       ;stack pointer to ebp
	mov ebx, [ebp+8]       ;ebx = the address 1st element
	mov ebp,0              ; count from the begining of the array
	mov edi,0              ;count start from the end of the array

	jmp getLength	       ;the size of the array is in edx

continue:
	
	mov edi,edx			   ;size of the array-1
	sub edi,1
	shr edx,1

loopMe:
	cmp edx,ebp
	jle allDone
	jmp swap

endSwap:
	add ebp,1
	sub edi,1
	jmp loopMe

getLength:
	mov edx,0			   
	more:
		mov al,[ebx+edx]
		cmp al,0
		je continue
		add edx,1
		jmp more
	jmp continue
swap:
	mov al,[ebx+ebp]
	mov ah,[ebx+edi]

	mov [ebx+ebp],ah
	mov [ebx+edi],al
	jmp endSwap

allDone:
	pop ebp
	ret
_reverse ENDP

END