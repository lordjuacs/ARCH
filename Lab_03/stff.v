module four_nand(a, b, c, d, z);
	input a, b, c, d;
	wire e, f;
	output z;
	and first_and(e, a, b);
	and second_and(f, c, d);
	nand answer(z, e, f);	
endmodule

module three_nand(a, b, c, z); 	
	input a, b, c;
	wire d;
	output z;
	and first_and(d, a, b);
	nand answer(z, d, c);	
endmodule

module tlatch(prn, t, nclk, clrn, q, qn, lna1, lna2);
	input prn, t, nclk, clrn;
	wire a, b;
	inout q, qn;
	output lna1, lna2;
	four_nand first_four_nand(qn, t, nclk, clrn, a);
	four_nand second_four_nand(prn, nclk, t, q, b);
	three_nand first_three_nand(a, prn, lna2, lna1);
	three_nand second_three_nand(lna1, clrn, b, lna2);
endmodule

module dlatch(lna1, lna2, prn, clk, clrn, q, qn);
	input lna1, lna2, prn, clk, clrn;
	wire c, d;
	output q, qn;
	three_nand first_three_nand(lna1, clrn, clk, c);
	three_nand second_three_nand(lna2, prn, clk, d);
	three_nand third_three_nand(c, prn, qn, q);
	three_nand fourth_three_nand(q, clrn, d, qn);
endmodule

module stff(prn, t, clk, clrn, q, qn);
	input prn, t, clk, clrn;
	wire lna1, lna2;
	inout q, qn;
	tlatch tl(prn, t, ~clk, clrn, q, qn,  lna1, lna2);
	dlatch dl(lna1, lna2, prn, clk, clrn, q, qn);
endmodule
