`timescale 1ns/1ns
module alu_tb;
	reg [31:0] a, b;
	reg [3:0] op;
	wire [31:0] result;
	wire cero;

	alu g(a, b, op, result, cero);
	initial begin
		$display("time\t\t\tA\t\t\t\t\tB\t\t\topcode\t\t\tresult\t\t\tZero");
		a = 32'b100;
		b = 32'b101;
		op = 4'b0;
		#10 $finish;
	end
	initial begin
		$monitor("%2d\t%b\t%b\t%b\t%b\t%b", $time, a, b, op, result, cero);
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
