#Recibe, pais, disciplina, y muestre por salida estandar si recibio o no una medalla.
#!/bin/bash
# Robado a gonzi.
pais=$1
disciplina=$2
#linea="$(grep "^.*;$pais;.*;$disciplina;.*;.*;.*;.*;.*;.*$" resultados.dat)"
#Ojo con esto, porque el grep te devuelve todos los match en una unica linea.
sed -n "s|^[^;]*;${pais};[^;]*;${disciplina};[^;]*;S;N;N;[SN];[^;]*$|$pais obtuvo una medalla de oro en $disciplina|p" < resultados.dat
sed -n "s|^[^;]*;${pais};[^;]*;${disciplina};[^;]*;N;S;N;[SN];[^;]*$|$pais obtuvo una medalla de plata en $disciplina|p" < resultados.dat
sed -n "s|^[^;]*;${pais};[^;]*;${disciplina};[^;]*;N;N;S;[SN];[^;]*$|$pais obtuvo una medalla de bronce en $disciplina|p" < resultados.dat
sed -n "s|^[^;]*;${pais};[^;]*;${disciplina};[^;]*;N;N;N;[SN];[^;]*$|$pais no obtuvo ninguna medalla en $disciplina|p" < resultados.dat