#!/bin/bash

sample=`ls *_paired_1.fq | sed 's/.fq//g' | sed 's/_1$//g'`

echo $sample 

for i in $sample
do 

      if [[ -d $i.star.trim.dir ]]
          then
             echo OK
      else 
             mkdir $i.star.trim.dir
      fi

      cd $i.star.trim.dir/
  
      awk '{print $1 "\t" $3}' ReadsPerGene.out.tab | tail -101040 | sed '1 i\ID '$i'' > $i.tmp

      mv $i.tmp /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/read_count_genome_mapping  

cd .. 
done 

       cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/read_count_genome_mapping
      
# combine all readcount file into one master file 
paste *.tmp | awk '{ for (i=1;i<=NF;i+=2) {$i=""} print $0}' | sed 's/ /\t/g' > reads
paste *.tmp | awk '{print $1}' > ID
paste ID reads > read.count.genome.mapped.tsv 

# rm ID
# rm reads
# rm *.tmp

