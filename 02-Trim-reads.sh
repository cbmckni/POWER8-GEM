#!/bin/bash

source activate power8-gem

BASEDIR=$(pwd)
mkdir $BASEDIR/FastQ-Trimmed
cd $BASEDIR/FastQ-Trimmed

for i in `cat $BASEDIR/SRAList.txt` ; do 
trimmomatic PE -phred33 $BASEDIR/FastQ/"$i"_1.fastq.gz $BASEDIR/FastQ/"$i"_2.fastq.gz \
./"$i"_1.forward_paired_trim.fastq ./"$i"_1.forward_unpaired_trim.fastq \
./"$i"_2.reverse_paired_trim.fastq ./"$i"_2.reverse_unpaired_trim.fastq \
ILLUMINACLIP:$BASEDIR/Task-Files/Fasta_Adapters_9_2_16:2:40:15 LEADING:3 \
TRAILING:6 SLIDINGWINDOW:4:15 MINLEN:50; 
;done

source deactivate power8-gem





