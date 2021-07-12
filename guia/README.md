### Notas definitivas de expresiones regulares : 
##### Dejo un [link clave de sed](https://www.grymoire.com/Unix/Sed.html)
#### Metacaracteres utilizados : 
* "`.`", Es un comodín que representa cualquier carácter (Excepto un salto de linea).
* "`^`", Hace referencia al principio de linea.
* "`$`", Hace referencia al fin de linea.
##### De repetición 
* "`\?`", que el carácter anterior tenga 1 o ninguna ocurrencia.
* "`*`", Que el carácter anterior tenga cualquier numero de ocurrencias (Incluyendo la nula).
* "`\+`", Que el carácter anterior tenga una o mas repeticiones.
* "`\{x,y\}`", Que el carácter anterior tenga entre x e y ocurrencias.
* "`\{x\}`", Que el carácter anterior tenga exactamente x ocurrencias.
* "`\{x,\}`", Que el carácter anterior tenga x o mas ocurrencias.
##### De Conjuntos
* "`[ ]`", Delimitan el inicio y fin de conjuntos.
* "`-`", Rango dentro de conjuntos (por ejemplo `[0-9]`).
* "`^`", Negación de un conjunto.
##### Grupos y referencia
* "`\( \)`" Para agrupar conjuntos de caracteres y luego poder hacer referencia de los mismos.
* "`\n`" Hace referencia al conjunto numero n, n=0 es toda la linea, luego se van agrupando por orden.
* "`|`" Operador lógico de or, podemos utilizarlo dentro de conjuntos de caracteres.
* "`&`" Hace referencia al patrón matcheado.

#### grep

##### Distintos modos que esta bueno tener a mano : 
* `-i` ignora diferencia entre mayúsculas y minúsculas.
* `-v` Invierte el patrón de búsqueda.
* `-n` Agrega el numero de linea antes de cada impresión.
* `-c`Cuenta cuantas lineas coinciden con la regex (devuelve un entero).
* `-l` Muestra los nombres de los archivos donde hay un match.

El modo de uso es muy sencillo : <br>
`grep "regex" "listaDeArchivos"`

#### sed
**Sed** ejecuta lo que le especificamos a las distintas lineas de un archivo dado.<br>
Tiene distintos modos de uso :
* a : Agregar.
* i : Insertar.
* d : Borrar.
* s : Sustituir.

Donde cada uno se invoca de manera diferente.

##### **sustitución** 
Consiste en recorrer todas las lineas y mostrarlas por stdout a menos que se encuentre una ocurrencia para el patrón de búsqueda, en cuyo caso se muestra la linea cambiada. Por defecto solo se sustituye la primera ocurrencia en cada linea (Para sustituir todas debemos utilizar la opción g)<br>
ejemplo : 
```sh
sed s/busqueda/sustitucion/ lista_archivos
```
donde el carácter que sigue al comando s queda a definición de la conveniencia del usuario.

En el caso de querer reemplazar mas de una ocurrencia en la misma linea:
```sh
sed s/find/replace/g
```

##### **insert**
Inserta una nueva linea antes del patrón buscado.

El comportamiento por defecto es agregar una linea vaciá: 
```sh
sed '/patron/i\
```
Ahora si queremos agregar una linea en particular debemos : 
```sh
sed '/patrón/i \linea a insertar'
```
##### **append**
Appendea una linea después de un match del patrón. Se puede pensar como insert pero en lugar de hacerlo antes lo hace despues.

##### **delete**
Borra todas las lineas que cumplen con el patrón.<br>
Ejemplo de borrar todas las lineas que arranquen con "#"
```sh
sed '/^#/d'
```

##### flags

* g -> Hace el replace global para la linea.
* 1,2,3,4,5 -> Remplaza la n-esima ocurrencia en la linea.
* p -> printea las lineas modificadas, normalmente se utiliza en conjunto con `-n` para solo imprimir las lineas cambiadas.
* I -> Lo vuelve case insensitive.
* ! -> equivalente al -v de grep, invierte el patrón.
* 

##### Comandos
* -n -> no printing.
* -e -> multiples comandos (La e viene de expresión).
    ```sh
    sed -e 's/#.*//' -e 's/[ ^I]*$//' -e '/^$/ d' 
    ```
