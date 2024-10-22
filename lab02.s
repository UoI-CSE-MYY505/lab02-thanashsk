
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
#-----------------------------
    add t0,zero,zero    #index i
    add t2,a0,zero      #t2 keeps the address of array    

searchArray:
    
    beq t0,a1,endOfSearch    #if t0 equals num of elems in array stop searching
    lw t1,0(t2)
    beq t1,a2,findAddress
    addi t2,t2,4
    addi t0,t0,1
    j searchArray

findAddress:
    
    add s0,zero,t2
    addi t2,t2,4
    addi t0,t0,1
    j searchArray
endOfSearch:
    
# Do not remove the prog label or write code above it!
#-----------------------------
done:
    addi a7, zero, 10 
    ecall
