module jklatch(prn, j, k, nclk, clrn, q, qn, lna1, lna2);
	input prn, j, k, nclk, clrn;
	wire a, b;
	inout q, qn;
	output lna1, lna2;
	four_nand first_four_nand(qn, j, nclk, clrn, a);
	four_nand second_four_nand(prn, nclk, k, q, b);
	three_nand first_three_nand(a, prn, lna2, lna1);
	three_nand second_three_nand(lna1, clrn, b, lna2);
endmodule
