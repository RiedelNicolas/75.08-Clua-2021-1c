#### Memoria compartida (Diapo de memoria compartida)

* Es memoria que puede ser accedida simultáneamente por varios procesos.
* Unix tiene varios tipos de memoria compartida. Los mas conocidos son **System V** y **Posix**.
* Se usara una clase p_shm (Posix Shared Memory) o sv_shm (System V ..).

##### Nos da operaciones genéricas sobre memoria compartida.

##### Constructores
* `sv_shm("clave/")`
* `p_shm("clave/")`

Obtiene un area de memoria compartida asociada a la clave.(si no se pasa ninguna, la clave es "default/")

##### Mapear la dirección

* `void * map (size)` devuelve la dirección donde mapear la memoria compartida.

##### Liberar recursos
* `void del()` : libera la memoria compartida.

