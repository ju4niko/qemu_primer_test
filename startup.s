.global _start
.text

_start:
	LDR 	r2, str1
	MRC 	p15, 0, r1, c0, c0, 0	//leo el SCTLR (System Control Register).
	MRC 	p15, 0, r4, c12, c0, 0 	//leo valor del VTOR (tabla de vectores int)
	b 	reset

str1: 	.word 0xAA55AA55
reset:
	// algunas acciones que seran utiles mas adelante por ahora las comentamos solamente
	// Acceder al registro SCR
	//mrc p15, 0, r0, c1, c0, 0
	// Limpiar el bit de habilitación de interrupciones
	//bic r0, r0, #0x80
	// Limpiar el bit de habilitación de caché
	//bic r0, r0, #0x4
	// Limpiar el bit de habilitación de predicción de salto
	//bic r0, r0, #0x800

	// Escribir el valor de reinicio en el registro RCR
	mov r1, #0 		// <---- este valor es para uso del programador, 
				// suele usarse para indicar el motivo del reset
				// #0 suele ser OK
	mcr p15, 0, r1, c0, c0, 0
	
