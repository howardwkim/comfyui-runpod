#!/bin/bash

/workspace/miniconda3/bin/conda init bash
conda activate comfyui
cd /workspace/ComfyUI
python main.py --listen