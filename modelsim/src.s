	.data
octet:
	.byte 0x55
demi:
	.half 0xFFFF
mot:
	.word 0xAAAAAAAA
	
	.text
lb  s0,octet
lh  s1,demi
lw  s2,mot

	ecall