#!/bin/bash

BASEDIR=$(pwd)
mkdir Count

for i in `cat $BASEDIR/SRAList.txt` ; do
cd $BASEDIR/Count
mkdir "$i".String
cd "$i".String

$BASEDIR/Software/stringtie/stringtie \
$BASEDIR/Alignment/"$i"-accepted_hits.view.sorted \
-G $BASEDIR/Reference/*gff3 -eB \
-o ./"$i".hisat2.StringTie.hits.bam.gtf -v
done







