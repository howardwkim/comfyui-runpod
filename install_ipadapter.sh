#!/bin/bash
 # chmod +x install_ipadapter.sh
# Exit on error
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Base directories
COMFY_DIR="ComfyUI"
CLIP_VISION_DIR="$COMFY_DIR/models/clip_vision"
IPADAPTER_DIR="$COMFY_DIR/models/ipadapter"
LORAS_DIR="$COMFY_DIR/models/loras"

# Create directories if they don't exist
echo -e "${YELLOW}Creating directories...${NC}"
mkdir -p "$CLIP_VISION_DIR" "$IPADAPTER_DIR" "$LORAS_DIR"

# Function to download files
download() {
    local url=$1
    local target_dir=$2
    
    local filename=$(basename "$url")
    echo -e "${YELLOW}Downloading $filename...${NC}"
    wget -q --show-progress "$url" -O "$target_dir/$filename"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Successfully downloaded $filename${NC}"
    else
        echo -e "${RED}Failed to download $filename${NC}"
        exit 1
    fi
}

# Function to download and rename files
download_and_rename() {
    local url=$1
    local target_name=$2
    local target_dir=$3
    
    echo -e "${YELLOW}Downloading $target_name...${NC}"
    wget -q --show-progress "$url" -O "$target_dir/$target_name"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Successfully downloaded $target_name${NC}"
    else
        echo -e "${RED}Failed to download $target_name${NC}"
        exit 1
    fi
}

# Download CLIP Vision encoders (need renaming)
echo -e "\n${YELLOW}Downloading CLIP Vision encoders...${NC}"
download_and_rename \
    "https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors" \
    "CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors" \
    "$CLIP_VISION_DIR"

download_and_rename \
    "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors" \
    "CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors" \
    "$CLIP_VISION_DIR"

download_and_rename \
    "https://huggingface.co/Kwai-Kolors/Kolors-IP-Adapter-Plus/resolve/main/image_encoder/pytorch_model.bin" \
    "clip-vit-large-patch14-336.bin" \
    "$CLIP_VISION_DIR"

# Download IPAdapter models (no renaming needed)
echo -e "\n${YELLOW}Downloading IPAdapter models...${NC}"
download "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_light_v11.bin" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus_sd15.safetensors" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_vit-G.safetensors" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl.safetensors" "$IPADAPTER_DIR"

# Download FaceID models (no renaming needed)
echo -e "\n${YELLOW}Downloading FaceID models...${NC}"
download "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sd15.bin" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15.bin" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait-v11_sd15.bin" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl.bin" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl.bin" "$IPADAPTER_DIR"
download "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl_unnorm.bin" "$IPADAPTER_DIR"

# Download FaceID LoRAs (no renaming needed)
echo -e "\n${YELLOW}Downloading FaceID LoRAs...${NC}"
download "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sd15_lora.safetensors" "$LORAS_DIR"
download "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15_lora.safetensors" "$LORAS_DIR"
download "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl_lora.safetensors" "$LORAS_DIR"
download "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl_lora.safetensors" "$LORAS_DIR"

# Download community models (need renaming)
echo -e "\n${YELLOW}Downloading community models...${NC}"
download_and_rename \
    "https://huggingface.co/Kwai-Kolors/Kolors-IP-Adapter-Plus/resolve/main/ip_adapter_plus_general.bin" \
    "Kolors-IP-Adapter-Plus.bin" \
    "$IPADAPTER_DIR"

download_and_rename \
    "https://huggingface.co/Kwai-Kolors/Kolors-IP-Adapter-FaceID-Plus/resolve/main/ipa-faceid-plus.bin" \
    "Kolors-IP-Adapter-FaceID-Plus.bin" \
    "$IPADAPTER_DIR"

echo -e "\n${GREEN}All models have been downloaded successfully!${NC}"
echo -e "${YELLOW}Note: For Kolors models, you need to manually download the InsightFace antelopev2 model from https://huggingface.co/MonsterMMORPG/tools/tree/main and place it in the models/insightface directory.${NC}" 