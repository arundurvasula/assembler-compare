#!/bin/bash
#load path from .bash_profile
source /home/arun/.bash_profile
# Run this script from the scripts directory using `$ source assembly.sh`
# This script holds commands used to generate assemblies. Lines should be commented out to remove them. 
# File names should contain the following information: contigs-[last used assembler]-[unique id]-k[kmer]-n50[number]-max[number].fasta
# unique ID should correspond to an ID from this script

#----------------
# VelvetOptimiser
#----------------
# ID=001
#VelvetOptimiser.pl -s 13 -e 31 -f '-fastq ../data/trimmed-reads/LV89-02.fastq' --optFuncCov=Lcon --prefix='VelvetOptimiser001' --dir_final='../results/contigs/VelvetOptimiser001'

#----------------
# PRICE
#----------------
# ID=002
#PriceTI -icf ../results/contigs/VelvetOptimiser001/contigs.fa 10 10 3 -o ../results/contigs/contigs-price-002.fasta -nc 30 -nco 30 -mol 30 -mpi 80
# ID=003
#PriceTI -icf ../results/contigs/VelvetOptimiser001/contigs.fa 10 10 3 -o ../results/contigs/contigs-price-003.fasta -nc 30 -nco 30 -mol 20 -mpi 50

# ID=004
PriceTI -icf ../results/contigs/VelvetOptimiser001/contigs.fa 10 10 3 -o ../results/contigs/contigs-price-004.fasta -nc 30 -nco 30 -mol 5 -mpi 50
