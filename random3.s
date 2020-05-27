/* Villena, A. & Asenjo, R. & Corbera, F.
Practicas basadas en Raspberry Pi */

.data
seed: 	.word 	1
const1:	.word	67890
const2:	.word	12345

.text
.global myrand, mysrand

myrand:
	ldr r1, =seed	@puntero a semilla
	ldr r0, [r1]	@leer valor
	ldr r2, [r1,#4]	@leer const1
	mul r3, r0, r2	@r3=seed*1103515245
	ldr r0, [r1,#8]	@leer const2
	add r0, r0, r3	@r0=r3+12345
	str r0, [r1]	@guardo en variable seed
	lsl r0, #1	@devuelve seed>>16&0x7FFF
	lsr r0, #17
	mov pc, lr

mysrand:
	ldr r1, =seed
	str r0, [r1]
	mov pc, lr

