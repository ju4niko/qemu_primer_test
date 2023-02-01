LDR R2, str1
MRC p15, 0, R1, c0, c0, 0
b .
str1: .word 0xAA55AA55
