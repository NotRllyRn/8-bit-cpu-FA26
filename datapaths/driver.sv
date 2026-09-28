module datapath_ALU_driver;

logic clk;
logic write;
logic reset;

logic [2:0] operation;

logic [1:0] read_address_a;
logic [1:0] read_address_b;
logic [1:0] write_address;

logic [7:0] external_data;
logic use_external_data;

logic [7:0] output_a;
logic [7:0] output_b;

clock clock_inst(
    .clk(clk);
);

datapath_ALU datapath_ALU_inst(
    .clk(clkl),
    .external_data(external_data),
    .operation(operation),
    .read_address_a(read_address_a),
    .read_address_b(read_address_b),
    .reset(reset),
    .use_external_data(use_external_data),
    .write(write),
    .write_address(write_address),
    .output_a(output_a),
    .output_b(output_b),
);

initial begin
    reset = 1;
    use_external_data = 1;

    @(negedge clk);

    reset = 0;
    write = 1;
    write_address = 2'b01;
    external_data = 55;

    @(negedge clk);

    write_address = 2'b10;
    external_data = 22;

    @(negedge clk);

    

    $finish
end


endmodule