module btff(prn, t, clk, clrn, q, qn);
	input prn, t, clk, clrn;
	output reg q, qn;

always @(posedge clk)
begin
	if(clrn == 1 & prn == 0)
	begin
		q <= 1;
		qn <= 0;
	end
	else if(clrn == 0 & prn == 1)
	begin
		q <= 0;
		qn <= 1;
	end
	else if (clrn == 0 & prn == 0)
	begin
		q <= 1'bX;
		qn <= 1'bX;
	end
	else
	begin
		if(t)
		begin
			q <= ~q;
			qn <= ~qn;		
		end
	end
end
endmodule
