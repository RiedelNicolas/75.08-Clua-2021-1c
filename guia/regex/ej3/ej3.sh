#!/bin/bash

# Recibe un string por parametro e imprime valido si es valida o invalido si no lo es.

# grep devuelve vacio si no hubo ocurrencia.

line=$(echo "$1" | grep '[0-9]\{3\}\.[0-9]\{3\}\.1\.1')
echo "$line" | sed -n "s|.\+|es valido|p"
echo "$line" | sed -n "s|^$|no es valido|p"

#el p del final hace que imprima toda la linea,
#mientras que el -n lo vuelve Quiet.

# Una alternativa para este ejercicio podria ser : 

echo "$1" | grep '[0-9]\{3\}\.[0-9]\{3\}\.1\.1' | sed -n "s|.\+|es valido|p"
echo "$1" | grep -v '[0-9]\{3\}\.[0-9]\{3\}\.1\.1' | sed -n "s|.\+|no es valido|p"