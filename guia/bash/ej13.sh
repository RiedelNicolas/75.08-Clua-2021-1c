#!/bin/bash

clear

for file in "$@"; do
    if [ -f "$file" ];then 
        echo -e "\n$file es un archivo, contiene\n"
        cat "$file"
    fi
    if [ -d "$file" ];then 
        echo -e "\n$file es un directorio, contiene\n"
        ls "$file"
    fi
done