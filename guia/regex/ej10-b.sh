#!/bin/bash

lineas="$(grep '^E.*' lipsum.txt )"
echo "$lineas" | sed -n "s|^\(\([^\s]*\s*\)\{4\}\)[^\s]*\(.*\)|\1 ELIMINADO \3 |p"
#sed 's-\([0-9]\)\([0-9]\)\([0-9]\)-\1\2\3\2\1-g' prueba.txt > out.txt 