module mux2x1(a, b, s, c);
	input a, b, s;
	output reg c;
	always @(*)begin
	  	case (s)
			0 : c = a;
	         	1 : c = b;
			default: c = c;
  		endcase
	end
endmodule
