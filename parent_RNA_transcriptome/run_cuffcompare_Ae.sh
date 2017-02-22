#!/bin/bash 

cuffcompare -V -C -R -r /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5.gff3 \
	-o Ae \
	-s /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa \
	/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/assembly_parent/cuffmerge/Ae/merged.gtf

	
	
