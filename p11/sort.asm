%macro print 2
	pusha
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,[%2]
	int 80h
	popa
%endmacro

SECTION .data
;nums: dw 2000, 3000, 0, 655535, 0, 1, 2, 3, 100
;numslen: EQU ($-nums)
print_field: db '0', '0', '0', '0', '0', 10
charlen: dd 6

SECTION .text
global _main
_main:
	print print_field, charlen
	push 10
	call convert_num_to_char
	print print_field, charlen
	
lastBreak:
	mov eax,1
	mov ebx,0
	int 80h

convert_num_to_char:
	mov eax, [esp+4]
	mov ebx, 10

	mov ecx, 5
	top:
		xor edx, edx
		div ebx
		add dx, 48
		mov [print_field + ecx - 1], dl
		inc esi
		loop top
	ret
