#/bin/bash 

# count the number of reads in bam file for each library 

file=`ls | grep paired.star.trim.dir`

echo $file
for i in $file
	do
	cd $i
	echo $i
	samtools view -F 4 Aligned.sortedByCoord.out.bam | awk '{print $1}' | sort | uniq | wc -l > aligned_reads
	cd .. 
done



