#!/bin/bash

#Busque detro de un archivo 
sed -n "s|\(^4[0-9]\{3\}-[0-9]\{4\}-[0-9]\{4\}-[0-9]\{4\}$\)|\1:VISA|p" debito-automatico.txt
sed -n "s|\(^5[0-9]\{3\}-[0-9]\{4\}-[0-9]\{4\}-[0-9]\{4\}$\)|\1:MASTERCARD|p" debito-automatico.txt
sed -n "s|\(^3[4-7][0-9]-[0-9]\{4\}-[0-9]\{4\}-[0-9]\{4\}$\)|\1:AMERICAN EXPRESS|p" debito-automatico.txt
