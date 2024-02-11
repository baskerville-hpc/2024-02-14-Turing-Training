#!/bin/bash
# Obtaining CUDA Samples
if [[ ! -d "cuda-samples-11.6" ]];
  then
    echo -e 'Obtaining CUDA 11.6.0 examples'
    wget https://github.com/NVIDIA/cuda-samples/archive/refs/tags/v11.6.tar.gz
    tar zxvf v11.6.tar.gz
    else
      echo -e "CUDA samples found"
fi

# Check CUDA is loaded before we continue
if  echo "$(printenv)" | grep -q "CUDA";
  then
    echo -e "CUDA found"
    else
      echo -e "please load CUDA before continuing"
fi
