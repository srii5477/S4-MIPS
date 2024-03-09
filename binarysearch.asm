# binary search (recursive)
.data
	arr: .space 100
	msg1: .asciiz "Found!"
	msg2: .asciiz "Not found!"
.text
main:
	li $v0, 5
	syscall
	move $s2, $v0
	li $t0, 0
Read:
	beq $t0, $s2, Next
	li $v0, 5
	syscall
	sll $s0, $t0, 2 # indexing
	sw $v0, arr($s0)
	addi $t0, $t0, 1
	j Read
Next:
	li $v0, 5
	syscall
	move $s5, $v0 # key
	li $s0, 0 # low
	addi $s1, $s2, -1 #high
	move $a0, $s0
	move $a1, $s1
	jal Search
Exit:
	li $v0, 10
	syscall

Search:
	addi $sp, $sp, -12
	sw $ra, 8($sp)
	sw $a0, 4($sp)
	sw $a1, 0($sp)
	add $s6, $a0, $a1
	srl $s6, $s6, 1
	sll $s7, $s6, 2
	bgt $a0, $a1, Neq
	lw $s3, arr($s7)
	bgt $s5, $s3, LowChange
	blt $s5, $s3, HighChange
	beq $s5, $s3, Eq
Eq:
	li $v0, 4
	move $t7, $a0
	la $a0, msg1
	syscall 
	move $a0, $t7
	addi $sp, $sp, 12
	jr $ra
Neq:
	li $v0, 4
	move $t7, $a0
	la $a0, msg2
	syscall 
	move $a0, $t7
	addi $sp, $sp, 12
	jr $ra
	

LowChange:
	addi $a0, $s6, 1
	jal Search
	lw $ra, 8($sp)
	lw $a0, 4($sp)
	lw $a1, 0($sp)
	addi $sp, $sp, 12
	jr $ra
	
HighChange:
	addi $a1, $s6, -1
	jal Search
	lw $ra, 8($sp)
	lw $a0, 4($sp)
	lw $a1, 0($sp)
	addi $sp, $sp, 12
	jr $ra


	
