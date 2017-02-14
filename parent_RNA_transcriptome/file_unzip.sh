#!/bin/bash

file=`ls *.zip`
echo $file

for i in $file
      do

# unzip file 
unzip $i 

done 

