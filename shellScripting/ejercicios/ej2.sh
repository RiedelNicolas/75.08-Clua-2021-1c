# Dado un directorio pasado por parametro cree un archivo
# tar comprimido con ip y con nombre igual a la fecha en formato yyyymmdd
# seguido de guion y seguido del nombre del directorio terminado en tar.gz

gzip -S "date +"%x"" $1
