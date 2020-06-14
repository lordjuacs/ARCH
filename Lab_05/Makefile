all: alu.exe
alu.exe:
	iverilog -o alu.exe alu_tb.v alu.v mux2x1.v adder_substractor.v adder.v a_part.v l_part.v cero.v stl.v  
clean:
	rm alu.exe
