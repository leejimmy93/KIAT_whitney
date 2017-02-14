#!/bin/bash 

# count number of reads in files after trimming for each library 
sample=`ls | grep "Sample" | sed 's/\///g' | sed 's/Sample_//g'`

for i in $sample
	do
	cd Sample_${i}
	echo $i
	zcat ${i}_paired_1.fq.gz | echo $((`wc -l`/4)) 
	zcat ${i}_paired_1.fq.gz | echo $((`wc -l`/4)) > HQ_single_end_count
	cd ..
done
