#!/bin/bash

# STAR mapping 
sample=`ls *_halfhalf_1.fq | sed 's/_paired_halfhalf_1.fq$//g'`

echo $sample 

for i in $sample
do 

      if [[ -d $i.star.halfhalf.dir ]]
          then
             echo OK
      else 
             mkdir $i.star.halfhalf.dir
      fi

      cd $i.star.halfhalf.dir/

      home=`pwd`
      echo "#!/bin/bash" > $i.sh
      echo cd $home     >> $i.sh
      # reference genome based mapping 
      echo STAR --genomeDir /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/star_genome --readFilesIn /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/test_coverage/flowering_reads/${i}_paired_halfhalf_1.fq" /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/test_coverage/flowering_reads/${i}_paired_halfhalf_2.fq" --outSAMtype BAM SortedByCoordinate --sjdbGTFfile /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5_modified_modified.gff3 --quantMode TranscriptomeSAM GeneCounts --twopassMode Basic –alignIntronMax 15000 --outFilterIntronMotifs RemoveNoncanonical --runThreadN 6 --sjdbGTFtagExonParentTranscript Parent --sjdbGTFfeatureExon CDS --outReadsUnmapped Fastx >> $i.sh
    
      chmod 755 $i.sh
      ./$i.sh
       cd ../

done 












