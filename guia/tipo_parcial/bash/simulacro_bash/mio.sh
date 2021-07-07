#!/bin/bash
readonly servicios="mae/servicios.dat"
readonly tarifa_social="mae/tarifa_social.dat"

filtrar_por_fecha_en_nombre() {
    nombre="$(basename $1)"
    #mes_actual=date$"(date +%m)"
    #dia_actual="$(date +%d)"
    #anio_actual="$(date +%Y)"
    fecha_actual="$(date %Y%m%d)"
    fecha_archivo="$(echo $nombre | cut -d '_' -f 3 | cut -d "." -f 1)"
    #anio_archivo="$(echo $fecha_archivo | cut -c 1-4)"
    #mes_archivo="$(echo $fecha_archivo | cut -c 5-6)"
    #dia_archivo="$(echo $fecha_archivo | cut -c 7-8)"
    if [ "$fecha_archivo" -gt "$fecha_actual"]; then
        mv $1 "rech/"
    fi
}

filtrar_por_servicios_existentes() {
    readonly temp="temp.txt"
    archivo="$1"
    while read line; do
    id="$(echo $line|cut -d ',' -f 1)"
    region="$(echo $line|cut -d ',' -f 3)"
    if grep -q "^$id,.*,$region,.*";then
        echo $line >> $temp
    else
        echo $line >> "rech/$(basename $archivo)"
    fi
    done < $archivo
    mv $temp "$archivo"
}

generar_salida() {
    nombre="$(basename $1)"
    fecha_archivo="$(echo $nombre | cut -d '_' -f 3 | cut -d '.' -f 1)"
    salida="result/nueva_factura_$fecha_archivo"
    while read line;do
    ///// Parcear y usar bc, da un poco de paja...
    done
}

#Primero Filtramos los nombres
for file in $(find "input/" -type f );do
    filtrar_por_fecha_en_nombre $file
done

for file in $(find "input/" -type f );do
  filtrar_por_servicios_existentes $file
  generar_salida $file
done