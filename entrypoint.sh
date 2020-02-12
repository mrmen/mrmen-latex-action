#!/bin/sh
mkdir Documents

declare -A failed
i=0
w_dir=$(pwd)
for file in $(find . | grep "main.tex")
do
    dossier=$(dirname $file)
    cd $dossier
    docName=$(dirname $dossier)
    latexmk -pdf -interaction=nonstopmode main.tex
    if [ "${INPUT_ARTIFACT}" == true ]; then
          mv main.pdf ${w_dir}/Documents/$docName.pdf
    fi
    cd $w_dir
done

tar -czvf Documents.tar.gz Documents/*

exit 0
