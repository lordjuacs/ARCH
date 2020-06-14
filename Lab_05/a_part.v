module a_part  #(parameter n = 32)(a, b, op1, op3, arithout);
	input [n-1:0] a, b;
	input op1, op3;
	wire [n-1:0] addout;
	output [n-1:0] arithout;
	adder_substractor #(.n(n)) first_adder_substractor(a, b, op1, addout);
	stl #(.n(n)) first_stl(addout, op3, arithout);
endmodule

