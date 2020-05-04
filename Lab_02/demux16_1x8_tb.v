`timescale 1ns/1ns
module demux16_1x8_tb;
	reg [15:0]D0;
	reg [2:0]s;
	wire [15:0]  y0, y1, y2, y3, y4, y5, y6, y7;
	demux16_1x8 g(D0, s, y0, y1, y2, y3, y4, y5, y6, y7);
	initial begin
	$display("time\t\tD0\t\ts\t\ty0\t\t\ty1\t\t\ty2\t\t\ty3\t\t\ty4\t\t\ty5\t\t\ty6\t\t\ty7");
		D0 = 16'b01;
		s = 3'b000;
		#8 $finish;
	end
	initial begin
		$monitor("%2d:\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",$time,D0, s, y0, y1, y2, y3, y4, y5, y6, y7);
	end
	always #1 s[0] = !s[0];
	always #2 s[1] = !s[1];
	always #4 s[2] = !s[2];
	//always #1 D0 = D0 + 1;	
	
	initial begin
		$dumpfile("demux16_1x8.vcd");	
		$dumpvars;
	end	
endmodule
	


