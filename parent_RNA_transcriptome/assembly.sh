#!/bin/bash
dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/raw_data
cd $dir  
sample=`ls | grep "paired.star.trim.dir" | sed 's/_paired.star.trim.dir//g' | sed 's/\///g'`
echo $sample

current_dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/assembly_parent/cufflinks_original_gff

cd $current_dir

for i in $sample
do
        echo $i
        if [[ -d ${i}.cufflinks ]]
                then
                        echo OK
        else
                mkdir ${i}.cufflinks
        fi
        cd ${i}.cufflinks

        cufflinks  -o ${i}.cufflinks \
           --junc-alpha 0.001 \
           --label CUFF \
           --max-bundle-length 3500000 \
           --max-intron-length 300000 \
           --max-mle-iterations 5000 \
           --min-frags-per-transfrag 10 \
           --min-intron-length 50 \
           --min-isoform-fraction 0.1 \
           --no-update-check \
           --num-importance-samples 1000 \
           --num-threads 12 \
           --overhang-tolerance 8 \
           --pre-mrna-fraction 0.15 \
           --small-anchor-fraction 0.09 \
           --trim-3-avgcov-thresh 10 \
           --trim-3-dropoff-frac 0.1 \
           --library-type fr-secondstrand \
           -g /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5.gff3 \
           -b /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa \
            $dir/${i}_paired.star.trim.dir/Aligned.sortedByCoord.out.bam

cd ..

done
