all: ej11a ej11b ej12a ej12b ej2 ej3
ej11a:
	iverilog -o ej11a btff_tb.v btff.v
ej11b:
	iverilog -o ej11b stff_tb.v stff.v three_nand.v four_nand.v tlatch.v dlatch.v
ej12a: 
	iverilog -o ej12a bjkff_tb.v bjkff.v
ej12b: 
	iverilog -o ej12b sjkff_tb.v sjkff.v three_nand.v four_nand.v jklatch.v dlatch.v
ej2: 
	iverilog -o ej2 mystery_tb.v mystery.v dff.v buffer.v mux2x1.v
ej3:
	iverilog -o ej3 fifo_tb.v fifo.v dfffifo.v sr.v
clean:
	rm ej11a ej11b ej12a ej12b ej2 ej3
