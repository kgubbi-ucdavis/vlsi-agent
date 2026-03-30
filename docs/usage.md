# Usage Guide

## Modes

VLSI-Agent has two modes of operation:

### Wrap Mode (Recommended)

Wraps your EDA tool and monitors its output in real time. Errors are analyzed as they occur.

```bash
eda-sentinel wrap -- <your command>
```

Examples:
```bash
eda-sentinel wrap -- vcs -sverilog top.sv
eda-sentinel wrap -- dc_shell -f synth.tcl
eda-sentinel wrap -- icc2_shell -f pnr.tcl
eda-sentinel wrap -- pt_shell -f timing.tcl
eda-sentinel wrap -- verdi -sv top.sv
```

Your tool runs exactly as it normally would. VLSI-Agent adds real-time error analysis on top.

### Watch Mode

Monitors a directory for log file changes. Useful when you want to monitor logs from a tool already running.

```bash
eda-sentinel watch /path/to/log/directory
```

Example:
```bash
# Terminal 1: start monitoring
eda-sentinel watch .

# Terminal 2: run your tool (its logs appear in current directory)
vcs -sverilog design.sv
```

## Command-Line Options

```
eda-sentinel [options] <mode> [mode-options]
```

| Option | Description |
|--------|-------------|
| `-v` | Show info-level logs |
| `-vv` | Show debug-level logs |
| `--tool vcs\|dc\|icc2\|pt\|verdi` | Force a specific parser (default: auto-detect) |
| `--severity error` | Only show errors (skip warnings) |
| `--severity warning` | Only show warnings |
| `--quiet-period SECONDS` | Debouncer quiet period (default: 1.0) |

### Examples

```bash
# VCS with only errors (no warnings)
eda-sentinel --severity error wrap -- vcs -sverilog top.sv

# Force DC parser
eda-sentinel --tool dc wrap -- dc_shell -f synth.tcl

# Debug logging to file
eda-sentinel -vv wrap -- vcs -sverilog top.sv 2> session.log

# Watch mode with info logs
eda-sentinel -v watch /proj/logs
```

## Feedback

After each LLM analysis, you are prompted to rate the response:

```
Rate this analysis:  1=good  2=okay  3=bad  s=skip
Feedback [1/2/3/s] (s):
```

- Press `1` for helpful analysis
- Press `2` for okay/neutral
- Press `3` for unhelpful analysis
- Press `Enter` or `s` to skip

Your feedback helps improve the quality of error analysis.

## Config File (Optional)

VLSI-Agent works out of the box with just your access token. If you want to override defaults, create `~/.eda-sentinel.json`:

```json
{
  "tool": "vcs",
  "severity_filter": ["error"]
}
```

These can also be set via command-line flags.

## Log Files

In wrap mode, VLSI-Agent saves a log of the tool's output:

```
<tool>_<timestamp>.log
```

For example: `vcs_20260324_143022.log`

The log path is shown at the end of each session.
