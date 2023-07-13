#!/bin/sh

### Request time and memory
#SBATCH --time=24:00:00
#SBATCH --mem-per-cpu=1500

### Set Queue
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --gres=gpu:volta:1

### Insert this AFTER the #SLURM argument section of your job script
export CONDA_ROOT=/home/rh468636/anaconda3
. $CONDA_ROOT/etc/profile.d/conda.sh
export PATH="$CONDA_ROOT/bin:$PATH"
# Here, finally you can put the actual commands of your job, that will be run
# on the cluster.
cd /home/rh468636/Inter_case_aware_RTM-master/time-prediction-benchmark-master/experiments

### Now you can activate your configured conda environments
conda activate myenv

echo "started hyperparameter optimization at $(date)"
python experiments_param_optim.py $dataset $method $encoding $learner
###python extract_best_params.py
###echo "started experiments with optimal parameters at $(date)"
###python experiments_final.py $dataset $method $encoding $learner
###echo "finished experiments with optimal parameters at $(date)"