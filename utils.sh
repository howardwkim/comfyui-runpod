#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to download files
# Usage: download <url> <target_dir> [target_filename]
download() {
    local url=$1
    local target_dir=$2
    local target_filename=$3
    
    # If target_filename is not provided, use the original filename
    if [ -z "$target_filename" ]; then
        target_filename=$(basename "$url")
    fi
    
    local target_path="$target_dir/$target_filename"
    
    # Check if file already exists
    if [ -f "$target_path" ]; then
        echo -e "${YELLOW}File $target_filename already exists in $target_dir${NC}"
        return 0
    fi
    
    echo -e "${YELLOW}Downloading $target_filename...${NC}"
    wget -q --show-progress "$url" -O "$target_path"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Successfully downloaded $target_filename${NC}"
    else
        echo -e "${RED}Failed to download $target_filename${NC}"
        exit 1
    fi
} 