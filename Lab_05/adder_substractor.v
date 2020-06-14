module adder_substractor #(parameter n = 32)(a, b, s, y);
	input [n-1:0] a, b;
	input s;
	wire [n-1:0] con;
	output [n-1:0] y;
	mux2x1 #(.n(n)) first_mux(b, ~b, s, con);
	adder  #(.n(n)) first_adder(a, con, s, y);
endmodule
