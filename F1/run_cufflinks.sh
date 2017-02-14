#!/bin/bash

sample=`ls *1.fq | sed 's/.fq//g' | sed 's/_1//g'`
echo $sample

for i in $sample
      do
      if [[ -d $i.star.dir ]]
          then
             echo OK
      else 
             mkdir $i.star.dir
      fi

      cd $i.star.dir/

#      home=`pwd`
#      echo "#!/bin/bash" > $i.sh
#      echo cd $home     >> $i.sh
      # reference genome based mapping 
      # echo STAR --genomeDir /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/star_genome --readFilesIn /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/$i"_1.fq" /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/$i"_2.fq" --runThreadN 6 >> $i.sh
      
      # samtools view -b -S Aligned.out.sam > Aligned.out.bam
      # samtools sort Aligned.out.bam -o Aligned.out.sorted.bam
      mkdir cufflink_output_2      
      cufflinks -u -p 16 -o cufflink_output --library-type fr-secondstrand -g /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5.gff3 -b /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa Aligned.sortedByCoord.out.bam      
#      chmod 755 $i.sh
#      ./$i.sh
       cd ../

done 
