module l_part(a, b, op, logicout);
	input [31:0] a, b;
	input [1:0] op;
	output reg[31:0] logicout;

	always @ (op) begin
		case(op)
		2'b00	:	logicout = a & b;	
		2'b01	:	logicout = a | b;
		2'b10	:	logicout = a ^ b;
		2'b11	:	logicout = a ~| b;
		default :	logicout = 32'b0;
		endcase
	end
endmodule	
