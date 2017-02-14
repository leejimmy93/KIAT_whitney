#!/bin/bash

directory=`ls -d */ | grep "Sample"`
echo $directory

for i in $directory
     do
     cd $i
# cat summary file 

	subdirectory=`ls -d * | grep "fastqc"`
	echo $subdirectory
	for j in $subdirectory
		do
	cd $j 
cat summary.txt >> /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_fall/F2/raw_data/bioftp.org/TBD160783_20161129/summary_all.txt  

# python /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/fastqc_result/extract_inf.py -i fastqc_data.txt -o overrepresented_seq

# cat overrepresented_seq >> /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/fastqc_result/overrepresented_seq
	cd .. 
done
cd ..	

# cat overrepresented_seq | grep -v "#" | awk '{print $1, $4}' | sort | uniq -c | nl | awk '{print ">" $1 "_" $2 "_" $4 "\n" $3}' > overrepresented_seq.fa 

done
