#!/bin/bash 

file=`ls *3_4 | sed 's/_3_4$//g'`

echo $file 

for i in $file 
	do 

# remove 1st row and replace it with "ID & lib ID"
awk '{print $1 "\t" $3}' ${i}_3_4 | tail -101040 | sed '1 i\ID '$i'' > $i.tmp  

done 

# combine abundance file into one master file 
paste *.tmp | awk '{ for (i=1;i<=NF;i+=2) {$i=""} print $0}' | sed 's/ /\t/g' > reads

paste *.tmp | awk '{print $1}' > ID
paste ID reads > read.count.3_4.tsv 

rm ID
rm reads
rm *.tmp

