#!/bin/bash
## Recibe una lista de directorios, cree un archivo tar comprimido con gzip con nombre
# yyyy-mm-dd.tar.gz y ademas genere un archivo con el nombre yyyy-mm-dd.lst,
# con la lista de directorios ingresados. Si el archivo lst ya existe mostrar error y finalizar el programa. 

readonly fecha=$(date '+%Y-%m-%d')

for i in "$@"; do
    if ! test -d "$i"; then
        echo -e "Error : $i no es un directorio"
        exit 1
    fi
done

if  test -f "${fecha}.lst"; then
    echo -e "Error : El archivo lst ya existe"
    exit 1
fi

for i in "$@"; do
    echo $i >> "${fecha}.lst"
done

tar cvfz "${fecha}.tar.gz" $@
