.data
message1: .asciiz "not a palindrome"
message2: .asciiz "is a palindrome"

.text
li $v0, 5
syscall
move $t0, $v0  # t0 means n
move $t4, $t0
li $t1, 0  # t1 means num
li $t2, 0 # t2 is temp
li $t3, 10
loop:
ble $t0, $0, exit
div $t2, $t0, $t3
mfhi $t2
mul $t1, $t1, $t3
add $t1, $t1, $t2
div $t0, $t0, $t3
mflo $t0
j loop

exit:
beq $t1, $t4, equal
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

