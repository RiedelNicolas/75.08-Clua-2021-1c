#!/bin/bash

if [ ! -d "$1" ]; then 
    echo "El argumento ingresado no es un directorio"
    exit
fi

for file in  $(find "$1" -type d);do
    echo -e "$file"
done