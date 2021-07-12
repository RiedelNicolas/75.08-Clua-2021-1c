## Recibe por entrada estandar un genero y muestre por salida estandar todos los autores y temas
#cuya duracion se encuentre entre 30 minutos y una hora y 20.
genero="$(grep ".*")"
sed -n "s|^[^;]*;[^;]*;\([^;]*\);00:[3-5][0-9]:[0-5][0-9];[^;]*;\([^;]*\);${genero}$|\2-\1|p" < lista.musical 
sed -n "s|^[^;]*;[^;]*;\([^;]*\);01:[0-1][0-9]:[0-6][0-9];[^;]*;\([^;]*\);${genero}$|\2-\1|p" < lista.musical 
sed -n "s|^[^;]*;[^;]*;\([^;]*\);01:20:00;[^;]*;\([^;]*\);${genero}$|\2-\1|p" < lista.musical