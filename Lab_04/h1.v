module a_gt_eq_six (a2, a1, a0, a_gt_eq_six);
input a2, a1, a0;
output a_gt_eq_six;

reg a_gt_eq_six;

always @ (a2 or a1 or a0)
begin
	if (a2 & a1)
		a_gt_eq_six = 1'b1;
	else
		a_gt_eq_six = 1'b0;
end
endmodule
