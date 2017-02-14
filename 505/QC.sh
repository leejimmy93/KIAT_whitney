#!/bin/bash 

dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2017_winter/505/data/bioftp.org/TBD170001_1617

sample=`ls | grep "Sample" | sed 's/\///g' | sed 's/Sample_//g'`
echo $sample

for i in $sample
        do
        echo $i
	cd $dir/Sample_$i
	mkdir ${i}_paired_1_fastqc_result
        mkdir ${i}_paired_2_fastqc_result

	fastqc ${i}_paired_1.fq.gz -o $dir/Sample_$i/${i}_paired_1_fastqc_result
	fastqc ${i}_paired_2.fq.gz -o $dir/Sample_$i/${i}_paired_2_fastqc_result
	cd ..
done 
