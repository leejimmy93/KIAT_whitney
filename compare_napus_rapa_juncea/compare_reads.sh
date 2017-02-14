#!/bin/bash

# Da-Ae sample 6 
# napus VS rapa
# awk 'NR==FNR{a[$1]=$0}NR>FNR{if ($1 in a) print a[$1], $0}' 6_paired.star.dir.napus/napus_reads_with_mapping_info 6_paired.star.dir.rapa/unique_mapped > napus_VS_rapa_6_Da-Ae 
# napus VS juncea 
awk 'NR==FNR{a[$1]=$0}NR>FNR{if ($1 in a) print a[$1], $0}' 6_paired.star.dir.napus/napus_reads_with_mapping_info 6_paired.star.dir.juncea/unique_mapped > napus_VS_juncea_6_Da-Ae

# Da-Ol-1 sample 
awk 'NR==FNR{a[$1]=$0}NR>FNR{if ($1 in a) print a[$1], $0}' All1_Gae_2_paired.star.dir.napus/napus_reads_with_mapping_info All1_Gae_2_paired.star.dir.rapa/unique_mapped > napus_VS_rapa_All1_Gea_2_Da-Ol

awk 'NR==FNR{a[$1]=$0}NR>FNR{if ($1 in a) print a[$1], $0}' All1_Gae_2_paired.star.dir.napus/napus_reads_with_mapping_info All1_Gae_2_paired.star.dir.juncea/unique_mapped > napus_VS_juncea_All1_Gae_Da-Ol

