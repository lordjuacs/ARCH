//------------------------------------------------
// Testbench for MIPS processor
module testbench();

  reg        clk, reset, zero;
  reg [5:0] opcode, funct;
  
  wire pcen, memwrite, irwrite, regwrite,
  		alusrca, iord, memtoreg, regdst;
  wire [1:0] alusrcb, pcsrc;
  wire [2:0] alucontrol;

  // instantiate device to be tested
  controller cont(clk, reset, opcode, funct, zero, 
            pcen, memwrite, irwrite, regwrite,
  				  alusrca, iord, memtoreg, regdst, alusrcb, pcsrc, 
            alucontrol);
  
  // initialize test
  initial
    begin
      reset <= 1; # 10; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  initial begin
        opcode = 6'b000000; funct = 6'b100000; zero = 0; //add - 4 cycles
  	#40 opcode = 6'b000000; funct = 6'b100010; zero = 0; //sub - 4 cycles
  	#40 opcode = 6'b000000; funct = 6'b100100; zero = 0; //and - 4 cycles
  	#40 opcode = 6'b000000; funct = 6'b100101; zero = 0; //or  - 4 cycles
  	#40 opcode = 6'b000000; funct = 6'b101010; zero = 0; //slt - 4 cycles
  	#40	opcode = 6'b100011; funct = 6'bx; zero = 0; //lw - 5 cycles
  	#50 opcode = 6'b101011; funct = 6'bx; zero = 0; //sw - 4 cycles
  	#40 opcode = 6'b000100; funct = 6'bx; zero = 0; //beq - 3 cycles
  	#30 opcode = 6'b000100; funct = 6'bx; zero = 1; //beq - 3 cycles
  	#30 opcode = 6'b001000; funct = 6'bx; zero = 0; //addi - 4 cycles
  	#40 opcode = 6'b000010; funct = 6'bx; zero = 0; //j - 3 cycles
    #30 $finish;
  	
  end
  	
    	initial begin
		$dumpfile("lab08.vcd");	
		$dumpvars;
	end	

endmodule
