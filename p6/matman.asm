; NAME:		Rajwol Chapagain
; Assignment:	Matrix Manipulation - A program that calculates the sum of the rows and columns of a matrix as well as the grand total
; Date:		10/16/24, Wednesday


; define constants here

ROWS: EQU 5
COLS: EQU 7

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

MyMatrix: 	dd	 1,  2,  3,  4,  5,  6,  7
	    	dd	 8,  9, 10, 11, 12, 13, 14
		dd	15, 16, 17, 18, 19, 20, 21
		dd	22, 23, 24, 25, 26, 27, 28
		dd	29, 30, 31, 32, 33, 34, 35
	
;;;;; put your extra variables below this line ;;;;;;;;;;;;;;;
rowsadded:	dd	0
colsadded:	dd	0
elemcount:	dd	0

SECTION .bss
; define uninitialized data here

RowSums:	RESD ROWS
ColSums:	RESD COLS
Sum:		RESD 1

SECTION .text
global _main
_main:
; put your code here.

;============= Loop to sum rows ==============
mov ebx, MyMatrix
mov edx, RowSums
sumrows:	
	mov ecx, COLS
	xor eax, eax
	sumrow:
		add eax, [ebx]
		add ebx, 4
	loop sumrow

	; Once we make it to the end of the row
	mov [edx], eax				;; Save the sume in the RowSums array
	inc DWORD [rowsadded]
	add edx, 4
	cmp DWORD [rowsadded], ROWS
jne sumrows

;============= Loop to sum columns ==============
mov eax, COLS
mov esi, 4
mul esi
mov esi, eax					;; Assuming no overflow
mov edx, ColSums
mov edi, 0
sumcols:	
	mov ebx, MyMatrix
	mov ecx, ROWS
	xor eax, eax
	sumcol:
		add eax, [ebx+edi]
		add ebx, esi
	loop sumcol

	; Once we make it to the end of the column
 	mov [edx], eax				;; Save the sum in the ColSums array
 	inc DWORD [colsadded]
 	add ebx, [colsadded]
	add edx, 4
	add edi, 4
	cmp WORD [colsadded], COLS
jne sumcols

;============= Loop to sum all elements ==============
mov eax, COLS
mov ebx, ROWS
mul ebx
mov ecx, eax

xor eax, eax
mov ebx, MyMatrix
sumall:
	add eax, [ebx]	
	add ebx, 4
loop sumall

mov [Sum], eax

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
