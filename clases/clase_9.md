La primer hora de clases, sandra explico el TP.

#### Expresiones regulares

* Son un potente mecanismo para realizar manipulaciones y/o búsquedas en cadenas de texto.
* Se define un espacio de búsqueda o patrón dentro del texto interpretando los caracteres en forma literal o especial. 
* A los caracteres especiales se los llaman metacaracteres porque forman parte del mismo alfabeto del lenguaje pero se interpretan como descriptores.
eg:

' es.\*es ' -> empieza con es y termina con es, 'espacio', 'e' y 's'  son tomados como literales.
asterisco y punto actúan como metacaracteres.

Una expresión regular es una forma de representar a los lenguajes regulares (finitos o infinitos) y se construye utilizando caracteres del alfabeto sobre el cual se define el lenguaje.<br>
Es un conjunto de caracteres que especifican un patrón.<br>
Toma su nombre de la notación utilizada por ***Stephen Cole Kleene*** en los 50s.Por lo tanto es mucho mas antiguo que UNIX.<br>

#### Motores
Las *Expresiones regulares* son interpretadas por un *Motor*<br>

Existen motores para el usuario final.
* grep.
* sed.
* awk.
* Y varios editores, vi, vim etc.<br>

En los parciales solo se nos permiten utilizar grep, sed y echo. <br>
No usar regex directamente en el shell, recordar que solo son validas en motores. Hay que proteger el shell.<br>
Hay lenguajes con motores ya integrados, que soportan regex.

##### Importante
Las ER no forman parte del shell, si vamos a utilizar comandos que reciben ERs como parámetro, debemos protegernos de las distintas expansiones que realiza el SHELL. (Con las comillas dobles)

#### Metacaracteres de expresiones regulares simples
* . (punto) Representa cualquier carácter.
##### De anclaje : <br>
* ^ Referencia al inicio de la linea.
* $: Referencia al fin de la linea<br>
##### De repeticion : <br>
* ?: El carácter anterior tenga como máximo una ocurrencia. (1 o ninguna)
* \*, El carácter anterior se podría repetir todas las veces que quiera. Incluyendo la ocurrencia nula.
* \\{x, y\\} Que el carácter anterior se repita entre **x** e **y** veces.
* + el carácter anterior tiene una o mas repeticiones. 
##### De conjuntos :
* [] inicio y fin de conjuntos.
* - rango dentro del conjunto.
* ^ negación del conjunto.

#### Engines
* Grep
* Sed
* Entro otros.

#### grep - > Global regular expresión.

Muestra por stdout el contenido de las lineas en las que se encuentre al menos una ocurrencia de la RE pasada por parámetro.<br>
es un típico comando filtro.
Leer el man para mas detalles, distintos flags que tiene etc. (Esta en la diapo de Adrian también)

Para mas detalles tendríamos que ver las diapositivas...