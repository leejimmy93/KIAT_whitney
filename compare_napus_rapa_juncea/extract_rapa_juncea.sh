#!/bin/bash 
# reads level detail 
rapa_juncea_sample=`ls | grep "dir" | grep -v "napus"`
echo $rapa_juncea_sample

for i in $rapa_juncea_sample
do
        cd $i/
        echo $i         
        samtools view Aligned.sortedByCoord.out.bam | awk '$5 == "255"{print $1, $3}' > unique_mapped
	cd .. 
done 
echo "DONE"
