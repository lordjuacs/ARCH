module four_nand(a, b, c, d, z);
	input a, b, c, d;
	wire e, f;
	output z;
	and first_and(e, a, b);
	and second_and(f, c, d);
	nand answer(z, e, f);	
endmodule

