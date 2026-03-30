#!/bin/bash
# Test script that simulates Design Compiler errors.
# Use this to verify VLSI-Agent works without Synopsys tools.
#
# Usage:
#   eda-sentinel wrap -- bash examples/fake_dc.sh

echo "dc_shell> read_verilog top.v"
sleep 2
echo "Error: CMD-005 (read_verilog) Command 'read_verilog' returned error"
sleep 3
echo "Warning: UID-4 (top) Variable 'clk_period' is not defined"
sleep 3
echo "Error: HDL-120 (top.v:42) Syntax error near token 'endmodule'"
sleep 3
echo "dc_shell> quit"
