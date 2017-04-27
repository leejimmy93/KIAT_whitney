#!/bin/bash 
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/vcf_leaf_no_pop/combined/

vcftools --gzvcf 505.vcf.gz --remove-indels --min-alleles 2 --max-alleles 2 --maf 0.05 --minQ 40 --min-meanDP 5 --max-meanDP 500 --max-missing 0.5 --minGQ 30 --recode --recode-INFO-all --out 505_filtered 

mv 505_filtered.recode.vcf 505_filtered.vcf
gzip 505_filtered.vcf
 
