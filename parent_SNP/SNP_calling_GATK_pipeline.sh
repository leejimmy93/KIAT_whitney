#!/bin/bash 
# start from uniquely mapped bam file of no bolting data 
# 1) sort 
dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/SNP_parent/analysis/freebayes

samtools sort $dir/Ae_no_bolting_unique_mapped.bam -o Ae_unique_sorted.bam
samtools sort $dir/Ol_no_bolting_unique_mapped.bam -o Ol_unique_sorted.bam

# 2) add readgroup 
picard AddOrReplaceReadGroups I=Ae_unique_sorted.bam O=Ae_unique_sorted_addrg.bam RGID=Ae RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=Ae
picard AddOrReplaceReadGroups I=Ol_unique_sorted.bam O=Ol_unique_sorted_addrg.bam RGID=Ol RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=Ol

# echo "done add readgroup"

# 3) mark PCR duplicate
picard MarkDuplicates I=Ae_unique_sorted_addrg.bam O=Ae_unique_sorted_addrg_marked_duplicates.bam M=marked_dup_metrics_Ae.txt 
picard MarkDuplicates I=Ol_unique_sorted_addrg.bam O=Ol_unique_sorted_addrg_marked_duplicates.bam M=marked_dup_metrics_Ol.txt

echo "done mark PCR duplicate"

# 4) index bam file 
samtools index Ae_unique_sorted_addrg_marked_duplicates.bam
samtools index Ol_unique_sorted_addrg_marked_duplicates.bam

echo "done index bam file" 

# 5) create fastq sequence dictionary file (only need to do once, under the ref fa file folder) 
# picard CreateSequenceDictionary R=Brassica_napus_v4.1.chromosomes.fa O=Brassica_napus_v4.1.chromosomes.dict

# 6) split 'N' trim (visualize bam alignment before & after alignment in IGV)
GATK -T SplitNCigarReads -R ~/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa -I Ae_unique_sorted_addrg_marked_duplicates.bam -o Ae_unique_sorted_addrg_marked_duplicates_split.bam -rf ReassignOneMappingQuality -RMQF 255 -RMQT 60 -U ALLOW_N_CIGAR_READS
GATK -T SplitNCigarReads -R ~/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa -I Ol_unique_sorted_addrg_marked_duplicates.bam -o Ol_unique_sorted_addrg_marked_duplicates_split.bam -rf ReassignOneMappingQuality -RMQF 255 -RMQT 60 -U ALLOW_N_CIGAR_READS 

echo "done split"

# 7) determine suspicious intervals which are likely in need of realignment 
GATK -T RealignerTargetCreator -R ~/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa -I Ae_unique_sorted_addrg_marked_duplicates_split.bam -o Ae_forIndelRealigner.intervals
GATK -T RealignerTargetCreator -R ~/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa -I Ol_unique_sorted_addrg_marked_duplicates_split.bam -o Ol_forIndelRealigner.intervals

# 8) running realigner over those intervals 
GATK -T IndelRealigner -R ~/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa -I Ae_unique_sorted_addrg_marked_duplicates_split.bam -targetIntervals Ae_forIndelRealigner.intervals -o Ae_realignedBam.bam 
GATK -T IndelRealigner -R ~/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa -I Ol_unique_sorted_addrg_marked_duplicates_split.bam -targetIntervals Ol_forIndelRealigner.intervals -o Ol_realignedBam.bam
 
# 9) base recalibration (need a known set of SNP for base recalibration, don't need to run this step for our data)

# 10) variant calling (run this on cluster)

echo "ready for haplotype caller" 

