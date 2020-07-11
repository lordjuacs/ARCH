all: single.exe
single.exe:
	iverilog -o single.exe mips.v mipsparts.v mipsmem.v mipstop.v mipstest.v ALU.v
clean:
	rm single.exe
