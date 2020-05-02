`timescale 1ns/1ns
module mux16_16x1_tb;
    wire[15:0]out;
    	reg  [15:0]D0, D1, D2, D3, D4, D5, D6, D7,D8, D9, D10, D11, D12, D13, D14, D15;
reg S0, S1, S2, S3;

    mux16_16x1 g (D0, D1, D2, D3, D4, D5, D6, D7,D8, D9, D10, D11, D12, D13, D14, D15,S0, S1, S2, S3,out);
    initial begin
		D0 = 16'b0000;
		D1 = 16'b0001;
		D2 = 16'b0010;
		D3 = 16'b0011;
		D4 = 16'b0100;
		D5 = 16'b0101;
		D6 = 16'b0110;
		D7 = 16'b0111;
		D8 = 16'b1000;
		D9 = 16'b1001;
		D10 = 16'b1010;
		D11 = 16'b1011;
		D12 = 16'b1100;
		D13 = 16'b1101;
		D14 = 16'b1110;
		D15 = 16'b1111;
		S0 = 0;
		S1 = 0;
		S2 = 0;
		S3 = 0;
		
$display("time\t\tD0\t\t\tD1\t\t\tD2\t\t\tD3\t\t\tD4\t\t\tD5\t\t\tD6\t\t\tD7\t\t\tD8\t\t\tD9\t\t\tD10\t\t\tD11\t\t\tD12\t\t\tD13\t\t\tD14\t\t\tD15\t\tS3\tS2\tS1\tS0\t\tY"); 
$monitor("%2d:\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",$time,D0, D1, D2, D3, D4, D5, D6, D7,D8, D9, D10, D11, D12, D13, D14, D15,S3, S2, S1, S0,out);
#16 $finish;
    end
always #1 S0 = !S0;
always #2 S1 = !S1;
always #4 S2 = !S2;
always #8 S3 = !S3; 
    initial begin 
        $dumpfile("mux16_16x1.vcd"); 
        $dumpvars;
    end
endmodule
