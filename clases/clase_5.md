### Clase 5

 ### Seguimos con shell scripting

* Shell :
    * Interpreta comandos
    * Determina formas de ejecución.
    * expande caracteres comodines.
    * ex[ande variables de ambiente.
    * lenguaje de scripting.

* Ingreso al shell :
    * En una terminal el usuario se autentica con su clave y se le asigna una sesión.

    * El usuario puede tener n sesiones abiertas.
    * Una vez que el sistema devuelve el control, aparece una linea de comandos del shell que el administrador del sistema le asigno al usuario.

* Ver todos los usuarios.

* Agregar permisos de ejecución.
  * chmod +x -> le doy permiso de ejecución a todos los grupos.
  * chmod 775 -> le doy permisos solo al que ejecuto el comando y a su grupo.(equivale a chmod a+ rwx, -w)

* la ejecución se da siempre el path absoluto desde donde estoy parado. ./ es el directorio actual, por eso es necesario para ejecutar.

* Ejecucion background con proceso hijo.
  * Se hace con el caracter &, eg: script1.sh&.
  * comando "ps" * -> vemos que comandos se estan ejecutando.
  * si hacemos punto espacio al principio, ejecutamos en background pero sin proceso hijo.

  * Variables de ambiente, el shell maneja variables de ambiente.
  * No es necesario definir una variable simplemente comienza a existir cuando le asignamos un valor.
* Existen variables predefinidas :
  * SHELL -> Nombre del shell.
  * PWD  -> Directorio corriente.
  * PS1  -> Promp 1.
  * PATH -> Directorios donde buscar ejecutables


* Para personalizar el ambiente y evitar acciones repetitivas (no tener que redefinir variables todo el tiempo) existen los .profile y los .bash_profile -> que son archivos de personificación, que se ejecutan siempre que nos logeemos con un usuario.
  * Se encuentra en el %HOME del usuario y contiene el seteo de acciones a ejecutar por el shell al momento de conexion. -> Ojo, si rompemos esto puede ser que nunca mas volvamos a poder conectar con este usuario!

* Relación entre variable y ambiente :
  * RELEER TODA ESA DIAPO, ME COLGUE MIRANDO TIK TOKS.

  Basicamente es como tener distintos scopes, con export mandamos todo como al scope padre o algo asi.



--- Ahi termina la primera parte de scripting.
* Intentar hacer los primeros ejecicios. Adrian dice que seguramente no nos salgan.
