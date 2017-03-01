#!/bin/bash 

# blast against nr database to see what the proteins are in my sequence 

sample=`ls | grep "transdecoder"| sed 's/.u.fa.transdecoder_dir\///g'`
echo $sample 

for i in $sample 
	do
	echo $i
	cd $i
	blastp -query longest_orfs.pep  -db /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/NCBI/nr/nr  -max_target_seqs 1 -outfmt 6 -evalue 1e-6 -num_threads 10 -out ${i}_nr.out 
	cd ..
done
