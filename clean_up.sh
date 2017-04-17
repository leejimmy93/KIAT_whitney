#!/bin/bash 

# remove STAR intermediate data from parent
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data 

rm -rf *star.trim.dir/_STARgenome/
rm -rf *star.trim.dir/_STARpass1/
rm -rf *star.trim.dir/_STARtmp/

# remove STAR intermidate data from F1 
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/automate_transfer/F1
rm -rf *star.dir/_STARgenome/
rm -rf *star.dir/_STARpass1/
rm -rf *star.dir/_STARtmp/
rm *star.dir/Unmapped.out.mate1
rm *star.dir/Unmapped.out.mate2

# remove STAR intermediate data from 505 leaf 
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/data/bioftp.org/TBD170026_20170202
rm -rf Sample*/_STARgenome/
rm -rf Sample*/_STARpass1/
rm -rf Sample*/_STARtmp/
rm Sample*/Aligned.toTranscriptome.out.bam

# remove STAR intermediate data from 505 late silique
cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/505/data/late_silique
rm -rf Sample*/_STARgenome/
rm -rf Sample*/_STARpass1/
rm -rf Sample*/_STARtmp/
# rm Sample*/Aligned.toTranscriptome.out.bam
rm Sample*/Unmapped.out.mate1
rm Sample*/Unmapped.out.mate2
rm Unique.sorted.bam
rm rmdup.bam 
rm rmdup.bam.bai
