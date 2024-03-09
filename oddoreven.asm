.data
message1: .asciiz "even"
message2: .asciiz "odd"


.text
li $v0, 5 # reading a number
syscall
move $t1, $v0 # storing the number
li $t2, 2 
div $t1, $t2 # dividing number by 2, $hi represents the remainder
mfhi $t3 # move from hi to t3
beq $t3, $0, even
li $v0, 4
la $a0, message2 # printing odd
syscall
j exit
even:
li $v0, 4
la $a0, message1 # printing even
syscall
exit:
li $v0, 10
syscall



