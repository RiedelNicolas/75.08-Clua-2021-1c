#!/bin/bash

id_tecnico=$1

#esto anda si el archivo esta bien generado, pero bueno tampoco pide que chequee eso
sed -n "s|^.*;\(.*\);.*;.*;.*;$id_tecnico;.*/.*/.\{4\}\(.*\);.*;.*;.*$|Orden: \1, planificada para las \2|p" asignaciones.txt
