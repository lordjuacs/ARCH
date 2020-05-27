`timescale 1ns/1ns
module seven_tb;
	reg clk, reset, x1, x2, x3;

	wire z1, z2, z3;
	seven g(clk, reset, x1, x2, x3, z1, z2, z3);
	initial begin
		$display("time\tclk\treset\tx1\tx2\tx3\tstate\tz1\tz2\tz3");
		clk <= 1;
		reset <= 0;
		x1 <= 0;
		x2 <= 0;
		x3 <= 0;



		#20 $finish;
	end
	initial begin
		$monitor("%2d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, clk, reset, x1, x2, x3, g.state, z1, z2, z3);
	end
	
		
	always
	#1 clk = ~clk;
	
	
	initial begin
	#2 x1 <= 1;
	#2 x2 <= 1;
	#0 x1 <= 0;
	#2 x1 <= 0;
	#0 x2 <= 0;
	#4 x2 <= 1;
	#0 x3 <= 1;
	#2 x1 <= 0;
	#2 x2 <= 0;
	#2 x3 <= 0;

	end

	initial begin
		$dumpfile("seven.vcd");	
		$dumpvars;
	end	



endmodule
