`timescale 1ns/1ps

module tb_regfile ();

    // -----------------------------
    // DUT signals 
    // -----------------------------
    logic clk;
    logic [15:0] data_in;
    logic [2:0] writenum; 
    logic write;
    logic [2:0] readnum;
    logic [15:0] data_out;


    // -----------------------------
    // instantitate DUT
    // -----------------------------
    regfile DUT(
        .clk(clk),
        .data_in(data_in),
        .writenum(writenum),
        .write(write),
        .readnum(readnum),
        .data_out(data_out)
    );

    // -----------------------------
    // clock generation
    // -----------------------------
    initial clk = 0;
    always #10 clk = ~clk;


    // -----------------------------
    // test sequence
    // -----------------------------
    initial begin
        
        // initialize inputs
        data_in = 16'b0;
        writenum = 3'b0;
        write = 1'b0;
        readnum = 3'b0;


        // test 1: -----------------------------------------------------------------------
        // write 16'hABCD to register 0
        writenum = 3'b000; data_in = 16'hABCD; write = 1'b1; 
        @(posedge clk); #5; 
        
        write = 1'b0;
        assert(DUT.registers[0] == 16'hABCD)  // probe internal signal
            else $fatal("TEST1: Expected: reg[0] == 16'hABCD, got %h", DUT.registers[0]); 
  

        // read 16'hABCD from register 0
        readnum = 3'b000; 
        assert(data_out ==  16'hABCD) 
            else $fatal("TEST1: Expected: data_out == 16'hABCD, got %h", data_out);
        
        #5;

        // test 2: -----------------------------------------------------------------------
        // write 16'hDBCA to register 1
        writenum = 3'b001; data_in = 16'hDBCA; write = 1'b1; 
        @(posedge clk); #5; 
        
        write = 1'b0;
        assert(DUT.registers[1] == 16'hDBCA) 
            else $fatal("TEST2: Expected: reg[1] == 16'hDBCA, got %h", DUT.registers[1]); 
 

        // read 16'hDBCA from register 1
        readnum = 3'b001; #1;
        assert(data_out ==  16'hDBCA) 
            else $fatal("TEST2: Expected: data_out == 16'hDBCA, got %h", data_out);
        
        #5;

        // test 3:-----------------------------------------------------------------------
        // write 16'h1234 to register 2
        writenum = 3'b010; data_in = 16'h1234; write = 1'b1; 
        @(posedge clk); #5; 
        
        write = 1'b0;
        assert(DUT.registers[2] == 16'h1234)  
            else $fatal("TEST3: Expected: reg[2] == 16'h1234, got %h", DUT.registers[2]); 
  

        // read 16'h1234 from register 2
        readnum = 3'b010; #1;
        assert(data_out ==  16'h1234) 
            else $fatal("TEST3: Expected: data_out == 16'h1234, got %h", data_out);
        
        #5;

        // test 4: -----------------------------------------------------------------------
        // write 16'h5678 to register 3
        writenum = 3'b011; data_in = 16'h5678; write = 1'b1; 
        @(posedge clk); #5;

        write = 1'b0;   
        assert(DUT.registers[3] == 16'h5678)  
            else $fatal("TEST4: Expected: reg[3] == 16'h5678, got %h", DUT.registers[3]);

        // read 16'h5678 from register 3
        readnum = 3'b011; #1;
        assert(data_out ==  16'h5678)
            else $fatal("TEST4: Expected: data_out == 16'h5678, got %h", data_out);
        
        #5;    

        // test 5: -----------------------------------------------------------------------
        // write 16'h1234 to register 4
        writenum = 3'b100; data_in = 16'h1234; write = 1'b1; 
        @(posedge clk); #5;

        write = 1'b0;  
        assert(DUT.registers[4] == 16'h1234) 
            else $fatal("TEST5: Expected: reg[4] == 16'h1234, got %h", DUT.registers[4]);
         

        // read 16'h1234 from register 4
        readnum = 3'b100; #1;
        assert(data_out ==  16'h1234)
            else $fatal("TEST5: Expected: 16'h1234, got %h", data_out);
        
        #5;   

        // test 6: -----------------------------------------------------------------------
        // write 16'h5678 to register 5
        writenum = 3'b101; data_in = 16'h5678; write = 1'b1; 
        @(posedge clk); #5;
        
        write = 1'b0;
        assert(DUT.registers[5] == 16'h5678)  
            else $fatal("TEST6: Expected: reg[5] == 16'h5678, got %h", DUT.registers[5]);
        

        // read 16'h5678 from register 5
        readnum = 3'b101; #1;
        assert(data_out ==  16'h5678)
            else $fatal("TEST6: Expected: 16'h5678, got %h", data_out);
        
        #5;

        // test 7: -----------------------------------------------------------------------
        // write 16'h9ABC to register 6
        writenum = 3'b110; data_in = 16'h9ABC; write = 1'b1; 
        @(posedge clk); #5;

        write = 1'b0;
        assert(DUT.registers[6] == 16'h9ABC)  
            else $fatal("TEST7: Expected: reg[6] == 16'h9ABC, got %h", DUT.registers[6]);
           

        // read 16'h9ABC from register 6
        readnum = 3'b110; #1;
        assert(data_out ==  16'h9ABC)
            else $fatal("TEST7: Expected: 16'h9ABC, got %h", data_out);
        
        #5;    

        $display("All tests passed!");
        $stop(0);
    end

endmodule: tb_regfile