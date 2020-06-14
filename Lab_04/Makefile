all: ej1a ej1b ej1c ej2
ej1a:
	iverilog -o ej1a h1_tb.v h1.v 
ej1b:
	iverilog -o ej1b seven_tb.v seven.v
ej1c: 
	iverilog -o ej1c snail_tb.v snail.v
ej2: 
	iverilog -o ej2 thunder_tb.v thunder.v
clean:
	rm ej1a ej1b ej1c ej2
