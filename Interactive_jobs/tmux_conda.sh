#!/bin/bash
#
# Section for comments and discussion
# Check a Conda environent has been selected
if [ $# -gt 0 ];
  then
    p="$1"
  else
    echo -e "enter the full path of you conda environment"
    read p
fi

tmux new-session -d -s conda_env

tmux send-keys sh\ srun_turing.sh enter

tmux send-keys module\ purge enter
tmux send-keys module\ load\ baskerville enter
tmux send-keys module\ load\ bask-apps/live enter
tmux send-keys module\ load\ Miniconda3/4.10.3 enter

tmux send-keys eval\ \"\$\(\$\{EBROOTMINICONDA3\}/bin/conda\ shell.bash\ hook\)\" enter

tmux send-keys export\ CONDA_ENV_PATH=\"$p\" enter

tmux send-keys conda\ activate\ \"\$\{CONDA_ENV_PATH\}\" enter

tmux attach-session -t conda_env
