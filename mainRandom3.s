 .text
 .align 2
 .global main
 .func main
main:
cont .req r5
	
	ldr r0,=inicio		@Mensaje de Bienvenida
	bl puts

	ldr r0,=inicio2		@Preguntas
	bl puts

	ldr r0,=num
	ldr r1,=opcion
	bl scanf
	ldr r1,=opcion
	ldr r1,[r1]
	
	cmp r1, #1
	beq opcion1
	cmp r1, #2
	beq opcion2
	
opcion1: 
	ldr r0,=pregunta1		@Preguntas
	bl puts

	ldr r0,=num
	ldr r1,=opcion
	bl scanf

	b repite
opcion2: 
	ldr r0,=pregunta2		@Preguntas
	bl puts

	ldr r0,=num
	ldr r1,=opcion
	bl scanf

	b repite

repite:	
	mov r0,sp
	mov r11, #0
	ldr r10,=arreglo1 
	bl mysrand
	mov cont,#4		@ Cantidad de numeros aleatorios
ciclo:		bl myrand
		push {r0}
		mov r1,r0
		and r1,r1,#1 @para que genere numeros entre 0 y 3
		ldr r0,=formato
		bl printf
		pop {r0}
		subs cont, cont, #1
		bne ciclo



.unreq	cont
	mov r7,#1
	swi 0
	
 .data
 .align 2
formato: .asciz "%d\n"
mascara: .word 0xF
inicio:  .asciz "Bienvenido al juego PiDots!"
inicio2: .asciz "¿Los caracteres a unir se encuentran en una fila o en una columna? \n 1. Fila \n 2. columna"
pregunta1: .asciz "De que fila a  que fila se encuentra la cadena"
pregunta2: .asciz "De que columna a que columna se encuentra la cadena"
num:   .asciz "%d"
opcion: 	.word 0
arreglo1: .word 0, 0, 0, 0
arreglo2: .word 0, 0, 0, 0
arreglo3: .word 0, 0, 0, 0
arreglo4: .word 0, 0, 0, 0
temp:				.word 0



