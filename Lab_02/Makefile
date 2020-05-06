all: ej2a ej2b ej2c ej3a ej3b ej3c ej4 ej5 ej6
ej2a:
	iverilog -o ej2a mux16_2x1_tb.v mux16_2x1.v
ej2b:
	iverilog -o ej2b mux16_8x1_tb.v mux16_8x1.v mux16_8x1_and.v mux16_8x1_not.v mux16_8x1_or.v
ej2c:
	iverilog -o ej2c mux16_16x1_tb.v mux16_16x1.v mux16_16x1_and.v mux16_16x1_not.v mux16_16x1_or.v
ej3a: 
	iverilog -o ej3a demux16_1x2_tb.v demux16_1x2.v
ej3b: 
	iverilog -o ej3b demux16_1x8_tb.v demux16_1x8.v
ej3c: 
	iverilog -o ej3c demux16_1x16_tb.v demux16_1x16.v
ej4:
	iverilog -o ej4 decoder3x8_tb.v decoder3x8.v 
ej5:
	iverilog -o ej5 encoder8x3_tb.v encoder8x3.v
ej6:
	iverilog -o ej6 barrel_shifter_tb.v barrel_shifter.v mux32_2x1.v ANDE.v
clean:
	rm ej2a ej2b ej2c ej3a ej3b ej3c ej4 ej5 ej6
