#!/bin/bash 

cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/vcf/combined
file_in=$1
prefix=$2

vcftools --gzvcf $file_in \
	 --out $prefix \
         --freq  # allele frequency
	 # --depth \ # read depth
	 # --site-depth \
         # --site-mean-depth
	 # --counts \ # count
         # --site-pi \ #
 	 # --het \ # heterozygosity
	 # --site-quality \ # QUAL
	 # --missing-indv \ # missingness
	 # --missing-site \ # missingness
  	 # --get-INFO \ # 
	 # --hap-r2 \ # for calculation of LD
	 # --ld-window-bp 50000 # window size of 50kb, need to check again


