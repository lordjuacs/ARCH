`timescale 1ns/1ns
module mux16_2x1_tb;
	reg s;
	reg [15:0] a,b;
	wire  [15:0]y;
	mux16_2x1 g (a,b,s,y);
	initial begin
	$display("time\t\ta\t\t\tb\t\ts\t\ty");
		a = 16'b1111000011110000;
		b = 16'b0000111100001111;
		s = 16'b00;
		#10 $finish;
	end
	initial begin
		$monitor("%2d:\t%b\t%b\t%b\t%b",$time,a,b,s,y);
	end
	always #1 a = a - 1;
	always #1 s = !s;
	always #2 b = b + 1;	
	
	initial begin
		$dumpfile("mux16_2x1.vcd");	
		$dumpvars;
	end	
endmodule
	
