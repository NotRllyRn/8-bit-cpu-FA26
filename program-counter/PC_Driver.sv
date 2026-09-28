module PC_DRIVER;

logic [7:0] count;
logic clk;
logic reset;
logic enable;

clock clock_inst(
    .clk(clk)
);

program_counter PC_inst(
    .count(count),
    .reset(reset),
    .clk(clk),
    .enable(enable)
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

    $strobe("output: %d %b", count, reset);

    @(negedge clk);
    enable = 0;

    $strobe("output: %d %b", count, reset);

    @(posedge clk);

    $strobe("output: %d %b", count, reset);

    @(posedge clk);
    @(negedge clk);
    enable = 1;

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