/* Universidad del Valle de Guatemala*/
/* Organizacion de computadoras y assembler*/
/* Seccion 10*/
/*Proyecto 3 - Juego PiDots*/
/* Autores: Oscar Saravia 19322*/
/*			Diego Alvarez 19498*/

 .text
 .align 2
 .global main
 .func main
 
main:

	cont .req r5
	mov r5, #5
	ldr r0,=titulo	@Print de titulo en asciiart
	bl puts
	
	ldr r0,=inicio		@Mensaje de Bienvenida
	bl puts
	/*************************************/
	/*        Inicio del tablero         */
	/*************************************/
	ldr r10,=arreglo1
	add r10, r10, #12	
tablero: 
	/*********************/
	/*		 Fila 1	   	 */
	/*********************/

	arregloA:
		bl aleatorios
		cmp r0, #100
		movgt r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10, r10,#4 			@ Regresar 4 bytes
		subs r5,r5,#1
		bne arregloA

	/*********************/
	/*		 Fila 2	   	 */
	/*********************/	

	ldr r10,=arreglo2
	add r10, r10, #12
	mov r5, #5

	arregloB:
		bl aleatorios
		cmp r0, #100
		movgt r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10, r10,#4 			@ Regresar 4 bytes
		subs r5,r5,#1
		bne arregloB

	/*********************/
	/*		 Fila 3	   	 */
	/*********************/	

	ldr r10,=arreglo3
	add r10, r10, #12
	mov r5, #5

	arregloC:
		bl aleatorios
		cmp r0, #100
		movgt r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10, r10,#4 			@ Regresar 4 bytes
		subs r5,r5,#1
		bne arregloC

	/*********************/
	/*		 Fila 4	   	 */
	/*********************/	

	ldr r10,=arreglo4
	add r10, r10, #12
	mov r5, #5

	arregloD:
		bl aleatorios
		cmp r0, #100
		movgt r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10, r10,#4 			@ Regresar 4 bytes
		subs r5,r5,#1
		bne arregloD

	/*********************/
	/*		 Fila 5	   	 */
	/*********************/	

	ldr r10,=arreglo5
	add r10, r10, #12
	mov r5, #5

	arregloE:
		bl aleatorios
		cmp r0, #100
		movgt r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10, r10,#4 			@ Regresar 4 bytes
		subs r5,r5,#1
		bne arregloE

	/*************************************/
	/*		 Para imprimir tablero	   	 */
	/*************************************/
impTablero: 
	/*********************/
	/*		 Fila 1	   	 */
	/*********************/	

	ldr r4,=arreglo1
	add r4, r4, #12 @mover al final
	mov r5,#5 @contador del vector
	ciclo1:
		ldr r1,[r4]    @valor de datos para imprimir
		ldr r0,=formato
		bl printf
		sub r4, r4, #4 @mover 4 byte
		subs r5,r5,#1
		bne ciclo1
	ldr r0,=formato2
	bl printf

	/*********************/
	/*		 Fila 2	   	 */
	/*********************/	

	ldr r4,=arreglo2
	add r4, r4, #12 @mover al final
	mov r5,#5 @contador del vector
	ciclo2:
		ldr r1,[r4]    @valor de datos para imprimir
		ldr r0,=formato
		bl printf
		sub r4, r4, #4 @mover 4 byte
		subs r5,r5,#1
		bne ciclo2
	ldr r0,=formato2
	bl printf

	/*********************/
	/*		 Fila 3	   	 */
	/*********************/	

	ldr r4,=arreglo3
	add r4, r4, #12 @mover al final
	mov r5,#5 @contador del vector
	ciclo3:
		ldr r1,[r4]    @valor de datos para imprimir
		ldr r0,=formato
		bl printf
		sub r4, r4, #4 @mover 4 byte
		subs r5,r5,#1
		bne ciclo3

	ldr r0,=formato2
	bl printf
	
	/*********************/
	/*		 Fila 4	   	 */
	/*********************/	

	ldr r4,=arreglo4
	add r4, r4, #12 @mover al final
	mov r5,#5 @contador del vector
	ciclo4:
		ldr r1,[r4]    @valor de datos para imprimir
		ldr r0,=formato
		bl printf
		sub r4, r4, #4 @mover 4 byte
		subs r5,r5,#1
		bne ciclo4
	ldr r0,=formato2
	bl printf
	
	/*********************/
	/*		 Fila 5	   	 */
	/*********************/	

	ldr r4,=arreglo5
	add r4, r4, #12 @mover al final
	mov r5,#5 @contador del vector
	ciclo5:
		ldr r1,[r4]    @valor de datos para imprimir
		ldr r0,=formato
		bl printf
		sub r4, r4, #4 @mover 4 byte
		subs r5,r5,#1
		bne ciclo5

	ldr r0,=formato2
	bl printf



	/*************************************/
	/*Inicio de las preguntas y del juego*/
	/*************************************/

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

	b impTablero
opcion2: 
	ldr r0,=pregunta2		@Preguntas
	bl puts

	ldr r0,=num
	ldr r1,=opcion
	bl scanf
	b impTablero
	

													 

	
.unreq	cont
	mov r7,#1
	swi 0
	
.data
.align 2
formato: .asciz "  %d"
formato2: .asciz "\n"
mascara: .word 0xF
inicio:  .asciz "\nBienvenido al juego PiDots!"
inicio2: .asciz "¿Los caracteres a unir se encuentran en una fila o en una columna? \n 1. Fila \n 2. Columna"
pregunta1: .asciz "De que fila a  que fila se encuentra la cadena"
pregunta2: .asciz "De que columna a que columna se encuentra la cadena"
num:   .asciz "%d"
opcion: 	.word 0
temp:		.word 0
arreglo1: .word 1, 2, 3, 4, 5
arreglo2: .word 0, 0, 0, 0, 0
arreglo3: .word 0, 0, 0, 0, 0
arreglo4: .word 0, 0, 0, 0, 0
arreglo5: .word 0, 0, 0, 0, 0
titulo:
	.asciz " /$$$$$$$  /$$       /$$$$$$$              /$$             
| $$__  $$|__/      | $$__  $$            | $$             
| $$  \ $$ /$$      | $$  \ $$  /$$$$$$  /$$$$$$   /$$$$$$$
| $$$$$$$/| $$      | $$  | $$ /$$__  $$|_  $$_/  /$$_____/
| $$____/ | $$      | $$  | $$| $$  \ $$  | $$   |  $$$$$$ 
| $$      | $$      | $$  | $$| $$  | $$  | $$ /$$\____  $$
| $$      | $$      | $$$$$$$/|  $$$$$$/  |  $$$$//$$$$$$$/
|__/      |__/      |_______/  \______/    \___/ |_______/"


