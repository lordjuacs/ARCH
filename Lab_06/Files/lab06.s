#
# Calculate sum from A to B.
#
# Authors: 
#	Paolo Morey
# 	Joaquin Ramirez
#
#

.text
main:
		# Put your sum S into register $t2
		addi  $t0, $0, 10 # A = 10
		addi $t1, $0, 20 # B = 20
		addi $t2, $0, 0 # Sum = 0
		addi $t3, $t1, 1 # Var para que loop vaya hasta	B + 1
loop: 	beq $t0, $t3, end # ¿t0 == t3? Si sí --> ir al final
		add $t2, $t2, $t0 # Sum = Sum + A
		addi $t0, $t0, 1 # A = A + 1
		j loop

end:	
	j	end	# Infinite loop at the end of the program. 
