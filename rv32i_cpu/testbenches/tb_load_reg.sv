`timescale 1ns/1ps

module tb_load_reg();

    // DUT signals 
    logic clk,
    logic load,
    logic [15:0] in,
    logic [15:0] out

    // instantitate DUT
    load_reg DUT(
        .clk(clk),
        .load(load),
        .in(in),
        .out(out)
    );

    // clock generation
    initial clk = 0;
    always #10 clk = ~clk

    // test sequence
    initial begin
        
        // load sequence
        load = 1;    // load enabled
        in = 16'hABCD; 
        #20;
        assert(out == 16'hABCD) else $error("Expected out to be ABCD, but got %h", out);
        
        load = 0;   // load disabled
        #20;
        assert(out == 16'b0) else $error("Expected out to be 0, but got %h", out);
    end 

endmodule: tb_load_reg