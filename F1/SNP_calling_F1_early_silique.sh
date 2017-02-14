#!/bin/bash 

# merge bam files from biological replicates
samtools merge 414F1_early_silique.bam /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/automate_transfer/F1/414F1-gyeolcho-1.star.dir/Aligned.sortedByCoord.out.bam /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/automate_transfer/F1/414F1-gyeolcho-2.star.dir/Aligned.sortedByCoord.out.bam  /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/automate_transfer/F1/414F1-gyeolcho-3.star.dir/Aligned.sortedByCoord.out.bam

samtools merge 415F1_early_silique.bam /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/automate_transfer/F1/415F1-gyeolcho-1.star.dir/Aligned.sortedByCoord.out.bam /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/automate_transfer/F1/415F1-gyeolcho-2.star.dir/Aligned.sortedByCoord.out.bam  /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/automate_transfer/F1/415F1-gyeolcho-3.star.dir/Aligned.sortedByCoord.out.bam

echo "done merge"

# extract uniquely mapped reads  
samtools view 414F1_early_silique.bam | awk '$5 == "255"' | samtools view -bT /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa - > 414F1_early_silique_unique.bam

samtools view 415F1_early_silique.bam | awk '$5 == "255"' | samtools view -bT /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa - > 415F1_early_silique_unique.bam

echo "done unique extraction"
# sort bam file 
samtools sort 414F1_early_silique_unique.bam -o 414F1_early_silique_unique_sorted.bam
samtools sort 415F1_early_silique_unique.bam -o 415F1_early_silique_unique_sorted.bam

echo "done sort"  
# remove PCR duplicate
samtools rmdup -s 414F1_early_silique_unique_sorted.bam 414F1_early_silique_unique_sorted_rmdup.bam
samtools rmdup -s 415F1_early_silique_unique_sorted.bam 415F1_early_silique_unique_sorted_rmdup.bam

echo "done remove PCR duplicate"
# index bam file 
samtools index 414F1_early_silique_unique_sorted_rmdup.bam 
samtools index 415F1_early_silique_unique_sorted_rmdup.bam 

echo "done index"
# add read group & call SNPs & include Da-Ae & Da-Ol
bamaddrg -b /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/SNP_calling/alignment_freebayes/unique_mapping/Ae_unique_sorted_rmdup.bam -s Ae -r Ae -b /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/SNP_calling/alignment_freebayes/unique_mapping/Ol_unique_sorted_rmdup.bam -s Ol -r Ol -b 414F1_early_silique_unique_sorted_rmdup.bam -s 414F1_early_silique -r 414F1_early_silique -b 415F1_early_silique_unique_sorted_rmdup.bam -s 415F1_early_silique -r 415F1_early_silique | freebayes_v0.9.21-7-g7dd41db --fasta-reference /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa --stdin --dont-left-align-indels > F1_early_silique.vcf

echo "done SNP calling"

 
