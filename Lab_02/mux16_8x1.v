module mux16_8x1(D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2, out); 
output [15:0]out; 
input [15:0] D0,D1,D2, D3,D4,D5,D6,D7;
input S0,S1,S2; 
input NS0, NS1, NS2;
wire [15:0]T1, T2, T3, T4, T5, T6, T7, T8;

mux16_8x1_not a1(NS0, S0);
mux16_8x1_not a2(NS1, S1);
mux16_8x1_not a3(NS2, S2);

mux16_8x1_and u1(T1, D0, NS0, NS1, NS2);
mux16_8x1_and u2(T2, D1, S0, NS1, NS2);
mux16_8x1_and u3(T3, D2, NS0, S1, NS2);
mux16_8x1_and u4(T4, D3, S0, S1, NS2);
mux16_8x1_and u5(T5, D4, NS0, NS1, S2);
mux16_8x1_and u6(T6, D5, S0, NS1, S2);
mux16_8x1_and u7(T7, D6, NS0, S1, S2);
mux16_8x1_and u8(T8, D7, S0, S1, S2);
mux16_8x1_or u12(out, T1, T2, T3, T4, T5, T6, T7, T8);
endmodule
