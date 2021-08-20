#!/bin/bash

dni=$(grep "^[0-9]*$")
#Supongo que los saldos negativos deben arrancar con un -, por lo tanto no haria match.
sed -n "s|^\([^;]*\);[^;]*;${dni};[^;]*;ACTIVO;\([0-9]\{3\}\)/\([0-9]\{8\}\);\(\$[0-9]*,[0-9]\{2\}\)$|\1 \2 \3 \4|p" "Cuentas.Master"