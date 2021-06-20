#!/bin/bash

tel=$1
client=$2
channel=$3
area_code=`echo $tel | sed "s|.\{5\}\(.\{6\}\).*|\1|"`

signal=`grep "^.*;.*;.*;$area_code;$channel;.*$" "signals&channels.dat" | sed "s|^.*;\(.*\);.*$|\1|"`

./RegistrarVentaPPV.sh $client $signal
