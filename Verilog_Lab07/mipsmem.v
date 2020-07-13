//------------------------------------------------
// mipsmemsingle.sv
// Updated to SystemVerilog - Harris Harris version
// External memories used by MIPS single-cycle
// processor
//------------------------------------------------

module dmem(input          clk, we,
            input   [31:0] a, wd,
            output  [31:0] rd);

   reg [31:0] RAM[63:0];

  assign rd = RAM[a[31:2]]; // word aligned

  always @(posedge clk)
    if (we)
      RAM[a[31:2]] <= wd;
endmodule

module imem(input   [5:0]  a,
            output  [31:0] rd);

   reg [31:0] RAM[63:0];

  initial
    begin
      $readmemh("memfile2.dat",RAM, 0, 11); // initialize memory

    end

  assign rd = RAM[a]; // word aligned
endmodule

