#!/bin/bash

sample=`ls *1.fq | grep "Ae" |  sed 's/.fq//g' | sed 's/_1//g'`
echo $sample

for i in $sample
      do
      if [[ -d $i.star.TO10000.rapa.dir ]]
          then
             echo OK
      else 
             mkdir $i.star.TO10000.rapa.dir
      fi

      cd $i.star.TO10000.rapa.dir/

      home=`pwd`
      echo "#!/bin/bash" > $i.sh
      echo cd $home     >> $i.sh
      # reference genome based mapping 
      echo STAR --genomeDir /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.rapa.oleracea/TO1000.rapa.star.genome --readFilesIn /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/$i"_1.fq" /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/$i"_2.fq" --outSAMtype BAM SortedByCoordinate --sjdbGTFfile /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.rapa.oleracea/TO10000.rapa.gff --quantMode TranscriptomeSAM GeneCounts --twopassMode Basic –alignIntronMax 15000 --outFilterIntronMotifs RemoveNoncanonical --runThreadN 6 --sjdbGTFtagExonParentTranscript Parent --sjdbGTFfeatureExon CDS --outReadsUnmapped fasta >> $i.sh
      
      # mkdir cufflink_output      
      # cufflinks -o cufflink_output --library-type fr-secondstrand Aligned.out.sorted.bam     
      chmod 755 $i.sh
      ./$i.sh
       cd ../

done 
