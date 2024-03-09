# Program to perform bubble sort on an array
.data
	arr: .space 100
	comma: .asciiz " "
.text
	li $t0, 0
	li $s0, 0
	li $t1, 0 # i
	li $t2, 1 # j
	li $v0, 5
	syscall
	move $s1, $v0 # n
	addi $t3, $s1, -1  # n-1
Read:
	beq $t0, $s1, Reset
	li $v0, 5
	syscall
	sll $s0, $t0, 2 # indexing
	sw $v0, arr($s0)
	addi $t0, $t0, 1
	j Read
Reset:
	li $s0, 0
Sort:
	bge $t1, $t3, Break
	sll $s0, $t1, 2
	Inner:
		lw $t5, arr($s0)
		bge $t2, $s1, Rest
		sll $s5, $t2, 2
		lw $t6, arr($s5)
		bgt $t5, $t6, Call
		addi $t2, $t2, 1
		j Inner
	Rest:
		addi $t1, $t1, 1
		addi $t2, $t1, 1
		j Sort
	
Call:
	lw $a0, arr($s0)
	lw $a1, arr($s5)
	jal Swap
	sw $a0, arr($s0)
	sw $a1, arr($s5)
	addi $t2, $t2, 1
	j Inner
	
Swap:
	addi $sp, $sp, -4
	sw $s6, 0($sp)
	addi $s6, $a0, 0
	addi $a0, $a1, 0
	addi $a1, $s6, 0
	lw $s6, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
Break:
	li $t0, 0
Last:
	beq $t0, $s1, Exit
	sll $s0, $t0, 2
	lw $s2, arr($s0)
	move $a0, $s2
	li $v0, 1
	syscall
	la $a0, comma
	li $v0, 4
	syscall
	addi $t0, $t0, 1 
	j Last
Exit:
	li $v0, 10
	syscall
	
	