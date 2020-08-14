#!/bin/bash

#SBATCH --job-name=post_gwas
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lnguy091@ucr.edu
#SBATCH --ntasks=4
#SBATCH --mem=64gb
#SBATCH -t 01:00:00
#SBATCH -p batch
#SBATCH --array=1-3

DIR=/rhome/lnguy091/bigdata/Project/RiceG/GWAS/assoc

NUM=$(echo "$SLURM_ARRAY_TASK_ID" + 0 | bc)
FILE=$(ls "$DIR"/*assoc.txt | head -n "$NUM" | tail -n1)
NAME=$(basename "$FILE" | sed 's/\.assoc\.txt//g')

# plot results 
Rscript 003d_plot_GWAS_gemma.R "$FILE" 
