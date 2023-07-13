#!/usr/bin/env zsh

### Job name
#SBATCH --job-name=timepred

### File / path where STDOUT will be written, the %j is the job id
#SBATCH --output=output_%j.txt

### Optional: Send mail when job has finished
#SBATCH --mail-type=END
#SBATCH --mail-user=sumyea.rahman@rwth-aachen.de

### Request time and memory
#SBATCH --time=48:00:00
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

### Adapt to your directory
cd /home/rh468636/next_activity_pred

### Now you can activate your configured conda environments
conda activate myenv


### Execute your application
python3 -v evaluate_next_equipment_and_time.py
