module adder #(parameter n = 32)(a, b, s, y);
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
