#!/bin/bash

 sample=`ls | grep "paired.star.trim.dir"`
 echo $sample

 for i in $sample
      do
      echo $i

      cd $i/
       
      cufflinks -o cufflink_output/ --junc-alpha 0.001 --label CUFF --max-bundle-length 3500000 --max-intron-length 300000 --max-mle-iterations 5000 --min-frags-per-transfrag 10 --min-intron-length 50 --min-isoform-fraction 0.1 --no-update-check --num-importance-samples 1000 --num-threads 8 --overhang-tolerance 8 --pre-mrna-fraction 0.15 --small-anchor-fraction 0.09 --trim-3-avgcov-thresh 10 --trim-3-dropoff-frac 0.1 --library-type fr-secondstrand -g /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5_modified_modified.gff3 -b /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa Aligned.sortedByCoord.out.bam
  
       cd ../

done 
