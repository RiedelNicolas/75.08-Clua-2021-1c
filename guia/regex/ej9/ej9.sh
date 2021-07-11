#!/bin/bash
#Indicar si la cancion supera el limite 00:03:12, recibe la duracion por parametro.

echo $1 | grep "[0-9]\{2\}:[0-9][4-9]:[0-9]\{2\}"|sed 's-.\+-Pasa el limite de tiempo-g' 
echo $1 | grep "[0-9]\{2\}:[0-9]3:1[3-9]"|sed 's-.\+-"Pasa el limite"-g'
echo $1 | grep "[0-9]\{2\}:[0-9]3:[4-9][0-9]" |sed 's-.\+-"Pasa el limite"-g'