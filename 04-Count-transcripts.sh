#!/bin/bash

BASEDIR=$(pwd)
mkdir Count
cd $BASEDIR/Count

for i in `cat SRAList.txt` ; do 
mkdir "$i".String
cd "$i".String

stringtie \
$BASEDIR/Alignment/"$i"-accepted_hits.view.sorted \
-G $BASEDIR/Reference/*gff3 -eB \
-o ./"$i".hisat2.StringTie.hits.bam.gtf -v 
; done







