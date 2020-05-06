module ANDE(d,arith,e);
	input d;
	input arith;
	output [15:0]e;
	wire [15:0]temp;
	assign temp = {16{d}}; 	
	assign e = arith? temp : 16'b00;
endmodule
