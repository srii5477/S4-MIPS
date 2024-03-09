# Change the case (upper to lower and vice versa) of all the alphabets in a given string. 
.data
	str: .space 100
	size: .word 100
.text
li $v0, 8
la $a0, str
lw $a1, size
syscall

li $t1, -1
li $s0, 65
li $s1, 90

Loop:
	addi $t1, $t1, 1
	lb $t0, str($t1)
	beq $t0, 10, Exit
	beqz $t0, Exit
	beq $t0, 32, Loop
	sle $t5, $t0, $s1
	sge $t7, $t0, $s0
	and $t5, $t5, $t7
	beqz $t5, toUpper
	beq $t5, 1, toLower
	
toLower:
	addi $t0, $t0, 32
	sb $t0, str($t1)
	j Loop
toUpper:
	addi $t0, $t0, -32
	sb $t0, str($t1)
	j Loop

Exit:
	li $v0, 4
	la $a0, str
	syscall
	li $v0, 10
	syscall
