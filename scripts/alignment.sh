#!/bin/bash
#load path from .bash_profile
source /home/arun/.bash_profile
# Run this script from the scripts directory using `$ source alignment.sh`
#This script holds commands to align the original reads back to the contigs to see how many reads were used in the final contigs

# Aligning Velvet assembly 001
# FIX PATH LOCATIONS
#bwa index -a bwtsw ../results/contigs/VelvetOptimiser001/contigs.fa
#bwa bwasw ../results/contigs/contigs-price-003.fasta ../data/trimmed-reads/LV89-02.fa > ../results/alignment/align-price-003.sam
#samtools view -bS ../results/alignment/align-price-003.sam > ../results/alignment/align-price-003.bam
#samtools flagstat ../results/alignment/align-price-003.bam

# Aligning PRICE assembly 002
bwa index -a bwtsw ../results/contigs/contigs-price-002.cycle30.fasta
bwa bwasw ../results/contigs/contigs-price-002.cycle30.fasta ../data/trimmed-reads/LV89-02.fa > ../results/alignment/align-price-002.sam
samtools view -bS ../results/alignment/align-price-002.sam > ../results/alignment/align-price-002.bam
samtools flagstat ../results/alignment/align-price-002.bam

# Aligning PRICE assembly 003
bwa index -a bwtsw ../results/contigs/contigs-price-003.cycle30.fasta
bwa bwasw ../results/contigs/contigs-price-003.cycle30.fasta ../data/trimmed-reads/LV89-02.fa > ../results/alignment/align-price-003.sam
samtools view -bS ../results/alignment/align-price-003.sam > ../results/alignment/align-price-003.bam
samtools flagstat ../results/alignment/align-price-003.bam

# Aligning PRICE assembly 003
bwa index -a bwtsw ../results/contigs/contigs-price-004.cycle30.fasta
bwa bwasw ../results/contigs/contigs-price-004.cycle30.fasta ../data/trimmed-reads/LV89-02.fa > ../results/alignment/align-price-004.sam
samtools view -bS ../results/alignment/align-price-004.sam > ../results/alignment/align-price-004.bam
samtools flagstat ../results/alignment/align-price-004.bam
