.data
msg1: .asciiz "yes"
msg2: .asciiz "no"
.text
li $v0,5
syscall
move $t0,$v0 #t0 is our given number
add $t2,$t0,0 # t2 stores t0
li $t1,0 #t1 is i
li $t3,0 #t3 is the sum 
li $s0, 10
li $s1, 0 # number of digits
li $t6, 2 # t6 is the counter for number of digits
add $s3, $t0, $0

initial:
	beq $t0,$0, here
	addi $s1,$s1,1
	div $t0,$s0
	mfhi $s3
	mflo $t0 
	j initial
here:
	add $t0, $t2, $0
loop:
	beq $t0,$0,Check
	div $t0,$s0
	mflo $t0 #t0 is the quotient
	mfhi $t4
	addi $t5, $t4, 0
	
multiply:
	bgt $t6, $s1, do
	mul $t5, $t4, $t5
	addi $t6, $t6, 1
	j multiply
do:
	addi $t6, $0, 2
	add $t3, $t5, $t3
	j loop
	
Check:
	bne $t3, $t2, neq
	li $v0, 4
	la $a0, msg1
	syscall
	j Exit

neq:
	li $v0, 4
	la $a0, msg2
	syscall
	
Exit:
	li $v0, 10
	syscall
	
