#!/bin/bash

# 1) tophat mapping 
sample=`ls *_paired_1.fq | sed 's/.fq//g' | sed 's/_1$//g'`

echo $sample 

for i in $sample
do 
      echo $i
      if [[ -d $i.tophat.dir ]]
          then
             echo OK
      else 
             mkdir $i.tophat.dir
      fi

      cd $i.tophat.dir/

      home=`pwd`
      echo "#!/bin/bash" > $i.sh
      echo cd $home     >> $i.sh
      echo mkdir tophat_output >> $i.sh
      echo tophat -p 8 -o tophat_output --library-type fr-secondstrand -G /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.gff3 /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/${i}_1.fq /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/${i}_2.fq >> $i.sh
      
# cufflinks assembly
      echo mkdir cufflink_output >> $i.sh      
      echo cufflinks -u -p 8 -o cufflink_output --library-type fr-secondstrand -g /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5_modified_modified.gff3 -b /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa tophat_output/accepted_hits.bam >> $i.sh  

      chmod 755 $i.sh
      ./$i.sh
       cd ../

done 
