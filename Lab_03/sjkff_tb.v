`timescale 1ns/1ns
module sjkff_tb;
	reg prn, j, k, clk, clrn;
	inout q, qn;
	sjkff g(prn, j, k, clk, clrn, q, qn);
	initial begin
		$display("time\tprn\tj\tk\tclk\tclrn\tq\tqn");
		prn <= 1;
		clrn <= 0;
		clk <= 1;
		j <= 0;
		k <= 0;
		#17 $finish;
	end
	initial begin
		$monitor("%2d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, prn, j, k, clk, clrn, q, qn);
	end
	
	initial begin
	#1 clrn <= 1;
	#2 j <= ~j;
	#2 j <=	~j;
	#2 j <= ~j;	
	#8 j <= ~j;	
	end
	initial begin
	#1 k <= ~k;
	#2 k <= ~k;
	#4 k <= ~k;
	#8 k <= ~k;
	end
	
	always
	#1 clk <= ~clk;

	initial begin
		$dumpfile("sjkff.vcd");	
		$dumpvars;
	end	
endmodule
