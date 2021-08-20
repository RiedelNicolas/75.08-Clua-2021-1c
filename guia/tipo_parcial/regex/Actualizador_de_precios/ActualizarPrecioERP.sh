#!/bin/bash
# Este esta en el pdf de la guia.
# Tenemos que implementar la integracion entre actualizar los precios de los
# sistemas ERP y flejes.

# Para esto desarrollaremos el script ActualizarPrecioERP.sh que recibira por parametro
# * Identificador de articulo del ERP.
# * Precio
# * Id de destino.

# Nuestro script debe traducir el identificador de articulo al condigo standar EAN13
# Enviara el id de sucursal destino y cambiara el formato del precio para finalmente invocar
# al API SetPriceFlejes.

# El codigo de retorno del script debe ser el mismo codigo que devuelve el API

# El formato de precio que envia el ERP no tiene separador de decimales, interpreta a los
# dos ultimos caracteres como centavos. Mientras que el esperado por 
#flejes tiene el caracter punto como delimitador.

# Para obtener el EAN13 se cuenta con el archivo ARTICULOS.dat,

idArticulo=$1
precioERP=$2
idSucursal=$3

#Primero pasemos de precioERP a precio de flejes.

precioFlejes=$(echo "$precioERP"| sed -n "s|^\([0-9]\+\)\([0-9][0-9]\)$|\1.\2|p")
EAN13=$(sed -n "s|^$idArticulo;[^;]*;[^;]*;\([^;]*\);.*$|\1|p" "ARTICULOS.dat")
echo $precioFlejes
echo $EAN13