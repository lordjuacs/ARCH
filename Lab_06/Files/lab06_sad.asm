#
# Sum of Absolute Differences Algorithm
#
# Authors: 
#	X Y, Z Q 
#
#

.text


main:


# Initializing data in memory... 
# Store in $s0 the address of the first element in memory
	# lui sets the upper 16 bits of thte specified register
	# ori the lower ones
	# (to be precise, lui also sets the lower 16 bits to 0, ori ORs it with the given immediate)
	     lui     $s0, 0x0000 # Address of first element in the vector
	     ori     $s0,0x0000
	     addi   $t0, $0, 5	# left_image[0]	
	     sw		$t0, 0($s0)
	     addi   $t0, $0, 16	# left_image[1]		
	     sw      $t0, 4($s0)
	     addi   $t0, $0, 7	# left_image[2]		
	     sw      $t0, 8($s0)
	     addi   $t0, $0, 1	# left_image[3]		
	     sw      $t0, 12($s0)
	     addi   $t0, $0, 1	# left_image[4]		
	     sw      $t0, 16($s0)
	     addi   $t0, $0, 13	# left_image[5]		
	     sw      $t0, 20($s0)
	     addi   $t0, $0, 2	# left_image[6]	
	     sw      $t0, 24($s0)
	     addi   $t0, $0, 8	# left_image[7]		
	     sw      $t0, 28($s0)
	     addi   $t0, $0, 10	# left_image[8]		
	     sw      $t0, 32($s0)
	     #
	     addi   $t0, $0, 4	# right_image[0]	
	     sw      $t0,36($s0)
	     addi   $t0, $0, 15	# right_image[1]		
	     sw      $t0, 40($s0)
	     addi   $t0, $0, 8	# right_image[2]		
	     sw      $t0, 44($s0)
	     addi   $t0, $0, 0	# right_image[3]		
	     sw      $t0, 48($s0)
	     addi   $t0, $0, 2	# right_image[4]		
	     sw      $t0, 52($s0)
	     addi   $t0, $0, 12	# right_image[5]		
	     sw      $t0, 56($s0)
	     addi   $t0, $0, 3	# right_image[6]	
	     sw      $t0, 60($s0)
	     addi   $t0, $0, 7	# right_image[7]		
	     sw      $t0, 64($s0)
	     addi   $t0, $0, 11	# right_image[8]		
	     sw      $t0, 68($s0)
	   
	     
	     
	# TODO4: Loop over the elements of left_image and right_image
	
	addi $s1, $0, 0 # $s1 = i = 0
	addi $s2, $0, 9	# $s2 = image_size = 9
	
	la $t3, 0($s0), # $t3 = &A[0]
	la $t4, 36($s0) # $t4 = &A[9]
	la $t5, 72($s0) # $t5 = &A[18]
# Check if we have traverse all the elements 
	# of the loop. If so, jump to end_loop:
	
loop: beq $s1, $s2, end_loop
	lw $a0, 0($t3)
	lw $a1, 0($t4)
	addi $t3, $t3, 4 
	addi $t4, $t4, 4 
	jal abs_diff
	sw $v0, 0($t5)
	addi $t5, $t5, 4
	addi $s1, $s1, 1
	j loop

end_loop:

	#TODO5: Call recursive_sum and store the result in $t2
	
	#Calculate the base address of sad_array (first argument
	#of the function call)and store in the corresponding register   
	la $t1, 68($s0) # $t1 = &A[17]

	
	# Prepare the second argument of the function call: the size of the array
	add $a1, $0, $s2

	
	# Call to funtion
	jal recursive_sum
	  
	
	#Store the returned value in $t2
	add $t2, $0, $v0

	

end:	
	j	end	# Infinite loop at the end of the program. 




# TODO2: Implement the abs_diff routine here, or use the one provided

abs_diff:
	sub $t1, $a0, $a1
	abs $v0, $t1
	jr $ra

# TODO3: Implement the recursive_sum routine here, or use the one provided


recursive_sum:    
	addi $sp, $sp, -8       	# Adjust sp
        addi $t0, $a1, -1       # Compute size - 1
        sw   $t0, 0($sp)        # Save size - 1 to stack
        sw   $ra, 4($sp)        # Save return address
        bne  $a1, $zero, else   # size == 0 ?
        addi  $v0, $0, 0        # If size == 0, set return value to 0
        addi $sp, $sp, 8        # Adjust sp
        jr $ra                  # Return

else:     
		addi  $a1, $t0, 0		#update the second argument
        jal   recursive_sum 
        lw    $t0, 0($sp)       # Restore size - 1 from stack
        addi  $t1, $t1, 4     	# Compute & arr[ size + 1 ]
        lw    $t2, 0($t1)       # t2 = arr[ size + 1 ]
        add   $v0, $v0, $t2     # retval = $v0 + arr[size + 1]
        lw    $ra, 4($sp)       # restore return address from stack         
        addi $sp, $sp, 8        # Adjust sp
        jr $ra                  # Return
