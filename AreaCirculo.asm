BITS 64
;Alumno: Alfredo  Rigoberto Alvarez Suarez
;Codigo: 209529357
;Seccion: D07
;Programacion de sistemas
%define ALINEAPILA push rsp
%define SALIDA pop rsp
section .bss
	CAT1: resq 1
	RESL: resq 1
section .data
	mensaje1: db "Escribe el Radio del Circulo",10,0
	lngmsj1: equ $-mensaje1
	mnsj2: db "Radio:",10,0
	lngmsj2: equ $-mnsj2

	formato: db "El Area del circulo es: %.3f",10,0 
	forment: db "%f",0		
section .text
	extern printf
	extern scanf
	global main

main: 
	ALINEAPILA
	xor rax, rax
	mov rdi, mensaje1
	call printf
	
	mov rax,1
	mov rdi,forment
	call scanf 
		
	unpcklps xmm0, xmm0 	
	cvtps2pd xmm0, xmm0 		
	movsd qword [CAT1], xmm0 	

	fld qword [CAT1]		
	fmul st0		
	fldpi				
	fmul st0,st1
				
	fstp qword [RESL]
	mov rdi,formato	
	movsd xmm0, qword [RESL]	
	mov rax,1
	call printf
	SALIDA
	mov rax,60
	mov rdi,0
	syscall
