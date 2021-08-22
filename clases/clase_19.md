#### Memoria compartida (Diapo de memoria compartida)Esta [aca](http://materias.fi.uba.ar/7508/Slides/10-SharedMem.pdf)

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

Se tiene el siguiente header de memoria compartida Posix :

```cpp
class p_shm {
    string clave;
    int shm;
public:
    p_shm(string cla="/default");
    void del();
    int getShm(){return shm;}
    void * map(int size=BUFSIZE);
    string getClave(){return clave;}
    friend ostream& operator <<(ostream& os, p_shm shm);
};
```

Y para System V : 

```cpp
class sv_shm{
    string clave;
    int shm;
    key_t ktclave;
public:
    sv_shm(string cla="/default");
    void del();
    int getShm(){return shm;}
    key_t getKtClave(){return ktclave;}
    void * map(int size=BUFSIZE); // size esta por compatibilidad con las posix. Se usa BUFSIZE
    string getClave(){return clave;}
    friend ostream& operator <<(ostream& os, p_shm shm);
};
```

##### Ejemplo de sistema  lector-informante  : 

* Un proceso lee un sensor y acumula su valor en un area compartida.
* Otro proceso toma el acumulado y lo reporta, volviendo a poner en cero el acumulador.

###### El area compartida 

```cpp
typedef struct {
    bool ultimo=false;  
    int val=0;
}dat;
```

##### Declaramos el semáforo : 

```cpp
    p_shm Area51("Area51"); //sv_shm Area51(“Area51”)
    void* ptr;
    dat* area;
    int len=sizeof(dat);
    ptr=Area51.map(len); //reservamos memoria.
    area=reinterpret_cast<dat *> (ptr); //ver documentacion, es estandar de cpp. 
    area->val=100;//escribo en memoria.
```

y luego si en otro proceso quiere leer simplemente tiene que hacer hacer :

```cpp
    sv_shm Area51("Area51");
    void* ptr;
    dat* area;
    int len=sizeof(dat);
    ptr=Area51.map(len);
    area=reinterpret_cast<dat *> (ptr); 
    std::cout<<"val es" : << area->val <<std::endl;
```

Ahora si pensamos un problema del tipo lector informante, podemos tener un problema de exclusión mutua.

![problema excl mutua](capturas/LectorInformante.png)

Esto lo tenemos que solucionar con Mutex.

![problema excl mutua](capturas/conMutex.png)

Esto es trivial, lo básico en concurrencia.

Vamos a utilizar las palabras claves MutexBegin and MutexEnd como para delimitar las zona clave de exclusión mutua.

Obvio que el problema solo esta en los writes, al hacer read no hay ningún problema de concurrencia.
Ahi aparecen los semaforos.


Da una breve idea de como solucionarlo con código común, pero dice que este cuatri no lo van a dictar a ese tema.

Vamos a usar [semaforos](http://materias.fi.uba.ar/7508/Slides/11EL-ExcMutua-Estructuras.pdf)

Vamos a usar dos primitivas principales, 
1. `mutex.wait()` para entrar en la sección critica.
2. `mutex.post()` para salir de la sección critica.

![semaforosPrimitivas](capturas/semaforosPrimitivas.png
)

y con esto podemos tener exclusión mutua sobre la clave que nos interese. (o asociar los semaforos a una clave para diferenciar las distintas zonas de exclusión).

