module demux16_1x2 (D0,s,y0,y1);
	input [15:0]D0	;
	input s;
	output [15:0]y0,y1;

	assign y0 = (s == 0)? D0 : 16'b00;
	assign y1 = (s == 1)? D0 : 16'b00;
endmodule
