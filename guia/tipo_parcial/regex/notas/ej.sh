#!/bin/bash
grep "$1" "notas.dat" | grep 'A[+-]\?$'    | sed "s/.*/$1 aprobado/"
grep "$1" "notas.dat" | grep -v 'A[+-]\?$' | sed "s/.*/$1 desaprobado/"
## Este sale caminando.