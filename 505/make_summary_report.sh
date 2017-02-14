#!/bin/bash

dir=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2017_winter/505/data/bioftp.org/TBD170001_1617
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
cat summary.txt >> $dir/summary_all.txt  

# python /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/fastqc_result/extract_inf.py -i fastqc_data.txt -o overrepresented_seq

# cat overrepresented_seq >> /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/2016_summer/fastqc_result/overrepresented_seq
	cd .. 
done
cd ..	

# cat overrepresented_seq | grep -v "#" | awk '{print $1, $4}' | sort | uniq -c | nl | awk '{print ">" $1 "_" $2 "_" $4 "\n" $3}' > overrepresented_seq.fa 

done
