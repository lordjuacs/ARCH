`timescale 1ns/1ns
module btff_tb;
	reg prn, t, clk, clrn;
	wire q, qn;
	btff g(prn, t, clk, clrn, q, qn);
	initial begin
		$display("time\tprn\tt\tclk\tclrn\tq\tqn");
		prn <= 1;
		clrn <= 0;
		clk <= 1;
		t <= 1;
		#23 $finish;
	end
	initial begin
		$monitor("%2d\t%b\t%b\t%b\t%b\t%b\t%b", $time, prn, t, clk, clrn, q, qn);
	end
	
	initial begin
	#1 clrn <= 1;
	#2 t <= ~t;
	#2 t <=	~t;
	#10 t <= ~t;	
	#2 t <= ~t;	
	end
	
	always
	#1 clk <= ~clk;

	initial begin
		$dumpfile("btlatch.vcd");	
		$dumpvars;
	end	
endmodule
