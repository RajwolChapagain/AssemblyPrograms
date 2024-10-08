; NAME: Rajwol Chapagain
; Assignment: Fibonacci Sequence - Storing the first 16 terms of the fibonacci sequence
; Date: 09/30/24

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

SECTION .bss
; define uninitialized data here
Fibs: RESD 16

SECTION .text
global _main
_main:

; put your code here.
	mov ebx,Fibs	;; ebx stores mem location of Fibs
	mov DWORD [ebx],0	;; 0 is stored as the first element
	add ebx, 4	;; ebx now points to the next double word
	mov DWORD [ebx],1	;; 1 is stored as the second element
	mov eax,[ebx]	;; store 1 in eax

	add eax,[ebx-4]	;; add the current element and previous element (0+1=1)
	add ebx,4	;; ebx now points at the third double word
	mov [ebx],eax	;; copy the sum stored in eax to ebx

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

	add eax,[ebx-4]	
	add ebx,4	
	mov [ebx],eax	

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
