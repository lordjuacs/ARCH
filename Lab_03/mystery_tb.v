`timescale 1ns/1ns
module mystery_tb;
	reg di, load, clk, clrn;
	reg [2:0] d;
	wire [2:0] q;
	wire do;
	mystery g(di, load, clk, clrn, d, q, do);
	initial begin
		$display("time\tdi\tload\tclk\tclrn\td\tq\tdo");
		clrn <= 0;
		clk <= 0;
		di <= 0;
		load <= 0;
		d <= 3'b010;

		#40 $finish;
	end
	initial begin
		$monitor("%2d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, di, load, clk, clrn, d, q, do);
	end
	


	always #1 clk = ~clk;
	always #6 d = d -1;
	always #6 di = ~di;
	always #20 load = ~load;

	initial begin
		$dumpfile("mystery.vcd");	
		$dumpvars;
	end	
endmodule
