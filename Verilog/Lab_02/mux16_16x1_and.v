module mux16_16x1_and(a, b, c, d, e, w);
	output [15:0]a;
	input [15:0]b;
	input c,d,e,w;
	wire validacion;
	assign validacion = (c&d&e&w);
assign a = validacion? b : 16'b00;
endmodule
