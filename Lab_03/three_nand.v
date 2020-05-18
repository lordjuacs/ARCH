module three_nand(a, b, c, z); 	
	input a, b, c;
	wire d;
	output z;
	and first_and(d, a, b);
	nand answer(z, d, c);	
endmodule
