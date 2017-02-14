#!/bin/bash

# reads level detail 
napus_sample=`ls | grep "dir" | grep "napus"`
echo $napus_sample

for i in $napus_sample
do
        cd $i/
        echo $i         
        samtools view Aligned.sortedByCoord.out.bam | awk '$5 == "255"{print $1, $3}' > unique_mapped
        samtools view Aligned.sortedByCoord.out.bam | awk '$5 != "255"{print $1 , "non_unique"}' | sort | uniq > nonunique_mapped
        cat Unmapped.out.mate1 | grep "SN840" | awk '{print $1, "unmapped"}' | sed 's/\@//g' > un_mapped
        cat *mapped > napus_reads_with_mapping_info

        cd ..

done
