; NAME: Rajwol Chapagain
; ASSIGNMENT: Data Storage - Writing a program that generates data
; DATE: 09/17/24, Tuesday
; PROGRAMMER STATUS: Hungry

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
a: 	DB	11
b: 	DW	11b
c:	DD	11h
d:	DQ	11q
e:	DW	-5
f:	DB	'CSC322'
g:	DB	'Howdy'
h:	DW	'Howdy'
i:	DB	1,2,3
j:	DD	10,11,12,14
a1: 	DW	2,4,6,8,10
b1: 	DB	1,2,3,4,5
c1:	DD	10,20,30,40
d1:	DQ	10h,11h,12h,13h
a2: 	DW	-50
b2: 	DB	-45
c2:	DW	-30
d2:	DB	-25
e2:	DW	-20
a3: 	DB	'Bears'
b3: 	DD	100
c3:	DW	0
d3:	DB	'Go ' ;space after o
e3:	DB	'Mercer!'
a4: 	DB	100
b4: 	DW	100h
c4:	DD	100b
d4:	DW	100q
e4:	DB	100d

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

; put your code here.



; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
