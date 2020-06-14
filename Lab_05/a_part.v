module a_part(a, b, op1, op3, arithout);
	input [31:0] a, b;
	input op1, op3;
	wire [31:0] addout;
	output [31:0] arithout;
	adder_substractor first_adder_substractor(a, b, op1, addout);
	stl first_stl(addout, op3, arithout);
endmodule

