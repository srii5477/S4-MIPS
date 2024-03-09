
.text
    main:
        li $v0, 5
        syscall
        move $t0, $v0
        li $t1, 0
        sub $t2, $t1, $t0
        addu $t2, $t2, $t0
        move $a0, $t2
        li $v0, 1
        syscall
        
        li $v0, 10         
        syscall