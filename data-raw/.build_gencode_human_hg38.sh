#!/bin/bash
#$ -cwd
#$ -l bluejay,mem_free=10G,h_vmem=10G,h_fsize=100G
#$ -N build_gencode_human_hg38
#$ -o logs/build_gencode_human_hg38.$TASK_ID.txt
#$ -e logs/build_gencode_human_hg38.$TASK_ID.txt
#$ -m a
#$ -t 23-32
#$ -tc 20

echo "**** Job starts ****"
date

echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${JOB_ID}"
echo "Job name: ${JOB_NAME}"
echo "Hostname: ${HOSTNAME}"
echo "Task id: ${SGE_TASK_ID}"

## Load the R module (absent since the JHPCE upgrade to CentOS v7)
module load conda_R

## List current modules for reproducibility
module list

## Edit with your job command
Rscript -e "library('GenomicState'); library('AnnotationDbi'); library('sessioninfo'); dir.create('gencode', showWarnings = FALSE); gencode_v${SGE_TASK_ID}_hg38_txdb <- gencode_txdb('${SGE_TASK_ID}', 'hg38'); saveDb(gencode_v${SGE_TASK_ID}_hg38_txdb, file = '~/gencode_v${SGE_TASK_ID}_hg38_txdb.sqlite'); system('mv ~/gencode_v${SGE_TASK_ID}_hg38_txdb.sqlite gencode/gencode_v${SGE_TASK_ID}_hg38_txdb.sqlite'); gencode_v${SGE_TASK_ID}_hg38_annotated_genes<- gencode_annotated_genes(gencode_v${SGE_TASK_ID}_hg38_txdb); save(gencode_v${SGE_TASK_ID}_hg38_annotated_genes, file = 'gencode/gencode_v${SGE_TASK_ID}_hg38_annotated_genes.rda'); gencode_v${SGE_TASK_ID}_hg38_GenomicState <- gencode_genomic_state(gencode_v${SGE_TASK_ID}_hg38_txdb); save(gencode_v${SGE_TASK_ID}_hg38_GenomicState, file = 'gencode/gencode_v${SGE_TASK_ID}_hg38_GenomicState.rda'); print('Reproducibility information:'); Sys.time(); proc.time(); options(width = 120); session_info()"

echo "**** Job ends ****"
date

## This script was made using sgejobs version 0.99.0
## available from http://research.libd.org/sgejobs/


