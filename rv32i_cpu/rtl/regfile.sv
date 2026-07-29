module regfile (
    input logic clk,
    input logic [15:0] data_in,
    input logic [2:0] writenum, 
    input logic write,
    input logic [2:0] readnum,
    output logic [15:0] data_out
);

    // declare internal signals
    logic [7:0] decoder_out;        // decoder output
    logic [15:0] registers [7:0];   // 8 registers of 16 bits each

    // instantiate the decoder module
    decoder U0(
        .writenum(writenum),
        .write(write),
        .out(decoder_out)
    );

    // instantiate load_en register R0 - R7
    genvar i;
    generate
        for (i =0; i<8; i= i+1) begin: load_reg_inst
            load_reg U(
                .clk(clk),
                .in(data_in),
                .load(decoder_out[i]),
                .out(registers[i])
            );
        end
    endgenerate

    // 3:8 MUX to select the output register based on readnum
    always_comb begin
        case (readnum)
            3'b000: data_out = registers[0];
            3'b001: data_out = registers[1];
            3'b010: data_out = registers[2];
            3'b011: data_out = registers[3];
            3'b100: data_out = registers[4];
            3'b101: data_out = registers[5];
            3'b110: data_out = registers[6];
            3'b111: data_out = registers[7];
            default: data_out = 16'b0;
        endcase
    end

endmodule;