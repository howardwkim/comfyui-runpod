#!/bin/bash
# chmod +x install_controlnet.sh
# Exit on error
set -e

# Source utility functions
source ./utils.sh

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Base directories
COMFY_DIR="ComfyUI"
CONTROLNET_DIR="$COMFY_DIR/models/controlnet"

# Create directories if they don't exist
echo -e "${YELLOW}Creating directories...${NC}"
mkdir -p "$CONTROLNET_DIR"

# Download the controlnet model
CONTROLNET_URL="https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster/resolve/main/control_v1p_sd15_qrcode_monster.safetensors"
download "$CONTROLNET_URL" "$CONTROLNET_DIR"

echo -e "${GREEN}All done!${NC}"