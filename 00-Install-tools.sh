#!/bin/bash

cd $HOME/bin/POWER8-GEM/Software
BASEDIR=$(pwd)

git clone https://github.com/gpertea/stringtie.git
cd stringtie
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







