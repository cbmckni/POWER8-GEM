#!/bin/bash



BASEDIR=$(pwd)
mkdir $BASEDIR/FastQ
cd $BASEDIR/FastQ

for i in `cat $BASEDIR/SRAList.txt`
do
    for j in 1 2
    do 
        wget -P $BASEDIR/FastQ ftp://ftp.sra.ebi.ac.uk/vol1/fastq/"${i:0:6}"/00"${i:$((${#i}-1)):1}"/"$i"/"$i"_"$j".fastq.gz 
    done
done






