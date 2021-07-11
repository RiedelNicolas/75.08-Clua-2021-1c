#!/bin/bash

echo -e "La tabla de $1 es : "

for i in {1..10}; do
    echo -e "$1 x $i  es $(( $1 * $i ))"
done