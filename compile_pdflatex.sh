#!/bin/bash
#array with solution dirs
soldirs=($(ls solutions))

#checks if dir exits and compile in wanted dir the .tex file
for dir in "${soldirs[@]}"; do
    if [ -d solutions/"$dir" ]; then
        for file in solutions/"$dir"/*; do
            case $file in
                *.tex) 
                pdflatex -output-directory="solutions/$dir" "$file"
            esac
        done
    fi
done

#checks if dir exits and compile in wanted dir the .tex file
if [ -d notes/. ]; then
    for file in notes/*; do
        case $file in
            *.tex) 
            pdflatex -output-directory="notes/." "$file"
        esac
    done
fi
