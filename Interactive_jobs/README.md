# Interactive Jobs

This activity will cover how to create an interactive job on Baskerville and will cover the following objectives:

## Objectives

- Learn to use a terminal multiplexer - Tmux
- Understanding and learning to use `srun`
- Using CUDA to build and run a CUDA example
- Running PyTorch example `run_cifar` to make sure GPUs are being used
- Using `nvidia-smi` to monitor the GPU performance
- Running an interactive job for x11 fowarding

## Interactive examples

- login to baskerville
- start a tmux session: `tmux new-session -s <NAME>`
- Go to youe project space `cd `
- Split your screen into 2 panes `Ctrl + b, %`
   - You can navigate between panes using `Ctrl + b, <- || ->`
- On one pane start an interactive job:
   - `srun --export=USER,HOME,PATH,TERM --account=??? --qos=turing --nodes=1-1 --ntasks=36 --gres=gpu:1 --time=1:0:0 --pty /bin/bash` 
   - We also have  script that will start an interactive session `./srun_training`
   - For both cases you will have to add you Baskerville project account
- You will now have one pane on a compute node and another you should still be on a login node

### CUDA example

- This example you  will obtain and compile CUDA code
- On the compute node you can load CUDA - `module load CUDA/11.7.0`
- Run the script `./wget_cuda.sh` which will obtain a lot of CUDA examples and will add the directory `cuda-samples-11.6`
- There are many examples that here, but we will use the trasnpose example:
   - `cd cuda-samples-11.6/Samples/6_Performance/transpose`
   - `make`
   - `./trasnpose`
- On the pane with the login node run `squeue` which will show what compute node your interactive job is running on
- You need to ssh onto the compute node `ssh bask-pg-`
- Run `watch -n 1 nvidia-smi` which will enable you to monitor power and GPU memory utilised during this session

### PyTorch example

- Example test to check GPU availability and run training on [CIFAR10](https://www.cs.toronto.edu/~kriz/cifar.htm) dataset
- You can run the script `./pytorch_test.sh`which will:
   - Check you are on a compute node (and only run on the compute node)
   - Load Python, PyTorch and torchvision
   - Create a python virtual environment called venv if it does not already exist
   - pip install test-pytorch-gpu
   - Increase the number of training epochs from 10 to 20 this exttra time will enable you to view the changes with nvidia-smi
   - run the executable `run_cifar`
- On the pane with the login node run `squeue` which will show what compute node your interactive job is running on
- You need to ssh onto the compute node `ssh bask-pg-`
- Run `watch -n 1 nvidia-smi` which will enable you to monitor power and GPU memory utilised during this session

## Resources

- Baskerville-Interactive-jobs.pdf
- Baskerville-Interactive-jobs.pptx
- README.md
- pytorch_test.sh
- srun_turing.sh
- srun_vjgo8416-training24.sh
- wget_cuda.sh
- `initialise_conda.sh` - when run in an interactive session will create your conda environment
- `tmux_conda.sh` 
   - Run either `./tmux_conda.sh` or `./tmux_conda.sh <CONDA_ENV_PATH>`
   - Will start an interactive session in your activated conda environment
