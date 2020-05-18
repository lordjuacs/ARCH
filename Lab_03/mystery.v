module mystery(di, load, clk, clrn, d, q, do);
	input di, load, clk, clrn;
	input [2:0] d;
	output [2:0] q;
	wire m1, m2, m3;
	wire f1, f2;
	output do;
	
	mux2x1 first_mux(di, d[2], load, m1);
	dff first_dff(m1, clk, clrn, f1);
	buffer first_buffer(f1, q[2]);
	
	mux2x1 second_mux(f1, d[1], load, m2);
	dff second_dff(m2, clk, clrn, f2);
	buffer second_buffer(f2, q[1]);
	
	mux2x1 third_mux(f2, d[0], load, m3);
	dff third_dff(m3, clk, clrn, do);
	buffer third_buffer(do, q[0]);
	
endmodule
