#!/bin/bash 

reference=/Network/Servers/avalanche.plb.ucdavis.edu/Volumes/Mammoth/Users/ruijuanli/Reference/B.napus/Brassica_napus_v4.1.chromosomes.fa

java -cp /usr/local/stow/GenomeAnalysisTK/GenomeAnalysisTK.jar org.broadinstitute.gatk.tools.CatVariants \
    -R $reference \
    -V xaa.intervals.vcf.filtered.vcf \
    -V xab.intervals.vcf.filtered.vcf \
    -V xac.intervals.vcf.filtered.vcf \
    -V xad.intervals.vcf.filtered.vcf \
    -V xae.intervals.vcf.filtered.vcf \
    -V xaf.intervals.vcf.filtered.vcf \
    -V xag.intervals.vcf.filtered.vcf \
    -V xah.intervals.vcf.filtered.vcf \
    -V xai.intervals.vcf.filtered.vcf \
    -V xaj.intervals.vcf.filtered.vcf \
    -V xak.intervals.vcf.filtered.vcf \
    -V xal.intervals.vcf.filtered.vcf \
    -V xam.intervals.vcf.filtered.vcf \
    -V xan.intervals.vcf.filtered.vcf \
    -V xao.intervals.vcf.filtered.vcf \
    -V xap.intervals.vcf.filtered.vcf \
    -V xaq.intervals.vcf.filtered.vcf \
    -V xar.intervals.vcf.filtered.vcf \
    -V xas.intervals.vcf.filtered.vcf \
    -V xat.intervals.vcf.filtered.vcf \
    -V xau.intervals.vcf.filtered.vcf \
    -V xav.intervals.vcf.filtered.vcf \
    -V xaw.intervals.vcf.filtered.vcf \
    -V xax.intervals.vcf.filtered.vcf \
    -V xay.intervals.vcf.filtered.vcf \
    -V xaz.intervals.vcf.filtered.vcf \
    -V xba.intervals.vcf.filtered.vcf \
    -V xbb.intervals.vcf.filtered.vcf \
    -V xbc.intervals.vcf.filtered.vcf \
    -V xbd.intervals.vcf.filtered.vcf \
    -V xbe.intervals.vcf.filtered.vcf \
    -V xbf.intervals.vcf.filtered.vcf \
    -V xbg.intervals.vcf.filtered.vcf \
    -V xbh.intervals.vcf.filtered.vcf \
    -V xbi.intervals.vcf.filtered.vcf \
    -V xbj.intervals.vcf.filtered.vcf \
    -V xbk.intervals.vcf.filtered.vcf \
    -V xbl.intervals.vcf.filtered.vcf \
    -V xbm.intervals.vcf.filtered.vcf \
    -V xbn.intervals.vcf.filtered.vcf \
    -V xbo.intervals.vcf.filtered.vcf \
    -out GATK.vcf \
    -assumeSorted
