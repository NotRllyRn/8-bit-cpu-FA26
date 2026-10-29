`timescale 1ns/1ps

module example_tb;

// define the inputs between components

logic clk;

// define the components

clock clock_inst(
    .clk(clk)
);

// wait for pos edge function
task automatic posedge_clk(int n = 1);
  repeat (n) @(posedge clk); #1ps;
endtask

// define the test structure
task test_case(
    input string operation_name,

    input logic [7:0] expected
);
    // perform setup

    posedge_clk;

    // check result

    assert (condition) begin
        $display("PASS: %s", operation_name);
    end else begin
        $error("FAIL: %s\nexpected: %b\nactual:   %b",
            operation_name,
            expected,
            result);
    end
endtask

initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0);

    // define and run the test cases

    test_case("Example", expected);

    $finish;
end


endmodule