#!/bin/bash

#Primero leemos de entrada estándar.

anio_buscado=$(grep "^.*$")

#Realizo el sed correspondiente, donde en caso de tener match hago la salida con el formato pedido.

sed -n "s|^[^:]*:[^:]*:${anio_buscado}:\([^:]*\):\([^:]*\).*$|\2-\1|p" "MascotasOlimpicas.txt"

# No pongo un ":" luego del campo de la ciudad ya que no se si existe un sexto campo o no.
# De todas formas al tomar la RE de este campo como [^:]*, la expansión del mismo va a ser hasta el próximo ":" o un eventual fin de linea.