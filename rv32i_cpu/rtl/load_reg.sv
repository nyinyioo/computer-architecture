module load_reg (
    input logic clk,
    input logic load,
    input logic [15:0] in,
    output logic [15:0] out
);


    always@(posedge clk) begin 
        out <= 16'b0; // default output
        if (load) begin 
            out <= in;
        end
    end

endmodule;