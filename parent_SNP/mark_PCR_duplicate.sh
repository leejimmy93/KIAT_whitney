#!/bin/bash 
picard MarkDuplicates I=Ae_unique_sorted_addrg.bam O=Ae_unique_sorted_addrg_marked_duplicates.bam M=marked_dup_metrics_Ae.txt
picard MarkDuplicates I=Ol_unique_sorted_addrg.bam O=Ol_unique_sorted_addrg_marked_duplicates.bam M=marked_dup_metrics_Ol.txt

