#!/bin/bash

cd $HOME/bin/POWER8-GEM/Software
BASEDIR=$(pwd)


mkdir ~/bin
cd ~/bin
tar xvfz $BASEDIR/stringtie-1.3.3b.tar.gz
cd ~/bin/stringtie-1.3.3b
make release

cd $BASEDIR
bash Miniconda2-4.2.12-Linux-ppc64le.sh

TMPFILE=$(mktemp)

echo "source ~/.bashrc" \
> $TMPFILE
echo "conda update conda" \
>> $TMPFILE
echo "conda create -c biobuilds -n power8-gem Trimmomatic HISAT2 Samtools" \
>> $TMPFILE
echo "rm -f $TMPFILE" \
>> $TMPFILE

bash --rcfile $TMPFILE







