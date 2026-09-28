module register_file(
    input logic [7:0] data_in,
    input logic [1:0] read_address_a,
    input logic [1:0] read_address_b,
    input logic [1:0] write_address,
    
    input logic write,
    input logic clk,
    input logic reset,

    output logic [7:0] data_out_a,
    output logic [7:0] data_out_b
);

logic select_r0;
logic select_r1;
logic select_r2;
logic select_r3;

logic [7:0] output_r0;
logic [7:0] output_r1;
logic [7:0] output_r2;
logic [7:0] output_r3;

sync_register reg_r0 (
    .clk(clk),
    .data_in(data_in),
    .reset(reset),

    .enable(select_r0),
    .stored_data(output_r0)
);

sync_register reg_r1 (
    .clk(clk),
    .data_in(data_in),
    .reset(reset),

    .enable(select_r1),
    .stored_data(output_r1)
);

sync_register reg_r2 (
    .clk(clk),
    .data_in(data_in),
    .reset(reset),

    .enable(select_r2),
    .stored_data(output_r2)
);

sync_register reg_r3 (
    .clk(clk),
    .data_in(data_in),
    .reset(reset),

    .enable(select_r3),
    .stored_data(output_r3)
);

always_comb begin
    select_r0 = 0;
    select_r1 = 0;
    select_r2 = 0;
    select_r3 = 0;

    case (read_address_a)
        2'b00: data_out_a = output_r0;
        2'b01: data_out_a = output_r1;
        2'b10: data_out_a = output_r2;
        2'b11: data_out_a = output_r3;
        default: data_out_a = 0;
    endcase

    case (read_address_b)
        2'b00: data_out_b = output_r0;
        2'b01: data_out_b = output_r1;
        2'b10: data_out_b = output_r2;
        2'b11: data_out_b = output_r3;
        default: data_out_b = 0;
    endcase

    if (write) begin
        case (write_address)
            2'b00: select_r0 = 1;
            2'b01: select_r1 = 1;
            2'b10: select_r2 = 1;
            2'b11: select_r3 = 1;
        endcase
    end
end

endmodule