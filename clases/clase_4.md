# Shell Scripting
### Clase 4

#### Que es un script, que lo diferencia de un programa? Porque usamos nombres diferentes?

Esto es mas filosófico que otra cosa, no es muy importante. Pero la gran diferencia es que el programa hay que compilarlo, pero el script son instrucciones mas directas. (Eso dijo Adrian Muccio)

#### Usos
* Nos ahorramos el compilar, escribimos y ya lo podemos ejecutar. (Útil para hacer cosas puntuales).
* Muy usado por administradores de sistemas, ya que desde el shell scripting podemos tocar muchas cosas del sistema operativo.
* Si lo combinamos con expresiones regulares ya tenemos la *victorinox* completa.


#### Que es Unix?

* Hay un montón de sistemas operativos que son Unix-like, son los que cumplen con POSIX.
* Evoluciono desde Multics, googlear que es muy interesante.
* Otra característica es que es un sistema abierto.
* Antes solo había sistemas monolitocos, el proveedor daba todo. Maquina, OS, lenguaje y programas.
* El nombre Unix viene de Unic, y el nombre esta basado en Multics pero a diferencia de este es apuntado a una sola persona, a diferencia de Multics.
* Hicieron un cobro simbólico de un dólar y se lo cedieron a las universidades de EEUU. Esto por primera vez les daba acceso a código de sistema operativo a la comunidad, cambio el mundo.
* Cuando esta camada de estudiantes entro en el mundo laboral, cambio el paradigma. :D
* Cada empresa medio que armo su flavour de UNIX, IBM, SUN etc.

#### Llego Linux.
* Lo arranco Torvalds, cuando se dio cuenta que solo no iba a llegar a ningún lado lo abrió a sus amigos, luego al ver que tampoco iban a llegar a ningún puerto lo abrió al resto de las universidades del mundo.
* Tomo muchas cosas de GNU y se inspiro fuertemente en MINIX, un Unix con fines académicos.

La evolución de los lenguajes esta muy relacionada a esto.
Las ventanas fue un desarrollo del MIT sobre Unix.

#### Shells
* Hoy en dia el estándar es Bash, en el curso no vamos a ver cosas propias de bash todo los scripts van a funcionar también en sh y ksh. (bash > ksh > sh).


#### Caracteristicas de UNIX
* Multiproceso y multiusuario.
* Los recursos del sitema son administrados por el Kernel.
    * Memoria
    * Procesos
    * Concurrencia.
* Todos los procesos se comunican con el kernel mediante System Calls
* File System, es una estructura jerárquica agrupada por directorio.
* Todo en Unix son archivos, directorios, terminales, dispositivos de I/O.


#### Permisos
* Cuando creamos un archivo se crean con un conjunto de permisos por defecto, esto lo podemos modificar con el comando umask.
* Tambien tenemos chmod, que no lo dio en la diapositiva.
* chown cambiamos el dueño de un archivo.
* chgrp cambiamos el grupo del archivo.
* El super usuario en Unix es llamado Root.

#### terminales
* Son full duplex, los caracteres que se tipean se envían al sistema, el cual los pasa a terminal.
* Esto se llama eco, se puede desactivar por ejemplo para claves.

#### Shell Scripting
* Interfaz entre SO y el usuario.
* Interpreta comandos.
* Determina formas de ejecución.
* Expande caracteres comodines.
* Expande variables de ambiente. (cada shell tiene su propio ambiente)
* Lenguaje de scripting.

#### Ingreso al Shell
* En una terminal del sistema se autentica al usuario con su clave y en ese momento se le asigna una sesión al usuario.
* Un usuario puede tener 'n' sesiones abiertas en distintas terminales.
* Una vez que le sistema devuelve el control, aparece una linea de comandos el shell que el administrador del sistema le asigno al usuario.

#### comandos (mas comunes)
* Echo

  ```bash
  echo "hola Jorge"
  hola Jorge
  ```
* adduser
* cal
* sort
* batch
* nohup
* read
* cp
* mv
* rm
* man
* head
* tail
* tr
* ln
* pwd
* wc
* ps
* set
* talk
* touch
* ls
* grep
* sed
* kill
* mkdir
* more
* cat
* find
* tar
* type
* diff
* chown
* sleep
* who
