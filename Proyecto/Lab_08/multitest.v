//------------------------------------------------
// Testbench for MIPS processor
//------------------------------------------------

module testbench();

  reg        clk, reset, zero;
  reg [5:0] opcode, funct;
  
  wire pcen, memwrite, irwrite, regwrite,
  		alusrca, iord, memtoreg, regdst;
  wire [1:0] alusrcb, pcsrc;
  wire [2:0] alucontrol;

  // instantiate device to be tested
  controller cont(clk, reset, opcode, funct, zero, pcen, memwrite, irwrite, regwrite,
  				  alusrca, iord, memtoreg, regdst, alusrcb, pcsrc, alucontrol);
  
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
  		opcode = 6'b100011; funct = 6'bx; zero = 0; //lw
  	#50 opcode = 6'b101011; funct = 6'bx; zero = 0; //sw
  	#40 opcode = 6'b000100; funct = 6'bx; zero = 0; //beq - not taken
  	#30 opcode = 6'b000100; funct = 6'bx; zero = 1; //beq - taken
  	#30 opcode = 6'b001000; funct = 6'bx; zero = 0; //addi
  	#40 opcode = 6'b000010; funct = 6'bx; zero = 0; //j
  	
  	#30 opcode = 6'b000000; funct = 6'b100000; zero = 0; //add
  	#40 opcode = 6'b000000; funct = 6'b100010; zero = 0; //sub
  	#40 opcode = 6'b000000; funct = 6'b100100; zero = 0; //and
  	#40 opcode = 6'b000000; funct = 6'b100101; zero = 0; //or
  	#40 opcode = 6'b000000; funct = 6'b101010; zero = 0; //slt
  	#40	$finish;
  end
  	
    	initial begin
		$dumpfile("lab08.vcd");	
		$dumpvars;
	end	

endmodule



