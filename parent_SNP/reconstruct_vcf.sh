#!/bin/bash 

file_in=$1
file_out=$2

# first row is header, need to remove 
keep_tmp=`cat $file_in | wc -l`  && 
let "keep = $keep_tmp -1"
echo $keep

# get the right format of SNP content
tail -$keep $file_in | sed 's/"/\t/g' | awk '{print $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12}' > tmp &&

# combine header & content 
cat header.txt tmp > $file_out

