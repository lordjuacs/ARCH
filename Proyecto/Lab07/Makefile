all: lab07.exe lab07other.exe
lab07.exe:
	iverilog -o lab07.exe mips.v mipsparts.v mipsmem.v mipstop.v mipstest.v ALU.v
lab07other.exe:
	iverilog -o lab07other.exe mips.v mipsparts.v mipsmem2.v mipstop.v mipstest2.v ALU.v
clean:
	rm lab07.exe lab07other.exe
	

