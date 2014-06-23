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
#VelvetOptimiser.pl -s 13 -e 31 -f '-fastq ../data/trimmed-reads/LV89-02.fastq' --optFuncCov=Lcon --prefix='001' --dir_final='../results/contigs/001'

#----------------
# PRICE
#----------------
# ID=002
#PriceTI -icf ../results/contigs/001/contigs.fa 10 10 3 -o ../results/contigs/002/contigs-price-002.fasta -nc 30 -nco 30 -mol 30 -mpi 80
# ID=003
#PriceTI -icf ../results/contigs/001/contigs.fa 10 10 3 -o ../results/contigs/003/contigs-price-003.fasta -nc 30 -nco 30 -mol 20 -mpi 50
# ID=004
#PriceTI -icf ../results/contigs/001/contigs.fa 10 10 3 -o ../results/contigs/004/contigs-price-004.fasta -nc 30 -nco 30 -mol 5 -mpi 50

#----------------
# PRICE + Velvet Hybrid
#----------------
# ID=005
# reads-contigs-005.fasta is the PRICE contigs combined with the raw reads
#cat ../results/contigs/004/contigs-price-004.cycle30.fasta ../data/trimmed-reads/LV89-02.fa > ../results/contigs/005/reads-contigs-005.fasta
#VelvetOptimiser.pl -s 17 -e 31 -f '-fasta ../results/contigs/005/reads-contigs-005.fasta' --optFuncCov=Lcon --prefix='005' --dir_final='../results/contigs/005'

#----------------
# IDBA_UD
#----------------
# ID=006
# Default
#idba_ud -r ../data/trimmed-reads/LV89-02.fa -o ../results/contigs/006 
# ID=007
#idba_ud -r ../data/trimmed-reads/LV89-02.fa -o ../results/contigs/007 --mink 21 --maxk 31 --step 2
# ID=008
idba_ud -r ../data/trimmed-reads/LV89-02.fa -o ../results/contigs/008 --mink 19 --maxk 49 --step 2
