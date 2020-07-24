//------------------------------------------------
// Testbench for MIPS processor
module testbench();

  reg        clk;
  reg        reset;

  wire [31:0] writedata, dataadr;
  wire        memwrite;


  // instantiate device to be tested
  top dut(clk, reset, writedata, dataadr, memwrite);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // check that 7 gets written to address 84
 
  always@(negedge clk)
    begin
    	$display("dataadr ...", dataadr);
    $display("writedata ...", writedata);
    $display("memwrite ...", memwrite);
    $display("\n");
      if(memwrite) begin
        if(dataadr === 84 & writedata === 7) begin
          $display("\nSimulation succeeded");
          $stop;
        end else if (dataadr !== 80) begin
          $display("\nSimulation failed");
          $stop;
        end
      end
    end
    	initial begin
		$dumpfile("lab09.vcd");	
		$dumpvars;
	end	

endmodule



