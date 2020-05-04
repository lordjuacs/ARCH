`timescale 1ns/1ns
module encoder8x3_tb;
	reg [7:0] d;
	reg ena;
	wire [2:0]n;
	encoder8x3 g (d,ena,n);
	initial begin
	$display("time\tena\td[7]\td[6]\td[5]\td[4]\td[3]\td[2]\td[1]\td[0]\tn[2]\tn[1]\tn[0]");
		d= 8'b00;
		ena = 1;		
		#9 $finish;
	end
	initial begin
		$monitor("%2d:\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",$time,ena,d[7],d[6],d[5],d[4],d[3],d[2],d[1],d[0],n[2],n[1],n[0]);
	end
	initial begin	
	#1 d = 8'b1;	
	#1 d = 8'b1X;	
	#1 d = 8'b1XX;	
	#1 d = 8'b1XXX;	
	#1 d = 8'b1XXXX;	
	#1 d = 8'b1XXXXX;	
	#1 d = 8'b1XXXXXX;	
	#1 d = 8'b1XXXXXXX;	
	#8 d = 8'bXXXXXXXX;
	end	
	always #9 ena = !ena;
	always #9 d = 8'bXXXXXXXX;
	initial begin
		$dumpfile("encoder8x3.vcd");	
		$dumpvars;
	end	
endmodule
	


