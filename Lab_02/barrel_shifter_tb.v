`timescale 1ns/1ns
module barrel_shifter_tb;
	reg [31:0]d;
	reg [4:0]sa;
	reg right, arith;
	wire [31:0]sh;
	barrel_shifter ojalacorra(d,sa,right,arith,sh);
	initial begin
	$display("time\t\t\td\t\t\tsa\tright\tarith\t\t\tsh");
	d = 32'b11111111000000000000000011111111;
	sa = 5'b1000;
	right = 0;
	arith = 0;
	#3 $finish;
	end
	initial begin
		$monitor("%2d:\t%b\t%b\t%b\t%b\t%b",$time,d,sa,right,arith,sh);
	end
	initial begin
	#1 right = !right;
	#1 arith = !arith;
	#1 right = !right;arith = !arith;
	end	
	initial begin
		$dumpfile("barrel_shifter.vcd");	
		$dumpvars;
	end	
endmodule
	



