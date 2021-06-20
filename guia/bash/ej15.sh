#!/bin/bash

for i in "$@"; do
    if [ "$i" -gt "75" ] || [ "$i" -lt "1" ] ; then
        echo "$i esta fuera del rango comprendido"
        exit
    fi
done

for i in "$@";do
    for j in $(seq "$i"); do
        echo -n "*"
    done
    echo -ne "\n"
done
