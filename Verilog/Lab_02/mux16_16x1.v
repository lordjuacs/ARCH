module mux16_16x1(D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, S0, S1, S2,S3,out); 
output [15:0]out; 
input [15:0] D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15;
input S0,S1,S2,S3; 
input NS0, NS1, NS2,NS3;
wire [15:0]T1, T2, T3, T4, T5, T6, T7, T8,T9,T10,T11,T12,T13,T14,T15,T16;

mux16_16x1_not a1(NS0, S0);
mux16_16x1_not a2(NS1, S1);
mux16_16x1_not a3(NS2, S2);
mux16_16x1_not a4(NS3, S3);

mux16_16x1_and u1(T1, D0, NS0, NS1, NS2, NS3);
mux16_16x1_and u2(T2, D1, S0, NS1, NS2, NS3);
mux16_16x1_and u3(T3, D2, NS0, S1, NS2, NS3);
mux16_16x1_and u4(T4, D3, S0, S1, NS2, NS3);
mux16_16x1_and u5(T5, D4, NS0, NS1, S2, NS3);
mux16_16x1_and u6(T6, D5, S0, NS1, S2, NS3);
mux16_16x1_and u7(T7, D6, NS0, S1, S2, NS3);
mux16_16x1_and u8(T8, D7, S0, S1, S2, NS3);
mux16_16x1_and u9(T9, D8, NS0, NS1, NS2, S3);
mux16_16x1_and u10(T10, D9, S0, NS1, NS2, S3);
mux16_16x1_and u11(T11, D10, NS0, S1, NS2, S3);
mux16_16x1_and u12(T12, D11, S0, S1, NS2, S3);
mux16_16x1_and u13(T13, D12, NS0, NS1, S2, S3);
mux16_16x1_and u14(T14, D13, S0, NS1, S2, S3);
mux16_16x1_and u15(T15, D14, NS0, S1, S2, S3);
mux16_16x1_and u16(T16, D15, S0, S1, S2, S3);
mux16_16x1_or u17(out, T1, T2, T3, T4, T5, T6, T7, T8,T9,T10,T11,T12,T13,T14,T15,T16);
endmodule
