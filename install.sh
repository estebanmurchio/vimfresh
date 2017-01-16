#!/bin/bash

printf "vimfresh installer\n"

copy_file() {
    echo cp dots/$1 ~/.$(basename $1)
    cp dots/$1 ~/.$(basename $1)
}

parse_dots() {
    for file in dots/*; do
       copy_file $(basename $file)
    done
}

copy_vim_folder() {
    cp -r vim ~/.vim/
}

parse_dots
copy_vim_folder

printf "\ndone!"
printf "\n"

