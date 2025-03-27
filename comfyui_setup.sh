#this script corresponds to this tutorial video: https://www.youtube.com/watch?v=5hCGDcfPy8Y
#You only need to run this script once. However, when you start a new runpod server, you will  need to  initialize conda in the shell. 
#1. run the following command to intialize conda in the shell
#/workspace/miniconda3/bin/conda init bash
#2. run the following command to activate the conda environment
#conda activate comfyui
#3. run the following command to start comfyui
#python main.py --listen

#!/bin/bash
#ComfyUI single environment setup

echo "
========================================
🚀 Starting ComfyUI setup...
========================================
"

# Create base directories
echo "
----------------------------------------
📁 Creating base directories...
----------------------------------------"
mkdir -p /workspace/ComfyUI
mkdir -p /workspace/miniconda3

# Download and install Miniconda
echo "
----------------------------------------
📥 Downloading and installing Miniconda...
----------------------------------------"
if [ ! -f "/workspace/miniconda3/bin/conda" ]; then
    cd /workspace/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    chmod +x Miniconda3-latest-Linux-x86_64.sh
    ./Miniconda3-latest-Linux-x86_64.sh -b -p /workspace/miniconda3 -f
else
    echo "Miniconda already installed, skipping..."
fi

# Initialize conda in the shell
echo "
----------------------------------------
🐍 Initializing conda...
----------------------------------------"
eval "$(/workspace/miniconda3/bin/conda shell.bash hook)"

# Clone ComfyUI
echo "
----------------------------------------
📥 Cloning ComfyUI repository...
----------------------------------------"
if [ ! -d "/workspace/ComfyUI/.git" ]; then
    git clone https://github.com/comfyanonymous/ComfyUI.git /workspace/ComfyUI
else
    echo "ComfyUI already exists in /workspace/ComfyUI, skipping clone..."
fi

# Clone ComfyUI-Manager
echo "
----------------------------------------
📥 Installing ComfyUI-Manager...
----------------------------------------"
if [ ! -d "/workspace/ComfyUI/custom_nodes/ComfyUI-Manager/.git" ]; then
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git /workspace/ComfyUI/custom_nodes/ComfyUI-Manager
else
    echo "ComfyUI-Manager already exists, skipping clone..."
fi

# Clone RyanOnTheInside nodes
echo "
----------------------------------------
📥 Installing ComfyUI RyanOnTheInside nodes...
----------------------------------------"
if [ ! -d "/workspace/ComfyUI/custom_nodes/ComfyUI_RyanOnTheInside/.git" ]; then
    git clone https://github.com/ryanontheinside/ComfyUI_RyanOnTheInside.git /workspace/ComfyUI/custom_nodes/ComfyUI_RyanOnTheInside
else
    echo "ComfyUI RyanOnTheInside nodes already exist, skipping clone..."
fi

# Create conda environment
echo "
----------------------------------------
🌟 Creating conda environment...
----------------------------------------"
if ! conda info --envs | grep -q "comfyui"; then
    conda create -n comfyui python=3.11 -y
else
    echo "comfyui environment already exists, skipping creation..."
fi

# Setup comfyui environment
echo "
----------------------------------------
🔧 Setting up comfyui environment...
----------------------------------------"
echo "🔄 Activating comfyui environment..."
set -x  # Enable debug mode to see each command
conda activate comfyui
RESULT=$?
echo "Activation exit code: $RESULT"
if [ "$CONDA_DEFAULT_ENV" != "comfyui" ]; then
    echo "❌ Failed to activate comfyui environment! Current env: $CONDA_DEFAULT_ENV"
    exit 1
fi
echo "✅ Successfully activated comfyui environment"

# Install requirements
cd /workspace/ComfyUI
echo "📦 Installing ComfyUI requirements..."
pip install -r requirements.txt

cd custom_nodes/ComfyUI-Manager
echo "📦 Installing ComfyUI-Manager requirements..."
pip install -r requirements.txt

if [ -f "/workspace/ComfyUI/custom_nodes/ComfyUI_RyanOnTheInside/requirements.txt" ]; then
    echo "📦 Installing RyanOnTheInside nodes requirements..."
    cd /workspace/ComfyUI/custom_nodes/ComfyUI_RyanOnTheInside
    pip install -r requirements.txt
fi

# Return to base environment
echo "🔄 Deactivating comfyui environment..."
conda deactivate
echo "✅ Successfully deactivated comfyui environment"
set +x  # Disable debug mode

echo "
========================================
✨ Setup complete! ✨
========================================
"