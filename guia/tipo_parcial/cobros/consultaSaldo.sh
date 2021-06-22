#!/bin/bash

echo -e "Ingrese DNI a buscar"
read dni
echo "El denei es : $dni"
#grep "^[^;]*;[^;]*;${dni};[^;]*;ACTIVO;[^;]*;\$[0-9]*\." "Cuentas.Master" |
# y despues obviamente hacer un sed, medio trivial a estas alturas...