#!/bin/bash
echo "Updating system and installing dependencies..."
sudo apt update && sudo apt upgrade -y || { echo "Failed to update system"; exit 1; }
sudo apt install -y build-essential git screen wget || { echo "Failed to install packages"; exit 1; }
echo "Downloading and extracting T3rn executor..."
wget -q --show-progress https://github.com/t3rn/executor-release/releases/download/v0.54.0/executor-linux-v0.54.0.tar.gz || { echo "Download failed"; exit 1; }
tar -xvzf executor-linux-v0.54.0.tar.gz || { echo "Extraction failed"; exit 1; }
cd executor/executor/bin || { echo "Directory change failed"; exit 1; }
echo "Setting environment variables..."
export ENVIRONMENT=testnet
export LOG_LEVEL=debug
export LOG_PRETTY=false
export EXECUTOR_PROCESS_BIDS_ENABLED=true
export EXECUTOR_PROCESS_ORDERS_ENABLED=true
export EXECUTOR_PROCESS_CLAIMS_ENABLED=true
export ENABLED_NETWORKS='arbitrum-sepolia,base-sepolia,optimism-sepolia,l2rn,unichain-sepolia'
export EXECUTOR_MAX_L3_GAS_PRICE=3000
export RPC_ENDPOINTS='{"l2rn": ["https://b2n.rpc.caldera.xyz"], "arbt": ["https://arbitrum-sepolia.drpc.org", "https://sepolia-rollup.arbitrum.io/rpc"], "bast": ["https://base-sepolia-rpc.publicnode.com", "https://base-sepolia.drpc.org"], "opst": ["https://sepolia.optimism.io", "https://optimism-sepolia.drpc.org"], "unit": ["https://unichain-sepolia.drpc.org", "https://sepolia.unichain.org"]}'
echo "Starting T3rn executor setup..."
cat << 'EOF'

    ██╗     ██╗███╗   ██╗ ██████╗ ██╗  ██╗██████╗ ████████╗
    ██║     ██║████╗  ██║██╔═══██╗╚██╗██╔╝██╔══██╗╚══██╔══╝
    ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ ██████╔╝   ██║
    ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ ██╔══██╗   ██║
    ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗██████╔╝   ██║
    ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝    ╚═╝

=== T3rn Testnet V2 ===
EOF
sleep 1
read -s -p "Enter your T3rn Wallet Private Key: " PRIVATE_KEY_LOCAL </dev/tty
echo
export PRIVATE_KEY_LOCAL
echo "Starting T3rn executor..."
./executor
