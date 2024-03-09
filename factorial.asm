.text
li $v0, 5
syscall
move $t0, $v0 # t0 is user input
li $t1, 1 # t1 is i
li $t2, 1 # t2 is product

loop:
bge $t1, $t0, exit
addi $t1, $t1, 1
mul $t2, $t2, $t1
j loop 

exit:
add $a0, $0, $t2
li $v0, 1
syscall 
li $v0, 10
syscall



