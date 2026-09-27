module test_reg;

logic clk;
logic [7:0] data_in;
logic [7:0] stored;

clock clock_instance (
    .clk(clk)
);

register register_instance (
    .data_in(data_in),
    .clk(clk),
    .stored_data(stored)
);

initial begin
    data_in = 1;

    #5;

    $display("output: %d", stored);

    data_in = 2;

    #1;

    $display("output: %d", stored);

    $finish;
end

endmodule