#!/bin/sh
mkdir Documents

declare -A failed
i=0
w_dir=$(pwd)

for file in $(find . -name "main.tex")
do
    dossier=$(dirname $file)
    cd $dossier
    
    latexmk -pdf -interaction=nonstopmode main.tex
    
    mv main.pdf $w_dir/Documents/$(dirname $file | sed 's/\.\///g; s/\//\_/g').pdf
    cd $w_dir
done


tar -czvf Documents.tar.gz Documents/*

exit 0
