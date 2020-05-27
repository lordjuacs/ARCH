module seven (clk, reset, x1, x2, x3, state, z1, z2, z3);
	input clk, reset, x1, x2, x3;
	output z1, z2, z3;
	
	output reg [2:0] state;
	reg [2:0] nextstate;


	parameter a = 3'b000;
	parameter b = 3'b001;
	parameter c = 3'b101;
	parameter d = 3'b010;
	parameter e = 3'b100;
	parameter f = 3'b110;
	parameter g = 3'b111;

	always @ (posedge clk, posedge reset)
		if (reset) 
			state <= a;
		else 
			state <= nextstate;
	always @ (*)
		case (state)
			a:	if(x1)
					nextstate = b;
				else if (~x1)
					nextstate = c;
			b: 	if(x2)
					nextstate = d;
				else if(~x2)
					nextstate = a;	
			c:	if(x2 & x3)
					nextstate = e;
				else if(x2 & ~x3)
					nextstate = a;
				else if(~x2 & x3)
					nextstate = f;
				else if(~x2 & ~x3)
					nextstate = g;
			d:	nextstate = a;
			e:	nextstate = a;
			f:	nextstate = a;
			g:	nextstate = a;
			default:	nextstate = a;
		endcase

	assign z1 = (state==d);
	assign z2 = (state==e);
	assign z3 = (state==g);
endmodule
						
