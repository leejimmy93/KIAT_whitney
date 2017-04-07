#!/bin/bash 

# filter based on MAF (0.05) and QUAL (40)
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/vcf/combined

vcftools --gzvcf 505_SNP_biallelic.gz --maf 0.05 --minQ 40 --recode --recode-INFO-all --stdout | gzip -c > 505_filtered_MAF_Q.gz 
 
	 
         
