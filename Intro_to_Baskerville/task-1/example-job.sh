#!/bin/bash
#SBATCH --qos <myqos>
#SBATCH --account <myproject>
#SBATCH --time 1:0:0

module purge
module load baskerville

echo -n "This script is running on "
sleep 120
hostname