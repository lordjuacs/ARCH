module decoder3x8(n,ena,d);
	input [2:0] n;
	input ena;
	output [7:0]d;

	assign d[0] = (ena==1) ?((n ==3'b000) ? 1: 0):0; 
	assign d[1] = (ena==1) ?((n ==3'b001) ? 1: 0):0;
	assign d[2] = (ena==1) ?((n ==3'b010) ? 1: 0):0; 
	assign d[3] = (ena==1) ?((n ==3'b011) ? 1: 0):0; 
	assign d[4] = (ena==1) ?((n ==3'b100) ? 1: 0):0; 
	assign d[5] = (ena==1) ?((n ==3'b101) ? 1: 0):0; 
	assign d[6] = (ena==1) ?((n ==3'b110) ? 1: 0):0; 
	assign d[7] = (ena==1) ?((n ==3'b111) ? 1: 0):0; 
endmodule
