#!/bin/bash

for i in "$@"; do
    if [ -f "$i" ];then
    echo -e "\n---$i---\n"
    cat "$i"
    else
    echo -e "$i no existe o no es un archivo!"
    fi
done
