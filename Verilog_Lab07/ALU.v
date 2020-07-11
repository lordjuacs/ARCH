module Adder #(parameter n = 32)(a, b, s, y);
	input [n-1:0] a, b;
	input s;
	output reg[n-1:0] y;
	always @(*)begin
	case(s)
	1'b1:	y <= a + b + 1;
	1'b0:	y <= a + b;
	endcase
end	
endmodule

module mux2x1  #(parameter n = 32)(a, b, s, y);
	input [n-1:0] a, b;
	input s;
	output [n-1:0]y;
	assign y = s? b : a;
endmodule


module adder_substractor #(parameter n = 32)(a, b, s, y);
	input [n-1:0] a, b;
	input s;
	wire [n-1:0] con;
	output [n-1:0] y;
	mux2x1 #(.n(n)) first_mux(b, ~b, s, con);
	Adder  #(.n(n)) first_adder(a, con, s, y);
endmodule

module stl  #(parameter n = 32)(a, s, y);
	input [n-1:0] a;
	input s;
	reg [n-1:0] extend;
	output [n-1:0] y;
	always @(*)begin
		extend = {n{a[n-1]}};	
	end

	mux2x1 #(.n(n)) first_mux(a, extend, s, y);
endmodule

module a_part  #(parameter n = 32)(a, b, op1, op3, arithout);
	input [n-1:0] a, b;
	input op1, op3;
	wire [n-1:0] addout;
	output [n-1:0] arithout;
	adder_substractor #(.n(n)) first_adder_substractor(a, b, op1, addout);
	stl #(.n(n)) first_stl(addout, op3, arithout);
endmodule

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

module cero #(parameter n = 32)(a, y);
	input [n-1:0] a;
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
	
