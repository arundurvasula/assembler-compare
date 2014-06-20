#!/bin/bash
#load path from .bash_profile
source /home/arun/.bash_profile
# Run this script from the scripts directory using `$ source blast.sh`
#This script holds commands to blastx the assembled contigs.

# ID 001
blastx -db ../../viral-database/viral_protein/viral_protein -query ../results/contigs/VelvetOptimiser001/contigs.fa -outfmt "10 std stitle" -out ../results/blast/blast-001.csv

# ID 002
blastx -db ../../viral-database/viral_protein/viral_protein -query ../results/contigs/contigs-price-002.cycle30.fasta -outfmt "10 std stitle" -out ../results/blast/blast-002.csv

# ID 003
blastx -db ../../viral-database/viral_protein/viral_protein -query ../results/contigs/contigs-price-003.cycle30.fasta -outfmt "10 std stitle" -out ../results/blast/blast-003.csv

# ID 004
blastx -db ../../viral-database/viral_protein/viral_protein -query ../results/contigs/contigs-price-004.cycle30.fasta -outfmt "10 std stitle" -out ../results/blast/blast-004.csv

# ID 005
blastx -db ../../viral-database/viral_protein/viral_protein -query ../results/contigs/VelvetOptimiser005/contigs.fa -outfmt "10 std stitle" -out ../results/blast/blast-005.csv
