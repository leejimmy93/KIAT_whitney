#!/bin/bash

sample=`ls | grep "Sample" | sed 's/\///g' | sed 's/Sample_//g'`
echo $sample

for i in $sample
	do

# trimming 

# java -jar /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/bin/Trimmomatic-0.36/trimmomatic-0.36.jar PE /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/Sample_${i}/${i}_1.fq.gz /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/Sample_${i}/${i}_2.fq.gz /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/Sample_${i}/${i}_paired_1.fq.gz /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/Sample_${i}/${i}_unpaired_1.fq.gz /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/Sample_${i}/${i}_paired_2.fq.gz /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/Sample_${i}/${i}_unpaired_2.fq.gz ILLUMINACLIP:Bradseq_adapter.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 -threads 6  

### CDS mapping
      kallisto quant --single --plaintext -l 250 -s 50 -t 12 -i /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5.cds.19.kai -o /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/Sample_${i} /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/Sample_${i}/${i}_paired_2.fq.gz   

### remove 1st row and replace it with "ID & lib ID"
        awk '{print $1 "\t" $4}' /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/Sample_${i}/abundance.tsv | sed 1d | sed '1 i\ID '$i'' > /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/Sample_${i}/${i}.abundance.tsv
#         awk '{print $1 "\t" $5}' abundance.tsv | sed 1d | sed '1 i\ID  '$i'' > $i.abundance.normalized.tsv) >> $i.sh       


#       chmod 755 $i.sh
#       ./$i.sh
        mv /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/Sample_${i}/${i}.abundance.tsv /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/read_count
#        mv $i.abundance.normalized.tsv /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/read_count
        cd ../ 
      
done
 
#        cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/read_count

### combine all abundance.tsv file into one master file  
#       paste *abundance.tsv | awk '{ for (i=1;i<=NF;i+=2) {$i=""} print $0}' | sed 's/ /\t/g' > reads
#        paste *abundance.normalized.tsv | awk '{ for (i=1;i<=NF;i+=2) {$i=""} print $0}' | sed 's/ /\t/g' > reads.normalized       
#       paste *abundance.tsv | awk '{print $1}' > ID
#        paste *abundance.normalized.tsv | awk '{print $1}' > ID.normalized 
#       paste ID reads > read.count.tsv 
#        paste ID.normalized reads.normalized > read.count.normalized.tsv

