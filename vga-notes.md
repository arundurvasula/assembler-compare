Viral Genome Assembly Project Notes
========
5/19/2014

- we have ~8 million 30-50 bp single end Illumina reads (coverage?)
- Need to assemble viral genomes
- Lots of software choices:
    - VICUNA (BROAD inst.)
    - ALLPATHS (BROAD inst.) - de Bruijn
    - Elvira (JCVI) - specifically for viral genomes
    - ABySS
    - Velvet (meta)
    - SOAPdenovo
    - Rice (?)
- Need a way of comparing assemblies across assemblers
    - NG(X) graph = compares NG1-NG100 % across assemblers (Bradnam et. al. 2013)
        - can visually compare differences in scaffold lengths for all assemblies
        - initial data point in any series is the size of the longest scaffold for that series (long = good)
        - if a series touches x-axis, it indicates that assembly is smaller than estimated genome size (bad)
        - NG50 is Scaffold/contig length at which you have covered 50% of total genome length
            - Needs to know total genome length => needs a refseq or good estimate
    - Use metrics included in GAGE (http://gage.cbcb.umd.edu/results/index.html)
        - Comes with scripts for evaluation!
        - Compare Num, N50, Errors, and N50 corrected in contigs and scaffolds
        - Needs a reference, but possible w/o reference
    - CGAL (http://bio.math.berkeley.edu/cgal/; http://genomebiology.com/content/pdf/gb-2013-14-1-r8.pdf)
        - Likelihood method for computing genome assembly likelihoods
    - Presentation from the Assemblation: http://korflab.ucdavis.edu/datasets/Assemblathon/Assemblathon1/assemblathon_talk.pdf
        - NG50
        - NG(X%) graph
        - Fragment analysis: Count how many randomly chosen fragments from species A genome can be found in assembly
            - Use BLASTN, 95% identity over 95% length
            - Repeat at different fragment sizes
            - Repeat for both species A haplotypes
        - Repeat analysis: shouldn't need to b/c viral genomes don't contain many repeats (hopefully!)
            - could be useful to check if plant DNA made it past filtering
        - Gene finding: how many genes are present in each assembly
- Metavelvet assembles multiple genomes from mixed sequence reads of multiple species in a microbial community (http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3488206/)
- SGA preprocessor to prepare reads for assembly

=========
5/21/2014

- K-mer length for short reads? 17mer
- How to assess a good assembly?

=========
5/23/2014

- Setting up Windows environment today. Software to install today:
    - Anaconda Python
    - Velvet
    - Git, Github Windows
    - NCBI Toolkit with BLAST

=========
6/16/2014

- Moved computers and now on a Linux machine.
- Ran VelvetOptimiser to find best Velvet options (optimizing for number of long contigs)
- Installing software:
    - Velvet
    - VelvetOptimiser
    - PRICE
    - VICUNA
    - SOAP de novo
- Next goal is to increase contig size
- Scaffolding seems difficult without paired end data
- For script, want to compare assemblers with N50, Number contigs > 1KB, Max length, Total number of contigs
- Tomorrow: run PRICE on raw data, run PRICE on Velvet contigs

=========
6/17/2014

- Two different VelvetOptimiser runs:
    - Optimizing for n50 and length of contigs:
        
            Final optimised assembly details:
            ********************************************************
            Assembly id: 10
            Velveth timestamp: Jun 16 2014 14:39:15
            Velvetg timestamp: Jun 16 2014 15:05:08
            Velveth version: 1.2.09
            Velvetg version: 1.2.09
            Readfile(s): -fastq ../data/LV89-02.fastq
            Velveth parameter string: auto_data_31 31 -fastq ../data/LV89-02.fastq
            Velvetg parameter string: auto_data_31  -clean yes -exp_cov 3 -cov_cutoff 0.3502176
            Assembly directory: /home/arun/Documents/assembler-compare/scripts/auto_data_31
            Velvet hash value: 31
            Roadmap file size: 439572844
            Total number of contigs: 3568
            n50: 98
            length of longest contig: 965
            Total bases in contigs: 329515
            Number of contigs > 1k: 0
            Total bases in contigs > 1k: 0
            **********************************************************
    - Optimizing for n50 and length of bp:

            Final optimised assembly details:
            ********************************************************
            Assembly id: 6
            Assembly score: 2510
            Velveth timestamp: Jun  4 2014 11:50:11
            Velvetg timestamp: Jun  4 2014 12:03:45
            Velveth version: 1.2.10
            Velvetg version: 1.2.10
            Readfile(s): -short -fastq LV89-02-ds.fastq
            Velveth parameter string: auto_data_23 23 -short -fastq LV89-02-ds.fastq
            Velvetg parameter string: auto_data_23  -clean yes -exp_cov 2 -cov_cutoff 0.3777216
            Assembly directory: /home/arun/Documents/assembler-compare/data/auto_data_23
            Velvet hash value: 23
            Roadmap file size: 494134784
            Total number of contigs: 15815
            n50: 46
            length of longest contig: 1498
            Total bases in contigs: 926242
            Number of contigs > 1k: 2
            Total bases in contigs > 1k: 2510
            **********************************************************

- Did two price assemblies on previously assembled Velvet contigs. Increased n50 from 46 to 195. Check IPython notebook for results. I think we are losing a ton of sequence data. Need to research contig edge assemblies more: http://derisilab.ucsf.edu/software/price/PriceDocumentation140408/problemAnalysis.html

=========
6/18/2014

- Examining assemblies and comparing. I'm aligning the reads back to the contigs to see how many reads are being used. PRICE seems to be using a lot less of the reads, which makes sense because both Velvet and PRICE throw out reads. It might be possible to go back in with the contigs and combine them with the reads and re run the assemblers. If this is the case, the pipeline would look something like :

		velvet reads.fa | PRICE  contigs.fa > new-contigs.fa
		cat new-contigs.fa reads.fa > new-reads.fa
		velvet new-reads.fa > new-contigs-v2.fa
- Need to check how many good quality reads there are. Velvet is only using 28.42% of the reads.

=========
6/19/2014

- Next steps:
    1. Because assemblies are getting decent, need to compare these assemblies with that of CLCBio.
        - Compare assembly scores and blast results
    2. Need to contact some people about questions to improve assembly.
    3. Assemblies are removing a large percentage of the reads.
        - Blast the unassembled reads to viral section of Genbank
        - Map the unassembled reads to viruses that we know are in the sample (e.g. LR1, etc.)
        - Run assemblies with contigs + unassembled reads. Maybe produce a better assembly?

- local blast: have to create databases from fasta files:
        
        makeblastdb -in viral.1.protein.faa -dbtype prot -parse_seqids -out viral_protein -title "Viral Protein"
        blastx -db ../../viral-database/viral_protein/viral_protein -query price-1-contigs-k23-n5046-max1498.cycle30.fasta -outfmt 10 -out local-blastx-price-1-contigs-k23-n5046-max1498.cycle30.out

- Blast compare:

| Contigs | BLASTX | BLASTN | BLASTX |
|         | Time (local) | Time (local) | Time (remote), nr |
|---------|------|------|--------|
|PRICE contigs | 1m44.847s | 0m0.816s | 95m28.733s |
|CLC contigs | 7m22.383s | 0m1.298s | |

========
6/23/2014

- Added quast evaluation script, allows for comparison between CLCbio and other assemblers
- comparing local blast with CLCbio's blast. Need to download NR database for speedup I think
- IDBA_UD assembly is awesome, got max assembly of 4Kb
- IDBA_UD is way more awesome than I thought. I got a 15Kb assembly that aligns to the grapevine leafroll associated virus 3
