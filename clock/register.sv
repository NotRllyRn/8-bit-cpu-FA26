module register (
    input logic [7:0] data_in,
    output logic [7:0] stored_data,
    input logic clk
);

always_ff @(posedge clk) begin
    stored_data <= data_in;
end

endmodule