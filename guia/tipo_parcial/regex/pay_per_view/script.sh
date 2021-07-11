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
#(nn)(nnnnnn)nnnn
codigo_area="$(echo $tel | sed 's|^([0-9]\{2\})(\([0-9]\{6\}\))[0-9]\{4\}$|\1|')"
#senal="$(grep "^[^;]*;[^;]*;[^;]*;${codigo_area};${canal};[^;]*$" "signals&channels.dat" | sed 's|^[^;]*;\([^;]*\);.*$|\1|')"
senal="$(sed -n "s|^[^;]*;\([^;]*\);[^;]*;${codigo_area};${canal};[^;]*$|\1|p" < "signals&channels.dat")"
bash "registrarVenta.sh" $codigo $senal

# Este esta bien planteado.