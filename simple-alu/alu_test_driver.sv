module alu_test_driver;

logic [7:0] a;
logic [7:0] b;
logic [2:0] op;
logic [7:0] result;
logic carry;
logic zero;

ALU dut (
    .a(a),
    .b(b),
    .op(op),
    .result(result),
    .carry(carry),
    .zero(zero)
);

task test_case(
    input string operation_name,
    input logic [7:0] test_a,
    input logic [7:0] test_b,
    input logic [2:0] test_op,

    input logic [7:0] expected,
    input logic expected_carry,
    input logic expected_zero
);
    a = test_a;
    b = test_b;
    op = test_op;

    #1;

    if (result == expected && carry == expected_carry && zero == expected_zero) begin
        $display("PASS: %s", operation_name);
    end else begin
        $display("FAIL: %s", operation_name);
        $display("expected: %b C: %b Z: %b", expected, expected_carry, expected_zero);
        $display("result: %b C: %b Z: %b", result, carry, zero);
    end
endtask

initial begin
    test_case("ADD", 40, 50, 3'b000, 90, 0, 0);
    test_case("ADD", 255, 1, 3'b000, 0, 1, 1);
    test_case("ADD", 255, 2, 3'b000, 1, 1, 0);

    test_case("SUB", 50, 40, 3'b001, 10, 0, 0);
    test_case("SUB", 200, 200, 3'b001, 0, 0, 1);

    test_case("AND", 5, 7, 3'b010, 5, 0, 0);
    test_case("OR", 5, 6, 3'b011, 7, 0, 0);

    test_case("XOR", 5, 6, 3'b100, 3, 0, 0);
    test_case("XOR", 60, 60, 3'b100, 0, 0, 1);

    test_case("SL", 5, 0, 3'b101, 10, 0, 0);
    test_case("SL", 255, 0, 3'b101, 254, 1, 0);

    test_case("SR", 8, 0, 3'b110, 4, 0, 0);
    test_case("SR", 255, 0, 3'b110, 127, 1, 0);

    test_case("NOT", 255, 0, 3'b111, 0, 0, 1);
    test_case("NOT", 254, 0, 3'b111, 1, 0, 0);
end

endmodule