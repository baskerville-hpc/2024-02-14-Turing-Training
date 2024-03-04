#!/bin/bash

# Module loading
module purge # unloads and loaded modules and resets the environment
module load baskerville # loads the default Baskerville environment 
module load bask-apps/live # load the stable, default application stack
module load Miniconda3/4.10.3 # load the Conda package manager


eval "$(${EBROOTMINICONDA3}/bin/conda shell.bash hook)" # initialise Conda

# Conda environment
export CONDA_ENV_PATH=""
conda create --yes --prefix "${CONDA_ENV_PATH}"

# Activate the environment
conda activate "${CONDA_ENV_PATH}"
