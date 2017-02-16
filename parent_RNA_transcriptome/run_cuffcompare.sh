#!/bin/bash 

cuffcompare -V -C -R -r /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus.annotation_v5.gff3 \
	-o test_3 \
	-s /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa \
	/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/assembly_parent/cufflinks_original_gff/done_for_cufflinks/Ae_Yeong_2_paired.star.trim.dir/transcripts.gtf  /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/assembly_parent/cufflinks_original_gff/done_for_cufflinks/Ae_Yeong_3_paired.star.trim.dir/transcripts.gtf /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/assembly_parent/cufflinks_original_gff/done_for_cufflinks/05-11-Final-8ul_paired.star.trim.dir/transcripts.gtf
	
	
