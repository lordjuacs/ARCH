module stl(a, s, y);
	input [31:0] a;
	input s;
	reg [31:0] extend;
	output [31:0] y;
	always @(*)begin
		extend = {32{a[31]}};	
	end

	mux2x1 first_mux(a, extend, s, y);
endmodule
