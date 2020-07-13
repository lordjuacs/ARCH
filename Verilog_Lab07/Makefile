all: single.exe
single.exe:
	iverilog -o single.exe mips2.v mipsparts.v mipsmem.v mipstop.v mipstest.v ALUnew.v
clean:
	rm single.exe
