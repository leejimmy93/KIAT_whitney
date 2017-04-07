#!/bin/bash 

# missing rate (0.9)
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/vcf/combined

vcftools --gzvcf 505_filtered_MAF_Q_depth.gz --max-missing 0.1 --recode --recode-INFO-all --stdout | gzip -c > 505_filtered_MAF_Q_depth_missingness.gz 
 
	 
         
