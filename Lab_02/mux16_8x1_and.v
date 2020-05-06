module mux16_8x1_and(a, b, c, d, e);
	output [15:0]a;
	input [15:0]b;
	input c,d,e;
	wire validacion;
	assign validacion = (c & d & e);
assign a = validacion? b: 16'b00;
endmodule
