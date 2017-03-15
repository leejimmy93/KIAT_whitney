#!/bin/bash
# example: ./extract_SNP.sh input_file output_file
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/vcf

file_in=$1
file_out=$2

vcftools --gzvcf $file_in --remove-indels --recode --recode-INFO-all --stdout | gzip -c > $file_out  
