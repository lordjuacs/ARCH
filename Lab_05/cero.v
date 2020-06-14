module cero(a, y);
	input [31:0] a;
	output reg y;
	always @(*)begin
	if(a==32'b0)
	begin
		y = 1;
	end	
	else
	begin
		y = 0;
	end
	end
endmodule

