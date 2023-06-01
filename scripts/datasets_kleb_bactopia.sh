#!/bin/bash
#SBATCH --mem-per-cpu=12G                                       #  GB of memory per cpu core
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=8                                       # number of cores per task
#SBATCH --job-name="datasets_kleb_bactopia"
#SBATCH --chdir=/scratch/mdprieto/
#SBATCH --output=./temp_results/%j_main_bactopia_jan10.out      # write output to temp files

################################## preparation #########################################
module load singularity/3.8

singularity exec -e -B /scratch bactopia_2.1.1.sif bactopia datasets \
    --species "Klebsiella pneumoniae" \
    --include_genus \
    --limit 100 \
    --cpu 8  \
    --outdir /scratch/mdprieto/bactopia_datasets
