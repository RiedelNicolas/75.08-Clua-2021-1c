#!/bin/bash
#Indicar si la cancion supera el limite 00:03:12, recibe la duracion por parametro.

echo $1 | grep "^00:03:1[3-9]$" | sed -n "s|.\+|Es valido|p"
echo $1 | grep "^00:03:[2-5][0-9]$" | sed -n "s|.\+|Es valido|p"
echo $1 | grep "^00:0[4-9]:[0-5][0-9]$" | sed -n "s|.\+|Es valido|p"
echo $1 | grep "^00:[1-5][0-9]:[0-5][0-9]$" | sed -n "s|.\+|Es valido|p"
echo $1 | grep "^0[1-9]:[0-5][0-9]:[0-5][0-9]$" | sed -n "s|.\+|Es valido|p"
echo $1 | grep "^[1-5][0-9]:[0-5][0-9]:[0-5][0-9]$" | sed -n "s|.\+|Es valido|p"
echo $1 | grep "^00:03:1[1-2]$" | sed -n "s|.\+|Es invalido|p"
echo $1 | grep "^00:03:0[0-9]$" | sed -n "s|.\+|Es invalido|p"
echo $1 | grep "^00:0[0-2]:[0-5][0-9]$" | sed -n "s|.\+|Es invalido|p"

#Quedo de perla