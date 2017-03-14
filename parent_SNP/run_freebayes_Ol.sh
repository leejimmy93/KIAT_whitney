#!/bin/bash 

bamaddrg -b Ol_no_bolting_unique_mapped_rmdup.bam -s Ol -r Ol | freebayes_v0.9.21-7-g7dd41db --fasta-reference /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa --stdin --dont-left-align-indels > Ol.vcf
