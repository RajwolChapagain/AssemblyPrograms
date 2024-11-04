; Name:		Rajwol Chapagain
; Assignment:	Reverse Array Procedure - Writing a procedure that reverses the contents of an array passed in
; Date:		11/04/2024, Monday

SECTION .data
	array1:	dd	1,2,3,4,5
	a1size:	dd	($-array1)/4

	array2:	dd	-10, -9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9
	a2size:	dd	($-array2)/4

	array3:	dd 	0,10,20,30,40,50,60,70,80,90
		dd  	100,110,120,130,140,150,160,170,180,190
		dd  	200,210,220,230,240,250,260,270,280,290
		dd  	300,310,320,330,340,350,360,370,380,390
		dd  	400,410,420,430,440,450,460,470,480,490,500
	a3size:	dd    	($-array3)/4

SECTION .text
global _main
_main:
	push DWORD array1
	push DWORD [a1size]
	call reverse

	push DWORD array2
	push DWORD [a2size]
	call reverse

	push DWORD array3
	push DWORD [a3size]
	call reverse

lastBreak:

; Normal Termination
mov eax,1
mov ebx,0
int 80h


; Expects the following stack structure:
; return address
; Array Size
; Array Pointer
reverse:
	; Save registers that procedure uses
	push eax
	push ebx
	push ecx
	push edx

	mov eax,[esp+24]	; Move the array pointer into eax
	mov ebx,[esp+20]	; Move the array size into ebx

	mov edx,eax
	mov ecx,ebx

	; Push the array values onto the stack
	pushArray:
		push DWORD [edx]
		add edx,4
		loop pushArray

	mov edx,eax
	mov ecx,ebx

	; Pop the array values off of the stack
	popArray:
		pop DWORD [edx]
		add edx,4
		loop popArray

	; Restore registers
	pop edx
	pop ecx
	pop ebx
	pop eax

	ret
		
