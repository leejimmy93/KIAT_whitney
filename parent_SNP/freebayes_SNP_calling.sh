#!/bin/bash 

# dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/SNP_parent/data/bam/no_bolting
# echo $dir

# get uniquely mapped reads
# echo "get unique" 
# samtools view $dir/Ae_no_bolting.star.trim.dir/Aligned.sortedByCoord.out.bam | awk '$5 == "255"' > Ae_no_bolting_unique_mapped.sam
# samtools view $dir/Ol_no_bolting.star.trim.dir/Aligned.sortedByCoord.out.bam | awk '$5 == "255"' > Ol_no_bolting_unique_mapped.sam

# transform to bam file
# echo "from sam to bam" 
# samtools view -bT /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa Ae_no_bolting_unique_mapped.sam > Ae_no_bolting_unique_mapped.bam

# samtools view -bT /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa Ol_no_bolting_unique_mapped.sam > Ol_no_bolting_unique_mapped.bam

# remove PCR duplicate 
echo "remove PCR duplicate"
samtools rmdup -s /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/SNP_parent/analysis/GATK/before_vcf/no_bolting/Ae_unique_sorted.bam Ae_no_bolting_unique_mapped_rmdup.bam 
samtools rmdup -s /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/SNP_parent/analysis/GATK/before_vcf/no_bolting/Ol_unique_sorted.bam Ol_no_bolting_unique_mapped_rmdup.bam

# index bam file 
echo "index"
samtools index Ae_no_bolting_unique_mapped_rmdup.bam 
samtools index Ol_no_bolting_unique_mapped_rmdup.bam

# add read group & SNP calling (also need to run on cabernet)
echo "SNP calling"
bamaddrg -b Ae_no_bolting_unique_mapped_rmdup.bam -s Ae -r Ae -b Ol_no_bolting_unique_mapped_rmdup.bam -s Ol -r Ol | freebayes_v0.9.21-7-g7dd41db --fasta-reference /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa --stdin --dont-left-align-indels > Ae_Ol.vcf

# remove sam file 
rm Ae_no_bolting_unique_mapped.sam
rm Ol_no_bolting_unique_mapped.sam


