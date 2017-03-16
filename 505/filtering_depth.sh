#!/bin/bash 

# filter based on read depth
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/vcf/combined

vcftools --gzvcf 505_filtered_MAF_missingrate_Q.gz --min-meanDP 5 --max-meanDP 500 --recode --recode-INFO-all --stdout | gzip -c > 505_filtered_MAF_missingrate_Q_depth.gz 
 
	 
         
