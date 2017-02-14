#! /bin/bash 
Trinity --seqType fq --left 1_1.fq,All1_Yeong2_160621_1.fq,All1_Yeong3_160621_1.fq --right 1_2.fq,All1_Yeong2_160621_2.fq,All1_Yeong3_160621_2.fq --SS_lib_type FR --max_memory 50G --CPU 8 --output trinity_out_all
