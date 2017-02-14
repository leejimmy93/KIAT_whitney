#!/bin/bash 

cuffmerge \
	-s /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa \
	-o test \
	--keep-tmp \
	Ae_gtf_2.txt

echo "done"
	 
 
