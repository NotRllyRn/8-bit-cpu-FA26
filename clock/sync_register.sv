module sync_register (
    input logic [7:0] data_in,
    input logic clk,
    input logic reset,
    input logic enable,

    output logic [7:0] stored_data
);

always_ff @(posedge clk) begin
    if (reset)
        stored_data <= 0;
    else if (enable)
        stored_data <= data_in;
end

endmodule