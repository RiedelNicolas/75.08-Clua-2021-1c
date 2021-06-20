#!/bin/bash

if [ "$(( $1 % 101 ))" -eq 0 ]; then
    echo -e "$1 Es divisible por 101"
else
    echo -e "$1 no es divisible por 101"
fi