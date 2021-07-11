#!/bin/bash
# Por entrada recibimos.
# Numero de telefono de origen.
# Codigo de cliente.
# Canal.
# En base a esto debemos hacer un pay per view

# El telefono de origen tiene el formato (nn)(nnnnnn)nnnn.
# Los caracteres de 6 a 11 contienen el codigo de area.
# Los caracteres de 13 a 16 contienen el numero.

readonly tel=$1
readonly codigo=$2
readonly canal=$3

codigo_area="$(echo $tel | sed 's|^.\{5\}\(.\{6\}\).*$|\1|')"
senal="$(grep "^[^;]*;[^;]*;[^;]*;${codigo_area};${canal};[^;]*$" "signals&channels.dat" | sed 's|^[^;]*;\([^;]*\);.*$|\1|')"
bash "registrarVenta.sh" $codigo $senal

# Este esta bien planteado.