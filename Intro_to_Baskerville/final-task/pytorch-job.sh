#!/bin/bash

#SBATCH --account <myproject>
#SBATCH --qos <myqos>
#SBATCH --time 0-0:60:0
#SBATCH --nodes 1
#SBATCH --gpus 1
#SBATCH --cpus-per-gpu 36

# Enable shell debugging
set -x

# Load modules
module purge; module load baskerville
module load bask-apps/live
module load PyTorch/1.10.0-foss-2021a-CUDA-11.3.1

# Run code
python pytorch_gpu.py