#!/bin/bash 

file=`ls *.fq`
for i in $file 
	do
	echo $i
	gzip $i
done
