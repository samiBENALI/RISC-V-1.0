	.data


	.text


lui s2,0x10000

addi s3,s0,0xC 



xori s3,s0,0xC 

ori  s3,s0,0xC 

andi  s3,s0,0xC  

slli s3,s0,0xC  

srli s3,s0,0xC  

srai s3,s0,0xC  

slti s3,s0,0xC
  
beq  t0,t1,label1
label1: addi s3,s0,0xC 

bne t0,t1,label2
label2: addi s3,s0,0xC 

bge t0,t1,label3
label3:  addi s3,s0,0xC 

jal label4 

label4: addi s3,s0,0xC  


jalr  s5

lui s0,0xC





ecall