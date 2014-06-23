#!/bin/bash
#load path from .bash_profile
source /home/arun/.bash_profile
# Run this script from the scripts directory using `$ source quast-evaluate.sh`
# This script holds commands used to evaluate assemblies. Lines should be commented out to remove them. 

quast_eval () {
    # $1 := ID 
    # $2 := contig filename
    QUAST_DIR="../results/contigs/$1/quast"
    if [ ! -d $QUAST_DIR ]; then
        mkdir $QUAST_DIR
    fi
    quast.py ../results/contigs/$1/$2 -o ../results/contigs/$1/quast -M 100
}

# function id filename
#quast_eval 001 'contigs.fa'
#quast_eval 002 'contigs-price-002.cycle30.fasta'
#quast_eval 003 'contigs-price-003.cycle30.fasta'
#quast_eval 004 'contigs-price-004.cycle30.fasta'
#quast_eval 005 'contigs.fa'
#quast_eval 006 'contig.fa'
#quast_eval 007 'contig.fa'
