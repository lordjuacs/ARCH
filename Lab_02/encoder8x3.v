module encoder8x3 (d,ena,n);
	input [7:0]d;
	input ena;
	output [2:0]n;
	reg [2:0]n;
	always @(d,ena) begin	
	if(ena==1)begin	
	casex(d)
	8'b1??????? : n = 3'b111;
	8'b01?????? : n = 3'b110;
	8'b001????? : n = 3'b101;
	8'b0001???? : n = 3'b100;
	8'b00001??? : n = 3'b011;
	8'b000001?? : n = 3'b010;
	8'b0000001? : n = 3'b001;
	8'b00000001 : n = 3'b000;
	default: n = 3'b000;
	endcase
	end
	else begin n = 3'b000;end
end
endmodule

