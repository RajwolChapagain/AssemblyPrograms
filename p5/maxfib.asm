; NAME: Rajwol Chapagain
; Assignment: Max Fibonacci - Looping to calculate the numbers in a fibonacci sequence and determining the maximum fibonacci number that will fit in a double word
; Date: 10/09/2024, Wednesday

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

SECTION .bss
; define uninitialized data here
MaxFib: RESD 1
FibCount: RESW 1

SECTION .text
global _main
_main:

; put your code here.
	mov ebx, 0		;; ebx will store the last Fibonacci number
	mov ecx, 1		;; ecx will store the current Fibonacci number
	mov dx, [FibCount]	;; dx will count the number of Fibs

	mov eax, ecx
	inc dx
top:	
	inc dx
	mov ecx, eax
	add eax, ebx        	;; Add current and last Fibonacci number
	mov ebx, ecx
	
	jnc top

	mov [MaxFib], ecx
	mov [FibCount], dx
lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
