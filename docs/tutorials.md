# Tutorials

## Tutorial 1: VCS Compilation

Monitor a VCS SystemVerilog compilation for errors.

```bash
# Wrap your VCS command
eda-sentinel wrap -- vcs -sverilog -full64 top.sv testbench.sv

# With specific flags
eda-sentinel wrap -- vcs -sverilog -debug_access+all -full64 top.sv
```

When VCS encounters errors like `Error-[SV-MTU]` or `Error-[SV-MTP]`, VLSI-Agent will:
1. Detect the error in real time
2. Display an error summary table
3. Query the LLM with the error context
4. Show the analysis with fix suggestions
5. Ask for your feedback

## Tutorial 2: Design Compiler Synthesis

Monitor a DC synthesis run.

```bash
# Interactive session
eda-sentinel wrap -- dc_shell

# Script-based run
eda-sentinel wrap -- dc_shell -f synthesis.tcl

# With topology mode
eda-sentinel wrap -- dc_shell-xg-t -f synth.tcl
```

DC errors like `Error: CMD-005` or `Warning: UID-4` are automatically detected and analyzed.

## Tutorial 3: IC Compiler II Place & Route

```bash
eda-sentinel wrap -- icc2_shell -f pnr_flow.tcl
```

## Tutorial 4: PrimeTime Timing Analysis

```bash
eda-sentinel wrap -- pt_shell -f sta.tcl
```

## Tutorial 5: Watch Mode with Existing Logs

If you already have a tool running and want to monitor its log directory:

```bash
# Terminal 1: start watching
eda-sentinel watch /proj/user/run_dir

# Terminal 2: your tool writes logs to that directory
dc_shell -f synth.tcl | tee /proj/user/run_dir/dc_synth.log
```

## Tutorial 6: Testing Without Synopsys Tools

You can test VLSI-Agent without any Synopsys tools installed.

### Option A: Wrap Mode with Test Script

```bash
# Create test script
echo '#!/bin/bash
echo "Starting VCS compilation..."
sleep 2
echo "Error-[SV-MTU]: Module top_unit not found"
sleep 3
echo "Warning-[SV-LCM-PPWI]: Potential port width mismatch"
sleep 3
echo "Error-[SV-MTP]: Missing type parameter for module alu"
sleep 3
echo "Compilation done."' > /tmp/fake_vcs.sh && chmod +x /tmp/fake_vcs.sh

# Run it
eda-sentinel wrap -- bash /tmp/fake_vcs.sh
```

### Option B: Watch Mode with Manual Log Entries

```bash
# Terminal 1
eda-sentinel watch .

# Terminal 2 (write errors to a log file)
echo 'Error-[SV-MTU]: Module top_unit not found' >> test_vcs.log
sleep 3
echo 'Error-[SV-MTP]: Missing type parameter for module alu' >> test_vcs.log
```

### Option C: DC Shell Errors

```bash
# Terminal 1
eda-sentinel watch .

# Terminal 2
echo 'Error: CMD-005 (some_proc) some_command is not defined' >> test_dc.log
sleep 3
echo 'Warning: UID-4 (some_block) variable x is not defined' >> test_dc.log
```

## Tutorial 7: Debug Logging

If something isn't working, enable verbose logging:

```bash
# Info-level logs
eda-sentinel -v wrap -- vcs -sverilog top.sv

# Debug-level logs (most detail)
eda-sentinel -vv wrap -- vcs -sverilog top.sv

# Save debug logs to a file for sharing
eda-sentinel -vv wrap -- vcs -sverilog top.sv 2> debug_session.log
```

Send the `debug_session.log` file to your admin for troubleshooting.
