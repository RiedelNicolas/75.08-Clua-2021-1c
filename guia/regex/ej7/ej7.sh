#!/bin/bash
# Realizar un shell script que busque dentro del archivo datos.txt 
# Los numeros decimales mayores a 7.534.

grep '.*:[8-9].*' "datos.txt"
grep '.*:7\.53[5-9]*' "datos.txt"
grep '.*:7\.[5-9][4-9][0-9]*' "datos.txt"1