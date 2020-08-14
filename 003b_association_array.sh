#!/bin/bash
#SBATCH --job-name=gwas
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lnguy091@ucr.edu
#SBATCH --ntasks=2
#SBATCH --mem=32gb
#SBATCH -t 1-00:00:00
#SBATCH -p batch
#SBATCH --array=1-3

# GEMMA 0.98.1

# define variables 
GENO=/rhome/lnguy091/bigdata/Project/RiceG/NB_genome_filtered
KINSHIP=/rhome/lnguy091/bigdata/Project/RiceG/GWAS/results/related_matrix.cXX.txt
PHENO_NAME=$(head -n "$SLURM_ARRAY_TASK_ID" /rhome/lnguy091/bigdata/Project/RiceG/GWAS/phen_lst.txt | tail -n 1)
COL=$(($SLURM_ARRAY_TASK_ID))
OUT=/rhome/lnguy091/bigdata/Project/RiceG/GWAS/assoc

# association with mlm
gemma -debug -bfile "$GENO" -n "$COL" -k $KINSHIP -lmm 4 -outdir "$OUT" -o $PHENO_NAME

