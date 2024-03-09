.data
arr:	.space 100
.text
li $v0, 5
syscall
move $t0, $v0  
li $v0, 5
syscall
move $t1, $v0  
# [a,b]=[$t0, $t1]
# $t2 is our counter from lower end to upper end
addi $t2, $t0, -1
li $s0, 0
li $s6, 0
j Other
Flag:
	li $s6, 1

Loop:
	beqz $s6, Not
	beq $s6, 1, Yes
Other:
	li $s6, 0
	li $s1, 2
	addi $t2, $t2, 1
	beq $t2, $t1, Exit
	div $t2, $s1
	mfhi $s3
	beqz $s3, Loop
	Check:
		beq $s1, $t2, Flag
		div $t2, $s1
		mfhi $s3
		beqz $s3, Loop
		addi $s1, $s1, 1
		j Check
	
Not:
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 4
	la $a0, msg1
	syscall
	j Other
Yes:
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 4
	la $a0, msg2
	syscall
	j Other
Exit:
	li $v0, 10
	syscall
.data
	msg1:	.asciiz " is not a prime."
	msg2:	.asciiz " is a prime."
	