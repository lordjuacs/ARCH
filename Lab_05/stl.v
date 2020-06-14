module stl  #(parameter n = 32)(a, s, y);
	input [n-1:0] a;
	input s;
	reg [n-1:0] extend;
	output [n-1:0] y;
	always @(*)begin
		extend = {n{a[n-1]}};	
	end

	mux2x1 #(.n(n)) first_mux(a, extend, s, y);
endmodule
