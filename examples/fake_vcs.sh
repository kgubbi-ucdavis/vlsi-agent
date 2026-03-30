#!/bin/bash
# Test script that simulates VCS compilation errors.
# Use this to verify VLSI-Agent works without Synopsys tools.
#
# Usage:
#   eda-sentinel wrap -- bash examples/fake_vcs.sh

echo "Starting VCS compilation..."
sleep 2
echo "Error-[SV-MTU]: Module top_unit not found"
sleep 3
echo "Warning-[SV-LCM-PPWI]: Potential port width mismatch"
sleep 3
echo "Error-[SV-MTP]: Missing type parameter for module alu"
sleep 3
echo "Compilation done."
