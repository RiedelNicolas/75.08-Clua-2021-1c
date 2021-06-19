#### Administración de memoria.

* [Link a la diapo](https://campus.fi.uba.ar/pluginfile.php/271355/mod_resource/content/1/06-MemMan.pdf)

##### Áreas de administración de memoria 
* La aplicación tiene la memoria del programa y un recolector de residuos.
* El Hardware tiene distintos tipos de memoria, normalmente RAM y cache.
* El sistema operativo tiene : traducción de direcciones y memoria virtual.

##### Administración de la memoria de una aplicación : 
Suministrar la memoria necesaria para el código de un programa y su estructura de datos.
* Asignación de memoria
* Reciclado del almacenamiento. <br>
Esta relacionado con el esquema de manejado de memoria soportado por el lenguaje.

##### Vocabulario de manejo de memoria en los lenguajes :
* **Declarar** una variable : establecer nomenclatura sin asignar memoria.
* **Definir** una variable : Asignarle memoria y posiblemente un valor inicial.
* **Ambiente** : Porción de código durante el cual una variable esta declarada.
* Vida : intervalo de la ejecución en el cual una variable tiene memoria asignada.
* Ámbito (scope) : Cuando una variable esta en su ambiente y en su tiempo de vida.

##### Tipos de variable según su manejo de memoria.

**Externa** <br>
Se encuentra definida pero no declarada en el bloque.
**Estatica** <br>
su vida se extiende a toda la duración del programa.
**Dinamica Automatica** <br>
La memoria se asigna y libera automáticamente cuando la ejecución ingresa en el ámbito de la variable.
**Dinamica Automatica** <br>
La ejecución del programa decide cual es la lógica para asignar memoria. Dentro de esta hay 2 tipos, tener un garbage colector o una liberación manual. Depende del lenguaje.

#### Storage organization

El compilador genera un esquema para el uso de memoria. 
* La memoria controlada se obtiene del heap.
* El stack mantiene un registro de activación o frame.

##### Los objetos y la administración de memoria. 

El modelo de objetos cambia los conceptos de alojamiento de memoria. Aparecen clases, variables de clase e instancia y ambientes de evaluacion no ligados al ambiente léxico. Cada lenguaje OO tiene un modelo propio de memoria.

##### La ejecución y la memoria : 
El modelo teórico es el de paralel ram. Adrian recomienda que si queremos entrar en este tema leamos por nuestra cuenta (Ver diapo)

##### Direccionamiento en hardware :
En el ciclo de instrucción hay mas de una referencia a memoria :  
* Estas son referencias a la memoria principal.
* La memoria cache no es administrada por el SO.
##### Modos de direccionamiento para codigo : 
El compilador genera las direcciones de las instrucciones: 
* Puede ser una dirección absoluta.
* Puede ser relativa al Program Counter.
* PUede generar las direcciones en cada instrucción como SECD.

#### Proteccion de memoria
El sistema operativo debe impedir a un proceso invadir la memoria de otro.
Una forma de hacerlo es por medio de un registro base y uno limite.<br>
El sistema operativo no tiene limitaciones para operar en modo *Kernel*.

#### segmentacion

Es una forma de proveer mas de un espacio de direcciones. EL programador (o compilador) es quien lo usa. <br>
La proteccion puede asociarse a segmentos<br>
Alguno sistemas (eg Intel) separan las tablas de segmentos en : 
* Global (Para el sistema operativo)
* Local (Para los procesos)

Esto permite que los procesos no compitan con el SO por memoria.

##### Administrando el espacio libre/ocupado.
* Pueden usarse bitmaps o listas encadenadas.
* Apareen distintos algoritmos de alojamiento : 
    * Best fit
    * Worst fit
    * First fit

##### Buddy System 
Usado en sistemas modernos que no tienen memoria virtual, la memoria se asigna en cantidades potencia de dos.

Permite una recuperación rápida de huecos grandes, sufre de fragemntacion interna, su implementacion es sencilla y rapiida.
##### Swapping
Consiste en pasar a memoria secundaria un proceso que no esta corriendo y que hace mucho que no es activado.(ej, uno que esta esperando interaccion humana)<br>
Debe tenerse en cuenta la interaccion con la I/O, se desplaza todo el proceso y se marca en el PCB. <br>
Al volver del swap, un proceso puede volver en una dirección distinta.

