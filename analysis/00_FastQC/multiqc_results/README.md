

# FastQC
## Full path: /programs/FastQC-0.12.1/fastqc 
export PATH=/programs/FastQC-0.12.1:$PATH

## Execute fastqc 
fastqc /workdir/mls528/SalinityGradient_16S/data/01_DADA2/01_raw_gzipped_fastqs/*.fastq.gz --threads 5 -o /workdir/mls528/SalinityGradient_16S/analysis/00_FastQC/fastqc_reports/


# MultiQC

## LOAD MULTI QC
export PYTHONPATH=/programs/multiqc-1.15/lib64/python3.9/site-packages:/programs/multiqc-1.15/lib/python3.9/site-packages
export PATH=/programs/multiqc-1.15/bin:$PATH

## Execute multiqc 

multiqc fastqc_reports/ -o multiqc_results/

