#!/bin/bash 

cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/vcf_late_silique_131_sample

sample=`ls *.vcf`
for i in $sample
	do
	echo $i
	bgzip $i
	tabix -p vcf $i.gz
done

echo "done"

