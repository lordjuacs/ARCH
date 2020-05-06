module mux16_2x1(a, b, s, y);
	input 	[15:0] a;
	input 	[15:0] b;
	input 	s;

	output [15:0]y;

	assign y = s? b : a;
endmodule
