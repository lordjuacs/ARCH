module adder_substractor(a, b, s, y);
	input [31:0] a, b;
	input s;
	wire [31:0] con;
	output [31:0] y;
	mux2x1 first_mux(b, ~b, s, con);
	adder  first_adder(a, con, s, y);
endmodule
