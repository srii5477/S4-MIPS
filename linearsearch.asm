
.text
li $v0, 5
syscall

move $s0, $v0
li $t0, 1

Read:
	bgt $t0, $s0, Init
	sll $t3, $t0, 2
	li $v0, 5
	syscall
	sw $v0, arr($t3)
	addi $t0, $t0, 1
	j Read
Init:
	li $t0, 1
	# key input
	li $v0, 5
	syscall
	move $s4, $v0 
Search:
	bgt $t0, $s0, Not
	sll $t1, $t0, 2
	lw $t2, arr($t1)
	beq $t2, $s4, Yes
	addi $t0, $t0, 1
	j Search
	
Not:
	li $v0, 4
	la $a0, msg1
	syscall 
	j Exit
Yes:
	li $v0, 4
	la $a0, msg2
	syscall
	
Exit:
	li $v0, 10
	syscall 
	
.data
arr: .space 100
msg1: .asciiz "Not present"
msg2: .asciiz "Is present"




	