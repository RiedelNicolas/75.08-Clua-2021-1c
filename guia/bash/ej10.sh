#!/bin/bash

echo -e "Ingrese el numero a piramidear"
read N

clear

for i in $(seq $N);do
    for j in $(seq $i); do
        echo -n "$i "
    done
    echo -ne "\n"
done