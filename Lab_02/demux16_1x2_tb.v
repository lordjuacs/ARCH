`timescale 1ns/1ns
module demux16_1x2_tv;
	reg s;
	reg [15:0]D0;
	wire [15:0]y0,y1;
	demux16_1x2 g(D0,s,y0,y1);
	initial begin
	$display("time\t\tD0\t\ts\t\ty0\t\t\ty1");
		D0 = 16'b01;
		s = 0;
		#6 $finish;
	end
	initial begin
		$monitor("%2d:\t%b\t%b\t%b\t%b",$time,D0,s,y0,y1);
	end
	always #1 s = !s;
	always #1 D0 = D0 + 1;	
	
	initial begin
		$dumpfile("demux16_1x2.vcd");	
		$dumpvars;
	end	
endmodule
	
