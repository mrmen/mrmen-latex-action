#!/bin/sh
if [ "${INPUT_ARTIFACT}" == true ]; then
  mkdir Documents
fi

declare -A failed
i=0
w_dir=$(pwd)
for file in $(find . | grep "main.tex")
do
    cd $(basename $file)
    docName=$(basename $file | sed '/\/[^\/]+//g')
    latexmk -pdf -interaction=nonstopmode main.tex
    if [ "${INPUT_ARTIFACT}" == true ]; then
          mv main.pdf $w_dir"/Documents/"$docName.pdf
    fi
    cd $w_dir
done

if [ "${INPUT_ARTIFACT}" == true ]; then
    tar -czvf Documents.tar.gz Documents/*
fi

exit 0
