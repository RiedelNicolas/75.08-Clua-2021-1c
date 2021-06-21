#!/bin/bash

# grep devuelve vacio si no hubo ocurrencia.
read line
line=$( echo $line | grep '[0-9]\{4\}-[0-1][0-9]-[0-3][0-9]')
echo "$line" | sed -n "s|.\+|es valido|p"
echo "$line" | sed -n "s|^$|no es valido|p"

#el p del final hace que imprima toda la linea,
#mientras que el -n lo vuelve quiet.
