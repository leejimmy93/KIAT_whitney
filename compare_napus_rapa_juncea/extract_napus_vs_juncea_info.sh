#!/bin/bash 

sample=`ls *sub`
for i in $sample 
	do
	cat $i | awk '{print $2}' | sort | uniq -c > ${i}.summary 
done
