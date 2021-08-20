#!/bin/bash

readonly id="$1"

sed -n "s|^[^;]*;\([^;]*\);[^;]*;[^;]*;[^;]*;${id};[0-3][0-9]/[0-1][0-9]/[0-9]\{4\} \(.*\);.*$|orden \1 para las \2 horas|p" < asignaciones.dat

# Esta, es muy trivial como para hacer el txt.