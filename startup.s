.global _start
.text

_start:
	LDR 	r2, str1
	MRC 	p15, 0, r1, c0, c0, 0	//leo el SCTLR (System Control Register).
	MRC 	p15, 0, r4, c12, c0, 0 	//leo valor del VTOR
	b 	reset

str1: 	.word 0xAA55AA55
reset:
	MOV	r1, #0			//codigo para indicar reset normal
	MCR 	p15, 0, r1, c7, c0, 4	//produce un warm reset
