module alu(a, b, op, result, cero);
	input [31:0] a, b;
	input [3:0] op;
	output [31:0] result;
	output cero;
	wire [31:0]arithout, logicout;

		a_part a_block(a, b, op[1], op[3], arithout);
		l_part l_block(a, b, op[1:0], logicout);
		mux2x1 answer(arithout, logicout, op[2], result);
		cero z_block(result, cero);
endmodule
	
