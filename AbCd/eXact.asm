; NAME		: Rajwol Chapagain
; Class		: CSC 322
; Assignment	: Exactness with Macros - an assignment where we use a macro to print to the terminal while following instructions exactly.
; Date		: 11/18/24, Monday

%macro PrintIt 2
	pusha
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,[%2]
	int 80h
	popa
%endmacro

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
Msg1:	db "Hello, world!", 10
Msize1:	dd ($ - Msg1)
Msg2:	db "Goodbye, world!", 10
Msize2:	dd ($ - Msg2) 

SECTION .text
global _main
_main:
; put your code here.
	mov eax,1
	mov ebx,2
	mov ecx,3
	mov edx,4

	PrintIt Msg1,Msize1
	PrintIt Msg2,Msize2

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
