#!/bin/bash
# run with `source directory-snapshot.sh` in scripts directory
date >> ../directory-snapshot.txt
ls -R .. >> ../directory-snapshot.txt
echo "-----------------------" >>../directory-snapshot.txt
