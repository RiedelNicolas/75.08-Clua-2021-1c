PADRON=$1
NOTA=`grep "^.*;$PADRON;.*;A.*$" notas.dat`
echo $NOTA | sed -n "s|^.*;A.*$|$PADRON APROBADO|p"
echo $NOTA | sed -n "s|^.*;[^A]$|$PADRON DESAPROBADO|p"
