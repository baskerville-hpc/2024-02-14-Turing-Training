#!/bin/bash
#SBATCH --account vjgo8416-training24
#SBATCH --qos turing
#SBATCH --time 1:0:0
#SBATCH --nodes 1
#SBATCH --gpus 1
#SBATCH --cpus-per-gpu 36
#SBATCH --reservation vjgo8416-training24

# Module loading
module purge
module load baskerville
module load bask-apps/live
module load Miniconda3/4.10.3

set -e

eval "$(${EBROOTMINICONDA3}/bin/conda shell.bash hook)" # initialise Conda

# Conda environment
export CONDA_ENV_PATH="/bask/projects/v/vjgo8416-training24/james_allsopp/my_conda_env"
export CONDA_PKGS_DIRS="/tmp"

conda create --yes --prefix ${CONDA_ENV_PATH}
conda activate ${CONDA_ENV_PATH}
conda install --yes python=3.10
conda install --yes numpy
