#Recibe, pais, disciplina, y muestre por salida standard si recibio o no una medalla.
#!/bin/bash
# Robado a gonzi.
pais=$1
disciplina=$2

linea=`grep "^.*;$pais;.*;$disciplina;.*;.*;.*;.*;.*;.*$" resultados.dat`

echo $linea | sed -n "s|^.*;S;N;N;.*;.*$|$pais obtuvo una medalla de oro en $disciplina|p"
echo $linea | sed -n "s|^.*;N;S;N;.*;.*$|$pais obtuvo una medalla de plata en $disciplina|p"
echo $linea | sed -n "s|^.*;N;N;S;.*;.*$|$pais obtuvo una medalla de bronce en $disciplina|p"
echo $linea | sed -n "s|^.*;N;N;N;.*;.*$|$pais no obtuvo ninguna medalla en $disciplina|p"
#o por ahi matchear con NO NO NO?