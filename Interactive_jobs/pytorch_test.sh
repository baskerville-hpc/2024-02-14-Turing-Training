#!/bin/bash

# Check you are on an interactive job
if echo -e "$HOSTNAME" | grep -q "login";
  then
    echo -e "You are running on a login node please run on a compute node"
    exit
    else
      echo -e "You are runnning on a compute node"
fi

# Loading Modules
echo -e "Loading Modules"
module purge
module load baskerville
module load Python/3.10.4-GCCcore-11.3.0
module load PyTorch/2.0.1-foss-2022a-CUDA-11.7.0
module load torchvision/0.15.2-foss-2022a-CUDA-11.7.0

# Creatiung Python Virtual environment
if [ -d "venv" ];
  then
    echo -e "Python Virtual Environment exists deleting it"
    rm -rf venv
    else
      echo -e "Creating Python Virtual Environment"
      python -m venv venv
      source venv/bin/activate
      pip install --upgrade pip
fi

echo -e "Installing a test for GPU PyTorch Installation and will run training on CIFAR10 dataset."

pip install test-pytorch-gpu

sleep 5

sed -i "s/n_epochs: int = 10/n_epochs: int = 20/" venv/lib/python3.10/site-packages/src/run_cifar.py

run_cifar
