module dlatch(lna1, lna2, prn, clk, clrn, q, qn);
	input lna1, lna2, prn, clk, clrn;
	wire c, d;
	output q, qn;
	three_nand first_three_nand(lna1, clrn, clk, c);
	three_nand second_three_nand(lna2, prn, clk, d);
	three_nand third_three_nand(c, prn, qn, q);
	three_nand fourth_three_nand(q, clrn, d, qn);
endmodule
