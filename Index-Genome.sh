#!/bin/bash

source activate power8-gem

REF_PREFIX=$1

cd ./Reference/

hisat2-build -f ./*fa "$REF_PREFIX"

cp *fa "$REF_PREFIX.fa"

source activate power8-gem

