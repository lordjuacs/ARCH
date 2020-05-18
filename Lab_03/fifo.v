module fifo (din, write, read, clr, dout, full, empty);
	input write, read, clr;
	input [7:0] din;
	output [7:0] dout;
	output full, empty;

	wire f0q, f0qn, f1q, f1qn, f2q, f2qn, f3q, f3qn, f4q, f4qn;
	wire [7:0] d12, d23, d34;
	wire [0:0]clk1, clk2, clk3, clk4;
	wire clrf0;
	

	or orf0(clrf0, clr, clk1);
	sr f0(~clr, write, clrf0, f0q, f0qn);

	and clock1(clk1, f0q, f1qn);
	sr f1(clk1, clk2, clr, f1q, f1qn);
	dfffifo r1(din, clk1, d12);
	and clock2(clk2, f1q, f2qn);
	dfffifo r2(d12, clk2, d23);
	buf fu(full, f1q);
	and clock3(clk3, f2q, f3qn);
	dfffifo r3(d23, clk3, d34);
	sr f2(clk2, clk3, clr, f2q, f2qn);
	and clock4(clk4, f3q, ~read, f4qn);
	dfffifo r4(d34, clk4, dout);	
	sr f3(clk3, clk4, clr, f3q, f3qn);
	sr f4(clk4, read, clr, f4q, f4qn);
	

	buf em(empty, f4qn);
endmodule


