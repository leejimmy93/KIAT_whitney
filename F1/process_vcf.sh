#!/bin/bash 
# usage ./command *.vcf *_modified.vcf

file_in=$1
file_out=$2

grep "#" $file_in > header 
grep -v "#" $file_in > content  

awk 'NF==13' content > content_clean 
cat header content_clean > ${file_out} 
 
rm header
rm content
rm content_clean
echo "done"
