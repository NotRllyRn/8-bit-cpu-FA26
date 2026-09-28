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

    output logic [7:0] output_a,
    output logic [7:0] output_b,
);

logic [7:0] data_in;
logic [7:0] data_out_a;
logic [7:0] data_out_b;

logic [7:0] alu_result;

register_file register_file_inst(
    .clk(clk),
    .data_in(data_in),
    .data_out_a(data_out_a),
    .data_out_b(data_out_b),
    .read_address_a(read_address_a),
    .read_address_b(read_address_b),
    .reset(reset),
    .write(write),
    .write_address(write_address),
);

ALU ALU_inst(
    .a(data_out_a),
    .b(data_out_b),
    .op(operation),
    .result(alu_result),
);

always_comb begin
    output_a = data_out_a;
    output_b = data_out_b;

    if (use_external_data)
        data_in = external_data;
    else
        data_in = alu_result;
end

endmodule