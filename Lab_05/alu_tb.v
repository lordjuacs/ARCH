`timescale 1ns/1ns

module alu_tb;
parameter n = 32;
	reg [n-1:0] a, b;
	reg [3:0] op;
	wire [n-1:0] result;
	wire cero;

	alu #(.n(n)) g(a, b, op, result, cero);
	initial begin
		$display("time\topcode\t\t\tA\t\t\t\t\tB\t\t\t\t\tResult\t\t\tZero");
		a = 'b101;
		b = 'b100;
		op = 4'b0;
		#10 $finish;
	end
	initial begin
		$monitor("%2d\t%b\t%b\t%b\t%b\t%b", $time, op, a, b, result, cero);
	end
	
	initial begin
	#1 op = 4'b0010;
	#1 op = 4'b0010;	
	#1 op = 4'b0100;	
	#1 op = 4'b0101;	
	#1 op = 4'b0110;	
	#1 op = 4'b0111;	
	#1 op = 4'b1010;
	#1 op = 4'b1111;		
	end

	initial begin
		$dumpfile("alu.vcd");	
		$dumpvars;
	end	

endmodule
