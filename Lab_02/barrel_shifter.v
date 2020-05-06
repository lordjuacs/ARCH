module barrel_shifter(d,sa,right,arith,sh);
	input [31:0]d;
	input [4:0]sa;
	input right, arith;
	output [31:0]sh;
	wire [31:0]green0,green1,green2,green3,green4;
	wire [31:0]s4,s3,s2,s1;
	wire [15:0]e,z;

	assign z = 16'b00;
	ANDE ande(d[31],arith,e);

	mux32_2x1 firstgreenmux({d[15:0],z},{e,d[31:16]},right,green0);
	mux32_2x1 firstbluemux(d,green0,sa[4],s4);
	mux32_2x1 secondgreenmux({s4[23:0],z[7:0]},{e[7:0],s4[31:8]},right,green1);
	mux32_2x1 secondbluemux(s4,green1,sa[3],s3);
	mux32_2x1 thirdgreenmux({s3[27:0],z[3:0]},{e[3:0],s3[31:4]},right,green2);
	mux32_2x1 thirddbluemux(s3,green2,sa[2],s2);
	mux32_2x1 fourthgreenmux({s2[29:0],z[1:0]},{e[1:0],s2[31:2]},right,green3);
	mux32_2x1 fourthbluemux(s2,green3,sa[1],s1);
	mux32_2x1 fifthgreenmux({s1[30:0],z[0]},{e[0],s1[31:1]},right,green4);
	mux32_2x1 fifthbluemux(s1,green4,sa[0],sh);
endmodule
	







