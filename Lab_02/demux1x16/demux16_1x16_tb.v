`timescale 1ns/1ns
module demux16_1x16_tb;
	reg [15:0]D0;
	reg [3:0]s;
	wire [15:0]  y0, y1, y2, y3, y4, y5, y6, y7,y8,y9,y10,y11,y12,y13,y14,y15;
	demux16_1x16 g(D0, s, y0, y1, y2, y3, y4, y5, y6, y7,y8,y9,y10,y11,y12,y13,y14,y15);
	initial begin
	$display("time\t\tD0\t\ts\t\ty0\t\t\ty1\t\t\ty2\t\t\ty3\t\t\ty4\t\t\ty5\t\t\ty6\t\t\ty7\t\t\ty8\t\t\ty9\t\t\ty10\t\t\ty11\t\t\ty12\t\t\ty13\t\t\ty14\t\t\ty15");
		D0 = 16'b01;
		s = 4'b0000;
		#16	 $finish;
	end
	initial begin
		$monitor("%2d:\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",$time,D0, s, y0, y1, y2, y3, y4, y5, y6, y7,y8,y9,y10,y11,y12,y13,y14,y15);
	end
	always #1 s[0] = !s[0];
	always #2 s[1] = !s[1];
	always #4 s[2] = !s[2];
	always #8 s[3] = !s[3];	
	
	initial begin
		$dumpfile("demux16_1x16.vcd");	
		$dumpvars;
	end	
endmodule
