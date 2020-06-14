module l_part #(parameter n = 32)(a, b, op, logicout);
	input [n-1:0] a, b;
	input [3:0] op;
	output reg[n-1:0] logicout;

	always @ (op) begin
		case(op)
		4'b0100	:	logicout = a & b;	
		4'b0101	:	logicout = a | b;
		4'b0110	:	logicout = a ^ b;
		4'b0111	:	logicout = a ~| b;
		default :	logicout = 'bX;
		endcase
	end
endmodule	
