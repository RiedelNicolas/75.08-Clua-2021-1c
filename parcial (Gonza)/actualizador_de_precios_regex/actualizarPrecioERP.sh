#!/bin/bash

id=$1
prezio=$2
sucursal=$3

ean13=`grep "^$id;.*$" articulos.dat | sed -n "s|^.*;.*;.*;\(.*\);.*;.*$|\1|p"`
prezio_formateado=`echo $prezio | sed "s|\(.*\)\([0-9][0-9]\)|\1.\2|"`

./SetPriceFlejes.sh $ean13 $sucursal $prezio_formateado
echo $?
