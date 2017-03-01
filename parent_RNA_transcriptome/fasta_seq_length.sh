#!/bin/bash
# example: fastq_seq_length.sh file_in file_out 
file_in=$1
file_out=$2

awk '$0 ~ ">" {print c; c=0;printf substr($0,2,100) "\t"; } $0 !~ ">" {c+=length($0);} END { print c; }' $file_in > $file_out
