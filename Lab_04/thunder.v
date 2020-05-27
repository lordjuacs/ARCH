module thunder(left, right, reset, clk, la, lb, lc, ra, rb, rc);
	input left, right, reset, clk;
	output la, lb, lc, ra, rb, rc;

	reg [2:0] state, nextstate;

	parameter S0 = 3'b000;
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;
	parameter S5 = 3'b101;
	parameter S6 = 3'b110;
	parameter S7 = 3'b111;

	always @ (posedge clk, posedge reset)
		if (reset)
			state <= S0;
		else
			state <= nextstate;
	always @ (*)
		case (state)
			S0: 	if(left & right)
					nextstate = S7;
				else if (left & ~right)		
					nextstate = S1;
				else if (right & ~left)
					nextstate = S4;	
			     	else
					nextstate = S0;	
			S1: nextstate = S2;
			S2: nextstate = S3;
			S3: nextstate = S0;
			S4: nextstate = S5;
			S5: nextstate = S6;
			S6: nextstate = S0;
			S7: nextstate = S0;
			default: nextstate = S0;
		endcase
	
	assign la = (state == S1 | state == S2 | state == S3 | state == S7);
	assign lb = (state == S2 | state == S3 | state == S7);
	assign lc = (state == S3 | state == S7);
	assign ra = (state == S4 | state == S5 | state == S6 | state == S7);
	assign rb = (state == S5 | state == S6 | state == S7);
	assign rc = (state == S6 | state == S7);
	
			
endmodule
