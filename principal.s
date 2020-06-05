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
	ldr r10,=arreglo1
	mov r7, #5
	mov r9, #4
	ldr r0,=titulo	@Print de titulo en asciiart
	bl puts
	
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


	bl aleatorios
	str r0,[r10] @r10 apunta al vector "a"

opcion2: 
	ldr r0,=pregunta2		@Preguntas
	bl puts

	ldr r0,=num
	ldr r1,=opcion
	bl scanf

	bl aleatorios
	str r0,[r10] @r10 apunta al vector "a"
	

													 
ciclo1:
    ldr r1,[r10]    @valor de datos para imprimir
    ldr r0,=formato
    bl printf
    add r10,#4    @ste
    subs r7,#1    @contador
    bne ciclo1    @si no es 0 regresa   @Impresion datos

	
.unreq	cont
	mov r7,#1
	swi 0
	
.data
.align 2
formato: .asciz "%d\n"
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


