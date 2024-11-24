STRUC PosChar
	.esc RESB 1
	.bracket RESB 1
	.rowdigit1 RESB 1
	.rowdigit2 RESB 1
	.semicol RESB 1
	.coldigit1 RESB 1
	.coldigit2 RESB 1
	.H RESB 1
	.char RESB 1
	.size:
ENDSTRUC

%macro print 2
	pusha
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,[%2]
	int 80h
	popa
%endmacro

%macro up 2
	push DWORD %1 + PosChar.rowdigit1
	call decnum
	print %1, %2
%endmacro

%macro down 2
	push DWORD %1 + PosChar.rowdigit1
	call incnum
	print %1, %2
%endmacro

%macro left 2
	push DWORD %1 + PosChar.coldigit1
	call decnum
	print %1, %2
%endmacro

%macro right 2
	push DWORD %1 + PosChar.coldigit1
	call incnum
	print %1, %2
%endmacro

SECTION .data
clear:	db 27, "[2J", 27, "[H"
clear_len: dd ($-clear)

string: db 1bh, "[20;80HO"
len: dd ($-string)

p_string: db 1bh, "[22;57HCSC322"
p_len: dd ($-string)

reset_pos: db 1bh, "[45;00H"
reset_pos_len: dd ($ - reset_pos)

SECTION .text
global _main
_main:
	print clear, clear_len
	print string, len

	mov ecx, 20
top:
	down string, len
	left string, len
	loop top

	mov ecx, 20
top2:
	up string, len
	left string, len
	loop top2


	mov ecx, 10
top3:
	up string, len
	right string, len
	loop top3

	mov ecx, 10
top4:
	down string, len
	right string, len
	loop top4

	mov ecx, 10
top5:
	up string, len
	right string, len
	loop top5

	mov ecx, 10
top6:
	down string, len
	right string, len
	loop top6


	print p_string, p_len

; Reset cursor
	print reset_pos, reset_pos_len
	
	mov eax,1
	mov ebx,0
	int 80h

incnum:
	push eax
	mov eax, [esp + 8] ; eax now contains the address of the first digit in the 2-digit number we want to increment
	cmp BYTE [eax + 1], 57
	je second_digit_is_nine

	inc BYTE [eax + 1]
	jmp done_inc

	second_digit_is_nine:
	cmp BYTE [eax], 57
	je done_inc

	mov BYTE [eax+1],48
	inc BYTE [eax]

	done_inc:
	pop eax
	ret

decnum:
	push eax
	mov eax, [esp + 8] ; eax now contains the address of the first digit in the 2-digit number we want to decrement
	cmp BYTE [eax + 1], 48
	je second_digit_is_zero

	dec BYTE [eax + 1]
	jmp done_dec

	second_digit_is_zero:
	cmp BYTE [eax], 48
	je done_dec

	mov BYTE [eax + 1],57
	dec BYTE [eax]

	done_dec:
	pop eax
	ret
