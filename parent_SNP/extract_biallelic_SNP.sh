#!/bin/bash

# example: ./*.sh input_file output_file
file_in=$1
file_out=$2

vcftools --gzvcf $file_in --remove-indels --min-alleles 2 --max-alleles 2 --recode --recode-INFO-all --out $file_out


