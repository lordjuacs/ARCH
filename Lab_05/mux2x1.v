module mux2x1  #(parameter n = 32)(a, b, s, y);
	input [n-1:0] a, b;
	input s;
	output [n-1:0]y;
	assign y = s? b : a;
endmodule

