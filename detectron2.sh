#!/bin/bash
#SBATCH -N 1
#SBATCH -c 32
#SBATCH -t 2-05:00:00
#SBATCH -p general
#SBATCH -q public
#SBATCH --mem=64G
#SBATCH --gpus=a100:1
#SBATCH -o output/local_faster_rcnn_slurm.%j.out
#SBATCH -e output/local_faster_rcnn_slurm.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kbylapud@asu.edu

#SBATCH --export=NONE

module load mamba/latest
source activate week1


python local_detectron2.py