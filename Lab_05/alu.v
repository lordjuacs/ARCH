module alu #(parameter n = 32)(a, b, op, result, cero);
	input [n-1:0] a, b;
	input [3:0] op;
	output [n-1:0] result;
	output cero;
	wire [n-1:0]arithout, logicout;

		a_part #(.n(n)) a_block(a, b, op[1], op[3], arithout);
		l_part #(.n(n)) l_block(a, b, op, logicout);
		mux2x1 #(.n(n)) answer(arithout, logicout, op[2], result);
		cero #(.n(n)) z_block(result, cero);
endmodule
	
