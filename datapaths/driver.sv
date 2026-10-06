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

logic write_flags;
logic [7:0] flags_out;

logic [7:0] output_a;
logic [7:0] output_b;

clock clock_inst(
    .clk(clk)
);

datapath_ALU datapath_ALU_inst(
    .clk(clk),
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
    .write_flags(write_flags),
    .flags_out(flags_out)
);

task automatic posedge_clk(int n = 1);
  repeat (n) @(posedge clk); #1ps;
endtask

initial begin
    write_flags = 1;
    reset = 1;
    use_external_data = 1;

    posedge_clk;

    reset = 0;
    write = 1;
    write_address = 2'b01;
    external_data = 3;

    posedge_clk;

    write_address = 2'b10;
    external_data = 2;

    posedge_clk;

    use_external_data = 0;

    read_address_a = 2'b01;
    read_address_b = 2'b10;

    write_address = 2'b10;

    operation = 3'b000; // add

    posedge_clk;

    $display("addr_a: %d addr_b: %d", output_a, output_b);

    posedge_clk;

    $display("result: %d", output_b);

    posedge_clk;

    $display("result: %d", output_b);

    posedge_clk;

    $display("result: %d", output_b);

    use_external_data = 1;
    write_address = 2'b01;
    external_data = 14;

    posedge_clk;

    $display("addr_a: %d addr_b: %d", output_a, output_b);

    write_address = 2'b10;
    use_external_data = 0;

    operation = 3'b001; // sub

    posedge_clk;

    $display("result: %d", output_b);

    $display("zero: %b carry: %b", flags_out[0], flags_out[1]);

    write_flags = 0;

    posedge_clk;

    $display("result: %d", output_b);

    $display("zero: %b carry: %b", flags_out[0], flags_out[1]);

    posedge_clk;

    $display("result: %d", output_b);

    $display("zero: %b carry: %b", flags_out[0], flags_out[1]);

    $finish;
end


endmodule