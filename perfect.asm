.data
message1: .asciiz "not a perfect number"
message2: .asciiz "is a perfect number"

.text
li $v0, 5
syscall
move $t0, $v0  # t0 means number
li $t1, 1  # t1 means i
li $t2, 0 # t2 is sum
loop:
bge $t1, $t0, exit
# number % i == 0
div $t3, $t0, $t1
mfhi $t3
move $t4, $t1
addi $t1, $t1, 1
bne $t3, $0, loop
add $t2, $t2, $t4
j loop

exit:
beq $t0, $t2, equal
li $v0, 4
la $a0, message1
syscall
j end

equal:
li $v0, 4
la $a0, message2
syscall


end:
li $v0, 10
syscall