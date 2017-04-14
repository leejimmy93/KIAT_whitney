#!/bin/bash 

# dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2017_winter/505/data/bioftp.org/TBD170026_20170202

dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/data/late_silique

cd $dir
sample=`ls | grep "Sample" | sed 's/\///g' | sed 's/Sample_//g'`
echo $sample

for i in $sample
        do
        echo $i

# cd to directory
cd Sample_${i}/
# prepare for freebayes
echo "get unique mapped reads" 
samtools view Aligned.sortedByCoord.out.bam | awk '$5 == "255"' > Unique.sorted.sam
echo "from sam to bam"
samtools view -bT /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa Unique.sorted.sam > Unique.sorted.bam 
echo "remove PCR dupliate"
samtools rmdup -s Unique.sorted.bam rmdup.bam
echo "index"
samtools index rmdup.bam 
echo "add readgroup"
bamaddrg -b rmdup.bam -s $i -r $i > final.bam 
echo "remove sam file"
rm Unique.sorted.sam 
cd ..

done
 


 
