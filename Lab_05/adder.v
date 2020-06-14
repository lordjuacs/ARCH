module adder(a, b, s, y);
	input [31:0] a, b;
	input s;
	output reg[31:0] y;
	always @(*)begin
	case(s)
	1'b1:	y <= a + b + 1;
	1'b0:	y <= a + b;
	endcase
end	
endmodule
