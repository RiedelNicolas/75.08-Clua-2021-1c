#!/bin/bash

for i in "$@"; do
    echo -e "\nLas ocurrencias de "$i" son:"
    grep "$i" lipsum.txt
done