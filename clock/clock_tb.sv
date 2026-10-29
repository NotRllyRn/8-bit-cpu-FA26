`timescale 1ns/1ps

module clock_tb;

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

    input logic expected,
    input int repetitions = 0
);
    // reset and wait for clock to return to 0
    @(negedge clk);

    repeat (repetitions) #5;

    // check result

    assert (clk == expected) begin
        $display("PASS: %s", operation_name);
    end else begin
        $error("FAIL: %s\nexpected: %b\nactual:   %b",
            operation_name,
            expected,
            clk);
    end
endtask

initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0);

    // define and run the test cases

    test_case("upon start", 0);
    test_case("after 1 clock cycle", 1, 1);
    test_case("upon start", 0, 2);

    test_case("50 cycles", 0, 50);

    $finish;
end


endmodule