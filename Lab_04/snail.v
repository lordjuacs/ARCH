module snail(clk, reset, number, smile);
	input clk, reset, number;
	output smile;
	
	reg [1:0] state, nextstate;
	
	parameter a = 2'b00;
	parameter b = 2'b01;
	parameter c = 2'b10;
	parameter d = 2'b11;

	always @ (posedge clk, posedge reset)
		if (reset)	state <= a;
		else	state <= nextstate;
	always @ (*)
		case (state)
			a:	if (number)
					nextstate = b;
				else	nextstate = a;
			b:	if (number)
					nextstate = b;
				else	nextstate = c;
			c:	if (number)
					nextstate = b;
				else	nextstate = d;
			d:	if (number)
					nextstate = b;
				else	nextstate = a;
			default: nextstate = a;
		endcase

assign smile = (number & state==d);

endmodule

