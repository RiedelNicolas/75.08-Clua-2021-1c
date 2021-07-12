#!/bin/bash
# De la guia!!
# Un script que muestre por pantalla la distancia en kilometros entre dos localidades unidas por una ruta.
# Recibe por parametros : Origen, Destino y el numero de ruta. En una linea y separados por %.
# El archivo de rutas tiene los siguientes campos ID-Ruta-Localidad-KM relativos al principio de la ruta.

# Aca hay que restar numeros y hacer un absoluto... No habria que usar otros comandos?

origen="$(echo $1|sed -n "s|^\([^%]*\)%[^%]*%[^%]*$|\1|p")"
destino="$(echo $1|sed -n "s|^[^%]*%\([^%]*\)%[^%]*$|\1|p")"
ruta="$(echo $1|sed -n "s|^[^%]*%[^%]*%\([^%]*\)|\1|p")"

distancia1="$(sed -n "s|^[^-]*-${ruta}-${origen}-\([^-]*\)$|\1|p" < info_rutas.dat)"
distancia2="$(sed -n "s|^[^-]*-${ruta}-${destino}-\([^-]*\)$|\1|p" < info_rutas.dat)"

resultado="$(echo "scale=3; ${distancia1}-${distancia2}" | bc)"

echo $resultado | sed "s|-||g" #Para hacerlo positivo, sacar todos los menos.