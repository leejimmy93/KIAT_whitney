#!/bin/bash
# example: ./extract_SNP.sh input_file output_file
file_in=$1
file_out=$2

vcftools --vcf $file_in --remove-indels --recode --recode-INFO-all --out $file_out  
