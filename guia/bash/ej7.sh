#!/bin/bash

# Se manda solo a background, a checkear esto....

if [ ! "$1" = "-n" ]; then
    bash "$0" -n &
    exit &?
fi

while true; do
    for i in $(ls); do
        if [ "prueba.txt" = "$i" ]; then
        echo -e "Se encontro el archivo prueba.txt"
        break;
        fi
    done
    sleep 10 
done