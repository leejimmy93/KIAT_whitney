#!/bin/bash 

echo "input bam"
samtools view 414F1_young.bam | wc -l
samtools view 415F1_young.bam | wc -l 

echo "unqiue alignment"
samtools view 414F1_young_unique.bam | wc -l 
samtools view 415F1_young_unique.bam | wc -l 

echo "sorted unique alignment"
samtools view 414F1_young_unique_sorted.bam | wc -l 
samtools view 415F1_young_unique_sorted.bam | wc -l 

echo "after PCR duplicate removement"
samtools view 414F1_young_unique_sorted_rmdup.bam | wc -l 
samtools view 415F1_young_unique_sorted_rmdup.bam | wc -l 

echo "done" 
