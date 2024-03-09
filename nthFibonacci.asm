.text
main:
	li $v0, 5
	syscall
	move $a0, $v0 
	li $s1, 0
	jal Fibonacci
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
Fibonacci:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	move $s0, $a0
	slti $t1, $a0, 3
	beq $t1, 1, BaseCase
	addi $a0, $s0, -1
	jal Fibonacci
	move $s1, $v0 # save result1 in s1
	addi $a0, $s0, -2
	jal Fibonacci
	add $v0, $v0, $s1 # save result1+result2 in v0
Back:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12
	jr $ra
	
BaseCase:
	li $v0, 1
	j Back
	
