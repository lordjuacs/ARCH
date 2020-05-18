module sjkff(prn, j, k, clk, clrn, q, qn);
	input prn, j, k, clk, clrn;
	wire lna1, lna2;
	wire nclk;
	inout q, qn;
	not not_clk(nclk, clk);
	jklatch jkl(prn, j, k, nclk, clrn, q, qn, lna1, lna2);
	dlatch dl(lna1, lna2, prn, clk, clrn, q, qn);
endmodule
