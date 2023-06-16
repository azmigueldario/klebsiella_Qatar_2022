

```
nextflow run nf-seqqc/main.nf \
    --input /project/60006/mdprieto/klebsiella_Qatar_2022/processed_data/input_samplesheet_pilot.csv \
    --outdir /scratch/mdprieto/results_kleb_qatar \
    --fasta /scratch/mdprieto/nf-seqqc/test.fa \
    --skip_confindr \
    --skip_busco \
    --max_memory 24.GB \
    --max_cpus 8 \
    -profile singularity \
    -resume
```
