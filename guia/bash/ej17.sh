#!/bin/bash
acumulador=0
for i in "$@"; do
    acumulador=$(($acumulador+$i))
done

echo -e " $(echo "scale=40;$acumulador/ $#" | bc)"