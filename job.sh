#!/bin/bash
#YBATCH -r dgx-a100_8
#SBATCH --nodes 1
#SBATCH -J jallama
#SBATCH --time=168:00:00
#SBATCH --output outputs/%j.out
#SBATCH --error errors/%j.err

#pyenv activate gptneox39
. /etc/profile.d/modules.sh
module load cuda/11.7
module load cudnn/cuda-11.x/8.9.0
module load nccl/cuda-11.7/2.14.3
module load openmpi/4.0.5

python ./deepy.py train.py 410M_3e-5.yml local_setup.yml

