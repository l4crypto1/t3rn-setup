# T3rn Setup

This repository contains a Bash script (`setup.sh`) to automate the deployment of the T3rn executor (v0.54.0) for the T3rn Testnet V2. The script handles dependency installation, executor download, environment configuration, and private key input, then runs the executor directly in your terminal with real-time logs.

## Purpose
Simplify the process of setting up and running the T3rn executor on a Linux system.

## Features
- Installs required packages: `build-essential`, `git`, `screen`, `wget`.
- Downloads and extracts T3rn executor v0.54.0 from GitHub.
- Configures testnet environment for networks: Arbitrum Sepolia, Base Sepolia, Optimism Sepolia, L2RN, Unichain Sepolia.
- Securely prompts for your T3rn wallet private key (hidden input).
- Runs the executor in the current terminal for immediate log visibility.

## Usage
Run one of these commands in your Linux terminal:

### With `curl`:
```bash
curl -s https://raw.githubusercontent.com/linoxbt/t3rn-setup/main/setup.sh | bash
