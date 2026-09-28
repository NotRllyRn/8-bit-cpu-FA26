module register_file_driver;

logic clk;
logic reset;
logic write;

logic [7:0] data_in;
logic [7:0] data_out_a;
logic [7:0] data_out_b;

logic [1:0] read_address_a;
logic [1:0] read_address_b;
logic [1:0] write_address;

clock clock_inst(
    .clk(clk)
);

register_file register_file_inst(
    .clk(clk),
    .data_in(data_in),
    .data_out_a(data_out_a),
    .data_out_b(data_out_b),
    .read_address_a(read_address_a),
    .read_address_b(read_address_b),
    .reset(reset),
    .write(write),
    .write_address(write_address)
);

initial begin
    reset = 1;

    @(negedge clk);

    reset = 0;

    data_in = 66;
    write_address = 2'b10;
    write = 1;

    @(negedge clk);

    write = 0;
    write_address = 2'b11;

    read_address_a = 2'b10;
    read_address_b = 2'b11;

    $strobe("data_a: %d\ndata_b: %d", data_out_a, data_out_b);

    @(negedge clk);

    write = 1;
    write_address = 2'b11;
    read_address_a = 2'b00;

    data_in = 20;

    @(negedge clk);

    $strobe("data_a: %d\ndata_b: %d", data_out_a, data_out_b);

    $finish;
end

endmodule