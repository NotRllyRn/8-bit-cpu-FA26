module clock (
    output logic clk
);

initial begin
    clk = 0;
end

always begin
    #5;

    clk = ~clk;
end

endmodule