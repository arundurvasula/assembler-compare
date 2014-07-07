#!/bin/bash
#load path from .bash_profile
source /home/arun/.bash_profile
# Run this script from the scripts directory using `$ source read-coverage.sh`
# This script holds commands used to estimate read coverage from the assembled species.
#coverage can be estimated as (# of aligned reads) * (average read length) / (viral genome size, or size of the piece that you aligned to, if not the whole genome).
# first step is to align raw reads to LR3 genome

# ID=001
#bwa index -a bwtsw ../data/refseq/GLRaV3.fasta
#bwa mem ../data/refseq/GLRaV3.fasta ../data/trimmed-reads/LV89-02.fa > ../results/read-coverage/001/align-reads.sam
#samtools view -bS ../results/read-coverage/001/align-reads.sam > ../results/read-coverage/001/align-reads.bam
#samtools flagstat ../results/read-coverage/001/align-reads.bam

# got 17% or 1334192 reads
# 1334192 * 50 / 18,000 = 3,706x coverage

# ID-002
bwa index -a bwtsw ../data/refseq/GLRaV3.fasta
bwa mem ../data/refseq/GLRaV3.fasta ../results/contigs/008/contig.fa > ../results/read-coverage/002/align-contigs.sam
samtools view -bS ../results/read-coverage/002/align-contigs.sam > ../results/read-coverage/002/align-contigs.bam
samtools flagstat ../results/read-coverage/002/align-contigs.bam

