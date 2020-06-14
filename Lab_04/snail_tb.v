`timescale 1ns/1ns
module snail_tb;
	reg clk, reset, number;
	wire smile;
	snail g(clk, reset, number, smile);
	initial begin
		$display("time\tclk\treset\tnumber\tsmile");
		clk <= 1;
		reset <= 0;
		number <= 0;

		#18 $finish;
	end
	initial begin
		$monitor("%2d\t%b\t%b\t%b\t%b", $time, clk, reset, number, smile);
	end
	
		
	always
	#1 clk = ~clk;
	
	initial begin
	#1 number <= 1;	
	end

	initial begin
	#4 number <= 0;
	#2 number <= 0;
	#2 number <= 1;
	#2 number <= 0;
	#2 number <= 0;
	#2 number <= 1;
	end

	initial begin
		$dumpfile("snail.vcd");	
		$dumpvars;
	end	



endmodule
