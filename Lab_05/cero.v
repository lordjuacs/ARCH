module cero #(parameter n = 32)(a, y);
	input [n-1:0] a;
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

