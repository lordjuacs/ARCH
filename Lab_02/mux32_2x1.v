module mux32_2x1(a, b, s, y);
	input 	[31:0] a;
	input 	[31:0] b;
	input 	s;
	output [31:0]y;

	assign y = s? b : a;
endmodule
