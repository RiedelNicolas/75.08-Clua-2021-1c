#### Seguimos con regex....

sed -> stream editor <br>
Ejecuta comandos sobre cada linea en la entrada o del archivo pasado como parámetro.
A diferencia de grep, sed edita!

Los comandos mas usados son : 
* a : Agregar.
* i : Insertar.
* d : Borrar.
* s : Sustituir.

El comportamiento por defecto de `sed` es recorrer todas las lineas de izquierda a derecha.
(Si no agregamos ningún comportamiento extra).

##### **Sustitución** : 

Es el famoso y clásico **find and replace**, en base a una regex lo sustituye por lo que ingresemos. El archivo original queda intacto, muestra lo cambiado por salida estándar. Por default solo reemplaza el primer elemento que coincida. <br>

Ejemplo de uso : 

```sh
sed s/busqueda/sustitucion/ lista_archivos
```
El carácter que sigue al comando s queda a criterio del usuario, pero debe ser el mismo que separe el patrón de búsqueda que al de sustitución.

ejemplo : 

'''
Tengo sed.
Tengo mucha, pero mucha sed.
'''
y le corremos : 

```sh
sed 's/m.*a//' archivo
```
El patrón se expande desde la primera "m" hasta la ultima "a", pero ojo por default solo se expande dentro de la misma linea. <br>
la primera linea sale igual. <br>
la segunda sale "Tengo sed." <br>

Se puede modificar el comportamiento por defecto 

* Para sustituir todas las ocurrencias del patrón : 
```sh
sed s/find/replace/g
```
***g*** es un modificador, y siempre va al final del comando. Entonces esto genera que reemplacemos todas las ocurrencias en la linea y no solo la primera.

* Para sustituir en algunas lineas hay 2 opciones : 
* Direccionamiento explicito por numero de linea 
```sh
sed 80s/a/B/
```
* Direccionamiento por patrón :
 sed /^Hola/soAoBo

 ###### Sustitución con referencia. 
 Se tiene un archivo de texto en el que aparecen las fechas con el siguiente formato : 
 **mm/dd/aaaa** y se desea cambiarle el formato al siguiente : **dd/mm/aaaa**.
 
 ```sh
 sed 's-\([0-1][0-9]\)/\([0-3][0-9]\)/\([0-9])\{4\}\)-\2/\1/\3-g'
 ```

 Contra barra y paréntesis sirven para agrupar, para eso se necesita la contrabarra.
 y luego en la sustitución, contrabarra seguido del numero es referencia al grupo.

Ejercicio, se tiene un numero de 3 dígitos, generar el capicua de cada uno :

* 123 -> 321
* 231 -> 23132

```sh
sed 's-\([0-9]\)\([0-9]\)\([0-9]\)-\1\2\3\2\1-g'
```

##### comando insert 

* El comportamiento por defecto es imprimir por salida std nuevas lineas
antes de una linea que contenga al menos una ocurrencia del patrón de búsqueda.
* sed '/patron/i\'
 Nueva_linea_1
 Nueva_linea_N lista_de_archivos <br>

Básicamente insertamos algo antes de encontrarnos con la coincidencia. 

##### Comando append

* El comportamiento del append es mostrar por salida estándar la linea del archivo original que tiene la ocurrencia y luego la linea que se le pasa por terminal.

(Muy similar al insert pero cambia el orden)


##### Comando delete

* Elimina las lineas que cumplen la condición, no esta en las diapositivas pero lo podemos llegar a usar.

##### Distintas opciones de sed : 
* **g** buscamos todas las ocurrencias, no nos quedamos solo en la primera.<br>
Dice Adrián que no es necesario saberlos ya que varia mucho en los distintos **SO** y las cosas que nos dan estas opciones se pueden implementar de otras formas.


##### Ejercicio:  
Desarrollar el script comparador.sh que reciba por parámetro un numero de 3 cifras y muestre por stdout el mensaje : 
* "es 500" Si el numero ingresado es 500.
* nada, si no hay numero ingresado.
(solo se puede usar grep y sed)

La solución seria : 

```sh
sed 's-\([0-9][0-9][0-9]\)-es \1-g'
```
si queremos que funcione solo para 500, (ejemplo que dio Adrián en clase)

```sh
sed 's/500/Es 500/'
```
ahora si queremos hacerlo con una variable recibida por parametro : 

numero=$1
echo $numero | sed 's/500/Es 500'

Podemos agregar la opción -n para no imprimir las que no tengan 500, agregando la opción p al final.