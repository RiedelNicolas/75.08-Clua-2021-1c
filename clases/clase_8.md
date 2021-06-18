## Booting.

### Bootstrap loader
Carga en memoria un software que pueda lanzar un sistema operativo.

Después da las distintas implementaciones que hay.<br>
Luego los distintos procesos hasta cargar correctamente el sistema operativo. <br>
Las distintas Kernel Phase y etc.


### Creación de procesos por el usuario. (Ver lab de la pagina de la materia)
* (PCB) -> Process control block.
* El código del proceso(Llamado txt) no se debe cambiar mientras dure la ejecución del mismo(Runtime), esto se considera una mala practica. <br>
* Este código maneja datos, que tienen su lugar en memoria asignado también.
* Y también manejan un user area.(se puede pensar como un contexto).
#### En linux podemos crear procesos con : 
* Fork -> Nace igual que el padre, hasta con los mismos datos.
* Exec -> Carga una imagen desde un archivo.
(Sobre estos Adrián recomienda leer el manual y ver el laboratorio de la materia.)<br>
### Comunicación entre procesos.
* Tema de la materia 75-59 concurrencia.
 #### En orientación en Sistemas Distribuidos.
 * Técnicas de programación Concurrentes I & II.
 * Sistemas distribuidos
 * Se debe limpiar las estructuras de datos usadas por el proceso, mientras tanto el proceso esta en estado dos I & II.

 ### Terminación de procesos.
 * La terminación normal da paso a las rutinas registradas en atexit(3).
 * Si se termina por _exit(2) la terminación es inmediata.**zombie**.