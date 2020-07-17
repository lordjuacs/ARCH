module Adder (a, b, s, y);
	    //2 1 0		
	//ADD 0 1 0
	//SUB 1 1 0
	input [31:0] a, b;
	input s;
	output reg[31:0] y;
	always @(*)begin
	case(s)
	1'b0:	y <= a + b;
	1'b1:	y <= a + b + 1;
	default: y <= a + b;
	endcase
end	
endmodule

module mux2x1  (a, b, s, y);
	input [31:0] a, b;
	input s;
	output [31:0]y;
	assign y = s? b : a;
endmodule


module adder_substractor (a, b, s, y);
	    //2 1 0		
	//ADD 0 1 0
	//SUB 1 1 0
	
	//STL 1 1 1
	input [31:0] a, b;
	input s;
	wire [31:0] con;
	output [31:0] y;
	mux2x1  first_mux(b, ~b, s, con);
	Adder   first_adder(a, con, s, y);
	
endmodule

module stl  (a, s, y);
	    //2 1 0		
	//ADD 0 1 0
	//SUB 1 1 0
	
	//STL 1 1 1
	input [31:0] a;
	input s;
	reg [31:0] extend;
	output [31:0] y;
	always @(*)begin
		extend = {31'b0,a[31]};	
	end

	mux2x1  first_mux(a, extend, s, y);
	
endmodule

module a_part  (a, b, op, arithout);
	    //2 1 0		
	//ADD 0 1 0
	//SUB 1 1 0
	
	//STL 1 1 1
	input [31:0] a, b;
	input [2:0] op;
	wire [31:0] addout;
	output  [31:0] arithout;
	
	adder_substractor  first_adder_substractor(a, b, op[2], addout);
	stl  first_stl(addout, op[0], arithout);
endmodule

module l_part (a, b, op, logicout);
	    //210		
	//ADD 010
	//SUB 110
	//STL 111
	input [31:0] a, b;
	input [2:0] op;
	output reg[31:0] logicout;

	always @ (*) begin
		case(op)
		3'b000	:	logicout = a & b;	//AND	
		3'b001	:	logicout = a | b; 	//OR
		//3'b110	:	logicout = a ^ b;
		//3'b111	:	logicout = a ~| b;
		default :	logicout = 32'bx;
		endcase
	end
endmodule	

module cero (a, y);
	input [31:0] a;
	output reg y;
	always @(*)begin
	if(a==32'b0)
	begin
		y = 1;
	end	
	else
	begin
		y = 0;
	end
	end
endmodule


module alu (a, b, op, result, cero);
	input [31:0] a, b;
	input [2:0] op;
	output [31:0] result;
	output cero;
	wire [31:0]arithout, logicout;
	//arith
	//ADD 0 1 0
	//SUB 1 1 0
	//STL 1 1 1
	
	//logic
	//AND 0 0 0
	//OR  0 0 1  
		a_part  a_block(a, b, op, arithout);
		
		l_part  l_block(a, b, op, logicout);
		
		mux2x1  answer(logicout, arithout, op[1], result);
		cero  z_block(result, cero);
endmodule
	
