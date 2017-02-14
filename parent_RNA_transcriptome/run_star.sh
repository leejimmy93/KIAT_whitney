#!/bin/bash

# 1) trimming
# sample=`ls *1.fq | sed 's/.fq//g' | sed 's/_1$//g'`
# echo $sample 

# for i in $sample
# do 
 
# java -jar /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/bin/Trimmomatic-0.36/trimmomatic-0.36.jar PE ${i}_1.fq ${i}_2.fq ${i}_paired_1.fq ${i}_unpaired_1.fq ${i}_paired_2.fq ${i}_unpaired_2.fq ILLUMINACLIP:Bradseq_adapter.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 -threads 6

# done

# 2) STAR mapping & cufflinks assembly
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

      home=`pwd`
      echo "#!/bin/bash" > $i.sh
      echo cd $home     >> $i.sh
      # reference genome based mapping 
#      echo STAR --genomeDir /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/star_genome --readFilesIn /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/${i}_1.fq" /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/${i}_2.fq" --outSAMtype BAM SortedByCoordinate --sjdbGTFfile /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5_modified_modified.gff3 --quantMode TranscriptomeSAM GeneCounts --twopassMode Basic –alignIntronMax 15000 --outFilterIntronMotifs RemoveNoncanonical --runThreadN 10 --sjdbGTFtagExonParentTranscript Parent --sjdbGTFfeatureExon CDS --outReadsUnmapped fastx >> $i.sh
      
      echo mkdir cufflink_output >> $i.sh      
      echo cufflinks -u -p 14 -o cufflink_outpu --library-type fr-secondstrand -g /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5_modified_modified.gff3 -b /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa Aligned.sortedByCoord.out.bam >> $i.sh 

      chmod 755 $i.sh
      ./$i.sh
       cd ../

done 
