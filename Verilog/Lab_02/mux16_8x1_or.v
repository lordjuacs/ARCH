module mux16_8x1_or(l, m, n, o, p, q, r, s, t);
	output [15:0]l;
	input [15:0]m, n, o, p, q, r, s, t;
assign l = m | n | o | p | q | r | s | t;
endmodule
