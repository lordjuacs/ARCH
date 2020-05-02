module mux16_16x1_or(l, m, n, o, p, q, r, s, t, a, b, c, d, e, f, g, h);
	output [15:0]l;
	input [15:0]m, n, o, p, q, r, s, t, a, b, c, d, e, f, g, h;
assign l = m | n | o | p | q | r | s | t| a | b | c | d | e | f | g | h;
endmodule
