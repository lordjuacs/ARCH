module snail(clk, reset, number, smile);
	input clk, reset, number;
	output smile;
	
	reg [1:0] state, nextstate;
	
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;
	parameter S3 = 2'b11;

	always @ (posedge clk, posedge reset)
		if (reset)	state <= S0;
		else	state <= nextstate;
	always @ (*)
		case (state)
			S0:	if (number)
					nextstate = S1;
				else	nextstate = S0;
			S1:	if (number)
					nextstate = S2;
				else	nextstate = S0;
			S2:	if (number)
					nextstate = S2;
				else	nextstate = S3;
			S3:	if (number)
					nextstate = S1;
				else	nextstate = S0;
			default: nextstate = S0;
		endcase

assign smile = (number & state==S3);

endmodule

