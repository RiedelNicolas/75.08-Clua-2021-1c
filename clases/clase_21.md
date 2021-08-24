#### La clase 21 lo mismo, se puso a hacer ejercicios. 

- Otra clase de ejercicios de Clua.

##### Se puso a hacer ejemplos clásicos de concurrencia.

1. Sistema Productor-Consumidor.
Un productor produce y lo pone en un area compartida.
Del otro lado un consumidor consume y lo come del area.
Hay distintas variantes donde : 
- El area compartida tiene n Items.
- Hay 2 consumidores, ambos deben consumir el mismo item antes de liberar el area.


Durante toda la clase fue dando ejemplos en código que están en esta [diapo](http://materias.fi.uba.ar/7508/Slides/11P-Problemas-clasicos.pdf).

2. Ejemplo de fumadores.
Un grupo de procesos están fumando, pero para fumar necesitan papeles, tabaco y fósforos.

El fumador hace un wait por cada recurso que va a usar, un wait para papel, un wait para tabaco y un wait para fosforos. Cuando tiene todos ahi fuma y se va. Muy simple

Del otro lado hay un agente que hace post de los recursos, como lo hace o en que orden es propio del problema.

