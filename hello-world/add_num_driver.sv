module add_num_driver;

logic [7:0] a;
logic [7:0] b;
logic [7:0] result;

test dut (
    .a(a),
    .b(b),
    .result(result)
);

initial begin
    a = 160;
    b = 130;

    #1;

    $display("a=%d b=%d result=%d", a, b, result);

    $finish;
end

endmodule