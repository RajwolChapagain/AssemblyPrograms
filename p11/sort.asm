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
nums: dw 2000, 3000, 0, 65535, 0, 1, 2, 3, 100
numslen: EQU ($-nums)/2
print_field: db '0', '0', '0', '0', '0', 10
charlen: dd 6

clear:	db 27, "[2J", 27, "[H"
clear_len: dd ($-clear)

title: db "*** Rajwol's Array Sorting Program ***",10,10,10
title_len: dd ($-title)

orig_array: db "Original Array",10,10
orig_array_len: dd ($-orig_array)

sorted_array: db "Sorted Array",10,10
sorted_array_len: dd ($-sorted_array)

new_line: db 10
new_line_len: dd 1

SECTION .text
global _main
_main:
	print clear, clear_len
	print title, title_len

	print orig_array, orig_array_len

	mov ebx, nums
	mov ecx, numslen
	call print_array
	call sort_array

	print new_line, new_line_len
	print sorted_array, sorted_array_len
	call print_array

lastBreak:
	mov eax,1
	mov ebx,0
	int 80h

; Expects:
; ax: Number to be printed
convert_num_to_char:
	push eax
	push ebx
	push ecx
	push edx

	mov ebx, 10
	mov ecx, 5
	top:
		xor edx, edx
		div ebx
		add dx, 48
		mov [print_field + ecx - 1], dl
		loop top
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret

; Expects:
; ebx: pointer to start of array
; ecx: number of array elements
sort_array:
	push ebx
	push ecx
	push edx
	push esi

	; Move array element count into edx
	mov edx, ecx
	dec ecx

	outer_loop:
		push ecx
		push ebx
		inner_loop:
			mov ax, [ebx]
			mov si, [ebx + 2]
			cmp ax, si
			jbe done
			; swap
			mov [ebx], si
			mov [ebx + 2], ax
			done:
			add ebx, 2
			loop inner_loop

		pop ebx
		pop ecx
		loop outer_loop

	pop esi
	pop edx
	pop ecx
	pop ebx
	ret

; Expects:
; ebx: pointer to start of array
; ecx: number of array elements
print_array:
	push eax
	push ebx
	push ecx

	print_num:
		xor eax, eax
		mov ax, [ebx]
		call convert_num_to_char
		print print_field, charlen
		add ebx, 2
		loop print_num

	pop ecx
	pop ebx
	pop eax
	ret
