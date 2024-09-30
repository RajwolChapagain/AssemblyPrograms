; NAME: Rajwol Chapagain
; CSC 322 | 09/29/24, Sunday
; ASSIGNMENT: Summing Arrays 
; DESCRIPTION: A program that sums different-sized arrays and puts them into the appropriate data variables

SECTION .data
bArray:		DB		-10,20,-30,40,-50
wArray:		DW		2,4,6,8,10
dArray:		DD		322,322h,322q,1833,1833h
bArraySum:	DB		0
wArraySum:	DW		0
dArraySum:	DD		0
grandTotal:	DD		0

SECTION .text
global _main
_main:
; Sum byte array
	mov al,[bArray]
	add al,[bArray+1]
	add al,[bArray+2]
	add al,[bArray+3]
	add al,[bArray+4]
	mov [bArraySum],al

; Sum word array
	mov ax,[wArray]
	add ax,[wArray + 2]
	add ax,[wArray + 4]
	add ax,[wArray + 6]
	add ax,[wArray + 8]
	mov [wArraySum],ax

; Sum double array
	mov eax,[dArray]
	add eax,[dArray + 4]
	add eax,[dArray + 8]
	add eax,[dArray + 12]
	add eax,[dArray + 16]
	mov [dArraySum],eax 

; Get the three integers into like-sized registers
	mov	ah,[bArraySum]
	mov	bx,[wArraySum]
	mov	ecx,[dArraySum]

; Sum up the three as signed integers
	xor	edx,edx	;;;; zero-out the edx register
	add	edx,ecx
	movsx	ecx,ah  ;;;;  convert the byte in ah to its equivalent double word signed value
	add	edx,ecx
	movsx	ecx,bx  ;;;;  convert the word in bx to its equivalent double word signed value
	add	edx,ecx
	mov 	[grandTotal],edx

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
