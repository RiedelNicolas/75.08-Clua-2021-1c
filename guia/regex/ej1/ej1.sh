#!/bin/bash
#Capicuas : 
# Se tiene un archivo con numeros de 3 digitos, se desea generar otro archivo con los capitucas de cada uno de los numeros.
sed 's-\([0-9]\)\([0-9]\)\([0-9]\)-\1\2\3\2\1-g' prueba.txt > out.txt 