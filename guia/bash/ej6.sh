#!/bin/bash
# PID

echo -e "Intente adivinar el process id de este script ..."
read num

i=0
while [ ! $num -eq $$ ]; do
    if [ $num -lt $$ ]; then
        echo -e " El numero ingresado es menor al PID"
    else
        echo -e "El numero ingresado es mayor al PID"
    fi
    echo -e "pruebe nuevamente"
    read num
    i=$((i++))
done

echo -e "Adivinaste el Process ID, en $i"