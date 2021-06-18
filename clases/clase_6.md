### Procesos.

Las funciones principales del S.O son por un lado mediar entre el usuario del sistema de computación y su hardware, y por otro administrar administrar recursos del sistema. <br>
Una forma de administrar estos recursos es los distintos programas que tenemos en memoria como procesos del sistema operativo. <br>

### Como se implementaría la ejecución de un programa? 

### Que tiene un proceso entonces :
* la imagen del programa.
* La información de sus estados de ejecución.
    * Program Counter, registros, variables, etc.
    * Información necesaria para el sistema operativo(id, prioridad, etc).
### Multiprogramacion
La diferente entre CPU e I/O es del orden de 10^3 o 10^4.
Esto significa mucho tiempo ocioso para el cpu mientras se completa una operación de I/O, ahi aparece la multiprogramacion.
* Cuando hay mas de un procesador se conoce como multiprocesamiento.
* La CPU va conmutando entre distintos procesos, se puede pensar como un multiplexado de la CPU.

### Leer teoría de colas y demás para ampliar el fondo teórico.

El **scheduler** decide a que proceso dar el control.
el **dispatcher** realiza el cambio de estado.
### Estados de un proceso. 
Durante su ejecución un proceso pasa por distintos estados, se crea, corre, se bloquea, corre, se bloquea, corre, se destruye. 

### PCB
Es la estructura de datos con la que el Sistema Operativo administra los procesos. Contiene la información acerca del proceso y su estado.

### Dispatcher (Short Term Scheduler)
* Al pasar de Running a Blocked, el manejador de interrupciones lo invoca para cambiar de estado al proceso : 
    * Salva los datos en el PCB.
    * Cambia el PCB de cola.
    * Luego se decide a que proceso dar control (tarea del Scheduler).
* Al pasar de Ready a Running. 
    * EL Scheduler lo invoca cuando ya decidió a que proceso activar.
    * Carga el estado de la CPU con los datos del PCB.
    * Continua la ejecución del proceso.

### Scheduler (Long term)
* Decide a cual de los procesos en ready hay que darle el control.
* Tiene en cuenta las características del proceso.
#### Objetivos del Scheduler.
* Dar una participación adecuada del reparto de tiempo de CPU.
* Equilibrar el uso de recursos.
* Aplicar las políticas generales del sistema.
* El resto depende del tipo de Sistema.

### Llamados al scheduler ocurren cuando : 
1. Pasa de running a blocked/waiting.
2. Pasa de running a ready.
3. Pasa de blocked/waiting a ready.
4. Termina.


ACA CORTA EL TEMA Y LA CLASE QUE SIGUE METE BASH.
