#!/bin/bash 

cuffmerge -p 2 \
	-s /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa \
	-o Ol \
	-g /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5.gtf \
	--keep-tmp \
	Ol_gtf.txt

echo "done"
	 
 
