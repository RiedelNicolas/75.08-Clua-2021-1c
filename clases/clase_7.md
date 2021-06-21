## Funciones del shell

### Modo de ejecución de comandos
* Foreground (.)
* Background (&)
* Asignación (`) o $().

**Foreground** es el default, correrlo en primer plano.<br>
**Background** es para correrlo en segundo plano, luego se puede traer el proceso a **Foreground** con el comando ***fg NUMERODEPROCESO***.<br>
**Asignacion** La salida std de un comando puede ser el termino derecho de una asignación. Ej: ***a=\`ls\`**.

### Redireccionamientos. 
Alta paja ponerme a copiar estos, están en el resumen de Bash deah.<br>
dato de color, se puede hacer agregación a un archivo con >>.

### Pipeline (|)
es un redireccionamiento espeial donde la salida de un comando se redirecciona como la entra std de otro.
### Caracteres comodines 
* ? es reemplazado por cualquier caracter.
* \* el Shell lo reemplaza por cualquier caracter en cualquier cantidad de concurrencias (Incluida la nula)
* [] Se define un conjunto, el shell lo reemplaza por cualquier caracter perteneciente al conjunto.
* ! Niega el conjunto.
### Protección del shell 
* (") Evitan la expansión de los caracteres comodines. eg: ***var= "existe_novedad?"
* (\\) Evita toda acción del Shell sobre el carácter inmediato. (Algo parecido a lo que hacemos en md) Por ejemplo si quiero que mi variable tenga un carácter que es considerado especial, antepongo la barra invertida y el shell lo trata como un carácter común.
* (') Evita toda acción del shell hasta la próxima '
* Agrupamiento, Tanto como "como  ' producen el efecto de agrupamiento de parámetros. Lo hacen ver todo como uno.

### Después dio cosas de sheel scripts que ya están en mi resumen GOD.