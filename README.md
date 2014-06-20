This repository contains scripts to compare currently available assemblers using metrics provided by several sources including the Assemblathon (http://assemblathon.org) and others.

To add a new assembly, create a new line in assembly.sh and increment the ID by 1. Change the ID in each of the file names and add it to alignment.sh and blast.sh as well.

#Directory stucture:
When cloning this repository, some folders must be created. Here is what the structure should look like:

        assembler-compare
            |
            |----data
            |       |----trimmed-reads
            |
            |----results
            |       |----blast
            |       |----contigs
            |       |----alignment
            |
            |----scripts

