#!/bin/bash 

cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/data/bioftp.org/TBD170026_20170202

sample=`ls | grep "Sample" | sed 's/Sample_//g' | sed 's/\///g'`
echo $sample

for i in $sample
	do
	cd Sample_${i}
	echo $i
	# low quality reads remove
	rm ${i}_unpaired_1.fq.gz
	rm ${i}_unpaired_2.fq.gz
	# unmapped remove
	rm Unmapped.out.mate1
	rm Unmapped.out.mate2
	# intermediate bam file prepared for freebayes remove
	rm Unique.sorted.bam
	rm rmdup.bam
	rm rmdup.bam.bai
	chmod 644 final.bam
	chmod 644 final.bam.bai
	rm final.bam
	rm final.bam.bai
	cd ..
done
