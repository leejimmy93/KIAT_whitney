#!/bin/bash 
# most ouput files are in the input file directory 

cd /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/assembly_parent/cap3

/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/bin/CAP3/cap3 /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/assembly_parent/cuffcompare/Ae.u.fa > Ae.cap3.output  
echo "Ae done"

/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/bin/CAP3/cap3 /Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/assembly_parent/cuffcompare/Ol.u.fa > Ol.cap3.output  
echo "Ol done"
