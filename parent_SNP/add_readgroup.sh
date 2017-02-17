#!/bin/bash 

# add readgroup
dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/SNP_parent/analysis/freebayes
picard AddOrReplaceReadGroups I=$dir/Ae_no_bolting_unique_mapped.bam O=Ae_unique_sorted_addrg.bam RGID=Ae RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=Ae
picard AddOrReplaceReadGroups I=$dir/Ol_no_bolting_unique_mapped.bam O=Ol_unique_sorted_addrg.bam RGID=Ol RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=Ol
