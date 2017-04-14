#!/bin/bash 

# cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/data/late_silique_batch_D/TBD170151_20170328
# no sorting bam file this time... 

cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/data/late_silique_batch_D/TBD170151_20170328/remap
samples=`ls | grep "Sample" | sed 's/Sample_//g' | sed 's/\///g'`

echo $samples
for i in $samples
	do 
	echo $i 
	STAR --genomeDir /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/star_genome \
        --readFilesIn Sample_${i}/${i}_paired_1.fq.gz  Sample_${i}/${i}_paired_2.fq.gz \
        --outSAMtype BAM Unsorted \
        --outFileNamePrefix Sample_${i}/ \
        --sjdbGTFfile /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5_modified_modified.gff3 \
        --quantMode TranscriptomeSAM GeneCounts \
        --twopassMode Basic \
        --alignIntronMax 15000 \
        --outFilterIntronMotifs RemoveNoncanonical \
        --runThreadN 8 \
        --sjdbGTFtagExonParentTranscript Parent \
        --sjdbGTFfeatureExon CDS \
        --outReadsUnmapped Fastx \
        --readFilesCommand zcat

done
