#!/bin/bash
errorcode="$1"
linea="$(grep "^[^:]*:${errorcode}:.*$" "errores.dat")"

echo "$linea" | sed -n "s|^[^:]*:[^:]*:[^:]*:\([^:]*\):.[^:]*:[^:]*$| la descrip es :\1 |p"
echo "$linea" | sed -n "s|^$|<${errorcode}> no clasificado |p"