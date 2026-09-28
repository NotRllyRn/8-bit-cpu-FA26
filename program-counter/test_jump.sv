module jump_test_driver;

logic [7:0] count;
logic clk;
logic reset;
logic enable;
logic load;
logic [7:0] load_address;

clock clock_inst(
    .clk(clk)
);

program_counter PC_inst(
    .count(count),
    .reset(reset),
    .clk(clk),
    .enable(enable),
    .load(load),
    .load_address(load_address)
);

initial begin
    // first enable and reset the register
    enable = 1;
    reset = 1;

    $strobe("output: %d %b", count, reset);

    @(posedge clk);
    @(negedge clk);

    reset = 0;

    $strobe("output: %d %b", count, reset);

    @(posedge clk);
    @(negedge clk);
    enable = 0;

    load = 1;
    load_address = 158;

    $strobe("output: %d %b", count, reset);

    @(posedge clk);
    @(negedge clk);

    enable = 1;
    load = 0;

    $strobe("output: %d %b", count, reset);

    @(posedge clk);

    $strobe("output: %d %b", count, reset);

    @(posedge clk);

    $strobe("output: %d %b", count, reset);

    @(posedge clk);

    $strobe("output: %d %b", count, reset);

    @(posedge clk);

    $strobe("output: %d %b", count, reset);

    $finish;
end

endmodule