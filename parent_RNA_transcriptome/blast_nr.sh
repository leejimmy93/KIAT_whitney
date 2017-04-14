#!/bin/bash 

# blast against nr database to see what the proteins are in my sequence 

cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/assembly_parent/transdecoder/after_cap3
sample=`ls | grep "transdecoder"`
echo $sample 

for i in $sample 
	do
	echo ${i}
	cd ${i}
	blastp -query longest_orfs.pep  -db /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/NCBI/nr/nr  -max_target_seqs 1 -outfmt 6 -evalue 1e-6 -num_threads 6 -out ${i}_nr.out 
	cd ..
done
