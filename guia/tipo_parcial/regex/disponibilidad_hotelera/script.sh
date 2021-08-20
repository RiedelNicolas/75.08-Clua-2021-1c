# Queremos la cantidad de habitaciones disponibles para el 17/02/2013.

# Recibe por stdin la cantidad de huespedes y el numero de estrellas separados por ,

# Se cuenta con el archivo, disponibilidad.dat que contiene los siguientes datos separados por -.

#•ID•
#Hotel
#Estrellas
#Habitación
#Capacidad de huéspedes de la habitación
#Fecha (formato mm/aa/aaaa)•
#Estado el estado disponible tiene como valor 'DISP'

linea=$(grep ".*")
huespedes=$(echo "$linea" | sed "s|^\([^,]*\),[^,]*$|\1|g")
estrellas=$(echo "$linea" | sed "s|^[^,]*,\([^,]*\)$|\1|g")

grep  "^[^-]*-[^-]*-${estrellas}-[^-]*-${huespedes}-17/02/2013-DISP$" "disponibilidad.dat" | wc -l