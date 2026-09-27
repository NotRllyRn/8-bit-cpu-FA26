module test_reg;

logic clk;
logic [7:0] data_in;
logic [7:0] stored;
logic reset;
logic enable = 1;

clock clock_instance (
    .clk(clk)
);

sync_register register_instance (
    .data_in(data_in),
    .clk(clk),
    .stored_data(stored),
    .reset(reset),
    .enable(enable)
);

initial begin

    reset = 1;

    @(posedge clk);

    $strobe("output: %d %b", stored, reset);

    data_in = 2;

    @(posedge clk);

    $strobe("output: %d %b", stored, reset);

    @(posedge clk);

    reset = 0;

    $strobe("output: %d %b", stored, reset);

    $finish;
end

endmodule