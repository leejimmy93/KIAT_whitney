#!/bin/bash 

# filter based on MAF (0.05), missing rate (0.1), and QUAL (40)
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/vcf

vcftools --gzvcf 505_SNP_biallelic.gz --maf 0.05 --max-missing 0.9 --minQ 40 --recode --recode-INFO-all --stdout | gzip -c > 505_filtered_MAF_missingrate_Q.gz 
 
	 
         
