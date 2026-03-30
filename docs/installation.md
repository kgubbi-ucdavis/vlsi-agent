# Installation Guide

## Prerequisites

- **Python 3.12** (check with `python --version`)
- **Linux x86_64** (the compiled wheel is platform-specific)

## Step 1: Clone the Repository

```bash
git clone https://github.com/kgubbi/vlsi_agent.git
cd vlsi_agent
git checkout product-release-v1
```

## Step 2: Create Python Environment

**Option A: venv** (if Python 3.12 is available)
```bash
python3 -m venv .venv
source .venv/bin/activate
```

**Option B: conda** (if Python 3.12 is not available, no root needed)
```bash
conda create -n vlsi-agent python=3.12 -y
conda activate vlsi-agent
```

## Step 3: Install the Package

```bash
pip install dist/eda_sentinel-1.1.0-cp312-cp312-linux_x86_64.whl
```

If upgrading from a previous version:
```bash
pip install --force-reinstall dist/eda_sentinel-1.1.0-cp312-cp312-linux_x86_64.whl
```

## Step 4: Set Your Access Token

Your admin will provide a token that looks like `cust_XXXXXXXXXXXX`.

```bash
export EDA_CUSTOMER_TOKEN=cust_XXXXXXXXXXXX
```

To persist across sessions:
```bash
echo 'export EDA_CUSTOMER_TOKEN=cust_XXXXXXXXXXXX' >> ~/.bashrc
source ~/.bashrc
```

## Step 5: Verify Installation

```bash
# Check the tool is installed
eda-sentinel --help

# Quick test (no Synopsys tools needed)
eda-sentinel wrap -- bash examples/fake_vcs.sh
```

You should see:
1. The fake VCS output in your terminal
2. An error detection table
3. An LLM analysis panel with fix suggestions
4. A feedback prompt

## Usage Notes

- Always activate your environment before running: `source .venv/bin/activate` (venv) or `conda activate vlsi-agent` (conda)
- Run `eda-sentinel` from your project directory — all logs are saved in the current directory
- No config file is needed — the server connection is built in

## Uninstall

```bash
pip uninstall eda-sentinel
```
