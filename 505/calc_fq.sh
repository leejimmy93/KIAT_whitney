#!/bin/bash 

cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/vcf/combined
file_in=$1
prefix=$2

vcftools --gzvcf $file_in \
	 --out $prefix \
         --freq  
echo "done frequency calculation"



