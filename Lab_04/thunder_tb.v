`timescale 1ns/1ns
module thunder_tb;
	reg left, right, reset, clk;
	wire la, lb, lc, ra, rb, rc;
	thunder g(left, right, reset, clk, la, lb, lc, ra, rb, rc);
	initial begin
		$display("time\tclk\treset\tleft\tright\tlc\tlb\tla\tra\trb\trc");
		clk <= 0;
		reset <= 0;
		left <= 0;
		right <= 0;
		#22 $finish;
	end
	initial begin
		$monitor("%2d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, clk, reset, left, right, lc, lb, la, ra, rb, rc);
	end
	
	
	always
	#1 clk <= ~clk;
	
	initial begin
	#3 left <=1;
	#1 left <= 0;
	#6 left <= 0;
	end
	initial begin
	#11 right <= 1;
	#1 right <= 0;
	end

	initial begin
	#19 left <= 1;
	#0 right <= 1; 
	#2 reset <= 1;
	#0 left <= 0;
	#0 right <= 0;
	#1 reset <= 0;
	end
	

	initial begin
		$dumpfile("thunder.vcd");	
		$dumpvars;
	end	






endmodule
