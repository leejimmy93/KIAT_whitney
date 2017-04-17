#!/bin/bash 

# dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2017_winter/505/data/bioftp.org/TBD170026_20170202

dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/data/late_silique

cd $dir

sample=`ls | grep "Sample" | sed 's/\///g' | sed 's/Sample_//g'`
echo $sample
chrom=`cat chrom_list` 
echo $chrom

for i in $sample
        do
        echo $i

# cd to directory
cd Sample_${i}/

# echo "index"
samtools index final.bam

# change file permission
chmod 555 final.bam
chmod 555 final.bam.bai

# split 
	for j in $chrom
		do 
		echo ${j}
		samtools view -@ 2 -b final.bam ${j} > ${j}.bam
		samtools index ${j}.bam 
	done

cd .. 
done 

