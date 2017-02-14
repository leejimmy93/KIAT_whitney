#!/bin/bash

# STAR mapping 
sample[0]=`ls 2_paired_1.fq | sed 's/_1.fq$//g'`
sample[1]=`ls 6_paired_1.fq | sed 's/_1.fq$//g'`
sample[2]=`ls Ae_Gae_2_paired_1.fq | sed 's/_1.fq$//g'`
sample[3]=`ls Ae_Gae_3_paired_1.fq | sed 's/_1.fq$//g'`
sample[4]=`ls All1_Gae_2_paired_1.fq | sed 's/_1.fq$//g'`
sample[5]=`ls All1_Gae_3_paired_1.fq | sed 's/_1.fq$//g'`

echo ${sample[@]}

for i in "${sample[@]}"
do 
     #echo $i 
     if [[ -d ${i}.star.dir.rapa ]]
         then
            echo OK
     else 
            mkdir ${i}.star.dir.rapa
     fi

     cd ${i}.star.dir.rapa/

     home=`pwd`
     echo "#!/bin/bash" > ${i}.sh
     echo "cd $home"     >> ${i}.sh
     # reference genome based mapping 
     echo STAR --genomeDir /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.rapa/STAR_genome_dir --readFilesIn /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/${i}_1.fq" /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data/${i}_2.fq" --outSAMtype BAM SortedByCoordinate --sjdbGTFfile /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.rapa/Brapa_gene_v1.5.gff --quantMode TranscriptomeSAM GeneCounts --twopassMode Basic –alignIntronMax 15000 --outFilterIntronMotifs RemoveNoncanonical --runThreadN 1 --sjdbGTFtagExonParentTranscript Parent --sjdbGTFfeatureExon CDS --outReadsUnmapped Fastx >> $i.sh
    
     chmod 755 ${i}.sh
     ./${i}.sh
      cd ../

done 












