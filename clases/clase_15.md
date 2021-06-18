### Working Set
La clase anterior fue de memoria virtual parece.<br>
Los programas exhiben un comportamiento conocido como localidad de referencia.
En cada fase de su ejecución, el proceso referencia solo a un pequeño numero de paginas.(no precisamente continuas) A este conjunto se lo conoce como Working Set, el Working Set va cambiando a medida que progresa la ejecución.

### Pre paginado
Si un proceso pagina durante mas tempo que el que se ejecuta se dice que tiene ***thrashing***. (thrash = sacudir).<br>
Se pre-pagina(cargan en memoria) todas las ultimas paginas del ultimo working set del proceso.<br>
Se re-calcula el Working Set a intervalos.<br>
Ejemplo WSClock.

### Tablas de paginas Locales y Globales.

Algunos sistemas permiten el reemplazo de cualquier pagina. (paginado global)<br>
Otros solo permiten que un proceso pagine sobre si mismo, evitando efectos en la **performance** del resto.<br>
Esta estrategia es la que se usaria en un Sistema Operativo orientado a Objetos.

### Archivos de paginado
Una pagina no es una buena unidad de transferencia. 
Se usan entonces laminas (slab) de paginas en cada transferencia.
La ubicación de una pagina es entonces #slab+offset.
Las slabs se acomodan en el page data set (o partición de paginado)
Que se formatea y ubica por anticipado.
### Pagina de codigo
Las paginas de codigo son read-only.<br>
Se paginan directamente desde el archivo del programa ejecutable.<br>
El resto de las paginas tiene su "shadow" en disco.
### Otros tópicos
El paginado interactuá con la I/O.<br>
Se deben fijar las paginas donde hay transferencia desde memoria secundaria.<br>
Los archivos pueden accederse como memoria virtual... Esto se ve en la clase de archivos.

Ahora va a dar un ejercicio.
