`timescale 1ns/1ns
module mux16_8x1_tb;
    wire[15:0]out;
    	reg  [15:0]D0, D1, D2, D3, D4, D5, D6, D7;
	reg S0, S1, S2;

    mux16_8x1 g (D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2, out);
    initial begin
		D0 = 16'b000;
		D1 = 16'b001;
		D2 = 16'b010;
		D3 = 16'b011;
		D4 = 16'b100;
		D5 = 16'b101;
		D6 = 16'b110;
		D7 = 16'b111;
		S0 = 0;
		S1 = 0;
		S2 = 0;
		$display("time\t\tD0\t\t\tD1\t\t\tD2\t\t\tD3\t\t\tD4\t\t\tD5\t\t\tD6\t\t\tD7\t\tS2\tS1\tS0\t\tY"); 
		$monitor("%2d:\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",$time,D0, D1, D2, D3, D4, D5, D6, D7, S2, S1, S0, out);
    		   #8 $finish;
    end
always #1 S0 = !S0;
always #2 S1 = !S1;
always #4 S2 = !S2;
    initial begin 
        $dumpfile("mux16_8x1.vcd"); 
        $dumpvars;
    end
endmodule
