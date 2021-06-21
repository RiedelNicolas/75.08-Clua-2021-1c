#!/bin/bash

sed -n "s|\(^4.*\)|\1:VISA|p" 'debito-automatico.txt'
echo -ne "\n"
sed -n "s|\(^5[1-5].*\)|\1:MASTERCARD|p" 'debito-automatico.txt'
