#!/bin/bash

BASEDIR=$(pwd)
mkdir $BASEDIR/GEM
mkdir $BASEDIR/GEM/transcripts

date=$(date +"20%y%m%d")
githash=$(git log --pretty=format:'%h' -n 1)
cd $BASEDIR/Count

for i in `ls -d *String` ; do cd $i ; mv t_data.ctab $i.counts ; mv $i.counts \
$BASEDIR/GEM/transcripts ; cd .. ; done

cd $BASEDIR/GEM/transcripts
mkdir parse
for z in *counts ; do python $BASEDIR/Task-Files/ST_ttab_parse.py $z > \
$BASEDIR/GEM/transcripts/parse/$z.fpkm ; done


perl $BASEDIR/Task-Files/GEM_merge.pl parse/ > $BASEDIR/GEM/PBS-GEM\
-$githash-$date.tab

cd $BASEDIR
