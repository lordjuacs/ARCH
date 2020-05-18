module stff(prn, t, clk, clrn, q, qn);
	input prn, t, clk, clrn;
	wire lna1, lna2;
	wire nclk;
	inout q, qn;
	not not_clk(nclk, clk);
	tlatch tl(prn, t, nclk, clrn, q, qn,  lna1, lna2);
	dlatch dl(lna1, lna2, prn, clk, clrn, q, qn);
endmodule
