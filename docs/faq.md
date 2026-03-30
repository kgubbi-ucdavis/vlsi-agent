# FAQ & Troubleshooting

## Installation Issues

### "not a supported wheel on this platform"
Your Python version doesn't match the wheel. The wheel requires Python 3.12.

```bash
python --version  # Check your version
```

Fix: install Python 3.12 via conda:
```bash
conda create -n vlsi-agent python=3.12 -y
conda activate vlsi-agent
pip install dist/eda_sentinel-1.1.0-cp312-cp312-linux_x86_64.whl
```

### "command not found: eda-sentinel"
The package installed but the binary isn't on your PATH.

```bash
# Find where it installed
pip show eda-sentinel

# Try running directly
python -m eda_sentinel --help
```

## Runtime Issues

### "Error querying proxy: Error code: 401"
Your customer token is invalid or not set.

```bash
# Check if token is set
echo $EDA_CUSTOMER_TOKEN

# Set it
export EDA_CUSTOMER_TOKEN=cust_XXXXXXXXXXXX
```

If the token is set but still fails, contact your admin for a new token.

### "No LLM client configured"
Your token is not set:

```bash
# Check token
echo $EDA_CUSTOMER_TOKEN

# Set it
export EDA_CUSTOMER_TOKEN=cust_XXXXXXXXXXXX
```

### "inotify watch limit reached"
The watch directory is too large. Use wrap mode instead, or watch a specific subdirectory:

```bash
# Instead of watching ~
eda-sentinel watch /specific/log/directory
```

### Tool doesn't detect errors
- Make sure your tool is producing output that matches known error patterns
- Try using `-v` flag to see info logs: `eda-sentinel -v wrap -- <command>`
- Try using `-vv` flag for full debug: `eda-sentinel -vv wrap -- <command> 2> debug.log`
- Check the log file was created in the current directory

### LLM response doesn't appear
- Check your token is valid (see 401 error above)
- The debouncer waits 1 second of quiet before processing. For fast-running commands, errors may be processed after the tool exits.

### Feedback prompt doesn't appear
- Feedback only appears when connected to the proxy server
- Make sure your token is set and the proxy is reachable
- Update to the latest wheel: `pip install --force-reinstall <wheel>`

## General Questions

### Does VLSI-Agent modify my tool's behavior?
No. VLSI-Agent wraps your tool transparently. Your tool runs exactly as it would without VLSI-Agent. All input and output passes through unchanged.

### What data is sent to the LLM?
Only the error/warning messages and surrounding context lines from your tool's output. Source code files are never sent.

### Can I use this on macOS?
The provided wheel is for Linux x86_64. Contact your admin for a macOS build if needed.

### Does it work with tools not listed?
VLSI-Agent currently supports VCS, Design Compiler, IC Compiler II, PrimeTime, and Verdi. Other tools may work in watch mode if they produce standard Synopsys error formats.
