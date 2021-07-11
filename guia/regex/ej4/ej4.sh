#!/bin/bash
#Recibe una fecha por parametro e imprime si es valida o no.(Formato YYYY-MM-DD)
# grep devuelve vacio si no hubo ocurrencia.
read line
line=$( echo $line | grep '[0-9]\{4\}-[0-1][0-9]-[0-3][0-9]')
echo "$line" | sed -n "s|.\+|es valido|p"
echo "$line" | sed -n "s|^$|no es valido|p"

# El p del final hace que imprima toda la linea que se modifico.
# Mientras que el -n lo vuelve "quiet" o algo asi, esto tiene menos documentacion que un hincha de boca.