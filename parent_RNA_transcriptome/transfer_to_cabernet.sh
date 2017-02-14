#!/bin/bash
# transfer all bam file to cabernet
# folder=`ls | grep "_paired.star.trim.dir"`
# echo $folder 
# for file in $folder 
#	do
#	echo $file
#	scp $file/Aligned.sortedByCoord.out.bam ruijuanli@cabernet.genomecenter.ucdavis.edu:/home/ruijuanli/2017_winter/bam_file 
# done
scp 05-11-Final-8ul_paired.star.trim.dir/Aligned.sortedByCoord.out.bam ruijuanli@cabernet.genomecenter.ucdavis.edu:/home/ruijuanli/2017_winter/bam_file/05-11-Final-8ul_paired.star.trim.dir

scp 1_paired.star.trim.dir/Aligned.sortedByCoord.out.bam ruijuanli@cabernet.genomecenter.ucdavis.edu:/home/ruijuanli/2017_winter/bam_file/1_paired.star.trim.dir 
