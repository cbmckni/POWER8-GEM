#!/bin/bash

REF=$1

BASEDIR=$(pwd)

printf "Step 0:Index Genome"
chmod +x $BASEDIR/Index-Genome.sh
time ./Index-Genome.sh "$REF" > $BASEDIR/Logs/00.out

cd $BASEDIR
printf "Step 1:Prepare Inputs"
chmod +x $BASEDIR/01-Prepare-inputs.sh
time ./01-Prepare-inputs.sh > $BASEDIR/Logs/01.out

cd $BASEDIR
printf "Step 2:Trim Reads"
chmod +x $BASEDIR/02-Trim-reads.sh
time ./02-Trim-reads.sh > $BASEDIR/Logs/02.out

cd $BASEDIR
printf "Step 3:Map Reads"
chmod +x $BASEDIR/03-Map-reads.sh
time ./03-Map-reads.sh "REF" > $BASEDIR/Logs/03.out

cd $BASEDIR
printf "Step 4:Count transcripts"
chmod +x $BASEDIR/04-Count-transcripts.sh
time ./04-Count-transcripts.sh > $BASEDIR/Logs/04.out

cd $BASEDIR
printf "Step 5:GEM Parse"
chmod +x $BASEDIR/05-GEM-parse.sh
time ./05-GEM-parse.sh > $BASEDIR/Logs/05.out 


