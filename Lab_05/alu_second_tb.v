`timescale 1ns/1ns
module alu_second_tb;
	reg clk;
	reg [31:0] a, b, y_expected;
	wire [31:0] y;
	reg [3:0]  f;
	wire        zero;
	reg zero_expected;
	reg [31:0] vectornum, errors;
	reg [100:0] testvectors[8:0];
	alu sample(a, b, f, y, zero);

  	always begin
    		clk = 1; #50; clk = 0; #50;
  	end

	initial begin
		$readmemh("alu.tv", testvectors);
		vectornum = 0; errors = 0;
  	end

  	always @(posedge clk)
    		begin
      			#1;
			if (testvectors[vectornum] != 101b'X) begin 
      			f = testvectors[vectornum][100:97];
      			a = testvectors[vectornum][96:65];
      			b = testvectors[vectornum][64:33];
      			y_expected = testvectors[vectornum][32:1];
      			zero_expected = testvectors[vectornum][0];
			end else begin
			$finish;
			end
   		end

	always @(negedge clk)
		begin
			if (y == y_expected) begin
				$display("Y success");
			end else begin
				errors = errors + 1;
			end 
			if (zero == zero_expected) begin
				$display("zero success");
			end else begin
				errors = errors + 1;
			end
		$display("Numero de errors %d", errors);
		vectornum = vectornum + 1;
		end
endmodule