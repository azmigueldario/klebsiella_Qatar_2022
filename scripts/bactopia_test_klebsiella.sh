#!/bin/bash
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=8                                       # number of cores per task
#SBATCH --mem-per-cpu=12G                                       #  GB of memory per cpu core
#SBATCH --job-name="eagle_bactopia_kleb"
#SBATCH --chdir=/scratch/mdprieto/
#SBATCH --output=./%j_%x.out                                    # job id (%j) and name (%x) in log

#############################################################################################

module load singularity nextflow

# env variables for nextflow and data input
DATA_KLEB_EAGLE="/project/60005/mdprieto/qatar_klebsiella_2022/all_isolates"
export NXF_SINGULARITY_LIBRARYDIR="/project/60005/cidgoh_share/singularity_imgs"

nextflow run bactopia/bactopia -r v2.1.1 -with-singularity bactopia_2.1.1.sif \
    --samples $DATA_KLEB_EAGLE/trial_fofn.txt \
    --datasets /scratch/mdprieto/bactopia_datasets \
    --outdir /scratch/mdprieto/qatar_klebsiella_2023/bactopia_output  \
    --species "Klebsiella pneumoniae" \
    --genome_size median \
    --singularity_cache $NXF_SINGULARITY_LIBRARYDIR \
    --max_cpus 8 \
    -profile singularity \
    -resume
