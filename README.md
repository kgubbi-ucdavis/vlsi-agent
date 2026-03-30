# VLSI-Agent

**Real-time VLSI log monitoring with LLM-powered error analysis.**

VLSI-Agent monitors your Synopsys EDA tool sessions in real time, detects errors and warnings, and provides instant AI-powered analysis and fix suggestions — right in your terminal.

This tool is developed as part of an ongoing research collaboration between UC Davis and UC San Diego.

## Supported Tools

| Tool | Description |
|------|-------------|
| VCS | Verilog/SystemVerilog compiler |
| Design Compiler (dc_shell) | RTL synthesis |
| IC Compiler II (icc2_shell) | Place & route |
| PrimeTime (pt_shell) | Static timing analysis |
| Verdi | Debug & waveform viewer |

## Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/kgubbi/vlsi_agent.git
cd vlsi_agent && git checkout product-release-v1

# 2. Create Python env and install (requires Python 3.12)
#    Option A: venv
python3 -m venv .venv && source .venv/bin/activate
#    Option B: conda (if Python 3.12 is not available)
#    conda create -n vlsi-agent python=3.12 -y && conda activate vlsi-agent

pip install dist/eda_sentinel-1.1.0-cp312-cp312-linux_x86_64.whl

# 3. Set your access token (provided by your admin)
export EDA_CUSTOMER_TOKEN=cust_XXXXXXXXXXXX

# 4. Run from your project directory
cd /path/to/your/project
eda-sentinel wrap -- vcs -sverilog design.sv
```

That's it. No config file needed — the server connection is built in.

All logs are saved in the directory you run the tool from.

See [Installation Guide](docs/installation.md) for full setup instructions.

## Documentation

- [Installation Guide](docs/installation.md) -- Full setup instructions
- [Usage Guide](docs/usage.md) -- All modes, options, and workflows
- [Tutorials](docs/tutorials.md) -- Step-by-step examples for each EDA tool
- [FAQ & Troubleshooting](docs/faq.md) -- Common issues and solutions

## How It Works

1. **Wrap** your EDA tool with `eda-sentinel wrap -- <command>`
2. VLSI-Agent runs your tool normally while monitoring its output
3. When errors or warnings are detected, they are sent to an LLM for analysis
4. You get instant, actionable fix suggestions right in your terminal
5. After each analysis, rate the response to help improve the tool

## Requirements

- Python 3.12
- Linux x86_64
- A valid access token

## Feedback

After each error analysis, rate the response (1=good, 2=okay, 3=bad). For detailed feedback, fill out our [feedback form](https://forms.gle/Rh3fTbzJ1dkY6BVN7).

## Support

Contact your administrator for token issues or feature requests.
