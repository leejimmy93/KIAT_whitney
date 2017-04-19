#!/bin/bash 
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/vcf_leaf_no_pop/combined

vcftools --gzvcf 505_filtered.vcf.gz --minGQ 30 --recode --recode-INFO-all --out 505_filtered_GQ 

mv 505_filtered_GQ.recode.vcf 505_filtered_GQ.vcf
gzip 505_filtered_GQ.vcf
 
