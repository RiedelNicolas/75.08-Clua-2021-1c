#!/bin/bash

# grep devuelve vacio si no hubo ocurrencia.
line=$( echo $1 | grep '.\+@.*\..\+')
echo "$line" | sed -n "s|.\+|es valido|p"
echo "$line" | sed -n "s|^$|no es valido|p"

#el p del final hace que imprima toda la linea,
#mientras que el -n lo vuelve quiet.
