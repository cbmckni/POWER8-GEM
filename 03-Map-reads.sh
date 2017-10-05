#!/bin/bash

REF=$1

source activate power8-gem

BASEDIR=$(pwd)
mkdir $BASEDIR/Alignment
cd $BASEDIR/Alignment

for i in `cat $BASEDIR/SRAList.txt` ; do 

hisat2 -p 80 -x $BASEDIR/Reference/"$REF" \
-q -1 $BASEDIR/FastQ-Trimmed/"$i"_1.forward_paired_trim.fastq -2 \
$BASEDIR/FastQ-Trimmed/"$i"_2.reverse_paired_trim.fastq -S \
./"$i".hits.sam --downstream-transcriptome-assembly -t 

samtools view --threads 80 -bS "$i".hits.sam > \
"$i"-accepted_hits.view

samtools sort --threads 80 -o \
"$i"-accepted_hits.view.sorted "$i"-accepted_hits.view

done

source deactivate power8-gem
