module a_gt_eq_six_tb ();

reg a2, a1, a0;

initial
begin: estimulate_design
reg [3:0] invect;

for (invect = 0; invect < 8; invect = invect + 1)
begin
{a2, a1, a0} = invect [3:0];
#10 $display ("a2. a1. a0 = %b, a_gt_eq_six = %b", {a2, a1, a0},
a_gt_eq_six);
end

end

a_gt_eq_six inst1 (a2, a1, a0, a_gt_eq_six);
initial begin
		$dumpfile("h1.vcd");	
		$dumpvars;
	end	
endmodule
