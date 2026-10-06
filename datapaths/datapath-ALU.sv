module datapath_ALU(
    input logic clk,

    input logic [2:0] operation,

    input logic [1:0] read_address_a,
    input logic [1:0] read_address_b,
    input logic [1:0] write_address,

    input logic [7:0] external_data,
    input logic use_external_data,

    input logic write,
    input logic reset,
    input logic write_flags,

    output logic [7:0] output_a,
    output logic [7:0] output_b,
    output logic [7:0] flags_out
);

logic [7:0] data_in;
logic [7:0] flag_data_in;
logic alu_zero;
logic alu_carry;

logic [7:0] alu_result;

sync_register flags_register(
    .clk(clk),
    .data_in(flag_data_in),
    .reset(reset),
    .enable(write_flags),
    .stored_data(flags_out)
);

register_file register_file_inst(
    .clk(clk),
    .data_in(data_in),
    .data_out_a(output_a),
    .data_out_b(output_b),
    .read_address_a(read_address_a),
    .read_address_b(read_address_b),
    .reset(reset),
    .write(write),
    .write_address(write_address)
);

ALU ALU_inst(
    .a(output_a),
    .b(output_b),
    .op(operation),
    .result(alu_result),
    .zero(alu_zero),
    .carry(alu_carry)
);

always_comb begin
    flag_data_in = 0;

    flag_data_in[0] = alu_zero;
    flag_data_in[1] = alu_carry;

    if (use_external_data)
        data_in = external_data;
    else
        data_in = alu_result;
end

endmodule