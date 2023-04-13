
_start:
	LDR 	r2, str1		// carga r2 con la var str1
	MRC 	p15, 0, R1, c0, c0, 0	// move to reg from coprocessor:
					// lee registro de estado que indica 
					// modelo de arquitectura 
	b 	.
	
str1: 	.word 	0xAA55AA55

	
