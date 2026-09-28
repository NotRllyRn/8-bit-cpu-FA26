module program_counter(
    input logic reset,
    input logic clk,
    input logic enable,
    
    input logic load,
    input logic [7:0] load_address,

    output logic [7:0] count
);

logic [7:0] next_count;

sync_register PC_reg(
    .reset(reset),
    .clk(clk),
    .data_in(next_count),
    .stored_data(count),
    .enable(enable || load)
);

always_comb begin
    if (load)
        next_count = load_address;
    else
        next_count = count + 1;
end

endmodule