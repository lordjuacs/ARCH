`timescale 1ns/1ns
module decoder3x8_tb	;
	reg [2:0] n;
	reg ena;
	wire [7:0]d;
	decoder3x8 g (n,ena,d);
	initial begin
	$display("time\tena\tn[2]\tn[1]\tn[0]\td[7]\td[6]\td[5]\td[4]\td[3]\td[2]\td[1]\td[0]");

		n = 3'b000;
		ena = 1;		
		#8 $finish;
	end
	initial begin
		$monitor("%2d:\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",$time,ena,n[2],n[1],n[0],d[7],d[6],d[5],d[4],d[3],d[2],d[1],d[0]);
	end
	always #1 n[0] = !n[0];
	always #2 n[1] = !n[1];
	always #4 n[2] = !n[2];
	always #8 ena = !ena;
	always #8 n = 3'b???;
	
	initial begin
		$dumpfile("decoder3x8.vcd");	
		$dumpvars;
	end	
endmodule
	


