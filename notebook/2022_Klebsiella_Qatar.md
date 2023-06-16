# Meetings

## 20230202 - Matthew Nguyen

Will told me that I could aim to reproduce the approach of Matthew's analysis with _E. coli_ isolates from Qatar: situating them in a global epidemiological context. My initial plan was to use this data for training only. Now, I would like to obtain representative global sequences, and characterize all _Klebsiella spp._ isolates (Qatar and Global). Then, represent diversity in Qatar using phylogenetic trees and then a summary of how this strains relate to a global tree. 

**Suggestions:**  
- For mobile elements prediction: ME finder and MGE finder. 
- Pop and partitioning cluster tool (PopPunk). Uses core and accessory genes.  
- Once I find the location of Qatari isolates in global population, characterize the  most closely circulating ST or clonal complex and compare it with local strains.  
- Matthew  used around 10,000 isolates for **PopPUNK**:  

   - To reduce the total number use MASH and pick 100 isolates that are close to every Klebsiella spp. strain.
   - Optimize the model if it is too heterogeneous
- Aishwarya uses a tool for plasmids/mobile elements, use Plasmid finder
- Overall quality of sequencing reads obtained from the Qatar collaboration was poor. M' found several small contigs after assembly and unexpectedly small plasmids.


## 20230209 

To restart the project, I go over my previous analysis:
1. Set bactopia through a singularity image
2. Created file of filenames for input
3. Prepared species specific datasets for analysis
    - Did not manage to run it using nextflow, did it through a batch job using `singularity exec`

## 20230210

I continue to review my previous code to produce a summarized standard pipeline. Testing with a reduced dataset in Eagle before running complete pipeline in Cedar. 
- `nextflow run bactopia/bactopia` not working and reporting error due to uncommitted changes in the repository
    - Can be solved by deleting a hidden `.nextflow` directory where the repo was downloaded
- Ran a test on Cedar of 1hour - 8cpus - 80GB for the main bactopia pipeline using only three samples
- To run jobs in eagle, remember that the maximum amount of memory available per node is 120 GB

## 20230614 - Testing nf-seqqc

I used a sample of 6 isolates to troubleshoot and demonstrate the CIDGOH nf-seqqc pipeline.
    - The file was saved in the `processed_data` subfolder, and I created a backup called `backup_pilot.csv`

Found a couple of issues as reported before:
- The process to check the input samplesheet produces an error by failing to recognize the header of the `.csv`
- The database for **confindr** must be updated in the `nextflow.config`. Databases for **minikraken2**, **centrifuge**, and the **reference_genome** for dehosting
- Even after updating the PATH to the database, `confindr` produces errors while running. For now, I skip it. 

Additions to config;
- Specified the amount of resources to allocate for every process depending on the label of requirements given by nf-core. 
    Before that, processes like `SHOVILL` were failling due to limited ram capacity. 
- Also, it is necessary to specify a download folder to save customized or automatically downloaded busco lineages. Must be added
    to the config file. 



