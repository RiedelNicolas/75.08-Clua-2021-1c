#!/bin/bash

#Reformatear fecha, pasar de mm/dd/aaaa a dd/mm/aaaa.
sed 's-\([0-1][0-9]\)/\([0-3][0-9]\)/\([0-9]\{4\}\)-\2/\1/\3-g' prueba.txt > out.txt 
