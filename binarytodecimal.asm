.data
arr: .space 100

.text
# take a 32 bit binary string n convert it into its decimal eq
# input LSB to MSB
li $v0, 5
syscall
move $t0, $v0 #t0=length of binary string


li $t1, 0
Read:
	beq $t1, $t0, Init
	sll $t2, $t1, 2
	li $v0, 5
	syscall
	sw $v0, arr($t2)
	addi $t1, $t1, 1
	j Read

Init:
	# addi $t0, $t0, -1
	li $t4, 0
	li $s3, 0 #sum
	li $t7, 2 # constant 2
	li $t6, -1 # power
Reinit:
	li $t8, 0

Convert:
	add $s3, $s3, $t8
	addi $t6, $t6, 1
	beq $t6, $t0, Exit
	li $s6, 2 # loop counter
	sll $s7, $t6, 2
	lw $s4, arr($s7)
	li $t8, 2	
	beqz $s4, Reinit
	beqz $t6, Zero
	beq $t6, 1, One
	Loop:
		bgt $s6, $t6, Convert
		addi $s6, $s6, 1
		mul $t8, $t8, $t7
		j Loop
	Zero:
		addi $s3, $s3, 1
		j Reinit
	One:
		addi $s3, $s3, 2
		j Reinit
Exit:
	li $v0, 1
	add $a0, $s3, $0
	syscall
	li $v0, 10
	syscall 
	
		
		
		
	
	
