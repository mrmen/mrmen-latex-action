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

    cd $w_dir
    mv ${file%tex}pdf ./Documents/$docName.pdf
done

tar -czvf Documents.tar.gz Documents/*

exit 0
