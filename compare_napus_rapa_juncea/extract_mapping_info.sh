#!/bin/bash 

# general mapping ratio 
# sample=`ls | grep "dir"`
# echo $sample

# for i in $sample 
# do 
#	cd $i/
#	echo $i
#	samtools view Aligned.sortedByCoord.out.bam | awk '$5 == "255"{print $3}' | sort | uniq -c > sugenome_mapping_summary # only get uniquely mapped reads 
#	cat Log.final.out | grep "Uniquely mapped reads \% \| \% of reads mapped to multiple loci \| \% of reads mapped to too many loci \| too short"
	# cat sugenome_mapping_summary | grep -v "Scaffold" | grep -v "random" > subgenome_mapping_summary_main
#	cd ..

#done
# echo "DONE"

# reads level detail 
napus_sample=`ls | grep "napus"`
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
