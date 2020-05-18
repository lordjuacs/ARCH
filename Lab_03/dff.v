module dff(d, clk, clrn, q);
	input d, clk, clrn;
	output reg q;
	always @(posedge clk)
	begin
		if(clrn==1)
		begin
			q = 0;
		end
		else
		begin
			q = d;
		end
	end
endmodule
