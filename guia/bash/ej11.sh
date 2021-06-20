#!/bin/bash

if [ "$1" = "$2" ] && [ "$3" = "$1" ] ; then
    echo "Son los 3 strings iguales"
    exit
fi

if [ "$1" = "$2" ]; then
    echo "La primera y la segunda son iguales"
    exit
fi

if [ "$1" = "$3" ]; then
    echo "La primera y la tercera son iguales"
    exit
fi

if [ "$2" = "$3" ]; then
    echo "La segunda y la tercera son iguales"
    exit
fi

echo "Son las 3 diferentes"