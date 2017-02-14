#!/bin/bash 

sample=`ls | grep "Sample"` 
echo $sample

for i in $sample
	do
	echo "This is the sample: ${i}"
	cd $i
	echo "These files will be removed:"
	rm *paired*.gz 
	cd ..
done 
