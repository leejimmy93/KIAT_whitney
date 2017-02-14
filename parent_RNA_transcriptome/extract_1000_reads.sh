#!/bin/bash

file=`ls *.fq`
echo $file

for i in $file
      do

#get first 1000 reads

head -4000 $i > $i.1000.fq

done 
