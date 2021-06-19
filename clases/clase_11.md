#### Threads.

##### Hilos de ejecución (Execution Threads).
* Se separa la ejecución del agrupamiento de recursos.
* Los procesos agrupan los recursos usados.
* Los Threads son hilos de ejecución que comparten el agrupamiento de recursos.
    * Puede implementarse por multiprogramacion o multiprocesamiento.

* Lo threads comparten procesos, entre ellos memoria. Un mismo proceso se puede ejecutar en distintos threads.
* Cada Thread mantiene su propia información del estado (control block etc).
* Entra una nueva estructura, el Thread Control Block (TCB)
 ![PCBvsTCB](capturas/PCBvsTCB.png).

Armar mas threads es mas pesado en terminos de memoria pero mas liviano en términos de tiempo de ejecucion.
 ##### Aplicaciones de Multithreading
 * Varias aplicaciones que concurren sobre los mismos datos como : 
* Un server que lanza un thread por cada pedido. 
* Un procesador det texto concurrente con su corrector y su armador de pagina.
* Interfaces gráficas.

##### Threads vs eventos.
* Algunos de los sistemas hechos con threads podrían hacerse con eventos.
* Hay una discusión a favor de threads y otras a favor de eventos.
* Lo que si es malo es mezclar ambas cosas.

##### Implementación de Threading
* A nivel de kernel :
    - El scheduler planifica threads.
    - Si el próximo esta en otro proceso hay un process context switch, si esta en el mismo, no lo hay. 
* A nivel de usuario :
    - La biblioteca de Threads permite al usuario multiplexar su time slice.
Para mas detalle de esto, ver las [diapos](https://campus.fi.uba.ar/pluginfile.php/271347/mod_resource/content/1/04-Threads.pdf) donde hace referencia a aun mas bibliografía. 

Al final de la clase dio como mas datos teóricos o de implementaciones de threads, si pica la curiosidad leer la diapo y ver las referencias que tiene.
