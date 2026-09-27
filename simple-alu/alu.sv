module ALU (
    input logic [7:0] a,
    input logic [7:0] b,
    input logic [2:0] op,

    output logic [7:0] result,
    output logic zero,
    output logic carry
);

always_comb begin
    carry = 0;

    case (op)
        3'b000: {carry, result} = a + b; // add
        3'b001: result = a - b; // sub
        3'b010: result = a & b; // AND
        3'b011: result = a | b; // OR
        3'b100: result = a ^ b; // XOR
        3'b101: {carry, result} = {a, 1'b0}; // SL
        3'b110: {result, carry} = {1'b0, a}; // SR
        3'b111: result = ~a; // NOT
        default: result = a;
    endcase

    zero = result == 0;
end

endmodule