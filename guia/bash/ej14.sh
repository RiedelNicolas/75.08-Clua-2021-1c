#!/bin/bash

for i in ${PATH//:/ }; do
    for file in "$(ls -p $i | grep -v /)";do
    echo -e "$file"
    done
done 
#faltaria el procesar.