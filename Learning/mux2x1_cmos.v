module mux2x1_cmos (a0,a1,s,y);
	input s,a0,a1;
	output y;
	wire sn;
	cmosnot inv(sn,s);

	cmoscmos c0(y,a0,sn,s);
	cmoscmos c1(y,a1,s,sn);
endmodule
