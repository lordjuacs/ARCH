module demux16_1x8(D0, s, y0, y1, y2, y3, y4, y5, y6, y7); 
	input [15:0] D0; 
	input [2:0]s; 
	output [15:0]  y0, y1, y2, y3, y4, y5, y6, y7; 
	assign y0 = (s == 3'b000) ? D0 : 16'b0; 
	assign y1 = (s == 3'b001) ? D0 : 16'b0; 
	assign y2 = (s == 3'b010) ? D0 : 16'b0; 
	assign y3 = (s == 3'b011) ? D0 : 16'b0; 
	assign y4 = (s == 3'b100) ? D0 : 16'b0; 
	assign y5 = (s == 3'b101) ? D0 : 16'b0; 
	assign y6 = (s == 3'b110) ? D0 : 16'b0; 
	assign y7 = (s == 3'b111) ? D0 : 16'b0; 
endmodule 
