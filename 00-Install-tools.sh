#!/bin/bash

cd $HOME/bin/POWER8-GEM/Software
BASEDIR=$(pwd)


mkdir ~/bin
cd ~/bin
tar xvfz $BASEDIR/stringtie-1.3.3b.tar.gz
cd $BASEDIR/stringtie-1.3.3b
make release

cd $BASEDIR/miniconda
bash Miniconda2-4.3.14-Linux-ppc64le.sh

conda update conda
conda create -c biobuilds -n power8-gem Trimmomatic HISAT2 Samtools







