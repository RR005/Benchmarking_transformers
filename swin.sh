#!/bin/bash
#SBATCH -N 1
#SBATCH -c 32
#SBATCH -t 2-10:00:00
#SBATCH -p general
#SBATCH -q public
#SBATCH --mem=64G
#SBATCH --gpus=a100:1
#SBATCH -o output/Densenet121_slurm.%j.out
#SBATCH -e output/Densenet121_slurm.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kbylapud@asu.edu

#SBATCH --export=NONE

module load mamba/latest
source activate week1


python main_classification.py --data_set ChestXray14  --model swin_base --init random --data_dir /scratch/kbylapud/chest_x_ray_14/CXR8/images/images --train_list dataset/Xray14_train_official.txt --val_list dataset/Xray14_val_official.txt --test_list dataset/Xray14_test_official.txt --lr 0.1 --opt sgd --epochs 200 --warmup-epochs 20 --batch_size 64