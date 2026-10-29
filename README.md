# 8-bit CPU FA26

An 8-bit CPU implemented in SystemVerilog.

## Status

Initial project setup.

## Commands


Install Icarus Verilog (includes `iverilog` and `vvp`). On macOS:

```sh
brew install icarus-verilog
```

Run a testbench by its top-level module name:

```sh
./simulate datapath_ALU_driver
./simulate alu_tb
```

The script discovers `.sv` files recursively, compiles with SystemVerilog 2012
support, and runs the selected module. It stops if compilation fails and removes
the temporary compiled binary afterward. Relative waveform paths (such as
`sim.vcd`) are written in the project root, even when invoked from another directory.
