#!/bin/bash
# example: ./extract_biallelic.sh input_file output_file
file_in=$1
file_out=$2
vcftools --vcf $file_in --min-alleles 2 --max-alleles 2 --recode --out $file_out 
