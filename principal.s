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
	mov r11, #0	@Puntuación -> NO tocar, a mi no me hables asi mano
	ldr r0,=titulo	@Print de titulo en asciiart
	bl puts
	mov r6, #0
	ldr r0,=inicio		@Mensaje de Bienvenida
	bl puts
	/*************************************/
	/*        Inicio del tablero         */
	/*************************************/
	
tablero: 
	/*********************/
	/*		 Fila 1	   	 */
	/*********************/
	ldr r0,=nueva		@Preguntas
	bl puts
	
	
	mov r11, #0

	ldr r10,=arreglo1
	add r10, r10, #12
	mov r5, #5
	arregloA:
		bl aleatorios
		cmp r0, #100
		movge r0, #1
		movlt r0, #2
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
		movge r0, #1
		movlt r0, #2
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
		movge r0, #1
		movlt r0, #2
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
		movge r0, #1
		movlt r0, #2
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
		movge r0, #1
		movlt r0, #2
		str r0, [r10]
		sub r10, r10,#4 			@ Regresar 4 bytes
		subs r5,r5,#1
		bne arregloE

	/*************************************/
	/*		 Para imprimir tablero	   	 */
	/*************************************/

impTablero: 
	/* R12 seria el valor de la puntuacion general, r11 de los puntos actuales de los niveles, y r6 donde se almacena la suma */
	@ldr r12, =variable	
	@ldr r12,[r12]
	@add r6, r12, r11
	@ldr r12, =variable
	@str r6,[r12]

	@ldr r0,=puntuacionG
	@mov r1, r6
	@bl printf
	
	cmp r11, #15
	bge tablero
	
	ldr r0,=puntuacion
	mov r1, r11
	bl printf
	


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
	cmp r1, #3
	bge rangof
	bne errorIng

opcion1: 

	ldr r0,=numerofila
	bl puts

	ldr r0,=num
	ldr r1,=ubicacion
	bl scanf
	ldr r0,=pregunta2a		@Preguntas
	bl puts
	ldr r0,=num
	ldr r1,=iniciocadena
	bl scanf

	ldr r0,= pregunta2b
	bl puts
	ldr r0,=num
	ldr r1,=finalcadena
	bl scanf

	b cadenaenfila


opcion2: 

	ldr r0,=numerocolumna
	bl puts
	ldr r0,=num
	ldr r1,=ubicacion
	bl scanf

	ldr r0,=pregunta1a		@Preguntas
	bl puts
	ldr r0,=num
	ldr r1,=iniciocadena
	bl scanf

	ldr r0,= pregunta1b
	bl puts
	ldr r0,=num
	ldr r1,=finalcadena
	bl scanf

	b cadenaencolumna


cadenaenfila:

	ldr r1,=ubicacion
	ldr r1,[r1]

	cmp r1, #1
	beq fila1
	cmp r1, #2
	beq fila2
	cmp r1, #3
	beq fila3
	cmp r1, #4
	beq fila4
	cmp r1, #5
	beq fila5
	bge rangof
	bne errorIng

	fila1:

		ldr r4,=arreglo1
		add r4, r4, #12
		ldr r1,=iniciocadena
		ldr r1,[r1]
		sub r1, r1, #1
		ldr r0,=finalcadena
		ldr r0,[r0]
		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9

		revisar:
			ldr r7, [r4]
			add r1, r1, #1
			cmp r7, #0
			beq error
			rep1:
				sub r4, r4, #4
				ldr r8,[r4]
				cmp r8, #0
				beq error
				cmp r7, r8
				bne error
				add r1, r1, #1
				cmp r1, r0
				bne rep1

		ldr r4,=arreglo1
		add r4, r4, #12
		ldr r1,=iniciocadena
		ldr r1,[r1]

		@Sumar a contador
		mov r6, #0
		sub r6, r0, r1
		add r6, #1
		add r11, r11, r6
		sub r1, r1, #1
		ldr r0,=finalcadena
		ldr r0, [r0]

		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9
		mov r12, #0
		str r12, [r4]
		add r1, r1, #1
		mov r9, #4

		repetir1:
			sub r4, r4, r9
			str r12, [r4]
			add r1, r1, #1
			cmp r1, r0
			bne repetir1

		b impTablero




	fila2:
		ldr r4,=arreglo2
		add r4, r4, #12
		ldr r1,=iniciocadena
		ldr r1,[r1]
		sub r1, r1, #1
		ldr r0,=finalcadena
		ldr r0,[r0]
		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9

		revisar2:
			ldr r7, [r4]
			add r1, r1, #1
			cmp r7, #0
			beq error
			rep2:
				sub r4, r4, #4
				ldr r8,[r4]
				cmp r8, #0
				beq error
				cmp r7, r8
				bne error
				add r1, r1, #1
				cmp r1, r0
				bne rep2

		ldr r4,=arreglo2
		add r4, r4, #12
		ldr r1,=iniciocadena
		ldr r1,[r1]

		@Sumar a contador
		mov r6, #0
		sub r6, r0, r1
		add r6, #1
		add r11, r11, r6
		sub r1, r1, #1
		ldr r0,=finalcadena
		ldr r0, [r0]

		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9
		mov r12, #0
		str r12, [r4]
		add r1, r1, #1
		mov r9, #4

		repetir2:
			sub r4, r4, r9
			str r12, [r4]
			add r1, r1, #1
			cmp r1, r0
			bne repetir2

		b impTablero

	fila3:
		ldr r4,=arreglo3
		add r4, r4, #12
		ldr r1,=iniciocadena
		ldr r1,[r1]
		sub r1, r1, #1
		ldr r0,=finalcadena
		ldr r0,[r0]
		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9

		revisar3:
			ldr r7, [r4]
			add r1, r1, #1
			cmp r7, #0
			beq error
			rep3:
				sub r4, r4, #4
				ldr r8,[r4]
				cmp r8, #0
				beq error
				cmp r7, r8
				bne error
				add r1, r1, #1
				cmp r1, r0
				bne rep3

		ldr r4,=arreglo3
		add r4, r4, #12
		ldr r1,=iniciocadena
		ldr r1,[r1]
		@Sumar a contador
		mov r6, #0
		sub r6, r0, r1
		add r6, #1
		add r11, r11, r6
		sub r1, r1, #1
		ldr r0,=finalcadena
		ldr r0, [r0]

		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9
		mov r12, #0
		str r12, [r4]
		add r1, r1, #1
		mov r9, #4

		repetir3:
			sub r4, r4, r9
			str r12, [r4]
			add r1, r1, #1
			cmp r1, r0
			bne repetir3

		b impTablero

	fila4:
		ldr r4,=arreglo4
		add r4, r4, #12
		ldr r1,=iniciocadena
		ldr r1,[r1]
		sub r1, r1, #1
		ldr r0,=finalcadena
		ldr r0,[r0]
		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9

		revisar4:
			ldr r7, [r4]
			add r1, r1, #1
			cmp r7, #0
			beq error
			rep4:
				sub r4, r4, #4
				ldr r8,[r4]
				cmp r8, #0
				beq error
				cmp r7, r8
				bne error
				add r1, r1, #1
				cmp r1, r0
				bne rep4

		ldr r4,=arreglo4
		add r4, r4, #12
		ldr r1,=iniciocadena
		ldr r1,[r1]
		@Sumar a contador
		mov r6, #0
		sub r6, r0, r1
		add r6, #1
		add r11, r11, r6
		sub r1, r1, #1
		ldr r0,=finalcadena
		ldr r0, [r0]

		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9
		mov r12, #0
		str r12, [r4]
		add r1, r1, #1
		mov r9, #4

		repetir4:
			sub r4, r4, r9
			str r12, [r4]
			add r1, r1, #1
			cmp r1, r0
			bne repetir4

		b impTablero

	fila5:
		ldr r4,=arreglo5
		add r4, r4, #12
		ldr r1,=iniciocadena
		ldr r1,[r1]
		sub r1, r1, #1
		ldr r0,=finalcadena
		ldr r0,[r0]
		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9

		revisar5:
			ldr r7, [r4]
			add r1, r1, #1
			cmp r7, #0
			beq error
			rep5:
				sub r4, r4, #4
				ldr r8,[r4]
				cmp r8, #0
				beq error
				cmp r7, r8
				bne error
				add r1, r1, #1
				cmp r1, r0
				bne rep5

		ldr r4,=arreglo5
		add r4, r4, #12
		ldr r1,=iniciocadena
		ldr r1,[r1]
		@Sumar a contador
		mov r6, #0
		sub r6, r0, r1
		add r6, #1
		add r11, r11, r6
		sub r1, r1, #1
		ldr r0,=finalcadena
		ldr r0, [r0]

		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9
		mov r12, #0
		str r12, [r4]
		add r1, r1, #1
		mov r9, #4

		repetir5:
			sub r4, r4, r9
			str r12, [r4]
			add r1, r1, #1
			cmp r1, r0
			bne repetir5

		b impTablero

cadenaencolumna:
	revision:
		mov r9, #0
		ldr r0,=iniciocadena
		ldr r0, [r0]
		ldr r1,=finalcadena
		ldr r1, [r1]
		add r1, r1, #1
		ldr r8,=ubicacion
		ldr r8, [r8]
		sub r8, r8, #1
		cmp r0, #1
		beq arr1
		cmp r0, #2
		beq arr2
		cmp r0, #3
		beq arr3
		cmp r0, #4
		beq arr4
		cmp r0, #5
		beq arr5
		bge rangof
		bne errorIng
		arr1:
			ldr r4,=arreglo1
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r9, [r4]
			b verificacion
		arr2:
			ldr r4,=arreglo2
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r9, [r4]
			b verificacion
		arr3:
			ldr r4,=arreglo3
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r9, [r4]
			b verificacion
		arr4:
			ldr r4,=arreglo4
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r9, [r4]
			b verificacion
		arr5:
			ldr r4,=arreglo5
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r9, [r4]
			b verificacion
	verificacion:
		ldr r8,=ubicacion
		ldr r8, [r8]
		sub r8, r8, #1
		cmp r0, r1
		beq llenar
		cmp r0, #1
		beq v1
		cmp r0, #2
		beq v2
		cmp r0, #3
		beq v3
		cmp r0, #4
		beq v4
		cmp r0, #5
		beq v5

		v1:
			ldr r4,=arreglo1
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r10, [r4]
			add r0, r0, #1
			cmp r9, r10
			bne error
			cmp r9, r10
			beq verificacion
		v2:
			ldr r4,=arreglo2
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r10, [r4]
			add r0, r0, #1
			cmp r9, r10
			bne error
			cmp r9, r10
			beq verificacion
		v3:
			ldr r4,=arreglo3
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r10, [r4]
			add r0, r0, #1
			cmp r9, r10
			bne error
			cmp r9, r10
			beq verificacion
		v4:
			ldr r4,=arreglo4
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r10, [r4]
			add r0, r0, #1
			cmp r9, r10
			bne error
			cmp r9, r10
			beq verificacion
		v5:
			ldr r4,=arreglo5
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r10, [r4]
			add r0, r0, #1
			cmp r9, r10
			bne error
			cmp r9, r10
			beq verificacion

	llenar:
		ldr r0,=iniciocadena
		ldr r0, [r0]
		ldr r1,=finalcadena
		ldr r1, [r1]
		add r1, r1, #1
		@Sumar a contador
		mov r6, #0
		sub r6, r1, r0
		add r11, r11, r6
		ldr r8,=ubicacion
		ldr r8, [r8]
		sub r8, r8, #1

		bucle:
			cmp r0, r1
			beq impTablero
			cmp r0, #1
			beq col1
			cmp r0, #2
			beq col2
			cmp r0, #3
			beq col3
			cmp r0, #4
			beq col4
			cmp r0, #5
			beq col5

			col1:
				ldr r4,=arreglo1
				add r4, r4, #12
				mov r6, #4
				mul r6, r6, r8
				sub r4, r4, r6
				mov r12, #0
				str r12, [r4]
				add r0, r0, #1
				b bucle


			col2:
				ldr r4,=arreglo2
				add r4, r4, #12
				mov r6, #4
				mul r6, r6, r8
				sub r4, r4, r6
				mov r12, #0
				str r12, [r4]
				add r0, r0, #1
				b bucle

			col3:
				ldr r4,=arreglo3
				add r4, r4, #12
				mov r6, #4
				mul r6, r6, r8
				sub r4, r4, r6
				mov r12, #0
				str r12, [r4]
				add r0, r0, #1
				b bucle

			col4:
				ldr r4,=arreglo4
				add r4, r4, #12
				mov r6, #4
				mul r6, r6, r8
				sub r4, r4, r6
				mov r12, #0
				str r12, [r4]
				add r0, r0, #1
				b bucle

			col5:
				ldr r4,=arreglo5
				add r4, r4, #12
				mov r6, #4
				mul r6, r6, r8
				sub r4, r4, r6
				mov r12, #0
				str r12, [r4]
				add r0, r0, #1
				b bucle

ganador:
	ldr r0,=win
	bl puts

error:
	ldr r0,=merror
	bl puts
	sub r11, r11, #3
	b impTablero
rangof:
	ldr r0,=out
	bl puts
	b impTablero
errorIng: 
	ldr r0,=mal
	bl puts
	bl getchar
	b impTablero





													 

	
.unreq	cont
	mov r7,#1
	swi 0
	
.data
.align 2

@Mensajes y formatos
mal:   .asciz	"Error, el dato ingresado es incorrecto. Intente nuevamente.\n"
nueva: .asciz "$$$$ NUEVA RONDA $$$$"
out: .asciz "      CUIDADO: Opcion fuera de rango! "
formato: .asciz "  %d"
formato2: .asciz "\n"
inicio:  .asciz "\nBienvenido al juego PiDots!"
inicio2: .asciz "¿Los caracteres a unir se encuentran en una fila o en una columna? \n 1. Fila \n 2. Columna"
puntuacion: .asciz "Puntuacion: %d\n"
puntuacionG: .asciz "Puntuacion General: %d\n"
unidos:	.asciz "Caracteres unidos: %d\n"
merror:	.asciz "La cadena ingresada no es valida, se te restan 3 puntos"
win:	.asciz "FELICIDADES, has completado el juego"
num:   .asciz " %d"
menprueba:	.asciz "Prueba"


@Preguntas para modificar los vectores
numerocolumna: .asciz "En que columna se encuentra la cadena?"
numerofila: .asciz "En que fila se encuentra la cadena?"
pregunta1a: .asciz "En que fila inicia la cadena?"
pregunta1b: .asciz "En que fila termina la cadena?"
pregunta2a: .asciz "En que columna inicia la cadena?"
pregunta2b: .asciz "En que columna termina la cadena?"

@Variables
variable:    .word 0
iniciocadena: 	.word 0
finalcadena:	.word 0
opcion:	.word 0
ubicacion:	.word 0
temp:		.word 0
varpuntos:	.word 22
arreglo1: .word 0, 0, 0, 0, 0
arreglo2: .word 0, 0, 0, 0, 0
arreglo3: .word 0, 0, 0, 0, 0
arreglo4: .word 0, 0, 0, 0, 0
arreglo5: .word 0, 0, 0, 0, 0

@AsciiArt
titulo:
	.asciz " /$$$$$$$  /$$       /$$$$$$$              /$$             
| $$__  $$|__/      | $$__  $$            | $$             
| $$  \ $$ /$$      | $$  \ $$  /$$$$$$  /$$$$$$   /$$$$$$$
| $$$$$$$/| $$      | $$  | $$ /$$__  $$|_  $$_/  /$$_____/
| $$____/ | $$      | $$  | $$| $$  \ $$  | $$   |  $$$$$$ 
| $$      | $$      | $$  | $$| $$  | $$  | $$ /$$\____  $$
| $$      | $$      | $$$$$$$/|  $$$$$$/  |  $$$$//$$$$$$$/
|__/      |__/      |_______/  \______/    \___/ |_______/"


