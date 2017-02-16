#!/bin/bash 

dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/SNP_parent/data/bam/no_bolting
echo $dir

# get uniquely mapped reads
echo "get unique" 
samtools view $dir/Ae_no_bolting.star.trim.dir/Aligned.sortedByCoord.out.bam | awk '$5 == "255"' > Ae_no_bolting_unique_mapped.sam
samtools view $dir/Ae_no_bolting.star.trim.dir/Aligned.sortedByCoord.out.bam | awk '$5 == "255"' > Ol_no_bolting_unique_mapped.sam

# transform to bam file
echo "from sam to bam" 
samtools view -bT /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa Ae_no_bolting_unique_mapped.sam > Ae_no_bolting_unique_mapped.bam

samtools view -bT /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa Ol_no_bolting_unique_mapped.sam > Ol_no_bolting_unique_mapped.bam

# remove PCR duplicate 
echo "remove PCR duplicate"
samtools rmdup -s Ae_no_bolting_unique_mapped.bam Ae_no_bolting_unique_mapped_rmdup.bam 
samtools rmdup -s Ae_no_bolting_unique_mapped.bam Ol_no_bolting_unique_mapped_rmdup.bam

# index bam file 
echo "index"
samtools index Ae_no_bolting_unique_mapped_rmdup.bam 
samtools index Ol_no_bolting_unique_mapped_rmdup.bam

# add read group & SNP calling (wait to run on cabernet)
# bamaddrg -b Ae_no_bolting_unique_mapped_rmdup.bam -s Ae -r Ae -b Ol_no_bolting_unique_mapped_rmdup.bam -s Ol -r Ol | freebayes --fasta-reference /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa --stdin > Ae_Ol_no_bolting.vcf

# delete sam file (when done)


