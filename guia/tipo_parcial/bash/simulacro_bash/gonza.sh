#!/bin/bash

TMP="tmp.txt"
SERVICIOS="mae/servicios.dat"
TARIFA_SOC="mae/tarifa_social.dat"

filter_by_name () {
  FILE=`basename $1`
  FECHA=`echo $FILE | cut -d _ -f 3`
  ANIO="${FECHA:0:4}"
  MES="${FECHA:4:2}"
  DIA="${FECHA:6:2}"

  if [ "$ANIO" -gt "2021" -o "$MES" -gt "12" -o "$DIA" -gt "31" ] || [ "$ANIO" -eq "2021" -a "$MES" -gt "6" ] || [ "$ANIO" -eq "2021" -a "$MES" -eq "6" -a "$DIA" -gt "18" ]
  then
    mv $1 "rech/"
  fi
}

filter_by_region () {
  FILE=$1
  touch $TMP
  while read line
  do
    SERV=`echo $line | cut -d , -f 1`
    REGION=`echo $line | cut -d , -f 4`
    if grep -q "^$SERV,.*,$REGION,.*$" $SERVICIOS
    then
      echo $line >> $TMP
    else
      echo $line >> rech/$(basename $FILE)
    fi
  done < $FILE
  mv $TMP $FILE
}

generate_output () {
  FILE=`basename $1`
  FECHA=`echo $FILE | cut -d _ -f 3`
  while read line
  do
    touch "result/nueva_factura_$FECHA.txt"
    ID=`echo $line | cut -d , -f 2`
    VTO=`echo $line | cut -d , -f 5`
    SERV=`echo $line | cut -d , -f 1`
    REGION=`echo $line | cut -d , -f 4`
    IMPORTE=`echo $line | cut -d , -f 3`
    LINEA_SERV=`grep "^$SERV,.*,$REGION,.*$" $SERVICIOS`
    PORCENTAJE=`echo $LINEA_SERV | cut -d , -f 4`

    if grep -q $ID $TARIFA_SOC
    then
      PORCENTAJE="0"
    fi

    AUX=`echo "$IMPORTE * $PORCENTAJE" | bc`
    NUEVO_IMPORTE=`echo $AUX + $IMPORTE | bc`
    echo "$SERV,$ID,$NUEVO_IMPORTE,$VTO" >> "result/nueva_factura_$FECHA.txt"

  done < $1
}

for file in input/*.txt
do
  filter_by_name $file
done

for file in input/*.txt
do
  filter_by_region $file
  generate_output $file
done
