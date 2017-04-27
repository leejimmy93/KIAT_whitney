#!/bin/bash 
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/vcf_leaf_no_pop/combined 

run_pipeline.pl -SortGenotypeFilePlugin -inputFile 505_filtered.vcf.gz -outputFile 505_filtered_sorted -fileType VCF

run_pipeline.pl -Xmx5g -fork1 -vcf 505_filtered_sorted.vcf -export -exportType Hapmap -runfork1

rm 505_filtered_sorted.vcf  
