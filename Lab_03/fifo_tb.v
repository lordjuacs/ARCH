`timescale 1ns/1ns
module fifo_tb;

	reg [7:0]din;
	reg write, read, clr;
	wire [7:0] dout;
	wire full, empty;

	fifo g(din, write, read, clr, dout, full, empty);
	initial begin
		$display("time\tclr\tdin\t\twrite\tread\tfull\tempty\tdout");
		clr <= 1;
		write <= 0;
		read <= 0;

		#190 $finish;
	end
	
initial begin
		$monitor("%2d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, clr, din, write, read,full, empty, dout);
	end
	
	initial begin
		#20 clr <= 0;	
	end
	initial begin
		#20 din <= 8'he1;
		#20 din <= din +1;
		#20 din <= din +1;
		#20 din <= din +1;
	end
	
	initial begin
		#25 write <= ~write;
		#10 write <= ~write;
		#10 write <= ~write;
		#10 write <= ~write;
		#10 write <= ~write;
		#10 write <= ~write;
		#10 write <= ~write;
		#10 write <= ~write;
	end
	
	initial begin 
		#105 read <= ~read;
		#10 read <= ~read;
		#10 read <= ~read;
		#10 read <= ~read;
		#10 read <= ~read;
		#10 read <= ~read;
		#10 read <= ~read;
		#10 read <= ~read;
	end

	


	initial begin
		$dumpfile("fifo.vcd");	
		$dumpvars;
	end	
endmodule
