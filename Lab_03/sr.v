module sr(s, r, clr, q, qn);
	input s, r, clr;
	output reg q, qn;
	always @(*)
	begin
		if(clr == 1)
		begin
			q = 0;
			qn = 1;
		end
		else
		begin
			q = r ~| qn;
			qn = q ~| s;
		end
	end
endmodule
